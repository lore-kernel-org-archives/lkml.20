Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF68B3C552B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447067; cv=none; b=OJh6vDxdT3Y+THOlrCXiSS56QGWeqDlRjoYH570DTtNqtB2echVo5hCqWFKWY60Axs7AGMLUYryKYYGzZgS+zJj36LfcuWb07LtPpdaI+g2sIqq0dzTtXUDDm2jQPpV6iAf0N7bJqG4H14jjIESSeoRC7wml4lPAdgI3M+eNu0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447067; c=relaxed/simple;
	bh=DvQ8wWjzAFYX10JuqGOvkohCd+ko4JNFR4il8Qwjgbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfJw+SVdGQ3eTb77A/ekL1snsTsgdxfQ97p2Bfh+3BUFJtbLTi/wn/6hvnIGuCLVecm5sl8pXjXR6vOp73ejU6jqDWWjbdXGZOHZBX8ry7iTQOzG86kY4Ee+e+5OfL13/xlViQZ3OY7IBsecRBmxqVpaiu3s06/642cMoT/Sv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXM/+pF1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRIplpqx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXM/+pF1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRIplpqx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K4jq2189850
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 08:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ilmh++1N7R6
	5dkDcOOtxHaZj9s5Kb/r2ALcRYTEeVlA=; b=CXM/+pF1DGPpnRqE4xlWxFiD8q6
	f4/t4u/5gOHemlS+f8Pv4IY+GUrtoKAgYFdYAiOR1NExyk222fznyjAu+PXO85yU
	OFpkCZvAKS/P2NLWENO3RDo2nza4MDc2yR+ikupPwCEmq28QoJfLqZRcaETQxewV
	JJC3CySS2IvcBhDx/dfbbFyvi0Xx4c+EMgnDEGDmX0lsxbZ5aXWT621+bT5ef68s
	w1G0o/wCTkcJWdRqVC/nQxCq1f1hgyObdpdRZE4fd9sprN1qESZ7l7eLD8XG5sjM
	nzF6RHb4R0OMdAeKu4zfoydJPhJjwJNYQ7QPWy9pJQQaZ6/rBGhmUD9kbtg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39tvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:11:03 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so17507837c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447063; x=1792051863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilmh++1N7R65dkDcOOtxHaZj9s5Kb/r2ALcRYTEeVlA=;
        b=YRIplpqxX4ZuqOMWk8ZqZPwgC0Hwi82Insti138OIdXiQ+FVYyBinL4UJ4T2oiDwLv
         Ur754oZstGQbcVzb01RWBKus5SAm2IjaN9D2R+KXZ41R8SyLFrQMOeF419EWRM5RAfqw
         flGKP2iGtt4bdDFO3HpkvXNBDmwZzmG7T2A6F9e1MKF6rq6v3yidKMr1JjEv9a1Sz1gH
         bLEMpma0jv7UGG9ttJDvly1LmJU6ftg+cVDcp6B51CeNt4UnwdfDG1PSMKDC5tX+4L+O
         +BDXQFKL9CCpK0Ds2mnZquVfcKcPIPsfRRSuYNho4SnpTfliYJeXI4eIO9aNMQVHoXs2
         oOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447063; x=1792051863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilmh++1N7R65dkDcOOtxHaZj9s5Kb/r2ALcRYTEeVlA=;
        b=Vna4B7qrTCIfbhuN4oiLgojGv4fzeiRCgz386fXXWskC6U/bBz+Z8B3c40HmaJTY+p
         a/Tk1yENbXw7gNzxKvVjI2PflGEZRQB/ls+O2os+8QP1L2BB00u3337fNAU8mmdYNgfg
         hxf8HsN9j88GC3e0O/P6lTCdsIXCOSglm8YAt9FA1rVvEexPlcUHTKvSTb1yGRoucHtg
         CZW90grDK2hc7Lk/MxO0D74A9O8G/K3VzD/J4IlI7SVVy2J5D7V+aHo3zTOwC6bYFwQo
         QwOujUSVTYJHCy8+MYRpGGSuXYd98bMB+h0s2GVcRId5Q1B2n+hSJ0VOSJq7miauZxNS
         TzNA==
