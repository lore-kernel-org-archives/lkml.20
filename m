Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264580;
	b=Jm6ixFh2uynqH7mSGuPukWnswbkE/o3q1E1R1NEi96XcWD9R3hHdKY68BYZJnjewQBHw
	 pZ/Q0wbcvonIzloozl7cJPqXDPBhN/qYNFZEeNS+qMEVvB080uyHPPhpO6tGLZKhbCkEr
	 bFvpi5DULS6IqdbuUo4osZ1cKp8I4KrjqQbN6tnR2xx/SBuUkx2hq+rHCkVsWGcHnTnRH
	 6Agl2CKxbANRJJhPcXT5NjNAXgycY9WEmEAiQjr71rtxdl6lEL3L3OAmgtsGE59LL10E6
	 ef95YZs9CiMYeuzhKxNpLtAZKqjB1eVc4okbfVFWEVFbwQY7c2327M1Hh8GNtR4rsQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W0iJhYwYFHxApioBxjUjHv9EZd+NjU0umTau3U6H/X4=;
	b=NMp0HJX5EvT9RPjc4pKp7eloH6J/XO3RVF/+e60WZCeemQ0EbcPazrWQBArA801GwfBq
	 Kxbq8jXsYy7cP3ldMOdWwlhF7ax1Vxyd7HK9ybGpGJCbtdEuO+FP3LzqbiOU2YwYWzHc3
	 W/oddgdiCJSYIriXgck1FtR7wWPupcFET/TPhwjiQVHoPxpMDOeEAqxgS+r5K2jWOeN9m
	 bhdeVf/3EbFyfj2HpZreCmE0ANPm/XRsXg6ZyU9oO6inscXKBRqkss21UMwbyV/qp91AH
	 3Vy9SzeNEUV+ThG2SE9d0PcX6XLdITA+WstBCog2h9OS6EZK/TJ/r1SASuhZjr/zh2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UGzuI/fB";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AxBYIiiW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6237C606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6237C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UGzuI/fB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AxBYIiiW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vDXX2912461
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W0iJhYwYFHxApioBxjUjHv9EZd+NjU0umTau3U6H/X4=; b=UGzuI/fBbzLudgIS
	gXr14iwDFjdzVTsZFGYigdgyuhuNl4dIWN4tkZxbHkqFlOdGYV5FD/wfbGCsLe8m
	5LbnXlm+FB9lTB4HzzK+MWPVUnvRybey86pXLOvGcM0Nu1RY5Rz11JBe7zUaGgOH
	FdX36c48cKPgTzqhwC3NR+TlESLZ/CNMZxHKc39P3KzUF9LE4wLBq7o5l4/NE2sU
	qF1luJhDxxIIZzKWk8s/DKfK6sbDO0PhVT6l0fy72a5J30ErkNG3/vlguxL7Axse
	m7PifjR8kQ2+P73kPBopA+kO5+x7eYyJG5dz0YrGkL6PpfVSBsNu5RD5wFRKLlAw
	fgWg/A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2b64w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:02:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd6532dbd7bso1216762a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264578; x=1793869378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0iJhYwYFHxApioBxjUjHv9EZd+NjU0umTau3U6H/X4=;
        b=AxBYIiiWtexYPCSJmTsUVTiKGpCgiY3fVJI/dI/nAQPXqm1ZRymFmF05oKATeW9867
         v0iN3y9tBEhW2WwAHaSJfxl6GXnrm6Qk79QlPQUD+CVIcgIMsSntlF5MjgYZmI9zQftr
         tC5qVJzqvQAFctsmjqKBcGCDCY31vKYhV4pHviyx3mTvqQBJXPp8qyLiScnb+Ea6Lst/
         K4FEh0pnmJihrTBgO1JZRZocwmdTqUCJp4pjn3QNVAUwBvGhhclp676+hvVWoJ1fT294
         6U5NEpvGEzGAlOdqupyetu30uJhhUvWudFzVTCbXuKK95IPPJ9G2suI7cA7E2ZnaoBLA
         KeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264578; x=1793869378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0iJhYwYFHxApioBxjUjHv9EZd+NjU0umTau3U6H/X4=;
        b=J3OIXoKBE8Us+vmV9oPH5YU82sbMzJGRxiCiNJELP3Wbq22e+Z3uwm3MkMUYt7/G9J
         RaFXJY9RONrtBDbQBSeaafufB9lrQ7P+qQVApBJjQgAFmszfg7RfxaCMPdjTU1xD9JpO
         mYs7Xbi52rEhLqiHTtHHlfHyPu0rvQS/fz3ETkf+f0S/RWMQEghuDakCrB+gTfgdwsvk
         2FfroaGNs2uxsXquqlmyz1WDYAvGOCC8jUVQPEOdbq23LPGe5L+jv56z22S+VSsax14y
         HcRVtZeNzl07a/CzZb+gLuM0B0pehO8SrGkdovDL9OsaSp6cw27OO5Q/e/+z6C/zni5K
         J5ug==
