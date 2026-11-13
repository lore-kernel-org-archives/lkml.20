Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545741;
	b=gJGMwW0GF3H97vpHZDb68ZJrD+/gGjS3S4s5e1uPQ6eRCaA38JVsgV3JOqKCTveGtymu
	 klja315tximB74ME7VM4JrO9t3PDwgBan8OQIJVGuguzT0kdgniGPf664t+/c4b8aAPsp
	 /DEgb5Eo1a1WTC5JNyQ1op0XHtjJzKXNEaSXppGBEo92L7roaXQGj7tZqFpqnZWonLU5r
	 fx2miMrFJsRXQCTK+bZgM6Trco9KRQG5MFXgGUaYkWqfdZRFsqFNXjDB+SJoCwmvn1gex
	 lv5YnOkwQ5OS7v4m5rXokeLHFytdhHVwwuHN6Wgqaz/83d56QgysE86raYiiWpazSzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545741;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lIx2CS6fCKzreivxpI3mpRmL8+uVjdMEVbrcvV2S/hc=;
	b=eLO2/qeN/mmXHz1AB2Y71HDavMnaGyjLxcqBr+4+AGKfh8d4Zhrbo7oD5RPXrUXszRkv
	 iUNO3NAtPIIw6QeEsovGSpGseDRS4oleOTvI6iarKiuobZ82ehQRcELt8SxhDCts7GglP
	 0bHhowOa9Jczv+mZogMaZv+W4SDSQWhLt9xwQtYXvctQp/c0VO5E0u9vjH/PpNMbFSQyd
	 CeVvyotzbi/IyVGJb0p1MTRdQtMoD6oLKMadwQ8wUE1AzdRe1wiuyiS1e8Uo6/+1kDS6K
	 kUdKQqixhX7xBxrdDWk6Z4a3aAYXgWVuv9OgUmFJdG37OCU1xUh3tqy9fp34rsN8EZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daFS2vY3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T4yh41oD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEBD606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDEBD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daFS2vY3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T4yh41oD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KKtL3273986
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lIx2CS6fCKzreivxpI3mpR
	mL8+uVjdMEVbrcvV2S/hc=; b=daFS2vY3tyzzpbHxBcyvg9JvBDBwIna96I7QNn
	dVU7jaOdRvYClEabSoM/8bNUlcN7wh/N+vteKMT0XKmuHqskSSUKRUmxmK5iWs0r
	dApJaVx00VcJFk5fvqKzkRNGudCO1LCdfj7lIBcEqihTkH+UOrVuNwIu/wqq4NMY
	Kl2jiPf44mW7NyAFxPmTJ4FvTtfVHH8xKsxCGrrYcmpVtUuSJCTfPPT1SxNAeoHg
	nWwBsfQzypRYZh+n63bQ/6CCZB8/ERTL/h2N8lGNSIHNkevWiUFb0XyLt0oQW2aY
	IswJEfj1AcGvrNX2PwBqBEtGP18Oz+vnewkiBQiahTOs+lDA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufgrtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:55:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea71803effso5377125ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794545739; x=1795150539; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lIx2CS6fCKzreivxpI3mpRmL8+uVjdMEVbrcvV2S/hc=;
        b=T4yh41oDdiXb+vsbtQO/66WyQmqt5b5xUQLtoWFPViXMuLIvZw1HoHSBrpudbeeNxK
         Xiq7boykSSH+VGapAFcnT9IX43mbTiUTcgI7PVbK1xwkifUhw+d+QdwjQeGhTy2tUVXS
         F5eNDV2FvyIaxT1F+BHslptbqsX4ZZJv5zTm3LApoPkd1uZpRqWOPPmgRKBO2o8BzfnV
         wEs9sUQPuEECBxtYWlSy2DYHB6ucq+uG8ydVA10XKOUD9qhLImLpfmseyPbnp2tuVc4j
         x4AOkbBqiLPU1b+DtusAombiE7KXN/rWl/Mx3aUu0eGuVkVRwDC5vyVIwPh6OKeS4SS1
         qQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545739; x=1795150539;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lIx2CS6fCKzreivxpI3mpRmL8+uVjdMEVbrcvV2S/hc=;
        b=ypyvCj0WDlHTsPic9iDILO5jiCSD5YQYNPAiX3YdncGQ8N6/dNdRsmr4gx9R35rbLq
         oXVrK3hw/C8Am9Nh9Dh1iD3XCionamTXXt5xd6JiRT6ICCcP1HCUGDhP7tZP4HcD4c3W
         0NJImqNAvwuVSLd9Zz16d5neZAQ91CjZAHx0Q1bLISWDuvZhBdt47cosb5qrGla3iYoA
         F7YG/HMzbrmrQ/1V/xiCybYi+S0x4n/qYMfOmYx/97z0E4sMVrQtkHSowYTkdZJd+x1D
         fyzWRyqBQNXNaRyK/19MwtH5GfiRfUN9CKL9UrA7ePYr/ezYMWPnOd5keWut6Ke6XOuo
         oYDw==
