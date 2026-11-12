Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495755;
	b=E4280jWyS137LhQrMpyVxLEgdSxKftPCmyx3a3F0O2Z6P5feHfcRsvMrgKYEcM9AN+ne
	 8iEPaVj+Gems0VhXlehbXkX7WljX7/Nh6njq5iBXW8IQ7fCi+lp7lGj3/bhr+jPZaWaaI
	 1pA9Uevb+sNcuRGBKotsD3Xg5KQYb0/64p9NTjUUYDqxe3q9cqsPHh05NLzRH/PsBGhBa
	 5SZ/FE3C6+CtYk1+DRLn/T0nrse6Y4gTz1Ow1Qklttb5cQqBy8Cwgh/cT/ZY3DdbLE1Pa
	 DKHUNO8BljHtmVh2n3LDd2PlPeYHoiUnPzjnS5oBBmCu9eKUpWbWiGk7sF/HlA2jdtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495755;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
	b=rG01LXfSC66gQOrogvSb0dre3XsGRSSkYIc8vOCvzhd4XnuxBTQHlG/8AoDr7FKMibRS
	 wtL25fhHDg4tG7r8tNgqe8cFIWy/44yLbesPilCw3EEkOwZrgKi8obKTF5p+r15FUHLAy
	 aJUGAeN+T/f85On0MCJspx1lvWjqZOOuNhvDQmFzPYzbVAjmN9gucOJf1FPjQHxBW1K9d
	 BcMBPnPi+zfJtqF/ix1ZEMnjuBPdlcOBLYumgb+GyQvbqlFPUbznitXXc7MWEUMlB8GHi
	 V3SvF06oTijrDUJ6ZQO20ICQEGtfbczoyPvXlZt9wxsIunWhxmQGfwj03bM7E+n7Ewg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfflmosK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dwOklqIR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE12A606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE12A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfflmosK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dwOklqIR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACDpPH12818507
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=; b=ZfflmosKG2Xs7tFf
	pJMyx5GvhcxNkwfpWvgSZP4Bd2uL9DJRO6NfdatdYCiSxL3NaguJN617x1ymuD3H
	4fXWZQi6HLKnI8teXiYWQpQ+IxwrA2mWfiBFgt72wRQ6BjsvSP6m8Hn72FKrfq0F
	zFTjLTuJrnTEhKRhIEGHJB8ducqa3QdUDkKoUfFET85fkdVqcvyHHDeVyZLc+O3c
	QNa/JHDhDN9c53ZHPLJTMJEKL118pnsWhRaDMjB3xlUTdgwz67ljCKfjFo+ReLCI
	HWl2MxDBvntgJtA+mzOxNuYZf4PnrHdN82teZNfPK2lokWaIp+UjAhyzjnhwXXSr
	TaIF9g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e19hj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:02:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-555d08e97c5so77770691cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794495753; x=1795100553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
        b=dwOklqIRmyM5Tss+2L9RPd69rwNfYhJ9UnwmI/3WwsxxHIqHl2EI3OUAiEf+QAtuPr
         5oLzEEYjwSoThHeL9yRC7pmWarmNnvbEmWFgVUDuviglDGZTFcldbVWtXErvOZY504c8
         t8VJaP2oHx8DkSCK+YuH1+/+fnOOsl1RRuVEluTWKObNsZdD6BIz21tFzqiKhwmow/Oj
         7DX8P3dVSZJptOR2Xitzt8h0p61pFqg2AN5fhcSh7zvIvclzcM6gZcuwdXxk0i9+MG+E
         kDJFWV7uMm18i19cb9TvmtUq8U3CitysBE+GPVzdGd/F24QPbvEpDAEYPkWJdfvKF6DD
         C5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495753; x=1795100553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
        b=064RGtgHMW+Qw5rbgX17WErGhrk+MYTyw5kJpm1+0ekQIGWQCioHhyVNBV+R7HRsz0
         aZMKxGiu9sHTkYduFdxN3Kjvi0SfCxmAdZVVh/qnYAFsrrTEV7/nr0nheYBaBDCCxtRA
         5c3pGkDmGnFIr+5aseRrOo9k4w9s3iDE5c9WTJ7nKKbfR1CKeOvup4CBxEM7d5rljiUz
         M/1Jl7CSCmhHw/w28uy43BJ0OgBYwqj1NZiv/C8C0JV4W5U1ezVbdoEmyLFEpac2l5fR
         1vEMHX4H5Au3gtw38MVWDvaLtBi2pIU6MdZdoCpX9HS85ggcjm5i80iiqb0UoMDYcaWK
         vzGQ==