X-Forwarded-Encrypted: i=1; AKwUvByDS9T85ZTAqqt8Q+I1EU64p0HLfUYOltXrdzCZ17rZZSIczaIQkvjMhRwvwCrOgejcN8YG2rhDCme3Ayw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZRqrs78ufNg2EdN/Jx56B5Nd4XxJvxN2gmum7mWfVikl+mtG8
	qX6NqJF/ZwbCTdx/xKHxCx4GbJdAYFYRUfmOQE0wOTcRmUbdS19331J0U/WBF2xO0M3TseO8Vma
	gQlR+3LMe1Ko76Cjtrbg4W7a81T6HwlS6qx4Q42zrPpT0v7f5Lr/3rxex7LWh5mFSPa0=
X-Gm-Gg: AYBFou3/C5nRTHkjfThAKOaLaKDLFsIxxr4BFxoZwToszgbJdPu72znYYXeAoZFCe2l
	AUAMv4Ee8QF6TjnDDFINc7+WatUWG2FdgNGdV1kXjIXaPM8v6NIN1IPEoPb6DbMZumYDho7UUqj
	JqGviLt852RB9ZO2LWd/v9ey7EvAeUVxw6iveLVdwI+Gee3B/cuTmKgNfQr5N8Nfy1Ad1jHsWsw
	Val7jEeI6oVu++Qoy4EkpLPSjO/gIILb+902id4D7XSBbt770rQNUwMvsV1Dmcvo0bjkJjmCO68
	dEL3SLsu6hNL1dQQRUvDZCV24CDD67bORIeoajhLFRMqm2W2l7EVHf8wNuSaYJ5GO7Dl2Dk++v6
	Zsei3Potv3OWoOLacpSl1L/I6tQqvm4I+kI5U/HYuGoz5OKKEkqX6g9RTgP595mbVQxynwArNwl
	Ynlf3GAHR9
X-Received: by 2002:a17:90b:46:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3ae5823c672mr3892921a91.56.1793264578066;
        Thu, 29 Oct 2026 02:02:58 -0700 (PDT)
X-Received: by 2002:a17:90b:46:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3ae5823c672mr3892899a91.56.1793264577591;
        Thu, 29 Oct 2026 02:02:57 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:57 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:31:04 +0530
Subject: [PATCH v27 10/10] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
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
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-10-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264459; l=1558;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=WI51nMUK6qgMXe/JMYvx21HtG2tpC5q/6iKj1pJYETw=;
 b=gGvS3BpXvoO4+rAnmMB8gWe5F/jUrTtj0OtL+qKpMHz1TeSAYRy3TL5xGqfr7v91arFxZBUnY
 IUqkMdrzwNlAtyHZYqier3l3JTqGKtZc+5XnqRKZZeif4m/l9NQFXFW
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae30bc2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vUOL953GaZm00QgBLeZp-u0oYPhnp59v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXwAmnoBfqbMWK
 CrlQk5qPipWFkEaXdyyI35t1LOZh/0GY+cIzBjhGa+pB8SITCo16MWWlwr+5Pn3OtM/L7Itu4KG
 SDCicrabAg90IrAHOQFzZCzwzI8fnmY=
X-Proofpoint-GUID: vUOL953GaZm00QgBLeZp-u0oYPhnp59v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXzZQj3O/wxOCJ
 3Do02Vb044CjPvQd5Iti8A+ppyAAcHmg1Kik4LqxglRaW3h1Q6PxZkzAjfQVvjvaeqPSLqHg//J
 zODLgu1L60SpkGkKvuLWmdsUbpc6YRUjtIv4M5+migEu+SrdMQnwiudQm9dLd1JL2CykRlhwFc2
 L0YilBlFRM7PT0DvpITWhnTE7EKfSzkVoKM6/HoxZSbu8ZVPmvVZfH6nylhCltrEo4liCAscYyp
 /8tKEGhIp/VFGuNSSVmzd081pgja3eUaNO20c9LnVhcr5HABn4pzvjHvAMLksOGWFT8x+9EOqQ5
 y5CelLFJcgStC2xmXfKtQzXB6YEyIoj5h4Hr3m5zCkHupEiHKhkYxj+v/+nhNXQi5ziRubLtZ9c
 4D54iHqdhaH3wZeeEPux60ONJxu7tAtkHb59WDtpgOuH41NS6nmoqpJYduZlD92a6x94fdHBkQL
 ONByt9W5UdDwwSwkedQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290034

Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via the
  Firehose protocol.

  Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 142dafb04324..30e4cb642473 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -497,6 +497,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qspi {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8ed6f2755705..03da6400c5f2 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -581,7 +581,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

