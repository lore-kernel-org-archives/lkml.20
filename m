Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670765;
	b=EAueFHIDB//o/KA9lUYOfjtFkolqV57FxlZdMhGcSXEgn5g6VtC1cCoLVe8ThFurkJjh
	 EWuekw6dcHQrwaPqxZO68XToOE9t82PX5LlL7ban1zLEr77T2VnuaknmXXnDclYKAwTRK
	 CKyba/38JIkFKLLbcNWtPUwhaU9DD2qcjU9tTXn13uBzB7yBMXTlgjLF24/ZAzV7koTdu
	 t9zWW7KALfLURKvkClJb0wyS9OrIjud6xWYdNZkodF2RPPOwzJZPozsRGmWMEgg5bh200
	 /XrrbcXDmtLnBPtyHkCQ4vVsJD+wiXSqKgc6scPgHWUUMKhlzW2ShsaNFzj+Q/GsW1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670765;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hrqRIR6qjCPCM/+FGJdCXYUIyo0/YN8fZuFRUdFOn44=;
	b=HIvc1ii9+qfvwXRB+NY62nnDMeljUnycQiXBT96AThHcm65EokTdzkCP+P2KV9BcrwNz
	 JXGC9a1wtIkqAd/om7E8SzO4dEfaYfw6dIOd1sCdwTzJxzIAHSDGo67IFUkkqqw1/vZ1m
	 J/1GRWLzcyrH5cnrPmJ5qqxc+xQLJOfIv4ZHnvVYF4D0Vt/MMrlMYeYOogBNlKxCPVwF+
	 R1FFSVG6L4KaPln9fJnCeRxPaDVL3XMxkNBRqvIth1Aklaiw+uEGcs00Yo6alaiK7zC0B
	 ipaFm8no5+/LP0vNG7/vqqv6kmFFkw1R2bH7CYerjkgGjjLNnDs/YFqo2TfjAQ8Jzmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJ5dERUP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K91jUdB8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BDF606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3BDF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJ5dERUP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K91jUdB8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkRPw640567
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hrqRIR6qjCPCM/+FGJdCXY
	UIyo0/YN8fZuFRUdFOn44=; b=NJ5dERUP40lOCuplzsjQIQvEd1F/kSuFP2mZsz
	MtROmKsv3rhLeZkBKDu36LnnT4L/+FT340iAaUa+hgGU75PtXhQVZd8xKJyLmRt3
	vhXnKKhiGDpOu4Nf7Oj/r80zkjoYlGPpEVgyYAPSoS71O0N9rfb+u1zxe8+c2qDn
	H+EXHuROidDO317QMgW6jERiqZoTW7z1YAmUrUmMlxdcK0FY7TJScS3U8nVgLEWy
	aetipLGOtjNlgP9xGYJfimwdbC2e1ilg38tDQsgs6HFch41sQ9VzUOVGKbyO8DGb
	SOaH6/CF60lQaqKBAoW+ZfHd14f4E6syAS71oiVIFMGkULXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmah2xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:39:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso597599785a.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670763; x=1795275563; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hrqRIR6qjCPCM/+FGJdCXYUIyo0/YN8fZuFRUdFOn44=;
        b=K91jUdB88Plo788fch13ZtsICCRBETCrLq0QvtWPxK4C0raM+ojhua9hmEIdnq+yfv
         Ce5thanxSEX0/fp1wlCA2FZxaL6DhE753hoPTOedBZa1aANXdhPuH7+m+6h9S9QsobpC
         0yXd1d8qvxZDUWW0op+A92+x8fG4+YwCCMTS2HrDqGqIs69FNcI3U4cv9t0qwC9u4QF5
         v6IstF+Zf+Tg/WqiSLW5byTHp2fzZC51mWdgjo/8orCpm4ZpUZHBA6kMaM7fSksyW3xa
         VV9xK8Ox3yYIgmdXMCGyHpx13NpijUc/92NkBcr7e1MF/3OpUrq5ZkbPQaavIJxopwdp
         7/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670763; x=1795275563;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hrqRIR6qjCPCM/+FGJdCXYUIyo0/YN8fZuFRUdFOn44=;
        b=0PLtiWke0fuojNJrShZoLsoSa3akELx9ESUl1zBO4gSE9evB3/xrM3nMNAsZfR4pVH
         n+65+KanAgtjUxRRA280pkGM01BZAk85iSUFA9BvKPNblAk7deUYkhFBpfq4W3/3dTh+
         5ngh+uo6D651fWnrqOiU3XhRRURN8eNUEs8pjWOL5MWsBdRxTc+mqbiigMkqKET7azYU
         tG2Hl+9FDNuYA1wUPKC60hH0uNItG4St6JRRj1NNzjfBlbQhhBgY2aggSGxoTvF7L7MP
         ShHdNZmv+HVIb7JeegXSrvRLwYwxFMTSaehYNOAvhGSraMB5F5b2yWs1Mtr7/6V8jHXg
         by3w==
