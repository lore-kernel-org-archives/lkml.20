Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DD148AE1F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141241; cv=pass; b=o6voMIS4w5c2d3U3afFPP+E24MczVoq13rg+P7AW+LaN4hhGEXyyEXEOiGsCqTBcyRKa5mgXyC5SCYEVT+wUPtf2wqLjzlbRDfaY4rNBef49TqtC9s5vWY+3TvV7d2FeYbpOMEgxFNg4ytyMhX2NPm60UGIsycbAv5VT9yLlh0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141241; c=relaxed/simple;
	bh=jSbG3aFjNRvRvglCvIfgQax72pr/b4wGvV7pjDViZ0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWiHBZ31jPuv7fvsmvb8JCMWT6laFiEokqRaQDp/B8Fzgg/8PjSJXiADmjwUcFAZo24rZLQZHUdNqaQpVr9X4/HihTFr08oK4VAq+a8K5tdOxMQTmAIqxaRNTBSk/CA3ymBH4ASjY2B3iOn0HIVq0TbRI0tKnXwMrdxT3V21oPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUb9aTsd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxsa+ZkZ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUb9aTsd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxsa+ZkZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmAab222589
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rwhZbo5aLjtiDYX1mzkp9wLc7h/COgN//PfmC+92//Q=; b=OUb9aTsdXISgso5T
	eC2dvUM9d3yZ3dI24Fr1V7aix+9VQ/FWGD5nsi1ZrWPXeMt6M1h95C71SWbFaSbo
	nO503MioXgVG1ih0HcKSe030MnY0/UKUI43l2uOnr4LPPgD3vlu9CLrn0b+bG9Xf
	Y300USjs+2qh9JztbWocUw/zKZDJ5bvTUVwd/bwHEJtxaneNj26e77FFIdq0SEPa
	U24b/2Mwl2oZ/BpkKiLPQmz1OzJjHhmVfgltAhPztGTlpFSaml73t4hjRBz9DpYN
	BMFR/KYGylrUO5gMyno2mhXu+RXEFBWOEhdeMeJrBmCNoKxFGqiMoR5IhdeCaKPl
	siONmQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdragjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:40:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so1175132a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141238; cv=none;
        d=google.com; s=arc-20260327;
        b=aVw/8paLfaUKB4i2gKCmAWxqcdJp7R7qYRk8xJWainWEhmvUYoGKnxeHhMVHH5cAX0
         /mI+rSyC0+vbAkvC4bbDsiVsxI3eBa9keObkNKzjlg8DgUt3AIB3OIWUNrCGXq52bdf4
         E6RqfnwHduJnR+4edbGMrEdc5aJTtTFjGiwjNdkKfPcjl9UeH0Hr67LOMMwlrxiPUgyv
         9jFeAFYaKSgsUz15F6Fs684Dc5nNT/GKzqF4pmK3aNSOo59hcJEYGhsBve+71ysjFIGm
         oFZUfjkA1OIhVWxkWXnvhqrnOfWPMS8M5PCAbM5mb9/MtITUtIpo9uG7Jxnagsp3XESU
         lyuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rwhZbo5aLjtiDYX1mzkp9wLc7h/COgN//PfmC+92//Q=;
        fh=XJHIML+mf7wwXSf7BBs05lrSe2SkmYXjlrJ16MxDAtg=;
        b=s3vzWMQZjrHnC0xDCmIZ32b+hqiHVCKMxwvLGQaqf0++hnzd8oCSp5mwa9vONYEzN7
         18nEJm5g47Bu2bSDC4J5Qia38lo3WMcxtu/4hwidpKugK6Wz1FYn9FIGQfh5Mh4ocNQB
         qaXwO37U/QAFg6BFs+A0vDWeoIDLAnBGdP+S6dA+mLIpy9DqihT0/lQD/GpWbYZML/6B
         mLEdhRKjbBqAb2yIfieH59t/DPIAwAdQMiqQ7S/3m7Yjh8BVfULWCnRPQBw+TTz266OL
         19wcBtHNK7i0O7Z143/Jy/tIcq2w6afQPKEq610OEj7qeG9p9V+fLQJWsK9/Iyf7KcoE
         Q7jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141238; x=1789746038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rwhZbo5aLjtiDYX1mzkp9wLc7h/COgN//PfmC+92//Q=;
        b=fxsa+ZkZWlmIEvTRVO7JVqJVnJaInP4VGG0psDSUNEHBESMB/p2u4r+Djb7J/D/I8e
         gGgXfjnHXOgqlVdWSnLddBeGapx65CUNx7dQG8NjxEv2GHQLUGzuhVxS3Ir0XjlV8KJn
         djBNToqdnZy7SaZy69rVJmhJ3FTLYoKs2d07xBy19N32RxD2Q9hPszLkWuwQCNF+6vLd
         pmBlEIRZXvMouu0gxKfJeeJ3IifJMqxw1N8iaGEitMuUlRLstjT9IM/hGnzqmjPzYTuI
         qUkaJyh0mw47tpr+HIGLfElFFqAmthUzMF8BDZY4hvK0YNEKJAA0GKeQciK/t31pmblo
         PF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141238; x=1789746038;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rwhZbo5aLjtiDYX1mzkp9wLc7h/COgN//PfmC+92//Q=;
        b=TbVOd6McqZOSfYbeqXyf8oT+kCHUvULy89O+3Z5HsKf+8AKfzpKMH5aNK50Dw49trX
         zzo99oi7xYOwquAueWECxOLpdjWyIO80JwRpzwb0PFa0G25F7HRDTc/Ty+NhRSJRKw9Y
         pbOJHeB8/mArUwoKryiVlWwTgWdO49YNoXuyimPnzirKBVO3OoXP0N2Us96H75IE4f9k
         Mh9V9skInXdKVNAYzi7W5NtcgxFAjoZwD3BfXymj4w+vXT+Verljiew1lbrNLDWn4OTQ
         O+BfD0gYkCVa97iN3L0H/X1Cu6hDI6RSEPjPRVR4E2PJMzduLx+81b8Vu1gvgG1r3QpO
         SjSg==
