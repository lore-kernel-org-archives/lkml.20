Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D883470440;
	Wed, 14 Oct 2026 06:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960823; cv=none; b=qytxWHJrky1Db2iA5/wz9RGa4aFyo4fJhw2wMt0iBdGz6OnD+FBLHjFD7uRvxk/EoooPqs4ymYpe4Ze0hk6dZmXdLXrtmMEy5exsH4jpDTvLTJDO0+BaIuimWkkwM4FyVVF8DKoNrk4+/vDwJ5HqNCeEgf+2jB8f+EWbQxgBqJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960823; c=relaxed/simple;
	bh=vUhnZUtdmLV9q06YA7VkscacArSwV5TONeRE7br2Tcc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FvQz4PRMI8pqaOFo/GX0Os8YJdLKUNuHRHd+H3TLBQCqlzSpStsLjpToXNlH8Ch0WoYywx1bVbZfs2WNtEXhot+H0X2OSkw+ex721srV7tgvwI69G7sMhX9MOMCY/ShpWMMsm5XgRn3s0wlCbjju9ihcPJDvM0R1wz4yzUfyaxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBXHFm77; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBXHFm77"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E1KTUl3018226;
	Wed, 14 Oct 2026 06:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=76x5BANBRdx+TLukl/w886xv7sRQ4xFdFFo
	8W5Qasz8=; b=QBXHFm77fbt9/1kVh1B5B78Z6QZnnUNesJsELBTr2NmxswNUQ8Z
	JQo7wUNTKTtknwUsVi2XgAkKGVtKhczQKPBGMCdQoxJ6Vr4cPtzE+1SU0tjEPqsm
	AiLXi60CqLzYym+wlserUEToxXjv3otjdUnRSW9CVB70zGNrHi8xRGNf6RxdeZQJ
	Bmc6vo5r1Y/rn8NDxickAd2s9Ye3SWxu8Z2/lLrxf8QDrxEtA+DblDjvCP77Tcwl
	8CH1aWDorWfF/OPOTTyrgV9IDlfDCOj6UENJbfXSYsHWpd+xW5MWpsGUtRL9A28H
	2j/Tkl9Uaq2qCHG4qzpxtj9eH2kFk+sl4Tg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b2w78-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 06:53:26 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6rOtL3699658;
	Wed, 14 Oct 2026 06:53:24 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 69E6rOxm3699644
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 06:53:24 +0000 (GMT)
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 2239420B2E; Wed, 14 Oct 2026 14:53:23 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Support Opensource <support.opensource@diasemi.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, srinivas.kandagatla@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v1] ASoC: codecs: da7213: Get MCLK in I2C probe
Date: Wed, 14 Oct 2026 14:53:21 +0800
Message-Id: <20261014065321.740850-1-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf26e7 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=zcUq8rBnXXZ2IMOIndQA:9
X-Proofpoint-GUID: 1AfuzB3xtLKn_FLN4_nn_jyrTGRN90zj
X-Proofpoint-ORIG-GUID: 1AfuzB3xtLKn_FLN4_nn_jyrTGRN90zj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX5se+Ajvu1PTT
 A/q+fL2hgHcH2S2txTmTkJMaT8b1M20PxNilYAxICr4enqhopuJqMXtfWt2l69lmKo1eE6mXGch
 DtSRNeyAza1kGOmW2Kg20PEy4dGUuLPRqaslw/pPPjx0kMQKey8sgmcXu6Xv09TCWYg5DiR7UNw
 ZHSv8MFzudHqF96K4RImoKoQlxmK8fvnITHCEVTz7/gIYu1RHTBkQJ1D807FE3rMvEOBgCOhhLx
 xm0CshOqjhlQ9rVCiDHqh+73Twm6rLQtIXI7/Cquf0RPP5mRJtlp/bcCZWFOwiJmwHln8Lmt9AK
 AASH48oVODlYtnUc2M6jKT5BoOlZE8j0u+h+SSamvfOqEIgH2LW0cQvtWTfE7qbkmg+YA3j/Wlg
 0VhJ9fzGEr8P6UEe/IicUgRwzMakwU2qK+367w8LQ7in7KOZTtyWDWfCI39rUQWIVtBf1MWGWNx
 VMiz76KL6BscXngO7mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX/1w4QhBNnc4j
 Uc6Ouw/eV1VlD6vG+3QGIyDwIbDherIM0J+71q42B2FNgO3VZxEXhdhe8IBjzm9H3PnQVbXkmRy
 b8DchJqT1omURSpr80G2GL2bSkSYwUE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140027

With deferrable card binding, a card that fails to bind is retried only
when a new ASoC component is registered. da7213 requests its MCLK in the
component probe callback, so if the clock provider registers late, the
card bind defers and the provider's later registration never triggers
a rebind, leaving the sound card unregistered.

Request MCLK in the I2C probe instead, so a missing clock defers the
codec driver probe through the driver core before the component is
registered.

Fixes: 42d99857d6f0 ("ASoC: core: Move all users to deferrable card binding")
Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 sound/soc/codecs/da7213.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 923b997efbc4..4990feaa8259 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -2091,16 +2091,6 @@ static int da7213_probe(struct snd_soc_component *component)
 
 	pm_runtime_put_sync(component->dev);
 
-	/* Check if MCLK provided */
-	da7213->mclk = devm_clk_get_optional(component->dev, "mclk");
-	if (IS_ERR(da7213->mclk))
-		return PTR_ERR(da7213->mclk);
-	if (da7213->mclk)
-		/* Do automatic PLL handling assuming fixed clock until
-		 * set_pll() has been called. This makes the codec usable
-		 * with the simple-audio-card driver. */
-		da7213->fixed_clk_auto_pll = true;
-
 	/* Default infinite tone gen, start/stop by Kcontrol */
 	snd_soc_component_write(component, DA7213_TONE_GEN_CYCLES, DA7213_BEEP_CYCLES_MASK);
 
@@ -2229,6 +2219,19 @@ static int da7213_i2c_probe(struct i2c_client *i2c)
 
 	mutex_init(&da7213->ctrl_lock);
 
+	/* Check if MCLK provided */
+	da7213->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+	if (IS_ERR(da7213->mclk))
+		return dev_err_probe(&i2c->dev, PTR_ERR(da7213->mclk),
+				      "failed to get mclk\n");
+	if (da7213->mclk)
+		/*
+		 * Do automatic PLL handling assuming fixed clock until
+		 * set_pll() has been called. This makes the codec usable
+		 * with the simple-audio-card driver.
+		 */
+		da7213->fixed_clk_auto_pll = true;
+
 	pm_runtime_set_autosuspend_delay(&i2c->dev, 100);
 	pm_runtime_use_autosuspend(&i2c->dev);
 	pm_runtime_set_active(&i2c->dev);
-- 
2.34.1

