Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794400690;
	b=S65zAFn+bGgk27vmCshrw4zbbZ3hcRSsqYsYrwxp/ZwcAyTl0vMWvy9D3XSqc3e0zUmA
	 VUbjvligNapq9TRJINuYCM7dAO6DFE1A5YRPaaafYIi55b6tcWDTxnWnW4e+ijs8DeLhC
	 TKwEK4O2cMXkpau6qwDyESWXnhy8yEL0KVXr4bivH+riowbtWvFRiD93yy+J8OxOzfwyB
	 xniGMR4JE+t+N47EpfPd297RcV/m+XYhW+TYOaiTze8A4osCbrHHMpmoO/KYc5+DUzwC/
	 QSJ4qeSu09WOpd13dBX+FpuRgs0H6u8mWvUu0So/8fvBr3DAJxB9tnWUwBr5nJ3A5WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CW6quIFeGW0S9qeyAqZMpDVvXADn4a/wl2z3Q8pRkF8=;
	b=SpxdpUatY3DzVkZVT16sIFMtAiBiJQxVfKaU0BUtSasra9O+K9v1z9covIcu9gyqgwLn
	 Q5N7K97V8Nm6YLJrDl5OvcZrZZD2Q8N7CgIVCcxzcq6S87/jN9rVJ0XgFjcjCupHNVntv
	 kbXNVby7vMGx2em8pfBq1oXqW/X7IP+snax9L5E09SU7OroYMpEjkflNb/RLe/tI7j0KD
	 Y9ulytobN/RBOb7c7n/jDWqBYRX8hqSD9iCxNHAf89Yc8dfblRQ+d4D8gIHAMAVL3xnDe
	 wTApJOA/Ia0KI7TeEGQAw2IjB84gvaXOENlao90yLPzrKmoNZvJQP5lKBduHh7/4krg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VeD63yOx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pnkekkka;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8FE606A897
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B8FE606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VeD63yOx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pnkekkka
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYvrk3291897
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CW6quIFeGW0S9qeyAqZMpDVvXADn4a/wl2z3Q8pRkF8=; b=VeD63yOxGAGneCJb
	+1OVmdcm3sbOLO3FiSWOWVf3Rcx6n7sQdRgKzdGkgdM1vHUKyndr+2v63M0LDOlP
	3CYRtbEfSPoDXzlVlLqWHz2Fzl2c+il9F6NgSImqxIiIWs2z6TG/aCdCiyhkjvr1
	u2vNE6JoTUY1736ASKO8YZYME//8wvbkOXoG3rKijsanks2Y4tZHJP2rr1vqTvAw
	JfAarso25iY5tBqQo2YXziHA8f5i/EoV+jKuxQ/jU6uTYlkOVrwXpPCDVowFKXYx
	M+tvWdHAxgdxk+KwFvGjzoxQIU07c9Da4sTJBQLqVPrgi3wPsqREf0kKT70hp3ct
	DpwBMw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2gfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:38:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a05a4396d2so2563704b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:38:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794400688; cv=none;
        d=google.com; s=arc-20260327;
        b=mcpMXrFsrTCJYBueut5okPk6Y3ac1QGNIobcnzaRTup/S2dos40K1hX4XyMDPETwhh
         o/B6ZYKGdUHu4i1Uw589hElPTQoSEZQJ+DPpFf942I2erbYa5KRp3t+uzGcufKOeQyP5
         wkvlVLhK93ZvFdeX/cIZx1MlSiUHDjpmQs4vQ6LOiuRf10Xh3R6mlv6M7ZMpmrK3TW6U
         1xx+Ne9kMDN5wFYg58ViPHNAsu7nWA5AUqMyTh4YzKXEddJPnTfQFA6Iv9WNP/32TkVC
         EhgocqS6CXqjCuV1NI7wKM9f0fcNDrnrP2YAdBjF8QlYz6QBKrHwRWltwM0sO7x/6S8/
         uZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CW6quIFeGW0S9qeyAqZMpDVvXADn4a/wl2z3Q8pRkF8=;
        fh=FT++eXrmp4v39VGBaKs/9esdRTYDkdaDpHqdAUY3qd0=;
        b=kGz27y3lsu2iND8qjnXhrAKeY3i3Rx9h3RUpYIVY/0kD6zcovhCzSwP7dKXO+tfzMl
         7UfPT7wNpo3N4mlwiW3sLLYYJhFp5LcfpY6R1E7lUTgZYR3opQsumY7Q7N3w3V0e9WAa
         GqCl0KOCWwr5r4yYyuehdaLuOIA/w9yx3osj2LoP6nBOX5vQNDgNRFI16TPU0PzDCKy2
         kTCnZruj0mNVVozl/9TAOUejSSf2mBI0yWNJTOFysGe05I7j4VLLLOF1WCbwGjlpXqjM
         1D7rpO12OfYnTiRV3Hiuv1F+hr/FBuhZ7gYtQRlFYuEBah8pmwEZV+fKNZCOOk8fxxiU
         XSwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400688; x=1795005488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CW6quIFeGW0S9qeyAqZMpDVvXADn4a/wl2z3Q8pRkF8=;
        b=PnkekkkaQB3h6GPnABYsjjj0+9tL8k9trwl8JVWiuTSGIkJkbjiUBINRZ+0PbP8B4E
         2gTJ8CPLt/I3swhHDvSSPHzYIFjOjyqCNjV+9fY54YmoCBKnnTx4rXuW+bxjUYRW1OiT
         +Z9/vfD879O0gCwyBC16hpa1QRlz208ywElwOWOoSx3B5CDIjrSboXkHDgbTDz8YD7zL
         ERjkSCmTSyh2i9H5FbJ8GRGMnAJ013TCbvNgpPR4AlwsFtsUQzu3bsM0ootyYyk1qmkK
         jsvnIl43lWr9Nq/A64zVQGI8QGrbJQ1faqo28+zpuAt5cqXKzhCl6FJpb11Tt2+pSnc3
         AyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400688; x=1795005488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CW6quIFeGW0S9qeyAqZMpDVvXADn4a/wl2z3Q8pRkF8=;
        b=U4Jrvg7dnabC7GGQ4BaeMyNkVCFc95L8NtXVfaU6pGCd34VmELwJBmlOyCpEfeDwav
         81BtOS/HXNCoYRKact3ETR7qdrotUYx6AP87qqpN64/SLpc14GDd7aDCGZH90GwKAveG
         UV9HAZ6Fly7vGyB3efrUU8/baez+r91oEqZKL7nJPMk5YdWHojLM9xAv6lFvYA7PeGcZ
         VoyOUIx1IGoiH7gml1mJxaFO/pUDDqkMaixxBz+6MjZ1LFRiNV5pPxluzwAO1qepmbda
         OuYSXwpvyMp75ntmNjdwcyeclEN2avIriR1M5e82IK5JXVuQTMUSeiaCSE0rauvijWrD
         E58w==
