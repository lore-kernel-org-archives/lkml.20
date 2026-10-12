Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B97443C38
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789836; cv=none; b=Qr9g5YPtkrgVxWrUyqyN8xu/CYse73mdebaIIpG8pNP9+iE5vCbEZ/0bKieDqglsY2XTgDuB2KJwneCjEybHxhmPUlb+xegSzrxPdKr57Nhnkue7utRsNEpWTWy+/F6Aya3e0qdZ6mjucvruDbm6lHl12JkRslzLqEGsm+DG9qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789836; c=relaxed/simple;
	bh=Y5l4gNnj5IFnWaA//fHQGkfX55rsZQiy8kt/OiiN394=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CN9LjwT9AzlKv8wVmSGD+TQdF0cvpozQJpDEDdn92Rvt0kyZvwtZknJdX9PDGanlY2iuE6MZlnlXWFQ6+y3A5nYFGczReg7wewAennkAFJusVCMq1fM6bF6LL4L5bqFebEPwvoXCh80Sm/PAFiHjR8AqqiL5BYBX8yQgJ7uuCWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6WVHPwy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4BEhK+0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6WVHPwy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4BEhK+0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C560QL4068832
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fR0CWoW9AzruZkAqd74db3UE8VAkryaD0PNTDW7tTeA=; b=n6WVHPwyA+ZLy1AI
	j+WbIzgwiQiCbyL2UaZBXY9hzp2of0UD2n5l3k/mh0UJcGlI4B8OQl7FCiv8VflX
	D3eSCPSmuo+3jpv0YmOjvxS1MDPLpaSM74J/6+I7Xq+vcXIYOunIHtD/eA/tP63e
	2jbGJnS9V/WpxS53pm0j4sweBpGvjCpxFMfvfCw8JUn3/Ns/YbPjhfitTVr0FprV
	eUABaXbNNdGLbrSey0LW1JHBnxZAMYceFaO5ebSMgNORG/BtWdFRpIrkGewTVraJ
	iDKWga0dU2cSvwXZ7e/OYvmqVM9jA/4LDNOzkDI4NCw6h9d0CnU/b682Zf1zMO5P
	zoTNcA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjnbba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so3809427eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789833; x=1792394633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fR0CWoW9AzruZkAqd74db3UE8VAkryaD0PNTDW7tTeA=;
        b=h4BEhK+0xE4+oUV83mVCaTA+JDUoYelGvyEelukVAQunozdEkXdNmbnwMxqNoKuGYK
         +weMUEmcfX0WOowV8iE3+EEhOTOgaSM1LAFp7A3b1I4F/thsTcEQj3nxCwXwW0xnZt75
         e9LIWtlhEDWDoH907Fn5NqqfMQ5lRUm6stmNO1+WqH+uWK/1EQhuCTIG8QqOMU0GNW8r
         LxMxgMmy+ZiqEFuj8HtvSLzVw+MOKXaQDaH71MQ7NxkBJw3uDm1nSdduQNV3LcCMzjqG
         Nq0vOeBtvVgN7zPpRbIDHTjckWKxj1d0jA4Qn/S3PPoymUfmsAJ8aj4G9IHKzqOTTbwf
         UaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789833; x=1792394633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fR0CWoW9AzruZkAqd74db3UE8VAkryaD0PNTDW7tTeA=;
        b=trCvxUBYinxsdf0Kt/EOubjOy5C7OyLKabtxtQsox02QUvr+j8aYcH9u5ykJfF8bHH
         TeL3/B5kjz1LuowYFFUHsLICZtBJ+69RjqRKz/oILGSnL9kV3dIvfhuFQPz+VSkpjtz7
         dGt9MkH3TqblnlF78TH5aJJtJ8l1m8M2sM9eAQZfuBhL8ooXIkePoA+JIIcRndPZqM5c
         KTn7mf8HP9mIbBI5nI4FXD6/No8p84MaqR2diYyaCLMbo/kN7N6ZdINqJxwOQLdIX0ji
         EbWBuHE4hez2WoqZCoMaRjFfIAoafpKGHfrGH43y6PV3JipieBkmqvwHntz3Z5aXTCZ6
         t2Zg==
