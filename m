Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35DB41440A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575882; cv=none; b=Szh+91v8bKsl0orlk8EcQGRu08LEOkG4SUpteRlRZGzHyCMDphaN8LiQP1sjg3YVEiZpzpiVcpC21hPNVnhqA8su0N9askaBOwcHbD7axH0peN+4LXgPeH9hFOF/ceg02ycgfFZIQ3SNoWgfaR0yWb6U6fYMlflrCuEmFiiKw4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575882; c=relaxed/simple;
	bh=4fTpCSkuJ6PFbWarr8sThQ/LuS8y6G1v4667LcR6KHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CnVr/Nzqwvh1BpZFY3VKVAYAG7lCOc2Vdh+qG/pVQlzCwhJJ8wVw76FgwnmKz+31Xbc+LNtOj/50qYukNNXzSiwHT/irvLcPZgzawRJRU0ruKu2m1Il54PF7NoGd4FtwgPhbWvv5hJkUybVSUs8xJdGFZtAKbpm97Z0i8ENkjgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOZ9ZjuI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8P7nbum; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOZ9ZjuI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8P7nbum"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S1F1Uc359200
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y8QpsQNU1m4GxJroPAMjexZ1MBknKFRA0AkELRZtXV0=; b=EOZ9ZjuIE0dduKpo
	B6a2rcfZiNXle3ufVs7znH6/cZ6JJDFXCZP9DkslJe/QkLc+ymFVpZP+s4xD/ZbN
	h33Nt5onGkNeBDusGwEU1GVQw2mNpcow1gLibzZ3YeL+O+9zhV4CyZxUdsk1Me/T
	1RPhMa6CeK77aQoheDLOTGloArl/61SZHFTihiBbAdRQQySW/QhcvPUDJVNmK0ge
	uld8V+OzApogWvsR8NgT5ueCX5oyt/R/lncIq10YlIO5ByzuE2HfMDcyBmlRUPC7
	w4avWK2ZUl1REN+0KGSHOqdfHM6KziTUxsCvrolM+sZS+5005rpQeOZYe1PhyYA7
	cJWrFg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6e84pe8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:11:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e12723dc7aso9892635ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575879; x=1791180679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8QpsQNU1m4GxJroPAMjexZ1MBknKFRA0AkELRZtXV0=;
        b=O8P7nbum2XEu12GmR96G/XitTqsa15OTs2whBbl01k0pbzrx+nQ4xJ2S0Re3EZ2uv5
         BW57nqGEqvkJFZt8+2TaMTsVL2cIIMS0bq01iZ05U9t5mDLZuf0vYVhpzdQzW+C0nMz4
         BzYlBRfo6sSl9vEmfZzYtnFkYCoyp4xIygxWPrZl17sR0J4kwcEUZPeRA4S07XxHpZJA
         /RgAuK11AIgZbi3kviiAvqy3wZgBBMZ5asx9sruhMWaso1Yliu4PyCOdEGsrP4R/JO6q
         K0lBXC1nZT3aJh/woohYrckJIZzX4LiJ6EO57TejBYkopVnFnsrsciwIntLyKAAf7ZxM
         3qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575879; x=1791180679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8QpsQNU1m4GxJroPAMjexZ1MBknKFRA0AkELRZtXV0=;
        b=yOM/pR6TYWf0WIqRBLh6kQks9COohbdyn+3lWcl3fCZu+yxLk6/cKdX2rjEedKTGWb
         pYXWp8mHZpiT/lqNucg1WZh5NAfriBD4qJeHuuyS8533AKKndRU/uMqbg6DXxPJzL083
         j1rpwQOOqBr56Wp9cFIhXFWOe4fgt18xk6vwnEhDD8LxT7fvvBd9/H5uffQNIevldiBa
         9jkh4l156CtaSR/uQjddMLqGfGXYh/OYdTfwkJOaL7O8kzKcIIFzeRn7y2Kp4HYmiPaY
         2uzC+ZhYkoCLKTTXMB/31wfCFz/mjlYb4j/Ucy/Lv5eA4PE/gE+hvTMLzic8fFyqJOoI
         7/XQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvsSzpW0Rhwzjd0sjeOMvLIlE/zDwc1IPYwfsLU9OLz2uEH9O/d0FohdfbWgkgwmNQM9prqQTlhGTZ1Ew=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR9gofhtLDafT6zrgqHP5A85oB1uH89AbbUgOjf4VuzViBTaXs
	lRoAsLYASRKcqt+sRI91lTZSPPKX7Qz7y7QrN+R4pTfOCi/aDH7cIZMIOcN3DC7BYffYsiUpFaw
	/PVD0aH9PNnRTJBOOSRvOUgnGTPzuniuqI/dh/6tyvyirfB7cr95fn5SAbsHqJuMAYDc=
