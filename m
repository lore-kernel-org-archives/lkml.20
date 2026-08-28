Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C59844C504
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920687; cv=none; b=YpMtU6v+g3LsTC5GoK9wlUcV1pIfWpzc3GAB+JqNFDGb30V/A+GmKn1YyubpPNqOkcD1b0SBP5tgP5SdB/YBKx2w5C6Kolu4vpcSbJQxaDElCQ5ZqSO9mQz8eOlitAhA5FJfvNINnxmzPKxjupQM9a4ioi28nTEMXYivKrusNrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920687; c=relaxed/simple;
	bh=is6Qiuvtglru2UusENwCSUsVVZ+vsE+6GeIb1ZRKfgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p/F+OIU6oSa8bjfQORkLVqaol1vn/dgMe8ct9upo/DxSVgHM9nZLu0sqyTJ2dzFhupSrY85j1pIJjdUiagK5m8lM4eqpGeUKywosgd97362MOOab3WnJhiHvHSF7nhBAv31asK7n+8UsJ8mJLmtYdX2LGshZ1OUq01qn73yWy8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzBgTY+x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xbfq1S1E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzBgTY+x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xbfq1S1E"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA80KN3750816
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	utgiEfXl4FIAOFXZb+WxREMZP2DN7dLpysdPjPzWV/A=; b=QzBgTY+xmx9Qaihg
	uSbmHFH2jx+H2T3rYz1IXTBL25B4AR7Ob8Lm8mYlv7fw4RE2nvd3mq6ls5gO03ue
	HIhdCtwj+b7ZbLnu3mixCSMOxajuekHy3VYC6YIjfeS+xmhjm2TA0sfKMQCEpReI
	IW2zjgq598vMg9SlDqvrCkas76enpUG8UKOH1FcWOx0a/GCIs9Af7bb9ZUCq5e6k
	lrepp+2lNGOP6Adrf2KbQ/Rp23J49Opuuh48gnF4thZUewy7Chnt0v5lgKsH33mW
	Bnh4kYaUGk0d7LxU4/ks3xEahwoRyzGTKrHkgp8J0U+8c9lBKX6eczkDbyTidC38
	+g6UNQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb8afggpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:37:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so24105171cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920669; x=1788525469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utgiEfXl4FIAOFXZb+WxREMZP2DN7dLpysdPjPzWV/A=;
        b=Xbfq1S1EvFpXA7gwYJteRTrzDXvgunhA4Ii/p1YuktVmJSAchiQwZpPqQvKb0d/cUw
         OvCbxcM5/wSoz5i2wjcPcsb8imquNITlC4D4z6Es9EEb3un8QDQ6Ek9oQ3FfGojD+83A
         1NStzczRViJ/4Da3C55zsX4fTnvRwmGjBMoawaPfd+diZk8RbCQpbKbZJIEJ4jAERmYn
         iaADaZE3ZkJek6p9galc+ukJC9pWmQhK5sW4iE2Nx/53DOHo/UErqvqXoDB+uYuQHTfi
         j2e7Q1zoPl7VZcwJ8vYXQu9uJsDk3Dr5zAStRupSBOidXsRLrVkYgHmUbrLiHcBmZfox
         RZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920669; x=1788525469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utgiEfXl4FIAOFXZb+WxREMZP2DN7dLpysdPjPzWV/A=;
        b=Vdl2i/+/Iu+OpTqWs0qlT3DvPdVtK4aysnzZUSe/f371JQlz9gehuIRQk2hqZY92ot
         UsbrdYx2CsRBbVsvI98BaBwo+kF7oWMcnvWrKwcz92xgU/oDQbDjDT6wN1CYU9KHDjbi
         zsIxLii2TfNQ3OPJOFHOu56ovDaAzhDQyloJPYAAxPeTBjSiCPPuQ8xkeLkrYnAhGzwG
         qUa/kUn8A+Av88hoRM9YFbu5n+1AnI48QwNyz25mh+LuElMYF0bCvJAQ/e/4u9YJkLs7
         8xAkvLdcFzsuOcfS2qj3UPonbAbHNhbNFNUUMJGFGIzCWyFgI1BuJIwHYte0UutcR8vG
         jTYQ==
X-Forwarded-Encrypted: i=1; AHgh+Roc5C0mpfTEIU6nL73YIaabVwHXk7hEX9U3PxEGf0LZqPnXzpXidlU+MwnAHeWzNlCQQjsqcCHnmGPT5Dw=@vger.kernel.org
X-Gm-Message-State: AFuF++nM5ewf6klJRRV2c5Y3Nou0ye8uIrm0IXlmAmd6URirMnNFJ5L5
	gZin9vpyyHs0lV3uO1rN2o4G5TdZZPMd3O5IaKuMPDcr+4I7bM6TE0GoD9+nDPMlYPfLw0MMpPg
	dJ61hH2UvaGeBZedF2+NbGjuHD+WtAWLFQ7TXDByCOfRZ4Y/JZ0y96NuBXRbpbfFawQo=
