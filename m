Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604713;
	b=zelVIA3MvMd7lYQYDXTNMhlS59ejdUQ9UB5Nt+/K0tF3VEYVPVjQE/6wZWIM6AJPdVUS
	 sKgtmeQ/Lx+tjO6tDNd49ahG32SpqhKHmlRdOOyhFmiD4xPtBZhcXrFacrWQepdxK826t
	 sIO0zf3lCi3jj0RbWdPCmLxW0QSPLNaEL2XqzJf0I6IrqQxZuPoUCnV3A+1Xog5k9HPZl
	 8hn7+beykib6hEREdfGMG+8uDMRD8nRMxeyPyjuH4cn9CC4AkHVCCcqdzZzEWktV7+iSP
	 IZeRiekGj6yD1l7O38dN9KDhlaDjpeaOhQXfZbpuSrpBq6W2UR8mZBEfhER9SrNJVOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gYG4XMvbj1ZWlrawZXHMxEdbu1VimdUzwJ1tmM4hs3E=;
	b=VElQEG2lNrNo8oXo/hIx58rdC5917NKnbJ5k/iBfHTkEB0TFvT7teSrmPrw8RKIh7a/f
	 ZqyS0X8toqz5u1DLF+QQ3OSbO27izcRvlLonTC0PlEVYlqZNN8hJQVWCh+2dhUMZZzwQo
	 HPFbeOoD0Y/J5jCRL0WrGEwsFSeLqlBvpxHfL+LqXkoNaVU49wP3rqk+o62VWMdO86ov6
	 uQs/svrwtQlkLU3JaPnuIxm6MOdd/M7FBnr6oF/Ix37ChXnQhRf2w815xHkdgAKdquxeW
	 +nucDYd7OpzjPjXhoIHuft90fuhMICMzC3OLpMVNy7Wdtp4tmokrlEEbSK0vVmzWC2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=diRYCfoo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gAUVfCRD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CEA606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0CEA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=diRYCfoo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gAUVfCRD
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23v1TI2752042
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 07:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gYG4XMvbj1ZWlrawZXHMxE
	dbu1VimdUzwJ1tmM4hs3E=; b=diRYCfooBoVtpAs2qY12b7ltUtbQPn7fSCax3u
	Blu3jzb/hThurIkvgQbJ8s2KvJp+yaYq0dciWduGOJok4jPKhx9wTbEmtaw6vc8r
	vp3aVZFZ8dkjZnHdlNYB4BAsLW+FjNcqtLapWiucCLhb5qUfmXL0LLushSYQG1WI
	eQsQv07I/cPryAOqYlB128d3afdJGWJClMxzZxj+7t/oG/6gzOnNj9t1Hnl4Eka+
	ZHCEis2sCglWM7XfeaUfoSuuOtBKf9oFd++7NLiTIUlf7VO1ZwAHQTIX2v8InQW1
	jdinYSNwfXKyaW606soMde4jK6hAFRsA8BUA5c4YNVpuZvYw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg2015vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:31:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdae10aebfdso1628660a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604710; x=1794209510; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gYG4XMvbj1ZWlrawZXHMxEdbu1VimdUzwJ1tmM4hs3E=;
        b=gAUVfCRD3LDlIlpiSNC+gPCjbf3pqBlJe3vgU+uaiJylr+EOiQzJ2kt9pbctBC3TFy
         PvJYsKKOqWrBkI4B9rUt3naybqegf/tgQ+EAi5BXQmq5mUOb2kl0Zu9XbOBc5K/SalvR
         DDxhOi6K24w2wvzyhU/T5dftW+hpz85tLDpHGty7M9l8lealfnn6xXR97M1A/9nSjjlj
         myoU9wN8vfzc7ORIHQINzvQPNMu5v7xN9u1wzxASXcWeR7PjNkWiCosRUxEPul340YTB
         QGl92+JL9MrSAMAvXcYgEb0Tg8+thPfojrbPpg5sLc0hLkznprIxWjeHt/ZZB2RfOLJT
         BLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604710; x=1794209510;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gYG4XMvbj1ZWlrawZXHMxEdbu1VimdUzwJ1tmM4hs3E=;
        b=WzOwGKQUGt44qiOnZ3qnppcB4gxPuXmeMeXmEdDd4ADPgdmu8dtOG4sKDcR6sTGCHr
         /ZxQu+mbMX5yu+qmD3i7rJzCn63zyQv7PdbIccS+lZWjuNAh6J353+kxPFLeIDqJ9J2D
         f0ZFO0XEgfEWuc97pqYPITLUSGT+ccs7ZQuW4wLBP6KN2RkCD9ctC3sSUJbK8/bA2QHO
         3qPEJhthCsLF0cMeRicC97K8f2m66yRjMRzDuEY/EQYhkHrIh3owQBDAdgXhHQIpRcjP
         d0NT/fHTyokJMB0Wx/UW9KVQ50JzhO4NYL1VqF7M0l6oKNWn6KP3wJZgudmWULZwmRM0
         DSvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSzf3pU0oTWJmSdugBa+A5GyUoRCuefy9VzfbBjOuh58lBJ2kKe73UKdwa6GXgFscmXRuH++5NAfSBAj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cZZIpWX1IKVRtHlcCXLXOYKUQjLo5L+zSMkjNx/7RGZv7zQ1G
	jdLp0v8eoLeGtPpJkdAjxrxEeQpvbPZgQyFFovpwf89zn9NcL5q2xlubHpWBTEFgpkLGZi5sJsc
	5RKb4I+FPdZ+31TXPdr3nN3Z5sYbTVc62S7Wt+3LriOp1/PfvILJvEMoAcgK6SEsU3D8=