X-Gm-Gg: AYBFou3XjhFOnKXMNcCfR0NygyhHf6V/AgQYKiyK/bgM0JgSeKZ8SRdxrT6HXKFqvWh
	9SQC8co5YMHMq2W0Fe81N7JJCSbammC2f+hiDG7/13iJkAcjOcd100d6DGEFxg2Y4vl31IxZaIa
	iJ/XcO02bhbZxnQqrfVvTNrwClqvC5upU2Q2B22dyZcYqzCs4k5PPv9rEvvDer17d+zIwgPtSTp
	Aj15ILKzvC3QK8jrTXZt5D7QazLxVXPf7AJHU4Pqh3dYfZpN/e92wEyCf97c1REE8PwG0g+Ek9j
	ytOuXuuM/q5YG/X82eZKgUdK+NxKZmZI91c5QYX7qqSHCjvAoa5l9GUWEPob/6SKzNeRqHXOul/
	PGtiU3rpvigPA+P19HSOzGNzF88eTo5ENS2Ty
X-Received: by 2002:a17:90a:e184:b0:3a0:dec0:c0cd with SMTP id 98e67ed59e1d1-3a0dec0d419mr3306198a91.28.1790575878638;
        Sun, 27 Sep 2026 23:11:18 -0700 (PDT)
X-Received: by 2002:a17:90a:e184:b0:3a0:dec0:c0cd with SMTP id 98e67ed59e1d1-3a0dec0d419mr3306155a91.28.1790575878091;
        Sun, 27 Sep 2026 23:11:18 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm20040846a91.1.2026.09.27.23.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:11:17 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:39:22 +0530
Subject: [PATCH v26 10/10] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-arm-psci-system_reset2-vendor-reboots-v26-10-b24e2348e8e1@oss.qualcomm.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790575761; l=1558;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=4fTpCSkuJ6PFbWarr8sThQ/LuS8y6G1v4667LcR6KHQ=;
 b=AMvkpSWzxwQY0CuENEaT8ITCw/S6jnAL+oA3VU3+sR8bNDE0XnmTyr0/xXJtY9qk0oE8mfl7T
 unyxriQsCX6DQU4c60nqAj+Rn637XuMoZInvm/6h76J6yvlr0MHSgoE
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-GUID: M2ZzebDhQwrZ-4mT5fdHREEl6qRiUuqj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfXxbjCe8E+0nsK
 duy0kFSlTQHECJ6Lw+/LDfnxTGA5Pu0+H79KCWAGs49bchpMAoD2L7wUdu1n1aJwmyxlzOFdGYG
 EFSsV/SDJlAyZqerDrYmACjRQMYL9C2WUwPx+HsP3sVG11segHLeuIQD4VLdDlMLLHF2WBB/d3S
 ifLAiLGAqp9izDu+0haQ+4WQdf2ICG+UJG038/qdK02M9/balt9eSogoWsfJOpPP79XedHtDt/O
 JxedT1rc7Oo19b7/dndrAccVEat4rG7qS3erxz7l0957IRE3LhmDkeJOqTldvVSF8HZjQ9yab1j
 Qbe+7D/eSWoDiefIuIndKZ+vhCoYQ/LsvDepy8J9AHvecwsOtVqas6Z/Elb7UKL5IoHCLKVBuo8
 eFG4qbEcdYrXhQvPtj6XerdEE6FOsXC1+B/2BtleTJfAg/ZdGk3ufyCEcSOQzBwpCACVueMdYhQ
 S4mnn4+bheFPL4Pagzg==
X-Proofpoint-ORIG-GUID: M2ZzebDhQwrZ-4mT5fdHREEl6qRiUuqj
X-Authority-Analysis: v=2.4 cv=aIFlOr9m c=1 sm=1 tr=0 ts=6aba0507 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfXzzXPEkVwpNSo
 m3x8Yn7YxrZrcDp2YVFELJhLhz1cC/ZdywsBw9h0BfdR9T2eMC6YDg2txh5uXyArydvgPoDYyia
 6x+fCTFuQANSqoDcR9jvc8IOtae1GEA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280024

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
index 047b4efb04b9..48d3519f50ff 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -498,6 +498,13 @@ &pon_resin {
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
index 531cf41b94dc..a2197dec430a 100644
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

