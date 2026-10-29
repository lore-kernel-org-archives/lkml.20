Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264559;
	b=IwszIgUKYS+lrWYDaRlC5q0mQqb9oLBRIHlZR4kR2hTH5GqI6j6/qx13R9Q/ZTYkTpYh
	 EKj/ix7pE08kHfzEGJDvfHqXAwrWIeHNuVHfjGVItCMhI5OSAzp72EVcIxH8CS/bsrv+Y
	 hHD1H5VL1h3jGakc6aXaOQ4GjTrPvs3SM7FiADN9H6Im3nkY6e4DlE8HZJZz1meM0Y4Go
	 OhRbtL+Q+S6gyISVAzHOVy14JzD51IFkI9GxogbEYx/SeP6uTxjfuC0Aj/yr7m2VCnnGu
	 FPoB2WzrpYmQStWfITGAg/otn+o0HnrwGvBQNO1e8oY/uxsiUSWGM+QZUAzkjE9HzAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264559;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=;
	b=br4+P+WZtc+0YjDD+l8qg6KB72z3ifV2HpqJboh1pH0iQBIlg0HQr8Ruwvk/0P44oB3Y
	 F3Oc0kAUgdZtUi5KRhp2LZSjO5JTeOJ20W5aE+2Fh+gd9qpGmvNUz0TdyqCFSpdgk5I4f
	 dIH+whw4IHTR5FaF3RwH6KCBpK04M6Lfw/HpcU630MmxTE0ybKIfGkEzT9KMjWW3CjQAD
	 Fxq+mZ6/9OpZ8KUVafilQYPQG7r15rmKoisEeYOlK9hcEZJfNbPhdqvETvHQEZc5+UGDj
	 Rdiz7lfV0ZuLYk25yu79RhhtGCuIv5pyU6kS84Rw4XS8et4A1HhXuo5/MVsC4POkBEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NKqGF1Vv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ic7hLohu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7BA60A380A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F7BA60A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NKqGF1Vv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ic7hLohu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vDiQ120016
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=; b=NKqGF1VvtwIDpwwr
	inzRuKWlzCHrLd3cZGadTm7aUbKkNOGuRoldTpmGOi7tTNYVDgUzDiXw5sSEv6ou
	RqJiH86IVenMFITE6Igdbzdgx4bZA2VSxNvgkfgm3xIt1f0IgKOVmZr53X8WI+4i
	zyVhx/RLgBhy8BL1zgiVPdpkuhAhYY29GMpWfmBZ9+vP+Dj06wg8FLlZ4MoumLBF
	XpVpWBzDJHSV/Zw2Dfo4GdYXouNxrTnlygj4YY4OETu7sh+lRlxsN0Cz5xhWWfKj
	JXmFhftlshy7o0dGiUODO3ycB32Qzj101OVfBAZ7XokoynyrQ4qkE8i7lyrqdmtL
	mHRQkg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmp9uck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:02:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd6532dbd7bso1216333a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264556; x=1793869356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=;
        b=ic7hLohu00gy4YEutOZjDefzc+eP37xTvgZCA+HRnRJ0l1boTcPZ49wCed863Ci3pq
         htuqpDS1n435NX3W3bfvuwJwtE8mB0XEoOgNRXsOx1FXe7dyilcNS7bQHo37IMAnGlx4
         ZRFuli5Xy4GiyUYbOQdD11T0cNNDe/7cxMeSZAFtNHjo/EPAFVTAymPeJe/70mYzru+s
         vhIkqRy+ex/nZLPJKUokqLjhLPYFKoyT5EV+Mif5AVdSg3/8z67eq/K6QynDbyrFgW42
         bsEcvrUGDTvsNBPKH06sMRKO94JuxsSJKuJnolqPCpdlY/Ptz1dpsTjwnhWlrGcCww5p
         JqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264556; x=1793869356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=;
        b=LUUx43X2VlogDzQEFVLBF71HpQqc6NH1svFxYegVbf+t7+6FWh50vdF+vx8TIY7wRM
         X2eSGihVcPkziAsu3e0tT1Q8ZjngA3SdJQ47NWCGMzT8iQNn/Jk2YL+QL4zBHtOE1swI
         pJ/s5bGhVGPhCiTDqAvdiDlHEYVR4U1r5ci/NE0OmYP+ZkG3CXjh7ZTJywO7U09FiMxQ
         EJEhTG0DiWkpADK159AVI7BTQ5i7j6i/rX5+WRM7Bw5Hl361CtSsF70hkfk+GIFOVtoE
         dyjOrgm3O5nZd73FbJn8zJ1RU5s+FTJGyASWqgzMyqC4jjJgfRc8mR2fJmtNh2Fd4MmU
         xq0g==
