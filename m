Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616151;
	b=Cu6R3KJ5jAPZh62gFxFPswvdf9x+smGXq7IR/nq7lfW+YdFlTe5avdkYw9cRX0IRsGtP
	 gJ41B+MnPLJWcRWRlZ9Nb9saDPr4IWsrF6l4nQZyPnow+d2gW9AhHpLV0L/0zppJNuIM2
	 8r2GvsIb4FnMgitcB+Xv8y0t5TtdaE98jNFK2xq1P9FwTLnD8034ajNVZHDN8OWIMErUc
	 SaNUQgUcseogB9R61SQknhb0B0wqL2WaZoglJq/GQAHKAXGn65EIJ+IPMB5mhCybVMynf
	 P4OPrAzDHaMFDPXTVanCXCon49Kt2bGiAlguGC0ShI95VkghaA4l6JXSWUBjndHtA1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616151;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=;
	b=Mfj5gsfLBIfUF3pi+CTWhw6xWu93+sbv0OQbn8Wi21solDTpJos/Dt195tVuSaglRWW3
	 ZKJQ1freGsvU/L/qyuZMJjzUgICUIIcY2+mDrbww7nUvAYGubfmHMe3snIoQvt4WaO5oh
	 EWt1uaaYo5wRrt+GujB5X4G5tZjWoUYMU1rPDaBB4xmIHKLbi4PlQ060VjWpsl4zYoHSb
	 Y6fqxqsUhIhWG1FbHO0mVqRluBpnEZzdHyz8qTKsSRa5An4HhoA/jt4TG263/2Y1XDPo6
	 +Y/yQp4lBE1bFnemoCD4+gq4Ag9/J/sdx518aQfrGtZ8YC1PeMAjX99Arc/PRFxW8VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="feLuO0l/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRPg2O75;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6673E60A2627
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6673E60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=feLuO0l/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRPg2O75
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ANGt1821268
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=; b=feLuO0l/CT2ghoed
	uWCaqsIZ2w3ODay8cdCXrpqJJAlh3aK0fZ6dgD0motSnF7FBmwAUNfcI8j2jNpoH
	wZL2zQ48H40pkLtHNzjSuaZx9hVzE3e2cUi87n0AdL/iX/lfYvixOAgtIkm9toqv
	OIuid24eBWkfw7rBeyamFIVa2+tmGVWBBPKBB2bBxWzV/sJMcKZ0DSb6oF2AB7tl
	TGkWkB/IsAd4UmrEJdONMYIoAv4ZSxwQAYg+ky/QN/uWE0prZj23nG7I12TywpuX
	hR+3Q/I3JbsE79i7GV7+/TTzdclL9Ccz9yQQEtIdrX3Rja2f2T7syKYUic1sYfNI
	/qi0kg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h8vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:42:30 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f9b643ae53so2507966b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616150; x=1794220950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=;
        b=DRPg2O75oPKSxOXYQNbqEtY/HvWI4vPlEEzIw/cRp2iimgyHDxfebX62QPSais2HUg
         abMcx2aDq3DpEl3LZG/sY3btJIwMUDx5ZgIpjpukEbd59jy/qk4BuBmEA40LxQpxTc6F
         PWwucg0SDTR3RpJbjhD8/F2eEkeCp4CuRMnKp1DytBh1xGn5nWNl3BgRDt+Q1XEbGCvp
         xXr1F0be9KloMEtWNbS0FBsA9I/MK33hmElQCvKHgJ3n3IUwDIe0Zr+BKNZQqhXBW2zu
         biKWtTjz4nOj82KwlMHEJqE+jXw5F2FW5mVPpWknZxxl/00OpctP5okPmVYTTq3uQP+i
         TxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616150; x=1794220950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=;
        b=1jQX6bYc6tCbeAADhDd3tJBHdOgh/UcDGpdDy/7Gz1U14zsv1F+pnNKjUUCN5FwD6a
         mR0Pibv3APU++qbW3ADoCuQ6d3BuEqU5XVL6S/a+4uA/Htzrb/79Cd9c/k4MPIwXBy15
         xwTOdXN4bCYc+xiqwtGirLLSoniY/kXohiuSDHcqzt1MW8Gle/UdVR2OH4WQfBoJw7Rf
         b814x1jesOEe6qnGuOdpBdenpBotZdKMougo0PPf57UzpS/oG/b0hYLt57rmM6pFq5cj
         LyTBVcUUIpto6TSvS5siQlB2p9MzGjs/JrlfhaKjtGw1cGnsQ0knGF8yHDtf8SclWfdV
         LI3g==
