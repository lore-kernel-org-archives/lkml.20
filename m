Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180B5374E55
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185097; cv=none; b=u6QNhnlRHrVc1ig1JvP6QBzBjNx4vrNGwPBbSTtIMO6kq1VRohavB5ESPU7i5modTPhEqsyrWDXI1dk4KHNjSOERPWD5qI0AwWLOdpsr1HopZauFAmfOgKXwEgcP8BYQEnHkRbumvUmsfFma6EIofoOCfpchRvAmqc0c7XZw5n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185097; c=relaxed/simple;
	bh=ATHzw5/SdPmSlyNoH0Ua5Hf2It3tpnIynG+5Y/cT+DI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nmMYTmkg4S+3u+27qE6vp3+O/GrJeDsib/Kbwb1hTx0JoAYrpAP3hcQnJ8+UeO73UbhaFsFYywgfIuqJf52fViv5AGpBAoS8upcGQjryShMT0pyaEPJx0wCzzNEqaV8UW9ApC3cj0k/hWBLo4J2kODsMXNLgZBDQqlPObZH1htA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkSw7MVn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4xaOhlH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkSw7MVn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y4xaOhlH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510RlY788230
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 07:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=; b=XkSw7MVnCRbphMuK
	bjyoLMG4IFBKNvkz5dp1xf8EmtvTgIegmXBih6xGCZao19vXMC0G0lVWvWqlTJpD
	VxdteYmfPABtRvGquSTmTgOp7eQlDeFmpkelPqo4TsYkxR1ot0OcFtpUlJtUCR9c
	Kdh45OvTLFr5saHHmTPS8YuLSjitewlTVtaEhyfGfsD8odAE18+fmsJ9uPNZmTs/
	ZgJ2+Vi/aKPJfMQHXmzDKV1keVGOuUz2L9DB9JhkNCh7T5/bcu8ecBq1PZtTzGb0
	vVOIwF/Ra1iG8aLnxeW3ZLqJqHX75YP+WQUdsUfgsmuFqcX4IuH3TyBJa1/nFaYA
	KpmNCQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa4wt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:24:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so1864551a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791185094; x=1791789894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=;
        b=Y4xaOhlHyGNU355WKF/Ds6WuZOua8lG7EOMw/vu7ITWzm0XizWjFcao21HzlyC0C5s
         AKyCV7osN/1DJF91Ey2MbRLBVbhZ94ka+klZBjX/4qJe+TPc8mdOh4YSm+qPdmve9cCR
         z0gUovjLcgCgu/6b+FYAnHAcF3wQnEE0pdsmH34BVWYc8L/PCJnk3jk1nAHf16SElbX1
         5qCktTuQq+jX6psvybYijHEhQDW4ByWmVs0RopSMnMIQa9V2Eups2rqQOXKUirIa/rPs
         KKNM6ZwYQUZbk/hoomQSy5o3KXoQ1eLT8uPSJA/dxWnexBEtfYKrhCKTQsqO8S1LPaHL
         k9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185094; x=1791789894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=;
        b=BsnzOaeSXx9ETuSeop9qNLF6zsQ/qO/f0DspencAXOJcsldhrCIHdm2eMPGiS7sNVI
         rUtzxFatYTtJ2662XzIni/oQF8mZsFNrzaPOnzyBb2h8ygTqQNCjhlXUAqE0Lw0/7nD5
         O/YpZ6q3n1ZaXiD1Ku4YzMp+C4peIaN82Y/GiMOLUtSwsR//Mfc3vZze8RliKtWIcGbk
         9cGdIXM94C+v3QMyZZWVTBEJHkQQUuv0G4t8BTrhxg49lBseWN886CdGFHfy2Z4lD0wf
         9l5WB+tWudfiZObANqE8+UeA8c9ly5ZT3r6v80Q17HB5H3ZMCnW0+ybydiU9+GgIpv9e
         IgPQ==
X-Forwarded-Encrypted: i=1; AKwUvByMNK6QkqPJ69JNQwRnORuKze28lVEwvfnWqr3NXQclCvQ2te1oQr3bwJjl3kbdR6vooYhcdJSno6NIV7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7jbGOab+YhdBNq7VDNDRI2BWHIQ7R7My0Xf52tGKlXNwaFmKz
	xVmc7aahdzLsbBwoMLbjr5ZLHDz1JW/LTN5VgWI19yxaQGUIWwPYWW2zABLgbel+wfiuPmiBIho
	9npKkJTl28+OP5rofsdF+6t4QDvjKkiGjsPJH1FnNdg7NAnVhIquYSXQ7jvve4W2X+tg=