X-Forwarded-Encrypted: i=1; AL+hErFyFwWEmTOpvGhU1aihmWsb3Sp5s5JbsRpmeoSiCJksWcrG5IykpAlvu4i25PBNztCsAervKJ6IQm5fzpY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OWdLZQBDec1dfVBf8KqEu4ndNLMYfiaKnBHpr8iXgsaCLU4mZ
	UhwhS+MUhM7huj/NvRikofPQZ/5QUNq/AMFRtvT1m5TAbb458uKmEhZ/NjdLpHgMbKvOVZdjBKA
	eDdLQN21cHWxQ93FH2H+xPnAsSrTtM4ga59EmRYqgzIVXbAqWCvBnLoD19Lzch9j5684ZSIBWru
	o4/NYFuvl7W/QdwTvMr32fT8WsjXVx+e+6iY99b/mZ1A==
X-Gm-Gg: AYBFou3zJJ/100Yac8pqvzbNMSeliicWq0NhMIhX1qoVJ+pV7rfP7II9Thd2UwHtVc8
	prvmToaFogufFfIy9FS90XEFPgydvykwJCb0d+prEnqloWtjYo179zZUlW0YaEWOfPourv1+QO4
	OBqlep0GR3Q84DRSN1Q/akz9pk//XblfZ+Eni3N1ZJgDFUmZA82XBUA5lUmQ==
