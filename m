Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662649;
	b=mLO1mOQAXpiE2qI4kkZjf87Ndua7VSIqyGRZC+PlDq1JYvafEuTKGRcRDICErc/e8qBV
	 ubcHxd55qOnk9tKjiuiVJN03Ncbm+4ogNkMCSFdnJcjp3g5OGW/+6k78Hc5jCim+Ya2ph
	 YK8S6vTvZ3cnCAAS6YpL651dwsAYnBaXJWUg4iC7YMyhFPeIW3RoSf1qi0YG2n6gDfYtj
	 OfIP781j6vBkHtdGzO1AOTu6W0w4VtVHs3X23bP1tEc6DlO6Sc2qHteA4cs54uzmacXxf
	 JoY7k4xHEIMho4dWmKxKM99JkkiuZIZUI1ziQAMPZzWC0Td41TWPFZLYHCRs/QPRHmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jIyl06xvEjbmEgUN6wCq6Gvrcm2kmVA6lr/5VlMLNgI=;
	b=mIyohcJgknF3Izzkm/A3yvOT2JwFJ8KuYGq5d1BDI3Kjs1uhGCuG8JTqwJSPZsGuzJ4f
	 VEqZ/e1P/TBHETvrbF/2oWxnnzBecEpUBm2DLbNaPnH+3iJn7GRUzyUWP3dmOyIAAqZxL
	 DnEEO1ZV5G8B0EoIaF+EIQuywspt8Hs4t9uqidaaFCpGAia7Z5dtzedL88iAhXGvMSw9D
	 CD04JGnBAzQMS415vicTbKJC0MdHknPoKsU0zqtk5rgEgR1bpnft5XxDhEpUKLS1ZAexl
	 qZYvf4OBeemIQHh1n83tJ15jdvO1K90zOo+ZI7QXcYt+iu7/qZpnoqBdSugeqt6WLLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HTT41qsh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eJLjJ6AO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853FF606A327
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 853FF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HTT41qsh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eJLjJ6AO
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70EQN2516128
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jIyl06xvEjbmEgUN6wCq6Gvrcm2kmVA6lr/5VlMLNgI=; b=HTT41qshpAamlNKp
	XkhAwr/7w2gIL+xH6mvR0Lv3CPG9e8dadkJfJTj69HK1GTHzuNPyxu2xUoWlSSfZ
	Aer1ZhsCH7GsK0iQ5FDa9iZhjVIgBjmz925qrTZOKREBiPrdw9O/ZPLd0Zv3uyG8
	eB5+lrJ9VepwQPapibS4LvoJjVHpy0P+Up3mPrkd4mkw3STfJlv8XNDt5z88qqdV
	nzeJ8Q7KSnYkrQl3Emuulhb4scTyy6wXMy+dfeycRqtP3vF1Wi2njdLwaSd9Z9pA
	O8ta8o+UcUQE3ZYsrr1QGUqcZvVjc4vkRnjYntl79M2cCgKQgJNolB5QWJy58JW7
	3WfCaQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9t30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:50:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2769888eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662647; x=1793267447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIyl06xvEjbmEgUN6wCq6Gvrcm2kmVA6lr/5VlMLNgI=;
        b=eJLjJ6AOJ3RsfD9yXaFtoGeM6rF/piiquIb0Ci+GWDhOvgEl7TPdeiv11nntKOGyPY
         ttHTqtaP1MQvDnj+DZmMIvepqnaU7g69uh14OLdfCcg6xIQI18TvY4tKDseaVVe7KIsV
         ndbGUSCVgSfoAsDX2VITJRjowGsr4Dg0vNd1asnMcPMmOGQIa6vukH0RiuoYVOf4Ti6H
         JY5EFdznd9a4DWTp2h+hfs3QjQk+ZssTLJYhf4UcQdKqQ8IrDM1RIPkh0PKWC8x83H+3
         C0Qjabb+iULh8nxiEer70/m6E+9W5k0m2Mrfa4wmigwXiEIGuGRpu48hzUK0uS84O8YR
         AJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662647; x=1793267447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIyl06xvEjbmEgUN6wCq6Gvrcm2kmVA6lr/5VlMLNgI=;
        b=NKyliXutwgEclxCZbwDasR7EhhWu6RHo/sr+JNM/AMMWQ8JxDBfkJ04BbrRjJ6xHX5
         ed2bTriUrjf6OwrmJonr1vc3gVw2eijzMTcDAlYjWPpnKqWvnBCm1XSiAFR2dn0zKw35
         XwzoL4qhe1tpk8dv5Tn7fYJiMEWfmrljopsrheWxrqTvOmWzDjz9hsPyJN0tMdBg3vS8
         1nLFefjKrHoowLKya1Fxrb9MobFMJ63VZatj015jXdTVU5Rhd9Z8eGoeUJjTN2r4Votm
         bOpVHpZbnBgybNClfgJGSY0lejZmn+oms10/NArEfSglKx70fT1DjFstT1LfQJHHcie7
         XL9g==