X-Forwarded-Encrypted: i=1; AL+hErExN4233CM5jU6BIgpt4x3ACBFX0Kt1eBaI/ZUxMliVT3/f+PokLMXvC75W63vFOHuGyWxxAHgsiAAD5hU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2Ks0PZzYcTulwh/9tHDjhmCrLLW6w1stciD4Is/3K2O4uv0vN
	OB/UCSNlo+HWL81CTGoRmWHVwzNHRiU51CAfngaSWAZo60WSXPLQp3V63w5xg79gCGQHnyvs8xe
	c2CClOWVkL15QU9pCV3igcrR/YxmF+W5mMQvSIFhTAsd7QUrMLj4yOav7yKM/hLK1H2A=
X-Gm-Gg: AYBFou0S9J1bXbWS+X9B1IHhJdZttZAV5p1l27YGI87tVdQRUzwAv1+3x2LiCgg7zY/
	ADjjbMwQzwGn5KPaPwOIWDY5DXTGidWEG5b888N/qD+lbXxpqn/iwEpgBGTlpG8FcdNiV87ZGyr
	z0VmP96r1FB7GW+TW7bRTuTi/x9Vj1oQ89efh9lLZuP3jYFAepJ60rDzs5YBe73KU5XczW6Fvf9
	P8m2EDfo29C56PSNJXmwWl+f/82yBgOQUrfzA6EDH+B3jwUtHbDfmfaDeLPauGjre2jdigPwTyk
	v6zY7b+S8W+tA7DoU31ct5IWMIOxCiHXqIo1T2VHOI//eaZ8ep+t0+j8je9aVH9RkAKxZ+sFaVE
	LR+8Kq4+CahlS8K6zDgS/uL0kxnO2e6jn7qUYvKTaaQ5r2r8trOXRiKcXIvK9PyTml0aR9DmD6w
	0++Kyto2Va2/EX
X-Received: by 2002:a05:620a:1a17:b0:945:c430:1c09 with SMTP id af79cd13be357-9493314ae9bmr1452404085a.37.1794670762825;
        Sat, 14 Nov 2026 07:39:22 -0800 (PST)
X-Received: by 2002:a05:620a:1a17:b0:945:c430:1c09 with SMTP id af79cd13be357-9493314ae9bmr1452400285a.37.1794670762326;
        Sat, 14 Nov 2026 07:39:22 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:21 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: qcom: QCM2290: add the Embedded USB Debugger
Date: Sat, 14 Nov 2026 16:39:03 +0100
Message-Id: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MT3cLkXCMjSwPd1NIUXQvDVEODNONEi1TTNCWgjoKi1LTMCrBp0bG
 1tQBgwEv3XQAAAA==
X-Change-ID: 20261114-qcm2290-eud-81e10f3a8e5f
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 88ykGXzuqKlQ1Rp6CCfXJoInG4a9186O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX9+/i54EuSfhv
 mknjYLoIl2G4qXeL8xDzNZvMabzzNvB7TLTzThl89qM0YXbuIEnJGVxze+vvA+Eefphm79g4K2X
 Sxop877bo4+WLE6b9EWt+riAMCd/u11n/q4e7tM9nVsMNObpk1KVRhE5MtJxtstPK7cKlpylDaV
 cLjDjo2kbu+HFxlQScGxPdjnU6eXV0Xfs7/fkTYF3CD0UDm0cRBdiUNWinauGkt+lfBOSkV9E/m
 DpuY3ujJge+R8qMMSpMkOo6TDZvv2Qw1gbrn5+C9StJ5qytar6z1AZHKFafCwrVenxdt8qGlVmT
 DCq3yYTPyjaCW+GGOkJ+3fMWuJ91lsoAlVC2jY8UbCLDZK3GRjPqvs9E4CEVOgLtQW1tffRpn26
 KuFjTF69K00fQTcDB/C3h5yZK0x9hgsep4I/kDfXwlQqgFM1vR/ROmp/R9RVv6yRc470liBCn7/
 2gpLOX9ybFontzHFgTw==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af880ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=b45o4kL6AAAA:8 a=EUspDBNiAAAA:8 a=rVLXYBqpOHlN8aflTEgA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-GUID: 88ykGXzuqKlQ1Rp6CCfXJoInG4a9186O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX6U81026qQS39
 Met+GUjEjLqk0IkvOWiba6Z5tNjrsTIlv4zoplZCHDPIFI+24Izjj7S1hokF51uPa3uKkd6DHD7
 Cc/DTZt6ym68+GrppNhkFFuuZmFnMBc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140062

