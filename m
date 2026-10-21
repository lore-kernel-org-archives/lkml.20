Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573092;
	b=SA2My5NioCZsAcxhk2DC+xbAZybgUOXIDLns/NZgocNxQVAHyBOOjeFm9p2zWT+3+z98
	 ae6+dd6RUYFml+W+GxtDWzdhtS08o7xxjruv0Qs2uTRhbAnktVanS+NMIhZrGThrdEbo+
	 rXShOuEXZ901gfSpFtbcP/naDRx7xAdNlWB3C/6PLX2g84rPjS+t0KsE64AKTu92OP9Lb
	 Qx1xWI6EP7zxl1grvlDBMoeB3dkbgUK7tGZtINvWksDUD+RMscT90Hdsrtg4M5BXOqvJS
	 30RNi367/LPoGomXKrOirAP3PXZHVWOB6nJ2zZA15EuWhomwy4Ss31iQj2VLULn00cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q5XfVpN7VVz9w3E1kpowPrPGfkMuKV+ilfnKpbzYapA=;
	b=QDDienLC+nCZts2zyzmWhvafeUpWdrybz4c4molBmJFGg5NxYweaHDoJDRYDmm7QftKo
	 61eJ+SyCAimVXnXXm5b9vzYTCoCEn9JQkoKD74s8poyHoMy+penG5lckH+w7f1744QYmI
	 w36ZeTyXogPVV2Qyb2mna1SprHj2meRe4WT/bXb/zueAQ0rx+YgExwPeolhjx64wdgdnp
	 xSgTlW0LpP9+DFgr8p5/KlWEb7RipPHbRExbcF2ndbTYuTMNJUHxrly9MWaM3x7BC7Awi
	 hLMDetpl81Y8BJ9tBil7qwq/nNi/snqSFQeAyR8Ub5jqv5OM6h7zwzHmNmCwiHWAUpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGocis+G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCoii+IJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9213606A336
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9213606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGocis+G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCoii+IJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j1Pj3925772
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q5XfVpN7VVz
	9w3E1kpowPrPGfkMuKV+ilfnKpbzYapA=; b=EGocis+GJfmifeKt56tSqQ0eCmx
	RQgs+iGvdP4OXocWg4G5yIdKOme5wFr0HgqfK+KrBo3TdQ3o8gvKD6HeI8bhg2Q8
	IdhVdlWzPe5zsCy5K3Hm1+5xJwY/N71Yewr12FcA+hIt348V22a+cwfii/s6ZZPA
	PoXPY/npgkJ63Ij+T1avAvySceXgb3QIXZ+c02ENNsSjUN9bPtTfmZqm3HbTmX7+
	aSLiaSkFdiifZWOZ0V2ACAgEXxgliaPVOLaWS1FkxrzaT81NgwqPcY7sI5UuWfkF
	ZUoXgoOWPOmmDIiZ3nRvKsRQkeS2O3Qdirmywvz0OnqqAnGPzbD7FDtaSKw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2cpvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:58:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so114450785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573090; x=1793177890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5XfVpN7VVz9w3E1kpowPrPGfkMuKV+ilfnKpbzYapA=;
        b=OCoii+IJFnPFSUaX+VVi0wb1c7NGLWp/eV4gYEW2cyMgZYNFmcFdT0h7MNLaXX/zOY
         plODvMbLJjiVaMvTTczmUt3SGkFDV3r+LZuGfOo1FAXwQwif7X/7FA7azoNhG8QUP8J4
         xsVRBj4LwFgkuXv1y1O65Ac70wGDmxBd7Jjghq7/5RZQuqPPWqEIPBl1lHPqkF2S4qnk
         h40AkXpx1LlW8thpTDZuv33oLdo8AqCVx9XOTXiTiARRAFh+pGOwn9WJr4Ngmg/Vh8W/
         8n3dWyIAPEqyYN9Jo8A0/UooQE74O+T5HuEBzLzZKp2R8ANOyl6xm/oZ1QZV90dTGQ4p
         r5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573090; x=1793177890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5XfVpN7VVz9w3E1kpowPrPGfkMuKV+ilfnKpbzYapA=;
        b=Z2R0vV38lEu6voxEnBmYvHPJocvzPyFQSfK49O26Eoo+4UBMmQPvXCkhC6jrz4K1Oh
         8ldaNdY+U5p7VsvoZQTMegZL/FcJtzahTsLMmYnpeJhmUfVbHEPud0cU04wpXLXcrOvh
         kWNPmeH3hfLUG/7hsP5sPlLHhjVHltKrS376CI2z8LkrmVonp5VYt+BSDwTbbZ7E1GpT
         EJ0s7TXcP2JlmxwiPz5CgbxaAPz5gLgZXDWazIIyqzNL2053KFebjkuIbX0UjBdnliyD
         UqfEKKzZ/MUWsPXXY755VA6s6OORWY9IutLLWshbTofheuhygjfhd8YIXFSfrCreZR5e
         NyJw==
