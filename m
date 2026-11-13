Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545756;
	b=YsrS/9zmyGwdGls2SeO624P9CyoQP0YjLQQtTtn9aGvoUUj5kg4672FMGAEZxicMDYcw
	 Z6qT+I74Vt5PkKT4GPpVJx7gh9TrhNZDeC5AWs7uV0GtLCuCd0mFN2/wBIaaSCpwGPVXm
	 blkF4CsZeueyhAlN/Su8JBqqcPNAYkFThZpJ3z81vgEhVDKxiqJpDUNMUE7DbvDHgZfJm
	 b7kjsfVC90JmpntpDupWru77A3EwVr4YGnkifPDzmBIQKZ3R/KAudJ2ZXWefZWDLmJ4Cf
	 E3j9zh67Ei5DqW5+9QiCUVNLpO0TlDhqn/Ktx1WdCMJSpH/7uEK5B5INWg3VKy4Cx4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545756;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xVFG72PNJc05CviP7xNZo/AxabG5HdWiKbSPhL5aFtg=;
	b=xQxJgBVpK9iST/XV4MZthnH9sSiar4QDSXxtL5dupflU8Ca/kfxZhZ+7v71CbCfdRFIR
	 2RJZAbty4PY+xYSAFo9kcrnEjGavaHXrAqI+H9xvCm37N/1dvjXMYO01ybWxgJiXzhm7g
	 9xbX8fuzsBegBcRTgwOtzGMVIoG+u2q9ZBruDaEa4p1n9/DTESpfBYwZY8Nysw5fhB3/q
	 +QmXngcoRMBeyX3OICfACFqPV2mmDl/39FtErBFFVr1RcJyjWQAlzxqXHenXvcBPoMK+e
	 31a7RuVuprVX7vAFAycCLyVcX3eB0eFNX1q1Vu/cs/VHAstoMde00UAOF8tbj/qZcYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pg5NrZPO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZQKRdPTi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D038606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D038606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pg5NrZPO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZQKRdPTi
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K6nK3117143
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVFG72PNJc05CviP7xNZo/AxabG5HdWiKbSPhL5aFtg=; b=Pg5NrZPOBthbtwqS
	xB90pYx4t3dhHxty8ZW7kyN7wtCVBVOioiHBypjrLM1M/eWjCs8/nXeKOrU00y7P
	+PFT9PWaTXNcCal6itSc/um3EJ3fK7f+Fpp8mHamleuqEjc8cxJEPGWwyrrb7MIf
	6o9X+U0IYZMx5RXrUkW9GJv0Nm6tnKcmuFE94EK2Rt52KyRqmqJ7c6Gd4bNGr+5Q
	6O94jpwJszTrSjXkc1q+yNgPlD8wkbp6GCmWT6T8/fiTHBKcLW0uCD/J2mQhBFx7
	aO0IYgROJBrNWBm7Ey18cZd02ODmC5lP39iLGsYA08nxXaI43e+SyyyTAjKAgCWU
	NZgn1w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdhkhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:55:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so368873a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794545755; x=1795150555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVFG72PNJc05CviP7xNZo/AxabG5HdWiKbSPhL5aFtg=;
        b=ZQKRdPTisf3yF4+vRpx6QkqV/XFYeMwge0OjWthO0Vknba+xvnut+cr/JY0ERZLof1
         dOCVkHccAE29XiXG6x4UHRFpa/pzvzDkFkHDULvX62KDdyJJ6z+mSKqNgAHCCLEsJknp
         Ge5CvfpmJcig6asX+ML82ZnWQAaA5+BKpPUnIpMj2kRRU4DuoWjm7aPrnlYNL2ZIgy/C
         PI6B7s2Hu+oQOyBBU32+v93xff44qWWZM/8H6DmztHr9h9jIHuPJ+iuWx+tOeee71tDM
         2l3dATWipoCtl/Q4DUOaUKmkwQldwE46DGH+ktLVrA6ugi3v6v4QeYEK+E9A7Nln9y52
         /55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545755; x=1795150555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVFG72PNJc05CviP7xNZo/AxabG5HdWiKbSPhL5aFtg=;
        b=GP0NGsBkpg6UOcOanZanlctp3iLUGyPk0BenvfiVLp7hW+A6ZAVNKJDzFhTV+9QMrn
         K4SQIzhmTGpxU3kTWlxB409N/G5cQ7TEX8ODjJ+p4D+/pPJBct7CIoTeDPvO3GADwGb2
         rzWUqqDs6EWV89dyGLY2vcolFlbYRBsxgcIdiYbJwjZEJhmj1ka0THM5JrG3BbheW2in
         MO6l7y2YErEmua2z0WD/yf0eoAFZK1V17ReZUkIF/ULyU1C03x4dMfqnXosyzk6ANdv4
         /mOaAPvQ9mfeDX0mFIY8qmp6ERujVBViOzaqXO5QNyZn0yer++VZ2FcK5rnGs7ArvU5r
         UD4w==
X-Forwarded-Encrypted: i=1; AL+hErFUpkjWzKMRWBDyahGOr44An720EjOjaGSZ3wg8TcgGIBAkSgbmzMnjJrK6oj29a9JmDgbhwBv8exQ1Cms=@vger.kernel.org
X-Gm-Message-State: APuU4Z81uUwxs4AcVopOYSHYIIy1LR5qAItyvPJI0MIqIl9YXjFvwAz2
	JAbUQmGxUHRlcpJcOErD6fS3nQ0lLlc6C58DHS6546HpXjtsNGNz1r+c4fy7fnLRu9VyoodIbqK
	DW5J1Na5+LIGbxKzK0cX5mpBPi2LekkV1aUSekL9WG9xgduvJMZsLcTidE5Um/8YUJtc=
