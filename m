Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200881;
	b=oNpgI6jhuJqb4FF0MaAUDzuuW9bg4DL0ptqyIdrXMOo56+2vXrp5WBGHZ1wFIzcvQW4n
	 iIkz28p5i4PjcvrXJezpEb9J24AVBg60Bt9alVsf4lL0cnwNfdvgOEprfhGb9T0hgzGF3
	 pAr9V5E1YgZfyEcLOqR+IOA7syHgqsn5uIyeLO0uhMe/sA1DBtiKEw063RFGZYdiPSCjI
	 1/0GEUVy5biK3SF5Sc6cEDrxK1djHdcFUGc9XczAbujIwYQlJiW4NTtCzkr+o6UP9RZK2
	 lNWwTC/2LHjipwSkSClr+lgxtLryqgYQqC3AQ9E729H5/0AjOuS8vIuMdPeoaIusgHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=;
	b=XFvLW+AxJqWRuANBTE02b7pTlt0TrX4hi6MsN+4fYoYuRxQvSfsGyXXN+R8+EWLk3tii
	 N5meF1tg+X3MkCjnAoIOWOq7ZSAGa1+sgfczkL8TFb7Y6GvJl3RKREOu4GlRDeR9Ir5vf
	 vGRvir6ywnU1b6hfw4RxE2m4n/tkqjOJRlxRP3uN8QR/PO8o1xbUzve/HAcbqP2hS0zP9
	 P6VFDjeF7DOh7s2jxUAzE18uMpuyzZl2uiujbwnVYjgBkkKHugqKql3e/dFBaPBdA26eX
	 VZDvH5PpzeCLxxPyx73HHFupUpGWPMB+dD8B1gQz4pJxkL+nKDdAU70Vv3OCYS9l8hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KRYNh0yF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxHkwG2l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F37660A2600
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F37660A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KRYNh0yF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxHkwG2l
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFACsP2001630
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=; b=KRYNh0yFFoU0mT4v
	4JaShUVeJibTvkNfb1NC3dTHo86I8hUZD6Cl+hl9C+3prZiaQzptS3YxxtjFSGU9
	DesKvPo4MXAN2DPWY1zPzjfYu8LYhpuHFnRf9WiXUV7zbhjY0VZCbX2PL+6cs2GK
	yLKD5xo2KFMmMIncqfpgazcS5N7jnpHoo3Y6KupZQl/n2axKtF6icblpRdBib6Cw
	WSkPFJkUTB1LaLIPOQ24U5vzZQYNm7MidcJd4WWA6G6LF3/N5PU4ppR5EucnEFGV
	J/yIAmT6NSPbUbJOm/kIToX5bWujlEAVLq+gmFhGuFxVmkY+MWNX/IErOg1JqQK0
	ly7Rsw==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7sm4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:19 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6755fef4f96so1755329d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200879; x=1793805679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=;
        b=cxHkwG2lZicuu4/8H5A4beML2GaDcNHU59vcYlrMeslz/Ys8xdhYh1l+tBIedY2PmJ
         aq5zBwGI7/YQByt718MJIAKGDWuqaxYXBbQUgc+0L2H6u5sAwTZiDIuyWZkHFwB/9JsQ
         7xVyHo0MxYAiXSg0EIOAo0F8dYcW4nz18BaT9EV8O77+hJSkKfkvWVMzRPqBcSkN95FV
         cw8GYSqYH9pr4HU89VUun3ZKbfQeacto1WO3k2jNxpDhXzmVl3NxshaHWGyz476j3kb3
         V1VJF0RI2rxSMnD/Dt2ToULs0MYe0W4kH5kGIZdY9TD2QAUaw+/Q2YFNoawilyxFpF70
         PVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200879; x=1793805679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=;
        b=lHBAKZWld3VE18eSY13gKToCnCoC50smIfNk6GnVWzs0f+PkyZFF7AO/SH0TDFAU1d
         3uqe9AWcDJlIfqMIFqXZqnkJCD5dy/UN66z6fIPaScDgmpQeGbAt+eXVwwdQyi0ylv9z
         l5FwIkHyItRnlZAq/9NVUqT9Gzd4hawHfbhn9vNSOoHsBzOuoCTlEEHFMC/DXn9agQhl
         IbW/oM87nbcf9SRydxznLKvMEm4/rt62lF3Pw0iqwJBkFv87F1tOLUzsJkOnX8p4P0tR
         BrWWbu6l7r5U0+mZLM7b+XGdlqxtP3/ezcHKJk5zi1+Tn0DreXO46fMmbn26RdhkoThF
         s9+g==
