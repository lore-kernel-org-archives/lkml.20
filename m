Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792915462;
	b=WM+OvpRenGIFYNJGB3MIglT59pBxfZEFCWg3x4hf2N4nEIEIQqJ7tUog2RNVFwkwOkRd
	 v0X3YQ0p5LhQ2U8MIPuaHC88bhDMedqk9XtGI45RFzLZJnUbVcPqBKMcfJo/Ne9azJOBa
	 XSYHeWIyj4laCjHYNCg/SdeJ7RznviszmeB9K1k0vJjtWzQw2I7e5PAmsnHztTewanGny
	 LmnesJkSrFb65lKNBWaMALB9390p0xI4om1h5plF8VSFl872zp9G/bKS/7lwLZ+rnkZD+
	 rJlBh7TApLQ/FkT80V0B4uZ2a0g5MPvKbnIJ4dDRlS5r7OE5wa7OUDwF0LFcsaedTPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792915462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J2GYP2bcjwkDFqHNWYeEbSfUF0yw4ds3/hBpHNxwQcQ=;
	b=uJdfJgLQbhEDTBAf8WVGjIgxta9DadyXBYv+mmV9aek/aJUSAT2q6+lQsSA9kULmxLG9
	 ruV/HW02OOj9QAkTJbleGR2AUa1sdfFneEj4scQ0alnCN/mdt81X0EJHO5pEx3VtDnxda
	 v7PiNDaMwKhKO2aOMCvnU4JyC6MQL+oNY4p9SZzTPFX1iV/e8VGIOYO435SduhdyPGSuA
	 4IlYKOEpglH2J3a+dsJWqoGSrJO4W0tNQNcGwRxislhWiDKBC41PwSOCwZWnRq44c6332
	 XxkY43XgInfN1LR25FGlpwLMT3nrVKxVcxqvfZGulTU8cRPjr5LL0Cjbn0HREVL0ygg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJsNFwIv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=er3Yn1AW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F37606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F37606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJsNFwIv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=er3Yn1AW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P4t1Qf2041674
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J2GYP2bcjwkDFqHNWYeEbS
	fUF0yw4ds3/hBpHNxwQcQ=; b=NJsNFwIvZCC8q+/4u7GRZPZeidXn80wkq0fbT8
	vK+JuOVTc0huhKggjOtFPlRikAOA+lERIHnC8gPLVhUzFETvh0WUeSl8ni7QbORi
	0zbWEZB/52H2hxKd+GSoAdFOtASj9WvgAfMUA1PIXzMD8lA4NkZhAOh+ZIRmd9vM
	ihtJF8vvD8d8uDkQI12rMOm/ZAe37PY4BNvoTlglsL1cAmlCr49kaNSU+sqaN2rd
	HcUstI7vkGhEVWS7Hqj6lURi8rp7ufdn3SahPYe2FF2zGvKSPovlp6g9/nF5Jcun
	khE+T6KobsV6ISna1YjdNmU7K4Ou+0hp7DfT1Q3YnBAf8V4Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnukaj4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:04:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso4293847eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792915460; x=1793520260; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J2GYP2bcjwkDFqHNWYeEbSfUF0yw4ds3/hBpHNxwQcQ=;
        b=er3Yn1AWOEJkllMHTH8RtyBdoBMXV0Bl8rlD7te9zLkFY7MvtDg18Lrc53z7OY3ZQp
         3Ol+lpsNtZ4Ne0DcBNolXThRNyxrqgqNMP2Qy4/NOIwIgWmKX7tyULhB7mWRI0wXJ6rA
         y0SUDUC5Y6Xm3T/7/xF5mAWejbKTYqGwMir81NhvS+aKuiMEPRMeCiN3oKu42X47gDH5
         dGligSvArBdzo2eTqCtiZ2RxyZCAdcVQCuB2fKSMlMSq7igBUCpUPXHm13+G5gufNlVL
         1KsnzEeHg/4G8iWwbh4lkFzkUKVgZ/ClUQhR/nTKiL53qJEOt74FA205wYakR4kvhS07
         DDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792915460; x=1793520260;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J2GYP2bcjwkDFqHNWYeEbSfUF0yw4ds3/hBpHNxwQcQ=;
        b=mZM40q4sdh693gi4Kfcc2tEorXXg+MzAXS92529QICIqBmf4xU07iHS5W8kPaMB7wj
         QrUlrmooabTNvFpejEXG5fALCC7xCf5gC8dN1qrUJyeCfh4zwnA8bdgUQuurgV4hbOYQ
         hoF6VhKf6IsjdMlL63QAX9YqGjB+N9lQhXFGMw+nybnQ8xpc15xRK5EPI3ClHm3N6THB
         JxCivLURUkTz5hQZABW6BzuCF7e8ZHeEiQZSnackX7h2QyXflvzcxZgOhDfbbdrt5Lrw
         pkpy0A594o7QnokQnRaCg3S76Sn6408BsscFYwnK/P6mnHi+OodRwMi05k4Lpn0vVxwK
         jC0g==
