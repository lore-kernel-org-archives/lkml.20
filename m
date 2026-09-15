Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F98380FD5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457174; cv=none; b=HabrkdY2UTAIe0Jnw5pZnX2ByrlO9xDn6Lpo5DBe2qBBrk2DfD7MwVf3i/LbEzqx4Mde2NLaGT8LL4v+2aPiuS55Mwt2yg8wNnOOnp2S4/Sxi0y7H2eRFljQ3YCT6K3ghKOqVE0JnOOMPrv7XNltlQPHIfLa3RVXLWr8v0XCsNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457174; c=relaxed/simple;
	bh=EITwAMi94+L/rAtKaV6SFtQcSSqz9GoIdJNwb5xLs7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fJvIkDW27QuiaRc9jfR8IIK9SME67UO/PmMt+yc2CVCrHH9Lq2/Bn0gNK8UjF7wnsVxkJL72IXbe8PVfP1bx+15SaOGfzRirCH8kyhah203/olfvi9aUsdX3MN8viWhkg4F/wTCbjhN28j+XqQyZa1zXl7oHMJIQnaEvrnuyP9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8V6xl6y; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8V6xl6y"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed1368so28403735ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789457172; x=1790061972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5/n9buj4EljOW9mw9PWRJPUglpJ6jbEEIafd9TEaCs=;
        b=H8V6xl6ydoQRNGb8BY7JJ/943mLRjLOdGfsMzo941VL76sKa1gVCELR7urQB48a/Ng
         KMNwBOJOj19fAn+/IzuIthPb7OSyxWqzb3HxIgYxS09CYieK9UyHGdWGkVrxZvUJkzr6
         NIVuPIf2u6rmoTH0NaX3Pyq4pGrd9Hb2sMijR4eCH9FGTppToYALY114OmwGlgktB0rA
         CjZLxblflPTlpW/4MxgYvtFcrvdWsi1R+MsDCRTxX92Clf6F27WV0jYWfVG8eSgiB6V3
         sQQcGYdxe3MGj1JfzurSEVaNZV0imaAxlhLijpFt5rLoGzGM8cRiyivvpOsVs5w6m14w
         cd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789457172; x=1790061972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5/n9buj4EljOW9mw9PWRJPUglpJ6jbEEIafd9TEaCs=;
        b=LDfVQUEOr5rFB0ChcI/d/zIJuH2THfsVcyQn5rSGI8JQ8ay8DeCFRf/Fw6U8H0MAhe
         o6bxTxgPKq0OBcvmd0DA8hpW+I+s+6+RnVvQTIEyB7dLvz1qeyhI7x59vRJzcRDqDhAd
         YI2yBvIsemHAB+ER3mWJwXxK99hQDdZJm8dlkaZ74HpMRll3cNC1lkdw1hTMZZEt80Lo
         +nCrIe/NfA95Yt6QI+PLmIhgzwuKOwgZwkYUi+8Ab1Bb3PEtabnHFzWfo8KbNfZn0vJl
         ThfBBnTubsQbiti3oe6CpN2TjmMh2/tzdja6v2nN1GGkPmccfcQKpLROq7/FPOtHo0Mp
         cZ0g==
X-Forwarded-Encrypted: i=1; AKwUvBwcpz9qhYKRzyngvS6GvKiqj5I0c9OuAqt4ycESILCBfeJiiohW56MxL0xUtPGAPxVGExFgeYZpqOhwFi0=@vger.kernel.org
X-Gm-Message-State: AFuF++m1cqBdF1JLwlgMtTDPd00s6v6iPtr6gB+Ysd1O9zaYoAxjJIZq
	fCVB6gJ0G9yP/Wp+WnvMNczErrqpacSUgx707a6WwixXPAQ0bPZFY/4n
