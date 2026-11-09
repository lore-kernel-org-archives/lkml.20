Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213434;
	b=y4izO87d4lZLNjAYw4O32rXue43TqE7MSw8pYZs0deqG+Dl7KNhRgHC3IR1+UJhizd0h
	 FNG8gaPr8zmYcu98R1cKlnivLTFYxpIpY7WDqMo/MRTcr0TqU6TSfO+AF5IKMsgKoOk6l
	 CFOdW1uA03xp165SAJ68It8PxTuLCmLseAUXGLB4omn6IfQpIUg+3O405pvXmP8J7O8QG
	 22t1Z3hx02spPNo6RLG0pyPCezC2JHQ7L3KRv+5g83CdpN/E4DpHYEjtJZt2sw06qJMpT
	 0UEnchXua/ZZdHMKzXjcWX24GT1PJE1OwuO3WT4vGdnIwVVoC7D69XLYQJx8LFSPOjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213434;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rL3BzTsPRbdacfMmgW4kuPbKSzAfAI6zxuXuHJ+eMAI=;
	b=uMglbreo/YcMDLR62rduPgj+5I9lOFvDGh6HhOSW4UXEXgAJF8YflTpSXGJVQrxYo4Ou
	 cujMXuBLna9sP/bMTKiKFFtGjyBl1P3tUreV19/ADXpxmxSiIRmFgqQv4sNY86GTYuxf6
	 RSEA/Oo8u2xUuOsxptPAfEmGcbRcI34ZR3J9IDTPFFZS/eN64Z3A3loZmPnnQt+RURYai
	 RlT/8EuZypyz+0lLq4c5SUBrCV+urPGnt9PisyjfYoFmm4bJlOeWAcHtp+qxPBarO06jH
	 pVXdZf0i6M44SUabBCnX0h5PmH+4Ju/F8Gr/q4yWYr5XKCEXLSSkPJ2lTQQn2qAP2rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bugPY9ZZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ng7/9hzr";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766CD606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 766CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bugPY9ZZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ng7/9hzr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AX6f066290
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rL3BzTsPRbdacfMmgW4kuPbKSzAfAI6zxuXuHJ+eMAI=; b=bugPY9ZZO+xDwEYv
	QOAeANmpmkJ/JaJ4BFirK3JeT5RiLehMtR0B/YBUvx9yhLxHsYWtKiW4OGdTvopE
	VNJFd9clAYs3gWM9DNWS+uqRCVRI8tn/IUKlH5NcgCntYevFWWaQR75HA/48tofQ
	JkThpW+0eOfVrvDs0MEMuf1UwHIxtHxLDkJceEIQxqlkFjKCp6eePpiM8h5M1259
	xRCFvoF5mqATBtnHWWoIYviaqjudJkk4BfLsR99fWZZQ1VaNXspLEeqI2sXsuOF3
	WVTxVGzdVM4CGUdVv64yVkpTNROgy380dQSZmuYEOCUhnUh9T3fQLFkuGTGyMjsh
	0CycFQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxdhjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:37:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ea0c20af3so13270696d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213432; x=1794818232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rL3BzTsPRbdacfMmgW4kuPbKSzAfAI6zxuXuHJ+eMAI=;
        b=Ng7/9hzrwu5BLi70fySe1RjoytG8/2grOghCbGw700xceH9CyfgervCt6mlJ7QcOOI
         QOvbWMmSq33CacOj+a8hoCA3RNNXhD9wtYeyJDKHS1D8Pxfuf/7UJGWSpLE1cCpwv6/G
         /57R3L+pv9Dvss/rWmzlaqyNx2ErIdM+C4OiKKYNA7d2MrQOKh7PSuBVXIpEP7OxtNno
         i7MFC9okHP8rhEZjZuctf1FRRKrvDU+JYWt6ZNFuqQl3mRgrak9M4smC9lyPB2/vOwhY
         kwRJhERJ7mIXBqNC11ZQomOpwI3+Xw1piMJYNkAuh+fZpY3AVsG3Rw0V/hPICjRlMYrV
         P3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213432; x=1794818232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rL3BzTsPRbdacfMmgW4kuPbKSzAfAI6zxuXuHJ+eMAI=;
        b=Yq3HNc0/cmFphd7BBs/c1d1kT9p/7fD5q9U6ksbgZVEZyaelxfmVY0pjtNFOTnr6Va
         /kvzhxVnbmReRMOGJ1wWXZo7ckvaCYXRBxXzhaOMmzEfSrzqZlvOMYzCQMPQ9ZniiBdl
         JN7q3pQNpIDfqOesrqZTeRJpwAqan5O/zkPCDsvfaIDEpYgZNN5gD18RQiaOLa1UYnir
         G17gozy8jGRbnfe7AuYSrJ3nP6cNYDf6EzCnv6cCE8s8VRT855+DBzoABf9f2aP0aZzg
         on2bLbm8DkvofXR1EPrYEJxxgHHEidgRG0tgxCPHGcLA32959m48IAguf8nQZbTGKxG0
         8PhQ==
