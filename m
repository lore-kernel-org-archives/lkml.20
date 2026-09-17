Received: from out28-149.mail.aliyun.com (out28-149.mail.aliyun.com [115.124.28.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8D94FECE8;
	Thu, 17 Sep 2026 12:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648391; cv=none; b=SgVwThHFsxCjKaepSzeIj/mOMqKUTh1QvBDA2rPjw6Aaeh0FgfandIsrc58UtREUQrSa855pSSWUD6mG1nXeBK78ktnAaz772de14tXEVduxIQV3/Bu2LltVxw3Tly89aGwan379fBqhZEkDI5Gw3pArCdvg1GKbsPnht24JVv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648391; c=relaxed/simple;
	bh=jdm86M64n1ZcxblVYRzW/NuH7DbePW1tXe1IB/t+k4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VxC23zwfAu+QCwSJaCl0psTQZbeywlsgJhkfuX8ghVlxC7MGIUYNKruqub4ldcHV+JXWE7EU6g7PZQPSDlbB/XAMxykZdSc9ikIkAJqDyHXGSjbjPwy/SHA4lHAd12AV6pM0+4sE3jeSZwvyxTn3xi0CziSg61aD0g6OForuB20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=iDPO0nke; arc=none smtp.client-ip=115.124.28.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="iDPO0nke"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1789648370; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Q82OYollObWm67IPSAanYVmrohcoRcM5/CpBwrSvvBg=;
	b=iDPO0nkeCqgnkDRPCq+BIK4GKKPuEepYfco+0SxV5OGZwXzXpV7qAk5/PHajdwoKRlOGaIbFRpU/rtnJLs/hsfQaxZYXF/SvWeE+IGL0AiPFijSGji/vCVC1npgok3rXSGN2l76pX3FfRwrm/oxpEd4wA2q3QxP11HnL5idgmig=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.2457708|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.181083-0.00379412-0.815123;FP=563135344168207796|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037025160;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.jFtbbkP_1789648368;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jFtbbkP_1789648368 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 17 Sep 2026 20:32:49 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Chao <liuc63@xiaopeng.com>
Subject: [PATCH] media: tda10086: avoid division by zero in set_symbol_rate()
Date: Thu, 17 Sep 2026 20:32:48 +0800
Message-ID: <20260917123248.3769340-1-guozh23@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tda10086_set_symbol_rate() derives the decimation factor, the
anti-aliasing filter setting and the BDRI register value from the symbol
rate that userspace supplies through the DTV_SYMBOL_RATE property. That
value is never validated, and the BDRI calculation divides by it:

	tmp = (1<<dfn)*(symbol_rate/1000);
	bdri = ((32 * (SACLK/1000)) + (tmp-1)) / tmp;

SACLK is 96000000, so any symbol rate below 1000 makes symbol_rate/1000
evaluate to zero. tmp then becomes zero as well and the division traps
in the kernel.

Reject symbol rates below 1000 with -EINVAL before the divisions. That
matches the precedent in stv0367cab_set_frontend(), which carries the
comment "protect against division error oopses" and rejects a symbol
rate of zero for the same reason.

No Fixes tag. The calculation and its missing validation both date back
to the original driver import (9a0bf528b4d6, 2012), so there is no
single commit that introduced the problem.

Reviewed-by: Liu Chao <liuc63@xiaopeng.com>
Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
---
The divide is reachable from any DVB-S userspace that issues
FE_SET_FRONTEND with a small symbol rate via DTV_SYMBOL_RATE; no
hardware-specific condition is involved. Verified by code inspection
only - reaching set_frontend at runtime needs a tda10086 based tuner,
which I do not have.

While preparing this I checked how the other dvb-frontends drivers
handle symbol_rate. mt312 and stv0299 only compare the value and never
divide by it, stv0910 checks the range and returns -EINVAL, and stv0367
rejects zero explicitly, so tda10086 is the outlier here.

 drivers/media/dvb-frontends/tda10086.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/dvb-frontends/tda10086.c b/drivers/media/dvb-frontends/tda10086.c
index d43d0eb73..c76d5fc25 100644
--- a/drivers/media/dvb-frontends/tda10086.c
+++ b/drivers/media/dvb-frontends/tda10086.c
@@ -296,6 +296,11 @@ static int tda10086_set_symbol_rate(struct tda10086_state *state,
 
 	dprintk ("%s %i\n", __func__, symbol_rate);
 
+	if (symbol_rate < 1000) {
+		dprintk("%s: symbol rate %u too small\n", __func__, symbol_rate);
+		return -EINVAL;
+	}
+
 	/* setup the decimation and anti-aliasing filters.. */
 	if (symbol_rate < SACLK / 10000 * 137) {
 		dfn=4;
-- 
2.50.1