X-Gm-Gg: AYBFou2XOCPcW8CTGbNN+MhHNMi8xP8y8RSAhzzofAF3e6iAkLHTIh6qpMELZLAVUa+
	0ZHqLvAOOIALmRlKNhfo3xN2z5QRAPJM04nvx9rtOsnGJ46Jd4fb72WTw4tcoCU+2ZZd0YY/bw4
	n2M37WvoodF3PdLSKmCIX5ZrDmEgywBsdoJTUE4VY/CsY1Deq9zC09ZrQlm8yIsyUI/bf1wFO4B
	y+FmVjdgrLW3qKrKejk/BTahE8942vQnyzldFqkX2Le6eotqXbGNs4aAaChdWewtOSHPQTBAFXT
	+iipk+h060Yteb58h0gwWAIdxhdfAdCPNc4XJQZ3ISfGZyDN+ojEgLkBVzsfAT2kP44LwwoR8T6
	94/hVPzXFW0eYfWCs76bBWEO0hTA94TJ33aVr40Diodvf99m4RmWCfJB21/4gFdDglQNBn83Kqt
	b9
X-Received: by 2002:a17:90b:1650:b0:3b1:8396:ebf8 with SMTP id 98e67ed59e1d1-3b1b0a4fe2emr1091214a91.36.1794545754950;
        Thu, 12 Nov 2026 20:55:54 -0800 (PST)
X-Received: by 2002:a17:90b:1650:b0:3b1:8396:ebf8 with SMTP id 98e67ed59e1d1-3b1b0a4fe2emr1091192a91.36.1794545754499;
        Thu, 12 Nov 2026 20:55:54 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm7739875a91.10.2026.11.12.20.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:55:53 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:25:27 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: monaco-evk: Add suspend-only
 power collapse state
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
Message-Id: <20261113-s2idle_state-v2-3-ad604182e7e7@oss.qualcomm.com>
References: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
In-Reply-To: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794545733; l=1804;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=rmjlNp7nzxS52DoDEeFUOHUSdU6WMCg82sqCrOEZzak=;
 b=99iaGDZdsjb3GWnJn0sBCepEljAZvIMI4mra1BI3ze7MPtyBgN92lgx7tfmEL3USukl6zESNl
 vaejUR9FkQ7BdMKu8h44J8RpH4F6m1DxRsfFH8jZvgdVRcpHd87abPo
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX+AoXTyVu3wZj
 gft3wkHq5aKpvesW87Tyewev9GLqdTjIsHMHhtP5VystS8QDgtYnJXmIVBKQOPGCPFxcdJDtUI0
 N0XT1ttyy3riYKk2xNFOV0OqND+zlLw=
X-Proofpoint-ORIG-GUID: iklx-SIh6Mfi2NTfbslUFodkbWvHCIhi
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af6985b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=JkMn96IHD8b9Uh7FENwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX6BBZP9s1wfAi
 Fdlzp9KVTqd8NCE4qc6UEuHVHkVAlrw1AERe5t+Ml1kPVeLuL6lKFpnz5nEUhkRxSV/JUqEmFzV
 e2woN4KtUS1zi2Ap0zrDR0Efz5cIEmUeC+r1rMIzSmRTYWuMWU+0it5TzgZxNicVQBjodbGry/Z
 NQmSGfN589rOEqKSjHojpSitMwFHUpYnLCt0vGnej9O8nLdhRS7JjoiNT3BsdzZ02Jke6ePg6vV
 d7nXH27L/4I3W8y5TekkAY+21fIWnV8T3hY0alo/ZJk6SQuaUusMKmZMlbTxAXpAfeBORMwNuHW
 In7eflz4M03IhHmjB9ekxmhtqHpAJlM+OWm680ITXCsaVQFh95sMuv7tr3Y0SLir18bEBciO9S5
 CzasSjZBoKnAntYvDCZnKUJhy5ElNJv7b0tmD+WJK1ZPmV7fo/xBvDODdREJdotX7g8V1+epIzs
 q6d0cgr9zAYDJ+p4eSw==
X-Proofpoint-GUID: iklx-SIh6Mfi2NTfbslUFodkbWvHCIhi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019

To achieve SoC low power mode like chip rail power collapse (CxPC),
the Monaco EVK board with four PMICs requires coordinated power-down of
CPUSS and the Safety Island (SAIL) subsystem. This deepest system power
collapse state is reserved for system-wide suspend (s2idle).

Only the Monaco EVK with four PMICs supports this deepest state. The
Monaco AC EVK described by monaco-ac-evk.dts has two PMICs and does not
support powering down SAIL. Define the state in monaco-evk.dts instead
of the shared monaco.dtsi so it is only available on the supported
board.

Add the system_suspend domain idle state, mark it with system-state,
and reference it from the system power domain.

Acked-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 539c9c80a808..5e6206bcc97f 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -80,6 +80,19 @@ m2_e_uart_ep: endpoint@0 {
 		};
 	};
 
+	cpus {
+		domain-idle-states {
+			system_suspend: domain-suspend {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x4200c344>;
+				entry-latency-us = <706562>;
+				exit-latency-us = <706562>;
+				min-residency-us = <1414124>;
+				system-state;
+			};
+		};
+	};
+
 	dmic: audio-codec-0 {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -772,6 +785,10 @@ tpm@0 {
 	};
 };
 
+&system_pd {
+	domain-idle-states = <&system_sleep>, <&system_suspend>;
+};
+
 &tlmm {
 	pcie0_default_state: pcie0-default-state {
 		wake-pins {

-- 
2.43.0