X-Forwarded-Encrypted: i=1; AKwUvByTknb3hS42no6V5XUkkoZYR8lUekAEM4i/rWBfvGYYnVGGU5OjONiX0OIVOW4y5AIRJl8lEgUOsx3ohaU=@vger.kernel.org
X-Gm-Message-State: AFuF++nJJX8+W1SC5OMzWV4vVcZZ/Y+RwAn0jBX5heBVgS9X89O6wSpD
	vijUJQinW27NHho866Ukbra6W6sdputTKOrtoN6hd6yTAO0p6oCqRIhXei52WltvQ/QDcc41odF
	hUrzpYnfCAiG1TX08ar0uWgc6tCpA3TLarPSUgjSS+0ROclakeHrPD16So87V1ZhEtmw=
X-Gm-Gg: AYBFou05mUz2wZ/+PGAr+Ma7zdZjriaz8A8gnl+tKgaQ4xWM3GrGHTUHOW66NtotoaG
	MLnG7rqoZrSvRDa26MnaxF/votHKDOK0FdLXb3vH09R9ZKCtV9PmK3/McMgpwM1587sg0D2bPN6
	Ybd0SDIx4cK9HhZk61Z5QmdldZW0vR0DQNii05HpAILp4V/btVePEkX9dxaKcFfQ++lKqY6g/Ya
	mndExmtk6OBZu5ALw9NzmjwNDrKVm4UyOUNGE+7R5397d5h5dLX35WsJ4eJllix3ciYxq34tXoc
	EP6pLknsKesnbNX/foe/wITo1r+HHS0LipiM2vuGpPVW9pXI9omCXKYl8gULHt41yg+xeMOgEZw
	lfm4cUyGkWHYTOcMiNRV+cfmQDyHbk9Hkds8pVBiNTGmr/jUrtN3K0QoOeY4=
X-Received: by 2002:a05:701b:2096:20b0:15a:9834:73c9 with SMTP id a92af1059eb24-162089f4544mr5396701c88.40.1791447063244;
        Thu, 08 Oct 2026 01:11:03 -0700 (PDT)
X-Received: by 2002:a05:701b:2096:20b0:15a:9834:73c9 with SMTP id a92af1059eb24-162089f4544mr5396668c88.40.1791447062702;
        Thu, 08 Oct 2026 01:11:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm14522277c88.4.2026.10.08.01.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:11:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/4] arm64: dts: qcom: glymur: Add videocc sleep clock
Date: Thu,  8 Oct 2026 16:10:34 +0800
Message-ID: <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac75018 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=kYVbGFCUSVokFan4DuAA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX11xVTHF3h6FZ
 Gvzys7kNCu829VXRcg491UKyNkiGPQAX3onGnMPg2po5T379fYIGgnW5o+66kIxTRbOfKQiSXk8
 i6xbsCYQ/iMEdAVeC0wQ5nXra2j7Jh0=
X-Proofpoint-GUID: of2MZ-CH3dVqku5p8iewwtVlqnoMF1va
X-Proofpoint-ORIG-GUID: of2MZ-CH3dVqku5p8iewwtVlqnoMF1va
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfXy30i7V5I3TcO
 pHx/pzz9s3gFvWZnSDTmJIIQJ+9oIW/Pt/+SdwHl6qRI4SUQquCTb6uO9mBcr0O2TfDh1WgLfjR
 WQEqS7kFEoaxFYy1daEqskovzfw42Xg/myyBtG6wvHTPJ4UY/Lxl5r+Tt63BNRr+iXEeIobKa6o
 yG5yO1UVgxqGJGt/JrKDX7OvmX00/hL1x9oIj+zqmbhMwXYdzsNizILc3iz8JDg217gDAmnJATz
 zHgjrym8axmeHvSMm7zoBdNLwyGR4UF/ld3W+Tra/u+hZTQu0Rdpi62vyUugWKcNpLnRzH87S9M
 nHFFNSyp2a2v5zbvcpI2GgNTbvsgd7kYh4VJO+SiUA2SVOQSUSpjQPNMlT/pjffs9PcTn9UFaoz
 /dppa3SDGTMBtNrgoF+mVU5g/FEv5FTszpVLVMmQIOa0WWPkhtSkHmVcNmpsjKpO3ftkYhSu/yo
 a4FzUC0NwiQ69JjDHVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080032

The video clock controller binding describes three clock inputs for
Glymur: the board XO, the always-on board XO and the 32 kHz sleep clock.
The videocc node passes only the first two.

Pass the board sleep clock as the third input. No functional change,
the video sleep clock keeps the rate left by the bootloader and has no
rate consumer.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..b389f953f97f 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5810,7 +5810,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK_A>;
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
 
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
-- 
2.43.0

