Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E99D3CF026
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437429; cv=none; b=hgjuqPM+Wiy8f2uWcgw0oKKknXhEK17zezhGV7OUnB48LhyVPyhiwTucLDsnsCQUni3LDxalRBmOh2sijBpSJK6qhFOKOuH2FHSKHAPLkYIbjugBE5J4TaDu8L+ty2HBkWm6751H1HUbfKTalQZUVAiNI64u5qmNCR8dESonKxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437429; c=relaxed/simple;
	bh=DahqUFH68bOFtVReodtG+yue7+RAA/WokqeQNu1Erag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WVxSVy4yCmOgjtOZneNCzAJR9nEojfHiZ8ZdLWvQcP59qOnWMMH25y7OGPAsGJ0CcHqPJjY99KkpNdlT7wC87zmVBk0TcS0fGBAzIzLegOcg00hofNcC+fFXvRhUrJN71cLbjG48Jgi8VJrw+Zp7bBmLkz1xlibBFv41Ag7MXFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RDpnrAZ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TB/VJNSs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RDpnrAZ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TB/VJNSs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxlQd3070066
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o52pQ6Ep+I6
	+c+UE0SFajA/hsTCu0iMTixA7OmgGFZ4=; b=RDpnrAZ8R+4ZKKKx/ywZht+WeE4
	OZsR2DvGUQt8AiJ6JwxEGLPPvT3Vp8rOipRVvXgX0wKcgZDFO9JgwQtLFeb7Gi+0
	oya3Ujij431D+5PyyeR7UBmuinBAEvMJ8yWnnkJlVNLLSKCq10bcH4+lHCnIQCcM
	MOWWv6JoAOuD9HFFnAdsBeb2AUWbrx4JuSWuDBAsO4TVL11rTyuy7wCXHWuxEyTz
	yuADwRcLSv9xhFHgt67g2sXINX52H+m5WyMtHMkR4Hit/6TCqE1m4tigYckhD6Rc
	cBoT0x2fhACiIGsIPfqvo+IoWlKRc6Zw0pbbzj9wgBu10GrZA6t5yHPo0iQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeexbey5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:57:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dcfed75f77so57122355ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789437426; x=1790042226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o52pQ6Ep+I6+c+UE0SFajA/hsTCu0iMTixA7OmgGFZ4=;
        b=TB/VJNSsW5bO5wLhQs2h5Kmm4m1TLEUjvo8cvvbFHH6Ex0X5FYWTCXxHsMfGalnWAq
         wJFqBqIyZ5Gu5j/V8sD6nr/RJNHzkEHH3VOL4TesGCmkp4C8OHJLYXDvrd9c8HXuusQN
         02ic7yaqVcuKv74mkXP6exXjhT5Kw++uAOasEjA6a95b9uvNn/I4HKeWhl/iRP1SWIUP
         egOovZKWrw+xnjzT4mgB/c2aWUJ8GQvXV6Qu5m4xU+NyVfL9rm2fYYv3PTqBL47P2eJE
         WlLN/R8ahUIqlYev31/jUlNibldCQ3SEX6mwsvqD0SI0eir1Dic4OmM5oY1cn7puERWf
         XVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437426; x=1790042226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o52pQ6Ep+I6+c+UE0SFajA/hsTCu0iMTixA7OmgGFZ4=;
        b=uzrOQcvcFK/fVr/DPC36BtSf+kYwPumq4dvYSbdYc0iPDjld/70KFh/7K7zbiFIJFa
         gPtEOQ9c5TJIOUUqynKnw3RMr2Ut+/wc4YXwrsPqCKsrcQ5YfJxwxDJAknIwGODKeRUN
         t8NKXacABu89uYbFLCXCSYEqXFAfSl74dBb9fjGGzb1tfOd47WgvY46Qm1EkslSKtNcM
         4UkDOq9ZQ8APQKPK8bFUF1H/wFKGxAFKy3B+hAqfd3rgklghOg5+33un5fb+Htb4BjO4
         gAubi5OTbG2MAD8w9X8sSFaDa+BSLIOtkUPn75kMtQUO7CtHKZ3ZlNCZrmZlvWFbLBi7
         wPEw==
