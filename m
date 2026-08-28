Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5573242DF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882356; cv=none; b=Td+Pz5+U3s2GMBp3y/EfdJcZjU2iNA2Uha3CE3Rvhqs5qwhwKY63bHkoMwCR2WSUlfQaX5BgXAeL3TbVyPaRHoJL0dWVUo/P5pwOdk9yPgSRaDuVhZdHRDevDdkU4c6esJ+VrVb9JTFk8BSSa9pjrp63PLTopzfRp5w/wRH4MEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882356; c=relaxed/simple;
	bh=5NeEszLr49b4GqN8pj7Ot/xWkPhC+AG+ClqkuLR3UKs=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VsP53UEIFJU2oZwHC5IymqTofrKKokeifa6Ax5FOcDVCDGgNN/RdDP7woVmstj/Jxby+4Qz36yehB0vrHWIfqrhxrEx9agxN6G9FN8lzdcJ+ubg/ESFIxrmS1AV933mRvIcPPKoM8XzhsVVEuOiKCuD1r0BD+9L7DdjKTGci2Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXOqrXGd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXOqrXGd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998911F000E9;
	Fri, 28 Aug 2026 01:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787882355;
	bh=lSNX3H2jSZGk9ydw0qd7Md10eKuFR63Mv6/1+OfuhLQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=bXOqrXGdenZWSLq1CWh2reV2nnglAEqXqQ93LjbMKIb5yTUg20OSzWPqkx0FbB5/z
	 cocwZTE4a1GkAse6TnXIuGCqH7zJp97j4AUcdmZR5+Kp/ejbzWTlQZ7H2bCc9EMBQe
	 UxeVQ+zxquO32RoEPdTSgdrpUqgaMsoFgIeID9DtjIoh0283SyZvJSi0vkUv1MXCd3
	 ICsZcz5rIKpVuygwmP9GiBHyaiPS9jlFVOjz1QmwbU2YY74FaZZYWzaN8t6JQrugIM
	 0Jk4gE0KtcMQko9osxcBlVJuVFJqtlFciDtkr7QWQxgdN5ZfRwlWb+CjbBmScD5QOh
	 Bkm8uWZQaEw6A==
Message-ID: <dfd68bb4-6f3c-46bd-9b6c-11fd17da6bc3@kernel.org>
Date: Fri, 28 Aug 2026 09:59:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v3 03/12] f2fs: cache: introduce shrinker
To: Daeho Jeong <daeho43@gmail.com>
References: <20260825130126.2078627-1-chao@kernel.org>
 <20260825130126.2078627-4-chao@kernel.org>
 <CACOAw_whg1SO2479NL7d=ScRVrqvwHbPWg1pB2T4nWHdGe+w7g@mail.gmail.com>
 <4880a9a6-4036-4fec-8507-552f1bfc9fbb@kernel.org>
 <CACOAw_zTh8FSqcaQNYcPib+vjoMMi4imS5TTzJBOgxtZN90aBA@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_zTh8FSqcaQNYcPib+vjoMMi4imS5TTzJBOgxtZN90aBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/28/26 01:00, Daeho Jeong wrote:
>>>> +       /* Phase 1: Isolate candidate entries from LRU list into dispose_list */
>>>> +       spin_lock(&cache->list_lock);
>>>> +       list_for_each_entry_safe(entry, next, &cache->lru_list, list) {
>>>> +               if (isolated++ >= nr_to_scan)
>>>
>>> scanned?
>>
>> Okay, will clean.
Will change like this:

		if (scanned >= cache->num_entries)
			break;
		if (scanned++ >= nr_to_scan)
			break;
