Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4001D3AEF2E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146490; cv=none; b=ML3mUt4sz7g3oxX7NtGvLC2FyJ8rbVXyTRjJoLMYpqQKtLe5xQRS/St6/gC3OmCBbTAmqjqdYNNu20Ymbo3h0H1hBDJVeQsmoxmfFdMuU4ibIhi1yPEYYqP1vjug8iSqRiIQTaVmM08s0sRXTZxcvauLX1+haeOwDn2q8YtScUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146490; c=relaxed/simple;
	bh=Qo1auokYYhVIFaBJtPQFmiVUQCNJkFUL4nNSwi2XFZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXbe5RNkb8vwxHir+Nxh0oqSTQYqgs5wm/MF/fmx23triQ+lzFDPkdoZmvqQS3QctDKAWMd2Wap0gHv6s0hxp6N98tHs9ldGT1l9Eas9cbDmdKgll4sjn+FFlCOyE8acRIrGKQvlBpYT7KqfpoTDvftwBhKZbxePRgCkAlIbnI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2Lue4Th; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZWLQdaL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2Lue4Th";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZWLQdaL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bd9E2179756
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T5xLFRY6QC4
	gGYyfGZe54JVlSYu/D3Sb6Z4L8g9c4Mg=; b=B2Lue4ThYUDpYiazk9ZTm98xxF5
	xoDfbW3xdn/vFU06JYTkOX3IJT9qcDKHVs2dqzFEwCMkBAYzbPT9gnVM+7/aLbSl
	iivhQ1GwNKs8lLEFnkV8j0uyUBdBnK423sCJ40QEL9D/wXay3gVjds9lLfSPuUko
	Q8/h2mG7QFa6OEJIjR5hbfabFfitMZr7f8dLovijh2ngoW4UbLEU/Lh61qC+icsd
	V7FVixTmZ+1kOgGXpcXLR/BJqMPsXwOmihaH3HgzE8ep+XHfBL/WAaFEZjMXk9tH
	Nl69dlHsU9htmllNuGTGsGQHg+l11LnhQDSwJYhiCL/lrRmrVIrthGkuAUg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2mbbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:21:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso3177358a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788146488; x=1788751288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5xLFRY6QC4gGYyfGZe54JVlSYu/D3Sb6Z4L8g9c4Mg=;
        b=OZWLQdaLipJ/FY42rya0dNcltTw/DpFAjN8GgrX490HPRIuu1MIbJIO/H4o9hzfkBH
         dy/kKfowG0nMccKdIZTS5RhNhUCBdrFd+nPS+cl9mpme2H7djUYadm6RcZbq34RUqxgp
         Ii+6JnzbB7qXhxg32nfzqnluX3TKIi0X+f7Vgx+yUGuiSW8XdyHEwtCLLZMfTsRiXzSd
         N28qHeT5lN9qgAo0sNjNSFBXgCUQdoI2oiBfSDMkx6NW0NY+E4qQGCp+kqCJJ0AqkRRP
         MvC28XHT3vxgP8HWGz4qZQl19/ucyxB8ef93/7YEo+6QS8+ecmtV7R47PVc2zxW8C8uq
         UzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788146488; x=1788751288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5xLFRY6QC4gGYyfGZe54JVlSYu/D3Sb6Z4L8g9c4Mg=;
        b=avTgiyKoRPBA5M2Pp5H5dW7CPAcNC7RmVaZzXSSwV7VM+wPEaLzT7BLXhyweGwkw+9
         Z0UAay9R31Zb8PnZ/KqyLGt9oHC6HFSX6pxPFa/nLwDGT8l5GkrB633u/QCjUto8SMPq
         wQOFWXE0YSs3c+/i6UGvDnLe8GFkaUffS+XYwqvCJEXRaR6xwy19IIlfQjJBCfCM1jls
         +lnyLak/2CQMgTPuzjlOKwu/78TqVb/QkFQMfAKRBLCyjDFf4t0Pfuo2giF6Qo/2l75w
         sKTH9xKFDobdOogud9QyM8Hs8OP38brx0qVN181paBu96O0U9m8JpY8toOT7+35yY62Y
         9VsA==
