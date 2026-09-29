Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A5F52B1D3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687455; cv=none; b=JPw8ly79aN1XEjKW0xI6X3D1GVCBNwzICsvibAUoylt+Kq8pQ/a/8DO6BeJxheIqwxWEE72iaIUAOmXkL0N6qrtCBJfLVtiWwUB/8bY7qtY043dVjq6bGN/74pwCRu8ApuESfXWH8du4DYS/S9zPFmeuiyRyp7zF2/sn4MsRKrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687455; c=relaxed/simple;
	bh=EynXBYv7jm6IhGXsx+LGDH4y4B7iCFwW4RuCBSpWjto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jIrYnr9iPxidCfn4zf5nTk2/pfOljuameUOdugRGJqN+JPDhuh8yCmxdvWZLb/8CI2XvL3xvN+LbUGrqjQFHLBrOUC2mbZTrMobsxFMnxv3pJoV7tyml2ENJMwJ4duMHv522t22+FzulIZkRB1LxfLvxCDNpXMRA3aPalz/1smE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyFn949J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKg28DBg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyFn949J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKg28DBg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqhaL858077
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MlDeI22alqDXecSnxJALXX6TE1LHhNM1IFhg2ie+kKg=; b=ZyFn949J8H2wK35J
	U0EQuF7iIxVy1nc5gCGsvfTfZILpNhX86czvaTMghi8RxaIJgyiJTK/+xhxzNdOv
	Y7xyEInQNDkPsMIwsvGvoxi6mziPTGY3LBGYwFfFAKzbC9OArIpWCqf27sV0LH2q
	WV5m1saUL8wcgpjwyW+tkrHK4n5+OUWFobP/WjhoIFvNT6Nsobx+oAoQ7EaoB+Xl
	wLHqRgUgdqW1BFYbtP/e0kRBllmV92ECR2Jn6Pcjqy/V8e0UfxBVsN9U8VKzo4FF
	kIKoZWFA/UblD3fwV+KGjWtYPE7+e8Wdudt2F6C+CSQoRrjs1LBsz6ec3fbEm8MZ
	Xx62ow==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0hjbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:52 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6714db09f55so2660227d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687452; x=1791292252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlDeI22alqDXecSnxJALXX6TE1LHhNM1IFhg2ie+kKg=;
        b=OKg28DBgqLxnlHwlLCT+3jiEBuqA1eEe0vZFxiH9sddR05SdDoiQrpE9KxR3CbEYaY
         mzFCQBlQP5PoeeqKQJ1bxq+W+rLBuRYG0FLa6Y9WgP6PbE7o+/cCIY/5RZ1WSeBjerAB
         hRvtNyZ6iqb5wmlKU1QmLolfULvFUk/L6zlOz0d2K6ZebyMv+1tIZJXFuz8h6q3r82c/
         YziFMxR9H6CfVsIaybVCHJQt4RtSuCn3OSENxL1BqzG1FOlxTGJRno4gcn2t386J1qvW
         Rg4ZULaTfk3JljRhSkEoW0t6GFDB1tDjAOjBjZzNOFSPlFj0QZ/Yl3RbtctlgnNwmqwl
         G8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687452; x=1791292252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlDeI22alqDXecSnxJALXX6TE1LHhNM1IFhg2ie+kKg=;
        b=ZA9AQ7IV+Xg9aJXwVcfhfZUlF3A6tcMC7mu8nZIEUO8nUuFvFVBqrcSuX4L0hVHCWO
         tQ/KsyqpWFOeH9m4uI6X10d7rkg1+vOZrClI169gJrjZJMgFKnCw2WibKv+QcGjsVI6P
         2NZudL6xe1qBZl0Ltuiq/MCcAffDT/7sqoqfe6NdqPFaz58ieu/EX3e6w6o6KdNzXHU8
         v9+8bJ+krBRsmesoJdH/JhwFjUyATnlFHtys7e9TLBG8Jqy+Oh6PeAriPsf/Cf10cLt2
         XuGkuEcrdQiDGwHiMBxgxqrZLNQ086BtFt+vKZhyRohJYBc7u3kVKiZOC8cN9IcGzLkE
         gDWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzg2P4JtQx+XN2Iw5dd6uJcQ1lLQEBXJVnQJBHprXtAX/7zUNDaNRiWFFRU2V5G/SZKgp6eMZBHjIwrPik=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq/QVcsL1B+IgZfgQyrDtXvfFle/Wqe54nBg59VzUhKCq9q7LS
	4mVZIuEI/yG5WMbpFYyLGURN40Hn2OTMzis1eKNIrqA5QL29xmaJ+vTgmhXQ4nyK891cRe6rTtI
	wwoRcWdJCK6i7EXjAf7CUpoK6tv5rLhrHA6IU3sn4AJiwGW0KVDn19iFoJj1Aq6sKDLM=
