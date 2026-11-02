Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593178;
	b=hP3Au/M71ZhT1XD4/y6pSwqxb6AyFGX8tzu93JIUT+gOcSKXTlARM8bHUt/QEclmii6e
	 JJ89fuXwsY6avjRS1WzG1iWqitnUT/1pKvGNl2c0h57/I4kttfmHwEbAZGIBHheKc6GaS
	 1c2Hx+GhY3xuNs4tCS/Mm1s9PfQncRRndgJlig6SG9OV/WKVdykJlUd++oV3Q55A+PQeV
	 pEYXi+VMFkCfl1x+pm02vUulBgQV/cAGe1eZB1qug2y3r3XV8jr4e9KoHPRZCKbWVVIzs
	 XsMCyyCAb9L1cgd5f360S40oPGrNbgRxGSORop8iGXV/SInLpUIMGSgVNBNuBiicjLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593178;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=tAz9HJ2jDwdQAs+C0zjZjO/GpEINmBT0NwKSPeWS6Ks=;
	b=0OYGFsR5AXS1Pb5r+8f5gdoCed1XOfEGih09wpKSMj0Rg0mdMwIzpElUSaW4sjq2AZe7
	 74G5BCDitcTXixbjWma21g0+UpdzGq2L+kIMRlBcp5m8nEvqbL9vZmoKqriMkUDVl1V6f
	 fqAcQBxyn5rsjRavJy0huOraHg0nsJvIA8hOyVVHn/Mtr7Xl9mjPzGb6T7A/cqJL/f9+u
	 g9M4lsLoO+cIpIGRde9nKw/SvQ6oXbcVDXyotikKAf0lGWaUPSa04Md4w6vo2LoZuL/V8
	 audBimCUW2qXHiIr60ImO7P27dpuReB+8JbSY7q2SLeGAddib37aUi+I0jcjY71LJdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=BroT8iPn;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IcPSu6U0;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B933606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B933606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=BroT8iPn;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IcPSu6U0
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id A06F91D001F0
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:19:25 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 01 Nov 2026 23:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793593165; x=
	1793679565; bh=tAz9HJ2jDwdQAs+C0zjZjO/GpEINmBT0NwKSPeWS6Ks=; b=B
	roT8iPnbryMzCQYkkfArGVMqoesUfEBhL36L3lyjtQ2SF50cuu7FM5mn6YeiJqOv
	80QAROBoiYMZVwqWJbIMRUgSstUrnUdPSIb2BF9/JY4APlDBkz5tuc91kmRZw3gO
	+Mm4mmcCXuETTDbx2xIs+Kj3coptFcIgzPJXun/nUAYsXE14WQH/WGsflcDMpryk
	OfjEPop1qPYYE+wcskbI6JM4vFWDIU13SXAO0m/SKZ7gjCcHaYEP7g1FN2Um0kbT
	3ygLoHZ5Xcdki0ZwUZ+gBUl+hxffTTBUweuN9EcFC0mcdcsItu4cVUhcqmOtbtcK
	GPndp2Fi3vG1avJXbhuhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793593165; x=1793679565; bh=t
	Az9HJ2jDwdQAs+C0zjZjO/GpEINmBT0NwKSPeWS6Ks=; b=IcPSu6U0uam9SRoCh
	+KZGsKPUhKNcNWcYWY9rLLikKqK/T42K+KgUHe1NNooLuOnuSq0BvcUgy1gXgQLG
	PcCMN2ArG+aGGdoSPqR16UAm1mpIQalAcagukZK+VQ+LPl2m7XCRHLEVI92paubd
	09DjNnPGE232Qs0NuSr7PDA1pzUyGSiaVQ2Gy8NzXLMsx+aPyPKiTmGyaZDhtK2C
	1yM+Y6/a0+kFSJD9RxmwqFcwNstoj999CLrRPVwdwcG0oA8sbjwqK3Yn5LJow5YO
	6oKBMKfvhLYvzu+c8CfCqLqlhhQXimJa4GfGSegcER57KmQjhBg0/lHbOCbdTc+M
	Fxifw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793593165; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Ah0MNKlNexncQREfLoCiqySihpRtMjUqUhF3fR/h32uHga2
	vUHvIh/34/0jR+umJhMFVN6Gh96mxxdB/0RXMdbW5UAiVOUsEltrY/ffGOpKM9ZI
	AiNFFUIxgJ2eTvILUAADW2iveKo9NAItc1nIXQYMvAU5p8VAEEvisaXuPIZz4Wi3
	72mzPFosxsKGORvWCCe6C01zV0ykcYgqqU441Ciri69gw+vnfUXHl2EpKrKdNmEg
	cU58+Hb/fsWxH9oFhmAVS7WYYgGoNvLRhxiKbA8aYmb4uwHG7ocFLVWIC/Eri7DT
	XtHTLa5+4O+6jLloktcNjD4biOGWeWhD4HxB8jg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:JqG2IE/q90cJf2ABHbo6BbZM9h4Z7zvetv0eTX5AZEo=:tHHs1A//g1el60jKufXBZ2MeixKSZnmFTzdFsSjDSIA=;
