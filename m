Received: from out28-170.mail.aliyun.com (out28-170.mail.aliyun.com [115.124.28.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F104A499F;
	Fri, 18 Sep 2026 07:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717026; cv=none; b=gKtB4lNlrjz7WMPoTzOd0z73FIhcyq8N5U+ouCWEiOEYgUN7jbg9YzyoLjcrmHUXqowVKPpDB5zGcMv/5cLHXvG8HXiRomnG+U9IcyPdDPWIguy1fG3h38bqtbwuSdYqmcwk3LFiqj9R/+SoLM5aAmwmjo0Oqa3+4zOIm6WIIMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717026; c=relaxed/simple;
	bh=cUWstaeGwku3y+mNwP8Zbj5FEKwQF4W8F9lbpUxHVWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4kEF6TSduVaY9lIZqcVMsM8Vh732xdhMiw8TMy923Sv7LSGG+0F7GfqhWSjAY+BXLd6C55zApODWTA4EGwGpzDAxPeKsUtupCbk3ZDpDJOT08C9walimfMNOGVqNuXG94vE7YZm/DTdL2OtzXOmvYk/LNAYvT1Du266otqTPBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=GfU3szXX; arc=none smtp.client-ip=115.124.28.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="GfU3szXX"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1789717005; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=rHkq8P0Rsotj9rlq0CnLBJP5r/SuFaOTVptEkxiJifs=;
	b=GfU3szXXMuNGpiMBvzNadgIzG/nzFQeOL8qxtaBaFcxTUsVZRt3uwZDkHaDqzluEFK/gHFEdQ5SeaePqZmYxSTXEib3ekeAGovhIdgsLnPq5OBRF98QxD+DOxXzRbBkLLTB84dh7iRKc2nwtOupJGwKLN1Wuqyj/z4ZA3SKUHHE=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.0751052|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0396591-0.00202204-0.958319;FP=13502539487106319489|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083013073;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.jGaCMIs_1789717004;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jGaCMIs_1789717004 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 15:36:45 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Chao <liuc63@xiaopeng.com>
Subject: [PATCH] media: cxd2880: avoid a division by zero in the BER period setup
Date: Fri, 18 Sep 2026 15:36:44 +0800
Message-ID: <20260918073644.2569196-1-guozh23@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cxd2880_set_ber_per_period_t() and cxd2880_set_ber_per_period_t2()
compute the BER measurement intervals by dividing by the pre/post BER
rate and by the uncorrected block rate, all of which are derived from
values read back from the demodulator registers:

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
division below it traps. That is a normal state for the registers, not a
corrupt one: the field is zero before the demodulator has locked, and
the DVB-T path (cxd2880_set_ber_per_period_t()) has the same shape with
ucblock_rate as the divisor.

Clamp the rates to 1 before the divisions, in both functions, so that a
zero derived from the registers produces a large interval instead of a
trap. The stored intervals keep their meaning: a rate of 1 is as far from
a real measurement as a zero rate, and the entry points can be reached
from FE_READ_BER and FE_READ_UNCORRECTED_BLOCKS before any lock.

No Fixes tag. Both functions came in with the driver, 9593810cd42a
("media: cxd2880: Add top level of the driver").

Reviewed-by: Liu Chao <liuc63@xiaopeng.com>
Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
---
The values come from cxd2880_tnrdmd_dvbt2_mon_active_plp() and its
DVB-T counterpart, which read the demodulator registers, so the rates
depend on the state of the tuner rather than on anything userspace
supplies. Reachable through FE_READ_BER / FE_READ_UNCORRECTED_BLOCKS.

intlog2() is called on these values as well, and it warns and returns 0
for a zero argument, so the clamp keeps that call meaningful too.

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

