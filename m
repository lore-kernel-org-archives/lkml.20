Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39F137D100
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789613748; cv=none; b=B62xeo63qLPsrRkLgLAHIkEhm9x8Yc7fQYXT2Hsyxd6rpRABEJASORo6ffUb2xd6KRr13lH1/lFFzGfSsDRATiJKeMRX0QaM86MRLtiRNX1pXqb6lH9iWEZ0pUkwRABVB6xHGoI3oWn0zBBjzezp1ShwC4Pi/Gp+ZH0Or1LaoT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789613748; c=relaxed/simple;
	bh=rLVM2Kvs1rH28UD0zg/8TTMfcDIabnflS6Yr7be6jIQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nSBKKHhPbuhnCRKFxcs01T5tcwqjrKpwpH53Bn+CEgDi/DAVnZWluArjdSKORicCsFR0RadcrzOMVOhrxftGdp5coYMFBGM9jTkCJwaM2Tcsvm3FmEIzSXMgXOLdrPoj4S1ZsnzRhvwUjlDNgD/dU9Kle57MKlVcMnDuq2+ONyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i32Ppjv0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i32Ppjv0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28C91F000FF;
	Thu, 17 Sep 2026 02:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789613739;
	bh=a1urShVx1CTGS+0Mcr3CJ4cQ9a5WoVlHz6Ell7cT1tM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=i32Ppjv0vEOP5iZEgMf7IumbJhRen1Ut4SX/p/i33hZ4ipBThvqa8xPUpXgAakEHO
	 JuXuBMeDNKG/r4+aFL+32HQcicvx1qzLEvak3c2/pyFWJW0V3WXr5jANcJKCgLIvK+
	 4BGZ8pdSuuDHsr2sD2zCBrzjS1OY8ytgKBwLjXKhmuPryQ75PnFkWlHTd4uOvHCEUa
	 8HCJMkH9RG1JP8PC32J06mVnfF7hvuVuRl4A0gC13XHdmBstfwwv7HkxZ1tujumSw+
	 c8plW1cVtIywjUaMpOxfmdGXOU4pF2isYvwY5oNvgDNDfikZre3Skl8FROO0rPdKrC
	 9FMmS/rorrizg==
Message-ID: <94731ef5-4c1b-4aed-9a03-ab63a4fc8a7c@kernel.org>
Date: Thu, 17 Sep 2026 10:55:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v8 07/12] f2fs: cache: use node cache
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20260916015440.2232938-1-chao@kernel.org>
 <20260916015440.2232938-8-chao@kernel.org>
 <CAHJ8P3+0jVMFp3YTse8fbUTSp+jjW+2czxp0NuD__sHG_7UNXQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3+0jVMFp3YTse8fbUTSp+jjW+2czxp0NuD__sHG_7UNXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/16/26 17:15, Zhiguo Niu wrote:
>>  static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
>>                                 struct inode *inode, struct folio *folio,
>> -                               nid_t ino, enum page_type type, bool writeback)
>> +                               bool writeback)
> Hi Chao,
> seems this function just only handle DATA type now, so can we rename
> it xxx_data_xxx for easy reading?

Zhiguo,

I rename it to __submit_merged_data_write_cond() for readability.

Thanks,

