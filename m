Received: from out28-52.mail.aliyun.com (out28-52.mail.aliyun.com [115.124.28.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3016F521204;
	Tue, 22 Sep 2026 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063685; cv=none; b=RuIUtg0elzx3XcMCE9lU+GX8EPwcsaHcWC3haZdNizBJ1HKnMNoLhpJqC6loXjK4QESpt2OZ8bJKNScOONc7gyOzO2rHhN+twuqWAIS7V6Gr1/itKPMsX67ytJpUc2iJG0Ya02/JgtRfuOHt0xAk+AIMRHRGE4yYmY7jAMW9VJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063685; c=relaxed/simple;
	bh=pBafSgCnUiYFLdgAXKnRhBiqSwDUOAgem5tI4RZ1hLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j2Ac6Mhi+WRNvWDkfW4zZA/JwphttdnYBHw8/eHQ3QRC5E9Yt6rjLvIA3e1TDTDq462ULUDONg5XJ1/PK9MoJbpxw3m29bEjx746UYA/vsl/rTtbf1RmTJ3YFgdqOCV1jA7MVp9pcAJytgYAJ87syn0LFR9oO8p9L8WRwjGpkek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=KnV0owlH; arc=none smtp.client-ip=115.124.28.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="KnV0owlH"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1790063662; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=R/X3OD8Nby/QSTgWlm2KLdCBm1FvXrQ8pE8PyW5ZCy0=;
	b=KnV0owlH+NEp7OHMHGB8E86mtXipmcZSwqO3ypX/CTmAVgsy9kMn6/m1ZssF31LYrFx1yKxFHFQ1EyDjzxzdWeznq+wI8C4Qh26cPfnHMHdpFsp1mAguPHFQMve5EsQHT21DO+lLFxivrm1DyP7Oto6mkR+iIL1HDT/nPBepW7g=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07443159|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0396591-0.00202204-0.958319;FP=13502539487106581925|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045220102;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.jJpRiGY_1790063660;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jJpRiGY_1790063660 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 22 Sep 2026 15:54:21 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Chao <liuc63@xiaopeng.com>
Subject: [PATCH v2] media: cxd2880: avoid a division by zero in the BER period setup
Date: Tue, 22 Sep 2026 15:54:20 +0800
Message-ID: <20260922075420.1347279-1-guozh23@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cxd2880_set_ber_per_period_t2() computes the BER measurement intervals
from the number of blocks the demodulator reports, and uses the result
as a divisor:

        pre_ber_rate =
                (plp.num_blocks_max * 1000000 + (denominator / 2)) /
                denominator;

        post_ber_rate = pre_ber_rate;

        mes_exp = intlog2(pre_ber_rate) >> 24;
        priv->pre_ber_interval =
                ((1U << mes_exp) * 1000 + (pre_ber_rate / 2)) /
                pre_ber_rate;

With num_blocks_max zero the numerator is denominator / 2, which is
smaller than denominator, so integer division gives zero and the
division below it traps. That is a normal state for the register, not a
corrupt one: num_blocks_max comes from
cxd2880_tnrdmd_dvbt2_mon_active_plp() reading the demodulator, and the
field is zero before the demodulator has locked.

intlog2() is called on the same value and warns for a zero argument
before returning, so the warning is reached first and the division
follows.

Clamp the rates to 1 before the divisions, in both functions, so that a
zero derived from the registers produces a large interval instead of a
trap.

No Fixes tag. Both functions came in with the driver, 9593810cd42a
("media: cxd2880: Add top level of the driver").

Reviewed-by: Liu Chao <liuc63@xiaopeng.com>
Assisted-by: LLM
Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
---
v2: add the CXD2880 maintainer to the recipients.

    The previous version also claimed the DVB-T function
    (cxd2880_set_ber_per_period_t()) reaches zero the same way. Its rate
    is computed from cr_table[] and denominator_tbl[], and the smallest
    value those produce is well above zero, so that claim is dropped.
    The clamp is still applied there, because the input comes from the
    demodulator in the same way, but the DVB-T2 path is the one with a
    case that reaches zero.

    Add the Assisted-by tag.

The values come from the demodulator registers, so the rates depend on
the state of the tuner rather than on anything userspace supplies.
Reachable through FE_READ_BER / FE_READ_UNCORRECTED_BLOCKS.
---
 .../media/dvb-frontends/cxd2880/cxd2880_top.c | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c b/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
index 0d058b59a..1a1c58613 100644
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
@@ -764,6 +764,12 @@ static int cxd2880_set_ber_per_period_t(struct dvb_frontend *fe)
 		}
 	}
 
