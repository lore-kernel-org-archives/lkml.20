Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559467;
	b=F9zYwXkyin1PgcszEYF155NiH+QsA3aq3Miijmpbf/ugRuKuSKV1N8JyIpw9UYmU8NcK
	 ckAM8KlZHazc97IydySzyfLfCtpHIADf4M7OkHvfXIXhFoWkHMEWL5Mz9AGjeQEuPAgZb
	 Wx8SZ2+5p/eNIQlEPmZRBb/49JOxPnTS5O+ZbgXtNbJaOAY959Vnhg9O+rTcKN/CZ86yI
	 RusdhfPyD7sFEsN4pvX9g99Ta+bV6Y9uiSieuEj+8Xxap2p2+EjG47v9EWnfsCdFIcMyT
	 IvHSGWmi3SwozS5bFbZvaPyEGwCIteus9Y2h0qCL3d89C9MoZx+wxlZBDONLRJHpZIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vCmlxpWNXorm8SdNGaH1ZfI8QxycbG+2/21/yQHnkxM=;
	b=DsqYCFZpwxqwMEWMEBpUaQC05g/mfG0Z7u4eaHQs8JVZ9wsXYBoasvLtguB4QX7CCnaB
	 MgWBeh4Hv9xTsAYcnnBdHZv7kOZt63dV5pXwVh9j74J8nLIQTAIRpczDK6AkonoZC7fRa
	 wExaFkhHbsEfwcvliWBgiTmoL00QfL/OAFr8P6Ha2DR5yYxCMT3WhqyihfRG+sd8KPWXJ
	 Q0XQXvxw+tcYkSTJ5t7cG/OMazeyXa+9j9OH5t1hFH03zzS4KoNHG0P88p5S942cq6dwP
	 FTRy29Kbduml4G6wQAWRWmtLbrdGpxwJspjO3AS5I5NZFvQuxaOSuG1dYxnF1xC08Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lu2EkAfO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MD/0eqTj";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FAD606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45FAD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lu2EkAfO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MD/0eqTj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V3CG3827003
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCmlxpWNXorm8SdNGaH1ZfI8QxycbG+2/21/yQHnkxM=; b=lu2EkAfOaTXC691p
	FGXwc07l9Q1Qpjm8XPZMLS5T15O3ogvsIM7DOdKXgir7eos/GS5KjncUeRIlZaO1
	FzFglnAYiWuEy9jAb8keYyZQLg1PLjDeNKzuzF6Akk+Wvmv+tOhNdJ9KUCRzLEyb
	fOdIw0AKNVZfDdyw9TRg6/EIXnFskSMNJKvjWvh9L9LxrEn/6CP092AGpVYvPYAV
	6SeSckd47ccAQcEP/jv8E6B66ZOmC5uc/wwMFcYcsXoeqbys1gLIKqhr7KnYvTFM
	TDOMroimQfSBfsqY7lWyxmPpiBvpJ6kqqQI4SqcxX/9g58Oek9mCYItQeh+aXrkG
	wwK/og==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37grrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so752267eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559465; x=1795164265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vCmlxpWNXorm8SdNGaH1ZfI8QxycbG+2/21/yQHnkxM=;
        b=MD/0eqTjaU7gcfBgjSSpnIdLmviZWnyOMmBx1mL67gpxm9mOFFWoM+x0R7TYGH9SYj
         t0NQR7sBmbYaqqjKB2ekC/o0mdYUJwDmBrT++q85VlTQWs4iIMVGAPQUHFT2/hHoJ/o1
         c1640otYwDQXdwC9Lsfinb8aHqdt60iCoJi1Oxw0coXaoarixFqBjaDAteBHrUJCaY/7
         0DHsc9A0nC/FQjsCxOi4A0s/y2d+utQC47I4YQfHgqWdha37n+44Ki86ogGlBrx2xUhT
         XTJCd5ZaeEbwLv4D03/dSH/3fF+sEPQg7rXMVtAYB+YtDwDy4OUdeEjpcp9W+34xpJg2
         qKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559465; x=1795164265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCmlxpWNXorm8SdNGaH1ZfI8QxycbG+2/21/yQHnkxM=;
        b=RntYAc/HOMIzylJDaUQ/9ulo6EgqWwHy4eFnV6m8ichVyqjq4J6ciUUO4yqi1UdQRt
         VljGuismhI/ii9alLKsoq686rkLgF1+q53hllKPuRgWs579H8LTsU7x24PtbaK1Ao5M2
         A2vhXjPMCekhU2YBX8yL3zEi6jkHqbsv97u0A4qxg26FkJ8QeVRVk0DtCWN++5FmMu2u
         DJ6Ywkp3E45PnDAe8onMoJF4/2TYf2wYZyzTq3btugWs0B5Wi2Y39OwJEx1KPJJdzlug
         BGSIpC1d4ipu31jZmdU6+rNbgte3htTlZ1+hrbYtvF8yj9NKBDvq8GJqohhcXr3KGaje
         vTqQ==
