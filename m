Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397493B14D5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259775; cv=none; b=CwAE6350W6pHJsuYwjyN2DKgjD5dJsu28Z4T9VZ0rRoOcLIgT/zR7ARjTA2IUNs/IKJqBI3tncWVR8sNWqUkReUfovOqPfMzXxEw6vjU54Y4l8W3NoerJfJaXuwshLJ8lyRxIztMZPmfwgKmNAPCou8zsQDkBh1ohbNBARfm31A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259775; c=relaxed/simple;
	bh=YI+LvSPsiRJc7OXkPGjBEou8wURyaPBkTUC0LLwxkag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o9x6wh7L13QdW90Lf/wLgczg0d4kXW6LL6NlXbM6lsflk6j9qTyEuUSFDNA8hndDYwuI8tvTiUOzd3AvhywdndMx4QcNr5N5cojhrMM2asKmFr8kd02ZzzxbhdjC84fqjdpowC/WErMFFqNho7P2ovaJuNtOy2xnjNAerDEXIj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKZHJFSX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VajpIYaK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKZHJFSX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VajpIYaK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4k6A2385712
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ehhMYEfygQixK1Jb2F/W/h
	X3WF0x3zZHHh38amgd2wU=; b=GKZHJFSXhAqlEOhF2rd8p0RTb2abaYGKGjyQQS
	F5WkxF/HV8A3Ab3GA+ekV6NYcLu/BgU6VyBstj5rOCUcKcJA8vChLEdoISu/99dm
	HG6MH6RHVGVL1fS0pxU2ohSV3/6FtvhMXOLzsXg4JvE4HBlaAkYV6F9qwvP4WARH
	3JZXJha/nPkpFtouxkZ8bcSpOJhWtYeFdNvKUWU1WSQb4I5FrETKmfX9cn0E0lbJ
	UEL/yBxAyc2cgN1sxc47lD7qlPfPOrqDr5HVNvqrV8+9diB7rixDUzir+AkKB7YJ
	s62ZewmzuL0FwtyTLnyy+Ms7oXavakUmrqNcb2wUznbHnVdg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgtx5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:22:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so20962345ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790259766; x=1790864566; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ehhMYEfygQixK1Jb2F/W/hX3WF0x3zZHHh38amgd2wU=;
        b=VajpIYaKINlq7hbs7h+inrMxRmiRVgyxTcE3FWtDeuitLlSWX69yHtR4aDjxi86zdT
         67fFx8HUE4FQt2tKH/+IOzheF+nKxXt3Yph0aePsTxDDxA/Y7o9FV3Y2ycGRRr/OUlC8
         66UY9VoulLZJ2rOSniahXVs9MgKDjt0gHfMAgSwAq3LrpLT9UqjTj01ORjpuItrJYB1g
         PNiDTwJxzghndUXL+y5ZswTovYt2MUdIWdG0FfjoTSVxJ9mAHG4JjL0UizFFxBivaCpV
         qjrSURK/Dl81uHPv1a5yAOV57j5fr43VoDoqX5Q8Y35xhQO0B4SMA1EKxMiTwVtHVmO8
         6jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790259766; x=1790864566;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ehhMYEfygQixK1Jb2F/W/hX3WF0x3zZHHh38amgd2wU=;
        b=E5ZBMtx8fyUOdcxYEwot9Sjba7UJyp0fEzFuMMUCm2zOV2rrKPe1atOWOdZ9tsFRuw
         Fh9InyvkwsTdYWAPgor842vNmck6LvLp9eijXSNLwaUmfVB/sQdm1U3ZALhLlIIYGRoY
         WDFnfzjSj16v552v3edSTzJ7x5yxjwIO3R7yBD1Lo5GDX7hWC/xrgoob/kMclhZWD81A
         4Sicecqg50g5fmsO9IGRiY+VKd73twgamRhKXsJH2V+AxFhsgoLSuBmS8k2sHRfGZ+6M
         AbGNxloVX0JkBMmwFWZ8HKFm8tL8vXfOFfadHVafPCe6wlDPgNzF0gu4YlbfyLlIOsuk
         gqzg==
X-Forwarded-Encrypted: i=1; AKwUvBzCzGm8k9esNhS92dw+qVhAUQ1jOnDPbY+YnKfyB4q/gJsEY0VE6F8iWETn0y2SPon/JIf01AsuVyDp8iQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kijbGgoqOW0FTPt1NSFYuGmChPnP4TCQqqwz+rbo3zz2ml3B4M
	hHxa53r0tDbqogkH34LOO3IqIDimU0HI/ZcLFKtf97i0Q0GPaTkAvYtzX46YZGShh16kfAQkfDb
	JhrsdxsUMJCAwg1JHjh3yWB1SDhr/BtCr5HUvxjHavu9HFGicDsV+Wr/QsDGAcZWWxD8=
X-Gm-Gg: AYBFou2aPj0+UOhPdjSb9uTgpJ9pq0SpAFwpVpSn13Pe7EDJsc8QI152Sf2YZpek8Qt
	VG+8cjBHTstuC9u/vrAqbbklRHO2roI2sl5tiKV/GfsBfgPpoPaFyybKGLJdGiDhfKiMHIYKoiW
	5ZMt7qjG3bD6lpg5C2+UO04ikUQeFKBLBKHACb5IDA8BWU7oKJIFUbZ1TGq16r97VpsMsX/Bpq+
	bCu1xx1yGTXqnosBmQBfAIVbmOzDtymX1AKqLkUv7ZkwlZyvp3ujU1WFoakhPcVj0ArII+p16QV
	XoqFrRUCHI+lRD7xhNlwvESQsie13yYocYmsmDVnhZzY1s4mZnAUC/T9+MZ6ceeLMTQIoyBXy+C
	VB+JRYfKe0A0K7TWPh3+cWea2+y5Z
