Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663242;
	b=qYZf00VFBM3Jh801MI2qzUEximA7TQX2cru7ok5ppHfec5t+jeXmSFpH6hxZIvbgqjzt
	 MC0Tl4tyC0PBBk13vKRQJDZ8vHlGpjyzDrelarK2aE9Ja9EaBAe8HNQEGxlMxBO4BDzQH
	 uWAy4ZSrVSIL4GY4u8/JWB4Ce/d5TADLWct/mWvpq2JssNY5jC6MeuYgsQ0Frl45IPFzd
	 6YK6PEBZkdBWq0BWw38YUD7NGF1URv81CwgjVRFsEY154ahXOi1uF+N/s24kN2kTxXCaB
	 zqVNRuu4rhSEIlDh8fc/Zm3AsSdV1xO5KaifGppAePvSlohPSS9uHlsABoAhHYQjkrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rnPHK632tH4FVpZnbHmd+EQerd8GGJ2UddNabTn9plw=;
	b=zFJydBVYBvGovYIT8P7o65I+obdkYL2pDEd+jH6lvmX8peNJa/T0LoHO3AmtWrV3d6jg
	 BZ2T2SIls62oYcESw7A0sE/EPD1OA2KEtXYReLHrBzhFx8LDuT7c52qS+1K66kPrB/Wfr
	 dx8Tthg5+RHp/l73sC07wxqSFAaSQdYIumU9AAxiUiykhAnRmY7EI+B12b7YJpQvc/mI6
	 E5nFiigDSGtnqJUwHZ9CNsViFYeQLT3c0YKGWm7TM37VTfVjikC1GqgFOtcVsJjr2Ipfo
	 eyvVv4hqSWZFgH/iVkGAijgj+2QeDVbESnVr2uG9nNv/26ge2UlfEXOmOKS1O683Jzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WYIaXM+1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctEshNnj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697EA606A88A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 697EA606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WYIaXM+1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctEshNnj
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wCQA3716237
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rnPHK632tH4FVpZnbHmd+E
	Qerd8GGJ2UddNabTn9plw=; b=WYIaXM+1vSLaqL37AVJKscfW4URUcZcO7bpK35
	Mj9SsIFU+x7UIVgzBIeZjQrDynRK5oYlj0Isk3JswlmzimFoCuYUIy/VOaLaT0g3
	RAos6By/w82JKmju1Pk1RzD/ZZZJxh+xHDxVPW9dDjy0jf1uBHlpkQsv2uQCZdRA
	NgcnbcIu4l7gFOw/EbcKUSZbcXBUPkoLZqX1u7PtUsZg/Z/4rP2lOAjY1IG6y0CD
	iuuDYRmEaeQnY86n3mkWNE62hA6lh9Vka2hcdWdw5vzQxwt/jzQctqGp6oiumsnP
	fqNnle8/qKvfwDBP/sAAHeynAj/CcejKsLLRTMwMcPwftB9Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk20uax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:34:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91f0f4c70cdso8983996d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663241; x=1795268041; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rnPHK632tH4FVpZnbHmd+EQerd8GGJ2UddNabTn9plw=;
        b=ctEshNnjQ8Sg50Qz6IOxkziBI5emmlt7EEPx79LqVE4B/Z9q4FEaczQ086xndzCY+a
         Fq9exwQOA+qRRj6/RW9x3w02S3eqH1Z6pYVsdWJK4uRaJy0Bxx5HQFPKJSoxeyEfenR4
         OT4QHL/fB5/6y1oeLBT6rQWy/9VgT1XJyXw4aYm5zapRfO8nZNBuA11zSoSE7tVeAYUY
         pxAPVuLcJeSBHY1IVNJBmva+mh4pR1H9Bz/GUI4hmzJNSOA2IyJvQi9X3HqLOAzEKNG+
         a7twNC/tP8fstt2VJi3mnJaitF6m5bH6zsnUtrUqGfEWUBzRtmoA+bb8Nmw5o9hyy/ac
         v7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663241; x=1795268041;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rnPHK632tH4FVpZnbHmd+EQerd8GGJ2UddNabTn9plw=;
        b=ITrKOHnkpgPduA+MjaQ38VnMvXVRomjFqd1aCQa+s1wcBdpTleMGX+4C51D1AhhhEX
         INUL7XkcMVByoANhsBd7Pt3dg7iJLX3uHtEm3AmaaaT6ymFMBaoggUQK9kSnorFpOxS6
         wBvnNQiBbOfxV2I9MbpdCuYbXkvNPJPvEpnjkL0Km3S8380dYFM+u2qGC9gK1Sgj4Gie
         bGvvLRA7R7m9CQ2rRVfKqUrwJmG6vowaxV4N1GL6yYVnt6AUmtXUqy6kQT8gdoJccJlH
         PvHElEdRwE0QmBrkXVaHwaRdDbUhEm6mM+513uX+PcCfWndbv3uCe2yNuTAJS4843diM
         Xv5w==