X-Forwarded-Encrypted: i=1; AKwUvBwO/cS3G8Pr5yRztJ/gTHfry0KjBxu97S0Q685ANQ5a4SQcjvEPs2KAbfd7XVNKYA38FVx7FZw8mmV3f/M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb6SIDGbGId54zVPC8c6b3F8SdhHYABbVEwMEPbdLXWItT7odR
	1tozSTltpsvSi0jotl5pWzKk+NPUGPRJU0GRltClaZ3tpxPvEgMuv90/ZtiHNjgsZ8GucTMwRla
	Rp4LYVT1w3dv0I6C75ETgnsaHPJzax97nfFGg4qQ7els7aOvxSeZs+WqVFk29Bkmin9A=
X-Gm-Gg: AYBFou37mjzZuCt3u1H2vphQQzF0/ob87lhJIllBE0a6GGrqEo5kJUEul9vMAg4fiaf
	M+RinNHumdFWWIykmOuqeRKVtCplHAwItFR+BsiKaQW/SzOKt84PQQMt+NKsCwvcja4xgkiQ+BS
	3JNpvN/els+J+LPlP9ZU2eZ9+xkUGq9w2YuvyvyrEvVESjROdezy8EeU60SfVhH24g8tzJ/QC14
	xsNmBRK24BsblWmusjFaOsRhK369kCcfzlmmoMcKr6XvAEzGU0CB0Vth4Fjmb9E5dpNO4x0PrSU
	Nf6EQlNX2zjeiL0TEyySx1iEXOeX36uhLAEiMr7qk/pZOrCqx/UNjs1bsmWfChdqNOsx73d7uRy
	aODWvoMQGXyvW8JJQwwRd4SqHM6FyVFO93ai47xindyy5zr2ZRqJRaqVZ+E6n2XycSuHMV/FHGE
	Y1yveY/ZOvEeB/Jl/YY6ZfVUcAVBzTqNGMgTR87/PxEMUXRVWDBb7wy4D0IVoB
X-Received: by 2002:a53:d20e:0:b0:679:cc49:55c4 with SMTP id 956f58d0204a3-67a7bcf7ca5mr1298194d50.78.1793200878646;
        Wed, 28 Oct 2026 08:21:18 -0700 (PDT)
X-Received: by 2002:a53:d20e:0:b0:679:cc49:55c4 with SMTP id 956f58d0204a3-67a7bcf7ca5mr1298159d50.78.1793200878048;
        Wed, 28 Oct 2026 08:21:18 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:17 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:41 -0700
Subject: [PATCH v23 07/15] media: qcom: camss: Add PM clock definitions for
 Kaanapali
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
Message-Id: <20261028-kaanapali-camss-v23-7-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae212ef cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jNWLojqFtH_lE__qK8UA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-GUID: nIrQyLUPr-Kcy8g2Q30XIwB2mxhYcLHf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX3n/sQagGi2tH
 s54si2ypITZ98ax9UR/69ranXZd7W5zVOdOLZ2HmC2HX5nkxTScLS8b/QXMvtc1pVT58zPpCa6Z
 iJM5X/oYtpFzZK7KjmmqUt+cUaEUou4=
X-Proofpoint-ORIG-GUID: nIrQyLUPr-Kcy8g2Q30XIwB2mxhYcLHf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXxWU3wSFFfCAv
 wzd8LOAI6zRh8hmJtuGW8Hxy34eTVbF5hw3+PMFhCFRBOaxVDZDOCpdnYPBmm+ft6WTb/1w0pxW
 KITe6enkFgA6I3KKpC0D3CiscRURqBKJ6zSsT4YSRMbvPY44oUg7gLiSIvc4onqRoEnh5NHOHHR
 jU3k0u7Ucau2IAW4XyqAu10cZrtCtQCGz0DggvT3gp1o/IoFudFAHDD5BHBx4ZFyBI4ZdJ5ZeEj
 tl5ShBkLkrYiWKp+hpeVqik4FpfCCfD7mo2BAHrgDI6opZ/Xzu8JGGpP9/WMRrisPLZDeBGb8m/
 pX/KrdAXtngrs07oRDcW58inbRNhQSLgI+15rysZKfct0r5MmFjUdav1kYosOtNewANFO6bKXX1
 IybjF+90PO89NB+wKob4cKBHPKfnYscO7FTWQKSvGpc94xwVXQLqai/vg9rxhTg9DgzBpVEKa7b
 SKAEbq6hFdnt+AUuMJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
sub-block. Register them as PM clocks so the PM clock framework enables
them once when CAMSS resumes, instead of each sub-block listing them and
taking its own reference.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 98ec23c39fda..a64242c66cf0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5606,6 +5606,7 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 };

-- 
2.34.1

