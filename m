Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680188;
	b=T1w7jqQIYVd1EGwo9uDgbLGhCLqaVQ0vqZ7awDXzm4IP2iXXh39VkPmaeOK1kYuWkWIp
	 OhjUiLUDMcccqEE1DwVakZS6+HnsPNxe6nql63aCdre2LGXSJzU1KQNqJmzsbj3BFASQI
	 bz81pY2mp331lBFdWcsJfNujmqMddiz2WvQdKPx2tQ9f8d5keX/CjxIrwlYR6Y+FRaN9o
	 cgS0V18sojVcXAaEvEDwuYSwDPSMnzS42uFcbcuoFNHVPjRBMKeIFW80cicgfef7tQsO7
	 c/u+18J+mgYNh8zJciKBkbJR2EwQSeHpgnXAuba5/hSe1S0mQHsO5+Pp6HM+WoGn8gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680188;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=2cNbVssKDbZI0EKr8nkHLB02Y13DTTMPeP9oKz2LS9Y=;
	b=ABFHLexyjFSa/599C2MA6B9Iux5VCrCNe5OH5uZISABhfPLOHIr6k/11KnfN/Y+8ehtq
	 2Alakanpp5awkTukOOTPOJp/pnl6cwKRSVHqcQwPoT0CBv2KO46ytj/AbTgQG7rFQ3SSH
	 r8O7cDL031NEPCD9RTEk5u94hzurRNBnsF6QjjVjpsT5ML+8o49im1KHgU8+acfgMAnYl
	 lBuv3bqEd1Oy/2LkSQ1isEwz2T5vqGng1AMSmrCDnSbooUc78rZX2rDojUcFAFC7DyrPi
	 O1yw6Bc3PctNqzlRPTMeDF8glFemd+7aLpNWGUgWsJ3VlqdKDB50bI2hyoxPRhDt3oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=tpJgieV6;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JhiSjB7o;
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA51D606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA51D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=tpJgieV6;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JhiSjB7o
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 6654E1D00181
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:29:47 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 02 Nov 2026 23:29:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793680187; x=
	1793766587; bh=2cNbVssKDbZI0EKr8nkHLB02Y13DTTMPeP9oKz2LS9Y=; b=t
	pJgieV6Nh4DQhNE5UMNS8n6qLUJQoqGJfDtVXX9D28KJRp/6gPSla+ISmzL2OYZw
	TG+855v/DUMSVZu8TFNNb5qIiqXM++8HNgT6/gNppijBDwSgJ9l7o91Nbu+pHPJo
	HGOOYJPZY6cJsi1TAe6B//V3oYhHG5RhcoCJzQ1kfNxPhSFbyKFv8ySdxy0gAdgg
	HHffqTpd650Lp6+wfmEtD81NgAdLu+7VO/dSXLEWbAoJcLNeTWMDMucgF9M6V3sp
	0egcKvYD2O06WaXg3eqSIRsL4pzfZVmXx5hHaSm6xYRDND+kgUbSolDTbyg/3idS
	31s2ZmSJgkIwEaJHMSS4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793680187; x=1793766587; bh=2
	cNbVssKDbZI0EKr8nkHLB02Y13DTTMPeP9oKz2LS9Y=; b=JhiSjB7o1uKSgR+Gv
	QL8ivn5Q5bMJUXPPk9BbR/KLl091T3SBv+T4HQFrr8AUnqqYFYO4qGuxI0vILDz2
	A7iS6Eq1KpGQbBYb2ugPTp/ItbuV+2BIxv4NOJsvxy19xOI3F/Pls18C43u2TLjM
	v5HO1smHxRmg5YTAufMT5EHAxzda0UQxeYwidSn3jfpgamW8u2b+d2kEyBaHvrti
	gzhDt1BdtwVuYaowtGmOrLYi+K53RiHfxfSk2gDwD0PFQBUD7ckZn7Lr4bhhX6Tq
	TL5PbPlXr2JpMrMSgDxpyvipP6OtW6y30HrLwjIfH9e0zxVbbqfvgHX3tFSVYz7u
	DqLFw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793680187; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Pubi8LAULLYMuQ2hnoYP1vXdHOqkjtruVbHSkW/cxWBDJMp
	Re2lv4JvK42XiLeAhlupEhDXB/o96r87D7Ub8m0PIJ8uL1arljRUK0VowX4KG9sr
	t+GJxmKmYZ5c8wUonNlCJCZKXqJQhhYRWS7skSP529RnH/vEKRyDkT9fEMVwcv3y
	wGPkuDQQqw8tOX5/Aat6raUx17Lvw2iBn4a1Z9wR5wv1BSsTi5anoB7xbQNaNTqI
	zEiF/MXSW5mGok2nUNywjD/k2doXprta3oI3UEhtSmzy6pFNCsu0jiBTPGjC2tK/
	D7nvv2VNB88giRB8NNSbbyV4Ei/ovarHldFi9Zg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:swOZJRqXa9nJx5E/JsaK1ZJzQvM2D5m1yYciZKhv2dQ=:keym8pBAwtiAb/yLDHViDZl7wnrYXCQm2sdMtUbK3Eo=;
