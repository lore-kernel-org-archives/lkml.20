Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569350;
	b=xrhIJlxys4exIbQs1wAAZcFTpziZIGO+4W5/nw6bmaBTLv4zCZUEqC59LHk6fpv2Q0y8
	 gJKvP4QtEOxQe7TI4ptsq6Te5PWHnj/QCELRRhYhft4TuUtMonh30TkmmfQwYudTphEls
	 kI/nSv5Yqk0T+v6P8wWbCeGKgaDH8QSspunQG0CZjipOJUsmA4c9HpCUPjDtyMQSfEuOX
	 N7my5ykiphOvaEeQECF8WjF/4SanQR0mt3PmEPAYGLub5LhWF4ItPai/0lWrb+sEYp/Ru
	 UG7w+5V/xpUC1UJyDav7/9okYEvXZoBGKVOwZXYf1Xe50bdzutLAqpB4CQ/HxRM/mMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uOPG54pDdWNWWI0UImDPEIHhyYvJRCE6R7piuf/hkRg=;
	b=nAeyrgnRIi8mUU3LZsZISgg8FVX04f6QLemkD6pBSoj5w7J2tB8wkbX8lKO4TZ6iSD2R
	 CebbhmUwyjbFvLnWJNdy0mRkonW+JW/kNCQX3Ub+sLQAuTd6HZDyatPZr/q/CNVsgnoQ4
	 IpnJdJYvoXQiQ6BwHhNJrIY5kwDoWB7Wzwp/mhX/g3B+T6Ih7uY2dpOdLrAl9veK8Oq2q
	 eIRxCkuR6VE1Ucfs7nQ8Ns2YcBSf6tvkIh6NZvwLOWECyDw5x+GPM9BhiV0SiRJUIAKLL
	 yRwTmNzt063oeBqRxO5pm91UJNuMkEtfg0J5gjPo//+ZNVsoVxYKnq0u5CnDmucMXwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pNGT8eJZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=APXVNncy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CB8606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45CB8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pNGT8eJZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=APXVNncy
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADA55TT1163226
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uOPG54pDdWNWWI0UImDPEI
	HhyYvJRCE6R7piuf/hkRg=; b=pNGT8eJZ8CF4BzOKgfwpx9cpLJaet4U2b/8OS3
	A3uNmXNWdLMMwZ2RTTLUL/TWnHw+54vcOVOL0ArrxKvGvhHN+eDOMQ9PfQxEeFSa
	KAE05VY+8QkKdMCjKR7CaHMxIBuxVm4OMlY2O6RBVAjB7EpmVzx6RjTHK+kwkDRw
	25toPPjdCZuo8v9o/fhpjeIa90Y0jFm0P/QhRaGRuzVy5WypdEGvgrn8VNXhg0gz
	Y/wRu5D076xmW9LQU64geshL09rYxFcujonS2PWMuShw9a77khFsVMEs2zHXWwMA
	+npAdDatKd3zHT9MB7ked6homBiu98oMb8mYTWcbKDGfcCiw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g207ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:29:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1134384eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794569347; x=1795174147; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uOPG54pDdWNWWI0UImDPEIHhyYvJRCE6R7piuf/hkRg=;
        b=APXVNncyH5+dijVex4ZVH+xRZvUD38q+0e3gugFg6J62qtuSEZ4oiPVbPH+mdgCFgf
         +v7JwluLNJqEQdARNt2/cq893OfJ7shmCgHmSoN8Pn1S4hDuHlMlwrHYOKNsvIXSMm47
         SkZAa2W+WOltaC3uQKSKGKyCABlA5lrSDWX6fxhkAkXkQwIHZJIh52G7Tj4pvwGNZ6B2
         N68nugX412GCiZC27/izIMIjpANl92HkMqIczVLDM1HycA9yiTjAoqvLnTiSbc7b6yqE
         5KWZDlhcJAKz8pIkJFLQhKN9XwQeP59Z67QTCTxgHlVO4Ba+2kV7ZCnfMGkEgrIknZr0
         r+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569347; x=1795174147;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uOPG54pDdWNWWI0UImDPEIHhyYvJRCE6R7piuf/hkRg=;
        b=kcn8aV61MfbiStW7npUmZe59mywrAAZMJ6ywWkv6PDYSEHAa/kFzd/gacqZbtilsrA
         FtgdKBl0MoKoNukt1CN3DWEPJUF/rlMJcLf3FNEVWzjjKiti3At2g78GsQvrTeLXOxjZ
         BWE4wdHvPueQ+btCR4b7ZBv5nP3Y9nyvx5PKx4ZAzSsGO4r1rJ3R42BSJO2dZpTAo3I/
         SQnzKgu1ujpXbKCdKfj1VlzDkGNHsb9JCKXh3G5JjXYGlttwF0ZR5J63wBN5kZQGX8cT
         M8HA2I9H4YaMZWPfXWyBUshK5nhUCHNSVSU5jR2HvSEwrTIELI/sRlwb0zhrwdPFLuyY
         vuwA==