X-Forwarded-Encrypted: i=1; AKwUvBxR51PgxMSQBTJBlnpI1XDq4D08TBwybAYqWE5ylhZ7tBg8IhUmOOYnja1C3gw1ew6Qzy23IoXqXnfCdbA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+aVpghGALmut/LQvM2ZXBWyN8+FUO0Lmk3/szsET5e4ibT3qc
	Irjq/qF2ecpiThovQOCIB7EKSrij1v5nyzcVsaZftGs1ugHtob5tWwaIDMIeWb62WDD3EDWleQW
	+54x8BQrlYY2mc0j0K5MsiqMjz4xm565anDfHZ7MehwVEvvSCYOLjHJZVXsRhgygTOZI=
X-Gm-Gg: AYBFou32NTmvAYfQbehnoplQTMPfhPQ4mVoK6Kz9WJvAMsyCY+saneUqMVRFVQDFjkk
	4+YRzZf2OLljdryLrY512DIBb4zMW+HJRhEp3/gQMkkhOc1NVeumiIq5auXokGoZhgtf35oUwt1
	rBmfv6bUp9xso9yorsLcjEIUnXTKFVfzQfi6NYBYi92XtGFsHsQPS8qPhltE/jqlRwU1vU7zsL5
	U2PdqJZl5K5/rlWLveDkQfoTMqIndj1wQK11nQzogBcq0sQZRx5HTG0XaN7oY4kcdCUgr7LPPGf
	2kxrTkmajSvr4ZpbMPU9iGvY8mO9h+XnmuZSQlPUgAxyG4b+FV9Oj6szdQFG7+nlYFyMCkyGH4b
	sOnibSsPtrBsZ+Q/llV8g0b0xh/9s
X-Received: by 2002:a05:7022:51e:b0:14e:d0ba:75af with SMTP id a92af1059eb24-1994d8b728amr7883419c88.6.1792915460148;
        Sun, 25 Oct 2026 01:04:20 -0700 (PDT)
X-Received: by 2002:a05:7022:51e:b0:14e:d0ba:75af with SMTP id a92af1059eb24-1994d8b728amr7883373c88.6.1792915459531;
        Sun, 25 Oct 2026 01:04:19 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm16147303c88.11.2026.10.25.01.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 01:04:19 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sun, 25 Oct 2026 13:33:05 +0530
Subject: [PATCH v2] arm64: dts: qcom: shikra: Raise CPU critical trips
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
Message-Id: <20261025-shikra_crit_trip-v2-1-79e429cb9350@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALi33WoC/32NUQ6CMBBEr0L22xJaCQW/vIchpK1FNgrFXSQa0
 rtbOYA/k7xJ5s0G7Ak9wynbgPyKjGFKoA4ZuMFMNy/wmhhUoaqiUaXgAe9kOke4dAvhLLSR0lp
 bVVZLSLOZfI/vXXlpEw/IS6DP/rDKX/tHtkohhT4Wrqx70zS1Pwfm/PkyDxfGMU8BbYzxC42wM
 Wi3AAAA