X-Gm-Gg: AYBFou3eqUfbB28zFVzfkWdobs8WykCAuajR/lzjzSTShsRJxbhrV/nBbwsxkUwKcAV
	O6BTykg5M6i/DeRLD1MdKFv2cy4xt5plcX0DXPEBkeEEdjPIy7A55HBUQmGgaNnT2C7WL9goHg/
	OawXK7KVAsRPNc1av4uIbejcUqAwdp9A18DktFlVh4oAyHzotAVdlTK+XnU+70jZ6sZzEgGGjTM
	dd3XbJ5LYEimH76i7pmtzZ/p24sPPxQWlbHUf1ZGk9hBRT3DUvF7Ty7NV5vjb1s2rmK115Ss63v
	JYUdXnfJyj0qHGcNx/a9Y4xVpBzp5OTa2u5M4k8Eb2t7qgc/qQbJ+xM8jE1/trBYobUHPzlGjlb
	uie2oD92TSquCYAUt8LlIePVQc58NayUhjSdKVYqoTd93Os/2FbYaYsg9ZeNuQ2G478wOlVu3Sn
	ONk4ZP
X-Received: by 2002:a17:90b:4b09:b0:3ac:8354:3920 with SMTP id 98e67ed59e1d1-3ae6f054f7fmr8783990a91.56.1793604710262;
        Sun, 01 Nov 2026 23:31:50 -0800 (PST)
X-Received: by 2002:a17:90b:4b09:b0:3ac:8354:3920 with SMTP id 98e67ed59e1d1-3ae6f054f7fmr8783962a91.56.1793604709712;
        Sun, 01 Nov 2026 23:31:49 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:31:49 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Subject: [PATCH v3 0/6] arm64: dts: qcom: talos-lyra-evk: Add display
 overlays for EVK board
