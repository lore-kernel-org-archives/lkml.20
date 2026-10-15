Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3387E4E56CE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054736; cv=none; b=qpE/f1WDiWaqhIqoUcv1WVd5l2SuAha2SVQnV8ydEvlu3yzpuLTCWK0cb7AAdVREbiohkAs9oT81FWlgVS0VBN9kLgLLitxblt+qGsCBUKx7CKNo/cME91wwQCX9Ct99wesnFFqyT8CVmyimZcWYH6q9N9L/qfwwVw+f2wuiRZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054736; c=relaxed/simple;
	bh=2HxbKMgISR36NuY4C8FsImVcbMBzlwdgTiNeWWNsGmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d2LukO7wp/aNXa+u4Mlo15S789PCPphODXS3QJFBDisoskbl51ymU9ccw/KQiT+8HyfkpJxkDO/YfJjSL7/3di5l0vLyTWEzEH03IY8NfJc/p2Ceeu4NeRqvUGZUsk9uRbvZtwYG3Eg3oYbD4K0fdxVXgjHualuv4dk5dW4gle0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OM+bP6EV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HRsJxok1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OM+bP6EV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HRsJxok1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6a8WJ584290
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4zSLbAg/vbwlB+khcp4ptsONlZA9U1x5Jat1WlHBG8=; b=OM+bP6EVReFUco1F
	Kmu/RqgCuizgP5HA+X+h6sVifPNpBZ5iGlyFseUUg1gI8peNqCUoD+46aiNGLtyb
	lnrBUIrg1yCMq7XQYbxTYDCZWtTJ1iylSUUCU7kWWG+LG6DcfFDQuWk2i1MDO1bO
	o2AACIqsElbWSUgnX3+VbSzf3VBIOkGSrYH+OugJmahh5Qz2R7UhKXl2reqP07Ia
	b0QtV1g3K3c5Ofug5gAM5IW58eSaQ0K+Z1ravA8wYP8VdfmFq3Nz8FpQj2LeGpSm
	opCCLfz165btewNVWm846Yu7PS4mGUmVkiWuogvp2Izbf6xldvmV3x0wUugzYkSj
	aJ+jmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdesxp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:58:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so217215885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054733; x=1792659533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4zSLbAg/vbwlB+khcp4ptsONlZA9U1x5Jat1WlHBG8=;
        b=HRsJxok1k7HNNUhPMCgqiB6tKq1Gcb+XOmHly/HQJIeEqzExJEwy3zHBd9k6/HbBxv
         IvicxOdtdn6CORd4T0OKMcGKW5ZnjBrJ6OAMp7my4ZTbFHlwADlBzfOIy9zlsk+VSbUv
         fxavFTDE1Cytvwc/qWFy/E2RQagcZHppGDeJYCXccdrulwitemPOixgtor9qrlRI5Eus
         iE+BFVCRoMInr/Y/WQjJBNTtjYP+UXnD2r5RsYwOJIDVDC20IAWLZdEfVm/g117+FpJH
         oWVGTAt8a0EhG0AOjNKOP/PfRYzHKavkkI4hjdjlQVhegMEorbqCygt7Mh17OBdK1FrU
         E3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054733; x=1792659533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4zSLbAg/vbwlB+khcp4ptsONlZA9U1x5Jat1WlHBG8=;
        b=QMEAOYlSImhMGzfJsiEJlVOALG45ouHHyrun1cvJcuwQfYAFJSUjskljl5By6BPnMq
         W8jvtveUx9FfnsXSxukkrBT6Rd1+ziRLctWUiOv9Uc0maT0/F18Hg99zkhC3DCVeZhzP
         NeZUwNPaHUt9bj+TmtJboSyrVEf2OLBISx+Wjaq+kv07HkHOJ/0e2uCLP3ytCoFq0i3u
         a50Ev7iUgRh3X/SiL7Xnc70fpQZ5CLKwWEZkW3JGmTiAKl/0yps1dv6b4h9zK5BV9Xu4
         I0NSj04Y0Zi5hFa3dNxn5lKtjO+JgrqJOmn1DREMwgsFgZaualqdXw+rshVi3BAUf3O2
         EDag==