X-Forwarded-Encrypted: i=1; AL+hErHu1Slqthi+nrRNtAUj5y47/KKTv2BUB1tKB7jhY8cv6CjlCesp6YIiyvufQIMW2Y6TuJ1jbiY8/ltH4aE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nK4KRBdavR2qbK4YF4Zr59AuJXBxGIHGMJ0jsYbb712p5HlHa
	q0p1hQY3CJLCpZeQBEJeJ8/sw+nrEJoKnwqnFtYhN8xNYpeW4kCTFnXdA8X31PEVrd9u4o/UR99
	KTxicgbmywwi0r8DSKghvErSquv5ORpLRaDthcL5N6vbTDsS4oTuTh1gScAP93pB+W5Iz0nC15X
	U=
X-Gm-Gg: AYBFou1Ai/DMVBrA+uXeDPhpN3x/6WwI8KndARdr56IdXTAxWZc5UMDMKS8eeltg/26
	ifHfGY8NvOooBPpnNbIjIXPMdox/sXBZ8m39xzQvmmqK170nrOqKrHPYWRYjtsK0jKmBhyO4l99
	NQUJ3RjcC0zLFSVP9PnQJZ3+PMY6y2LWeMtoT4F0Wu18zidg7JqQGDiHYiBfAV+leBCdC54Qblk
	wqLe7XBWs9bh2z0vgEO7Sm/aVTL3H2xwE+G+ilc3f+NldUXBZ82+j8G1KjpZu3Hx8NF7EpeZlYy
	zSb0jK3gRWTAPRorI2CUfNSLDZl/c5a9skevF3w/6qJ1bRZoQaIrxEeVImq5/gJ+muS6FDjmAiV
	64QRmMJub+F4fvyo2s5If/dkwt8vXSPJqtB3lAe15vQ8kOJToV/J0CEpt74m7sS8CF7cLcQ==
X-Received: by 2002:ac8:5d42:0:b0:535:8519:6ebb with SMTP id d75a77b69052e-556bdaed3b9mr94152741cf.4.1794495753132;
        Thu, 12 Nov 2026 07:02:33 -0800 (PST)
X-Received: by 2002:a05:6122:4d86:b0:5ec:d5e1:ee2b with SMTP id 71dfb90a1353d-5ee1c4bb798mr2491992e0c.23.1794495741371;
        Thu, 12 Nov 2026 07:02:21 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e354b0sm106758475e9.1.2026.11.12.07.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:02:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 16:02:03 +0100