X-Forwarded-Encrypted: i=1; AKwUvBzIqnJBifxmAj+GXf24aMWDHm+pPpiixTHoSRyIYS1dA05jgxYn+H6qZee+uemNB8CDhmO4XeNHDhZrrmU=@vger.kernel.org
X-Gm-Message-State: AFuF++n4XJIUKBTTs+AxqI2siKJOClr48GHlZCnh9IWTgTOdXR5FCbiE
	RyCtFnH7EaLBg2iHJYXCuZI3dkVJyIj4qG1EyI/rf043j/lVQCCy5hHxET9ATRBFnNTIkUtXOBs
	+tf0B/Ff0hvvvxeLDQcWmZcG5bC1uF/8iKvE0K4oyp0GeNmceVkFkCVycYfB9BJwU+NbgA9sLve
	6urgdLpfXkS6jJ44ttE5F/ozR0ufpo59Rfks4vKfiX1A==
X-Gm-Gg: AYBFou1japi2nKTtz+CM9Rl0jrR1/Qn+hpb7MfHeBMxH1CHbpfqheWZxIOmgAulSLQK
	a76ubF+Vy33mH1XeU7m/5I9wyvUAov1oFQrKwHx8Znz5AsIn6Zs6Y4A2CfOMiL0m7vCbLaVfkSY
	n5a6PBLcopv0nMo6baceOb0lN8hy78+hl354qgIDD898hEm+u3HJdflAiScg==
X-Received: by 2002:a05:6a21:6016:b0:3d1:39e9:b261 with SMTP id adf61e73a8af0-3daecb013demr10117986637.0.1789141237834;
        Fri, 11 Sep 2026 08:40:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:6016:b0:3d1:39e9:b261 with SMTP id
 adf61e73a8af0-3daecb013demr10117921637.0.1789141237396; Fri, 11 Sep 2026
 08:40:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901184828.15653-1-tanmay.kathpalia@altera.com>
In-Reply-To: <20260901184828.15653-1-tanmay.kathpalia@altera.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:40:26 +0200
X-Gm-Features: AcwNN1UjpdCBRqChgBhbCl2kStXBAyPFr9IkrqKfFP-Qp3GjYbsgqmQxMbpF7eo
Message-ID: <CAPx+jO_6bH8i5BV=64i=dLdi2CVwiu1wceXcqWB14ux3FuX9Bw@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] mmc: sdhci-cadence: add SD6HC support and Agilex5 enablement
To: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
Cc: linux-mmc@vger.kernel.org, ulfh@kernel.org, adrian.hunter@intel.com,
        krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        dinguyen@kernel.org, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: YrMQwwbIerS-8Ff8hMDSzrMsZQsJUA4s
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa420f6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=yBYpec10AAAA:8 a=_gfIGWHmEWhiKiydougA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=zbxmTX4fiVD2UiCe4Dha:22
X-Proofpoint-ORIG-GUID: YrMQwwbIerS-8Ff8hMDSzrMsZQsJUA4s
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX28Q3ioHDmzIg
 eSvCaQau5lHHwvMdT4Bm8Ej1GNW2icooYDHvqcYyRc9rlMTjSFVqfCw7EOpgJcoSAXTu/bHes+R
 WarUNQafjZW/Jd6hrgcD3REodyRuvfw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX5BE+7wO03jZz
 3OfuNRfUmzWy39/MlilE/6plyvL2v6SiZ+W2IO19O1dZjtvqqgW31bfAWbNgkzvrp1qSxaLgtKM
 b3KEagQMJkAMCTu9nMDUZLCd/s6AF1KLJPY4Vtc1tPA25ofNkBC2g5hsNlp854sxMjm/E0xKuEM
 MkTAJ19eF6qWcQBSJpF/2fIfSymi/V3YgEFHFI49WuspQdPLkdFpUopZft07thizQ4AD28aHUYB
 QMEmdrzGc2z0DLVhqyyDJ9S7pKhRYuPq5D7ULdIOeJ8OTUboq3C7WdeqTlRE/M7RPjCI6YMI+Au
 HLO/xYot3OMSIfZ5bjyJclOH8Zfydg1gupCkiAsROQ5aO4iYkBrRzXPeKWLEvqIqfH1ryuxtIbI
 FTs4/wdYSGuCOVbIIiQEZwQv92st9C7nAE8eRGPX7whB6QH+j2M2QZlUt6htlnmIhrh5/uTXIrF
 gj7LRKJ52Q0hpZn5vdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110218