X-Forwarded-Encrypted: i=1; AKwUvBwILBn57OPtqMaRrzjSWk8Gpxa0IL7JyhLf+c+6LuUgWCc8p1QW+kcje3msuwsCZghh8aPGJspldWYxKoU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyMHEXKdcVW3i9BYRJaYZIrgQ97YmtmLkBbo6AaxcBiSDXrvLp
	1nFN4gcoq7h1ghHRE1jsElFNNFXab/yMZs2FOAlZDIUOm7aM9jZ0rSvjXmAjemkREqrmfwBrYIa
	HRJ1TelTDd+4JSxbpAkO1T1i9nlQxNMKCX9i3JfHWS5Ekb+JEgXoCQ7md/5dLR8WjI/s=
X-Gm-Gg: AYBFou2cOVtMSFRANDLNJuvjcSKx7rZwGgPt2CSjoL4U8BMJrgDTb2/Ds2FvA08yar0
	ABdCvt1H6I1c9aCCPQ/WeHnrGDEhWFvd7IUkuPlEKXmFNScBNCwJLCo7lJqean2lEJvlGRynycY
	fzOVWfjkBzG2EtlLLKdXR8Yf0eJUERGzDHc27dy/ef3SXgwNBqDsxBU++mc2SJwPtO4i7zgwPUc
	YolkDCti4YOx5ccOjAm+E93/GYMs4jXGgyad9u+GmJ1rXRKsfSAQZoXAEM1uJF4ugp9/9FLJ4Bf
	ln8+Ow8py/c1TcLvI6tttRvLbMeOVQXjex6G1ia/4GlAhzLt+rTf5KtODHN2HE2DTKKFCZ5QNwr
	nVj4+g+locnfBnHozvCPsGlMtX5Ph7Pop/BQqGOylG24xu7aWG/sacbBi/8WtMBmLVVEd0y9h9d
	yetzb6Si4umIKE
X-Received: by 2002:a05:620a:29c4:b0:93e:fa30:f1dd with SMTP id af79cd13be357-93efa30f6a0mr1113601285a.70.1792054733433;
        Thu, 15 Oct 2026 01:58:53 -0700 (PDT)
X-Received: by 2002:a05:620a:29c4:b0:93e:fa30:f1dd with SMTP id af79cd13be357-93efa30f6a0mr1113598785a.70.1792054732995;
        Thu, 15 Oct 2026 01:58:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:58:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:58:38 +0300
Subject: [PATCH 1/9] backlight: qcom-wled: fix unbalanced OVP interrupt
 enable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8150-display-card-v1-1-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2134;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2HxbKMgISR36NuY4C8FsImVcbMBzlwdgTiNeWWNsGmk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JXD/8HOB5jgW25p8UZfYUn2vV689TVBeZYT0
 2pF2AhOLU6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCVwwAKCRCLPIo+Aiko
 1QLXB/9omQO3ECKe1kevnZE9IomUsynXXe/Ko4ChnIc74C/EK4IpBaNiWg0LR1I9CwDMqQii9A2
 d5OL6Iu+9yZ8C8dlZiRmIo9ddGFbbRrysmLmCuiVBaa3h6CudVIwJD7lp9YaBF0nvAL3S1KrHBb
 ngZ/mMBJzFdjlnmjOmDIWxK3OFKPUZiGPpJSUDBmkDpL+O/00+7S9znMttdIpuS867FN0PENPQx
 PHZ9hKxuDjnpRU5jkO08PLq9dbHnA4kfYwjDy5h7hIAb0huK+rqWXPaoRTCkI8H3cxcXkTl2WSG
 wuf6arG2YJeEc8OcrWagwZHqRd2G48OahbualL6t3bavfhdr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad095ce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ov7LMV1X4ZCViyyWaGMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: bVycC9x8qOWyaVhiHlzwPTzRF7P0TYhB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX7cjOh9bkEu72
 QTruYmcNTOts9RuJWoYk6hrr16+3KAQSpiAlALxeNOzAsgXezDCGP6YoV5dlj51ybxMQuLkoEqt
 GxYFGdmVfbTh37sJMfzh88zU9Y6OGi8l5UQ98Z6kmXixeRbp3fFefyYQ6OuIedbPh3yzKpR/ygL
 dzuAcsMTE1b75O4oamkRElwpB16QFT8ohswYFe9MyTedXWFeYKwPdThLNX6tKQvG/fC7TuAZ2Uc
 jgI5sNcU+yEDRjOgj41KYXxzQDXTC4F+uNZgyBRUPPJQTksDlZ8JHNW0RBtHb1OqDZSOrVpSQ97
 yy1CCmD4qHTOryb0eLT5EpCSRFXZIocpyNHWVoP1lcBOnjio+yLLepjVmeL4uWfGoCopJGvZkpH
 N66nvw1J5uhH6zM4fM0QuQcVV4tSf9cwiylzLwAQk/y9yAnyCWXntPXJZeBzoobz0IlCFdIa4Wa
 58ongLlC5RZerrizGBw==