X-Forwarded-Encrypted: i=1; AL+hErF1MfDZ0pfC5IQjsL5w1WB5211zuG5eqvaLrB815WE+7AZnCzwVlHKAfgFcJzL1f3/qAa6z+sp4LkpiSrc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/3L7tJWAOCVeRODIhKV5RM/IcO/2pp9epyaRgilWB8G3IilRE
	N5Kue4j7t5BextXQvYQLtSJqNEf+y3wOOl+aewlF6Cy4s+ydgxSoxzp+IkQ5G2Inc41IiV+njgP
	ypU22shOH/t5UTRbjRgkdRf9cI0bbHhFI/BiEU56ltGqAoniQzD19+oGwHJ5RXN2kVkg=
X-Gm-Gg: AYBFou2h8KN7Y/qJgL+q+HM5YTJRhiqygMmZZtE5/FvStcaXLSh5jIJBlXeU6k7S9Md
	gl2tWSXWBDnGotOX9MgVCex0YnvSSeGKXQq+XmvVvE0z9hORf7BcLSKKpz/8tFQqyaJTL3D7Wr+
	xeubaq75E+DFttoB4wcrEruGyonr21xiWdcYTkS9BYPvvQfGtAyuPioaJFTI1ASVK4eUbzQqX8l
	Aufl8iU6DQTB8cSV6wQUdmHDtFpv+HRGm7LxA2VEYUuyfewG5RoGD4t0k11/aGGfjgEFo+uLIm/
	RpI+bB4C8w8JNrWsnexAGk+Zzf7TPsKsJoY1Nx/OOrbhX6xgV5rI2HLpRCdog/UNOe/62vrq02U
	LJenoNK+1T6lIkFioEp/Ybd7PUlp1+0s9Jwwrx2k5W03xxjbW9krXnHjO+Zg//nnThuAny7bw2H
	8eQGw=
X-Received: by 2002:a05:7301:782:b0:376:bb3d:5af4 with SMTP id 5a478bee46e88-37965f9ca89mr1500753eec.10.1794559465009;
        Fri, 13 Nov 2026 00:44:25 -0800 (PST)
X-Received: by 2002:a05:7301:782:b0:376:bb3d:5af4 with SMTP id 5a478bee46e88-37965f9ca89mr1500719eec.10.1794559464398;
        Fri, 13 Nov 2026 00:44:24 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm9662357eec.20.2026.11.13.00.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:44:24 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:13:44 +0530
Subject: [PATCH v3 1/6] dt-bindings: thermal: thermal-zones: add
 hardware-binning trip properties
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
Message-Id: <20261113-thermal_bin-v3-1-878df6eef8bc@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
In-Reply-To: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559450; l=4816;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=lX4dJOooS+S1R79QALYmm0VfcAfISX3ohk8vnGBZQ64=;
 b=4LlJ6prFqGAHDuJ2zWVdrAwMBPgyUzaVitP1CjHO+p4Fr2qDwS3C3u3UrbgErcUcPI6AppLzI
 z7BdLbUpck1CrwnNWJVG1gPsrFRYgJ1WXcpvc+pD/SDjW7+eTm0YvSs
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX1gvpahWs8VXV
 wdmlstm1WN1sp6QOCl6UVrC6isPCkLhXCwYaJdNap872QnMgacSF6W/4fVSOpjEvarjMk5sFLhQ
 7l9yznxv0cX4oAxNbQup+erdBK0n0No=
