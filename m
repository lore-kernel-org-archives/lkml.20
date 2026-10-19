Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F0D3ACEE0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393378; cv=none; b=blazaoHFyYE+SfwT5x8zy1P9mBSlrs6TmEKxtaes/myVsTpxDgUudx1RBWDUmiraN3l8soHIGl3kbeWx1AU4CHwpH9ol0OowedsuEyOLdndgpr97dwz2iyxiEr0jLds03cy/jG6BQsyh99rIQHJexzI0D21ZF2q+w3QkSPy5RNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393378; c=relaxed/simple;
	bh=qslubZxap2r5UmNKQQJ203JBKOTySnI5k3hp7eb7gM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dJCon3nqOjsqx+saOa+WRLEOOGzuo2JF5uLexkcPgkaoJCb1caqAoQohNFjWpn5FISjBanLqS0vlYVXqbYfGt4LORR/MZLb7a5w4LkfKJ/BH0+D6YoD2cc07Dp17oeKqMJ9rt9BQXrhvTQZWvBVsQTMKVWSLf7egJWwoX3zUN/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqmZjdcQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXdw3saE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqmZjdcQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXdw3saE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j7LJ683670
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2lqgHK1HHpbuHLS+1fJ6Fv
	6nS/oflbvo0nKVIWjUje0=; b=NqmZjdcQkXjMHFo+EQZ9KScjw8GNTqLs9n3oTW
	T7ph/hykaQg7sC3/cm/H7GACX+uUi2NH9DniaT6SS4pgooWh677wfVwo0gdW4Gv3
	yMRqujHHyBy74eQfqBW6b+N0oBdIfGCX1G80tpy62w6XrkAB6kE69w0Wz8lsTFRf
	Pp4hQGHp35KmuOFLwdiz8T+tckne+ZP5od0Jqgmnj9Zz8q9kYGcwv4OML2Y/VtTW
	Q7pWNWeoraxuGziKGpNNiHAzP05VRLww8JyDrHqz7l0NbIx4hcaXgrTOVvY+rcNN
	ALwt3sVtiMLe6W4qypTo5nfGpITLhhfn0UEWSI/CMIDABhiw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7wbkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:02:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df8484f12cso16036115ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792393375; x=1792998175; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2lqgHK1HHpbuHLS+1fJ6Fv6nS/oflbvo0nKVIWjUje0=;
        b=QXdw3saEV62LGsGhQ8B8yNXuAMLYdbAwNXWTxTX0Mz2ZRQSJufAbTOxVMlYLwIJwKg
         1MnRbxuG+G7s4SNQKICh0a95ZGlbk1bklL88PQSu6qWSrroVt/9+XiVT0KH6x/joQJDb
         Bf0bW5FjfjcJEBfMJpqciknzHlMxt1bbsnClgLsED6jk9cpb9KmEZ3IlJgQ6VlSZel0t
         I1VHbct2guX4jrz3U16bhtOTqoN7olv/orlJ4cM9As+HENhqN8HY4AS1f0/pZBQLCRm/
         tQxhjyUFqqwgtfgL/jsmJIJ7BbZ/zuV7CWwE8mJq3RP/7FO76rG3muLCixqF46WMtGD3
         LcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792393375; x=1792998175;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2lqgHK1HHpbuHLS+1fJ6Fv6nS/oflbvo0nKVIWjUje0=;
        b=wY2KTldxEBqx2kpGe/EPwWBa7N5nyWW3SRIzm3oEFy1XzH3+lAx+5qUDSFOPK475s0
         m/G8TvCPztoJm9uZJz6VySD6KsU24KODvmKFN1RtN91buTKj0S7PAJWifKMVSplzFyM8
         lexK9w1Gbm9VtXzcJziO4c8VeGgaDtY+JdVWLafZVEf4NgtNtRnflXz2NDBNILdf5igE
         vkkt/8kH97X3h/xfgHdhFkLyggexSIuEa2l7DjR5UwGR8+Od+PD54zKEw3gdwWsorzL9
         +UoWl0MtIY9bc9oq0BwTZW51UitqdTKjxGCfel8/Es/wO0OcfO/9V8ieEL2+zn+eHIwo
         oycA==
X-Forwarded-Encrypted: i=1; AKwUvByk2lHYgrf5D36ygOSkisfaD7aeH9NWcCNTq9ImZEIcEITweLrKv0gJW8xeaGGxoJNtqgSmqPj8JH8fesQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLLmqGw2S5EDOOWu7T+ptvDkZL9OKcXXiupd+p8EfEhSjVkKM4
	2CtnJtozHaDfbb3QtDAblCFwIkPRvolqc0ltVKo+UmWHZfWGTT4G8uoQRyeg5yyXbEy8QSqCfp7
	r/2fAmRbZzDZTZLAP8Kj7pf/FY/wqSzldYYHM5gtL/9jCZZPL/4LzqyLEDAWQkbU2Q9M=
