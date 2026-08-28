Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C560044A411
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787918462; cv=none; b=oga7M2UkpfFNDv58+vokLHCrisSKNCPPMVdrFx/N5wdqPOnAqK64VGad/irRvYjgEJqFujfcEEk7xhhuVJhr22BKseLPX66q6NlqrU/3U3gi7RAGhP45SKbY74yogvK3OQ5+/q8QATPdF5VgnEdJeNLC82m/D4aT7x7WcgbqhPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787918462; c=relaxed/simple;
	bh=cKKab5W5vtd0NB1Vz2fsLxusaPoBOE5Ov+slrgonhdY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rYfgUh9RYShXPnxLwx3dagF5LfyDcpY52dZ71uLoh0zFVfNA2q9Ltcb8Ya0LLNe/NDIoI8RQl05DwPGqubuHWhJy5WXjyY7+QvSS5UJe7BGL7/XGTzZlmNSfuCl2ArkUwTVTtg8/9upPYQg6c1pOsBFaYUnTshLkxX4IaKgfdFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kp23YizF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kp23YizF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A300F1F00A3A;
	Fri, 28 Aug 2026 12:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787918446;
	bh=nhyFDn9PEo2P8Bzd+kfnCU3zIUb6BEo+lMrrxRURVTc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=kp23YizF8QHDuhcMi/DAsg98Dj964i8o36nUbIzzQ1/3B0J3dpthoNKnH55VoAKlt
	 QeW6sI3j73T05prrLjrp2ocLu60DL2d78k/3dRdiiHtyPzvEsiRcvC1FKKXzZ3pSks
	 Yd8I+ZW+guXujNU5Jxa2QB3TXOvoDa9o3+TYo3zl+ImLuovz6MZwwkTW5s8sGgK7n2
	 Pam6xXOYicQDXE0X4YghixDTj8odlnKwUCX2TIcEpXeWRACCZCjPTRPoWFKCZS8aKj
	 bMuRLz0/E1PMuy+hewZx14IKbj7oovKI0lmfHO6MNktHIGETI2AfG9SXeue5/zwsXA
	 T8hEVumHOgLDw==
Message-ID: <b4711014-844e-45c0-b85a-4e3a98d7137c@kernel.org>
Date: Fri, 28 Aug 2026 20:00:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v3 09/12] f2fs: cache: use compress cache
To: Daeho Jeong <daeho43@gmail.com>
References: <20260825130126.2078627-1-chao@kernel.org>
 <20260825130126.2078627-10-chao@kernel.org>
 <CACOAw_w+QMkTNK=McScLHh1gpm6UFjxLSnVxhFMsgsuArLA=qQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_w+QMkTNK=McScLHh1gpm6UFjxLSnVxhFMsgsuArLA=qQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/27/26 04:04, Daeho Jeong wrote:
> On Tue, Aug 25, 2026 at 6:03 AM Chao Yu via Linux-f2fs-devel
>> +               f2fs_lock_cache(entry);
>>
>> -                       if (ino != folio_get_f2fs_data(folio)) {
>> -                               folio_unlock(folio);
>> -                               continue;
>> -                       }
>> -
>> -                       generic_error_remove_folio(mapping, folio);
>> -                       folio_unlock(folio);
>> +               if (!f2fs_is_compress_cache(entry)) {
> 
> How is this possible?
> or if (!entry->cache)?

I suffer a panic from f2fs_bug_on(sbi, !f2fs_is_compress_cache(entry)) here,
it may suffer race condition w/ shrinker.

Thanks,
