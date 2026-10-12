Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F237D124
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812005; cv=none; b=UJOWVnp3X3N0ZV/9Ut/vSjSm/3THV6t9JZYDZqn5yEyhaYcJDjyBsnMGVtyLHz9QUhfelrjEDIt7jI8jogBjDKkIMQ67Kc0vsFePiMIToEmtbwDl3AIHxgCMgkhcZoPXooei+1yEc0ZBhHbQhUlbIJF02wUVmoABOhC8BRFvoUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812005; c=relaxed/simple;
	bh=jDxVuYGArtsBkgbMu4AfBN0GAXZlEl6FqQBI+qZUO9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sEs+fA5AdmDAWP6Rs2rtkFT9PWbI9su/i2r/73LqKAwxIWd/PlinT9ZnLWUiSUADl7bX8bJ3NiITFutXGOmIj5tdXcE/vDL9mn2aLq43BM9eezf0xf2KAFaQids2b2h2eKfGxK5fFZLgUdK97/NYswAh+A043+38J+amZXTUOwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZvxhZ/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kAZukulU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZvxhZ/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kAZukulU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0AjK2275885
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=; b=iZvxhZ/2MXPWUIP5
	MtEdc6lZPHqkI/pQ2Tj6ef3weoMZbdUF4TJiw3SA3uvS6XtgzgIhV+ToKI1TL01L
	5AIOtTnxMqVRPolIBO8oHAI9sO/vJNlNxsZoT1J4TASQ+D6ckh7qdPD2Od+rdsf6
	GrVgU2xqv38fnzahVjuN9+UvVC2i5PdvHakUQRY66oiypMFQAgOf4P5FuDrwPHC/
	XpVGDptOM+dno7M/QuvPeLWN7Xgq3/QvM5BbgNIY9bRj46sH47bx27ldJndG3tLu
	rcl9L0CqrW0ImOFy//XeM+TGHXgvcJ9Gqq4N9uFQf5IBhKgKZf80xC3FphB8nwg8
	uvEI7Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq1hxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35ac5255f1dso3349798eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812003; x=1792416803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=;
        b=kAZukulUdG3S8p+nboKn6cLv7rhcjUaxExzKByrrL6DmEUvKADLNTwP/zszOf6+Lgg
         ZRZjddRm3vfcijyduox3bEvS3mcX8dY54j6ruuhWmKaxaC9ox0e1NXDKq/qs8isZ4xJv
         IPl7QWzdP8sdsxKIAlpeNK0uwmTvq4fYUwk7asC9YiYPSMojAJ44vpd4DtfCa6IEUit+
         ztEWYegRqcpcN1ep6iMwWuU4Hk4x56moH5oHDUGcpjUrTYKL2t2K4kCSvwPGrdHbpIjY
         wOLU9V3lsqPC9rUg/qkcfI4Q7T2Ix0lNdUHJ6davQ1TPiNHTPS11oi3Tk4Vy1ZWKTP59
         0bJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812003; x=1792416803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=;
        b=bC/raXQOZaVnFkX7YUeIP7Ym264Uem6USXlfSSNTgBjcQQp7m1nMxJcOOFaCG+SIHU
         7gSzRrXIAAE0CcC0NEmRoWJkBDiZm0lHc8c0NJhr1gL4zbiESfbdQIqKTBh2v/rDIjQQ
         AMEhuTF45OW1WBpaUoDopA/rd7yzykhCbyFVmqfCm9PFMgihoxZtqJPohh1BkutvaIy8
         q+rdMbujwlk2i8Imc3lmdp0O2msYZ9dBLAwAINntrhAVJyF4/Wbk0tX9kJGxhskuNsMW
         Z1GT64qY0eK0Y6HtDw026QyL2nn80IZQc67Jor54Csv/E3psu0e/nYPApb4EXhRnhDuq
         BalA==
X-Forwarded-Encrypted: i=1; AKwUvBzK7oOf1f1cp8Pd00EoTonfPVtBR2fqK8GEejfj4/zAVLaaaQ+eIQ0ZQxMh0ke54YS3MI8kJmu3OOFWOl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpciwm0UQjz1Lh5B1MYDlcJPu7Z9g2X+wbXoZE7ZL3v2OZlnan
	HxECT5ruN6Z7m4UB4919zVZuUu8PCMki5prUf8MdNkvvqXx91jZ2k3efnyip9r78xF4ICnMR8SP
	Rxo3YhBWHl6s6O60FhHAiML2a+HXijtam0f9Emg+yfVdhJhjJf5TeFT2KGA4KKO4qVhU=