The Embedded USB Debugger of the QCM2290 is the block the SC7280 has,
with one difference: its mode manager ignores the enable (EUD_EN2)
unless the TCSR register TCSR_APSS_SPARE_REG1 is set first. XBL_SEC,
the secure part of the boot loader, does exactly that when it enables
the EUD itself: it sets TCSR_APSS_SPARE_REG1, then EUD_EN2.

Patch 1 adds the compatible and describes that register as a third
reg entry, patch 2 has qcom_eud write it through the secure IO call
like EUD_EN2, patch 3 adds the EUD to agatti.dtsi and patch 4 enables
it on the Arduino UNO Q.

Why Linux sets the bit and not the firmware:
- XBL_SEC runs that sequence only when the device's debug policy (an
  optional signed image that enables JTAG) asks for it. Without one,
  as on the Arduino UNO Q, the board boots with both registers clear.
- The stock TEE (QTEE) does not set the bit either. It allow-lists
  TCSR_APSS_SPARE_REG1 for the HLOS secure IO calls next to EUD_EN2,
  with the same policy (write allowed when secure boot is off or
  debug is not disabled), i.e. it expects the OS to set it before
  EUD_EN2.
- TF-A does the same on Agatti [1][2]: TCSR_APSS_SPARE_REG1 is open to
  the normal world in all builds ("this register only permits EUD to
  be enabled"), EUD_EN2 in debug builds only.
So with either TEE only the driver can complete the sequence, while
the secure firmware keeps deciding whether the EUD may be enabled at
all. Where EUD_EN2 is refused, enabling fails with -EINVAL as before.

Tested on the Arduino UNO Q (QRB2210) with next-20261112 plus the board
support it needs. The A/B runs use the same kernel, with and without
the third reg in the EUD node; without it the driver only writes
EUD_EN2, as today:
- TF-A, built to allow EUD_EN2: with the TCSR write the host enumerates
  the EUD hub (05c6:9500) and its control function (05c6:9501) in each
  of three enable/disable cycles; without it the writes are accepted
  and the enable reports success, but nothing enumerates in three
  cycles.
- Stock QTEE + Gunyah (secure boot off): with the TCSR write the first
  enable after a fresh boot attaches (two boots); without it nothing
  attaches (two boots). Reading both registers back through the secure
  IO call shows them taking every write. The USB controller node was
  disabled in this setup (Linux cannot program the SMMU under Gunyah
  with this DT), and there only the first enable per boot attached;
  re-enabling after a disable was not looked into further.
- OpenOCD's EUD adapter attached over SWD on the TF-A setup (earlier
  build, same enable sequence). Not tested: RB1.

dt_binding_check, dtbs_check (qrb2210-arduino-imola, qrb2210-rb1) and
W=1 are clean. Elson Serrao's pending EUD rework touches the same
binding and driver; this series does not depend on it, whichever lands
second needs a small rebase.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55733
[2] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55964

---
Igor Opaniuk (4):
      dt-bindings: soc: qcom: eud: add the QCM2290 EUD
      usb: misc: qcom_eud: set the TCSR check register before enabling on QCM2290
      arm64: dts: qcom: agatti: add the Embedded USB Debugger
      arm64: dts: qcom: qrb2210-arduino-imola: enable the EUD

 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 19 +++++++++++++
 arch/arm64/boot/dts/qcom/agatti.dtsi               | 33 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  4 +++
 drivers/usb/misc/qcom_eud.c                        | 19 +++++++++++++
 4 files changed, 74 insertions(+), 1 deletion(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261114-qcm2290-eud-81e10f3a8e5f

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

