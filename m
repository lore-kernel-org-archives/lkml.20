Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453027;
	b=2zh3QYBM6Pdz5kMUe8WGBefNAJiZf5GoTLnr1Vdv6zVvA1492P9AZOqbhs2e6c41sC/X
	 73kZyghNEB9dUeVYQO5hPq8ajSDtPFfACjG7xH1FlnvGa8DReP0fR6td8iXG1TSknkohe
	 9z70+oXmzuI23dl4sjCRknhr7ywweT8xTiFNzu0zsodIST6Tetslcdpgn8gv7LUvf+R2l
	 8BkxyJFBiHsgmCqKI0fWlM60ob39mdz25sjZJzLRDTsTCWrvwxSkVGluuAZZAYfGatiTD
	 wrUvVP7hC6Uk+v0QRD66DXulVdVQMNqX3Hg25fV0FbNYRqzSpFYrocdor1D8t5/FRrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453027;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QK/sB9dSAJ/2G2Zrti3sXc4ovzV/2wnifjT8fx0zQuk=;
	b=xoYuXnK3gXgqbv5vhRDgcJdDWIdz+yTaiNr3ZoXE/G2X4yRJZotqdhzXA2DhVLBOWTMa
	 X4GvTgiRWImqCbhhdUm/liANydgEsKsV1d2nmga3FA7wq32Zuf5NqeNMoDulKCEPu9L6Z
	 CHe7iu+TNJsz3Gjd5TCcDqjom8YIbGAQhafLs7rC6O7n1+vAR9W7//umix3wVyXSjI1TP
	 fzFaiU8aXQt5r6lh3SGJaItRt0sdDLkDg669zQx3KLG3IKDFJY2ZKlEUsdlzj2bgNxSxF
	 vtkB7xE/UTsGq+77N+hWFAE44db2h29yvRepET3VcCJzocAQbtR/fH7ETufu5T3znXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAiH6qaW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K94VOunY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532CF606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 532CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAiH6qaW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K94VOunY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD03Y53174207
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QK/sB9dSAJ/2G2Zrti3sXc4ovzV/2wnifjT8fx0zQuk=; b=DAiH6qaWy3OIoFXK
	tjVtIZQJMMM3ei6OwfCf4EAUNyUcswW+pMQ3QXnvzl1y5jRjxg6miU3yhBdJmScY
	rrMXoPwcY1JjK2a8MYTqaFyDTT0hkRw1fCHbd2GdHhV/czB0pv/xe09CfqLlJsuD
	ltQNEB2UxIUMrvzhbMH7MRZxEXUwIwHxxUgyDLeeofAim6FIXgP1GtnWvGros8QJ
	V9Hoesmrozfe8mQgLlEu+TX7RZQ4LfsVSmU8YOIRuq5Oa6oHvSh5hAsYPbRSZJKm
	H/cHbzGwZCzDjDJW+6Z14zy+je+E85A4ZZfJxmDlpUoeQpYKUKJc92s6jo/Et4oA
	I6zwSw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fsg4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:23:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso3834616eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793453026; x=1794057826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QK/sB9dSAJ/2G2Zrti3sXc4ovzV/2wnifjT8fx0zQuk=;
        b=K94VOunYFCTJucjPgXdzzsE1i6nKnoHTpICFaG0+o72a3j+IdhQ8ITjJiKoZ3JLCCU
         c0Nbd7b60tGtkGbZXWS4nREbu3TnddXR72zquVuHjB8I53KPsqHPXp0geLVAiy6RnCmQ
         tZl8kQ9c/zXejB4hPsikFgemTX8y38DeV/oIxieEV0UVAftf7swrfdnEuh8VkaeahYY0
         D1e7QlNXKxJk6nZ2cZBg242thMw/rKeHdW/96aSHNSRQfyrFqBSmpdU3VgRaERX7+X/L
         UZSuvwLtt1lbNdLhgy0x32FFptYcze7FZ7bZ7Cos95kjdAWJSC/5jHqj7TFYeEkzLV0p
         blJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453026; x=1794057826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QK/sB9dSAJ/2G2Zrti3sXc4ovzV/2wnifjT8fx0zQuk=;
        b=hzo3YOAug3EL1jGPKTDtvOBlUSLehBEebkAF5E8gtVwEEYZjDTC6apJuWmVHUIrw1H
         DQZegp++aT0FxRX/qAbJYB8aXVurBnUKHGXLbIM2XunVKXBefMT7HpiXJaH5v/uUG9VM
         Usft8uBahIjXzUerW8mh0npdWnrW/UbVef/rvJ3EuQZZ5gxVHWmc6UtTs11XE4IWjTsN
         kiQlpTu7qqPBgXyAgXa1QknPWHpJNLhdCVQk8B74Q0LXu0ic8qSBrsX4d/OnqffeTm1V
         d/ki0g1WERUM2K3saAAj8bZUV8vGUwf9sNYJMpJ/uZUxhQSI3OtUE9sEHoZnPbmBmv6Y
         H98g==