X-Forwarded-Encrypted: i=1; AKwUvBxmm4rUw6ZO6PxPiViNJ1el2NTi9ip2g6WDWnxlhzSacp2FjYvu5FdC4/66I6rrMbFeG/W1l9+XN3HJLKk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwGcBo3eH4gdQh6htsCqsOMWX0A/mDQAH2nGTkAkXqoacGKAx6
	jjnW16t22ggltFyI80dIJA3l3iGaqGeHS9TBQ+DzyPR8TqVJmPIuwnZ41yr4HaKUCFPmpO8Hz6A
	nOs2xcA2bAMVLx9Fi4p5ZR+JtvqnKQ/aJgDR5TDiyP4pjokm/XK0DdsniX8kiXK+p3ho=
X-Gm-Gg: AYBFou3Xufc620m49j9TpXCTyQK9iTGlaGHz75B0HcAJaGNeOSKqYR7kIfPWunXgGBP
	AeKjHQx4/N4J7Nsm6umsi3uYSo6gDfENfsQc57+tpFCJ7q3JTFBHnh7k2G450/Cpr8tHrKpxT4k
	JvrT9UmfeuYhJ7x9+bx6oUTXsosSa1O0/megXIM3Mx/NLhgk7O2KLdhPut8Er23knfBxitpgH3O
	opVzCroxOMAHS8o8oszTJYnby2W2mk/oHlnyF/9H/I9rha9p/F+J1lUJpwtYArmyEVMQQTb7a7+
	+BiCibWO9oHNT3YAoKMte49f55CmcggNwLz8LJO/WYS2icuOgb8Fg3T6oWfdRlLV/I4nUuC+L+a
	iHjkkjgjmWuZHZiR45RPHXZFt7g==
X-Received: by 2002:a05:620a:2688:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-93f4c99f2e7mr729419385a.39.1792573089706;
        Wed, 21 Oct 2026 01:58:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-93f4c99f2e7mr729416985a.39.1792573089271;
        Wed, 21 Oct 2026 01:58:09 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8d9e:b00d:491:1503])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258424bcsm4058401f8f.55.2026.10.21.01.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:58:06 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com
Cc: andersson@kernel.org, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
        linux-pm@vger.kernel.org (open list:QUALCOMM TSENS THERMAL DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] thermal/drivers/qcom/tsens: Disable hardware on probe failure
