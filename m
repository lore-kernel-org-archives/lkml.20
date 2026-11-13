Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558570;
	b=p0y42OWJ4EGsLdqsAQAIgKRPxWnOCKZulmY7nhzxhZGhnf0WUey/LXcsIue5D9b7pIgD
	 V2hib1EeM27nqW6QW5ordnnaHpk/6xT/fNl++cZ3eQvc/Xw6f2ek4BOa5WU7Yqu+NKGJQ
	 3HSIS7Lg4uUsY8kruLrgI/PycSwSPGe/9KzssE9Ku0VwdmsAfxudbghXOZVz+Q0t5vHiK
	 tR2ABPfAJublj6RR6JBYNeCYT+vjTOodtILnIzGQFVEkZyRveTXIVGraeeMHGPnmXF0JW
	 ionFyqXK0JARIfKgM7Gw0tI13X/jaaaaUBwy7247ANAiFO2EB1pSBRDJBtAPh9P37ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XsuUo7jK22D/dCaflr7+ggdashOIplcmk4zE0IlhM40=;
	b=GUWNyeHJw143KaYJ2chbdGv4ACorQ9rl2icKXoCaFRZhOE8hfI3R1Qan/oev518aSNhH
	 /65HbJEog5DuQzV4IV2V10HInLeyFeo4DaqAjx/qeaUe/IE9DFc6NpwRRpBfaIxC4H9P1
	 XRU7XBnnMsbcZ5phoDMtZzt0TD89Ss/iTqB+uncCj54odeWj8D9WYiY4gwE9OZQ5lTxYI
	 dAyKUaHelwRWVX/j1jubvva5Ts3FhUqexsy9UUPJiX86YHnlh3dCooIJg79JJznyg0p2h
	 U90HHH2bSS+2z/4It+S0WHqXNXHhMpHWQfEMlkJ2SQB5s8LNv2irJydMVx0rJwjIzxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qb0TWN7l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EhxLr1oI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB0F606BDC4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB0F606BDC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qb0TWN7l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EhxLr1oI
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57BD93283384
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XsuUo7jK22D/dCaflr7+ggdashOIplcmk4zE0IlhM40=; b=Qb0TWN7lI0YE3iZX
	DS6ipaJAgXiHQau9h5foS95yhCRXhGp5OjbhuM0RzxYkNfQ88oGJC6LgwOAiM2GV
	G6EXkzgXO5Vonc3Lr4DVtDrqO9q/ngxjWtQc05udJgIvnLTexrYS7kFYVUnkCFCN
	yQWeoFLDt5wKSRHSCE0SNkRWZYOqqh/+ZweaElROKLfInWU7NX9VcXvHmrhotu+/
	L1I311OSJLHhIaSUFP5P15XWe6FmxVGeag0ns8A9M6u8aAbS5XtMKJ4ghM9Aetus
	vQwHaNKMb5/pIDa7sf6ePdgYr0F5C6yz+Qe5Tvq1Nl+WMj1PTOhmzMcDZamBQb6v
	RRLb7Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37gpte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:29:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-535252004e9so14316771cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558568; x=1795163368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsuUo7jK22D/dCaflr7+ggdashOIplcmk4zE0IlhM40=;
        b=EhxLr1oIOEHrYxQ4PlpDgiWJboOA1/kcnpYKwx3zliZwPj6oMOpHMAV57pWkXTrg5I
         uI794r2YAmmB8bUTnm6ypvVlH/lX7C9s+labosOP8rRO+U8YAJ8Vn+A13rk1I5N8XiAK
         Ne2WaUbdNZs+veIariloclv9sjKbLXRJ5Q3urzqJPM9WjtOtjM5ZuFWWIFoXumI3EtcP
         SiT/b68Nh5sdfD93URb9mB3noN2J+S6qKNXk13rJ57f60gkg5ASGAgXNUZoFVFq4CP4t
         j+YS//60WobGUuk7PIv7fGWwRpdj2g3lT3pZ/SrJNXoZLqyRMfw+tfyALRB0DC0hsIw0
         W20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558568; x=1795163368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsuUo7jK22D/dCaflr7+ggdashOIplcmk4zE0IlhM40=;
        b=Eb+brKd0SbUtovUZ92/hfcddVh8QdmWg2FxpgGeiVzKHn3gz9t+K8VNi8NGYiWHYPx
         BykN4Yiq5gPBy2d980q5Sbuwh1mKrIwtH/uIYnnW6dPXOVWX8JmcsiT7zZLBZWAyWLNM
         AmJWY9QyMLZo0NKZINcQpOUF+FCGknpaVuFD1KeYPFaSJSd1YPt8E9QA2lXvzInU6OYt
         vXmUk+pwUZ4nvD7T+lhgsPKRMS5g2kF+bVSh932WefdA96UTP/mNLzopiMEVVI+KoGAz
         vLM9O/ErJUBsiGQdvXqus3grmzEoUU4X/iiqaIcmOL9dqS/wDdHON27K28JIUOTdLLFx
         FGRQ==
X-Forwarded-Encrypted: i=1; AL+hErEdllY8cBeWkv89AQa1ohthw02m4RjcVR89EVAAz/minyJjOuK9xLWi3R17MAaPBgj7eMCJzg/RaNzNoxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3IW0KnCG5e6B/x1Kr0Lo7PQbhCmWkO3mTPVYS5cH6Cmdx9GcN
	wvetJmgbn7eNhagL2+hhFJK/9Gu+DySnzPtVV4yVUO/Oy/mAcX1Uc5g7Z9mPUel6SHfxa1kHkcQ
	6MZrAINWzcyEuSNMGdmUZQ7d8/NlbI2Baeb6S2E18CD/W7bCoPYlMGJ4LAvSz/KwXjCY=
