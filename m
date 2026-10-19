Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445013;
	b=DMIoMnvj5aC9sYFit9jHt3pZdNB21t/SsnwWE2t+o1vzg/Tmj5YrRG4KUhKJV8z0R/8+
	 wH6l//DG0BgB8k82i4PDiuPehsFKQExdJbK3H+YV7C+nR1pVhWHpvlbk1ZUm2BcyTcDX7
	 F/tcKtRmXyodtBfMOBNzRjq+2VOjhHQTEicivJx+FxvK/3AJ8rTs1UO3eSZzP1fXjCbFF
	 W5VWC6qFJRjPFB29Sgi/Nv6TvIh8qSoAON9JWnztQQxCxlW2vYEY/HuzmWKdYnPB3dK/k
	 1AeJbTLqFBYkLNLgHOg/W0og/0D1cGapalHUej1Vsc6UO4EsWOgbjZsVGb7MA3oxb5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445013;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=UPiV+n6t4HDeUGe+Nyw22kzTq6436r2yg1Bnqsba1Bg=;
	b=vB4JPGFSqFV4LWY3Cuf+AMbnkjjOIjnciQfLl29lmHeG8g/bjgdiAF+RRMWiBG2IcZQf
	 U7pq1008+tgwp6IaDOjqMjuCy62lpQosyMEqj+VyrlIuGbCkb0DG66bzUENSGH7y0EtYV
	 JKdwa03HbyHj7ojImjqRcsjwsoItit44VPnPJ3uQvHNpxmww4Guf32D4Bq84UzdjmjXJo
	 nrj+jTUPQzT1Gtfo+sxY37bCaj92MVSjWJXOloYPTduv9S2ilG6rWg96TMquIaUizs36W
	 nt/5Ztx/3Afn6nao+tzZFSMs1+Ny2Px62DTARBVc4Xw7fk4ikUvx4YqcjKVml3/DMEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=eh1SEkvj;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=whFjoTYE;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148EE606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 148EE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=eh1SEkvj;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=whFjoTYE
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0035014000EA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:23:31 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 19 Oct 2026 17:23:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792445010;
	 x=1792531410; bh=UPiV+n6t4HDeUGe+Nyw22kzTq6436r2yg1Bnqsba1Bg=; b=
	eh1SEkvjr3rcwz8cPniI5CEBdSsaLqprlVrHfYPJGNZRDhjPXZpaPcw/Etytux6N
	uBlRmNA3l2iq0FvCwBhvqGtvq4ZYVmpGL/coHH3qCOLy0DieDVpeo7Lj+mHqTbBw
	xOBOuZm1S1BVG2VV0VbuIGxt2rlaGLETZZngYRbubHba7tdvEev3EjqKNGYC4ifw
	+bKjx/H1rTFow9QqRnLPPs5CleSY+tH0wRwySadEbRCldxibLJY2zi5XmlofHqiO
	FSNstMgdAIMKxu7PVdkrQiF8o475d8Uch25OmVevMoE6Ywl4ux9F70OPRxVrnnaT
	zenq60fiwYDBxEs5+EskTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792445010; x=
	1792531410; bh=UPiV+n6t4HDeUGe+Nyw22kzTq6436r2yg1Bnqsba1Bg=; b=w
	hFjoTYEht36LpjDqHUXqdsAJ6YItVwH6SRnxgXqVk8634n9uArYYBFV+si6Q/GsU
	5LoKW66vyLEil8xVvNTJuiuXNLnS4awt3EY2ubPALJgEFbwfPtppVx8NlTOlaIRp
	io373Z27ivtSklyGprDimxdDkvGqkemoYyvE5a201s32/9Sy3E4lRJ6hA0l0ibuJ
	bgDgRBNFXFfZbHmJRx4e1mrg7+vDRKyiuDV54/Jtc1bMmdFhU+4ff85AnOe3WUZa
	0LAdwbpepyw6gxcM+Aq2iG1mPWX/M4BHuuTs+xKvb9BC9WL7HRk5FQ0TsMlkSxIw
	+zyBGSny+Sf9Kkj4CoelQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792445010; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:An0xscobxPtuKmSXHr37G0bYCLDtenWhOCoItMwyuZf367E
	xdsW4P/u0sTcW4pa4VJYgrf2/Imbx+jT4H5p0hks07zonYbpmGEwfTWtoF46zCcZ
	9RkmbnAft/tQnkShUhYoaC9QOVkg9jryvCKCTUPRtZc0P4IYPgneQSNWaiezIc3N
	rrAy7jROvcw6nwJa6NT4iT5c/EirTScLSoqhJLFaS8+ZPDHWUY51j3FAJ7Y+Z9zY
	x+obTMA7n4kAlkeBaQUaRY6SVOAArIHBV4jo6EXbj660yDyhueuG2Fqu9Kjbz64F
	U/iim2SwSq2LDHoZGpIwx6csRjBvEpql7B1DsAw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:WDwNhLmx2mY7HJlpaMfswj9qHhQMBa10IwljqbPWnWs=:oBgFaEHsWr9+HlBcQPTbZZgC+V0daXTyL2ab9eRRnms=;