X-Forwarded-Encrypted: i=1; AL+hErEc3DW+bwkHEZEK0LrblgUB3XtNuowQ5+WPu+5X+GW/SZQA2an7CRzIntvgtVmYo5XQKacHi0ElB7MXhjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bS+giQg3ejoNNFibcO0FGB+hvWlbJH7bfvWk+TNhlwF67YYQO
	SisRn9pL1WL1aQFGUTW+gYN1+tqIJsWxKk75msA+xDN79yBO8peA298mf9vMMgwKPlslvWTbv0p
	3KzuBMyrJ/VPLY96uVubcV9CDP97fXlC5MqKXJauZkglT8e38NTJLgVP8aFdr3il0VTM=
X-Gm-Gg: AYBFou0X52Z0sWfsPkmZ9dYF6jNG88I1/3ZSEfKUzui65gjZJ6XL1cpLn/WfSbIWKjS
	jnJkqNIKB9fnQuY8BqbRP4BRGwfoRiA2mPRkUmwXRgPtUZO5/3O7Fmu6kPktTOImi3FcuW4zmZr
	GaYmp1sbpp90NTbWaYXzIYx3gFwtHWnHIhlF70SBhE/arF92jNz0dIWiKdGydFmUPEwEQsjmXMc
	z0L7LZL+JaF3EdU+CFWO/AF1Ztxps1nMuGT6cJkmG3Fc7p7SbmZkcS62/iywBWhu1Nr5kDNhLLa
	AQAWFUZEJRLatca0HzwTrOZOchEVjdStRRTZSYJOGRG9CpWLNBiSrAWdeA8Thn4imQld5bzykp3
	fvDPNZL9INegDNjnSDm61Y9J3eJyy9y0uwy2ngge/Rs5Xq1ULGu1oSyh/WjJavNRbfcBzl4RGCc
	hsQQW30HUWBn2w
X-Received: by 2002:a05:620a:2855:b0:945:c1e7:d3b8 with SMTP id af79cd13be357-9494bb55a9fmr873276585a.33.1794663239635;
        Sat, 14 Nov 2026 05:33:59 -0800 (PST)
X-Received: by 2002:a05:620a:2855:b0:945:c1e7:d3b8 with SMTP id af79cd13be357-9494bb55a9fmr873272585a.33.1794663239108;
        Sat, 14 Nov 2026 05:33:59 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c236124esm2273578a12.6.2026.11.14.05.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:57 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 14:33:33 +0100
Subject: [PATCH] soc: qcom: geni-se: skip the program RAM on minicore
 engines
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
Message-Id: <20261114-geni-minicore-v1-1-a825dd549664@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBtQK5GuEi3CRptFGgoRiHdPW
 r7F/xUKZaYCi6iQ6eHCKXaoQYA79xgI+egGLbVRSk0YKDJeHNmlTCjl7IwfrbFSQ2/uTJ7f/7d
 urX2PetAXXwAAAA==