X-Forwarded-Encrypted: i=1; AL+hErGV1LR9vIcyvM4lFLP9+nR5T+4zPN8yo9hro20wOVjTXYcQCzkxR1irskJD5aOeYKlCO9GYvs/QErONF/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z89zD3nxyMoiLaj7mURObSr4Xd9qa963ty5KZIWKQsfVhOxWgMf
	NltieqF6NIxa7jqX2WurDzWBqJBNlGgYLZrSx3c1FHjU9w6oWqFNw0fN8iwJFN8DagEn5wWbfq0
	fMFUpJGcOfK/fPnyAK1apQngK2zIlkyPChli2+/Nw5XeOocrLoOOSPcm51nU4+o7U6Mw=
X-Gm-Gg: AYBFou1aZbUMUuzoELTYsH43Qq1kUqXtlWiKk4aZHLcgDiy8YumxmVZJ6O2AdyhJ+fc
	3jLdv6OcGK1aH1rOZASz/r4xObBj1GS79/PoGJAjFmQJinDpeDdyDGV/CA7nUkNOYVzU2pVBLAY
	8uu1iS6hiubgDJwbDmLN+KhxSAu97y2sXWCiaRH/GwC0myRsDX2kkRNbb8fH5M8CMJYrJOekWs8
	QR7O6ZWneoDFQlydWqNvGcpwFZUZN5i16g2WGfAHHTK6KGpzG5Ho+vz8MSsrJ1p4pw7iRgEe2+V
	sSNxBsx4MllJPw2e0cWzFcPva6zwgSDA9rYb5TF0yCIcbUVOPVqeFoX86oZ8k5gtq18/Vfk3rOR
	TCNo5txrS/XGC/zpa3MCSDg+EbERtsOufzMLRpIAuiIPOHrwJYqRu+1pg8KH5uWZMoZH2zxDKXX
	R9HEywGWkNntKhbmsT2+pBXpYgy93tjzhw3MY=
X-Received: by 2002:a05:620a:a18d:20b0:947:8f05:39fe with SMTP id af79cd13be357-9478f053a98mr202380285a.77.1794213431800;
        Mon, 09 Nov 2026 00:37:11 -0800 (PST)
X-Received: by 2002:a05:620a:a18d:20b0:947:8f05:39fe with SMTP id af79cd13be357-9478f053a98mr202377085a.77.1794213431241;
        Mon, 09 Nov 2026 00:37:11 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782dc37e5sm418223385a.34.2026.11.09.00.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:37:10 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 16:36:37 +0800
Subject: [PATCH v5 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
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
Message-Id: <20261109-msm_gdsc2-v5-3-4a3159b5e4b8@oss.qualcomm.com>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
In-Reply-To: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794213397; l=1333;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=d8njmLr7CV+srDgKgb/TI5vSyT8vzzb8i6MXu/trLH8=;
 b=Lpc1jsqk39ukAc6Ha3p3NCpFtR4N6RWJAnPu3s7VJuOwW+CSKXIHIBpWmc/Ry+SyF04cgdHW6
 0UHN/K9ayQcDPV6pRIpXeSacvtn36fRImuv5AVBB2Fl9pDrWPlIHDX9
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: grX4nVHwPhrKanmO7RWNWf-Os5BZivAP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX30byUa53UlVo
 s5jmj4Jy/St8eWk664Ho0nGIDVQfZ9eVVhdfRPIIrAzvBHNr+m38ZyqIxpeSRl0c8RrP/4AL8i+
 CzNcuRIDXT8toBFNO3DjN6PwHzAw5F5K4wRdCCsBL35CVU7Zx6FfpEr0wvNAMAawxBgpyYb0lHM
 5F3ywfFfqW7gyKtlZJs7qW+GIvfEabRVCuW9oVUb59x02r7mWq8omtqX1Zl0SrVgq0Bd0zN7LVv
 Nos7NjwrKsIWqzarL00BJfM0OLFvIAHjMza4gFzdw0mQKmnHiaSwXR1Da1mP5Bnuu7S8VCAF+3u
 DAhYVH+OPCC90cPPlX7gbGAIRGFCpI9T1Mnd0+fKTr50uVqW5TY6s18l3veRNEv6AjnIkkDtpSU
 94TdXDhG6jqtmV++HB2wR+4YICoO/72Llki63UtHfn39HiIpAZYjaynTxjIgb/bf2XXJyUWmofj
 h/Vp1hU7EkFAhLCT1Gg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX/VXU2xV//2zp
 KbDoTDj9wYy+SnYlMrr4OIq6gqIiRXSgHIW7f5fefE/WDobEIwIK6FNxe8etwfEqtnZWipSj80q
 g6jPtqQttF8g+vj654Ci56uRe8pf7KY=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af18638 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=GwFvbCpr4qPuEswRa30A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: grX4nVHwPhrKanmO7RWNWf-Os5BZivAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

The INT2 GDSC on Kaanapali (SM8850) powers the VIG2, VIG3 and DMA5
source pipes. Without enabling it, these pipes remain inaccessible.

The DPU is supplied by both CORE and INT2, so describe both GDSCs as
its power domains rather than attaching the DPU directly to their
parent MMCX domain.

Keep CORE attached to the parent MDSS device because it also supplies
shared MDSS hardware outside the DPU.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Joonhoe Kim <26rote@gmail.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..98d367b9dac7 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3674,7 +3674,9 @@ mdss_mdp: display-controller@9801000 {
 
 				operating-points-v2 = <&mdp_opp_table>;
 
-				power-domains = <&rpmhpd RPMHPD_MMCX>;
+				power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>,
+						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
+				power-domain-names = "core", "int2";
 
 				ports {
 					#address-cells = <1>;

-- 
2.43.0