X-Forwarded-Encrypted: i=1; AKwUvBwCwyc0G/r5gCFgFl1AddWaQPDbaR0sQ8I5NK7UftPyrmMACM1L67awKJ0DgKtp2XuB21BZiFiYpyLDNkA=@vger.kernel.org
X-Gm-Message-State: AFuF++mJX/IKp0J5NSySWbGglJxXzDTsePMFsV6R1tKuQa39WlVZZOFV
	GOervxFl5TN43BwwYLer913cdgGhUiKxkSlo7rPFNSFkyJrR7/nn7LXfjHisKxBJRoOYwByStjj
	KJITO+rOANVcnnmb81u6m/nmTheOvrrWtkLW9HpI8r9WfsL2wXSA+JatW/e7VvVlwsZE=
X-Gm-Gg: AYBFou2YJvrqxu6f+jQW1AezbvwQmXY1e/GvDlXy5D3Kd/JoveE1br6d3FbJwFaMgAE
	/c9pc9O+mz/Iq8lgT3csldb/od3XAEB8ws4hEvLuDBZrxfmKMez0UFIGu+3HGOMA6Mvj81M9boA
	79D9KDA2F3NL+siL/HADsWvHW47AkzBC87fjJ/MFaMCpVSBPryc9GsMLJgvCcbtba0uhZY0/YkN
	BP5Qwv2Jy1msdvll+QLF8ngjAeU06qzEbxzZAC1Cn7f9keaKXlgAgd1ee12Yq1JTQSbANWVTr6Q
	lgQvcH9/pvmmnntFXAS3yicd8J7aucZTwExzXBr6oBie9xU/R+11TFHxD0EFOSJPUH9C1X9WreL
	VSW+686VF/4ugGJuqaHzNfqs0r542q3qjeTx0mWItZYuEwWuf9v7ahKwDFh60
X-Received: by 2002:a17:90b:384e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-396d104d0bfmr31846937a91.15.1788146486777;
        Sun, 30 Aug 2026 20:21:26 -0700 (PDT)
X-Received: by 2002:a17:90b:384e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-396d104d0bfmr31846728a91.15.1788146485315;
        Sun, 30 Aug 2026 20:21:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm25599208eec.18.2026.08.30.20.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:21:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/6] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Date: Mon, 31 Aug 2026 11:21:00 +0800
Message-ID: <20260831032103.341633-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vNRseyLr8DqwewkontN5CWFxsfMeucGY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX127zduOD86UZ
 MOkg5RVouWl/Ij41Yoa/5nOZ6yO9VefF5sct6ht/lAM/MwBuFw/wJrg0WQcw+eZiLVV17G1iVm+
 BUF6/6Xsez7RL1icwZmmnxL3jpSuwTo34tHRTgEXxmw8BTgsVAoFeiVJgJFmJsfserYaI1bifc7
 vpmCkJXwK4fRGKGMEfA/OlhywUWuW31rT2vFIUYDxAG3MPDTeEef/Zhuat4os8IK5DjT3bdbOGi
 XRDvJIUYUx0mlQ1jhDj0Ncbtr4uIEbdw+yl+pAZErQ0zRxOx7F78iBeTOuwfdUzzYznOMBX6+tC
 LG6JqUimv62osV5k/3POg8S42p2FYe5wQ7KQg7fnn2GSQjEC96mQtA1oNyuKSn6qZg9ERP/njUM
 xYjdneC8ggV+94r0YSgkEHYOSJ9FAknZNkWRKQGOK/sW0mEmqDXhS7wPsXIGlWPzeFTyxa0P/mk
 rQkHoH6HnLXKJUqbC9g==
X-Proofpoint-GUID: vNRseyLr8DqwewkontN5CWFxsfMeucGY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX6gwMANVsggCI
 EX5v149d7MrRFlO1QV0+aF1ti+gamzDgiH4gVbskFior5B0uMVFhQiIPdfwtRKwiMc6RtUIoqSW
 lfcjIfM9vkdJLEgVxyxiZDtxlb8n2kE=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a94f338 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=eAws4zb0lv8ujySLY5IA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310026

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the SPMI PMIC Arbiter node for the Nord platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 03703324f487..83760341456b 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1865,6 +1865,28 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c400000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>,
+			      <0x0 0x0c4c0000 0x0 0x10000>,
+			      <0x0 0x0c42d000 0x0 0x4000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,nord-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xc0000>;
-- 
2.43.0