X-Change-ID: 20260924-shikra_crit_trip-7a11bbb66b71
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792915455; l=2686;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=9NEPErxMm60dBJueiQOlAK4w2gncG77hGo4ML1LQSLc=;
 b=TwY+vI+fG86BiToPOGX0DYO2gXUwEYF0FyBZuKKlAOgItrGWJo2ZyfcSaN8NPJYed0sgnBU5E
 /iOoXBmP3UqAoAn8pIzdogWSUN3UUi0Xltcnx3wRaL2ibpBUYDL8Ff4
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=Z8Z5j3RA c=1 sm=1 tr=0 ts=6addb804 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jog98iChi2leUUf6YfEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 9553o2Il4z565YqEmYbyU9cuidnq_tox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAzMSBTYWx0ZWRfX578U7HmRSnaF
 7orffeZ3inG64hYdAAS1eac6zVIrBPIxheKN+URy1fO4IJOU9qMYjptjeqQkDTMyuLBDXa+APUP
 1DGnhZtOq3cDa2spMN/VndjhYroKOI23wx8Y9Yn2RzizEluz7wRHr26C02waOuvkcoP2Mk9VH2S
 26fheSVJD7vILYU0XBohVCIGR2NIfhEo8to8L2v9jzpsR7FzFrNykrD44md3JRcuhjyytR7H+sH
 cUxbFvCc4K43nz2JAAo71TWrFgjzemjkMdv+mN+XDnxxwK7lWODJLPX+cALsK9xJ3xiu7VHO9Yh
 BJrf9Ddzk2cnVcMbV71DKI8L4P7hQ+vMK/b4V7vZhH2utURciV6LtU//LyLlQtsb5oOc2SC9Se3
 JZPKLD4ql9uOgRYNx2M2x3DbSoV0byeeAE9OeRAtzXLdxtMemm3cXEZ+S/vJXUxjOkdtpILEdY2
 ccogC/c52dYhc8T+9bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAzMSBTYWx0ZWRfX/T4XSeFu9shR
 pQ1uKlQP4nQX0/eqASMTRnEVkNWODV98mh1EEFZrzeEwfNqIukMLEk1QmZ1BFfCpoun1fA2P3Z6
 93dMI3WaljUF7IwHijCM5noTNEQVELg=
X-Proofpoint-GUID: 9553o2Il4z565YqEmYbyU9cuidnq_tox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250031

Shikra firmware starts CPU thermal mitigation at 115 C and also
handles the 117 C threshold, while hardware shutdown is at 120 C. A
Linux critical trip at 115 C overlaps the beginning of firmware
mitigation and can shut the system down before firmware has had a
chance to complete its thermal sequence.

Raise the CPU and CPUSS critical trips to 118 C instead. This keeps a
Linux graceful shutdown path before the hardware cutoff while allowing
the firmware mitigation range to run first. Leave the hot trips,
non-CPU critical trips and GPUSS passive cooling map unchanged.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
Changes in v2:
- Move critical support at 118. (Abel)
- Link to v1: https://lore.kernel.org/r/20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66..c4e1b78e2673 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -3756,7 +3756,7 @@ trip-point0 {
 				};
 
 				cpu00-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3774,7 +3774,7 @@ trip-point0 {
 				};
 
 				cpu01-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3792,7 +3792,7 @@ trip-point0 {
 				};
 
 				cpu10-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3810,7 +3810,7 @@ trip-point0 {
 				};
 
 				cpu11-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3828,7 +3828,7 @@ trip-point0 {
 				};
 
 				cpuss0-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3968,7 +3968,7 @@ trip-point0 {
 				};
 
 				cpu02-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3986,7 +3986,7 @@ trip-point0 {
 				};
 
 				cpuss1-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260924-shikra_crit_trip-7a11bbb66b71

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

