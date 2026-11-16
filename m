Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860273;
	b=uCdMzb1LCWiPX+IAyn0mdijhQCdsCwYr3ca0of0GO8qz1DMuGY9SI5dhynA0gekbRPFS
	 rtl+S5pWRL9V3yR0QRHiGRjkpFEUJ4Wh3a+mjaaesty7J9+wnXcai9dJ92Dft9G5zjJ6w
	 ySXSJQnM1eUNHN4ofApDhKQWPgvz4fL36BIE11NSzm2W2Had/yjomuvjGYwdJeLCG2LzR
	 QDvvWsYKPaMQDEyi5l4tRPircVrAL6mL1wB51vfnP/LM1c71ldKIODD9OV3o0TiGqm29X
	 Y7mkPflfujWSI8aLW7qV3I7DHHAeJF8MyB1v88KILuOaSj/TETQ0sZCySHkP9zgD/Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860273;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id;
	bh=KA1DiuFm9cFLOOwb5cT6/nPwPW+KUR82vQTkyGv9uNg=;
	b=1CWBIeXqk5kqEcGs4d3g8k7j7gB3htBsYMfYLrImVSfb1sgJaE4hoB/FwauxkafJYB/0
	 w/LRBt1SjLghJPNB63gM/H0ZLLwnIwW74PuLwPngM1Aez3TgIpQ5FoOtGwrt746N0OVCi
	 I4Af0hPJD/DcvGTPAdzUnoYyz7H5R06EQOywimSiO3IfmHNZ45r3CkyZ/Dj3C5t3mi/4a
	 vKNUcQ8IRoDtgP6lA8o4+UZ7L16qJ6SDAvuX3dJIGiYIhJ6L6+Ru1tdALE++1IgNYYBYH
	 a4ZK1r3AN3NIcrF37VmuuFrcD/+Xwyh0FPXKtAr/UYvvKyZTd/0bzvExi8FtAlCnlHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krisman.be;
	spf=pass smtp.mailfrom=krisman.be;
	dkim=pass header.d=krisman.be header.i=@krisman.be header.a=rsa-sha256 header.s=MBO0001 header.b="h/B9EEoZ";
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15389606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15389606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krisman.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krisman.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=krisman.be header.i=@krisman.be header.a=rsa-sha256 header.s=MBO0001 header.b=h/B9EEoZ
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jSzgV1bNczMlgs;
	Mon, 16 Nov 2026 21:17:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=krisman.be; s=MBO0001;
	t=1794860262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KA1DiuFm9cFLOOwb5cT6/nPwPW+KUR82vQTkyGv9uNg=;
	b=h/B9EEoZDO62fbuuaIdNx+TktwDc2CTr0cHXesXGMM1BCbPdUFIhsDg1z3G60HsU5bknwL
	LoyyVqOQZ8xVlww1e2QKpZBhr8dlz8NbL05sgwZjcxLiDkBtcYd+ZodPkRDEB4gJ/WCK+v
	RR0hviDWV34L9kpo3A3Bz9vON13jAuq2r2Is0CiU6VaxK/eSmW1kAb7KrudNBHeaD48Qoi
	tPCune9l23JkLJOycIXRxJBVQD1k79K1eH/XTqCX5e0J50TR9MWsGUfuJJn2NhntlSCX1m
	gP6HBFKxIZZ0Hv/IRmEy802TK4Ke/VIffo8jrqdx+B+cvNQ2E2f3QSsF59Ib9g==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of gabriel@krisman.be designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=gabriel@krisman.be
From: Gabriel Krisman Bertazi <gabriel@krisman.be>
To: Eric Biggers <ebiggers@kernel.org>, Zhan Xusheng
 <zhanxusheng1024@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 andrealmeid@igalia.com, qkrwngud825@gmail.com, zhanxusheng@xiaomi.com
Subject: Re: [RFC PATCH] f2fs: fold casefolded names of F2FS_NAME_LEN bytes
In-Reply-To: <20261116194845.GC229817@google.com>
References: <20261103030712.1514800-1-zhanxusheng1024@gmail.com>
 <20261116194845.GC229817@google.com>
