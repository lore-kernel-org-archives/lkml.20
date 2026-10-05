Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E35047F793
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203117; cv=none; b=YzpLAEPcqivM7KChtSXjDZhJ+EETTBoPdaWuxNbMk6q5qfKcpyEhAsEx7UAHya3ECS5AqEf858Cjtw252XTb/CVM6JVdJSQdxjuVzWA0lfA6w7Jshd8OOBJVy8yD/Hmk94f9ZECa7LzShBE2FgrBAnX4yjHQUhsD8d/8qui5v08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203117; c=relaxed/simple;
	bh=HKyqwTUYTExMJhmb1+RP4eW5jgd4a5EGVzR+sCfaZAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c3der8JsGNA2t/cLdH4LImYpKAioqUuZmuOY9k/RLbZ/YtriuuiRjG71kRVfzsL6LML25F7sVjlSb4Fl/lwv6qylPQZ52XWGF8RjlVcPoMfvWfQuxp+fKw5Gu3FZGnVV0AuKNqesVf9FHdnG7jbK5ydulzdQEZp4aJVeTjyqMMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSHRR5Wy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJHw6w0A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSHRR5Wy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dJHw6w0A"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFU5v914080
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 12:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PybEl0v/KkqFumtq+RK4a1+HLZwxI43+u9l2njCMD+A=; b=WSHRR5WyGVM/02jv
	D+7OKhUrpytHOPGM25We0HWsnQ+1JXi5Txk5ggn0l8+iz8EtlcsPE1GeacpcS4jA
	Et2dreGyPozErH0FajkxLm+2oIqnEmzb2hreTFbgnPWmO8PtmDndL1nrnWpWq5jS
	U9VFvqyXZkMFljeTapEvd5A9yOhQsRWyp5CzCjdsdzNWVDOd1G6dCq5v0vizd5AT
	REj6gIYvGXEDG7Vrr1I1++ZWZC5R+fxELIuUSUiVtVQU0SCfy1zKss95/LwF/TK6
	uJidpBpL8UPCC9F1B/hF61L3wgXzZqWB03rq/W+2/oD2KOSLAsGxLfJvoHpxygX9
	cKDaXw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfkp13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:25:14 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c21c2859ceso1134031eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203114; x=1791807914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PybEl0v/KkqFumtq+RK4a1+HLZwxI43+u9l2njCMD+A=;
        b=dJHw6w0AVumQUGAEYWRQ1KUjL3tB4urwxm+jC7rBLNPvWBn5EAH61XvuRu5eaD/XbB
         Cf8M0y3trIfIhzsLF+WvXS1CmlehYdg8JuYpUwcp5M3K7/kh7jUp/Z1kCgVcWd/LaqNm
         gFgdbtj//KTlTm09MGBi7A5s2JuNJ72qLgUBRCBT7p/MnbxGfLeXZc/iEEd6L0oAbYhB
         uuYFIJMmV3aOWp1h+T79TxRwsxWddY1P6C7vWY+zmwaMEd3+nhJiuEMT2yffLj59VOTI
         IZ0GMpmfJ6aFB5s0IfZnxZZN+I6HeE6gWYyjryIvOmU68yEuaXkkzFP7M8Bsu7Eaanrn
         5Xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203114; x=1791807914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PybEl0v/KkqFumtq+RK4a1+HLZwxI43+u9l2njCMD+A=;
        b=pHzYGsBcT4DZXnhgACpXF09fLGfhh7k8kvxcdJV6HJ4VAtAT78027q7v7MP/hkjWZi
         tegGM0MxfNWiW045EvkMIDyGRmufk3JxheRL77tozfcU1jreVXkuam0NDk+jITIcmJNE
         4D0papUA492obV3qpNqfVRIsiCGGL5r3P5pAot5kksr0bvpPb81t+VlGAFuOC/X3NE52
         QBaIrD2TyoMfl74VeldhIMvw0t7xWd43ycA9HNjFkQ1PaQ9LnKukXLhi7YOTbeAI0TLC
         C4M5IyS8Xvr9mNq4rrqzxnI85XsIU7zixkajqNpDD0foQjp1PSNT63YMRl/RF4+PyY0a
         g3LQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlLIZ/WUAWI3leTsON7K7xxXlcDBHKzKaGuat1li4k1LP0rwHGtTVhWp4dr2r7EXq9Zqyw+Nxcw7qSMIg=@vger.kernel.org
