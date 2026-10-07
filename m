Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6939483BC8
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363849; cv=none; b=beEsfITkrwmfOWidRbPetGoISfUHYsqLtcrv8RzgHFfhdjMEKdZfji/iXONUDmPHEqN4ggqDRFhlOB/sKtutwd/AzNMUvFLjZXKWCFXtNGYqbV2+7uKQCaeYkJNTiy4Wn8Xj9YHOQHFMPF0cup0x3mohuocb4xsXujenedlIJtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363849; c=relaxed/simple;
	bh=2t5J73v/MouUPPv8BeanhmSwIres2KIrufqDwmaCcNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oZhk6wc9yOpiU0O5c55T2q/DTjKkAFSz3ktdV3Flyz+e49MskV5JNWeD2rV0U6v7SEAbbFdjJwBLqhBfp9jnB+12n3NDQk1PVcBgcnjmJSbCeHgh9vRbgqdzSCe/J3qLxzrQkhTBN17EEc5476kTHrNi1794Fp/F0f50Kvrv7rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dgsd9qfW reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dgsd9qfW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jgA22969756
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S6xUJpnqHpK
	MXNveefo1cXTh1FFN6M8v+59Kiz3wW9c=; b=dgsd9qfWx9SnE3hFg8if1gsUaiI
	FxBFQmXS89S9453q1rnYyj5PH4+dtPJfAwEih6koE6l5x7JujH2TG61d4gueOrEO
	Tyz1gygpZXGdKrmbnZabHsnQsmcvIifWzdcsgW88NTrw/WEjHBZWntw8fUstcAy4
	j876X8n6gjyfMR28GFagVdlYMgVG1v/psQ6RqRooLt5OuTYYED+syRou98Ml6RtY
	p+KrOm4DHVDE6FrOMoDKHACx8IpNg3ngHa3IrH+7lF7V5VoEijpXvxGeGveMrqls
	3bPlDT/fp/Vli54tHkaqN8zjhG/ePGimYcDwOYCpv8rTDw/j2ESleM8rt2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c679c1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:03:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ae8e7e546so726875085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363787; x=1791968587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6xUJpnqHpKMXNveefo1cXTh1FFN6M8v+59Kiz3wW9c=;
        b=Lfwze5//sYz7/dCCDnlzb6YB2govRKXxDn/2P1p+3Y9l8g9MW5dKUOuocxZLaBxR+o
         UFgcbsTCllsIQSspHh2sydsaXa7pUtK2us9csfTImclc62XOAK7rRp/VCsO0BsC0D+zW
         S+EG+Lm1oZekVcd6Wz3lFMP+bcgqdYrLZkQWsvwn3E9zlus4VCbeGyR4eGfTI5C4rGIw
         RUvMOItmhePUlM+nHMR5NEk7YMik0/6k8yGrRZFk/1zt3Zy4wj7mxP7hnZ/wE5KG+2Ty
         Pf9Wkx6TRjEZ18TzTm3trCjaryelUZ5Fur5tlMh6vyNpWuvJExYIlOzfPzH8Z5uD4KRu
         Q5nQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnoh/5bO8sY8P30G9BS6rgoSObjen4M0e+oVJfd5j4ffeBOb5f3FyEsDcRTP6c2PVGnfEB5WGddDjCCnM=@vger.kernel.org
X-Gm-Message-State: AFuF++kJoPjjXp340Hn8EBWgr7KizcvvACVkJBfyPKEEqj0nhEvf/+El
	2m3rETYa6w7beDovXNX3l49XMBRfjq6KvqvOvwdCaE+6tIkdf5LvP3JtBK7HlbFVIExmikoUAEt
	GgYY5GBDGeADfDvjtU2KiHja46oNM2d5zh3vM50MypZmft2/2FR0gYI+uVvAJAQB6bDA=
X-Gm-Gg: AYBFou2E1iDDTqtPes35cZoMGRckRStnX56u9fn8sGizqQm2zszL9FgmMdOsOIGN3dd
	QBlKRuyXxWwDOdsVXSf0DY1fGOw5LWol2yHT9J5lhM+Vo5P+N66Tx0Mx6m+FV+vsm6SSSyNOmx7
	XWmC7xh+Q/GxWa6CI5T6DbMu3XbybLzVmDpeCjgAzoGiBoXX99TQcwQivjON8r49vz27BwxYFRy
	8xv1oYH6Izs7IRgEO3RXf/MVwgqIR804rmZujuXC2rR6omuRMDgWkJjw3JBe4i5ZRgp6HoHUTAc
	nLVUHTbQmZBCxPE2mtGEA/bi3RBxipOFOzhmtvC3hCL8rSPyFP1Aplp8IjE=