X-Forwarded-Encrypted: i=1; AKwUvBxAfIC90zvr5qlP18R43P+1jsohv6OI3Rpp7CxknCEVtGPvUVJCH/OAtmbqsFv7M43dnZtzVjxmSXBlpZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSr9kQRA9Vg3LtfyHVSerxmngmYd2a2rJc7xE7rPSUkBBv44TS
	PaAqebo8CTZ0o62f/Y4u/svTr7CO3hNcXNcrb+IwEgcDM99BJAZZaSfdNvVM5xTeZHwpNBG2PAf
	VPr+aDN1EoSIOldi27m/j6VSRNq+HtLqPs9w7K9J4ocJPDxpoSRHO0rco1DGu76VG2/U=
X-Gm-Gg: AYBFou1ze5cv0jAqe5fT+hfyTzhdguHIWbzg9IXKfS4iSloXKRBeiEpkweJut7/bKz8
	NfXAJtRyqVK3l/rc1kskQPj4+7lA1sEks50jDjG0BrID2VnV//ewrD5DORQTjJ9fEthM/80xmKz
	xF3kFdbX64m/15f81gvGFUVh1k9qYGnLuNSxn+nJQpuxM1zuuQJ2bUeEr7szTEV71Hw3FrXQeUS
	UG0fSfQ+4B6aZfS9qrJdd9ha3SrO8MqQv5W82uNY5VtqQTp8Q66ct7fvkZUUHJ2A9zsFKJ2a0ec
	HrpFGI1JwvVm5DZ2O2Bfrfybn0+L0Ako95jKRja2i5t5m8iNRZM6OrnTNHE0/w5ELc9oIXlekoS
	lddq/HqQrh9Ql8T3S8I++8xklsbj2JftT+ByA/hts4uaNdgeAwfcWdTfMfnhNb3/SqKTElrWGlZ
	qujHg=
X-Received: by 2002:a05:7022:619b:b0:144:eb3f:563a with SMTP id a92af1059eb24-1a9497b9d52mr16175351c88.15.1793453025787;
        Sat, 31 Oct 2026 06:23:45 -0700 (PDT)
X-Received: by 2002:a05:7022:619b:b0:144:eb3f:563a with SMTP id a92af1059eb24-1a9497b9d52mr16175303c88.15.1793453025137;
        Sat, 31 Oct 2026 06:23:45 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm18234699c88.11.2026.10.31.06.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:23:44 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:52:51 +0530
Subject: [PATCH v2 5/6] arm64: dts: qcom: kodiak: use thermal hw-bin trips
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
Message-Id: <20261031-thermal_bin-v2-5-d76fd073ae98@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
In-Reply-To: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793452983; l=6059;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=zx/+KrnPBXqW3IXQIcYA1/rGyuK8dpGWYkITAXNPsCY=;
 b=landNCcP2nN/nDJm9jEwbRau0/QrQklY7co+ps2J8y2O/5eYr/NHeZXlWxOMXFTITaO7Ec188
 lgLUtKStI5oCbtZuCH6veO9WX5jrTp459fVs3SQ3tsKgkFER7dO397L
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfXyuru9jXIwX9n
 6PUaO6hd/8bZsduyvVQ8J50mUwDl+i7YADK3Njr/eihj1njxgvkVsnvM/BThLCN358obFOkd+Zg
 X8BnqYChZbgeRpKCXlIAXelWm3O9zQw=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae5ebe2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PCFpqnHMHODqJTmB6Q0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: bwEuHVnuMbE0WDFf9oINWiV6xy2KKeoM