X-Forwarded-Encrypted: i=1; AKwUvBwZHfPcCPXmh9XDr1AixsDnRwvcpVgSKT3HCc5zTmUjSGN/QqfcBRRyH9cqhJQNNuWQWaZiXlpiMf455cA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3slkfRiU98LlxTpdqnxj/EE+jo+rkhxOsxVPWi/njmJlz3C6/
	pICMRTjwtBIB0FnQ8hQE+Y2jh4lS2JVohX8sMgRdax/dyYFkNRxpV3edfaMvJukn+4Y0G7Kwtio
	ZpIulmK6+Y0vJPWrkpMv5cmrQuTHs2jKf3/8NuzvhKz8mQ2v4sfuj8pmz0Jc+heu77Hc=
X-Gm-Gg: AYBFou20a0zBQx5Adz9y11TPLyBMSYis8B+fry9gBTGb4+bpz85oorbnayK0Q/XFYYC
	BMZYXwEn+B8t5fwr7qA7aTGOk0+md11z3WprQTz/ZlLSwYWq5xwdvxndTbTRXW4B2rMIM3WoXf0
	UEAumjtb8hhEyKCDRYZkm2mRhBlsGmLZotai3u5qqX/+RpDmW0xpjWwVKAGc3eFCITX5QcQ49+I
	MlawnLcqx4EDSx8x7JPQdG3Hr/+Z4vLU4rweROcsJh7OvaKSxC9PHO1NXfJNV4GelfqKY/eBauN
	h6vjWOvFn/MFsuXMS0j1G621nhP0UKjNbhYqTm8m3dwnKv/Wn8I9s6GTWSGI4Eif2m1lGcFqzoT
	AUWzGfgSYUIq9drD7nIrFCbE+r+Elum4kgAoqeDXB74IFTc1VLJK7rJL/9RcIYBZM3Hi/8NQE6J
	FGGacBDTqX9/3n3HhjMh8h3jkTXG/rr/+gc60eDm6NVTGkMnua6rzbAiV0DT4=
X-Received: by 2002:a05:6809:1c:20b0:4fa:8d48:3a6a with SMTP id 5614622812f47-5640dc2a78bmr4290361b6e.18.1793616149878;
        Mon, 02 Nov 2026 02:42:29 -0800 (PST)
X-Received: by 2002:a05:6809:1c:20b0:4fa:8d48:3a6a with SMTP id 5614622812f47-5640dc2a78bmr4290357b6e.18.1793616149487;
        Mon, 02 Nov 2026 02:42:29 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:29 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:15 -0800
Subject: [PATCH v24 07/15] media: qcom: camss: Add PM clock definitions for
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
Message-Id: <20261102-kaanapali-camss-v24-7-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 4M__dOnXTqKUuKqu4Qlmb9aiXi0-8N1o
X-Proofpoint-GUID: 4M__dOnXTqKUuKqu4Qlmb9aiXi0-8N1o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX/FHJKr+u+5fS
 MOVc4CRog/mpPuKobrTwausL1K4Jucg4KBAB7PTMSSyC7xk4tmUd6t6YhHQ9oOux3NbIbqlNxGC
 N/UHP11VznlNKMaxMWSiYAF5GY4veYA=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae86916 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3_5DbsQPI53TjtTAKikA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXzgi8r0UuJdpi
 GwRDpnyj50SbQxFHkJzBCSTu25y14+SM04Zc69xqwRwtq8CSBRg0ITS3Eh9w1WFWZ2QZxjX8H6E
 8Mf2KiIYHguGKuDVVUERuZuEpnz9/YYkgb/SGd37HfCpmrSIPRqxJXYc0QBardPjkfIKpLDBzhH
 Q4WAu17qRqUZmE27gltE0RGobFjwx/VidOd6m2wwkaAD4ditMhZsdEWVCWLpm8/rmqz/5W6miKL
 bLkzoz91Ag0Uuabe/KF+RTOEG3DcB8hX7hhh9ZmCjSOmKmV68fIHlHCQtoqwmvDuxdjY710CwUs
 WDA1IP88h29VtDjj1JXUS1hYd8Mz5nhMAD+hEfAiHBHwjeyOb94kkm/EIGOJSKWtvkTfiC0668Y
 2S+Y+126fbVsW9E+yQpn62vnQV+E/8jRyH/M1mr00JhZdggS7IzGpT4qNQUx9HApaNDMIl0V8Ch
 Ik68svtEiUJNkxY5wzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
sub-block. Register them as PM clocks so the PM clock framework enables
them once when CAMSS resumes, instead of each sub-block listing them and
taking its own reference.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 385be682e8b9..3857515aac7c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5606,6 +5606,7 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_kaanapali,
 	.tpg_res = tpg_res_8775p,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),

-- 
2.34.1