Subject: [PATCH v3 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-display-msm-of-graph-v3-2-7fd0c06ec6df@oss.qualcomm.com>
References: <20261112-display-msm-of-graph-v3-0-7fd0c06ec6df@oss.qualcomm.com>
In-Reply-To: <20261112-display-msm-of-graph-v3-0-7fd0c06ec6df@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GCFRCKJTBF0tDduwhG+AEpuoFlapsyUUwKoJTS/2B/I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9dTw/N/EMo0/73D9HuBKXPhSALwVSdxATrsmZ
 oewOiIsNX2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavXU8AAKCRDBN2bmhouD
 18UKD/4woiD/Ev4qypVFuqNMNuCXZI3SbvQm8sS+F7CsHrUisNE6AZhRIMiocqt/yfQk/Nn/dR1
 tCdQWwuZujVtx3NiSUczQKSVReKIAz/t1UomCrIvzO5o80YD5OYawjUF5d08u/ofOHOyEYaKavd
 5M7af9hvn/PnVzs1wQjrAw2ZmjQmZu7HFW069FaRPwm7bc5+GMMHRP/tIqdhMnSRunCywgkILLI
 BZ+sfDa/6ViK0ERYBB3+UqLrlFu6bQT2fHMmwmGcg/e347wUOefYaH4NGNgPvvD6MqrsM3UHeiE
 czB/RIqnkqPRTEKTB8lV2Kl4UaepC3biqwLLr+Yvl31sv70NNUzWzqR8+Vrg94vDAqa6Jyz+tR1
 AZSWWEI2WW0h/9VJKRTDhTa18+Fobtx2Ge26+eAH0eBO16H/Krh37iquAq05kl0Bt34XSVBRxq+
 cj3wsb4brSj/+95kezwUR6wGW94e5s36oX9k7eGDSOBePFTXDGwLgRGBBInRUuSXre96KZxs+HT
 vLDuzJ8hJSsSqjgKwKXbbSw0bbO/oza4PGLS1UpNYVpyVGWeYfh+lEKBhDl4xndtjKhtQpBW+zy
 5FEBS+UsVh2s84doqXzZZjrrCdVA3AK/mNHmyr7jcK5X48KVjOjG4bT6LtNSIZtSBHSM8RXNYsG
 lKvDey+8vtsG+RA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfX5erSQnCBqirI
 eM5C7trTbOxWBObrm+rJJQfVCL6Y/iaz29rCqumpNr3mUqHSwFYLDzlcmQwoBwvleuOcB2Xj8B/
 rXmj4V5SbeH8jOuzKgTkWMO+u+ba61a0G8r49A75EnyccMndQaO+tGf9PhLLdB6axHvbZ4rU1yR
 JwG7WwkvE9SsjJJrz8mQiJVemcu1BhTTeeisi/lcmPeoDE0AeOHjHWPOVbFncn87DPqzHG30VSB
 fjHQB6H5vQrOnQN8MjDqUDk4ACI4Wx3fETCGCw8vRnbtJ1CPfubaXECRJyvscZmWtlEVP+82WiY
 AMiJX6TYeO7+CPgQvCfiSCplMq1a+Y7uBcnVsFeFdbSA0CSAYtzK563KWX6JA5aVxqAk6k8z4g4
 hbrz8hjs9hBPpBeKe0E540iDrgZa8Ose3pLYVSX2fGhlGPkWTXFcTW1lXo09RtWAekthRFoVql6
 tSODi6EMavLar1f1ARA==
X-Proofpoint-GUID: uu-rB-pcDUH5Gf95q5WIj_aGDMuAwPjD
X-Proofpoint-ORIG-GUID: uu-rB-pcDUH5Gf95q5WIj_aGDMuAwPjD
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5d509 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eMlgcxtRJz0w_Lr9rQYA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfX9uOyDqiuLIlg
 IHLbJyScIFhPEhq0XnZe2h2bdHcf/kh9mufgannjFDKRJAFODVW1P6e3SaK7/6uI7tGCIrlVkSW
 W+cyMYu31TlQp3bXZq9nJ0GA9W+LejU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120059

MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS: no bridge will be
registered and no component device will be bound.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index 7a3f8afae22d..9c2cef11e7a9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -189,7 +189,6 @@ &mdss {
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l2a_1p25>;
 	vcca-supply = <&vreg_l22a_3p0>;
-	status = "okay";
 };
 
 &mdss_dsi0_out {
@@ -198,7 +197,6 @@ &mdss_dsi0_out {
 
 &mdss_dsi0_phy {
 	vcca-supply = <&vreg_l28a_0p925>;
-	status = "okay";
 };
 
 &mmcc {

-- 
2.53.0