X-Forwarded-Encrypted: i=1; AKwUvBwPmzfS8nN8dvQMFkeNcJWsfET4EU4tpPWm76PycOPGYfTnxkFB+9Oj1L0mizEQnMHxbkkZJHi/ny+ZBy8=@vger.kernel.org
X-Gm-Message-State: AFuF++mHib5qh4Pv0EzdzzZ8EqiYoFbQWSalt4jc0+zf93I4PrEdBINc
	9yZt2aTlIbqgumZUrP5/IcAdqD++d0PLTwgU223HTBtYVGRNh4ZWiqHrQw5AusH8veU62K6EtIi
	4bN7BIKVJNv95YDZ54QvAJXbR3u+ly70NqTgWRtObR3at3zzwbx/UjgGNRtOpAavmy9Q=
X-Gm-Gg: AYBFou0IDy2IsKL1t3ULxn8+wmRy08O/l/bIKy1OjoGq01n3gRnAZpR41lIF5cc7Unu
	zsHuSHSAMt2B1WwKG9IpoJw7d9342SfLH71Xj0BPJzlJDHo9UVJZcl1mNeRvdLki/gk9hIpKI1y
	1wvKyeGo9Zep+IVlIXJ2Z9KQHt0Y7A0SyJ7+6QBRSQRYJTmLqcqxDjuFcx/hN0t/mLrHFSQSKO3
	c1TQ/tPrdwBOfXoEolyBiZxxpmdo9ecox81zMEzj28FgwQYRFPQFsI2X8HKAJtJiYehuMGtRaLY
	beGYbRVMXqmU+KggUzCm/4ULCGSmb0Rdzr+TmMCGif/CUT4E4oisXFaLKnQaAkXAMyzycTA2bgk
	rBzUny8mHbhbFT0FQee6wZjX3joL1ObNGhGr4VSLRCJYWk3S2MKsbRvmkO3s1
X-Received: by 2002:a17:902:e807:b0:2db:43c6:d2c8 with SMTP id d9443c01a7336-2dd6c5be56amr108576985ad.1.1789437426038;
        Mon, 14 Sep 2026 18:57:06 -0700 (PDT)
X-Received: by 2002:a17:902:e807:b0:2db:43c6:d2c8 with SMTP id d9443c01a7336-2dd6c5be56amr108576555ad.1.1789437425627;
        Mon, 14 Sep 2026 18:57:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm31115791eec.29.2026.09.14.18.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:57:05 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 3/5] arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY
Date: Tue, 15 Sep 2026 09:56:30 +0800
Message-ID: <20260915015632.283642-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
References: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfX0GkpWcSmQm4f
 7pUE5d1YhKsj1RcDsmGkaz5yUCWpvEkBnAF92XRgZZkN9SLywJ4nlElsJkP9o2hjKGN4iebNeV7
 Jrpuv+L80O+8mJHthJYj8Y5XmAkIil2lgBSkHWgbIoHKc2SRNE8EF9O2dvFM9wd9MlSMlDy3j3k
 i0ERmxhdtEUe9ZV55TTCUfL0vyoU4jMYkK3Zs5PDScSFCxN2HaN6hA7dbSOqNAuVXGn7uSyg5k8
 3QxsNCYDL5XSlJATA0FtB2fLLsxgsIXxzJCoK0qHtSrELMa3hR+ynLVqcuGoFglm676BR4Wd0C3
 qmVu40uxpn5Bbs8jzfZQhRwIYNPcgmjqgcqtfhjPmANvkzH6D9To/v1MOEV4TdO+KolE5SBgDhO
 CGHum+5vh44Q2P84qerF/927b1PKEQR3XRAuudMtG76wGVPcf3Up4cUWiclYYz1JCkbFI918Dsn
 dIdgxoRo61Ji/91H3cg==
X-Proofpoint-GUID: PPBrzw0De2EGAgxqRADHqkYkOGVf6d6-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfX5pVT8SnXhEJw
 1Mts9l0K7Y2HllRW8eIkGrzvIon1ygkwL/EPKnnajiT58/raGbCr4fGuq1hGtzZ94O8fyIBpiF4
 zJloe+Ag6uJmTsuTDyi4jWnmqqKd0/g=
X-Proofpoint-ORIG-GUID: PPBrzw0De2EGAgxqRADHqkYkOGVf6d6-
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa8a5f2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ccc3-NsNM3ZFeKEqOdcA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150024

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
index 09ee525764ef..0b230551a49f 100644
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
+	vdda-pll-b-supply = <&vreg_l1e_0p9>;
+	vdda-pll-c-supply = <&vreg_l1e_0p9>;
+	vdda-pll-d-supply = <&vreg_l1e_0p9>;
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

