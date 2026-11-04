Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781731;
	b=UqiHA3n20aE/o+3MiGlAoU3h08NXMdgd7WJTK3JU8cCociIofVGMbMytz/hQl4RiC60h
	 7/1d3jwxR6MdcP/jl3/RBVUKihNK/ai5CO6+2W7/I3np6j9mpLsmXddIOtPkmRoW8CafU
	 81qBNXh8YJPdFSzfWR32q+N52dGyvpAP1/xk86JyoB+3EQkpn7pN9To1kSpnWIV3zu0dB
	 jzHubEy2Z+x90/h/qFJOvj1WrJhFDeoAsJHoeUsKotX8QNUQb6yf0VL1O8pbMhoqqf3Vq
	 bAKXApzlL+V6g7vzuOkuXupWN4IsFC3xYqkDpZmcrjbW12HT/pO8vb0QJFXKAnrR92w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781731;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=2tz///C2gLrezRDUfeXviZzznEJy8Ej2BLjvXB/fTks=;
	b=JCmU+jpo0p1Zv+6eSfj/4OSrMk2O73aAfW2T910iOrqDuzTvxe/otci6g1iS0dzF/Jsk
	 alKgqN0oTGNn8z17oUT7Uf2mn6Db1TP4tN9nZdMeK+6HJilPKCDUB/yPOpcpB0GHciKaw
	 YnaqPLuewVrGrkCR1Sf0juCB2xMiDY+Z7gXiHxqITFeOHIsyQ7OE+b9Peeh11Vt9Ad7Yl
	 fQXcqo0RSAxBq8GVHdr9UBJMDiB03UDc5bTZNITvb9NnQwDOH9g6KsrEkqgUyk7HA2XTc
	 w5xxpUfbfrswY8nBKUM92wt5xw0jH7D464UwXLy+kdJpQiV+YkS4qQlT5BoSxc3x1OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=JVqUcTm3;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B4606A326;
	Wed,  4 Nov 2026 08:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E71B4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=JVqUcTm3
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A09C1415BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793781730; bh=2tz///C2gLrezRDUfeXviZzznEJy8Ej2BLjvXB/fTks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JVqUcTm32kCikjn0HjOVyu29BnS5QRTxHmUbiftq/kgO4VLeYlVXLQ1IPZx1v2A4m
	 L0iObdXPiAsYc79GZAD7WkeGtS+N/EKSuWXrwiNI2PUG4sVNHWKMIQEQHVA0n3Lt67
	 oMSjozm0wtfvyx8PC2TW2v+gpNLq2WHdLP3qeKB2Nq4t6fySSKe4/4BwB1Eh2ZBT99
	 Y4JlUYvsG4mS49H9jn8cimRG2wG6eSs7zCiGNaDAb8Oxz97OAQL2DSTAY06wrNB2no
	 iuMm+83AWNUPainrlWXUSpx4nFYUIuwVkf87gprweETRI9k1WRhQoW+YWoE4oKy/4H
	 zY6XtcYg5lSIw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A09C1415BF;
	Wed,  4 Nov 2026 08:42:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Weijie Yuan <wy@wyuan.org>
Cc: Weijie Yuan <kernel@wyuan.org>, Dongliang Mu <dzm91@hust.edu.cn>, Alex
 Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: How to attempt to gradually eliminate the compilation output?
In-Reply-To: <aurpUltnbwWw3eyx@wyuan.org>
References: <aurU4uKyIUBl9-CJ@wyuan.org> <87y0b99i6p.fsf@trenco.lwn.net>
 <aurpUltnbwWw3eyx@wyuan.org>
Date: Wed, 04 Nov 2026 01:42:06 -0700
Message-ID: <87tslx9ee9.fsf@trenco.lwn.net>
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

Weijie Yuan <wy@wyuan.org> writes:

> Jonathan Corbet <corbet@lwn.net> writes:
>
>> Weijie Yuan <kernel@wyuan.org> writes:
>> 
>> > Recently I've sent several patches to fix warnings.  But since I am not
>> > familiar with the actual codes of theirs, I'm not confident enough to
>> > touch some parts, but only the most obvious ones.
>> >
>> > Since this is a goal that Jon has spent years for, I'm wondering if it's
>> > possible to periodically send out some email notifications, which will
>> > use the file paths from the compiled output to find the recipients and
>> > kindly ask them to to deal with these annoying outputs? Perhaps we could
>> > use a script to do this.?
>> 
>> I think that nagging others to fix warnings is not going to make anybody
>> happy.
>
> That's sure and that wasn't what I intended. 
>
> I'd be happy to do the work, but putting myself in their shoes, I worry
> they might think, "Someone from nowhere, who isn't familiar with our
> development process/workflow, is sending patches and just adding noise.
> It would be quicker and easier if they simply pointed out the problems
> and let us fix them ourselves."
>
> For example, last week I was about to send a small patch when,
> fortunately, I searched lore one more time and found that an equivalent
> patch had already been posted to their list, but hadn't been merged yet.
>
> These warnings span many subsystems, and I worry that sending patches
> before I understand their respective workflows might come across as a
> bit impolite: "We already have this fix in our development tree; you
> should have checked first."

Well-intentioned patches are rarely seen as impolite.

It's always worth looking at linux-next before trying to fix something;
if there is a fix in their tree, it should really be there as well.

>> Beyond that, it is far better to send a patch than a request for
>> somebody else to make one.  If nothing else, an incorrect patch is
>> usually the best way to get somebody else to create a correct one :)
>
> Ah yes, true. ;-) So please bear with my poor patches then, low-quality
> patch is unintentional but inevitable. ;)

Thanks for working to make our documentation better!

jon
