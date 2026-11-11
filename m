Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383532;
	b=Jv+htfk2qW9foPx5n+mwDKo2+ka5Zgiw4p6IZwWM4K6CrqrPsD+TbVR8UweyOkVnXa+r
	 h/LZ1owpPHXODn3xgTMj/yFfNs+zRbbNqddxUdAj5z9D8/E/9VpypcrlrgmxWVUfT16Ea
	 yBMt+U49Ys/DviAVoDG5DpVyEVvDw3X39TxAXpdqNBrqLp5lPgCBQ9wNveW1kF3E1CFHh
	 OmTglQUvuObAkF7FE9i+8c4JZHWbDauvNbtUxuu82e1wAy1+2SOmOVYEG9no6q9SLMwas
	 lhXMIrRvEZhfSwBoqQT/0ta1EWOiJKROrwLlURn7NVL9rJbwpnnFs+eb4t8FnF2e9Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383532;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
	b=RbwFh5Hs8ArAcQF1Y12+BsIn5CtRwXH2hAe3DI7RW0BOmxY06WmVq3BEro+hT5iuFc80
	 GTWeO8FKTnsWoGlS6sdaOh0tJPeNPMvhMu3pKkY8OSrfrS/LEIWCAQfJL8JVQzmomNMHz
	 yfCad0/vDtufFiixpv+viVSb/weh82o4YsYzJb/Gs7GoopR87/RNAd7PapMiLiUOn/7V2
	 res/kVdbXy367N7itVQ86Wx+MGj9Z0O/llIw6LLk3V18i4KKV7knnq9GIpgtVqdL22fDY
	 sCIq7WUTy4QKnYNu5NqeHloyXy1o9u1Kjj73jBL3hUKY98e2ZU1qzMtMo8Ysk1WnvBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BVno4fAi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nev7AnB5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC5E606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC5E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BVno4fAi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nev7AnB5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KQeK3959060
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xvXRY7fo9j2
	LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=; b=BVno4fAiNnmG9s0uDvJ3iioUenb
	pOuFvrfSgZIrh9VYDr72xGeP/aJNshdYos6SldlQ6V0IK28Cdz9/xWdSUFOutIOr
	uYqBBczbMnL0Mw2CUeC2UtjZItFE7CK/1mxkbyLgqs0+LhuvM2FzctytxEo0lE1d
	cm9ZFqoNmECNIYvE1zMVFo3liZyiqOJGANsDgSMy6M1DmL/WuPj1KJzJRPOUvwGP
	WrqJp/Xz0GzqhwIPBg4K7RV+trqbo7YOzHMHUjdpGVhLGFHnAZwokXe5CtVG3O+E
	Hx2HpcdB0E4yeybZka6YkLACT7xgmdC+9KFmnw00o8ubqA1B/h6yUvVfl+g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b32h02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36fa5673fccso1048432eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383531; x=1794988331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
        b=Nev7AnB5+ex/FQ0juxOu6Alfn5FduvyFmvYyry+IEPvMA8luIED+rCkA0Uiz77rFY1
         vZLtIgN3AqmQB7mBNVHZ3phKb1sns2zoMBIMGIdD9IHnP4aM6l5L8Ajh5TTx5NEhJ/MA
         KwnWI9ueoqtOplt0Y+9Hfl0i4rKHen1NUV7pqzGNKVeCFsZGA8lxymOLH4363cYYM31x
         3kohYIpygkxoizmiZlG3r6oFGi7J04OaTEJB07bBdf0pze5qD5yWQ/epZkbm8lo0vrFO
         HO35IxHfM3/Oi5hWcVW+VIt7Xh+AWnkeEnFtHPnPeSuk9wzdsSynJklVJnZUDhpvitnH
         0v6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383531; x=1794988331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
        b=jZ99Sp8pD5PYGsF9tvpK/2TRRKxe+kMgdhhG/vKJ6LdxLvUavoP+pLyehQfOvsEiEc
         EEZepH+BjpwDR2hjTC8A/6qx/NEQ0QkXFNQlW9LDXlfSlNJsQs4jKiqgsykIb2CN8xZ3
         l7Hy7nEUREz4thswHynv4tSlWlJ2Lp18jegmVe8vw1PB1Ok5HWlQXSaJj9tW0LZ+exDE
         HvkyhQr+RvoHOl63pI3QpxT/ZjaUdfUqah8NvKLm1hqnid7EHsGusw0Gv8oh4HTOt9/d
         ffAvfjcQ1Rvy8CjXfWU8BJKzVNJVcBTXgy1L4S/Im+KyBWCmCuIBO86mBFKU5Chql9J9
         zUeg==