X-Received: by 2002:a05:6a20:430b:b0:3e2:e6c:7d4 with SMTP id adf61e73a8af0-3f2febd5b5cmr2404190637.23.1794400688120;
        Wed, 11 Nov 2026 04:38:08 -0800 (PST)
X-Received: by 2002:a05:6a20:430b:b0:3e2:e6c:7d4 with SMTP id
 adf61e73a8af0-3f2febd5b5cmr2404168637.23.1794400687573; Wed, 11 Nov 2026
 04:38:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103101622.213425-1-benchuanggli@gmail.com>
In-Reply-To: <20261103101622.213425-1-benchuanggli@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:37:56 +0100
X-Gm-Features: AclHuK8k7mGhF9iBNdobqT-RXOYiMQvxs9HDSg1iTHFVCJcU0iDK-RWgmtY7uSo
Message-ID: <CAPx+jO8rBfADRej2meFUwjP7ZjTDYf-EWSW25y02O+6kYVxg2w@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-pci-gli: Add Genesys Logic GL9768 support
To: Ben Chuang <benchuanggli@gmail.com>
Cc: adrian.hunter@intel.com, ulfh@kernel.org, SeanHY.Chen@genesyslogic.com.tw,
        boris.chen@genesyslogic.com.tw, HL.Liu@genesyslogic.com.tw,
        ben.chuang@genesyslogic.com.tw, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX9LXGiuEMrvRh
 7PbX8Ii9Z5HRs6OZ8G+7RqCGCNYewyfyfnKMOpHJ/IT0QS1FWgfFt0RIruSM5ZaVMqgboMKPWMY
 TmtdA2/frhbafdMemqXL9rSShQBIY49qLJC/WJasv+aaS+G7C5ibGju5hDXjuoyU0j2kVpWHyMl
 BqsdPXXV/ejYDJpCLwsuO5UfVOaJzw3huXKB7x7+Ehuj0h7dz8BG8Y7CQ9uBKpr1b7pWrQCACnA
 kZmniB2Y0aFtZZnFs2Xz09CmqtTmFnWXrIePzJMhC4lUquT90ZnMed0ISYC2F1Ff4K1eVD2j+Tv
 LFZxt+RFrzaCkotSFZD/c62vKWVtBcf/LJ+mKtlTUdQR/zSGCmB5PDCEyLVeKT+boRmpSrW8J88
 JwQBjgbFG6tHIJdDxvVXl1cPDkhDOGhSu9JyDBBvXej3K1bhH49s1kX1p7v6grLhzbqvuZMF3TG
 PyQcA/Ubf7F2GexpmNQ==
X-Proofpoint-GUID: w7mZ21WZBTDLEKwwxJ0V7qT7diemzfNU
X-Proofpoint-ORIG-GUID: w7mZ21WZBTDLEKwwxJ0V7qT7diemzfNU
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af461b0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8 a=MTqqJCi6AAAA:8
 a=iJYJqG9Hh-plSMGQH8YA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=Ezp7Wq9ZhlihhAROVjRg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX6AO8ImHVVJ7U
 pkLf0WLbz9sPi1tbv7rErHgzTrdJLspgwoDYsfba5dsLBKMO291aOqr63S3BQmZ59QDGANOP4Dz
 Enyu2qpY0aRkxW9T9LKIZVftUfFg/fY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110050

On Tue, Nov 3, 2026 at 11:16=E2=80=AFAM Ben Chuang <benchuanggli@gmail.com>=
 wrote:
