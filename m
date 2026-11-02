Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593165;
	b=BwvJ8b3Sq2Zo2QoFLb56L1WmQWuG4w7qWiNQy4XmBcFwV5GN0+JIos7w22+ffCCq4ZLX
	 SB7runy7n/YbteluwIBie1+8rm7AKivQ7pCCGOnI4oPbsWRnsMBUpnsK5hcsBeKhfhuWL
	 LnloWlRfO+dbZfcXIxhaCCc7ER1E4ftA4u2nkjN95EK2lWDa/3/vnQaXXNntwKNpUo6TR
	 fFQ5dwSiCI/95NsqrtvR2uPhU8pl6WX3zy3Yi4L2AWy5TpT63ynZvoZTJ0HNYxvTiG2By
	 YWaBfXfLB6TSaS+6JgSuahjRuVikB/dwDzhgt7xmamYCLEVEpUHjYMXx5MfhHd78MWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593165;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=OUV9r2t0n4PlCFtcwcNQoz0U6/EUA57BEeLTixv9pnQ=;
	b=Efc77C2QHpGFk5wOzXcdlHTeTnEhr2AYduFOsiveD5KvzHTR78v2eYi7V2tKH0Pao+Tj
	 t7e6BTM0BI/4Ut0HmktCOAs4gdYxOegtoxJTWqyjXvRwJzheczUdI3rdhLiUWrs0ehr4I
	 eb+ciJgLNvYSHRc/GyINlWyBbIQMAnbZffb+HngFqbPxie0OQJYd5t0u1TLpw4xChyieP
	 JPtJaFlYfaCTdo1ZZPH2uAy43eNvjCYZ5/AW1wHiAPe+WGfbA0SAKnnYOc5HXFEMv4+Wt
	 nInL3lWdoeYjgA46rmDMwT1G1gSNNK0kWq7haLL1TPCecuifkDZ8aUzeKLx4f6B01xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=u+7N9oS1;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=yOPnBgh1;
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B55606A337
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9B55606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=u+7N9oS1;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=yOPnBgh1
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0EB3C7A01CD
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:19:24 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sun, 01 Nov 2026 23:19:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793593163; x=
	1793679563; bh=OUV9r2t0n4PlCFtcwcNQoz0U6/EUA57BEeLTixv9pnQ=; b=u
	+7N9oS1wdDquxhnHmu00tTDO2G9DmcesvVqWzwr/SV8ZzuIFG8oqN9gXEvKBGs8W
	mviQv4krp9SbftBp4l+jBe63I2ZsDMdRHHKVK2rrSYYtfkFMGAUxm/gEIN4Lz9NA
	rnLnvphzkl4S7BOjkzovLSVNCiTGpugbsvxh4PvIf0+BmYYEoHLxpCqvEhQKtJdY
	R5cvGUazIVnl9Mv8R9tIzdRm3du78wcWxBOchHIV9Wc7/OD5qPShNTRBX3dzmxZZ
	g+GbHY4MtX3BXlS19Gr04tfrPzP0ScF4uzB3vQ6edCmg0KR/f/XHImLKMRpB75mq
	ny4ogbN2X/Cx9HAASsH9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793593163; x=1793679563; bh=O
	UV9r2t0n4PlCFtcwcNQoz0U6/EUA57BEeLTixv9pnQ=; b=yOPnBgh1q9blx5G5F
	lJXLMUF7KSTnTnJe18bu/jnV8nSnfOtZ+dSVkOxEXLP4zFJVmMgd9+UAsELkWSBl
	nbJLYxjq8rTysI5wygns/rtYAHDSRWW34OwBGrycIbpuMH76YdFXXeKJ0NMHlyK3
	pBPnvGq400aBbhyrX/icORpb/DSv0+L9BWIUjf0noi+dgEloeebo56nH5DN6Wsl8
	rcsP+I5PEJKjieV7f6cOg2HF09CFuA+VAv/QGnwsm4gU2COkhgBDO5gTzskfcsKz
	4a+jmONPaikFLvE0Imlis5V+pfaDyaMSDHqbMamGdg+Qmek/rskcLxhEEzLfQf6n
	eunVw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793593163; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Sah7FG/WQJKadiHlhpztvh71wAXctwFoRM6FloYIm+d1B2C
	d7cgYzVLwRNeE9i6NjqdyfVGi8UHbp3nGRVbDyqd0+kW9KDY/NfX1fH2fbB8ErVc
	CVJz2gsfOkQbLm1KK8K6RHUMX2MSuTuNQt8TUKUiSjgp5TNCcL9DTyHIRqINvBMh
	5hVueekov9MmAhCzJVFgyNhm3CBpBwej9TSGcTZB0nWinMvHKEXXcSV1wGrELesk
	jWIl8HI0Lwk3Ppc2vzJKUiy0hLgVuTpInigiz0gTrPRgc2nmJCOa58JNPT0Mgsml
	WjjLlI68o3PB+/jojST0iBk7jv6gZu7LZlltR5w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tjnDvA7NjVruNexlwXDNs4xVH+cyadbp0Qh1HDQJW18=:TE4LZhPXzrHV1DcVBClbxqCCyQTZ77B06g80sb3RaIg=;