X-Gm-Gg: AYBFou0bkWilQIKymQ4X/wSM3qOIgafzaysjrewrUKOHpIHNCW5tIZWq8SgxS0EwKA6
	TpGok0kBro63cMBcbu90dIZGQtQzlNeeW+xYiOd8ifopb9dFjS9oTTTofMTr/YPXAkRQlEmBLPM
	Q4JU0l36OXUkvfKx0mAjhqicAQduZmOduOvq3T4403tGvZSe316LyMwOMkbxqX5PAcnGnowx4VS
	Wzu9w1HeB72vW2LqTYp8I2rHjYITLqSVL7QisqYXrYN9sZkRPRObNhB68Lo4TkLRZU0x+2kNO95
	pNSchileqt/3p4JOEYemARkdpNKUaR4KMUiOE8cQs1ISGFz4nQMWPnkpG4WelxeYCzOHCP2kEuy
	atqWkjJy5yExD8BuQO+Us7wzGb8vLXGzTj5lrvdUfs9LQIrHVZMyaRxr9SNlUSMKkG1UKNN06TS
	AiqZ+NKIuclqlQP8r3r0SKnw/VYd/u9dHfcnW8AfAts1s8yDi26akMfwPAoCARCkI9E8Ou/VN1s
	oWNebrEhqYCnKEoJ3EVa6lS6bZpSsK1HRRPKzmo5lfVTFXT2oaem2xQSWl3H+tV6uyaH22E23zl
	x+gBVbdPmShHcknz0ZlQXZVliM9F/YkjFXL3SPp00WIT5L6f
X-Received: by 2002:a17:903:32cb:b0:2db:39dc:48af with SMTP id d9443c01a7336-2dd6c757b6bmr116752735ad.17.1789457170179;
        Tue, 15 Sep 2026 00:26:10 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ccadb4fsm61248325ad.2.2026.09.15.00.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:26:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv4] dmaengine: bestcomm: gen_bd: fix out-of-bounds access in PSC parameter lookup
Date: Tue, 15 Sep 2026 00:26:08 -0700
Message-ID: <20260915072608.57887-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bcom_psc_params[] array has 6 entries (indices 0-5), but
bcom_psc_gen_bd_rx_init() checked against MPC52xx_PSC_MAXNUM which can
be 12 when CONFIG_PPC_MPC512x is set, allowing indices 6-11 to pass
and read past the array. The tx init function had no bounds check at
all.

A malformed device tree with a large cell-index could therefore trigger
an out-of-bounds read. The garbage initiator and ipr values would then
be used for MMIO writes via out_8(&bcom_eng->regs->ipr[...], ...),
potentially causing out-of-bounds MMIO accesses.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: actually bcom_psc_gen_bd_tx_init is still needed.
 v3: reduce bounds check to single function. It's not used anywhere anyway.
 v2: fix title
 drivers/dma/bestcomm/gen_bd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
index 61b5746e1a97..7bbe9cd7b39c 100644
--- a/drivers/dma/bestcomm/gen_bd.c
+++ b/drivers/dma/bestcomm/gen_bd.c
@@ -321,7 +321,7 @@ static const struct bcom_psc_params bcom_psc_params[] = {
 struct bcom_task * bcom_psc_gen_bd_rx_init(unsigned psc_num, int queue_len,
 					   phys_addr_t fifo, int maxbufsize)
 {
-	if (psc_num >= MPC52xx_PSC_MAXNUM)
+	if (psc_num >= ARRAY_SIZE(bcom_psc_params))
 		return NULL;
 
 	return bcom_gen_bd_rx_init(queue_len, fifo,
@@ -342,6 +342,9 @@ EXPORT_SYMBOL_GPL(bcom_psc_gen_bd_rx_init);
 struct bcom_task *
 bcom_psc_gen_bd_tx_init(unsigned psc_num, int queue_len, phys_addr_t fifo)
 {
+	if (psc_num >= ARRAY_SIZE(bcom_psc_params))
+		return NULL;
+
 	struct psc;
 	return bcom_gen_bd_tx_init(queue_len, fifo,
 				   bcom_psc_params[psc_num].tx_initiator,
-- 
2.55.0