X-Forwarded-Encrypted: i=1; AL+hErElJm+YjU6E6HqH4DKGefbDp5nNxhGa2dlYCMTFeVBp2RxUE1wlzFY61jsB1zOeuH4aFkOxgrt2HnQoqV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0JD+iquY/zVUaDCj2+rMc12cYPMkWRMNqNNbkF+ezjrjtDLnT
	BDFXwZzUkmyA1RmvMFubaXzi3M2NitUHd3m5oD2e5oQGDNoEuWVAstxm/aH5powGXhJV34Esqgi
	sSaBh3KbA+uConaMwyFu0Tc2d0NxhCKsvizANn7QNubXOSsk6LGB+q702gqC+iNzKtVM=
X-Gm-Gg: AYBFou1TIEB4ovaQdHggw9UE3pDAAjPZ65aW2RjktAz2NIBQxU64479qPgO/TftzK5i
	j181y3GP/yIt48O6W9yt9+w9jdvYSUvDdh+ax6ULzoSKGbvt5X4DmQbf8nLAMQ+00d1tN9/VuFF
	DTra6rwZBxkzGjVXuYXA4deSoxM16jd+uNv7EZ3vts3v4UJclAesyx90KRhZnXLJY7ZBgAWgvFp
	UlzF41hIZ2f9Fj/hvZSHLAOHddurZXg6kQSpggJle5WkbbxxsOA/U+bKJV19NRSzSUO3/t6RM3g
	xjYp2nahwJ7qAODac1nSeFwgyJK4KSuuA44P0BXkMa79ZQOI58NFZx1VC8/gRp6BRogy4IPsCLp
	L23RzZ914SJcu+rENxd3ZOmU+5UYn+ESO1Oogd1NoWnNYK3OGg8NINmbb6xoTjliy67bmMyx9RC
	up
X-Received: by 2002:a17:90b:5684:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3b1b0a49a8fmr902244a91.36.1794545739343;
        Thu, 12 Nov 2026 20:55:39 -0800 (PST)
X-Received: by 2002:a17:90b:5684:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3b1b0a49a8fmr902226a91.36.1794545738813;
        Thu, 12 Nov 2026 20:55:38 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm7739875a91.10.2026.11.12.20.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:55:37 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v2 0/3] pmdomain: Support system-suspend-only domain idle
 states
Date: Fri, 13 Nov 2026 10:25:24 +0530
Message-Id: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADyY9moC/1WN0QqCMBiFX0V23WSba4yueo+QcPNfLtTV/imF+
 O5No4tuDnxwzncWghA9IDkVC4kwe/RhzCAOBbFdM96A+jYzEUwozhinKHzbwxVTk4AqqaUxxkn
 tDMmTRwTnX7vuUn8ZJ3MHmzbH1ug8phDf+9/Mt95PffxXz5wyWlnJhFXKVVqfA2L5nJrehmEoc
 5B6XdcPk3VKo8EAAAA=
