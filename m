Received: from out28-195.mail.aliyun.com (out28-195.mail.aliyun.com [115.124.28.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399581A680B;
	Fri, 18 Sep 2026 06:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789711439; cv=none; b=fyMi4gdMHzHxzx5f3TO3x9247x3dnwcUx8Kj/4ZpApEqUzmTrbktap+ixI//17jYdQ4+g83wM3U9kn2xLsUu8Vwzvj79ffLDjM/pOpZtkDSn1tiEy0e4nVL6VZsBAJXLInnnhe10qyYp6KVfE26yqxFLpbxfVHZzY3+8p0siMB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789711439; c=relaxed/simple;
	bh=m12oV/qbHe0k+fhE6WunLLWrTILIoe2+ymCvPGNvHbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kgwvnodjr0JHpx3PdG9KnvHNu+UFM9uzvLMVEDTSj9F6rmjIJs9RHEz0jUpq+aeXrf0uRAB4HbrZeuEJCRpQm2SEiiTxIObjQzaj26Z84C/sc5trDmLx8w5qc64h7taPtwEvJNvLIZru7BWWoYo/m1nOMl09/m5b7KxsF8IWpb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=Da6kmjy1; arc=none smtp.client-ip=115.124.28.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="Da6kmjy1"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1789711433; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=rWq10pqqosi/sjq7XgPLVJ0kZKsNG1BwJJnmrCMR4Ik=;
	b=Da6kmjy1ioDQCl4modquBwMIvLbJ9dv8G39V3CDY2jHoT0deXH3aG4/kq0dPNl2Hd4NZYg8yzwfxzdheMtJziFSTOZ4NOtx2A7fZlmrb/riAot/EzamA6NWCaRaS7b+T9jxnTViUdFkFXDY2nShjHV3yU8tM3nv0l8PQesO7pwc=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07439084|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.36421-0.158334-0.477456;FP=5127288922640715334|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033023018039;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.jGTYvIj_1789711432;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jGTYvIj_1789711432 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 14:03:53 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Chao <liuc63@xiaopeng.com>
Subject: [PATCH] media: i2c: vgxy61: reject out of range MIPI CSI-2 lane numbers
Date: Fri, 18 Sep 2026 14:03:52 +0800
Message-ID: <20260918060352.1879381-1-guozh23@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vgxy61_tx_from_ep() builds the log2phy and phy2log maps straight from the
lane numbers in the device tree endpoint, using them as array indices:

        log2phy[0] = ep.bus.mipi_csi2.clock_lane;
        phy2log[log2phy[0]] = 0;
        for (l = 1; l < l_nb + 1; l++) {
                log2phy[l] = ep.bus.mipi_csi2.data_lanes[l - 1];
                phy2log[log2phy[l]] = l;
        }

Both arrays hold VGXY61_NB_POLARITIES (5) entries, and neither lane
number is checked against that, so an endpoint with a larger value
writes past the end of the arrays on the stack.

The endpoint parsing just above validates the number of lanes, but not
the lane numbers themselves: l_nb is checked against 1, 2 and 4, while
clock_lane and data_lanes[] are used as-is.

v4l2_fwnode_endpoint_alloc_parse() does not constrain them either: the
only use of clock_lane in v4l2-fwnode.c is a BIT(clock_lane) duplicate
check, which does not reject a value that is merely large.

Reject a clock lane or any data lane that is not below
VGXY61_NB_POLARITIES, with the same dev_err() and goto the lane count
check uses.

No Fixes tag. The arrays and the indexing come from the initial driver
import, 153e4ad44d60 ("media: i2c: Add driver for ST VGXY61 camera
sensor"), and have not been touched since.

Reviewed-by: Liu Chao <liuc63@xiaopeng.com>
Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
---
The lane numbers come from the "clock-lanes" and "data-lanes" properties
of the sensor's endpoint node. Both are read as u32 by the fwnode
helpers, so a value like 5 or 0xffffffff reaches vgxy61_tx_from_ep()
unchanged.

For a module built into a device whose DT the machine owner controls this
is not a trust boundary, so the practical impact is a malformed DT
corrupting the stack rather than an attacker escalating. It is the same
class of fix that the driver already applies to the lane count two lines
above, and that other CSI-2 drivers apply to their lane numbers.

dab65dfbf9c8 is a recent example of this file taking a defensive check
for input it cannot control.

 drivers/media/i2c/vgxy61.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
index 3fb2166c8..ed1205cc6 100644
--- a/drivers/media/i2c/vgxy61.c
+++ b/drivers/media/i2c/vgxy61.c
@@ -1457,9 +1457,20 @@ static int vgxy61_tx_from_ep(struct vgxy61_dev *sensor,
 	}
 
 	/* Build log2phy, phy2log and polarities from ep info */
+	if (ep.bus.mipi_csi2.clock_lane >= VGXY61_NB_POLARITIES) {
+		dev_err(&client->dev, "invalid clock lane %u\n",
+			ep.bus.mipi_csi2.clock_lane);
+		goto error_ep;
+	}
 	log2phy[0] = ep.bus.mipi_csi2.clock_lane;
 	phy2log[log2phy[0]] = 0;
 	for (l = 1; l < l_nb + 1; l++) {
+		if (ep.bus.mipi_csi2.data_lanes[l - 1] >=
+		    VGXY61_NB_POLARITIES) {
+			dev_err(&client->dev, "invalid data lane %u\n",
+				ep.bus.mipi_csi2.data_lanes[l - 1]);
+			goto error_ep;
+		}
 		log2phy[l] = ep.bus.mipi_csi2.data_lanes[l - 1];
 		phy2log[log2phy[l]] = l;
 	}
-- 
2.50.1