X-Gm-Gg: AR+sD119mvSwW6t61gGVlTxLALdE9zIoobHa13TKLV35TTGYg4kVd+hjjDYYzOu/g0p
	shRw/704OFNFOO7ScwW42pG4Ux3iOd6RjdgKg/NK/VEIIhUs2yU9+X41thohOT8ETLYJUFTJI9e
	HWQbkgrvtLNOhid7QvRYAMYhQUQzMFqIMhm0lfPPGbLqYphCkSMa8hBGtPEBGK89llCg/nFEhEL
	aA1Edf8MwwjV/h1Itqak1fAQv/5e/ZQXvVj/+EMzAolALaPkTtDbS7FtUlse/i/f2WuRju6+iRR
	1Wwlc1lN43CDcowIiM5p1XdwYJgXs9KZBgbft0U3E9/aaeBYw28DqDUlLC0LpIsLk4ddcxg2IDk
	G4dx0wco=
X-Received: by 2002:a05:622a:93:b0:52e:125b:9444 with SMTP id d75a77b69052e-52fa1d2d479mr162923751cf.17.1787920669045;
        Fri, 28 Aug 2026 05:37:49 -0700 (PDT)
X-Received: by 2002:a05:622a:93:b0:52e:125b:9444 with SMTP id d75a77b69052e-52fa1d2d479mr162923001cf.17.1787920668485;
        Fri, 28 Aug 2026 05:37:48 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:37:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:21 +0300
Subject: [PATCH 02/11] arm64: dts: qcom: sm8450: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-2-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1857;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=is6Qiuvtglru2UusENwCSUsVVZ+vsE+6GeIb1ZRKfgc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYEL7XKJcgcWfdFQDMVzDX/Wo+Nx1d5EFLFle
 XAULskT1wmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBCwAKCRAbX0TJAJUV
 Vg1IEACOAvs1iPm6inUQ3JEMGrVR9bXiJWdCheogwIMTPYNA3DK+pT1WbLm9SMS79DJxDY19RMY
 dNvwhEHkymyim7p+jqbbEo+OVNGRxx2/0/PFpvRRHTlazCnDdMaQ36Q0hzjXM36KF+VXNq6POMh
 3i05/G7iN0Tm0rhUGmmefgY7zqyB2vzT2EfB1BTEZJNJnm7UOv85+fWc2uVMCp0wgiwHViKDEC1
 N9yB3V2uNcyMmrLoleu/5v5tkWM+vuv0tWoRKQBwmj6zWkqhmMMDvXzEpaFEz4nCq05/JkC13dB
 vMOUdf+ZGZtN8dV/DDmwYcbfOsJwYojM7oHX/Ek2KWeigSpVbup5Lg7zUSdQbYte3tFkppLuvDe
 bPXl67cnsgMGAPzHAZ8jTrdn1uknWu8GaOjGcmth66vRREGwpQjFvBWt5LYS1A8IAL3pWGfGevO
 v/XQOgybIOi+/YXMV/FM3nAcgcF5NY07gEqeqD9kFSJkPFrEI9M+M+grB2jCIYBM+XKb8wlNZyK
 bij2Ys0X1uXdAOnUZ4BJxnTre015YjM4cUG5px1aX0yAnOygxA+PQgM4fyxe4QacwJbvrlRAZUc
 CAaT0pdC8rUBVaXmONVEMa09Vd4CUJNs7s7fYHEduvsUr0I4CaydfB+GfICQLzIrvEzQHxBg2b1
 A9QBiQP9kORh7Pg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: eSY7Mqhi_saLSlx6oLiODD5_XMdGOvJ9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX/Ts3FmXbRmPs
 q/k/kwTzq7dQLGM75QjWc9o9sLGCB4axUu6iNkLM9W69BOqsX/Hpqmsaxx2rUtbSC96OJ5ym1Ku
 t5R/qEM2+17l8zmpP9LF2zqO1j6R8jw=
X-Authority-Analysis: v=2.4 cv=IPoyzAvG c=1 sm=1 tr=0 ts=6a91811e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=R9TnukjFd2VXrOE3MjoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX0W3QTEJAuKRr
 6GWRu+aGBlitAN31LA7G65Fsrolhn+QHiVXlnM2V51Rz9Bd6Cp3MGl8m94b8glBZTNpIiD1/wla
 g/hMQ0p00Pgt73RGjH3rjlK+z9InLaQES1GoE+OhaWoUHHlsp2lhRScytW3DlWXixiVltaNXUPJ
 9brkuN851jABsrxx5uMSZyUuOo35p80D9o+39sDUlA4x7GvEBVDz1Gi3bx3DlsGGL8WXTO1G9d/
 DI8TclkzpUtKsuX8/CBUI14RMWQOHUXs6j+qUEY9mbPSCoKD9kP1D7RCY0KW8ms3LPb4rzK3/Bo
 tjbuZTxP8euA+aAFUZ5Ufvh4oH6kfNMZYIddMuh1P+z08QQFIzuj5kSFRJ+izQ3YuLMnjvMsg+j
 5s39PB2WT4iEyQ636TjNn+HKCcgnkJix+ffFlwCEOrnA/3K66O7PKvx9phgTypFWePqbjR+UrnA
 dw+9b1Yz4RYdArqCOiA==
X-Proofpoint-ORIG-GUID: eSY7Mqhi_saLSlx6oLiODD5_XMdGOvJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: 3a5cb1ccbfb3 ("arm64: dts: qcom: sm8450: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 4ade28f40cae..424c06e88afa 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -713,6 +713,10 @@ fsa4480_sbu_mux: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 4993059483e9..cf054226fa24 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -414,6 +414,10 @@ &i2c5 {
 	status = "okay";
 };
 
+&ice {
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..6f9d5a87f1c4 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5370,6 +5370,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.54.0

