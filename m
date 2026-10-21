Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595860;
	b=As4aSbcws00bODPqgHEAzhO5Pr6D6LNv7a5rVfxO+NQ3p9CC09gq2ZIow/r/a9tyonQI
	 /i2oiZOMSlaTyS/3Y00yHMieH8Jtcsxt3MY7M6m4c0soONM4Qb12aJCz28aLVnIa9EyOz
	 GcmmVb18p9fHhXLbBnXbFIwOgTKefT0qZoKWwzVT64gbftLzocM9JfeHwB/dgc+u3jje5
	 9qYyR13FSjW0YfF7H/bLwtx1rru37bRTwPcC/yV51X6eEY8Qr+LNSoncJhVDGzWfNiDaZ
	 7HSJYdcoZQO1eQ9HOi2bK71les5S6ywfFyf9zXgqbcSA0XLFafEzUSekAOF99UbtBNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sMmjYtG/rjFjeMhRDVGkf/87tw6pvM/e0yvKC2pDRLg=;
	b=mVRFcPoVQse0kDhaHCkOgEJQchGiGOR8pTcAkglYQLfe4AqUu6Rq1oVc6JRNoIlLvViZ
	 ky0/52CorVwTO85JlWdg/n1PRMXgVfScHbsCeqGGpI8D+l7xjKpDR5zrGg0khLX+Tq6je
	 S8b2OAmiSr5RkcdW5oqd7xbb7Ii8mpZTcjS7C4yfZxvWFZTkyA71hMs1LYDhxspAzupSl
	 z5A48NkXz2EKq+9+WJ/OawE1eGlrGdrKYnGibn4YyysqlEfV5podPN30vmP+TJvQZy0dQ
	 8LdJUSCRlWHVDK4foRD3IL8ka+rukBLJaJO+ykz8iupPMfN080KZfrsM5ntTR0EIFeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="I/5/5o/3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=avTrso4B;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE0F606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE0F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I/5/5o/3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=avTrso4B
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF6Uc1389731
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sMmjYtG/rjFjeMhRDVGkf/
	87tw6pvM/e0yvKC2pDRLg=; b=I/5/5o/3w+GXYaqYMYOy5XXTKXJ4O+aPrJtD8D
	q8n3+swFpVlK7tsTSeUhbOlkxaO+YtTwARHNPLp6lCzJrGsqr1hnHMcKFfADGpdF
	tMTWiMZN/RjtEpfem5WRIp9wrN9ySsBLyeLywNwxG+uGtpuT6+KanMaEKLC6Fnn/
	0maZclydMceUFEvpyqrSijs0vOHjgcLRCYM2H2s34C500Szl/NQZRhpRAmi4qCSU
	a2jP7tHiO2MRIP9CC1uFz1nVur0wSi9t3+S0BuP+gfgXJjQ/A769vseMOE69K9n6
	XAeCoKYtk94sU4b1auyyPbg3yJA4glIy1tCpp8Vpr7FX2zUA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajmkns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:17:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1398920eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595856; x=1793200656; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sMmjYtG/rjFjeMhRDVGkf/87tw6pvM/e0yvKC2pDRLg=;
        b=avTrso4BjPJJaDA9tqiifXSMknqtTNBAHK7NFZhWSCGRhE3tFMOqgOLmvmrHyV4zg1
         K/9q0usXuigzpWbTcmOLtwWxkmrdNCInNU96WK/DSr0tp5QRk89LTB1Mq++nHC6vj0Hn
         P+BJM3YjR+WXf4ib8IVSJ/5PAQztW2tdkpKdPksmj2/xgQN8iUzqXSMIl9xdaGDTV05n
         a7kXeyb150FG3fvJK1S2krOAXvC4FJgSMNygqFMPu3wFlUroIaUT7B1oqAhkTfVh+Sz/
         DH8FvnifYNoOpcwkMC5kvTYOKBs9/avjlh8E8UbqG/EgbQFg7jSu+5CJE4v2tOBlPKjC
         6BSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595856; x=1793200656;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sMmjYtG/rjFjeMhRDVGkf/87tw6pvM/e0yvKC2pDRLg=;
        b=o2TuQxxYxcXuUCvkzO4kGLfYnCq9GJx2XIArQNJDK3rkA/askcTjKEpK+p3bs2yNSa
         glc0x7f8MF+dulQ0b8XXMMO5slxupnkucRhJEyFpM+q7MnrtrnVDeOg6HesYNVwqSY4g
         bChXGyzBn6fQkwm5ap2rSX53zvZ1qRrTBq8fRoOO0e5xiOYqOAUfx8J4N1s8KUF4gGqY
         MQI3SeVRILWVpX3BYxugrwOTgp9vsl/uOQh7k+qqQ4r98XIXql0z2Cc4pa1GuKivO0M2
         ZZQ9VBxGxswYCPkTfwLC9EDydlIzmG5SwvntfOEvH0fEfQbuokZ3jmAScWMfPfhzSy1N
         YTIA==
