Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593159;
	b=wrGdUVNhomkRQ1RDgx38UkaMSOJ847DhQKhqtqzvWx6UL+1tdr98L8dHerdBFb66P3s2
	 7dYYLhkFzPITJol3O9MtPothHoWcKDChK3R6odNPDV38px1b5noxGgoRuFdTjXzPqzJ0p
	 CLMY4rcT4Tjkp+8Ay6MUR1aZ4Vs7H73de90mFUNZPtbYglDjLDb0CpanoZn4ytwxX0nLG
	 QKLQ2YdM0iR/gW96+OO0Jw2A4ouUD04s8NpRyD5wlOCxbdO9Lm5rVhiSfe4vBSByCtZ9L
	 ZpIJf2z+mfUgHVXgEQxuhq44bVZF5IZ0U2v342gBA/9/TLu7wA9pgDHOJ29e7nuKs0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593159;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DH9NZNJgxpLJAwfK4yFLVbEO1HTBgeytncJuYT7Emmg=;
	b=WRSIPUqQOTs1XjykcsRAAfMa5EoM9GaUTtoukmdFXzf9mb61RzE1K/A39ZM45JBWi7cj
	 29+tHkhGO+4dluGjjJp1TbxgbZI2LCS7vUgZPyti9kb54kaVMF6IGBiE0uV7GchzxKpQC
	 /0K2krZq/1035AP4VRx16HklcWY5/MRAtJqx/PPHS75VFX9ZGvKIMTjP+YPYo2b1p5Gia
	 38vkQMive8hvB7ozOBXtNBP6kBpKzQ0r3R+i7QksGtIaKgWVmNw/2pUPaiQkagcat7WnL
	 ljDFVU6OTLwzRk5i6r5y7m2/tDEmEmSBYfoycf83Ihhgk9qu/OdhAQheaF9ARfyFF6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=TBriTHDo;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HfIyZ+8K;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76275606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76275606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=TBriTHDo;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HfIyZ+8K
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 9480A1D001F0
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:19:17 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 01 Nov 2026 23:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1793593157; x=1793679557; bh=DH9NZNJgxp
	LJAwfK4yFLVbEO1HTBgeytncJuYT7Emmg=; b=TBriTHDoIBV3SffykVOlJSWiLW
	GbMz84rN5idw4GQ8A5CtHNo/xHyoEUuEgxFjVcvM0/BmuDjstZhowr1aYbhKb+96
	FvU/8ORwuCXId6mXvWpsJCxQ+ZCHf2ucmepqqvXwRR+sSS2PJXj1QHghbsXcy8w1
	7zJqIf4RpEsGPIMbofKLJ4ZCs9cVXnrrETUTNipCEUf+agkCqV42JaNTVBv+eqYn
	XmBVzZj40n2YVqq3Jq0kZoDI6XXFgjU0+tOAUMUSFd9FnfWA2d2ccp0t3Fb/ZeU7
	EEwovOk4bWQEr87GHftl/VJ0JTa8ZjYApt+7SiaEzcpYq1Pm9s7PlOE0pkFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793593157; x=1793679557; bh=DH9NZNJgxpLJAwfK4yFLVbEO1HTBgeytncJ
	uYT7Emmg=; b=HfIyZ+8K4UqAUpkzssQ+bI72jcRPz8/Bdoyy1vZ61khn5GwRjRh
	WDQMKxWFoPjiHn+GGMMIMwSUq2pxwRGW42gRCz+uoXTfRI7fDKlnV3RYAIwsE8m7
	h8fXGM6L2U7wxRl5liuzH/zidnJ88baLU3fmHbiFuUw590wO+S+OdgTE/6eeL7lH
	d7Kg5y6nnuWf7vMZr7efhofIfRXW/zfbEw+8Otzp906LhbI8DsbCcNH3oy5aX6+p
	0J8aXE+RgfWYZGpN1nwV/6YdCuCuFv+fpjbZgli5rw0UoDh4VV/TPtOOsCS1NwpS
	sfvbdBQAz3bG5aKU76Z6oHZiM/jEakyqluw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793593157; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Ynaz5P0MlL1dlpEJm1P4UGlZdtvWYV80jKwdyR3WLG5dboc
	UHyZBJ7HQjE+F7syM3WdOBKy9oIdWv9iW1CX8Du1rTd6AZyG01hGPTdgPRiFSSi7
	R51RNaIYMUP3uc8DlVOmSlx2pbefaqLAVCKD6oPuebot9tZSsm7jWyjTp+9b2L+d
	JafLT1LOcWc2yghXYC9LE2k1sxdFFuJ2rGqXoYpbU8Aq30FxWBgsK2lZf4FCHjqi
	UXZ318QZ9vdf0eG9F7CFODf1+t83wTRvXe2znGp5euBh+0VSbL2msm7hP/riHSet
	yV57RfBJqrV5sFw1gGCABrIQlrUrB4D+4Er8qZA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:3Qu+dcnLt6M7xOytwygM9cEgCIJHI4jkchnUMJBQ3Aw=:sPpCakjPCClu5y/pT/ZbqMaI7yKjGd+X7fwh0gLvvDk=;
