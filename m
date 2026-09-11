Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4024D3F58EA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107756; cv=none; b=VqXO2HjpMbkFYpMhKwRkqdFkBY40/xRsdRuwvTxbltY83X6VUTuvoUXOPn17y2OV31Nw+TtXyPFdd/NpZuCI5rSKLiWrDwzx5amAeg7wWGZiio1Vdtr/TFl+AmxEkbGC7Gs4ZI/irVkti7+2n2kXDYwP0bAELv4iYS48A1a1ews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107756; c=relaxed/simple;
	bh=9a2otHsWPgTCqqpoSPH5+inCAvVQ5uCN7hbABIuWFsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U8KW5dCN3wMZQy77f0TfqoK91RCnHxj6BX1pU9zwewMmqCRta5kiCM1uzSRGPRGw6eOa9NOE6I/xUVmdkcyp08stBjhjK/4eUpddLVo/wTyDRpyt+RS/oInQcZRJdlznRUr2mHGQEvmv5NlWKC3AOBp72aUYlqPKvn40aqeScHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zonxc3Ry reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zonxc3Ry"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vSaf3665120
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=W8+MlrBWEAN
	eqZf07oqzyGDGfzjvQVczdsnNfM3tEEE=; b=Zonxc3RyrhYAAi2YBOkgdhShqjc
	eMmc1ooXzGvLaP9/Emif70goSfDI+V277Xs8sOWK40MHigRNNKUk2hOU0jw5rPDu
	A4/IlNdReshx304qNzx+Wl6ZG3bdNbd7Ww0dC1bQLZbzH8exAMqQQAAsPwFAY+tq
	7Tf72E1P9RmTtMC2N3dTgLRHpzt/sZBrDsHuBovwjfdi/XYK2y+KaXpxJBpkZo8o
	TnKNog+2zD8pepxM6eVyYmo7A7xjrxwOXbYtouaciDilItcngV/aKZCt8xh3B4J1
	CSsA2Wg0a7H2RvvDYYa3roJL9qdJFkxTwBVq+bRe0Mggw1gCcq1T6t6Zg9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q1222a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f1847fb9so23829385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789107747; x=1789712547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W8+MlrBWEANeqZf07oqzyGDGfzjvQVczdsnNfM3tEEE=;
        b=JOK72ZGQgMAEDPw2kppsJCWCJ3s7s8gbQv2AWn5YFyX6++LZ/YEQaDMCW9EzokcRk2
         0g+OGMkCCntCqk8eUikjizPEJOwf2K3/8s5BjqNB+UCGiVY2fcKVez4kARDP4LKb+jsH
         E1X6cyM6GFA4zGLgLVXSHn5uda++6Ho8yZrp//zPotg0+eOY0UP/TSnRzvYJ0hUPX7cS
         o/Ow01lXqpfRnympxXju6Sb0+aJkBLPXRHEf4z4KCzXoVwy3V8lnuRTq18v6w3OOKhcx
         UAoVkt8XhjXqOMhwtCcTvAEAe4MIqmBlNjZ2DuBMldyiUo5zdMO3XjMtkXLCT11i2SL1
         4Tsw==
X-Forwarded-Encrypted: i=1; AKwUvBy/L6Ap4sY1K0IyOyo5MomHwrZwfxesMJSsTLgMsREq11w0lLN17gTsCt2T6cvz1hXUVPQ445qmiQ3KHnE=@vger.kernel.org
X-Gm-Message-State: AFuF++neEN37bsw0Ujs3ws5ifgCXQWSF61g9+ptYSVE6HpuuLpO0lfQH
	2L7ZFjEYN8nit8jyspOzfsHpbEdIR3SIrJEidPfIBNCCTwWlJlOuSLlKnqEJ4dxZUU5mK2HeyZT
	pCfVDCh2Q+W+ruVRA4jJ97vKL1bAR3bNg2MDMDOPNEQ0kX5XgZJvJqowsrHxoKSZZEMw=
X-Gm-Gg: AYBFou2UpMO0zWy91htzn48brHavOjQPaHlv/D6OAgTq1t/ZbIFX5fQBmsLwfMuGhaU
	v80Y5wVUdZmcRyVNUQxHVdk/1+ApAl8G/5nhR1ufkLleSnQp6pKOTPxjWFEgzpO4ELUouN800Lm
	+ueRJ3U7d/H8ntv8mH2ZZW3Zj7ES/NVG3idf97Gu8q3q/KeBbSJZnfJ6ZrTfgOoP46tkHKA9H/C
	oSvft/Ey/zxaLBG53vixYKLutkotL3BWIaOGpAj7Z1MCL2I7zXlWFjqF4JwGS43M/exPsJ8eefr
	ku1Pr3NCKP69XPTsfMYjY9QsU4gRcKJBQQn8KRlcCK5a2QqZyCFIxZBDvMk=