X-Forwarded-Encrypted: i=1; AKwUvBxL3ptjeO0xWjhynyys7ITmENgBvvO9BSgNgqPZg1l7h/xWWsdaHDrCKfWiIcCeCovjZ/lpasWSH/qxYjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4MnfP7flfc+ETqIY1mhvuohbAJ+C9ZaCvjjfrZ5mlH7IAIWDw
	1iuOtu6pnDLouHAWT+jp2gTW0pBSXf3fAM0Vic6Ce9Zo62S0/zmnF3wRi4BfTtPmfjyxrn7tamO
	p5zf8uS3AK7zpn87HNPKOlUJGUa9b3uGUJ5WOKTPGQGagPjoUKfDzONAgXNrl/SMtmTc=
X-Gm-Gg: AYBFou3ThZMiMMD87BxH2u38j/pOyA/wy1n3BqzK1I+O9iYWE4wHfUMsQvj8QKs6mr0
	ulHeJAreRTYmV9l/4I9vmQtVyPvRL0VFoNNJRJeCjlWRFpscPlQKhP2Qj8oq09SHUsJJZj01ZFV
	YB81eg4QcHQMLxWmNju8QbXVViA9Jn2W0fA5iSxpGKbZhDIeFMu0y1VKdNxVZQW+ram47HL/aAj
	RzdO+5cLYoTDahCvOLhLwnrgvjnpn/sJAok4ZRHwBGWveMygYjakoYCYJvpM5QfQyrLTkgSfQdU
	sHROGFS618GHz5zNKvspRmDUy/9pk3EizTNPYvU0EL56+BPNpLbYY+eP7V1Dh5C94SAKI9HUndj
	Zzo1To9cNKFXIoJ0M75Bu1xqWiaWYcNhKNrBkcpktdeTRHe5e83bs1BUY7G9K+BpP8LNEpCRQNY
	rn2I/PfFm0
X-Received: by 2002:a17:90b:574b:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae580a82f3mr3667001a91.10.1793264556409;
        Thu, 29 Oct 2026 02:02:36 -0700 (PDT)
X-Received: by 2002:a17:90b:574b:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae580a82f3mr3666958a91.10.1793264555885;
        Thu, 29 Oct 2026 02:02:35 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:35 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:31:02 +0530
Subject: [PATCH v27 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
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
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-8-fa4b3ff1359b@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264459; l=2178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=gUHmNfAuWSYEWCrqca1lth83sZOdzcZT7fFtab0nqZg=;
 b=tZ6kTFHVewvVVG6bopBgc2U27Y/TWood54vwPyEmvAH/mC5OZWsNPa1HWUamZvs/3iiJ8lujn
 d84JnSP8NaKAUic89Xwjwa9PH4byCgb0SIYM6OYeBNad6fJoaTHUdow
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX0gDgca0wDlxD
 WgT0a+e9rQIWj6R2Qqtoj1qB0xOJiTD7wVQw61QYdD/UaHxmzvsmncOZ96kVNyee5E59P1k9Kc+
 L8nuvV3MaJnE3kZchaa6CU2btyl20hPBYQaaMW8p6MxFDw/+eCNrqQneD+MiXZL2NmjM5MhaY4K
 mpDzeG0K20RC1Cx+PRTmlKFRT3c9xEDK3ZbM2lmlSMle9AtrVM0PFqaVg0O7XqZAJS+Bvt3jpX5
 BHt87i86PiU5i8amSu99EuvoR6Yrvwd0956YK5jQgm1d2yNy2QwGt1oIwHn6LviLdNZS2kRrvDt
 EW7e8yKXv4pJin3InSZg1V8hl8XvZCOucNm/WI3i6yOd8nX2WnBmKvJOv9B0sllZVA8+OiocKxn
 XJnaUYF1OKCK3AWVB06NaLtOTojyvydArvchQtS7OrACl7YUHugS90NVlHZCQEG5zGzQdPyFUem
 sK5xO/uykRAxYDnfxPQ==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae30bad cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX4NSbREM3ACni
 ZUeywntdKzoxGtaKNe8dPULEFofz7xfTlS5NMof76PZwNob+Xi6gDOddDdj1209t+H28UlGRTnV
 2AZGkogjVRqoIZznOhsOJ+LsD9OdTNs=
X-Proofpoint-GUID: o8YDHwXEaHclzWHj4cmtUmOtkunr5M50
X-Proofpoint-ORIG-GUID: o8YDHwXEaHclzWHj4cmtUmOtkunr5M50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 23cf20f9a178..4d5fa2ee1f88 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -912,6 +912,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 22f764b8d721..a530a363a9bf 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..6564eec6bbed 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -550,7 +550,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