X-Gm-Gg: AYBFou1AjzJhGNhFu5g0cXwkyeXqu3hFip/2DzT/QmtM3qr+lvhuonaD3YZSUXUimuM
	NkBVETHlZuP0x9oV9NqB8fKDdh/YDvw/Wb8dO3MyACallqyW2eFmwT2S1ZP3bqxixyxFTBvmkP9
	nff3srpjXpyzKny0xYQyUqQSVM6u9dUflXqoHNPsoAlDcWXcA4BXvvXue21oSUUpAljUaYL2g81
	NXE5M8FKkw3NWUCf5uVZ7vQUx+9jwPw7EEDLhdAoKKusxAREZVtbykkFMIAC2+y01jgcNkxUwHl
	D7khVif1dmUVZi2QfQBl5af0JtAWJldb3WhIO3tLSj8vn6B/Ji9OPvDRBpl2EzM3uYUVCGqYGGj
	tMinULJOf4bDHfdD4enQhts0V2Xd3JIVktxo=
X-Received: by 2002:a17:90b:4d85:b0:39e:d36c:ee54 with SMTP id 98e67ed59e1d1-3a6ce606acfmr9757584a91.5.1791185093688;
        Mon, 05 Oct 2026 00:24:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4d85:b0:39e:d36c:ee54 with SMTP id 98e67ed59e1d1-3a6ce606acfmr9757556a91.5.1791185093189;
        Mon, 05 Oct 2026 00:24:53 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4f3911sm9901421a91.15.2026.10.05.00.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:24:52 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:54:27 +0530
Subject: [PATCH 2/5] drm/msm/dp: Add DisplayPort controller for Kaanapali
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-kaanapali_dp-v1-2-6faeac3a6d59@oss.qualcomm.com>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
In-Reply-To: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791185070; l=1543;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=ATHzw5/SdPmSlyNoH0Ua5Hf2It3tpnIynG+5Y/cT+DI=;
 b=Kcb1zhiybcDNR4q998sqyDvMcDS09D0UYeshRH/axXfPBe0mY6anWRqVIVQM43Ns2l0nEO2W3
 MB89awjeoXaCpCa0gpmyZEQrdYSkoqJ4PLWYkI24+SIVymXdOlpSKtQ
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX/+dmBKVB70am
 yr948mPpa47ZM53bC8B3518fY/LBwdTpSit9h3urh7ibGSXls7z09M1Ukzc3htrPrhmSWjHJaEP
 vm4+mtpYx99htRiT/n0ufA62AioIyOtZhelkSlo0oz7AWRR6010Aw9QuTM3uzUWLpOnF5yqdef2
 bx9tWgkBhU8+akw+LnvvIdrB+VIBKWLsPw3LJtARbaJFfJ5mqkLmBl5B8/xy0Od6iPsdO3r7b6a
 mzAZVwNX5c6sxsMjsDLtQp1XjogWcgfCZuRqG2Bm3PP5vcrG/dZGBRa0pAXLAhz+V2PtRdVwklc
 jfPVnmgi5hvINqQIF8a0TNe+0TBKXpAbXn3Fcx6TASNRuvHwP+WUPnejZH65wAeEC+3l6SswpaN
 utRG8imUmsmYz0wGsJV7N059wh+FQ/5BWXgKTNmrncgS4CNEH57pa9YZKFKyBxeLPnahVBD8CeH
 G3c7TKYiTSkRip5u6qA==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac350c6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-Dt519yxSYS-YsuSjdkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Uy_qL58Jxhwat0Zy4VoB_LWxczkDZZLz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX9eQqx2oLBkxU
 D8f1mlhRzwOCB9oj/v75I/eocT+3FIbYRjhdBki1XhSNbNVCRKVzsXdbkZZpIrtg+jLPMdqEWZh
 g1ZIaySgIi8SLaxRRuiENWGKlJYd6oI=
X-Proofpoint-GUID: Uy_qL58Jxhwat0Zy4VoB_LWxczkDZZLz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050028

The Qualcomm Kaanapali platform comes with a DisplayPort controller
with a different base offset than the previous SM8650 SoC, add support
for this in the DisplayPort driver.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9299ce616fdb..348eb6967abf 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -158,6 +158,11 @@ static const struct msm_dp_desc msm_dp_desc_sm8650[] = {
 	{}
 };
 
+static const struct msm_dp_desc msm_dp_desc_kaanapali[] = {
+	{ .io_start = 0x09ad2000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
@@ -168,6 +173,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 
 static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,glymur-dp", .data = &msm_dp_desc_glymur },
+	{ .compatible = "qcom,kaanapali-dp", .data = &msm_dp_desc_kaanapali },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1