>
> From: Ben Chuang <ben.chuang@genesyslogic.com.tw>
>
> The GL9768 is the successor to the GL9767 and uses a compatible
> register layout. Reuse the GL9767 driver for the GL9768 by adding
> the GL9768 PCI device ID to the device ID table.
>
> Clear bits 2 and 3 in the SD Express control register at offset
> 0x940 when the driver initializes the device. This clears both
> bits to zero, matching the GL9767 default configuration.
>
> Signed-off-by: Ben Chuang <ben.chuang@genesyslogic.com.tw>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-pci-core.c | 1 +
>  drivers/mmc/host/sdhci-pci-gli.c  | 7 +++++++
>  drivers/mmc/host/sdhci-pci.h      | 1 +
>  3 files changed, 9 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-p=
ci-core.c
> index a9000f3bd419..db0417238131 100644
> --- a/drivers/mmc/host/sdhci-pci-core.c
> +++ b/drivers/mmc/host/sdhci-pci-core.c
> @@ -1959,6 +1959,7 @@ static const struct pci_device_id pci_ids[] =3D {
>         SDHCI_PCI_DEVICE(GLI, 9755, gl9755),
>         SDHCI_PCI_DEVICE(GLI, 9763E, gl9763e),
>         SDHCI_PCI_DEVICE(GLI, 9767, gl9767),
> +       SDHCI_PCI_DEVICE(GLI, 9768, gl9767),
>         SDHCI_PCI_DEVICE_CLASS(AMD, SYSTEM_SDHCI, PCI_CLASS_MASK, amd),
>         /* Generic SD host controller */
>         {PCI_DEVICE_CLASS(SYSTEM_SDHCI, PCI_CLASS_MASK)},
> diff --git a/drivers/mmc/host/sdhci-pci-gli.c b/drivers/mmc/host/sdhci-pc=
i-gli.c
> index b55618566d65..66452ed8cd8a 100644
> --- a/drivers/mmc/host/sdhci-pci-gli.c
> +++ b/drivers/mmc/host/sdhci-pci-gli.c
> @@ -245,6 +245,8 @@
>  #define PCIE_GLI_9767_SD_EXPRESS_CTL                   0x940
>  #define   PCIE_GLI_9767_SD_EXPRESS_CTL_SDEI_EXE                  BIT(0)
>  #define   PCIE_GLI_9767_SD_EXPRESS_CTL_SD_EXPRESS_MODE   BIT(1)
> +#define   PCIE_GLI_9767_SD_EXPRESS_CTL_DETECT_1                  BIT(2)
> +#define   PCIE_GLI_9767_SD_EXPRESS_CTL_DETECT_2                  BIT(3)
>
>  #define PCIE_GLI_9767_SD_DATA_MULTI_CTL                                0=
x944
>  #define   PCIE_GLI_9767_SD_DATA_MULTI_CTL_SELECT_UHS2            BIT(5)
> @@ -1354,6 +1356,11 @@ static void gl9767_hw_setting(struct sdhci_pci_slo=
t *slot)
>                  PCIE_GLI_9767_SCR_CORE_PWR_D3_OFF;
>         pci_write_config_dword(pdev, PCIE_GLI_9767_SCR, value);
>
> +       pci_read_config_dword(pdev, PCIE_GLI_9767_SD_EXPRESS_CTL, &value)=
;
> +       value &=3D ~(PCIE_GLI_9767_SD_EXPRESS_CTL_DETECT_1 |
> +                  PCIE_GLI_9767_SD_EXPRESS_CTL_DETECT_2);
> +       pci_write_config_dword(pdev, PCIE_GLI_9767_SD_EXPRESS_CTL, value)=
;
> +
>         gl9767_vhs_read(pdev);
>  }
>
> diff --git a/drivers/mmc/host/sdhci-pci.h b/drivers/mmc/host/sdhci-pci.h
> index f38f0bd4165c..bcae29f8d8da 100644
> --- a/drivers/mmc/host/sdhci-pci.h
> +++ b/drivers/mmc/host/sdhci-pci.h
> @@ -81,6 +81,7 @@
>  #define PCI_DEVICE_ID_GLI_9750         0x9750
>  #define PCI_DEVICE_ID_GLI_9763E                0xe763
>  #define PCI_DEVICE_ID_GLI_9767         0x9767
> +#define PCI_DEVICE_ID_GLI_9768         0x9768
>
>  /*
>   * PCI device class and mask
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.56.0
>