X-Forwarded-Encrypted: i=1; AKwUvBw5ysZIMynv8snyr724WwI8jfo0+4B+AJwVEczaasttxOu+ft/W3UE305j1C95i/dYFt11AW64vvf0x9cw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1jNRXJrLpCx6biCxAK0vLld1GOpj9XAEFEl8HxpcxD25INkyK
	wiB56a8ZWd3Z7HJKXIN08w8ktLIJrTf0bQufNitVRxVaxzeSDm2VH+rX2MWbCNj3/Hx8m7pPxA/
	H+9NWhvPdWPhQZ03e1HyjhdlfvGblBuCDQewmMfxWbmJVlWeqEbJQDxYGcw1Ac8/6Uzc=
X-Gm-Gg: AYBFou16KQkby3jMcxiOGWJmUmH3Mk/vZpgJ0/AQNtjqj1qOcd9/Zw7vl6qg79u2RYz
	aV7TmkXL6BvwM/Uf5pO0mH9wUdR6g/r+C2/kEJgxYhRj8wzvaduzEXFLs2XswkTDl/p7udS457J
	X10FwHqgk2l+pnBcJs+mwE8HXaw4BFIEHuuSGEnGYPbi6Z/YmarbS13+qgNy4DnvC2hU6Gf9pkL
	ZsEnSLH2hWPj15oZHTp1zanA0lJNJ7OocYz1xfxgaPzvuAy/wRy1LBSWUlfbFr2GrQxY4Tuu5oA
	GDEROd7d3CS9s8mIBHCC2HsInpBQtyN4zURGANWpEGySkbAfvhy5RuvKiGEzYTEy0zH/PqEWj3w
	WIftu6+Dk2mpWjisiUchUJ6BbeumT8ov/Kfo=
X-Received: by 2002:a05:7300:ce09:b0:360:b8b4:840a with SMTP id 5a478bee46e88-3674f11d98amr6099367eec.39.1792662646483;
        Thu, 22 Oct 2026 02:50:46 -0700 (PDT)
X-Received: by 2002:a05:7300:ce09:b0:360:b8b4:840a with SMTP id 5a478bee46e88-3674f11d98amr6099342eec.39.1792662645949;
        Thu, 22 Oct 2026 02:50:45 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm14418035eec.21.2026.10.22.02.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:50:45 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:19:46 +0530
Subject: [PATCH v3 5/5] arm64: dts: qcom: kaanapali-mtp: Enable DisplayPort
 over USB
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
Message-Id: <20261022-kaanapali_dp-v3-5-b5ae8e6083c3@oss.qualcomm.com>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
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
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662591; l=751;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=Tc936ZVNQW6mLGok/m6D1h1BrwXL3txIdA0BfJ6MmDE=;
 b=1GX4UVZNZHB9/gF9/n5KSTlC09POzm0NxrliBtqGTowzVdhcXY/VFZU0aheyhoGUqqeHZyzda
 a+/S5i3EghQBBHopSjP5F3CPKPw0q1SJq0X34AvkUNV9NbMsgxJSAyn
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9dc78 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5UEAqLcyi3SyoXtcnFMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Uzlesq3JqpKNkg767heXlRZ6rlLyRtab
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX/Voe0Mortw1P
 0TQrVASlTTGhr1ttWkkPu8VrHSGc76vbvcXVvYV8aKKhmOZwBAPlZizeGwiJCkjVGtaEXpqXTJ/
 LPjdCj20GUl8cq4Yq7/SBzkJehNx/vY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX/eQtwPiWHRo1
 4YzitbLpeMfCpEUcmZqfbdMBO/Zs9lRnaTGIRCG1XhVGLNkdGcXSXmlYeVSkeeOovsrbEliBLwi
 gHXwYqXwoXFNnP2Bqe4Y++6g8TE75nE9AmYqcSfeeXDqjfeFdqXrdZisc44He/zTA7u3jhsw7jI
 A4I7BRsYh5GLUq0tStb/U8mM8A9YJ11VLNYV5y3Q6po1A1LFCH0g2ccgIPT3lICtvt381dhUSbU
 WjVdKugorLv3f8rNkCAqLMJeJ4JCzgNA/a6DV+nrfAc10BjPhw1cM9Zt8wgxDUGNQUFgpfR85is
 4hV9MO54WN9lpUIawlT5cZpm/uRs/RA6OkCqZONSp2Ex1r/l/FQ2/c1ocp1OdEasKw/cOaPQxMh
 n/2rd0rYfP459sub9+oT0BrtvghM1NdjbIQ4wctjU0C3w0xcZ190ddwVRsBdLq0ToqTp8kvQWtm
 khv2RPIaXtr716KFhHQ==
X-Proofpoint-GUID: Uzlesq3JqpKNkg767heXlRZ6rlLyRtab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220039

Hook up DisplayPort parts over Type-C USB on MTP.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 22eeacd7aecd..bcfd9e942eaa 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -976,6 +976,14 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l1d_1p2>;
 	status = "okay";

-- 
2.34.1

