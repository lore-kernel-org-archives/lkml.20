Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FCB35C6AF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585839; cv=none; b=fhRePOWyjLtmftbxxjlrbG09mLsQunI1IKl7pUQGvyTmv220U9bE00Pwlaeq5Mot/9qFjLNLCbaX+h3jKsEDlLaQKg5c7xX54Z8EFzIWDhfTsOqdqvFYePZnLa7Yjp2U5vEp5e1cv/Jq9YLau8ztqLoGBw5jGQgpmBf8GlsyME4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585839; c=relaxed/simple;
	bh=ywhs0A8VVPPgEXAcqlbYq3IyT2BY2s2GCEBqNIZTVHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eJFEMPVFC3QauOtUe+oLYwAOlvQx959Ljmv8igy70c6xGvkb9yEJjmjcSNqRjgx/mikSoz4Gl0yksXRM9c3QMhEtfpf9x//frBGbBQnC7pp3RSACTUgoxeUGn26dS2xWSfpmxgBewc3V9JDA+JVb+8P7HRGOpdDFCNnHVVSsbHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MapNTc3k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPhho/AM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MapNTc3k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPhho/AM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S80DKP1262830
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hLl6opzy1FjtILgm0cJnfp
	JTxlPqrJFv9/oKOyux9ac=; b=MapNTc3kUkNdE2kPBYC/vKKkGB2HoOWbqFRrrN
	JAHZhJmvgagg3c6JHfzJlbi0Xd1eaBG3uT13nr9BuD2Mf3PnWiuNrVpYOyZL5+KO
	KqJm5wf8PVa3m0AKLCqMt3ycUaWS5qaZF9wkGZSiZvd5znvlXmd7c2SmXrJ7QuZu
	Hb5eBsz4etFFsr8YJqW4CdgUGD6pDMFTmzDHbuGlXQEUVFmMWNwO6TY1DQ8y4vTX
	ub8zC+et1s3XT34mCoEXKLLuG6fopnq8cLKk3VrJ7WKooyxrDbfX2/2fpA+nfcLW
	2jZ8fRZdCMaOIr9iDSLXsRC4U2rIcE4NCLYGImPgPe+tflXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx526nemp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:57:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c5c205127so279017285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790585836; x=1791190636; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hLl6opzy1FjtILgm0cJnfpJTxlPqrJFv9/oKOyux9ac=;
        b=jPhho/AMJq6jIXKaOsOuotZAJqNKV2qV/9wgkuV5ORhHvgkBD9OjgpWiDW63nVzTCQ
         6Rn5LoNveEEtrXkSgdQO7IROSCndHjvzLzXc14d38EiRye6te+lJO4Tpm8NHAbH++9p9
         giFxgBkgJ+Uw9AjAeFxyqI0ZEmzzld6e4pBm1gkz+TeeVDYl1yF+i3GMy07rwXCzc7HK
         CNLj5QZZ05Vh3kg+QpcCXmAEqfim8K001ojck27G96Wn3hiTnFfh77JwuRLaN6vThDGG
         yVuEABIGjrUa+rlk0XTmrnjRF9sz1RkLMRSvnZpa5dwdat3HF16/AivlzzFjP6eXoJP0
         KIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585836; x=1791190636;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hLl6opzy1FjtILgm0cJnfpJTxlPqrJFv9/oKOyux9ac=;
        b=MqjijP+Xv/Kc4wkI4VrBziu4Ue/XV/7YHn8r05H/EA+lu6w9mk40GB07vuzNTypbXS
         a+Id+Gvbbj6t4yEe4AlWAM5vhh2YhbIRGRg4tajVkTDQL7kQwANied/by4z9a5GLSqfG
         fIBjN6977gAtYa4zpy6M20PIiR9wOBW42/4n6ZzEjG5OeMFEL0fM0eyIvc3xtpLtA5xX
         4ZFO8hOtM3vWWAxuXM/tyn0Ekhy+mAMsYaXXbKIci5l+7Dlg9CU7wj9LesGwnsl/Enyy
         txsnjwxSgXucwpUxjcIEidyPb4DLCcXsVQQUvhokBBQxc8NV5cm7NdRcLp97A5VwRcTZ
         Lvfg==
X-Forwarded-Encrypted: i=1; AKwUvBw8HlXLDoul/GpzNjmOfF17Xs5S5jGvT5wxPchrIj6L+CcHOzEc0o1mSi6ZbWiJx8Av961XR0LGmWI4lmY=@vger.kernel.org
X-Gm-Message-State: AFuF++n7c5jt3+KtJ7UkwlBEDyAf2tYU8nhQ5RL7sKu3Vdu0uiTNXaiL
	8/S3cxMRbHQ1L4PLK1ghDrvkhu+D/gccAmVMoD+XOdm4wn6eaf/hDlVUTndQWX+FruTGOoIdUQk
	zGfXyv8mPcmnMggHuQutviheWtevCH/rNWAu7az2G7JhFUWG9qdY9cM7lFHgTF0Z4zSn9tQjTot
	TlU8Sf