X-Proofpoint-ORIG-GUID: bwEuHVnuMbE0WDFf9oINWiV6xy2KKeoM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX32l3a/53i9t/
 W4NYM7PtFj6zvXrHHNAUc8c5LmjTVln/RwmGKUf7IGn/HPQwopITknxYlsx3aCUS9BnfPVsyq8T
 wxb//VzCQ4ziLyoFbASVdTZCeS+eo2fgBTjVmYnOTuntbqZaK6StYgDfWz0GuOUf8Wrp6Pn7Kz4
 yATcVAMLnLAIRfWL0ca9Lpke0Q+pIaymop+BYnt8z/bI0HKNSrYzM7VDAIkOsUS4S0y1dejHSKH
 Tlh9WXkhrTYoCEnaZTm0UFToOgLBKASIe+7NCthCZZh3hM1eu1tyJPaqxbwYfVP4FMb0oIVrLVv
 R5LNqkE8y2pcRtf9nyl7i2HiTW8qkzpPvPiFK3lkhGklB3RsC/Txq65eH8gaacn6w645fVMZv6l
 MTgF+HBa2bpptj2QK6UfD1bItXS2O8gYfm9URQBF3wBS3cwsgtSgPeT+xXLtpEadG4nFZfJYdJG
 syenxGZ52dBhdOkVXkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

kodiak-based SoCs are binned at manufacturing time, with the bin
computed from the jtag-id and feat-id qfprom fuses.  The tsens driver
now reads these and feeds the resulting bin to the thermal core, which
selects per-bin trip temperatures.

Add the jtag-id and feat-id nvmem cells to the tsens nodes and convert
the passive mitigation trip points from a fixed 95C to per-bin values
(95C for bin 0x1, 105C for bin 0x2) using the new
temperature-bin/thermal-hw-bin properties.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 58 +++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 347815e5983e..b984cf47b70e 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1019,6 +1019,18 @@ gpu_speed_bin: gpu-speed-bin@1e9 {
 				reg = <0x1e9 0x2>;
 				bits = <5 8>;
 			};
+
+			jtag_id: jtag-id@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 20 bits at offset 0 */
+				bits = <0 20>;
+			};
+
+			feat_id: feat-id@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 8 bits at offset 20 */
+				bits = <20 8>;
+			};
 		};
 
 		sdhc_1: mmc@7c4000 {
@@ -5782,6 +5794,8 @@ tsens0: thermal-sensor@c263000 {
 			compatible = "qcom,sc7280-tsens","qcom,tsens-v2";
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 				<0 0x0c222000 0 0x1ff>; /* SROT */
+			nvmem-cells = <&jtag_id>, <&feat_id>;
+			nvmem-cell-names = "jtag-id", "feat-id";
 			#qcom,sensors = <15>;
 			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
@@ -5793,6 +5807,8 @@ tsens1: thermal-sensor@c265000 {
 			compatible = "qcom,sc7280-tsens","qcom,tsens-v2";
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 				<0 0x0c223000 0 0x1ff>; /* SROT */
+			nvmem-cells = <&jtag_id>, <&feat_id>;
+			nvmem-cell-names = "jtag-id", "feat-id";
 			#qcom,sensors = <12>;
 			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
@@ -7136,7 +7152,8 @@ cpu0_alert0: trip-point0 {
 				};
 
 				cpu0_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7179,7 +7196,8 @@ cpu1_alert0: trip-point0 {
 				};
 
 				cpu1_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7222,7 +7240,8 @@ cpu2_alert0: trip-point0 {
 				};
 
 				cpu2_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7265,7 +7284,8 @@ cpu3_alert0: trip-point0 {
 				};
 
 				cpu3_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7308,7 +7328,8 @@ cpu4_alert0: trip-point0 {
 				};
 
 				cpu4_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7351,7 +7372,8 @@ cpu5_alert0: trip-point0 {
 				};
 
 				cpu5_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7394,7 +7416,8 @@ cpu6_alert0: trip-point0 {
 				};
 
 				cpu6_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7437,7 +7460,8 @@ cpu7_alert0: trip-point0 {
 				};
 
 				cpu7_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7480,7 +7504,8 @@ cpu8_alert0: trip-point0 {
 				};
 
 				cpu8_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7523,7 +7548,8 @@ cpu9_alert0: trip-point0 {
 				};
 
 				cpu9_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7566,7 +7592,8 @@ cpu10_alert0: trip-point0 {
 				};
 
 				cpu10_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7609,7 +7636,8 @@ cpu11_alert0: trip-point0 {
 				};
 
 				cpu11_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7724,7 +7752,8 @@ gpuss0-thermal {
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7751,7 +7780,8 @@ gpuss1-thermal {
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};

-- 
2.34.1