On Tue, Sep 1, 2026 at 8:49=E2=80=AFPM Tanmay Kathpalia
<tanmay.kathpalia@altera.com> wrote:
>
> This series adds support for the Cadence SD6HC (sixth-generation) SDHCI
> controller and enables it on Altera Agilex5 SoCs.
>
> The SD6HC PHY architecture differs substantially from the SD4HC: it
> requires dedicated per-speed-mode IO cell timing parameters and a
> DLL-based delay line to achieve correct signal margins across all speed
> grades from Default Speed through HS400. These are programmed through a
> new sdhci-cadence-phy-v6.c file; shared driver infrastructure lives in
> sdhci-cadence-core.c.
>
> Note: this series depends on commit ab45ecfab540 ("dt-bindings: reset:
> altr: add COMBOPHY_RESET for Agilex5"), which is already in mainline via
> the reset tree. It is not yet in mmc/next; apply or merge that commit
> when building/testing this series on top of mmc/next. The previous v1/v2
> reset binding patch is therefore omitted from this series.
>
> Board DTS files do not enable the SMMU; that is provided by commit
> 10cf797f3f8a ("arm64: dts: socfpga: agilex5: Enable the SMMU") in the
> SoC DT tree. It is not yet in mmc/next. Apply or merge that commit when
> building/testing this series on top of mmc/next, otherwise the SMMU
> stays disabled in socfpga_agilex5.dtsi.
>
> Patch 1: DT binding
>   Adds a dedicated cdns,sd6hc.yaml binding with SD6HC compatible strings,
>   clock/reset/IOMMU constraints, and PHY timing properties.
>
> Patches 2-5: Device tree
>   Patch 2 adds the SD6HC controller node to the Agilex5 SoC DTSI as
>   sdmmc, left disabled.
>   Patch 3 enables SD card operation (4-bit, SDR104, 200 MHz) on the
>   SOCDK OOBE board with GPIO-switched IO-voltage regulation.
>   Patch 4 registers the intel,socfpga-agilex5-socdk-emmc board variant
>   in the arm/altera binding.
>   Patch 5 adds socfpga_agilex5_socdk_emmc.dts for eMMC-only operation
>   (8-bit, HS200/HS400, 1.8 V IO, 200 MHz).
>
> Patches 6-9: Driver
>   Patch 6 renames SD4HC-specific functions and structures with a "cdns4"
>   prefix to separate them from shared driver paths.
>   Patch 7 encapsulates SD4HC PHY probing in sdhci_cdns4_phy_probe() and
>   makes every of_device_id entry carry explicit platform data, removing
>   the silent fallback.
>   Patch 8 introduces the SD6HC PHY driver (sdhci-cadence-phy-v6.c): DLL
>   lock/bypass, per-speed-mode IO cell timing, tuning, and HW reset. The
>   common driver core selects between v4 and v6 PHY operations based on
>   the SDHCI specification version reported by the controller, and
>   reprograms the PHY from set_clock and set_uhs_signaling. SD6HC clocks
>   are requested by name ("ciu" and "biu").
>   Patch 9 adds the Agilex5 platform overlay under altr,agilex5-sd6hc:
>   40-bit DMA mask for the SMMU address space, quirks for
>   CAP_CLOCK_BASE_BROKEN, PRESET_VALUE_BROKEN, ACMD23_BROKEN and
>   MULTIBLOCK_READ_ACMD12, .get_max_clock set to
>   sdhci_pltfm_clk_get_max_clock, and an init hook that asserts and
>   deasserts the three named resets together, keeping exclusive ownership
>   via devm so they stay deasserted for the life of the device.
>
> Tested on Agilex5 SOCDK:
>   - SD card: Default Speed, High Speed, SDR25, SDR50, SDR104
>   - eMMC daughter board: HS200, HS400
>
> Signed-off-by: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
>
> ---
> Changes in v7:
>

[...]

Patch 1 and 6-9 from the v7 series, applied for next, thanks!

Kind regards
Uffe