X-Change-ID: 20261114-geni-minicore-005c6f386802
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, stable@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: UuPF5w7kUQOO_GCCEZuPtUmhg6t8xb3X
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6af86349 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=fNIzXmLAtl3icGuUDBgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX9gV6MaQBgkZe
 gbB+3KdkwQyaWc4x+seO8b1glue7QjGnQwazM3VHc7pUjA42jWvD4So7GavMqSeD6A9wc/+0ck1
 MVpWssKHFvDSP26925r1RChzUd+fTmhe0GZ/MjrS3gOgc7KzwdV1zfY7hMSq/rh+R1mLLH2cgEq
 soSvsUkCNLtwoV6SxLWnSCLPj6MgL3V6qTKn1H4FZbkFU9VpbAfN/P+3aS1OwG8A7nNjKnEOOmS
 3/FaB/v/CIidJKgtCDb+8k5RjGmdCN/JmOvoJ42H2aVfjBJKJYgsNNO60LB+f+O5BhAg8+TR8DO
 rpr9v0OP7mmvXYMzAssJrFcSrkfGQm7nfSHwUXIN7DTywuTyBMUKm7dSYrcM9zUKOauzPxpqPsr
 G4dUivljKcXbCTvBm/gHbKGn4lMK/4Vgfs59TmU+rvOABrx9a9Ww6Zz4E1uS7dPoJGV9Wm6Cb0D
 Hu3HYrnopZO+5lovQLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX/mYji5PQFSeI
 BMalk4tlcFyikoauRnFG2amsPqTbq31ifnRVoiU+0KQiP+A6HLhbxgkuIi4tUgij0QeU7+D5saw
 iW1tMUQ5kXUKxTQk5ZIXshyEdTG3mKE=
X-Proofpoint-GUID: UuPF5w7kUQOO_GCCEZuPtUmhg6t8xb3X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140053

Four of the six serial engines of the QCM2290 QUPv3 (SE2 to SE5) are
minicores: they implement SPI, UART and I2C in hardware state machines
and have no program RAM. Their SE_HW_PARAM_2 reads 0xf000, i.e.
GEN_USE_MINICORES and the GEN_HW_FSM_* bits set and a PROG_RAM_DEPTH of
0 (SE0 and SE1 report 0x3fc and 0x1c8 and do have one). The loader
refuses every protocol firmware on them:

  qcom_geni_serial 4a8c000.serial: Firmware size (444) exceeds RAM size (0)
  geni_spi 4a94000.spi: Firmware size (442) exceeds RAM size (0)

On such an engine only the register configuration part of the image
applies, and GENI_FW_REVISION and GENI_S_FW_REVISION still have to
carry the protocol; U-Boot's "misc: qcom_geni: Add minicore support"
handles such engines the same way. Detect the minicore bits, skip the
depth check and the program RAM copy for them and keep the rest of the
sequence.

On the Arduino UNO Q this brings up the Bluetooth UART and the SPI
engine, which were the only engines the boot firmware had not set up.

Fixes: 522bfb4f33c0 ("soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate firmware size")
Cc: stable@vger.kernel.org
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
Tested on the Arduino UNO Q (QRB2210) with next-20261112, whose loader
is the same as in drivers-for-7.5, booted through TF-A so that Linux
loads the QUP firmware itself:
- without the patch the UART (4a8c000, Bluetooth) and SPI (4a94000)
  engines refuse their images with the messages above and no spidev
  appears;
- with it, both load and work (Bluetooth up, spidev to the MCU), I2C
  is unchanged, and the board test suite passes.

U-Boot's minicore support [1] programs these engines the same way.
Neil's "ignore invalid PROG_RAM_DEPTH when checking for firmware size"
[2] would get them past the size check but still copy the image into a
program RAM they do not have. Engines whose depth comes from the wrapper
data (the I2C hub, 803f9950a6c6) are never treated as minicore here.
Viken's pending "Leave resource management to protocol drivers" [3]
touches the same function and still applies on top.

[1] https://patch.msgid.link/20260721-minicore-v3-1-172e5f28138b@oss.qualcomm.com
[2] https://lore.kernel.org/r/20260917-topic-sm8x50-i2c-hub-fw-ram-v1-1-f49286d8c8db@linaro.org
[3] https://lore.kernel.org/r/20261025-gen-se-remove-resources-handling-v1-1-e81da6707b5f@oss.qualcomm.com
---
 drivers/soc/qcom/qcom-geni-se.c  | 57 +++++++++++++++++++++++++++++++++++++---
 include/linux/soc/qcom/geni-se.h |  6 +++++
 2 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index ce4de4917a83..1cc4788942e7 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1243,6 +1243,54 @@ int geni_se_resources_init(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_se_resources_init);
 