X-Gm-Gg: AYBFou3uGpt98e5x+kwfAo10JK2jAV8m86cML1wcLTgXDp9BPsQJqvx1Y/RRPWtd6f1
	LxarptovKAQJbzUhIdZkq50BZMqjfG3GUUNKXzKFIdDQPna0QC3Rpvk76uMDDjg8mHt6H+9uSuJ
	roaVEUqH3WhnYAAjF4p/urflhZgXzPROFwJIGmuKCMJjDamZ3DInKas00W5zmHSa7rytRrYUGvA
	n8aJib+CHccleofg8kj58aHaSKyDwjB/HKmioL27mmRqE+56A/mhJiZ6sPHH483AU4KSEkRqC8K
	D0aJFskzdXf74jDe0O6R87CyOeJZDdkZPqOeOZaUF3bE45P/dR9f5r9k4Qcjn+Re+84PzX//cn3
	h9l+nuoQ9w8ITpkfQjIytxcopzaCyJKvPnhk=
X-Received: by 2002:a05:690e:1247:b0:675:6bb2:cca2 with SMTP id 956f58d0204a3-6756bb2fb4cmr349391d50.104.1790687452261;
        Tue, 29 Sep 2026 06:10:52 -0700 (PDT)
X-Received: by 2002:a05:690e:1247:b0:675:6bb2:cca2 with SMTP id 956f58d0204a3-6756bb2fb4cmr349357d50.104.1790687451753;
        Tue, 29 Sep 2026 06:10:51 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:51 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:41 +0530
Subject: [PATCH v3 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
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
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1146;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=EynXBYv7jm6IhGXsx+LGDH4y4B7iCFwW4RuCBSpWjto=;
 b=dj34oe+T09Fa7ErZKy/lGsEr8Pll3n76AGjBp+zp9lrbHKJrNgnEKsUl6BLy7U32S6eVmW95I
 51TZNkbrw9gCGrIBYwEo65x/y6tbCT9Y3LnivZh1rOUiNPpW2yLXFjZ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX8aY0m1a6KoQi
 1+FarDiUscI+ix/moTfQwvKvC/5Vv04VIw/WufVQwdACfQyZc/U44lzfYiso30dnJWyHFvwV5pu
 AALj9ma3X3y28m2D6vSwKz00s4GW/xI=
X-Proofpoint-ORIG-GUID: IwaIyptRKsF4_lc9GxfO1zEWnG3X6BUP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX+3iuPzaGt3xf
 SbvmtsgiNlNxgHipX37aKMSMJjOdd0jpJKa9nC+DI9QijT0g5fr946klkStWQNbsrk2OrEX7IuW
 b0SqYMH1Mscfv+7iwAMstxlAzqaHdxpWdf3U94kCHwqNMIKX3jPBMiSc3RNb3ySXRwzw6llXk1K
 jxEXZ7hnRLxJu3vBgWR6M/fP2C27/omfsOJcm/wI3eZpcw+CRU/dWQqKAweqszkByNSPEKQLG3z
 xhDaiOmvMo2Tj6i/d/Rh8BUsIby1COilgj2uB4SlUGZvYpW6a9QqDXzhGOMI6WTwXGbbhVmXHID
 w18QJ7o0+xO/iTizL9mrmQsL+FQlgpvCBumLbA1TI8+ktKw0YK3UgUxK/HPpyDxHsz7WupNVYn/
 8ZUZ11fMhYyGozVx+tM71i+Ax+SMbT1m8NxLXGVfgBl/IWOOMm/b9LMcykkmNjkMX8QRQdfVwm9
 SHFShQK0NFLtWURd1nA==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abbb8dc cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=C1EnqVrfhtXmwaaqmQIA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: IwaIyptRKsF4_lc9GxfO1zEWnG3X6BUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0101.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0101.dtsi b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
index b1ec41325958..5635ed350f38 100644
--- a/arch/arm64/boot/dts/qcom/pmh0101.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
@@ -43,6 +43,17 @@ pmh0101_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmh0101-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmh0101_gpios: gpio@8800 {
 			compatible = "qcom,pmh0101-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

