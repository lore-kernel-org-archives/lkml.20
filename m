Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743236;
	b=c2QasgRaZBHZHK62BHV2bxs5mFycLLCosatVrbmAMHsUdpIhh1HtyaOtowQlE0jDB9rI
	 tkPhyNBJJfp2S+YpwkftXVmDmlDjiBDfV5OaVM5POCXiew+7ZSd5Va5TJAqAfpd+7Gw6V
	 lmzw6UArX3tM5ZNFrccgkweJU9N132vstELjDzQ/t/jh3fJ/O99WnEz2L1kWkPyBYj5dC
	 IHxcSDRONA/eIjHwJpcX1pcS3hYeyDwFaP5nDjTurWx4k4D/VM1jv2a49Ge4tmRzkhqh4
	 tFeMim85V4f8EONrPisDndnYaPvIe8AvBkmPzBzyz2rTXQLotprBWvV5VExGQNOmPPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=;
	b=UX/7LfPkqC4cywdkCikEJc81P/OYm8eWCVZqeOil2ndeU8USHYdPIqkQnvfPdfsyMHuU
	 CdknCT0Yb4n812GUYYSGGaSJymSxx34A7IG7IJdQHoqSbn9yEO4Ea1dXD72347v1UQ6+p
	 XJQAeFT5Lkz8CD15zjaU/k/MxhpofBaQwsYMGBqV2xjmLkSLd2t0PMJnuqIWji/iilI+m
	 7H9xxWlISIWJiWQRHmso+CPWLW8t9wWsaZaMVHoR0aku34MOhLRLb7O/PMrTymO6X4C/5
	 lejhvRD7D3+aoXlq2Ec5kobsroN6x4xNmMQcygC0CQd1yP6jc/tgS03lzMPMiqNvtBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PI0xYDhQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D0aisfE5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5349B606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5349B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PI0xYDhQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D0aisfE5
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FLAH1552399
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=; b=PI0xYDhQ4saNVgKA
	yA/jd9zqnE1sjB1euDP+1H9mg9nZaC21QRdCTZyvzTSWv1juXqVm2CXZEShk1Su2
	qXu21l+QZIq2RoJKEaJLt91vgJH0WFwBXodmouE83aKecv0z3rtsYa7euEpxDTNW
	B8qUamqPjmhEmL14DwiJrfMFBxxkxRRN5JIZ09tuR4XpEj0g8LeHDjp3f2qpheF0
	FwaGzfeFiZAfouj2rnkK3WQT5H1t1PL1tD44w09p9DTrpyrtQCWMzgY4akdc+bq6
	g+2vR7ihX0uK9b9KOL+YCVC9bYIGK3GhWcusXzOk0YIatC40ZnpMGLRamEtw5Poz
	9ni4VA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttney-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:13:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f6f4fe531so115370285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743234; x=1793348034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=;
        b=D0aisfE5nx6Uf6NfOeBj9sqbzSO3q9xyJwsNN5lpEZM+p3vq3sXOVVjWC9GysDijI9
         vfd8+6sfK/iQqVwSzumpbODDOkSfOtZQtZDkHGqUu0WFUGW0TA4y6jtiam6rDDOlviY0
         xCCN6O0e+eR6cMwBnr3iZKKRHIStsCfnmP98/CtvPzEqLbwoGBR/MCH3slsToz0vx7oH
         cX6XZFWdF4Bm4ulWX4KSINeGL7hzxQCwF+j+GZWlqQslKZFANlbldLGkDKD0mGULoiMB
         NlVcAwj1KB6qgzjAwb74CXMVglG6YqtHPoyQpN3jTr8wXiLKh0z6aePOTwRrnmFJ6dm9
         hOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743234; x=1793348034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=;
        b=mxKeBmsCFT9ztUfgMhgepaxiu2vwRou7ZHKh4LJhXcuxDoI4DIxtVs2vBHKU33DZ96
         7VHFGbJiKZeYhojuVk3D92wbe1U+qP1hy/JVRtEJK7n2ugwUacttmEgAj1/sjfwHEEt3
         hOHF/NgqkC2ZPU35uGFACcbiOCVn86lvBwKuoF4A9Izvtdiq4ROeTK6gA2UetulW68qe
         GVn7qusgOjpTPCK2Z66133aR9pQhnjpNuZBd6XhjVE2wkgF1QUCwnXWC8iTxoXS+/WXb
         RTnOJqsHtAwOh4tQFK1FCxEi32e9EIHCelmJP42r1W54y4Op/cRFTTpBcX6ovTFVfEMj
         wSNg==
