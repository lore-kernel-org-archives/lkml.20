Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8D5415F3E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377571; cv=none; b=tlh7AqFzx/9VsJSOCrajYuCxvycLQAz1Ul1HZg2IEPaBpFIdrcnf0mNkykyBT3EIKzY5/SsVGSh6K889ydCIMtQchcWV5uu/P3yES2hiq6ycaim0shMsORyEUVlvvk3myUqZ+iCKdye+j4PFm8GNEoniPKxrBvEwj4CtP4tkCww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377571; c=relaxed/simple;
	bh=rF6TUJT4fFt0Xh6pN9n6/C+QLa7/YYWjtH1j7RXIVW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HTP/LeNYkaKHcCklncRCrqi/VJn60QiRz+LbW0f49kk2eEgP5HNaUcxEOi3ElaOTqvLmuoqOWgmM7g1SjNM1Y8WCEuhNi7bQhicJrx7WuT1LZpfYh81+Bi5HA/SPcU+8yYXwGf3BOpemrLj54P3UV5xLeRdj7bbwHkAIbFo878o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CI0yiuxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fzx6MS+c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CI0yiuxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fzx6MS+c"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jEpD3842265
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxOseqOHHMoW92yeA+PV0zd2OZ36bqpaz6UTnTsrYKg=; b=CI0yiuxTw2xR5+7T
	egpQXka6dzyYGJ/UvVyZ2Lj5kVrXaBe7lPbVDY6ihttW8ieo7ZQCw1K3NgLcegdI
	NO4q+lIwg8gBs5N3qWdwShJ5Uq378uX2YHspCBg2Zc/XZjBRukMIosTbuZhI7p8T
	4UhOPm7JMNBT8IwC7NHlb5bI8FGXKVjuxwzad2F7rYf6r7LV9vClB7Fa7SL2Ypst
	qZ052IHZ8snqGR41TwYodKUi5vPrHjk6m5yrBRnhrfmTWaZXwywAVU9VW7U3vGVA
	bQAlDq9/BXuSxzNmV9vlZBYly4CwsKD0Eh2A0d1s/0/D2csK+gHXbjKga3I6+8wt
	vJVeJQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5wnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:19:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ddc70b9d5so926627a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789377568; x=1789982368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxOseqOHHMoW92yeA+PV0zd2OZ36bqpaz6UTnTsrYKg=;
        b=fzx6MS+cglwuGZYQUfH9iEZkkYUtU1mRNlnK5fO4cQ9GMxWG2cO1crwgxUjnRRx4I/
         feMfmHd/9t2aRLMZ6wa2GHygUtXlsdHXGYR2qEIpRiUHKkQr6HRNntTAGN6vUtaKxGF3
         MU0jQkwXUX6iuc0d5zQe2+mli24aqiL9IH6t3sc4btUm1IkGfZz+TNufFTUEFJ0gpJpw
         WkUkNh34WzgWuAK/JyD/PaTXDjtunXu0+7SLjyaahOPgrbJd10KtJCjrJFpTmcZFUtyU
         rMHqM7ucyas2khHAPmUApPR18LvGbIcOJz4YphBaR2+YPJDe+mBRQYZM0ibZSCikwC2H
         bQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377568; x=1789982368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxOseqOHHMoW92yeA+PV0zd2OZ36bqpaz6UTnTsrYKg=;
        b=WHz6xG2p0wiRxCRYN5gCXGNHDj2rrTQ7+EY0n6GAd3B1cxR/ivrSAUmXBfLLoy/tW3
         xClY2pE9vC8lxg1hrGynpHJFYSPm6uwAdSyoW4o1ks6Soa/6ODQnSXi6KgnlP1bdRQ15
         odib86nR2uZVRqZ3YWhOi7Vq0T2lDnkewpc+bxYll9fR0N+oIwBwW/Oh7uRJJYYYPhCx
         Y0GlChvYNbgzaMUwkhAEDMlxStbs+MWzJ/2XY4VqxYTnsfBJDN6tZBa9mAiWsrn5xtIZ
         CrSUYDRGgTPE7qzQgA0ypzjCm+yijHo4z/68+ofoiMgJzHKY4asXU6Qm3oFR75AhFBR3
         MI6w==
X-Forwarded-Encrypted: i=1; AKwUvBwZVa0m3WiVhNewQKNs9w6r8TYUHjU9VRsylLLxa7rGoNbhSVY8Etiht6/A9p0078kzLSMleh0hJUwKd9s=@vger.kernel.org
X-Gm-Message-State: AFuF++mUY32nc10gyQ57ujKNCmLPgidRyO7oQ7qw9jGJHTLInirUF8Vx
	jgzaMYeLs4+M38MIZ+P1k1sW5T47q1J000U8Kho8boy0IJqb/d3hqnNevC21eUaIRPDH4HJ9aqC
	+gtF+mBC6t0Hq0XxHpbJNMnXb8pmqfPrE1oGCLxl6HDXF34glNt2VRQHRurvfSO/8VQk=
