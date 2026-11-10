Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329217;
	b=cwWqFtp1dynUeD2qZviBpV3DfepkXtQc63oC/xJ+cTX3Qu1iEDlLkpbs7MsKRyc08KOp
	 Cz+nj/1cyKNlwbrj0swWXZ00syGh8nTDuV+eV9R1RZ4eBBlU/BI1tnF56y490kgbEX1Eo
	 Z0ihuqYZ5sDLygI+/SeYMhTdd0MNQ0PAhiNR01WrlBXXfu32Ts0RT0r5gLAj4s2DOx+ZS
	 mLiLDpS7OC4DFWcPKHac1JP9+sBGUZFKwtpbP26NIUWEzNXJOS/WNq+HxDHbHMs9Ib9uc
	 R7qNxRTLcOz87padQ2wcmNG8H274EtdUwvybpDfQsXhHF4dfnMILmpRPFfAJwAMR5uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329217;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rU+xzOknJq0zAItZwFEgG+rOiipQ+A4n6Y7JItCDQ6M=;
	b=R7vwAM2PpIW1OFvzrRSpeWOJHyJXhnD1nALNinc3xd1fWibmFw1W8HeUWLpQLP0bO1cc
	 okskEj3ObOrj3MJDYpoLIO4okeypLEQCRNphlsnOlli0BCYMz1s9TnRibzQ06e0LkcCsE
	 axOjklP2AfdEPGeeG4ulLPn3C+viFn8oi04BEj09Ps8XvM+K95ssMKD0Qzg4oHSd+hZq3
	 5ipQvRYhp5up6YVF8kR3xQYFpz9fbRYLHIgg4AXG8Pk6JUrsGGVJtJwikLwPUj1zUEW3c
	 avyIjMcr83kEX15me2b/5IsZTHzZZHOJb5N5gDeYZX4NbuJD81ZTZKFiSM924Z8yZPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=nUlyMveg;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=VKJosJQd;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83BF606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C83BF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=nUlyMveg;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=VKJosJQd
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 271BD7A0024
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:46:56 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 10 Nov 2026 11:46:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1794329215; x=1794415615; bh=rU
	+xzOknJq0zAItZwFEgG+rOiipQ+A4n6Y7JItCDQ6M=; b=nUlyMvegnGhgPtx0TL
	DP3VDE0HgrQZ/vnK/BHUetvJtw+1aGOSgMfMXujwt0s2Bqs/8L58G/Qa1tSMAMie
	Gx+ehAd2Nl9A+QjUSvRpun7XHHT264z2cV+MsMrTBICttMQSLbele0GK+1bZQjFf
	gSywAIsErFNR4IHD8OcMeN/Cr+HhKtYnurpMmeZY/fhaDOyY4PbktFhTShBQUVOT
	Pm1DQCG68SbXpBPG36IACAKLg6XtVzY2hAidPh7WXHxRZwH0ZGM+dCJb0VxpUZTq
	TAr4Nh7HBLSnEC8/3T5I1Sf267TDziDSl5kGX4KKY0INKUWdEHTYjxZ1jyHr5eXb
	G82w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1794329215; x=1794415615; bh=rU+xzOknJq0zAItZwFEgG+rOiipQ
	+A4n6Y7JItCDQ6M=; b=VKJosJQdJp+2KBnUGUt4AMPIagYAJTUZQa7DUivYtq4w
	sIFYK30LpYy/npOAskZKHL5hpRktZII6cN/32jQbuqBYr1e0u6VD/YG6QDyxXLtG
	GRTgjT9S4gIVskcpPx8brcm34eAVmoLiHqOi7sZvXdZyQSBvszdwsbDJsgpm2huK
	5ro8yGqT06IVne2zN82Z+7XmpCj7EBdb3AdqIKEbxzlh0T5+M1zAiG9yKBYm7AxY
	B0oLRzw6B7vcZsF0ISUM+O4gWN7cLpRCVtaPmTfZl/fpBuQo9HfXLgeKhSpsCQmK
	RMf5NXJw3Eo/LJerdQLYzoy3hysuK3eG6U7UCnDXHQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794329215; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:sAp+lLOW1Yc2F2+bY8rI0fxjA0fhlmZHqAA1iiGKAS+3w1C
	p3IHVcBZJJ+ucUDu8sLsgN7mxh6sLMAoUs3IYrUauw8Y37uPLT3hCDW6ulncy39k
	ns9icje7tlU3dK3AEJZfr3tN2Ha2JrHsDegyXhYRrY3FwSrggtdWlixy4G1QAESs
	Z3ARyOVwezWN2QmBWeBUyKSGWYlAqqfbN0ObHMSWBKA0/Bjs7d2bteAecpAnagda
	adjpelRKtpoPrsbA0C0z3uKwsZdl4ksHfBL/ouSWXa/cfkkYiyi0IKjSV7VPfohx
	aOk2I0X5ZxCA1pDXFdII48Tu8vK5YoVLxIvH0Dw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:35UdO+sdZhhvJT5i03Cri8LNT3N13uOTI4sW4YOm/gU=:v3V8WC4+9yuA4pSF/x5r5AC0oByH8YOkSpvtvw3FZX8=;