X-Change-ID: 20261001-s2idle_state-6484bbbf48fb
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794545733; l=4313;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=h+OJXS5GpG4CzdSwZr2uBBdlCOkcwJ/oouQ8a6ggKp0=;
 b=LBVhYye/0VIMpScQ4j/tbHUueTory6C/vc5CyqmBBCJSAl7K3uo4+SgPfL/7UrvaRuaMMWByO
 quEhUuqYTk4BG0yCSI9mcz4hRWer6Dh/K/K7oSJedBU7vYB4cM+RImQ
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: pOf7G0jeVE_3h6aO8BhjrbFB2Ov04Qbk
X-Proofpoint-ORIG-GUID: pOf7G0jeVE_3h6aO8BhjrbFB2Ov04Qbk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX1SzxD5eyGSZ9
 kRjnxn3WkW2YPqBlNbiin8Kdqtu4sNslYCE5jEL8RkiZjIC2XQZl5w3m2x0L64TJ13u0mR+Bk8L
 OIeQKlrNLB/Ty5cmHEa2X1QTmzL1KtAOweXT9FtfMcsPFoKW8mR0e5uKLok+yuTjtCnK62pC8/Z
 DPZS+ramFyToXDCf+7mYePffNtG0B0dBclhnjFzxvc6P0fXo5GSyp7Wc4vMM6uI0l2UUZOoo7Zz
 wUzjIN56eX0WU47+/MCUmcJs6pb19N1s9n8sdEnrJKDlAGME6D1c2YT87KieJtSOb+9GSydJ3Z/
 xa21fgROXawhGRRxrk7ZxZW85Lgs636jD1RI9CEnwglZ+Q4/wg0TP4Q3vvAwkDD4ZWeAUHUn5qR
 f86yvolI46EbIr1j+WLjicR7w2gTOtKZTOXFIqOAkdWK8mIeCJunDwyl2EMP2VoBARfK+tTLb/P
 ltaCTA5HZFHjkvo8n2A==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6984c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZTPrOM7BHbsZ8Di_hkkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX1KHrbduBi1au
 pRXxEtRa1Mpi9gVyCeGmcdskq9a9MLlwS54bwOfrODUW3pWV0bqo1+LVnHSMdH9xSeAoNjUnVcR
 6wWLexSPtiizsC6G5kaM2fohszfBBLA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019

To achieve the deepest CPUSS low power state, which can lead to chip
rail power collapse (CxPC) on SoCs such as Lemans, Monaco and Nord, the CPU
subsystem (CPUSS) and the Safety Island (SAIL) subsystem must be powered
down together in a coordinated sequence. The Safety Island (SAIL) is a
dedicated subsystem responsible for safety-critical monitoring and control
functions, and can operate independently from the main CPU subsystem.

This transition is divided into two stages. First, firmware requests SAIL
power-down through IPC, after which SAIL waits for hardware low power
handshakes from CPUSS. If an interrupt or another condition aborts CPUSS
entry into the deepest low power mode after the IPC request, firmware must
bring SAIL back out of its low power sequence before any CPU can resume
execution in the OS. This recovery can take a second or more.

Selecting this state during opportunistic CPU idle can therefore cause
substantial wakeup delays and repeatedly interrupt SAIL operation whenever
the CPUs become idle. SAIL must remain operational during normal system
activity, so this coordinated power-down state should be reserved for
system-wide suspend such as suspend-to-idle. Shallower domain states
remain available for regular CPU and cluster idle power management.

This restriction concerns when SAIL may stop its work, in addition to the
transition latency. Idle-state latency and residency values alone do not
express that requirement. System suspend does not eliminate interrupts or
aborted entry, but provides the context in which coordinated SAIL
power-down is appropriate.

All domain idle states described in devicetree are currently considered
during the regular idle path. This limits which states can be described in
devicetree. Due to hardware constraints, some domain idle states are only
applicable to system-wide suspend, including suspend-to-idle (s2idle).

To allow these states to be described in DT and used only during system
suspend, this series adds a boolean system-state property to domain idle
state bindings and a corresponding system_state boolean in genpd. The
genpd governors skip these states during normal operation. The system
suspend selection path remains unchanged, allowing these states during
suspend while retaining the existing wakeup latency checks for s2idle.

This series applies to cluster idle states with the "domain-idle-state"
compatible string managed by genpd and its governors, but can be extended
to CPU idle states with the "arm,idle-state" compatible string if the same
restriction is needed for CPUidle states too.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v2:
- Explain why the state is limited to the four-PMIC Monaco EVK and is
  not supported on the two-PMIC Monaco AC EVK.
- Push binding example and DT latencie/residency to the realistic values
- Use lowercase hex for the PSCI suspend parameter.
- Link to v1: https://patch.msgid.link/20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Maulik Shah (3):
      dt-bindings: power: domain-idle-state: Add system-state
      pmdomain: Add support for system-suspend-only states
      arm64: dts: qcom: monaco-evk: Add suspend-only power collapse state

 .../devicetree/bindings/power/domain-idle-state.yaml    | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts                 | 17 +++++++++++++++++
 drivers/pmdomain/core.c                                 |  2 ++
 drivers/pmdomain/governor.c                             |  6 ++++++
 include/linux/pm_domain.h                               |  1 +
 5 files changed, 40 insertions(+)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261001-s2idle_state-6484bbbf48fb

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