X-Gm-Message-State: AFuF++kGNWjS6Sezd3OsuQPox2aPAtgAbltK2sCzjieb6J4l/gfOAxOU
	nYgZybR9guxZtwvWGPiTv0jK4qKQRDBWRQcxqjnMwhIQWGL8r8pcPxUnchWakTaR+LSw4lGrJ3M
	IqEWNwCJOfwJZkOj7yxyuJTr2NOC3BtBofmEpMMo5hTdnu8i0S64jkrlWNln/OYu9GcI=
X-Gm-Gg: AYBFou1SR/sZYiYLBk993bRIjYW/vu9fMnmZgSWH/xsSb8A66XzhBB386d7r/9w+C7H
	5wDk8aytW23b1S3spKLclz4V1VdJaHNLzJRM5gR3l/WNw6qlhzv3drdoWvkwXwdx+G1SgXVlYcB
	F73kMCG06PInIRw5f69YPbae+EzpfUzY09hcOyi2TM87sGGDtiX6OmWQTY8kSxZxh6MvkZ/44tN
	/P6MyzZudiVGd5IYigYEGA6UPEcTxh+vCR5AVzXif2Ofy5c+SSWg1vpkGYEtVALF2aDmmCMcMaa
	sATR/U0NWmqms6v2tKnBtFCYwjkfphoKBTCyX0lUAgxn93MGcZODipximPuhIIy2S72qEZd9y+z
	HFQiTZYrd3sVUJcAmrL4xp3S66B/+JhUUFA==
X-Received: by 2002:a05:6820:81d8:b0:6dc:beeb:34bb with SMTP id 006d021491bc7-6df35e2d88emr8799359eaf.84.1791203113592;
        Mon, 05 Oct 2026 05:25:13 -0700 (PDT)
X-Received: by 2002:a05:6820:81d8:b0:6dc:beeb:34bb with SMTP id 006d021491bc7-6df35e2d88emr8799333eaf.84.1791203113089;
        Mon, 05 Oct 2026 05:25:13 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:12 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:05 +0530
Subject: [PATCH v4 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-4-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1196;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=HKyqwTUYTExMJhmb1+RP4eW5jgd4a5EGVzR+sCfaZAs=;
 b=5HSQzgqUR4kSrS3ESJ/jApz0unKlc2PE0bH2wC6xqh12aE4FFMmz+UJx3J3MQ6MoV2dHLRxy6
 zz8vcraCfp3DVDVCg1Tx9PsXWbwGPS6mFvDfMvonDm2QOpe1Azw1GUE
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: V7MXYLba8NpPjlxDuja7sbXMukqwQa6H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX3LqiCRclSbUr
 MgHOA981ak9sagtPCsQFDXB7dEf0XFqkRYXZjfATQvy6XP4uWKIUsT1V4C4wrB6pqFXYkqgM8AT
 MuyQUz8WtgXMMWlDFLterEAnHJdyylU=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac3972a cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8YuGtcdev8JQwI9EQfsA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: V7MXYLba8NpPjlxDuja7sbXMukqwQa6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXxLvSOW0XtBNs
 xrQiDlNuoxz/4TOY0bz3qGpnPpzxTu8UShb/P4DxjMzPiQs3zMQM6dJYifNj0JdWKJlMcF7tjbN
 arsBZIz9EsEHyiCIlasu6nfV+ZRYSFYqIF8DPk83J/nWrTP27EjBTKVI9uBHowDUixe2cWYEBsN
 rc57phNGoAGHgUH+rcW+h4B1HGO3SA2o+R9lmsT5RaqQC+UvhDnvC0kH3zyi/KkjGbrUnnuBB5o
 WHZs3sqvWiYcEm1zPvSWp6HehVEBQ/7YFxZAG4+NBmeSltt2TFr7NwY7u//v4M3JqmTyPsOztDr
 qXoYfJDKjkClCBs3Q/Gc9NlFiBHFcq5+xd1JjjbL3OHDMMHNLB2z/iLbD68IkMy2XDo1XjGibMb
 6qJ4QQyCnDIAgWdC7IuazVrhlnyk2ONVFM9wYK4SMTl/ZkV2KWX6jYR2DQDR4w9a7EwdD1rbHck
 Ubx+boh9iDFUJpYXQ5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 43cab07126c5..76d0481914e4 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -89,6 +89,17 @@ pm7250b_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		sensor@1d00 {
+			compatible = "qcom,pm7250b-bcl";
+			reg = <0x1d00>;
+			interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7250b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.43.0