X-Received: by 2002:a05:620a:29c1:b0:939:993e:bffb with SMTP id af79cd13be357-939ea1838c4mr327272085a.22.1789107747372;
        Thu, 10 Sep 2026 23:22:27 -0700 (PDT)
X-Received: by 2002:a05:620a:29c1:b0:939:993e:bffb with SMTP id af79cd13be357-939ea1838c4mr327269285a.22.1789107747010;
        Thu, 10 Sep 2026 23:22:27 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea60sm3681969f8f.17.2026.09.10.23.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:22:26 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH 5/8] media: qcom: camss: Fix CSID-to-VFE all-to-all link crossbar on sm8250
Date: Fri, 11 Sep 2026 09:22:10 +0300
Message-Id: <20260911062213.195007-6-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa39e23 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=wE0bsl3glxBt6B52h2UA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX9PfUTDUG74/Z
 G846QnbmiJP1756fJBDceee+y0W+QxV0RKzdDmJCtJneUs5TeRXZZiwHzoZ1lH9VFVhgUX99gJt
 S5co0W8u0wQNmx1dR7EVYfpTyIgKB9qmWu9+59zVpKwLxujzJUqHV/6iWwMeAL7/KpxGqGmwf1S
 hvlzF1lFoL0kzxa7bAqSCcUCe1xefEv4oQybSDL+p06WwKwMfLDIlwuRS6irX9vt9k0nF02zhJm
 jL1nPCCTFHTp0poeRvdvIK48rpj8uC5BKN2xMV+Gf5XIpprLrbHFRx3gnpdh/2IH43ayog65cds
 M5tPG3/DkQGy1UELdKHQWjyJUoMtramtmU5/S2Z1H4YWDuhDb04dEpAauAPr5+cs0fE2R/4UBjs
 ctds94f26tk3BvLTalZayVdRiREE4TRgztuKELr5s5QOHHOhBMZBIaHD85rxbVJjlDpBBnLXF3M
 BgKplu4q3eqtXTDlaww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX86/szuIZmEGF
 D3s/1HyQJz/zu/uA/4PtYEmroMJXq6SnjonXiGKHFpVg88vyi/09Iz9UOG2URy0LiBJyDzcng2v
 nSDevCNZy7fcBNCi9s45CRKoQ/W222Q=
X-Proofpoint-GUID: ffS7AFd1RGa-KDisbnK8WEwMaGilm-Zt
X-Proofpoint-ORIG-GUID: ffS7AFd1RGa-KDisbnK8WEwMaGilm-Zt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110086

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

camss_link_entities() unconditionally links every CSID to every VFE,
creating an all-to-all crossbar. On SM8250 the hardware wiring is
fixed: each CSID is hardwired to exactly one VFE (csid[i] <-> vfe[i]),
with no crossbar between instances. Enabling a mismatched link (e.g.
csid0 -> vfe1) creates a media link that does not correspond to any
real hardware datapath.

Add a csid_vfe_fixed_pairing flag to struct camss_resources and set it
for sm8250_resources. When set, camss_link_entities() skips creating
links between CSID and VFE instances whose indices do not match.
Other platforms keep the historical all-to-all link creation.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 7 ++++++-
 drivers/media/platform/qcom/camss/camss.h | 7 +++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d..1bb22cd23c5e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5000,7 +5000,10 @@ static int camss_link_entities(struct camss *camss)
 				}
 	} else {
 		for (i = 0; i < camss->res->csid_num; i++)
-			for (k = 0; k < camss->res->vfe_num; k++)
+			for (k = 0; k < camss->res->vfe_num; k++) {
+				if (camss->res->csid_vfe_fixed_pairing && i != k)
+					continue;
+
 				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
 					struct v4l2_subdev *csid = &camss->csid[i].subdev;
 					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
@@ -5017,6 +5020,7 @@ static int camss_link_entities(struct camss *camss)
 						return ret;
 					}
 				}
+			}
 	}
 
 	return 0;
@@ -5666,6 +5670,7 @@ static const struct camss_resources sm8250_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
 	.csid_num = ARRAY_SIZE(csid_res_8250),
 	.vfe_num = ARRAY_SIZE(vfe_res_8250),
+	.csid_vfe_fixed_pairing = true,
 };
 
 static const struct camss_resources sc8280xp_resources = {
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63..ad0b42719788 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -119,6 +119,13 @@ struct camss_resources {
 	const unsigned int tpg_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
+	/*
+	 * True on platforms where each CSID is wired to exactly one VFE at
+	 * the same index (csid[i] <-> vfe[i]). When set, camss_link_entities()
+	 * only creates CSID->VFE links for matching indices instead of an
+	 * all-to-all crossbar.
+	 */
+	const bool csid_vfe_fixed_pairing;
 };
 
 struct camss {
-- 
2.34.1