X-Forwarded-Encrypted: i=1; AL+hErEsVJb6qTO+wLJhwZXBGSGRJwbGrySbmdDc/MPUY/OVq0qeIdrxdR+J9EAegRo0v/D7F7yc1KZ/XX5wpxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z96KauoF/CaYWS8RIskZZ3574m8pwWA2cqtzMCx9pcNPG51ug/t
	HzPKMsBxAz3HpNRTAFyOP5cbMCkrV0G9Q0CgCWOV8Tya5i9JefBC5DaOj5Iz6CT4GeztMSOYPb0
	oK0uC9zhtwQKAb5OgNag4tuimMwpZhlR/0NwC+tZZgEDt9GQzNDu3hz1Kfd2BKMgsXbM+c9rxTU
	g=
X-Gm-Gg: AYBFou0gBhoLSvIY3MdySHM5GKF/bzRc7IrLm7QjaAfUPyl/pFkzKsmH5+1zPyXuatO
	T6tESRV0uTVmbWTV2xw0H9avyXg+mWYC59wYtjwa5QEqz/c7GvI1zwsufVccv+JZcB9kuSKIS1e
	BwbE03KADfbJvNxcjRHYSJSOzu7ICy0/bhXduK0fGxz+i2+7DOOKuQPo+qjh/l54rovC1fQvHwU
	zZ9NugeX6fG5/VV9OnT1L2J25aD3QXUa6nEgma2PrPmUsz9TY/lkz8EJ4HuusyrU0p3q1WB7x7W
	6fYVXWQT9wihJ4/WPt/htsT752OloNZTc3CBXazAVuhajueETf7pZSY7cCVl06HYb53L05KSso4
	ormcSnHNQB0gl+CCklLi9v65p/hzEotQxvEE8/VR+t9pVp9uu6lzDf0NcaG3dTeHSjVTtxa3Y8R
	/2zF0pi59T9w==
X-Received: by 2002:a05:693c:8816:20b0:36f:350b:3838 with SMTP id 5a478bee46e88-379671247e7mr1977135eec.31.1794569347330;
        Fri, 13 Nov 2026 03:29:07 -0800 (PST)
X-Received: by 2002:a05:693c:8816:20b0:36f:350b:3838 with SMTP id 5a478bee46e88-379671247e7mr1977112eec.31.1794569346720;
        Fri, 13 Nov 2026 03:29:06 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm7342924eec.2.2026.11.13.03.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:29:06 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add support for LeMans Draco EVK board
Date: Fri, 13 Nov 2026 16:58:56 +0530
Message-Id: <20261113-lemans-draco-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHj09moC/42OwQ6CMBBEf4X07BIKBMST/2E4tGWRGmixC0RD+
 HdbiAdvXjZ5u7MzszJCp5HYJVqZw0WTtsZDeoqY6oS5I+jGM0uTtOAJz6DHQRiCxgllodVG9HA
 ICaTT5j6PwGUpy6I9yxQz5o1Gh61+7SG3+mCa5QPVFJyDQgpC/y6M6sLqJyPcgqbTNFn33psuP
 Hh9S1X/lFo4JNAoIbHKW56U+dUSxc9Z9MoOQ+wHq7dt+wB2fL9LEQEAAA==