X-Gm-Gg: AYBFou0+rOjhaskUnhQy99CKq2/4C6J5eBwZWTF2+MMIwwO4JhL6lJWjOh4X3dl3n/y
	P85QY36aizzPBMDNfpT8OpvY1KcklpBaoK61tfzdrkp3u/h1V16cbdkABZlwRCGuIIqMi0ntAhs
	ulBQ11YvvPPzys7cVMoreg/ZihY8V9EGOtD/hLhvy8pAuJDW7JpZQUwlSnRnyVGX5RkMdMjNJ6/
	Qc0XJ2h8xCGYT30mi0Jb6bMjukACmkW0JtxngEel/Hlk1wJzKJDYraYd9ukGpIJyUh2Q1+XEogN
	NQsBrpDY8F+x6HE6XCEkOUEiScC4nDkX4lt7cv37D7Y6bEeoBqJb8d6OmNK+GgCf0oSUMpj6+PU
	T/v6LdGYMWVCt9KWTJlk0RuHaEwOLrFyL6E+eciGjjmiUbThoADfEB6yIfDLKvQ==
X-Received: by 2002:a17:903:244b:b0:2e9:6be2:1296 with SMTP id d9443c01a7336-2e9a6c14af2mr45690785ad.56.1792393375120;
        Mon, 19 Oct 2026 00:02:55 -0700 (PDT)
X-Received: by 2002:a17:903:244b:b0:2e9:6be2:1296 with SMTP id d9443c01a7336-2e9a6c14af2mr45690485ad.56.1792393374446;
        Mon, 19 Oct 2026 00:02:54 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8353b1sm35310935ad.39.2026.10.19.00.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:02:53 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:58:34 +0800
Subject: [PATCH v2] arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based
 probing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-fix-etm-probe-issue-on-shikra-v2-1-b2eaed0fffaf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJq/1WoC/42NQQ6CMBBFr0K6dgitFsSV9zAsCgwyUVrsANEQ7
 u7ICdxM8v7Pf7MqxkjI6pKsKuJCTMELmEOimt75OwK1wspkJs9KY6CjN+A0wBhDLSXzjBA8cE+
 P6MC63Jw6ez6WhVXiGCPKYPffKuGeeArxs79b9C/917xo0GDz1lgs6xp1cQ3M6Wt2zyYMQypHV
 du2fQFDxRjp0QAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792393370; l=5221;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=qslubZxap2r5UmNKQQJ203JBKOTySnI5k3hp7eb7gM8=;
 b=EzTwBYMKBFVlQf0nz4yDDaerd43tbpqKqy0qIv3g8I9GW49Y6mmhToCuWBGK2uu6+yeO3bhIS
 FXYANxY6bK6AeLBleYV5wunIW7f1KZIQopKJcBS1kKxARTtmSLlp0Yr
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyNyBTYWx0ZWRfX46RZzXzkW8Se
 +Kgx9Wfx60lZvUZcYo68AyrfHl2pMGOfXNQPQ2EZzvA9NKKFMPDiz+hlSq+uied+fFhA1e5BFLw
 q0ZAsoK7CuBfvm0loj28LwYFEcx2KG4=
X-Proofpoint-ORIG-GUID: 8wTpP6mhUW09tLeSBEs_9_TfvdlVZngA
X-Proofpoint-GUID: 8wTpP6mhUW09tLeSBEs_9_TfvdlVZngA
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad5c0a0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ucFWaANPfWH9jnj5dtQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyNyBTYWx0ZWRfXw19ZYQls581D
 HJol+nPS2Di5jMmplJCaEWCTH3KqjIT0nfRcvmEmudLyuFoe/sUQGlUCIeFRJudGl8ZmDE+oZem
 qJcr1ujQYNXwqv39xvLyz5LAOuH1qQb1Uu4UDw88UH+g0N2iRxbVx+tch5RjD9936qsuAb2ngjn
 qYIdSwVcAeNLfhgj5jVBD9te3R/snk25Vs0kw/woE6plkg3gbMQpdR3pO+mk08ZFHa4DSkJtd+Z
 geW85EIXC2KIPumuk+yG4Fh/guDL9SHX9RVK7iIq3OV4BAcWRax4vm4FUN+IY9xyPVqF1vbCjWA
 i6SBj1ymidnVgu9iDHVYZpAoPcwtgcDeMcgedxY54BDt4X5O6ZQtiCt1mnUQe7eOu/FMoBQMfXm
 aDQFc9Xv9ujAFUzlI4JRPWZk9qFgdiK5vtEI2y297Ki/wDnSmumAAREIEERj6m/ezWBehVU9KTx
 s1otv5DOcaD+bKrB8KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190027