X-Proofpoint-ORIG-GUID: 9gmuYwkt-jl51K6hftu_w1Qd-zM1zWEB
X-Proofpoint-GUID: 9gmuYwkt-jl51K6hftu_w1Qd-zM1zWEB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX3ustHVMgm0gB
 pXF+50PHW8SFyf26OQSY1qANqCxRl41WXyrEQK9zSpY/9TYFsM9/8Rqxkm7/BYekXxqPYeHw6yT
 Q/8b/olP16EYrpy73UxfLoGP+vAdI0SmrJZtgjNDIs/bc45VyHoeenUPAswMwH2A8/T95Z9YJNe
 /pBABYYB1gMN3M/z/fBQhRz4uVdySLBH2982uQF/ZLn13lXY+MkKgNut7mB4gBlBCo4pDJydPAk
 9LuT2mq3uLvNftcWzk9u9tCn6h9tWh2lezwZ9gZV+0XQ9Ym5qIXCU6hwdY32UUtETXYgVoDhwxL
 tfVSDl1dARDcOLPbD5G6YTXtm8Y28d3aqWtnu/jbK+5FyIjRNSxxMFNHDCWDX55G8Q6pT9BmA5W
 sX9zM7CfTS17qoGnSN7cLvhixeyjGJGJVBDx51asqwhVQN1TXcPbVeUP1pnhROK4SvSc9s3cf/t
 tQ5cVOul+svf8Y4FWDQ==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6cdea cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=j3Ouay22MIlEJhTpI7oA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130034

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

Differences in SoC packaging can be used to provide multiple SoC SKUs at
different thermal and performance characteristics. The underlying SoC
remains the same except for how much heat the packaging can dissipate,
thereby influencing the critical trip point at which an SoC SKU needs to
be throttled. This SKU-specific data is typically burned into fuses
during manufacturing and can be read back at runtime.

Add two optional trip-point properties to describe this:

  - 'temperature-bin': an array of per-bin trip temperatures, used
    instead of 'temperature' when the trip depends on the hardware
    revision encoded in fuses.

  - 'thermal-hw-bin': one or more bitmask groups describing the hardware
    revisions for which a trip point is valid, modeled on the
    'opp-supported-hw' property of the OPP framework.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 .../devicetree/bindings/thermal/thermal-zones.yaml | 60 +++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 999ad40a20d5..cb9a8c96d053 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -152,6 +152,58 @@ patternProperties:
                 situation where the trip gets constantly triggered soon after
                 cooling action is removed.
 
+            temperature-bin:
+              $ref: /schemas/types.yaml#/definitions/int32-array
+              items:
+                minimum: -273000
+                maximum: 200000
+              description: |
+                An array of integers expressing trip temperatures in
+                millicelsius, one entry per hardware bin sub-group defined
+                in the thermal-hw-bin property.  Each value is the trip
+                temperature for the corresponding hardware bin.
+
+                Use this property instead of 'temperature' when the trip
+                temperature depends on the SoC hardware revision as encoded
+                in fuse values.  The platform driver reads the fuse and
+                registers the hardware-version bitfields with the thermal
+                zone; the framework then selects the matching entry.
+
+                Exactly one of 'temperature' or 'temperature-bin' must be
+                present in each trip node.
+
+            thermal-hw-bin:
+              $ref: /schemas/types.yaml#/definitions/uint32-matrix
+              minItems: 1
+              maxItems: 32
+              description: |
+                Optional bitmask(s) describing the hardware revisions for
+                which this trip point is valid.
+
+                Uses the same format and semantics as the opp-supported-hw
+                property in the OPP framework.  The platform thermal driver
+                provides N 32-bit values describing the hardware it is
+                running on, in a platform-specific format.
+                Each trip node may provide one or more groups of N 32-bit
+                mask values.
+
+                The total number of 32-bit cells must be a multiple of N.
+                Each contiguous group of N cells forms a sub-group.  A
+                sub-group matches if, for all i in [0 .. N-1], the bitwise
+                AND of the i-th mask and the i-th platform hardware value
+                is non-zero.  The trip point is enabled if any sub-group
+                matches.  If multiple sub-groups match, the first matching
+                sub-group selects the corresponding temperature-bin entry.
+
+                When used together with 'temperature-bin', the number of
+                sub-groups must equal the number of entries in
+                'temperature-bin'.
+
+                If absent, the trip point is valid for all hardware.
+              items:
+                minItems: 1
+                maxItems: 4
+
             type:
               $ref: /schemas/types.yaml#/definitions/string
               enum:
@@ -179,8 +231,14 @@ patternProperties:
                 The active trip type can be used to control other HW to
                 help in cooling e.g. fans can be sped up or slowed down
 
+          oneOf:
+            - required:
+                - temperature
+            - required:
+                - temperature-bin
+          dependentRequired:
+            temperature-bin: [thermal-hw-bin]
           required:
-            - temperature
             - hysteresis
             - type
 

-- 
2.34.1