X-ME-Sender: <xms:RQ_oahe4YlArVp9W88fX2ng1lQW6Ejs5_BP_3_3WHmJrN_0cI782uw>
    <xme:RQ_oatJUe7rGqZHQZ6kEnt5FPOkTZsc9VPVq79EBxEcFtGAFLiQrxhtF7Ixa_t2FL
    iQ5CV7vteN7E38y7bsGDBxViCCy545yqExWy_fbikLueXJufUjJSqgK>
X-ME-Received: <xmr:RQ_oaiFHFmzvNPCdAZrR2XbbqR4wzWg620zbrhs2rGsH8tSTuzQG6WsowZmOqsk1EtC4o3YRih95u0F6NYpmKErN9aogI1xv5QxMWsOt-gSKyw>
X-ME-Proxy-Cause: dmFkZTGmA1oRq5YkjyGouGNCaMyOr/KaZvuAtPhquYfhg8IMRLfbbujVZwrLCMC0QEW9dv
    ulaHLpyiL2i3LWnY7qIXDPvUrBnhV7+B1+Sls5eQb/Ajmh2AULBn44pbR7c62B/ouPUPr/
    oeMTnPG3R1PoKerWD/S2Z3CYAP/Xac9+Wkuc9B69QATfGdswL7E0isMFSLPQkezWLI0dnc
    76Y4XXD29RhodJ3IymVM5raS4jW5gXtqduEayRK8lmvFS0t344GLcePIZM84TdpKWJd6lh
    VOkcin0rR/nMimGpswsxMFfpPtzdTskWZ47020nt2MwPC1f6h1R2Fll3mqAxmrAWHEGXOc
    qVkL28RI1f9HCxKrKrbX4nKi3ZyG/HdBgz8figsICXrtCo+3ug6zP544C0Ea+XGVTPIzVj
    DTMJrmC+I/V/3sFufC6Z7tpdlDh2coquYDWD1tllYfhQ8Iglkh8vpvGruiFkN0wnlOTV70
    4t3xuDoZ+PiSewSTU9EH+hYW8ftwvHuyvGjvZ7fE1qYrB65P1EG513JPWxVF3SbV7oRXRI
    XqFMs4NhpKP/CnIaZM4E/4NcY5z+uRmN87N7/YTRfowM3IwMp+2glZ4CBZJKM7v8p1VuQ0
    5bIGT9TVBHprhqZrePaomuSqCP9szibdDnEVTbOSC+uuF1txwTowBVLL4brg
X-ME-Proxy: <xmx:RQ_oanraZ9cajZCXab_n5op0rgOGX06EpQTFkhRI66TrQKqN86IaQw>
    <xmx:RQ_oarRUjhWV4d4jwFcOG-r3fTGoT7DDb-pzTNiOplDR2tzosibwDg>
    <xmx:RQ_oakPAde05mvwf8bOKdqDTz9nUWZk0L8YgIyxt96Vu6SLWx4ENBw>
    <xmx:RQ_oauMWIXJ6O-XvdauWlNBWnske790fr7unG164vijwdqq5Rcsspw>
    <xmx:RQ_oaqxwAO72YBejwLvm1v86c_Pb_B53D4T4h0gAcoKCIhI6BlbrafcP>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 23:19:16 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] firewire: cdev: add annotations for compiler-based context analysis
Date: Mon,  2 Nov 2026 13:19:04 +0900
Message-ID: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
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

Hi,

This series prepares the cdev layer for compiler-based context analysis
by adding the necessary annotations.

It also adds a __counted_by() annotation as well as cleanup functions to
simplify resource allocation and error handling.

Thanks

Takashi Sakamoto (9):
  firewire: core: add context analysis annotations for address handler
  firewire: cdev: add context analysis annotations for phy_receiver_list
  firewire: cdev: add context analysis annotations for isochronous
    context
  firewire: cdev: annotate data length in inbound_transaction_resource
  firewire: core: add context analysis annotation to
    queue_bus_reset_event()
  firewire: cdev: add context analysis annotations for client shutdown
    flag and event list
  firewire: cdev: use cleanup function for outbound transaction event
    allocation
  firewire: cdev: use cleanup function for descriptor_resource
    allocation
  firewire: cdev: enable compiler-based context analysis

 drivers/firewire/Makefile           |  1 +
 drivers/firewire/core-cdev.c        | 87 +++++++++++++++--------------
 drivers/firewire/core-transaction.c | 12 ++--
 3 files changed, 55 insertions(+), 45 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