X-Forwarded-Encrypted: i=1; AKwUvByEq3euZ/DwLWagnVt+mri/oJKnGKOm4OmyReB+QclAcoi0ekL03tMz7Rw52GfzFNITHyE6Qn4Ya3rPHu8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQwk0J5NRcLwJbkcZawYWXNDlm+fHbKoQyOUwGmf44BvsJtXLj
	6lZ4RcUfWjIUPpgU+5BRiNmgGiiJrwu6AvL7Nf1YwCIZ6degx+nofLH3qzI3YG9/PugS/yxGjue
	YB3PLR7UQNa6mvZAlxZ8wPROOGYR3TUxbO9YeF1O35NGl56hgUKapuqBhwByXX0BesFrgFkBkiW
	4=
X-Gm-Gg: AYBFou1LBYz0CBY2lO8ETvllGUWOr9o4X91+lY4H6148oyLnaQSWtu8QxGn90uNu18T
	v407qVkCnqoiUc+tV5lpuaegozxmwSP3FJFgyPeadAl0pnzUlhvifrp4iB4Qn13yeAjGMAJtXfP
	hj7v9HCNEEQpSuCuA9xNMiYsTOpOkC4tPlrVWAIHTwR08eU+sdfM+bdTBUYPm0aaKehpZ1IUeMX
	90dDRlsDl5AMs7ATpzE4bLZX5do5W5CGogAtkng4myEiQVa7oQYcIupbgtPr+X783rmhIZFM8eZ
	GAZT4gmNGWnrSGaV18zWP9CHVom/bcUpkhDI6QnwMRw0bAm6mAOSRrIW17rHfU7GPO2IRtYc2wQ
	tQ4YATAGK1CM3QBWiyCqHdlfhp8OSZP6q
X-Received: by 2002:a05:7300:de42:b0:351:dbc:b663 with SMTP id 5a478bee46e88-3674e54a412mr3556454eec.31.1792595856409;
        Wed, 21 Oct 2026 08:17:36 -0700 (PDT)
X-Received: by 2002:a05:7300:de42:b0:351:dbc:b663 with SMTP id 5a478bee46e88-3674e54a412mr3556416eec.31.1792595855604;
        Wed, 21 Oct 2026 08:17:35 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:35 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Subject: [PATCH 0/6] arm64: dts: qcom: talos-lyra-evk: Add display overlays
 for EVK board
Date: Wed, 21 Oct 2026 20:47:24 +0530
Message-Id: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAITX2GoC/yXMwQ6CMAwA0F8hPdtkW2QRf8V4qFC1BmFpB4EQ/
 t2px3d5GxirsMG52kB5FpNxKPCHCtonDQ9G6YohuBC98w32qxJ2YqmnFadkWZnemEbLGI6xjiG
 eqHEBSpCU77L88sv1b5tuL27zd4R9/wCrlwP7fgAAAA==