X-ME-Sender: <xms:TQ_oaqokl7Dnbb6iMHOmwNfC7Hs3ZBFM-wIbljiHCTph8vYjlRvA_Q>
    <xme:TQ_oammh3VsuYtxNZl1tvvyjpUG5-AXjoimr1B8FjsDr_TvI4cnS0xxMjq38NQHEc
    coX2tryXhnoDmEDsR2PV-ZBU10TLYbE9GSNOPhSbVOLgsp-kRRnW6rQ>
X-ME-Received: <xmr:TQ_oamyN9AAfSjt_FxTYechu30zO8ziWxOsADr4iAllOoJMmZ6pOcBOpHqKEvdvMHrYede856xgqK63iB-eh4rqHRNNHV2GM5VC7pV9BHo5waA>
X-ME-Proxy-Cause: dmFkZTEotuZ1ARIQS2kTcKhurtDCyw9TiUsuDsemNcTAuLGe1PjpywOF6RgNOJbbxX9IfF
    qtGUTS0vQql/3jfllbj0ddYECicsswbB+iH1f2JGy0zqoUOwH4WXcgpPGYBas3CfZwiV3i
    R1nZFyGKX5JmOKYl2NiaTvlmf/yS4dMdHOCx8STgt/d09meN3uMrmo+2Z/lZ/klclLOKlZ
    oHUBOSVXiQJHA0LcBXH7gxWxU+p6oRskza7gsjs71k7qhWpngUD+3gTULtJ3IImLnlqz7Q
    q7hz3NUu9qMJGiY5wXjZQTbswetdGR+PaTrNVkd7GTWMTxeD/XZj3VYl35qDeQqGC1m7Qe
    wmxxns+n5432uY2WTYBEmu1nZgAKmh2CTeQU1XR0incj9feI3nW4Khdz62eFM3vGPUlX1U
    2D9qYf6XUuFJkVA5brxsqddbpsgJTOJ2LFuyCN+R7ypk1dTo0wEUBAW9H/2yeSQK6kdEeg
    XNV/2uweUkkelG8fPLSWweLXyFxNnPYIsxiD98cgaJ84oAB+M++2eDwkB6ksWtC5Q4xBI6
    AD0HnlmjbFOH3wZN0P4an0c9w6sXL4YK3HXHi7zxwGm1FQPRzKV4N/Q5KZBuxQMRRmQUxk
    dov1XtQfGjHL2Ry+9P3lRmZVuaGet61z/onu44xNq+xNob9rohGCC2eaKDGw
X-ME-Proxy: <xmx:TQ_oamkqV8RNyQQw2pmhgPT7OHjN1Q3QimaZGC-emBEf1yzPWeY_Ww>
    <xmx:TQ_oancXmOvMIwJDooGfLN4ra_ejkj8OMNXPsHDYktHxxvKtpawXIw>
    <xmx:TQ_oakrfXHpY8QJoRTVjQiilkixXYgWdpFyKIio_WMBjjqG4OFwSRQ>
    <xmx:TQ_oat6W3cI_4IxsvtuD1mZ2OGr5InuUv15C8aIoOFubi2utEknjrQ>
    <xmx:TQ_oaheWlf4jku22zlnkDr_So1iK9vXIoBuzw5HRkL-9fzrNHXQe9dbT>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 23:19:24 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] firewire: core: add context analysis annotation to queue_bus_reset_event()
Date: Mon,  2 Nov 2026 13:19:09 +0900
Message-ID: <20261102041913.1187814-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
References: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The caller of fill_bus_reset_event() must hold the client list mutex. This
requirement is also satisfied when the function is called from
queue_bus_reset_event() via fw_device_cdev_update(), but compiler-based
context analysis reports a warning because queue_bus_reset_event() lacks
the corresponding context annotation.

Add the annotation to queue_bus_reset_event().

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index cbf61dc06971..927363d03846 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -443,6 +443,7 @@ static void for_each_client(struct fw_device *device,
 }
 
 static void queue_bus_reset_event(struct client *client)
+__must_hold(&client->device->client_list_mutex)
 {
 	struct bus_reset_event *e;
 	struct client_resource *resource;
-- 
2.53.0