X-Received: by 2002:a17:903:2309:b0:2d6:e074:9cad with SMTP id d9443c01a7336-2df7e24f3bfmr22374245ad.6.1790259765506;
        Thu, 24 Sep 2026 07:22:45 -0700 (PDT)
X-Received: by 2002:a17:903:2309:b0:2d6:e074:9cad with SMTP id d9443c01a7336-2df7e24f3bfmr22373975ad.6.1790259764857;
        Thu, 24 Sep 2026 07:22:44 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a7b48sm27932845ad.23.2026.09.24.07.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:22:44 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 19:52:32 +0530
Subject: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACgytWoC/x3MQQqAIBBA0avIrBNUQqmrRITalENgMUYE0d2Tl
 m/x/wMFmbBALx5gvKjQnit0IyAmn1eUNFeDUcaqzrSyJNrYT5HpnE6mQzqvdQjB2uA01OxgXOj
 +l8P4vh8pZ+CuYgAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790259761; l=2550;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=YI+LvSPsiRJc7OXkPGjBEou8wURyaPBkTUC0LLwxkag=;
 b=+DeuYF91aHtNWQehz7rFe/c2/fP3wlmSxH4U6Y6nCrNYir9XTeaJOIkDj+qn6zIkuEUlOOd90
 O4UhtGAXKTyBTysMS19xHt2LPmwsRSzmK0kLWgYmgAmSf7V1XHNgc/q
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab53236 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=optKeNDtaaNOZmMToXwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: _R79O6Dg1uV3Q_ktmHGuA2iDqTt2_d2J
X-Proofpoint-GUID: _R79O6Dg1uV3Q_ktmHGuA2iDqTt2_d2J
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1OSBTYWx0ZWRfX0+Sk1Rv0x0UL
 vahLzAVKEtzjshh1SA+JGfDn4o6BEeGYUh0qEoPH2xVKQDBeY2+rLw6k9oE+jtLFjUQtiyZ1g4J
 HiPpIFZ6QO8Y+HqDyOVAmrjdhzw2qDY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1OSBTYWx0ZWRfX9uSzDDpwp7mq
 A9N0hrx7DlxSKt6EJZwE/t78HkbBCnwv5FSxHZ6+BxTMwFtEda16pEiMYAP6xpXJfRCofih0goe
 pYo/5S4D8sJUptm3X5616Bp407UOlxHXkP92dwCFBM+83eAmqxWuFjZQ70yi6vuio1K6/UqVdWH
 h/tnYll/BYKjQAt1NV9pZNyiVHTdH8nM7VFTBbKLTL7jRn4iSA2HHTJi+MmeRTTvpwemxsWzJSl
 qaObQ+9YGJqVmpN8/1+C96HF+TGkDMKb9im1tqmskyvfXf1O6qPX5YmPTQ9UhStR7ccM19nylXq
 XbQqhIiC/upVUQKocBkBbD7U6Bo0uWSJqZd+xzuZ0giXo1hwBUrvaZd3hV3Bpm15tWX2qo8mdAi
 gN0uoWSGuYEqcj0bDQ0dl9irxzuhpDAscb7D8r8lFGMeLmmFhfAwiD9RpxuW2aRyTsdivQx/pP2
 rjiDnv4VlDfHPxfNQFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240059

Shikra firmware handles CPU thermal mitigation up to 117 C, while
Linux CPU critical trips trigger at 115 C. This can shut the system
down before firmware reaches the end of its mitigation range.

Drop the critical trips from the CPU thermal zones and leave the hot
trips, non-CPU critical trips and GPUSS passive cooling map unchanged.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 42 ------------------------------------
 1 file changed, 42 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66..7c1e77e38c52 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -3754,12 +3754,6 @@ trip-point0 {
 					hysteresis = <5000>;
 					type = "hot";
 				};
-
-				cpu00-critical {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "critical";
-				};
 			};
 		};
 
@@ -3772,12 +3766,6 @@ trip-point0 {
 					hysteresis = <5000>;
 					type = "hot";
 				};
-
-				cpu01-critical {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "critical";
-				};
 			};
 		};
 
@@ -3790,12 +3778,6 @@ trip-point0 {
 					hysteresis = <5000>;
 					type = "hot";
 				};
-
-				cpu10-critical {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "critical";
-				};
 			};
 		};
 
@@ -3808,12 +3790,6 @@ trip-point0 {
 					hysteresis = <5000>;
 					type = "hot";
 				};
-
-				cpu11-critical {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "critical";
-				};
 			};
 		};
 
@@ -3826,12 +3802,6 @@ trip-point0 {
 					hysteresis = <5000>;
 					type = "hot";
 				};
-
-				cpuss0-critical {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "critical";
-				};
 			};
 		};
 
@@ -3966,12 +3936,6 @@ trip-point0 {
 					hysteresis = <5000>;
 					type = "hot";
 				};
-
-				cpu02-critical {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "critical";
-				};
 			};
 		};
 
@@ -3984,12 +3948,6 @@ trip-point0 {
 					hysteresis = <5000>;
 					type = "hot";
 				};
-
-				cpuss1-critical {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "critical";
-				};
 			};
 		};
 	};

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260924-shikra_crit_trip-7a11bbb66b71

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