X-ME-Sender: <xms:Sw_oaiKxy0lFX2ejWsFRhZqWuL-8xrpXsyapDyTzfCtNou00j9RWoA>
    <xme:Sw_oaoFAEVxSSIza-4aOnV3-mKvPkyOwEukaHVAPwpp1KTuK90VQA45m1TcAq5nfc
    e6szke8bLoiyBhGqSM9_-Gqq1UrAVVZs0bSEHm8PPXNRvHHp1Zf9Yr6>
X-ME-Received: <xmr:Sw_oaqTa_vH8lihpn2KtRUl6jc_FL8vx9YaoLUe8HdY7nnSaOM5vrUDRCGYwWJiv6JYrluDxnIWZFI0Fbl53Ep_zxwwPRP0Cr0919jVePokxGQ>
X-ME-Proxy-Cause: dmFkZTEotuZ1ARIQS2kTcKhurtDCyw9TiUsuDsemNcTAuLGe1PjpywOF6RgNOJbbxX9IfF
    qtGUTS0vQql/3jfllbj0ddYECicsswbB+iH1f2JGy0zqoUOwH4WXcgpPGYBas3CfZwiV3i
    R1nZFyGKX5JmOKYl2NiaTvlmf/yS4dMdHOCx8STgt/d09meN3uMrmo+2Z/lZ/klclLOKlZ
    oHUBOSVXiQJHA0LcBXH7gxWxU+p6oRskza7gsjs71k7qhWpngUD+3gTULtJ3IImLnlqz7Q
    q7hz3NUu9qMJGiY5wXjZQTbswetdGR+PaTrNVkd7GTWMTxeD/XZj3VYl35qDeQqGC1m7cu
    UdnKuZmFyF5pYHlmtDrOkPZfSNX/c57cvC5PE7uCfG7Eh5oI2VReEtVorQhSx/IkXidsmV
    qIqOwyaWC3HAWwSBlthTW2lrxb8JA8yb0buE9vLVBojsJUCOLLo4S/JORYhNEuWXS3oOXl
    lHRgPbjyxHd8tM8XtFmI9yaN2U7koLWWyF7zO4LhcrgW0/Eu3eQCa5IdyIwdWqYuJxout7
    BMODxCQJUQkoWCvECX4pOTL+9ALlAZYQ+xj+JpNh0le+zOPVIm0RO2NcayqqBP5tH24Qdg
    oe66Jx3rGcpxBaxI4olpfD6tqxktQJTYZouQdwMeELBXJpNQE5aNYWkMLivA
X-ME-Proxy: <xmx:Sw_oakFbuma6PspZM-6ojd6J_rnAwnCfJYOx_OW6ja6u2dIQ9oof0g>
    <xmx:Sw_oam_z1YR9ubGEZzS6JlrT3gl77gOj2V3NQWcj-Ek7gu6sexhm-g>
    <xmx:Sw_oauJX9CU1j9mHnyTPwPGAFVzeHD_UPAhICXQQrgTMoJKU4gxlIQ>
    <xmx:Sw_oapZ_1OSmv87OfdRDIdwMLCjly5AJFu6Kp0m8T1hbz6Rc8tWfmQ>
    <xmx:Sw_oak_QPs1eL2eKwGqy47qLGohf9WinIzN9AVoQeL4HfkMA7J7vR7t7>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 23:19:22 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] firewire: cdev: annotate data length in inbound_transaction_resource
Date: Mon,  2 Nov 2026 13:19:08 +0900
Message-ID: <20261102041913.1187814-5-o-takashi@sakamocchi.jp>
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

The inbound_transaction_resource structure stores the length of its data
in a dedicated member, which can be used with the __counted_by()
annotatnion.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 418b72cb8835..cbf61dc06971 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -118,7 +118,7 @@ struct inbound_transaction_resource {
 	struct fw_card *card;
 	struct fw_request *request;
 	bool is_fcp;
-	void *data;
+	void *data __counted_by_ptr(length);
 	size_t length;
 };
 
-- 
2.53.0

