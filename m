Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A831D63E4
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788597213; cv=none; b=TpD7X9iaSYbbnU2614nP2Crt4IHICOuBbWCtLDQTHPXtUDV0wvppQokXdzW4Noh8dP59cDeZpOd3Rdm0QfCeFQispQ42HSwX4XoLyJH6Ci7w7F8zRgmPel/BFDuWnvO2eBGuCUB7Y/BNwx3wutKbphVtB9ibEokZSApt0D+4IQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788597213; c=relaxed/simple;
	bh=STucfeqAzDbnQyz8bcZHitmXTwvCmxN5/KZ9q/WAUrs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=daxONCTsrpFexyf3mXsTZLJ3JDDU5/GwbOVTl5gHUcW/mvDixVGzkNZTlI5uxx3aBi3lRCFIpe5Ek/IPqFebd9FnASpki9dbgTo+VzXJI3s4SWCEySv+KD2A5mXb3o6oVXS1/nobI4m4nrCkE64J8vMAsoSwUbQrimTPX29B66s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=XiReQxJf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dJuDjmHJ; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="XiReQxJf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dJuDjmHJ"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 3177D1D00110;
	Sat,  5 Sep 2026 04:33:30 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 05 Sep 2026 04:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788597209;
	 x=1788683609; bh=bjpxt6wC/Xqqhz10TpneDwIthvnLaZnI4SDqGOP6+ZA=; b=
	XiReQxJf3fKHMVMCFra5ekrLe3In7ybcXSbNVe1BbPL7i5jju30KU8rv2hRyPZ2B
	YUC28h2LYhMZlU3w80UCHefPFEzK5ppUhSkhO7wdXDyQYTGzh+B3OF72UUpeR4YU
	pfJW+U8a/nU1ES0WyGIH4SG9X1m87uckCZlNhKpYUjuAFlAVc3oqV3ZFYuuqkthF
	OaoVQRCyw2jg67qCrBKfRsBSSJ0LOetjunMl75ngJtSBcTC5cIlPBR0miF2EHNxD
	bnMNQOTy+Z44gV7l9l6Tit/4OjSPbHAXMwT+5lZuKqyi2422RX5Y17GzUnr89/CE
	VQTrTjl94LhTxnCq7I9bgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788597209; x=
	1788683609; bh=bjpxt6wC/Xqqhz10TpneDwIthvnLaZnI4SDqGOP6+ZA=; b=d
	JuDjmHJQhIvtJhQP/7cSnXvxpfBzCOpsF31Q0X2TFHl1laVjMwNvFT/SnAFb9pJv
	92IjFXyrGsA3hDTPE+SmZpDixx8FnWkFryKSH0x92rA4jaQqpj5X5PYHDVL1z2Rj
	A+u0XtaTpyupWqBVhRrGULIPB9exeAf1KQBArIgHZ2zENogwm704cEaoJGTUuWXK
	PWYfQnTx9NyeibRHI46BHXpIr6tZdycRoq76QF2xfRiy9DLw1FBzQykoViv5gmH5
	jQtto9rk9Cd3tSNgERxGHwY3et4Uwy216CMaW9bPwxULQcRYwysDYCw9KBwI6ej/
	mE+o3IWXE4iN4M44H2QUA==
X-ME-Sender: <xms:1tObar_sKX-LHkTYCBnV3To_SIb_zCw91et8bHDemH92UGO0vMmm6g>
    <xme:1tObaig7MI3frM1W9mt5Ay1Hyihuzwkq97CKVoWswYgKWnEscmBJuSAkqUkkul1ol
    9Pa0xjK0G_5-7ok8gw4yB_ho9HTlvt3-TYb4XuUlVJhns_xW9fP7of->
X-ME-Proxy-Cause: dmFkZTF7vvIsIfkh8YrQepq3MAeq8OLybosXLfrXuMIxHNKGBQNOOI1uJTUnFAYx+ypv1K
    cOTncklBM80ffcbSwmfekHFIWthX5KxkkpN6XzGP4xL7grJlCj+0H0VbzvxawMTWv4Ryik
    kfA+9vaWM499hmXFrVvAbCrpEvE8XZnT++oI2ylUcd5Lqn0wbFlXVdoaOwJPfn/ZiJ6Hyt
    U/y5vgPsjwMqoQKZonUgCkaoCvomqLZSeS8bfm6ieT0U3xMklR9XEZE8GHirQOuPRiVbnM
    eBxRCF6S5twVgrQtpJS+wWUpoRhWPUl2yBORnSYpHqkkqV/TUlvLzO7nKIqhHtSXcAFhrq
    k6d/fHa6HY6HVp8t6zyhJqU8q+yiAemjho866becBUUE36FqXB2d2zhM55BOupyUIz4ZfG
    jdeI7FYGwJkqZWy8EOPh0nAEvvI8rBJARR793eK4+gCvh1uyPMpzbATOwOcbe/ylaVn/bm
    OThQNWMQzxYwXIit5HiylJJZUGFShilwiJVidWJKqg+xGrQNpFQ094GjuE+SJBrZM7eiAU
    392iCWOrQ+6LUDQFDP5yWk2aZJ9n2lzeFSYIbGns3vY9Hc2BgyHxX03X5nE1GSojPjLNRd
    qSn11h4bXILso8SwmGuBrvJslQ+RKyCLJ+CHA4X6m6r3VDjak7gOdrsWi8eQ
X-ME-Proxy: <xmx:19ObagG7kzvG5o70cAy_KQOK78VQLlodfs-5bI022Y8GFZxbHVdp5Q>
    <xmx:19ObakzTa6lD0Z_KF1p0txglWoq64HJGP2eI0L5b_1MaZKNdF3rjDw>
    <xmx:19ObatpSujzv1G_oog5AyeTTQA90mGi3O0XZvI9_w-8AUT1-jQkztg>
    <xmx:19ObamgJ6skZi7bWTYsVjxp6sMHWcfTmx9ukP_FfMKRdrDTsKm8sTg>
    <xmx:2dObaj4_OMhQ9rVTWFHxM5hGRXzJozJ-03syHECtAQBbLhQvYvU7HawL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 141CC32A0078; Sat,  5 Sep 2026 04:33:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AFUWYdGrjtbg
Date: Sat, 05 Sep 2026 10:33:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <a9e4e94a-9325-45de-a8c9-64c9ab8b1eea@app.fastmail.com>
In-Reply-To: <20260905052216.11986-1-kmehltretter@gmail.com>
References: <20260905052216.11986-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] ARM: configs: Update axm55xx FS-Cache options
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Sep 5, 2026, at 07:22, Karl Mehltretter wrote:
> CONFIG_FSCACHE_HISTOGRAM, CONFIG_CACHEFILES_HISTOGRAM and
> CONFIG_FSCACHE_OBJECT_LIST were removed in v5.15, and
> CONFIG_FSCACHE_DEBUG was renamed to CONFIG_NETFS_DEBUG in v6.11, so
> none of these lines has any effect any more.
>
> Drop the removed options and select NETFS_DEBUG in place of
> FSCACHE_DEBUG, keeping the debugging support this defconfig has always
> asked for rather than silently losing it.
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  arch/arm/configs/axm55xx_defconfig | 5 +----

I'm going to post a patch to remove all of axm55xx soon, so
I think we can skip this one, otherwise it obviously looks
correct.

     Arnd