X-Forwarded-Encrypted: i=1; AL+hErGiCwejjHzkft3Ihn1BWLsdqo54PfGQuFq45dcDzObgkp/QQJpHkw/8DfuLCk57Yhul+SgarPWcZ5nsdBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E1BfcBUQirKxSM4aBmzy3dENL+Gn5K7wKGJdHnD9xbAVgGyPB
	mS4Rmo+VmEQdJEZHlEST1tIeAgvvlB6sey3zKGFUdty2/KQeVaJYK2vXd4/cSRfIeV/r/0kV76t
	PPOJzthDd4/txkmpQw6theErIw05vEI+vtShh81baBKsps7Y3dKy+Hi5j4kDM2AYM9GA=
X-Gm-Gg: AYBFou0iJA6EnJ0uqNg5FLRsVETVteZpojmmqyAsv4l0zC6kWIA9v84mHiIlrefe5Gw
	cWZBRtwHTOY2HEV5kddX6vNmPK+yIJF4jrRjlEsScah6mPALThI9ycd/Xk1RbsoLp9drOdWp5mw
	uVSYiSKFiVssyLhuyIiw7Jr8E4tElVtxow8G5cZdnG8sGckJR8odXjDtv+q46EEzUdH4MMqymIC
	/wbQE8KDCTU8h3rYX0LZhouCZvLzQcC07tc2Aet2tU4vh6B/Bn1EdtM4bigbUrKrW8L31dykv5y
	af9HtI7ypR+otlU0+XdLtg3ifg0lvU8TPh2DLYEKou+G8YJ0CtojjyDFRu0OYVQ/N2K387J/MN7
	W29W8IoV96bdOrWfLWjI7cfifWXGAgOttndkdS/QGHVeNYSOIjLxIlwA7H4iX9CC0UugNNayLPd
	engyxJj9oZxB9pmqFUnQvUjgCB6nTX6KLQ
X-Received: by 2002:a05:693c:42c8:b0:374:ea35:9069 with SMTP id 5a478bee46e88-37687214143mr2418349eec.39.1794383530861;
        Tue, 10 Nov 2026 23:52:10 -0800 (PST)
X-Received: by 2002:a05:693c:42c8:b0:374:ea35:9069 with SMTP id 5a478bee46e88-37687214143mr2418325eec.39.1794383530277;
        Tue, 10 Nov 2026 23:52:10 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:10 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 3/7] arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY
Date: Wed, 11 Nov 2026 15:51:37 +0800
Message-ID: <20261111075141.3710366-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
References: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af41eab cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ccc3-NsNM3ZFeKEqOdcA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX+87hGgoseCH8
 Xtraht81Aoyl5sT1C/aFjSBI1eDrFn96gNoszlq/TfanTG2a5BRhrPjDGCLNRvWFkITbG5Gw3aO
 aNmuRFVlsfmnUPsYPWiWWdfrXK2+n00jmPC7BXYYalTUZrrhzZrZOYhg6UBaszyICknNvUjdV+9
 NiBBRL0EYGyK4cBM/OXyc4EpKdyHmDvabJf5ehIJuRVU+xrxCf7A61znnXM6ZiMOISXcCayV3cj
 84GIdvu1wqInbuPhxzWmYhhuyoykLHcOhoarv6sH6ByzIusikpFQ/Pp3qyfZYknUHj1+NxMKYNi
 SyF5oqtozOYhSY4d6d/bP6kNKoPKeQaRCzJqmtM7zMDFSjYp4rf9jEkQsyfzHsQmfc8r3TRAQuY
 KE/tVfxGAL44MQ0mNu5G9nB5c4Q7id6cxZcFoi0SA0RSOmyqKSP808L+yT8hv9wfQjFoQ8RsGyv
 fSfVquhZX2anpMKNErg==
X-Proofpoint-GUID: u3LjaD77mhwSVBEH4xkSnGksfnqXmWVg
X-Proofpoint-ORIG-GUID: u3LjaD77mhwSVBEH4xkSnGksfnqXmWVg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX7xajN8RrrT48
 wBvCf9NfXFNpidCZ8G9mZcIAPz8JC9JhpRX8sEmS2I1swZZG0qSgpIJxGXnlQnW5Q67NxrPfUIU
 07AU6/eSNnIrCO6KdYSQyj7xMDzS7Aw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Ride Embedded board routes all four PCIe links, so enable
pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..cf760ec41727 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l2e_0p9>;
+	vdda-pll-c-supply = <&vreg_l2e_0p9>;
+	vdda-pll-d-supply = <&vreg_l2e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

