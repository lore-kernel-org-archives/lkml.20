Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7644B486B8A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450901; cv=none; b=I3P49MycvfjJKPeAnb+HbptX4qGnq7uKg9hBx2LuA0zisP0EHtB7a/PZ+ms0HhYMyY35/STU3ReejdqFDTs3w9Yy8EiPFvq6pvhIENyQf8Gl0FFnqbcemmQVSJeqk3CQd1OiemRlqLhC54SOne8Y4X6W6ZymOwHt967+XVvLYOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450901; c=relaxed/simple;
	bh=EZNzhw66TQKS3/ys7hB9X72wHLID8eW7VocBG9jNpBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jK2GJ1MzFmQfrmfSzPUjS/tTLb88T3AvJA9Vp428Rs3FrJRjWFpHZRMfiDLBo0TBdMnKx+axSoo5QSQxd9NUpze4WdYILb1MipiatPGlzXjs+nShnCIEmpBF61AAUPfiHLSm1ecT+otJtXaUBHqO3gKhcveYJjzfGm9/Z6Uc8XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bofeOqO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWmbjucm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bofeOqO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWmbjucm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KeII2686733
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vWw27EvAoHyMo7PLPdhTJ3G2tiw8E/kIhA2dZUt1o8A=; b=bofeOqO/hGNSL97e
	JqgYiJlN17/Njy/+PMtAgZdQYqIHphi9QcZp0kqSn+jYSAjKTaeGPB+puvD+U8l5
	R0NZHMGGPvXZuSwKCsjURFyshgPd9HMfZdwx1Qtq60RYmrhGPLCgJDwTjJOt9HNo
	qu7XDeNbLOiLEjrzHAeWIrwOinEBLdcEr8w2XptewjPxtTuayCr9tJD4Wsw0hAp2
	Su6y1PWzqhDIWNY3u1UDZ8sNXK21d3/YD3f9dUJXvgYmiSpESjM4YmKvPIAlhBEc
	H4YLPFhb/fVoR0qNshmOqB2q0ZlpSBL4iyLLbAfE7B2KJJA6IJUscaZ2mdMsS8ph
	KO/aKQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe424nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:14:54 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1665200f4c2so612508c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450893; x=1792055693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWw27EvAoHyMo7PLPdhTJ3G2tiw8E/kIhA2dZUt1o8A=;
        b=SWmbjucmgPSidkA0dXn8RP+MyJDr81ZaoLvAKIYX0GLwj32hqslDuEYHPHdoQdVRxG
         SzvQxLeCbC4LwmZAJsU3r6C7T7rfkNm1WdkNHm34eBYLmnkEmZCy7r74EUQS9XDaIUqA
         vqrjEFtCCyQgr3cw+XzQzFtFcccSfyXj4ea+qmv0hNtL93oXfLHynYFpyLMilpsjKXRX
         56TgyihrHgE8tDjCtXahjWzWWqhutpzsXcrxlfITk5Y4H/kxWov/psqWPcME7Oz7eHA3
         QWI8zZ06aZ4kz30w/12znJgOZ6JlfrkWyRyreLfFrs3Of25+INhGTSWEt5ExN41lsQyM
         q7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450893; x=1792055693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWw27EvAoHyMo7PLPdhTJ3G2tiw8E/kIhA2dZUt1o8A=;
        b=PPc7Vhxa4qRcwyzZ2mlO13GimlQvC42lrpDfvcmQCp3ID1AVrHLQ3hjcj6NXsfSS+J
         DsNPg/+R5U1pwMWhqmyndMkqZHN9wbgDkfRGSJ8u6+oaa61m3Aj6V2FdX3tB27c20RUI
         4RYrxPpje2nH/D+/BhPiv0jzooMRVu0YuRYfOtDGy1NYBZ5c7W69MDMD6VmuxLTsCY6d
         rmrKO19n6jpESY8FKR0Wzr8veYSWEyncE+SkT9vbcS0unxzp6uSWNtxvLItGd2x0KUKi
         GW7la2QMwxm0tdpftZ4Bjh0IlHOmJHBFzVo/IVMWGF5yYwhe6U0cZHse1ZRgvvIRC4Pd
         Cp7A==
X-Forwarded-Encrypted: i=1; AKwUvBxPIXhqfJh5CdY3Rk71GeEMO9aVxKpwdHyX9ALumJ/WVRUPDYdvlDqWqo2vQL3GU9EEnBRyo2zIVwu67Po=@vger.kernel.org
X-Gm-Message-State: AFuF++kuEPLdK4qJTsT2BY74Bpivri7PjUULu4Yvwb+uzdHqP2HgF3S/
	OV/9M27FfVD2+ZJj1ZZJLIMitPEJoaFpAuKPOUML/QxyTHmTrW7tqm0lv5Rn8BfWn6qeApUZSG4
	QVt4GuC9SGwb8SDGylsiutD9wnwSm0s869oXm8/K/hbyG/wgYRkdMd8Q1GhMDXBKSrpU=