X-Change-ID: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Kishor Buchi <kbuchi@qti.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794569340; l=2102;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=9JHI65o4N+P1Y1EWl2jlx8W5cI+jtPQXJIohhY7Rnow=;
 b=MEC/P9qfuN/Rdg7X2QcwPJhCMAjNawIUHeIeT8WzvrAl5Cu7gCFNDXhq25FFKkSNkeWOCWOlC
 YXoICX8yVdyDeOBUafRs63mQ15FINpxRHuhtN7RgOluGUWNu9bDC0B4
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfX4rWpjbX84wXu
 L51iogrfWkAUEl53nBNhodFJx2M4biLRCE66AqCXs9gAgUYwhN9ZlNqVlXHE9iaEW1acmuZ3ek5
 VuArzGEuajoRtbpbqmnJKvtLhUY4RWE3vC1PbkUSA8+1t3wERVwqTa/7lcOSNkGa1x1EmkLOtP1
 L/rOVMKqxWKLAKVBs9nhYxz3Qj2Em5lZQNmhI8hon+q4kz+Qwid0sv2PzC07jSsT9jzbrHvZbtA
 zIbOsbPQUueQ7+win98+1JE29zLCPTS3IeXY+C+NbpjsTX5BmSkdmOGfCvuFnmwgA2ipH4GuOhg
 NCdB2y9W8AQuuGd/3oW3cSbNtfRh5Tx7omNohKV2EvLhMzAuYnjx52R5ZkLjcXMr/s2Z2C1zch7
 vz8zdifi/53jQ+m3RoXkqGJdgcsVJt009NayN8rCe2dBuFA8uPyjkvJC1v51mLXU/AZCQrlizzy
 tSUK5TNqbaEqb1wwTuw==
X-Proofpoint-ORIG-GUID: DTkaRS_rbmhqkY68TsR4Sf2xFhpZAJhy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfXyey3bV6hFlxF
 WCNhrm0m0iAn+mDYX8jJi5RvrUVcctExZn1nAynXakM4rE9E6L9Pm9ZjhWD2yRNp2hywBBGlpyt
 JaFW/PYIl8Zprjm/uKEWG8J+wFxJSOw=
X-Proofpoint-GUID: DTkaRS_rbmhqkY68TsR4Sf2xFhpZAJhy
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af6f484 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U-ZJO_i5hC5E2wvnxUoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130045

Add device tree support for the LeMans Draco EVK, an evaluation kit
based on the SA8775P/QCS9100 SoC targeting automotive and industrial
use cases. The platform consists of a System on Module (SoM) paired
with the Draco carrier board.

The LeMans Draco SoM integrates the SA8775P/QCS9100 SoC, three
PMM8654AU PMICs, UFS storage, USB 0/1/2, GPU (Adreno 663), and
essential connectivity. A dedicated SoM .dtsi allows carrier board
device trees to reuse common SoM peripherals without duplication.

The Draco carrier board provides board-specific peripherals:
- Four DisplayPort outputs (DP0-DP3) via MDSS0 and MDSS1
- I2C GPIO expanders (TCA6416 x4, PCA9534 x2) and EEPROM-based MAC
  address storage on i2c18
- Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
- ST33HTPM TPM over SPI16
- AMC6821 fan controller on i2c4

Changes in v2:
  - Sort DT node order: move tlmm block after i2c18 node. [Dmitry Baryshkov]
  - Drop unused sub-node labels ethernet0_mdc, ethernet0_mdio,
    ethernet1_mdc and ethernet1_mdio. [Konrad Dybcio]
  - Improve dt-bindings commit message to explain the two-compatible
    SoM/carrier hierarchy. [Krzysztof Kozlowski]

Link: https://lore.kernel.org/r/20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
Gopikishan Thawre (3):
      dt-bindings: arm: qcom: Add LeMans Draco EVK board
      arm64: dts: qcom: lemans: Add LeMans Draco EVK SoM platform
      arm64: dts: qcom: lemans: Add LeMans Draco EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   7 +
 arch/arm64/boot/dts/qcom/Makefile               |   5 +
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts   | 543 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi  | 401 +++++++++++++++++
 4 files changed, 956 insertions(+)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3

Best regards,
--  
Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