X-Gm-Gg: AYBFou3uNP8LdfCbaBlEQcpO8QuKf2/sdvpQgIui5ErUv4CydOcYwgRZQwnZDvCRE1y
	IYX0VKG7nRyaueL+v2XyosxnFlu0RtB9xvYn6CscAONmBwb5LiC1y/OA8x1V8BSAPZaRsjfszVq
	qfT41nvIcGi/zSI/zhyErDL1gqLBXrjRrskZ7YO9SKB07+Iv5DGsx7/UtgA/8WyLJvg9fwr2nto
	+e19gNK0qekQbATwxzzc0l+lAtya7KcxCjRWeWoorCYu4ruTfJd1YGVOW7BPiQk8GZvRDuhkBIJ
	em9Hchf4yucC4OmLfbGzeAb93aTdFtwOi3qFQMQaBVi8Rvb6VWFQPztMjQiquKnQuqxpt3ErKv6
	Gc52Z6IZYs7maJNmc8pgrEcZdC6YiDTGivaua96bZnjgqGrPYExkUi5N8zQY7K/rcxKPB94Y+GV
	ALN3FWl0qK9bT1UwQKHJawXeHcYqv16rtJACjE
X-Received: by 2002:a05:622a:480c:b0:559:af0d:a4e9 with SMTP id d75a77b69052e-55ac9e5d476mr29762391cf.51.1794558567988;
        Fri, 13 Nov 2026 00:29:27 -0800 (PST)
X-Received: by 2002:a05:622a:480c:b0:559:af0d:a4e9 with SMTP id d75a77b69052e-55ac9e5d476mr29762021cf.51.1794558567469;
        Fri, 13 Nov 2026 00:29:27 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad1b13917sm13524491cf.29.2026.11.13.00.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:29:27 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:28:53 +0800
Subject: [PATCH v6 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
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
Message-Id: <20261113-msm_gdsc2-v6-3-17adbce47220@oss.qualcomm.com>
References: <20261113-msm_gdsc2-v6-0-17adbce47220@oss.qualcomm.com>
In-Reply-To: <20261113-msm_gdsc2-v6-0-17adbce47220@oss.qualcomm.com>
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Danila Tikhonov <danila@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794558532; l=1357;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=ntfeu9W4Pq86Dg1wFbI85btVQtrszvihY+sSRkt7zsw=;
 b=viEa+abBe1P7T1jIRGcNa06s0sk5DJLazOJj04QJlPe6iF46uc3r41Uz+z2zoCOuLI6e0QiN1
 WsSla488KZlD+Yn4O9V14mhyggumuUXhyGoGaBgJjNnGnyRONjzLoRy
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX8EEOmO7FhYk6
 3fO7nxv11dw5lIeBQHuj4AA4PsLj4CREzOpLJUqIgGETnduleuz89cQqPpqWOix2WCsbLKaUfyK
 RDEuSj+wfcdwe7GGAIaJlWFDINTD9ys=
X-Proofpoint-ORIG-GUID: M3oCp2T2JKI6i-iModsSPC8as_EBvjB6
X-Proofpoint-GUID: M3oCp2T2JKI6i-iModsSPC8as_EBvjB6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX3RI1vXRPVZe6
 QW8O6DoD8ImIPLd7IpemvKUbIUdR7O96obAeUI8zEBRZKKk4eyJgADM1NwFIxLRK22XyVY30+j6
 pnKruE+VCxsG4X64+wuSe9C1HC8k7jmTLZztNx4HRBv19OrN2qemP85ZJt/75Qq5JtYBWNfv5cF
 vJlKUEUlambjyLVMRVqnH3TLoBkBOjiBfwtEFVsFgajcyjFhdekziaLyxZp8QgD8WoR68ZYDQN3
 Pd3iRXD4ZxBaIJ9HGuHJyG54kVC8G4VbujWeR5v9sFg5z7CB3jXUBLTKbLtTJf+fIe20P3hmDlG
 620cuVTfF1U2dNE+eU2CZ2YnxTB26SmBXjBWeJ3JaCL1r4+Mwtv8Q8OaNE+19jqjWLfu07BzV0U
 hUfzA3ZRBHoQgsR4FbWzw0iCbeoIlDhnltu9FSY+Epzg5ElcRh2i5048Hs1JPgGHfNproX2q+qp
 KT1mN/HXCvOG8Fp89Cw==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6ca68 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GwFvbCpr4qPuEswRa30A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130033

The INT2 GDSC on Kaanapali (SM8850) powers the VIG2, VIG3 and DMA5
source pipes. Without enabling it, these pipes remain inaccessible.

The DPU is supplied by both CORE and INT2, so describe both GDSCs as
its power domains rather than attaching the DPU directly to their
parent MMCX domain.

Keep CORE attached to the parent MDSS device because it also supplies
shared MDSS hardware outside the DPU.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9f04a5ad75f2..3706b89fcd0f 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3691,7 +3691,9 @@ mdss_mdp: display-controller@9801000 {
 
 				operating-points-v2 = <&mdp_opp_table>;
 
-				power-domains = <&rpmhpd RPMHPD_MMCX>;
+				power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>,
+						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
+				power-domain-names = "core", "int2";
 
 				ports {
 					#address-cells = <1>;

-- 
2.43.0