+/**
+ * geni_se_is_minicore() - Check whether a protocol runs on a hardware FSM.
+ * @se: Pointer to the concerned serial engine.
+ * @protocol: Protocol to check.
+ *
+ * Minicore serial engines implement the protocol in a hardware state
+ * machine and have no program RAM: SE_HW_PARAM_2 reports a depth of 0 and
+ * sets GEN_USE_MINICORES plus the GEN_HW_FSM bit of each protocol the FSM
+ * can run. Only the revision registers need to be programmed to select the
+ * protocol on them. Engines whose RAM depth comes from the wrapper data have
+ * no SE_HW_PARAM_2 and are never minicore.
+ *
+ * Return: true when the engine runs @protocol on a hardware FSM.
+ */
+static bool geni_se_is_minicore(struct geni_se *se, enum geni_se_protocol_type protocol)
+{
+	u32 val, fsm;
+
+	if (se->wrapper->prog_ram_depth)
+		return false;
+
+	val = readl_relaxed(se->base + SE_HW_PARAM_2);
+	if (!(val & GEN_USE_MINICORES))
+		return false;
+
+	switch (protocol) {
+	case GENI_SE_SPI:
+		fsm = GEN_HW_FSM_SPI;
+		break;
+	case GENI_SE_UART:
+		fsm = GEN_HW_FSM_UART;
+		break;
+	case GENI_SE_I2C:
+		fsm = GEN_HW_FSM_I2C;
+		break;
+	case GENI_SE_I3C:
+		fsm = GEN_HW_FSM_I3C;
+		break;
+	case GENI_SE_SPI_SLAVE:
+		fsm = GEN_HW_FSM_SPI_S;
+		break;
+	default:
+		return false;
+	}
+
+	return val & fsm;
+}
+
 /**
  * geni_find_protocol_fw() - Locate and validate SE firmware for a protocol.
  * @se: Pointer to the serial engine structure.
@@ -1332,7 +1380,7 @@ static const struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const s
 		else
 			prog_ram_depth = FIELD_GET(PROG_RAM_DEPTH_MSK,
 					readl_relaxed(se->base + SE_HW_PARAM_2));
-		if (fw_size >= prog_ram_depth) {
+		if (!geni_se_is_minicore(se, protocol) && fw_size >= prog_ram_depth) {
 			dev_err(dev, "Firmware size (%u) exceeds RAM size (%u)\n",
 				fw_size, prog_ram_depth);
 			continue;
@@ -1534,9 +1582,10 @@ static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
 
 	geni_write_fw_revision(se, le16_to_cpu(hdr->serial_protocol), le16_to_cpu(hdr->fw_version));
 
-	/* Program RAM address space. */
-	memcpy_toio(se->base + SE_GENI_CFG_RAMN, fw_data,
-		    fw_size_in_items * sizeof(u32));
+	/* Program RAM address space, unless a hardware FSM runs the protocol. */
+	if (!geni_se_is_minicore(se, protocol))
+		memcpy_toio(se->base + SE_GENI_CFG_RAMN, fw_data,
+			    fw_size_in_items * sizeof(u32));
 
 	/* Put default values on GENI's output pads. */
 	writel_relaxed(0x1, se->base + GENI_FORCE_DEFAULT_REG);
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index f77c3a47c3d0..e18e1edd9408 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -332,6 +332,12 @@ struct geni_se {
 #define RX_FIFO_DEPTH_SHFT		16
 
 /* SE_HW_PARAM_2 fields */
+#define GEN_HW_FSM_SPI_S		BIT(17)
+#define GEN_HW_FSM_I3C			BIT(16)
+#define GEN_HW_FSM_I2C			BIT(15)
+#define GEN_HW_FSM_UART			BIT(14)
+#define GEN_HW_FSM_SPI			BIT(13)
+#define GEN_USE_MINICORES		BIT(12)
 #define PROG_RAM_DEPTH_MSK		GENMASK(10, 0)
 
 #define HW_VER_MAJOR_MASK		GENMASK(31, 28)

---
base-commit: 011c427b6d209eaa944ac758a0924fc768244228
change-id: 20261114-geni-minicore-005c6f386802

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