X-Forwarded-Encrypted: i=1; AKwUvBzIRfvRUgIVVcVLoXw8ISOzuSq6OO7OVHS71IeC4oqF44sSeXHah8fFb3/wK65sSv8sjenpWGsrAHKsdt8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcakxo4DO9QI5t9GUrIVAswNUgfS8HdfO4fvCkTkh9GCdAkDa/
	+xYfnsdi9h4pgtnENKHQaPG4KfZP9Rei9EyGOidb4smm2dAZxsexseY0bGPuwE6j4dNqrI06vLn
	3n6BUZLtC6YYvsFUNMTzFTnLaLQa++sFJtyYMks/jQ2xTsqum+2j3xB9Kc1maKzIbDEVkEKzzEW
	I=
X-Gm-Gg: AYBFou37EzYZhhhsW/m34OKQZpERRSTyNTkhXHWNFnou9mSGB5fQE3tNTR6Pp6PbIi+
	CZ35fB53yWBkfFCc0j9Eca4tydUdeiboXkZU6jvlh53U42W7RBlf9H13osq6Ft+vwGtXFkt52qq
	yqf9i+v+4Ei4A3QCO+C4KqaCYXaLasUNLPbZ6ag9rpG45VeWtVySiSKIzOjZeXkPoTkc/wHaNmp
	kqDX/Y6vUXSTa9XKB8XoZ18d7wO2RMue2DEQfP0msUQCvtU6kBfIPVvDpvcG84jq66CbUC56Xqo
	JQpi+tPugmMVy7t1Q5x5V2B1yNS6Kg9Nv+52hdhDjNxBCkAL9EN6madURcWihxYoGIPlH6SGy+6
	OG+bfxcyoPYuXl12T6KcK1+u42qQbPgAzyMgox7tMVGc03hx6E8L2KFFK7M2XDShJiEvtlpNNFt
	qeysiBgHP87KnYpp52j/FsZyPrzGT8
X-Received: by 2002:a05:701b:42c5:20b0:151:2e62:fe4b with SMTP id a92af1059eb24-16a5c8d48ecmr12034639c88.23.1791789833401;
        Mon, 12 Oct 2026 00:23:53 -0700 (PDT)
X-Received: by 2002:a05:701b:42c5:20b0:151:2e62:fe4b with SMTP id a92af1059eb24-16a5c8d48ecmr12034611c88.23.1791789832813;
        Mon, 12 Oct 2026 00:23:52 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:52 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:11 +0530
Subject: [PATCH v7 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-11-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX3Q+2yLbWy2Qi
 gSfWUi+NsHXgYOgORWMFvpOdicxlBJF16IEWk3Zf9ER9vsktnYrg0bZeI/Ov1v3JguFGdw7P4tZ
 bYUFoRzK9/u9ooP/zMT3cTwyrCfMkqYNw6OVr9VxSMoqp4GAO2kDWR43NGKJLk6BnhxNgIWTcQB
 J+HlyK+oAJN4ALm5lYQ/rqOHq49SyVjchvAiypDXb22ec7ap5baMCt6Lb1NEJaK48yXtZWGFaNU
 ga45htd1IIk5PvsbersMWftYS5dJU8QeMCi0bWQTWtjCWCDd15G5NbmzvPovimdSy3ic/ltMjJp
 hrna+azCdCCDe2MYpUtXOmzbMCIc6PpZzO+s87rhuYgOqNxM1+65vYJOUJekp/0DbACoolLzdJT
 ZcT6EL6p826hNsx8xzHFWI1uKU/SIQ8iPFoGZTd0ergrcemAGBADjCAaJTA1hj4jnskncUTj8DI
 H0A9c5vMnitRLRUc0KA==
X-Proofpoint-ORIG-GUID: sHSNGbHqlkMiUUnRf0K26YmT2gQWWOYM
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acc8b0a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fxknKD5f1rE6hJysUL8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: sHSNGbHqlkMiUUnRf0K26YmT2gQWWOYM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX6iLNoUwSChmE
 TjtjBfWCDrQb96otYsa0EYTiNdiI5RvNKq18KPdb9ewvfBYhqIzJE3p4qOg55fpoCj28hkcIMVv
 EhWw4g+zsDgWwAsghlF8O4Tla3OMggw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120029

Add random generator node for the RNG block present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index cf1c9898ddb8..7bd0c4476076 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -362,6 +362,13 @@ tsens: thermal-sensor@4a9000 {
 			#qcom,sensors = <5>;
 		};
 
+		rng: rng@4c3000 {
+			compatible = "qcom,ipq5210-trng", "qcom,trng";
+			reg = <0x0 0x004c3000 0x0 0x1000>;
+			clocks = <&gcc GCC_QRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;

-- 
2.34.1