X-ME-Sender: <xms:fkrzajrSiHa9prD7S-JpiPx8wmTljsHD5hKfw3cwkXXwLLNnlWXS6Q>
    <xme:fkrzajoWnFcxGMMgMCrhSEOaz17HtL_3_ozBn_lE0qrPJZy_zPs9AljiL7yQjSwEt
    -in71asgPi5FI5kQ5EaEUgI0kk1wgZArYpylYMnLVZMQRa31q1lqMc>
X-ME-Received: <xmr:fkrzarD7pebKhqV3oVpsVmF9qimWGdzsc4DqifzxIpm1w44HrxGPZeZLbBzzqk4OAW8ZBSs-I_aRN1yXE90iwyzSnUnMzY0k-sYeIA>
X-ME-Proxy-Cause: dmFkZTGkMoNYIGIESfraO/0wvb6EFswweUTDOEsTCLdPS1mG2124pEvHT5pQ0qNDLP2aJf
    b6BbmEF3geHKAdMQ+MxwMSw5Qno7d5PJwQix/bH2k1WC5zmUBk6B6b7letCnWZPKiXNlI6
    vjoUBmeJZnWUWIq1Ro3la9Uy+xxM+bOmSwOGpG9qsU/CXprQ4U7vNPg/MAkiEzO5OVJ/+8
    WT7nLbAx0XCIWriK1J8/yrUxM3QZXONieGcQHpwZKIm86iesmejPjJ2+OgVwbcTruaYH/1
    PKmNC7O1dN0kVOPY38bt1usRjamQSU+c3dWiJMeog5Okx8sls7C0hD41RVaxkM6HUwI1Zy
    X8jbc/3vRN1G2iYlwq2bVPhwsbjUH2ro4hyS0rRapUeGua+z5dpfdAu+eSPMu/StqAG1h4
    FgRDCZxaSDhtkqh2/omvB+wjRueAEgzxg/ju00lIVdnJcVG7F9S0h/HDZhLy+YimGA7era
    Tt84/F3N+nUa+9psN05QmrjRRTKkoK4eMDnYycFOZbYjWyb1antb2ixYJe5IC9vvTom8Uh
    cX3018hrC8kE8vjEjvR1p+WnMSMxwgl0dWyH8AC7X++oZa1xs3WwmUKCXoi/vOx3PYhwBf
    IvJ2/NNOW7gvchXc8auDukNm/qt4HSRr3nm8nhTadeue06ijs/LXRjv2V0lg
X-ME-Proxy: <xmx:fkrzaptafr1k-ttkUfSZfdPyaOiaZedseH4Fsw_yaWhMOKfJ6nB_Aw>
    <xmx:fkrzaiKYkq4rF1M6zZGaKgunK68v99Y7MmwL0sb83OreBKCbL3I6LQ>
    <xmx:fkrzaobY6SahZpw-5ZcYy2Gbi23YYksJJfBQX9tyC2HvvaIIk48dbQ>
    <xmx:fkrzasDY73Dx662ItJnIQSGQWfI225mG1nkMbmz-Rl7R6FA2vg6fmQ>
    <xmx:f0rzajqjqalkaPZ2joKwfD3yLwggGSfhG9Kmm-P6zac4WGwchRwdZpcz>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 11:46:53 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Tue, 10 Nov 2026 17:46:46 +0100