X-Gm-Gg: AYBFou3xxATH91yvHbzfx5ArrCGWVwuVFZ6sFcLiZJRRWq3PsBJ0c7r5TP27PYwPiMK
	WjVOdBp4+zrt7/q71IjtKr+X2+hEyHqWRXvowBPFCB7Z5gEcanI5IGkfjuv73IIzBQ2RZRfvleZ
	LkzQnSp2HiB+Y97nqs53/A7YKgvCsUdZVu29Y21DgJZF6kJ8+m18WScaQuQueThmFG63NTrHgg5
	C1WQ8P3q8MifRCWturDXCzHUw9KUszPDM7OBThqZ3aSK9J2A7hYNcdUg8DLlNop0Ya+dkz1Fnpg
	OgH8Ay7/g+YM4DiTWZK6R3fnigBDKa9c1Ubo27FMnKXPbu0GarbxMLvAQjo/d2T+matYZi8XQRZ
	cCqjbcVzkBELqZegavNdjBP1AZGQlIqyxbnHPY5m4jW0XGYZfzpusNqmeojPFCOgswDn/mWVXYi
	w+26DFhvBVDa4WOMU889sZC3SrY1Qq
X-Received: by 2002:a05:701b:21ce:b0:144:c123:4036 with SMTP id a92af1059eb24-162074d60e3mr5046908c88.35.1791450892852;
        Thu, 08 Oct 2026 02:14:52 -0700 (PDT)
X-Received: by 2002:a05:701b:21ce:b0:144:c123:4036 with SMTP id a92af1059eb24-162074d60e3mr5046882c88.35.1791450892236;
        Thu, 08 Oct 2026 02:14:52 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:51 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:25 +0530
Subject: [PATCH v6 05/11] arm64: dts: qcom: ipq5210: Add C3 CPU idle state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-5-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: s3ipZXnmtnFpSqJ-9o73yvB0fZfyK4Ah
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac75f0e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LX2C00z4I0v6K8_64uwA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfXypgtL95g/OFj
 oX+3nchGEHmxPw2+NhKpxJxdmA1cTt0oV6HSJ5Lh+pz2KLK6sAcEQ41A0two9lPEQGVp50+Jn5M
 kYneuJjCTYIgIFlg+5jLqwMbBKrVrnY=
X-Proofpoint-ORIG-GUID: s3ipZXnmtnFpSqJ-9o73yvB0fZfyK4Ah
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX8tGjen6o47Up
 05zq8q42hG2uELdqeONPAkz0l72Ds03X6+01xVaRRE5xr9o2LtTLsNAxmvMNAToxCFo27RxQpvZ
 JxM3N2PIxk1fHftBnor8e3hi9lo40PlqeUuNMHqw14J/I8pbhlRQ36+Vz/R3AoczymBnbrFDs9f
 wB2tTDbW73ZDNLcl9VOcKHamS1B4YYODaeFxd0jmjbn8heVRJ6VfSODBghJBqCTYpSRF2AJUWJn
 MI5tw16QTOZ7rdVtZeHEhWxuB87EeDiExszpQfVYXWt8/vCmOS/pKTU7MATMZCrJ/vXlcnSYbj7
 tIx/2bxW0H60eWoimw4wss/slSGRQUMa4+uNObtfLIp8aQN8ziEiEgbdLXg5a+JpSqRCibU/Xxi
 l1jrUmJD3Qu6N5EAzB1WVRL4cvbJCHCK7svO/y+8vdaGcQQ0wbegrw24cetv8F7kCWApohyW+uQ
 dd8P06RWnoS0IbWowdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add the PSCI-backed C3 idle state for the Cortex-A53 CPUs and wire it to
all CPU nodes.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 3183182d1cc7..331589a9c1ff 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -36,6 +36,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -47,6 +48,7 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -58,6 +60,7 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -69,6 +72,7 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -80,6 +84,20 @@ l2_0: l2-cache {
 			cache-level = <2>;
 			cache-unified;
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep_0: cpu-sleep-c3 { /* C3 */
+				compatible = "arm,idle-state";
+				idle-state-name = "power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <181>;
+				exit-latency-us = <149>;
+				min-residency-us = <703>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {

-- 
2.34.1