X-Received: by 2002:a05:620a:40c4:b0:93e:71b8:584b with SMTP id af79cd13be357-93e9b74e2e1mr290687585a.34.1791363786730;
        Wed, 07 Oct 2026 02:03:06 -0700 (PDT)
X-Received: by 2002:a05:620a:40c4:b0:93e:71b8:584b with SMTP id af79cd13be357-93e9b74e2e1mr290673585a.34.1791363785583;
        Wed, 07 Oct 2026 02:03:05 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:04 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 41/45] media: qcom: camss: create TPG links for IFE
Date: Wed,  7 Oct 2026 12:00:37 +0300
Message-Id: <20261007090041.3732717-42-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXzPVEnX5Maooi
 m67oJFvVN8iu3zz8UYd+E0UQRAmE5TQfb63BGxPKt/5bboJvPDYnjBt0vNPl3IBATlhGNSQ92l8
 6h8Gtzes3JsL7ic09u6Si40kcF1+GA8=
X-Proofpoint-ORIG-GUID: msFvt7wPveEbXk8mecIuRc-ka9jF8__b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX4zCO7akeGX5r
 1yYZIy61A6MTSV50bnAujJzkJBkg0cHPvVhoywYYEFC0ocjeDrLtZj/SprXuISAvu12yzll0ig+
 g3/lk+09P7AstZ8fvuzpp3Eqo70DiiVbmhTm4bL6d1OTPrJ4WLyp6RJketpYLqIi49J2o7/JAMO
 w7hN1X7rCGeSQBES1X/zVbJTfRRFMY1pnUsQDfarzZOY1HmvQ/ZRYNNJulXyZm7P8WZhSCKrYc0
 39ekwJDRklpkmm70BAAdyiTo4PzHFfKt9181MaJbOQ2JdFUbDat89AZfEQ4H1ElQOkXD5V5zW9d
 KABD3niwjVN94XOMFi9LY5Jughr0eHhHAQdWvoblNgFpUiOk/u8mFEOEEfcREuZMlKQuDen0du/
 gRBlu/3TcJ1lvfUcnMWiwwwFpmM29XteWq11QUV7w/060tNaTS6lLlasyaW1kfx2oEFQ6G2jXd0
 S20F9X1NsXKi3GlMukg==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac60acb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=Edoj-RGbKjCKvmuEXRoA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: msFvt7wPveEbXk8mecIuRc-ka9jF8__b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

The IFE topology uses its own entity-link callback. Create TPG-to-CSID
links there so a TPG can feed the IFE pipeline.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-ife.c | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ife.c b/drivers/media/platform/qcom/camss/camss-ife.c
index e2049e00ea96..ab6102fd1126 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.c
+++ b/drivers/media/platform/qcom/camss/camss-ife.c
@@ -12,6 +12,7 @@
 #include "camss.h"
 #include "camss-csid.h"
 #include "camss-ife.h"
+#include "camss-tpg.h"
 
 #define CAMSS_IFE_PREFIX "ife"
 #define CAMSS_IFE_IRQ_NAME "msm_vfe"
@@ -1574,9 +1575,28 @@ int camss_ife_subdev_init(struct camss *camss, struct ife_device *ife,
 
 int camss_ife_link_entities(struct camss *camss)
 {
-	int ife_id, csid_id;
+	int csid_id;
+	int tpg_id;
+	int ife_id;
 	int rc;
 
+	for (tpg_id = 0; tpg_id < camss->res->tpg_num; tpg_id++) {
+		for (csid_id = 0; csid_id < camss->res->csid_num; csid_id++) {
+			rc = media_create_pad_link(&camss->tpg[tpg_id].subdev.entity,
+						   MSM_TPG_PAD_SRC,
+						   &camss->csid[csid_id].subdev.entity,
+						   MSM_CSID_PAD_SINK, 0);
+			if (rc) {
+				dev_err(camss->dev,
+					"Failed to link %s->%s: %d\n",
+					camss->tpg[tpg_id].subdev.entity.name,
+					camss->csid[csid_id].subdev.entity.name,
+					rc);
+				return rc;
+			}
+		}
+	}
+
 	for (ife_id = 0; ife_id < camss->res->csiphy_num; ife_id++) {
 		for (csid_id = 0; csid_id < camss->res->csid_num; csid_id++) {
 			rc = media_create_pad_link(&camss->csiphy[ife_id].subdev.entity,
-- 
2.34.1