X-Forwarded-Encrypted: i=1; AKwUvBwRe7HmeRjjVrdi4cSbaAWTkCFNNpXVWqhdXYRmzPNyR5Xz8bsv9mPSuf/jzhfkOkc71I7aRCWTR6XbpqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF5eUepkGzGhvx7eh2XxlYeQ1oym6UT6vTFk9zVubUaS4PO2j/
	6c9ItGncLNIeqLj6OsyaDmvxTjScbN1FE3S/O2FDUa6zf/uke/w4TH161DLFkI0mO7iT7W7bxL1
	b27Lg1fKzrIo5LCQJN9vj4WbE5pOtSwWp9ThENnCkRfhctT5KZssV51qN9A2SblZN+sU=
X-Gm-Gg: AYBFou0xTr8Wv78ZBVyvCBf1rBgWl6tZzy2IcCPUS80H9phuQuBH7Ji/LPydiIYSNQ4
	+D2IfYbqfHJhTs05wE2bZBhGHM3H3P73JcMx+eEedz5wMHupKbF0YWVaw80HvAZDNiBRdG6PxPI
	aTT6WYYiwD3zvL/umsm/xBNVgxndp7HJqgSG2b5DSiXmm6XwdjoINNxuKpURlVG5ABeMtU7gIpl
	9kLXwyGtjOqrkhVy6QykyuLvShR3h0sBsf/MXxEg0EiGD3d6mdFWNZP9a0PmoBdgjkXypU0xWgP
	sPAy7+SF/ocX5nH9L1Qlt3Pf2560jbjyEcqJRZ7KsQR1fe9b9YE4UjNi/2AE+KSmgaODO2juuS4
	xIcLem0McVWq8jHaVt12OJ51vaFh0VXqftIhqkjyLgjrNv7Ui1YrsVKw/Fmk1dw==
X-Received: by 2002:a05:620a:4483:b0:93f:2a95:a503 with SMTP id af79cd13be357-93f6f8a89a4mr288288985a.67.1792743234388;
        Fri, 23 Oct 2026 01:13:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4483:b0:93f:2a95:a503 with SMTP id af79cd13be357-93f6f8a89a4mr288284985a.67.1792743233908;
        Fri, 23 Oct 2026 01:13:53 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c396af493sm14345626d6.9.2026.10.23.01.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:13:53 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:13:13 +0800
Subject: [PATCH v4 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
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
Message-Id: <20261023-msm_gdsc2-v4-3-40b6a71d4e3f@oss.qualcomm.com>
References: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
In-Reply-To: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792743200; l=1229;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=0e3qRwa0eUGU6w/ynL5P+jJBBY2ZfPskYSfmy+rlycY=;
 b=tCI/OGTgkGp6W+rpS0APS7T/OQoO2IecXPOreqBc0ZRsu/DSgV429WyY+mj6uTd8rzy5KXdGM
 0ho7tGPSDrKDCqhc3hlXbGjqPj7b0WuzMT/94IQghTX/z3mRIiyaWpd
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb1743 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GwFvbCpr4qPuEswRa30A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 3PxxB1CsMj0kTrMUalwzABy1ZDaCHT_2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX6lRpqtNexkMo
 cZksdABHicTw7RWnO5ImyDFeKms9Y4GSab7pJ4UJn2iSVLTHP6tmB+8VdCjNvwy3MwzaJsedS/J
 FVzLK07zO2EiQKS6HAWVgJ6qRRDH9lCgBgitUTpO/+y5fNEZjDjH10nYVVMdaQvGzPhSt1t1VHA
 oEVes62srn1wywfGRA5xVlC18mexYKSd8Eyw5mH1Nak8HQiumA0lihFqSwcmRGL43BU+WBiSatG
 g7GZGlCmFu0XFw+58EA3020u4sM58aDYviqzHnNPS8psFVwnw1RcLMmjvPG/Wmj5uAbDCA3dIoD
 7ZBksETV4kIExWkYWx8GWdfSOHejo5oz6KK822pf74dntd7nHu4WJHAjf1NXPUn/BbWpB8nmGse
 hsot5YdyBt2gVxDSFmzkHqO42wvIXbh1xPnzUtGk73MuEUFSmBSCgqzsCqDE5bf5iApsME9Zl/Z
 /vFLl2X1MHmB1O+DEpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX6EMhdBmCqH4d
 UVfNdHMSZxqBt38wSqGZ+AsrWTWH76tbHscellJKXqSi47Q6iBJMvdrYbQuB1NF1+xeMnb762Cv
 CCFD4JAJ/ZtPx1S2BewEA+OaEklKg1k=
X-Proofpoint-ORIG-GUID: 3PxxB1CsMj0kTrMUalwzABy1ZDaCHT_2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230032

The INT2 GDSC on Kaanapali (SM8850) powers the VIG2, VIG3 and DMA5
source pipes. Without enabling it, these pipes remain inaccessible.

The DPU is supplied by both CORE and INT2, so describe both GDSCs as
its power domains rather than attaching the DPU directly to their
parent MMCX domain.

Keep CORE attached to the parent MDSS device because it also supplies
shared MDSS hardware outside the DPU.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