X-ME-Sender: <xms:O2PparE-BRIQNqppjiWoIPD4D08r-wdvjNdsBFUHbpHux99WBWG3bA>
    <xme:O2PpahQ1gZV07jqiy6zaMIGt3zcKvuQv5hMto-HCKGIhYBcUjX2UovgPeCQkJd_Cp
    ZcBkjk9HJW01nLoEaPFQMM8x9llGQ_He1zyBwwoQwSHT6TFSX9mdDs>
X-ME-Received: <xmr:O2PpavF8u6HWmzcIP9JFeBkgucxKCCOtptNw85oqkR1HMtEKJGcpAvUWyCjMAH9mZTaMlSSpzRHjtqj3mgVtdGfS6QO7w7E1ZpXFdkPOrzOp>
X-ME-Proxy-Cause: dmFkZTFW70MjVLWzZbbHLAwQl54RRy5yYW8ytyMsOVRlHTtvsFWtLwSy+C0GWMBc5uv7YC
    8nLvYKRLza+rEF+zC3+mV+Al1JHFpkZGypcOTMhRfR6RaWAjfNSujLusOZKhNhIfUsQ9TD
    JMBnBkXox2mIOygxg+vtmKWDEDcI9ck5vtxF7XLwSRslXyYBvd9YLOwEBBla1DF05GnG15
    Qh/Ycu7Nru32uqWqK3c8tiOrG/cjV9s3FR8k7y6YOQYM3dmo919DKaBdHOLNVxd5F1lFBw
    3VzSz85wcU8utGKIcvFD7/o5A0a7hcXWpTlj4cQdSYozydzGjhJirvXAQ9imqZRtSaCOk8
    1t1R6ADEzc5G25dA6SdT3q+2INe1oYo2YjzAwp4SrIX47a3p2iIonqlzuyLld8ZF5YL2oZ
    Fb6GtXxs7bfSdaLlBPRVdeVfVeN9t5b/kn2TEtNfl25My4L9naYdqKhuG185ga9a++wIew
    eJpHwOb1llC8jgtqAp+9Mt8SHWQACxewWBnEJvb0Y3tYiCDjkXN+VVnQlqhlqCtTyJJ5rk
    9wQUYheWdeXr9tn4L/zRo1PE7lKWkTC6e9tj0/7RcrgxsXI3aoRdJsh1Gu52Q5NHRFhpFd
    ss2d8piiSEEtEypU5LAlfWHSoXcdyxJZXlBpgySCYGkt/9Sq8az2Sx9GwrIA
X-ME-Proxy: <xmx:O2Ppal9r1VZ25nG-vQmZbtLS3zorUoQfwiAy5hQOQj6tlv41pTPIug>
    <xmx:O2PpahIJvMbymFPFB_ZF1A1svwdDA6bksnmU7dTWsYAG11gEFP-Jvg>
    <xmx:O2PpagYRTLtYRRQoKLyft_6eZu9d79wOZyJUlDi1J9dniZR-xSpNMA>
    <xmx:O2PpajInAeV8oYd4j40W_uBlZ04MOS0K77Mot3U_NOVnlBxFbfq4qA>
    <xmx:O2Ppaiq-5MlQPuSk26bSG168NVaQu8noMZ8Zf6_XgU549YeOQQ1uGLb4>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 23:29:46 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] firewire: cdev: annotate data length in inbound_transaction_resource
Date: Tue,  3 Nov 2026 13:29:34 +0900
Message-ID: <20261103042939.1231773-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103042939.1231773-1-o-takashi@sakamocchi.jp>
References: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
 <20261103042939.1231773-1-o-takashi@sakamocchi.jp>
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
index 396b2a722e0e..ebce536ae89f 100644
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