X-Gm-Gg: AYBFou3i4HsdFegr2XG3k3xsAtuyDEijDAKfsIbtlTUWIhhGHZtg2zDyGatBAhn4z3V
	4Ps+zXj2zIzTaFjCU2QubiUkfVTCEwwkpV8v+CHFG7ERANDQigP4+v1Zex7JlXg7xzT5vCSJFHh
	ZdL8lFJ9/93fVgi3MaJaNljOZl+h0LFDibYFuJ5dhxlnFPbJjplcHyuaSjYFTN4oMMXzRrcnhGr
	VJfERUamBFTyox33J+UWd5DwmLqY6r98wm2ngtUS/MFu8TthzjOUmB4cdtnIgtB5ogdDf4wx3aC
	G0KQpGZcSoAHnZBkMlRYunmjH+cNt2Klx0Z6U6Yu6h6HY1pqpAUHosI6NdU9R10DJnWrm+pRsuI
	7anpZAdPM2s1wfag/Cr2kqfI=
X-Received: by 2002:a17:90b:390d:b0:396:d27b:86a4 with SMTP id 98e67ed59e1d1-39dec02ca06mr2492808a91.2.1789377568025;
        Mon, 14 Sep 2026 02:19:28 -0700 (PDT)
X-Received: by 2002:a17:90b:390d:b0:396:d27b:86a4 with SMTP id 98e67ed59e1d1-39dec02ca06mr2492765a91.2.1789377567618;
        Mon, 14 Sep 2026 02:19:27 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm29416837eec.0.2026.09.14.02.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:19:27 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:49:13 +0530
Subject: [PATCH v4 1/2] arm64: dts: qcom: monaco: Add compatible to the
 PCIe Root Port
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-monaco-evk-m2-v1-v4-1-dab83b048d03@oss.qualcomm.com>
References: <20260914-b4-monaco-evk-m2-v1-v4-0-dab83b048d03@oss.qualcomm.com>
In-Reply-To: <20260914-b4-monaco-evk-m2-v1-v4-0-dab83b048d03@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: MXVq90tv9oG8jIZoAllNzCMqpC03gMYZ
X-Proofpoint-GUID: MXVq90tv9oG8jIZoAllNzCMqpC03gMYZ
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7bc21 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=s3JIKy7HVgEvE3Gl7h0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzMSBTYWx0ZWRfX6Fxj28wkqwha
 jvwJvUd1k2ZsrY73X/ZFGwoWTZiDXIVREThltJXvv4Ir24RjVtSSK3ikdw1sOdlI0SWjyohdxhb
 vI7WOeXLSt9fOpFXwnCuAq0gtdkllOy8raQ1gJNidTpgy6CGUmeojICZYQVM5L2Qtjjcjis7XhV
 +Apq2Vij1+CLSvT68fDiAk7HK5OGpRlTTiWPVGFY/gene3FnvCOH2t1gqEdDYdXPevnKIplFOCL
 BfLsYsdENMBBTTQSatn6myJO+Sxz6+V3RdoqeY1mpwPQQexLDaUsuzNZ4EPsexJpIEvM3sRt/hg
 aDe2GD5W0rA+NSYvUWoLVfb1fqfPS+STbOu5EqhCj9VLUzXE4SZIWwbVgonJ3BKon+YNTeJhZWp
 C1Ug/qobSoyHrbhQfflYPreCEjMnx8K6SAv1t1VUMFibD/WgkTM2BjPkPwLE+KdbfALGBIPqW6d
 f3gMbdcgTRvdPLUDk0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzMSBTYWx0ZWRfX//6b5YJZ1Duv
 7GefUBjIgyMo/Z4AbOMeggwx00OEV+28kHnKlgoVJYFoo4wLKWiP3fzbzptSMtr/kGuAj5qi9OA
 p07kRxnIpynANXDkaxYkxKagEiBVWjo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140131

Add 'compatible = "pciclass,0604"' to the pcieport0 node in monaco.dtsi
to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
bridge device. This is required for downstream DT nodes (such as M.2
connectors described as graph endpoints of the Root Port) to be matched
to PCI devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..438ccf6eba64 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2393,6 +2393,7 @@ opp-32000000 {
 			};
 
 			pcieport0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1