X-Gm-Gg: AYBFou1kGblJCUAft38cQ0Y8end1cR2P7KSWBbU4aSB1EImGL35MYK6BtfjnwTcfOyx
	E08UnhKhkHoDEpQ1c2X9S1UaEtP9/ib/SWYu0fAlhRZQjPPmqoRl7rD/62TtAK50Oamlji5kiaH
	nNMvb5g85eWZpYxM9ALEr/9Dc09NVnFhymqHgvEB9HGPMiRd2V/B0DBYNh9wt047bgVyieGPKj6
	x7thiV0sm/GSUe6wkhkCaNoi4eZAJavLM7o+6q0MKIts/xL1NPYjfsPJDejJWTf+lZWWPbRqh9E
	qBf7USnf/t2ZLGLcCt47uUucxornjW309+JiUTx7S6ijpppzbbDVJjY/JqOwofJVsT0SxupTJ3p
	22V2ITVMVNpnftYuerYNFiYU7EIE=
X-Received: by 2002:a05:693c:88dc:10b0:35a:60d6:8c09 with SMTP id 5a478bee46e88-35a60d6b499mr4823881eec.1.1791812002582;
        Mon, 12 Oct 2026 06:33:22 -0700 (PDT)
X-Received: by 2002:a05:693c:88dc:10b0:35a:60d6:8c09 with SMTP id 5a478bee46e88-35a60d6b499mr4823825eec.1.1791812001787;
        Mon, 12 Oct 2026 06:33:21 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:33:21 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:15 +0530
Subject: [PATCH v2 05/13] drm/msm: mdss: Add support for MDSS on Nord
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-5-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=978;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=cUv9ygkqVGKsKi0AqbVOUesQJiSTwCdwgeTcXPt+zc0=;
 b=8YJL9G8DTZYEfNm8VXZm1uKJy9LZZzb1+TO8eXus0vwYp4yGL7I4sSgLs9/5Lathnfe2tO+16
 iROM3kvT4CIAuf4ym5oR7OWLL0iGPGYZIJ8+7zujLY74xGAU4ipu3pR
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acce1a3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ikCT10dxFQO67KJDykEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX2ydYz/iY71FO
 naWhsm1jN6ZYKNyR93wvDBJ3xtFTIQtsFOiJEF+q0cIsixpcBR6wC3DOAwM6odjwR0oL8NNBcI5
 ivy3l1xtV4iAlHCrX6SHkj8LDFHrD1g=
X-Proofpoint-GUID: Jq1rVTvK2u8AQDSvX4XacWL2yQe69teu
X-Proofpoint-ORIG-GUID: Jq1rVTvK2u8AQDSvX4XacWL2yQe69teu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX+u3p+4YkbdOC
 6EnLlpV8foukGu9NA+UFLKPXGOpTqknngiYEy+fzShnyL/pM9Ppjnb+1aBR6aLriLE7mS+h9M7S
 ctU/OFOA0mY3Ybbb0prmxSYQl+Rs3c0UXc2DKpelDUvvjUGxU8HRl4dd2+49ISH9YXPo1OiJkuz
 jHI0McUFSWZEQTVFsN/XJmJGEBY8JfAvRn+i5tKjDXYMv/NMdNvuFWmcHHSIbyCHwRNmDUa8kA8
 d81tAxBlghsuqfkZ9RjTl/2/ToNFnfMBRZEZFNEZl3tQnVFhSa3a4efWVUJLYoI7PTBOErG/Mzz
 a1bYt68LEShtgYqGJWRlw4fdYBIDX59IzWPhUHkfJDpQ2pbda+EAF3/QA9haqEnnSL+PL5CibgH
 jo8UCiJYXYD9/DDLRYqLt3XjN1Jn6v2RjG2dEUfC93GrHR4fwJ/DD6Wf52toVlYF8+5Qw8UWfAZ
 /I9q0j+OhNoQ3GkJU+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add Mobile Display Subsystem (MDSS) support for the Nord
platform.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290db..90bcc8c28dc2 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -531,6 +531,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,milos-mdss", .data = &data_14k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,nord-mdss", .data = &data_57k },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },

-- 
2.34.1