Subject: [PATCH] ASoC: apple: mca: Fix clock selection for clock consumer
 FEs
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-snd-soc-apple-mca-capture-multiple-be-v1-1-d9569a8374c5@jannau.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NywqDMBBFf0Vm7UAeVUp/pbiIyaQdsDFkVATx3
 xvdnXMW9x4gVJgEXs0BhTYWnlMV3Tbgvy59CDlUB6NMr7VWKCmgzB5dzhPhzzv0Li9rqbxOC19
 xJHzah+272JkwWqhbuVDk/f55D+f5B2OA4sp3AAAA
X-Change-ID: 20261110-snd-soc-apple-mca-capture-multiple-be-834365f52db3
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2914; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=v3V8WC4+9yuA4pSF/x5r5AC0oByH8YOkSpvtvw3FZX8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzPXtVVskYvPxRayhjX1e/4sI+v/old4Nk7Eqd3/1l1f
 ZtO+NLFHaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACbyN4Xhr+jcrDDptcu3xIjU
 LQvacIKJS6x6LfPpzSknHEy8PF9s/cjwP27KznUVbyWmGH/yKsmOX5X/RV408ZvMn18t9kKV10/
 ZMgMA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

In commit 00309bfb1f54 ("ASoC: apple: mca: Support FEs being clock
consumers") the syncgen clock selection was misunderstood resulting in
selecting a random clock. In the capture on multiple BEs for IV sense
data use case the configuration worked partially by sheer luck. On
Macbook Pro's with 6 speakers it could result in desync IV sense data
triggered likely by sample rate changes.
When the FE is a clock consumer select the clock of first used BE as
SYNCGEN_MCLK.
Add function like macros to determine the clock index based on the FE or
BE number.
This is functionally equivalent to the state sent in v2 of "ASoC: apple:
mca: support simultaneous I2S capture on the frontend" in [1].

Link: https://lore.kernel.org/all/20260628-apple-audio-redux-v2-4-6328269c9652@gmail.com/ [1]
Fixes: 00309bfb1f54 ("ASoC: apple: mca: Support FEs being clock consumers")
Fixes: 108a14b20f95 ("ASoC: apple: mca: Support capture on multiples BEs")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 sound/soc/apple/mca.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 26022a42a95e..5e644b596854 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -53,6 +53,8 @@
 #define SYNCGEN_STATUS_EN	BIT(0)
 #define REG_SYNCGEN_MCLK_SEL	0x104
 #define SYNCGEN_MCLK_SEL	GENMASK(3, 0)
+#define SYNCGEN_MCLK_FE_CLK(n)	((n) + 1)
+#define SYNCGEN_MCLK_BE_CLK(n)	((n) + 7)
 #define REG_SYNCGEN_HI_PERIOD	0x108
 #define REG_SYNCGEN_LO_PERIOD	0x10c
 
@@ -313,7 +315,8 @@ static int mca_fe_enable_clocks(struct mca_cluster *cl)
 		return -EINVAL;
 	}
 
-	writel_relaxed(cl->no + 1, cl->base + REG_SYNCGEN_MCLK_SEL);
+	writel_relaxed(SYNCGEN_MCLK_FE_CLK(cl->no),
+		       cl->base + REG_SYNCGEN_MCLK_SEL);
 	mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN,
 		   SYNCGEN_STATUS_EN);
 	mca_modify(cl, REG_STATUS, STATUS_MCLK_EN, STATUS_MCLK_EN);
@@ -390,7 +393,7 @@ static int mca_fe_prepare(struct snd_pcm_substream *substream,
 
 	/* Turn on the cluster power domain if not already in use */
 	if (!cl->syncgen_in_use) {
-		int port = ffs(mca_fe_get_portmask(substream));
+		int port = ffs(mca_fe_get_portmask(substream)) - 1;
 
 		cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
 					      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
@@ -401,7 +404,8 @@ static int mca_fe_prepare(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 
-		mca_modify(cl, REG_SYNCGEN_MCLK_SEL, SYNCGEN_MCLK_SEL, BIT(port));
+		mca_modify(cl, REG_SYNCGEN_MCLK_SEL, SYNCGEN_MCLK_SEL,
+			   SYNCGEN_MCLK_BE_CLK(port));
 		mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN,
 			   SYNCGEN_STATUS_EN);
 	}

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-snd-soc-apple-mca-capture-multiple-be-834365f52db3

Best regards,
-- 
Janne Grunau <j@jannau.net>

