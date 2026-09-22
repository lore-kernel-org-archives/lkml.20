Received: from out28-50.mail.aliyun.com (out28-50.mail.aliyun.com [115.124.28.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630F04F85B5;
	Tue, 22 Sep 2026 06:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059879; cv=none; b=BHUVYIEefCGHsEOwuTHoz2CpIXYczfz5ptXKr0s50fsmfQCtq6L/Gmwf/aeR+g928T54YgQFJwOM/Tw3/SSv1pXJEFgDMqB7n9IWPh9Buf1EvJjyz1tBhuMh7pG6i4zORCwiIoNjfDx0PxVcFowbATNi+g/9Vh37sFR2eZGFc9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059879; c=relaxed/simple;
	bh=/ty1ePo4W2yISYqRXNT4eJIGaYbPOebph0CAfFh9nJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACktOCt0bCi8MX8jHb5KuxQ2V1F2rBdYDYp5m+pPvgUhjU59KlTSB0NVU3dyE+FV+dzFCRKXFd9duVy7gQQayz8zxkD1EHCV6FjMfhoECGc8U4C847197BefKT46UylNbi2+TjNMioCR4RliI13b4CpY2o1CG9ltU/9BJ9AlDHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=R+db2hry; arc=none smtp.client-ip=115.124.28.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="R+db2hry"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1790059873; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=4i1KWLthrOJ5LDnOzyfS5ySdwxH1FrB1Gdw+GVzlt+4=;
	b=R+db2hry818ZgWsfvWMy4+tNvxmA4bAEk73+LhpAqIvSjCvsA3KqVptPDMlcbcunkTOEt8pCOWlNTY1gpT82E6p9CGvYHapHsGR9XgNrcPmyX2LNu/iUfVfv8fOtLM5FcPx/efiMOdnI414cGWw61jRjBZQq/CzDYE3sc3/VFrw=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436618|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.261503-0.029018-0.709479;FP=5703186724990561350|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037026024;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---.jJhTL5S_1790059548;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jJhTL5S_1790059548 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 22 Sep 2026 14:45:48 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Chao <liuc63@xiaopeng.com>
Subject: [PATCH v2] media: i2c: vgxy61: reject out of range MIPI CSI-2 lane numbers
Date: Tue, 22 Sep 2026 14:45:47 +0800
Message-ID: <20260922064548.844609-1-guozh23@xiaopeng.com>
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
clock_lane and data_lanes[] are used as-is. A num_data_lanes of 4 with
an out of range index in the last entry, for example
data-lanes = <1 2 3 99>, passes the count check and then writes
phy2log[99]. v4l2_fwnode_endpoint_alloc_parse() does not constrain them
either: the only use of clock_lane in v4l2-fwnode.c is a BIT(clock_lane)
duplicate check, which does not reject a value that is merely large.

Reject a clock lane or any data lane that is not below
VGXY61_NB_POLARITIES, before the maps are built.

No Fixes tag. The arrays and the indexing come from the initial driver
import, 153e4ad44d60 ("media: i2c: Add driver for ST VGXY61 camera
sensor"), and have not been touched since.

Reviewed-by: Liu Chao <liuc63@xiaopeng.com>
Assisted-by: LLM
Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
---
v2: add the ST VGXY61 maintainers to the recipients.

    Correct the note about the lane index range and about other drivers.
    The indices are unsigned char in struct v4l2_mbus_config_mipi_csi2,
    so an endpoint value is truncated to 0-255 rather than passed through
    as a u32, and the comparison now points at vd55g1 and vd56g3, which
    check clock_lane before building the same kind of map, rather than at
    an unrelated change in this file.

    Add the Assisted-by tag.

The lane numbers come from the "clock-lanes" and "data-lanes" properties
of the sensor's endpoint node. They are read as u32 by the fwnode helpers
and stored in unsigned char fields of struct v4l2_mbus_config_mipi_csi2,
so an endpoint value of 99 arrives as 99 and anything from 5 up writes
past the five element arrays.

The binding allows data-lanes 1-4 and does not mention clock-lanes, so a
correct endpoint does not reach these paths. The checks keep a malformed
endpoint from writing past the arrays, in the same place the lane count
check already sits.

vd55g1 and vd56g3 build the same kind of map from the same properties and
check clock_lane before the map is built; here the log2phy[0] != 0 check
runs after the write to phy2log[clock_lane].
---
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