X-Gm-Gg: AYBFou1k8UTgyPwIpJiR/RWX48PH24d0rjA/iBWwWiekyt2sXwQ7CEhN9Kui6Wi8+hm
	bgCILuAAPFRCifVkfDoXZ9jjycxsZh61jQYjNYlcey2btYlDmGYicPnpWdLIDPkoTwH4H2tWl3v
	8TxYFMmfthzhZOjVyxf4y6RmNpLMdWi5vQf1lHX8C1OJYcKCDuP1a4c0DowHuIihJAuDCmAtdqL
	DoI/ZNjGxFSC63EOo+QfOjHXoROs92LGIJhmkt8QDw2sN+Y10AHWZCUc36VEpVT+VEkXz8AkehM
	OQpQ6Eza8Uu2WL3q9ZRWjQNqTXREH/8B7oTLM3HLuws6V3rr8cXq+mDsCG8bTtPVJi65BQAssvS
	+C4rglCyQFwP0ux0SEUgNMmacgVgFOe9bUCsjYwsI0wsle0tpD5VCDUsSoLbnB3ArFN7uW5kNPa
	4ovIJrXkmsFVWhXzV8og7T5TZYC198axSS4u7PFfgYYiaHVObuWQ8=
X-Received: by 2002:a05:620a:4611:b0:936:69dc:aedf with SMTP id af79cd13be357-93c43bc93e3mr2002930485a.16.1790585836015;
        Mon, 28 Sep 2026 01:57:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:936:69dc:aedf with SMTP id af79cd13be357-93c43bc93e3mr2002928385a.16.1790585835549;
        Mon, 28 Sep 2026 01:57:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a36189bsm25130232f8f.21.2026.09.28.01.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:57:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 10:57:13 +0200
Subject: [PATCH] media: qcom: camss: vfe: Remove unused frame-skip
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-camss-misc-fixes-v1-1-3e0155af6df5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOgrumoC/x3LTQqAIBBA4avIrBswqcyuEi3UxppFPzgQQXT3p
 OXH4z0glJkEBvVApouFj72grhTE1e8LIc/FYLTptDM9Rr+J4MYSMfFNgrGlJgVrZ3IBynZm+kO
 5xul9P2OplNxiAAAA
X-Change-ID: 20260928-camss-misc-fixes-c5e4fb77de9b
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: hitesh@ebytelogic.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=VvS2kO2n c=1 sm=1 tr=0 ts=6aba2bec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=5IcyVcEOo5CG-yeLfe4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: kMcU8aH8sjZ8kPogUf-8wulSkHKKRG-s
X-Proofpoint-ORIG-GUID: kMcU8aH8sjZ8kPogUf-8wulSkHKKRG-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfXwuFgfXhVUZHC
 GAQ4uXMGd27SEWMlV7Vwt8pTLq9xJryIJrkvKreehpSitJ0XmaABralQwuK38qZ+E4609OD91Ly
 IIuUv9a4RQFDMXr60/dWxbqdlLEy9VKmwTvLB4J7nn7+QkAcXpBIJqQuyXDlcipJSlHatsA19/n
 hwSc9JotYxo5Xzk+IjPsVuPBzHkVkzoJo0H5qDUzGNywF5cU95onY54+hhNYOWvlviw9xlbJ8L0
 fy00IUX0LlgqS9Ie2aDtyksi8VkeLaamM7eVgl7lTpcBVay/02XZOmmM1Npgw6yrjKyERSUZfMe
 Itx6Nlm/QMgUmq3KLCC4m3gi0NMHLM4iT7533hmNF6omvZNSZyEbFgSpNTWmzqqY4iZHdGvZsKF
 L7UNY7qRSIcqghgj2EKrgAPxFQMeKl++VojBaHoUKDlEx4+q7SLnLSG4v4ZZt3eeErGvj8WSJHn
 pvt0HN0xdfC66OGrgRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfX8/suK2zMSfgD
 Henn8NIyzAtY3OoRU8RUG7uLiG3b3s+HIigT6OzUBy0IiqezTpVHavxaKbWtf9KGwK9IqWzuvPf
 Ke+8rZukw8ppM//AQXIkL0qI9toF8M0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280035

The frame_skip logic originates from older VFE implementations where it
was used to program the hardware frame-drop mechanism during stream
startup. The Gen2 path neither consumes the returned value nor programs
any corresponding frame-drop configuration, making the sensor lookup and
g_skip_frames() useless.

Remove the unused code and associated local variables.

Furthermore, startup frame filtering is generally better handled in
userspace camera stacks, which can discard unstable frames as needed
without relying on driver-specific mechanisms.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 319d191589884777bced456867e5a2a4211a2770..9d125d005c3bbbbd56bf61307e3b85e7e0e0f885 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -507,22 +507,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
 	struct vfe_device *vfe = to_vfe(line);
 	struct vfe_output *output = &line->output;
 	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
-	struct media_pad *sensor_pad;
 	unsigned long flags;
-	unsigned int frame_skip = 0;
 	unsigned int i;
 
-	sensor_pad = camss_find_sensor_pad(&line->subdev.entity);
-	if (sensor_pad) {
-		struct v4l2_subdev *subdev =
-			media_entity_to_v4l2_subdev(sensor_pad->entity);
-
-		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
-		/* Max frame skip is 29 frames */
-		if (frame_skip > VFE_FRAME_DROP_VAL - 1)
-			frame_skip = VFE_FRAME_DROP_VAL - 1;
-	}
-
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	ops->reg_update_clear(vfe, line->id);

---
base-commit: f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd
change-id: 20260928-camss-misc-fixes-c5e4fb77de9b

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