X-Proofpoint-GUID: bVycC9x8qOWyaVhiHlzwPTzRF7P0TYhB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX8HC9ozkAT/Rl
 q7XJEADYG9Ae+8NcS7mgw3inq2mJ9o7gfIQYohvlnYRVo8VPE12pdA1n7gNS2FZNifbMKcZJOyX
 Ytt0uvAVA9oVDNDy8SY7AcIeW1WF6Qw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150035

If the bootloader leaves the WLED module enabled, the OVP interrupt is
left enabled at probe time. The first brightness update then schedules
wled_ovp_work(), which enables the interrupt for a second time and
triggers the "Unbalanced enable for IRQ" warning.

Track whether the driver has disabled the interrupt and only enable it
back in that case.

Fixes: 8663c188beea ("backlight: qcom-wled: Add auto string detection logic")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/video/backlight/qcom-wled.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 650dd95f06ef..f2e0430cccbc 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -199,6 +199,7 @@ struct wled {
 	bool cabc_disabled;
 	int short_irq;
 	int ovp_irq;
+	bool ovp_irq_disabled;
 
 	struct wled_config cfg;
 	struct delayed_work ovp_work;
@@ -294,7 +295,11 @@ static void wled_ovp_work(struct work_struct *work)
 {
 	struct wled *wled = container_of(work,
 					 struct wled, ovp_work.work);
-	enable_irq(wled->ovp_irq);
+
+	if (wled->ovp_irq_disabled) {
+		enable_irq(wled->ovp_irq);
+		wled->ovp_irq_disabled = false;
+	}
 }
 
 static int wled_module_enable(struct wled *wled, int val)
@@ -321,8 +326,11 @@ static int wled_module_enable(struct wled *wled, int val)
 			 */
 			schedule_delayed_work(&wled->ovp_work, HZ / 100);
 		} else {
-			if (!cancel_delayed_work_sync(&wled->ovp_work))
+			cancel_delayed_work_sync(&wled->ovp_work);
+			if (!wled->ovp_irq_disabled) {
 				disable_irq(wled->ovp_irq);
+				wled->ovp_irq_disabled = true;
+			}
 		}
 	}
 
@@ -1649,8 +1657,10 @@ static int wled_configure_ovp_irq(struct wled *wled,
 		return rc;
 
 	/* Keep OVP irq disabled until module is enabled */
-	if (!(val & WLED3_CTRL_REG_MOD_EN_MASK))
+	if (!(val & WLED3_CTRL_REG_MOD_EN_MASK)) {
 		disable_irq(wled->ovp_irq);
+		wled->ovp_irq_disabled = true;
+	}
 
 	return 0;
 }

-- 
2.47.3