X-Change-ID: 20261019-lyra-display-upstream-post-24656268a902
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=2465;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=/x6VoMzCsBiTnvMH8LNkojMMeM9fxxZt7W8E4IaOH9U=;
 b=AuvkK5Dy6j2wfe5kYXF/E2SbeA9MltC3kcc7mwKTrxraE7JHfYgZnPiNHnMgUDVZg3iCUQwIC
 gF1B65Jtm6ADjLInfuOs5fVdHgQ6+KRPsO/A7bpuuO2vSGgyMuKR9bY
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX5AZ80Uh3sqtC
 WyS7UKS3mh/L01yPqtFv2l9e7UHZvaAPqggDS7C/Ls8AGKEm6wHr0+Ni8B5MaXZ39ZhBAc+ISX1
 MqAiM3PXaHvuibxI5PPgCYDu8Tkp1hG6Z9cZ/XHkIN2mAtAO3o1cbR7fY8lwN2Lp46uHdSu9uZS
 slG62xv7TC+d6zNroqnbS8zcUbwQdIwd5rlwJXxAoX4xsPGnfDvS5OQqxZK+3u+D+EnY9NSyrGJ
 O2qrDHDrL3W/qtP2/nK7WcDgX2fXqKRiZ6yLCa89muaGswXJZmnJwEewGfgc2PPMaAVx07U0Rzt
 HE3Ikwae1g62+2btthx1jVnyaq/bCz2IqGwhh5IhgDR/QOg6UYAWncppMWOfl9T9DsgM4bj1j/8
 vRhVK7NNQyGXv/ZyaVlzXEwfeNPbCLwtZT/4DvQOiyPP/+5UnaS2SniVTP/C2hD9dKISd0bkTmR
 AixgjSdtZ+50TFjCaPg==
X-Proofpoint-GUID: y8_imq2VlAXS32vqybhuFZPlSzorvz8g
X-Proofpoint-ORIG-GUID: y8_imq2VlAXS32vqybhuFZPlSzorvz8g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX2NEHOHuEwqSi
 FLzA/qPN0xTtdYALgg7w1EodJWQV2xlV9Ob5vpyxBEzqWuai6QEsd2DgLg8USr2glj2tFdOOOly
 QCz01MjIZVOLeP6kYUK9zNqegL6K5vI=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8d792 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tMPW8O63IxkL4n0aSRoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

Talos Lyra EVK SoC card are mounted on the Lyra carrier card. The
DSI0 interface from SoC card is routed to either the 22-pin DSI
connector on carrier card named as JDISP1 DSI0 or to the DSI0_B2B
connector, through a MUX which can be selected by a hardware DIP
switch. There are multiple daughter cards designed that can be
connected to this B2B connector.

The below B2B display interfaces are enabled by default in base DTB:
  - DSI-to-HDMI using the LT9611UXD daughter card

Below overlay DTs are added for additional display configurations:
  - talos-lyra-evk-dlc0697: DLC0697 DSI panel for Lyra with DLC
    daughter card
  - talos-lyra-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
    panel with touch via the 22-pin DSI connector for Lyra
  - talos-lyra-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
    with touch via the 22-pin DSI connector for Lyra
  - talos-lyra-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel for
    Lyra with LVDS daughter card

These overlays are applied on top of the corresponding base board
DTBs.

Link: https://lore.kernel.org/r/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
Anand Tiwari (2):
      arm64: defconfig: Enable PWM_CLK for backlight PWM support
      arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01 LVDS panel overlay

Mohit Dsor (1):
      arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI bridge support

Shashank Maurya (3):
      arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697 panel overlay
      arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI panel overlay
      arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch DSI panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  18 +++
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      |  78 ++++++++++++
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 134 +++++++++++++++++++++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso |  88 ++++++++++++++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   |  75 ++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        | 106 ++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 7 files changed, 500 insertions(+)
---
base-commit: 1128acbf0e37fb5fe5b67d7e2494fa45905afda0
change-id: 20261019-lyra-display-upstream-post-24656268a902

Best regards,
--  
Anand Tiwari <anand.tiwari@oss.qualcomm.com>