X-ME-Sender: <xms:T4rWatQ0bFamwd4vhvpOY8_EOGwGkoWArSeKBtQ4iR_6kh6T51GT-Q>
    <xme:T4rWahnKh2pj4Xmi72Q7REouFAzesDI-ihTqAapCWUFfgyXSBYdbKGwzhCX6PeqvG
    jwFD-MOtoD2JqrScCebk2CbDPB8Oy_duY-YCqc0534higDcTA7mXYQ>
X-ME-Proxy-Cause: dmFkZTGFfpiaFT8Ar5ctZP8pnG8tRg7Q3sYKc9fqalbEW9VQHrsxphPI+NlKv3TVf9A/iO
    mf42Kl19s9WGjtjN8FhlYapKBz0Pce+l+l5blcotLYn9C4PpTF7Kc8oMALAHETrLwd/5Os
    2SkX8o9dlrCRd2/5cuyOYCeiTtFa6jDhefS96WVLEelUOF8D0yn1vvGtNHFRvWtZogGByr
    V6JQRMGz8YeJ3UwvdvpKKpyZMmRey4UuzvIxQBNdXMCCpmQFoiG7GTHiad8QVRzTsv2kHy
    WLJRWN6ulTfmK8oPwfjngo1ZYCXi8YjkoXMX2yFQxSteJrTtTCOPi+pMB9kRHTkVIo+hpe
    Y4aKIu1KQqOPIJ5Blgrta4g1rcIhAUE36hi6ZpdODQWvU8l8HTlg6EQH/iBnb1tMgKBhsr
    ND8pyPMlR7AtCSfWoIMKbpv0YPUGOKjgAvpRz8np5iOWD5KndkzrEsdW59r7ytlyZ2nhYJ
    QQA1x4qMt9m1GOLM+ufHy5vongbgKfEtURhtmCja71E8i5tyxuQ0PHQZk6WxwInE3zgNeJ
    ytM/A1IJEHAwOZg4xnqIhxOHMkjsm/59xtbwtsw2w4BBtMu7RZg7rcSoA/qFiYK/y1PbsY
    BvrQC3TLCzvu4Rhpu0BFRTz0bcJaIZm4bKexrfp16oiC4/AmHX4E66i0DvOA
X-ME-Proxy: <xmx:UIrWaj5_ZtGoD-f2DASx1fp_rHe8cVITDYb8h3Ub9t6aJTYRBiAMOg>
    <xmx:UIrWamvvPSm6ee1XRGluloROxrB80GbBqjqv_RM-OLUaRTuKzlqlBQ>
    <xmx:UIrWak5IXmJ57gtAsjvwip7wWyyRmzgYZ3pU_lu1KuW8WenDkFe7Tg>
    <xmx:UIrWahUrmTHiIoZNIvDC7TA70K65uuacluzBbKSueGd9-vI99SnGKQ>
    <xmx:UorWaqXDfFld9fseQs9nH_p_c05t813qRrHbjI-FB4EwyoyUosuLNVK1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9E67532A0093; Mon, 19 Oct 2026 17:23:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A0r3NTwFBk5k
Date: Mon, 19 Oct 2026 23:20:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 linux-kernel@vger.kernel.org
Message-Id: <f13fd39f-1ba4-438e-a1f7-fe4184adbc26@app.fastmail.com>
In-Reply-To: <20261019165015.2656521-1-dinguyen@kernel.org>
References: <20261019165015.2656521-1-dinguyen@kernel.org>
Subject: Re: [PATCH 1/2] nios2: remove libgcc for lshrdi3, ashldi3, ashrdi3, muldi3,
 and ucmpdi2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 19, 2026, at 18:50, Dinh Nguyen wrote:
> Use the kernel's runtime support for lshrdi3, ashldi3, ashrdi3, muldi3,
> and ucmpdi2.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>

You still link against libgcc in addition to the in-kernel
copies of these functions. While this may work correctly depending
on the link order, what I had suggested here is to remove libgcc
entirely here:

diff --git a/arch/nios2/Makefile b/arch/nios2/Makefile
index f1ff4ce0f1a2..173588c31abf 100644
--- a/arch/nios2/Makefile
+++ b/arch/nios2/Makefile
@@ -19,8 +19,6 @@ UTS_SYSNAME = Linux
 
 export MMU
 
-LIBGCC         := $(shell $(CC) $(KBUILD_CFLAGS) $(KCFLAGS) -print-libgcc-file-name)
-
 KBUILD_AFLAGS += -march=r$(CONFIG_NIOS2_ARCH_REVISION)
 
 KBUILD_CFLAGS += -pipe -D__linux__ -D__ELF__
@@ -37,7 +35,7 @@ KBUILD_CFLAGS += -DUTS_SYSNAME=\"$(UTS_SYSNAME)\"
 KBUILD_CFLAGS += -fno-builtin
 KBUILD_CFLAGS += -G 0
 
-libs-y		+= arch/nios2/lib/ $(LIBGCC)
+libs-y		+= arch/nios2/lib/
 
 INSTALL_PATH ?= /tftpboot
 nios2-boot := arch/$(ARCH)/boot


I expect you'll have to copy a few functions from the last gcc release
into arch/nios2/lib/ to make this work, at least (a GPLv2 compatible
version of) libgcc/config/nios2/lib2-divmod.c but maybe more.

     Arnd