Date: Mon, 02 Nov 2026 13:01:30 +0530
Message-Id: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFQ86GoC/32Ry2rDMBBFfyVoXQU9rFcopf9RshhLcqrGjh1LN
 g0h/14pzqJQNwgEI4ZzZq6uKPox+Ih2mysa/Rxi6E+54C8bZD/hdPA4uFwjRpikhBrcXkbALsS
 hhQuehphGDx0e+pgwq6SQTGowhKEMGEbfhO87/GO/1HGqv7xNhVg6PkNM/Xi522da+h4iRp+JZ
 ooJFlpYAG6sU/a9j3F7nqC1fddt84WKb2a/iJw8JbJMNETybBaGG7ZCvC0rjP485ZjSshfqfIx
 wj2m3eX0Mr3CCto+L0M/Hgp95NkihGydAeWvMH8NbSWQNl7NIRlJq8azy7jqDKqN0bSptZEPXQ
 TVEj8tLSLtN5WsmtKxdRVzNlFPKWlErVlkwXEvviFXUCf7PBFQ+FjoM2LZH3OQMYk7QQfLlM/J
 R1gAxIidoV+bZ324/azJchWoCAAA=
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
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=5137;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=GMe2uwE7NM1n2Zpjzvl6iZ1PqmO1uEJHc9EkSAQxCso=;
 b=AtNy9jTEPlt0ZECo0G1l/73bQ9myKQpqhrq5hzh3Z1Y535V6i+Gb6kLY9MIl3HJMH7H40fIB7
 wHr8RWyWUjeDEfFHk3CwlyrqBQwjl2zhdKDDiRhPSoOTiKzelT6u/nk
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: yb8pOAFHxs6xt3N-wz4JcljnMGOIGGWD
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae83c67 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Q-fNiiVtAAAA:8
 a=JfrnYn6hAAAA:8 a=BLctq3pD1h73di9K4sgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: yb8pOAFHxs6xt3N-wz4JcljnMGOIGGWD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXwb+fv1ze3jwV
 P5ulP/wcA6ccjU7ZJf2PPEOkfcBLGskchJp0fNyVIVVT3NIqc2gHf7XdFXr5UfqvvK9A6NRYxZL
 7mq4uSDD5bsA/7R3+999uuEnUTv9O42zbSitpeMwxdFpz+x6ecrFcaUGK3DYrZzUrdnclQRu3L7
 mlrtYWHqrf7rqGa4ie0wSrmEP+7CklheRoi6nLOECzPdCPRnb+6xVf1cmFHTgZOWtZ/yp1nC814
 oXbk3Or3ZcMhiU2gI3h9aFvKTHpwWSQkvVO74Pz6YkUWLJKxeVXvzgUl4mzUYX0hrc/OSM6NWoW
 caDR4GLGgKKIAlQ4Y1Y6QIf+jwToLwj22+sHUPVP3wfnoC/znM7er/M8f5Qaq4v2bzOxrnkVBoQ
 kDoYNDYQhMGNUaB7LP7/tNWzphVMdSX0peQFIPU6qBBROhuJdsNz/eUJjXNEfgySUf3SEdvBQwj
 e0TS+xT1h2nI5mkqSsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXxMQGyi5t5zNn
 CDC96KRgtxU+Ad62Rdx4he2t0U1Ac8BBaLJtqeWeZ9LORdFDsvBS1tL2skfjjOw1AX/AHaCbYau
 KkHefAcun38pEd9vuSivmapG2eragPo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029

Qualcomm Talos Lyra EVK SoC card are mounted on the Lyra carrier card.
The DSI0 interface from SoC card is routed to either the 22-pin DSI
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
Link: https://lore.kernel.org/all/20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com/

Dependencies:
https://lore.kernel.org/r/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com
https://lore.kernel.org/all/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com/
https://lore.kernel.org/all/20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com/

DT bindings:
https://lore.kernel.org/all/20261021-lt9611c-v7-v18-1-4978b94896f1@oss.qualcomm.com/

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
Changes in v3:
- Added GP CLK Frequency Dependencies
- Reorder the &tlmm pinctrl nodes in the LT9611UXD HDMI bridge patch
to ascending GPIO number.
- Link to v2: https://patch.msgid.link/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com

Changes in v2:
- Fold in the hdmi_connector port remote-endpoint indentation fix.
- Drop the per-patch Depends-on trailer on the LT9611UXD HDMI bridge
  patch; the dt-bindings dependency is now declared as a series
  prerequisite (see base-commit/prerequisite info below).
- Drop default-on from the DLC0697 backlight node.
- Add the ilitek,ili9881c fallback compatible to the RPi 7-inch
  panel overlay to fix a dtbs_check "too short" binding failure.
- Reword the PWM_CLK defconfig commit message to name Qualcomm as
  the SoC vendor.
- Remove a stray blank line and non-ASCII characters from the AUO
  LVDS panel overlay.
- Link to v1: https://patch.msgid.link/20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

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
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      |  77 ++++++++++++
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 133 +++++++++++++++++++++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso |  88 ++++++++++++++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   |  75 ++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        | 101 ++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 7 files changed, 493 insertions(+)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261019-lyra-display-upstream-post-24656268a902
prerequisite-message-id: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
prerequisite-patch-id: 0dfae1e9d0c620866489eecacb4b7201b9333621
prerequisite-patch-id: 94923ba8f57911649364a7e0e5494c7cfd478367
prerequisite-patch-id: 660755293839baa7364b4baf3a2dd6b4018de48a
prerequisite-message-id: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: 21cfbbfd71515961501a768edad476740336c13c
prerequisite-message-id: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
prerequisite-patch-id: 37995c88387ff54737dc82eb7c3b4600901ce061

Best regards,
--  
Anand Tiwari <anand.tiwari@oss.qualcomm.com>