Date: Mon, 16 Nov 2026 15:17:37 -0500
Message-ID: <874idgwmxq.fsf@cartola>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4jSzgV1bNczMlgs

Eric Biggers <ebiggers@kernel.org> writes:

> [ +Cc Gabriel, who maintains fs/unicode/ ]
>
> On Tue, Nov 03, 2026 at 11:07:12AM +0800, Zhan Xusheng wrote:
>> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
>> 
>> utf8_casefold() needs room for the terminating NUL, but
>> f2fs_init_casefolded_name() gives it only F2FS_NAME_LEN bytes, so a
>> name that folds to exactly 255 bytes is not folded. In a casefolded
>> directory, creating 'A' x 255 fails with EINVAL under utf8:strict.
>> Without strict, after creating 'A' x 255, stat of 'a' x 255 returns
>> ENOENT and creating it adds a second entry.
>> 
>> Fold into F2FS_NAME_LEN + 1 bytes. Existing entries for these names
>> are hashed by the name as given, so on a miss also try that hash.
>> 
>> Fixes: 43c780ba2624 ("f2fs: rework filename handling")
>> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
>> ---
>> RFC because new entries for these names get a different hash on disk.
>> Results in a VM, with dentries dropped before each stat:
>> 
>>                                  'A'x255  'a'x255  'C'x255  'c'x255
>>   current kernel creates 'A'        ok    ENOENT
>>   this patch creates 'C', 'c'       ok    ENOENT     ok       ok
>>                                     (one 'c' entry)
>>   back on the current kernel        ok    ENOENT   ENOENT   ENOENT
>>   strict, current kernel        create 'S' x 255: EINVAL
>>   strict, this patch            create ok, found in both cases
>> 
>> Each fsck.f2fs version matches only one side. 1.16 folds into PATH_MAX
>> and rewrote 'A' to the folded hash, after which the current kernel
>> cannot find it. The dev branch rewrote 'C' to the raw hash, after
>> which this patch finds it only as 'C'. fsck would need to accept both
>> hashes for these names. Encrypted directories are not tested.
>> 
>> Is the second lookup acceptable? The alternative is to keep hashing
>> these names as given, which fixes the EINVAL but leaves them
>> case-sensitive.
>
> Sorry about this bug!
>
> I think it's actually worse than you say, and this commit doesn't fix it
> entirely.  A filename can "casefold" (really NFD canonical decomposition
> + Default_Ignorable_Code_Point stripping + full casefolding) to much
> more than F2FS_NAME_LEN bytes.  The decomposition stage in particular
> can result in significant expansion, up to 3 * F2FS_NAME_LEN.

This was a known limitation, the actual limit for casefolded names is
much less than 255, it is actually the size of the folded version of the
string.  I still suspect this limit is hardly a real problem in
practice.  The bug is the inconsistency in creating a casefolded dentry
and then failing to hash the same dentry. That's a bug in the
implementation.

> For ASCII though it is indeed as you say: they cannot expand, and only
> max-length filenames are affected due to the off-by-one caused by
> utf8_casefold() unexpectedly including a NUL terminator.
>
> I think this shows that the 'casefold' feature` isn't really used for
> anything other than ASCII in practice, and all the complexity of Unicode
> normalization wasn't needed in the first place...

I wish. We can debate whether it is a "good" usecase or not all day, but
from prior bug reports it is clear people are using casefolding way
beyond ASCII or even accented characters.  For an extreme example, see
the variant selectors mess from when we tried to change the casefolding
of ignorable code-points a couple years ago.  Clearly there were
mistakes in supporting the entire unicode map, but ASCII if far from
enough for anyone who speaks !english.

> But I suppose this should be fixed anyway.  The approach of this patch
> should generally be okay if you increase the buffer to the required
> '3 * F2FS_NAME_LEN + 1'.
>
> However, please check the Sashiko comments
> https://sashiko.dev/#/patchset/20261103030712.1514800-1-zhanxusheng1024%40gmail.com
> as some issues were found with the implementation.
>
> - Eric

-- 
Gabriel Krisman Bertazi