The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
but do not implement self-hosted system-register trace access on
this SoC: ID_AA64DFR0_EL1.TraceVer reads as 0 on the affected CPUs,
so etm4_init_sysreg_access() correctly reports the access mechanism
as unavailable and the ETMv4 driver fails to probe with -EINVAL.

The CPU ETMs have a memory-mapped aperture, so switch each node to
the standard "arm,coresight-etm4x", "arm,primecell" compatible with
its MMIO reg range.

Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- add arm,coresight-loses-context-with-cpu property for ETM nodes.
- Link to v1: https://lore.kernel.org/r/20260922-fix-etm-probe-issue-on-shikra-v1-1-56d25e9bbe17@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 144 ++++++++++++++++++-----------------
 1 file changed, 76 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f..2ddbd61567d8 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -166,74 +166,6 @@ eud_in: endpoint {
 		};
 	};
 
-	etm0 {
-		compatible = "arm,coresight-etm4x-sysreg";
-
-		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
-		clock-names = "apb_pclk";
-		cpu = <&cpu0>;
-		qcom,skip-power-up;
-
-		out-ports {
-			port {
-				etm0_out: endpoint {
-					remote-endpoint = <&funnel_cpuss0_in0>;
-				};
-			};
-		};
-	};
-
-	etm1 {
-		compatible = "arm,coresight-etm4x-sysreg";
-
-		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
-		clock-names = "apb_pclk";
-		cpu = <&cpu1>;
-		qcom,skip-power-up;
-
-		out-ports {
-			port {
-				etm1_out: endpoint {
-					remote-endpoint = <&funnel_cpuss0_in1>;
-				};
-			};
-		};
-	};
-
-	etm2 {
-		compatible = "arm,coresight-etm4x-sysreg";
-
-		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
-		clock-names = "apb_pclk";
-		cpu = <&cpu2>;
-		qcom,skip-power-up;
-
-		out-ports {
-			port {
-				etm2_out: endpoint {
-					remote-endpoint = <&funnel_cpuss0_in2>;
-				};
-			};
-		};
-	};
-
-	etm3 {
-		compatible = "arm,coresight-etm4x-sysreg";
-
-		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
-		clock-names = "apb_pclk";
-		cpu = <&cpu3>;
-		qcom,skip-power-up;
-
-		out-ports {
-			port {
-				etm3_out: endpoint {
-					remote-endpoint = <&funnel_cpuss0_in3>;
-				};
-			};
-		};
-	};
-
 	firmware {
 		scm {
 			compatible = "qcom,scm-shikra", "qcom,scm";
@@ -3740,6 +3672,25 @@ cti@9020000 {
 			label = "cti_apss_pe0";
 		};
 
+		etm@9040000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0 0x09040000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu0>;
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm0_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in0>;
+					};
+				};
+			};
+		};
+
 		cti@90e0000 {
 			compatible = "arm,coresight-cti", "arm,primecell";
 			reg = <0x0 0x090e0000 0x0 0x1000>;
@@ -3758,6 +3709,25 @@ cti@9120000 {
 			label = "cti_apss_pe1";
 		};
 
+		etm@9140000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0 0x09140000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu1>;
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm1_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in1>;
+					};
+				};
+			};
+		};
+
 		cti@9220000 {
 			compatible = "arm,coresight-cti", "arm,primecell";
 			reg = <0x0 0x09220000 0x0 0x1000>;
@@ -3767,6 +3737,25 @@ cti@9220000 {
 			label = "cti_apss_pe2";
 		};
 
+		etm@9240000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0 0x09240000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu2>;
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm2_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in2>;
+					};
+				};
+			};
+		};
+
 		cti@9320000 {
 			compatible = "arm,coresight-cti", "arm,primecell";
 			reg = <0x0 0x09320000 0x0 0x1000>;
@@ -3776,6 +3765,25 @@ cti@9320000 {
 			label = "cti_apss_pe3";
 		};
 
+		etm@9340000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0 0x09340000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu3>;
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm3_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in3>;
+					};
+				};
+			};
+		};
+
 		funnel@9800000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x0 0x09800000 0x0 0x1000>;

---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20260922-fix-etm-probe-issue-on-shikra-5a624f583975

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