+	/*
+	 * A zero rate can be derived from bogus or not yet locked
+	 * demodulator registers. Avoid dividing by it below.
+	 */
+	if (!pre_ber_rate)
+		pre_ber_rate = 1;
 	mes_exp = pre_ber_rate < 8192 ? 8 : intlog2(pre_ber_rate) >> 24;
 	priv->pre_ber_interval =
 		((1U << mes_exp) * 1000 + (pre_ber_rate / 2)) /
@@ -772,6 +778,8 @@ static int cxd2880_set_ber_per_period_t(struct dvb_frontend *fe)
 			       CXD2880_TNRDMD_CFG_DVBT_VBER_PERIOD,
 			       mes_exp == 8 ? 0 : mes_exp - 12);
 
+	if (!post_ber_rate)
+		post_ber_rate = 1;
 	mes_exp = intlog2(post_ber_rate) >> 24;
 	priv->post_ber_interval =
 		((1U << mes_exp) * 1000 + (post_ber_rate / 2)) /
@@ -780,6 +788,8 @@ static int cxd2880_set_ber_per_period_t(struct dvb_frontend *fe)
 			       CXD2880_TNRDMD_CFG_DVBT_BERN_PERIOD,
 			       mes_exp);
 
+	if (!ucblock_rate)
+		ucblock_rate = 1;
 	mes_exp = intlog2(ucblock_rate) >> 24;
 	priv->ucblock_interval =
 		((1U << mes_exp) * 1000 + (ucblock_rate / 2)) /
@@ -886,6 +896,13 @@ static int cxd2880_set_ber_per_period_t2(struct dvb_frontend *fe)
 
 	post_ber_rate = pre_ber_rate;
 
+	/*
+	 * A zero rate can be derived from bogus or not yet locked
+	 * demodulator registers (e.g. plp.num_blocks_max == 0).
+	 * Avoid dividing by it below.
+	 */
+	if (!pre_ber_rate)
+		pre_ber_rate = 1;
 	mes_exp = intlog2(pre_ber_rate) >> 24;
 	priv->pre_ber_interval =
 		((1U << mes_exp) * 1000 + (pre_ber_rate / 2)) /
@@ -894,6 +911,8 @@ static int cxd2880_set_ber_per_period_t2(struct dvb_frontend *fe)
 			       CXD2880_TNRDMD_CFG_DVBT2_LBER_MES,
 			       mes_exp);
 
+	if (!post_ber_rate)
+		post_ber_rate = 1;
 	mes_exp = intlog2(post_ber_rate) >> 24;
 	priv->post_ber_interval =
 		((1U << mes_exp) * 1000 + (post_ber_rate / 2)) /
@@ -929,6 +948,8 @@ static int cxd2880_set_ber_per_period_t2(struct dvb_frontend *fe)
 		goto error_ucblock_setting;
 	}
 
+	if (!ucblock_rate)
+		ucblock_rate = 1;
 	mes_exp = intlog2(ucblock_rate) >> 24;
 	priv->ucblock_interval =
 		((1U << mes_exp) * 1000 + (ucblock_rate / 2)) /
-- 
2.50.1