Date: Wed, 21 Oct 2026 10:57:48 +0200
Message-ID: <20261021085749.3786101-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021085749.3786101-1-daniel.lezcano@oss.qualcomm.com>
References: <20261021085749.3786101-1-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: Sxbyk-I0_SdMWEjrK_BLPdS8fX0fho2k
X-Proofpoint-ORIG-GUID: Sxbyk-I0_SdMWEjrK_BLPdS8fX0fho2k
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad87ea2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=u24PIR98rQV_9BJ0iLUA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX7JS+NBKOETty
 WL96YpZB+1hI1LN8ea3HJCoEpBlDTqGnqBXNpTZf3IyIB6M2NfTHFc/U+BfYtm5DxEZ7bWFOZRQ
 FRka02k+0YXiGTKfp9yFncm9gces+Bk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX1+myi2gJGxeG
 NGvIxBRpzyhhK592qYIfj1CYseynnDr64kv4J5mkoWnlhTegBnGSYegJWRsDSJSNlRTFDOdtOFx
 fZUOJjeVGJexeRnmF/kU6p4hcZ/SXDC5vU9R161oXTk7o0ZwXBiBSygCcczQuA8mkJFSVmKarcC
 JwwqU6BbgAZ7TYCGBnR1gXlL2r2U7kHCxDKqrGau5JqNXgXRBuNHWQ29whtfBmFsglm2uHkNzzL
 PRtfXDhbMnv+44l1czDhaRnmiRY0sU13ANmkHZ8oh6H0OmXsMI1P5etvwzWA2xgQ7uUtWeca/Kq
 u/eyxNOt8ubl8QBrcWDXHtldnFJtIZA1V3NQs2ylJC7orgLS0r68gPD9NalX+GHdAliOhbR9vNI
 4suW6Oz0tFMPYCp3b8C0ghYsczDPCdE0VBLOBh5ZN1Q2E1Ifl/Se0S6BRiF1GKFX3/L23SvA+kb
 3AjJas0ZpaYLcvznCGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210035

Hardware initialization enables TSENS interrupts before calibration and
thermal zone and IRQ registration have completed. If calibration or
registration fails, probe returns without disabling the hardware. Devres
then releases any registered IRQ handlers, leaving the interrupt source
enabled without a handler.

Factor the hardware shutdown sequence out of the remove callback and
invoke it when calibration or registration fails after successful
initialization. Disable hardware interrupts and call the optional sensor
disable callback before devres releases IRQ handlers and register maps.

Fixes: 634e11d5b450 ("drivers: thermal: tsens: Add interrupt support")
Closes: https://sashiko.dev/#/bug/linux-4b873699-7a0d-46e9-b768-169916c70d1d
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Amit Kucheria <amitk@kernel.org>
---
 drivers/thermal/qcom/tsens.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 9134637a3458..57d71159bd4b 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -1374,6 +1374,13 @@ static int tsens_register(struct tsens_priv *priv)
 	return ret;
 }
 
+static void tsens_disable(struct tsens_priv *priv)
+{
+	tsens_disable_irq(priv);
+	if (priv->ops->disable)
+		priv->ops->disable(priv);
+}
+
 static int tsens_probe_common(struct platform_device *pdev)
 {
 	int ret, i;
@@ -1450,15 +1457,22 @@ static int tsens_probe_common(struct platform_device *pdev)
 
 	if (priv->ops->calibrate) {
 		ret = priv->ops->calibrate(priv);
-		if (ret < 0)
-			return dev_err_probe(dev, ret, "%s: calibration failed\n",
-					     __func__);
+		if (ret < 0) {
+			dev_err_probe(dev, ret, "%s: calibration failed\n", __func__);
+			goto err_disable;
+		}
 	}
 
 	ret = tsens_register(priv);
-	if (!ret)
-		tsens_debug_init(pdev);
+	if (ret)
+		goto err_disable;
+
+	tsens_debug_init(pdev);
+	return 0;
 
+err_disable:
+	/* Stop hardware events before devres releases IRQs and register maps. */
+	tsens_disable(priv);
 	return ret;
 }
 
@@ -1502,9 +1516,7 @@ static void tsens_remove(struct platform_device *pdev)
 	struct tsens_priv *priv = platform_get_drvdata(pdev);
 
 	debugfs_remove_recursive(priv->debug_root);
-	tsens_disable_irq(priv);
-	if (priv->ops->disable)
-		priv->ops->disable(priv);
+	tsens_disable(priv);
 }
 
 static struct platform_driver tsens_driver = {
-- 
2.43.0

