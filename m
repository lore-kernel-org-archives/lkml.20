Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A606C41DDFC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064858; cv=none; b=ePhhE5U5hP2TL6Xne7I8DzqV0d6HF74RBBFobPPLIHG0Cxx4dx7G7gTL+UznwKsBcL2/gx7i/gh9+YQU1JTr5ir9MSFg1HxpL+r5gSip4YrxPtE28WcMtk2lUfAEVp6iZ75XjrCgq3fiT9EJNf8s4MqlMcq1U1qjp6K2jQemOXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064858; c=relaxed/simple;
	bh=4m2du3hgT4GR5DvDaR64vT2WqTaNnm7oa6ZvyC5SLCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNoAiQLb63KnIHSl5b+0R6kmGnIqIjzRkyB/z9AByE1BkDOEkpetmqlALdb0fcI2YQtIHoG2V59TEPaEWhc3AqiRHgNDzCA1/AEVWm4lNtUzzrGfCxVHIKB0boJmoZoW/Ie8Lo9K0H51nl3POtaTopCpCwfioQlwhU+IfdW9uZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOPhqr58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/POK2ib; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOPhqr58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/POK2ib"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7C1ZD1980018
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ep+qvWrcnVbjtwDmimEQJq0arBzRXiRVSsy9QV64YfM=; b=kOPhqr58M7gceaFb
	hzlvB0svdSgKkKZk7b8/OUT7/BmKlUYhQZ3OMIXSvaVEE6FgU7pUYfeG4EUA4Sg9
	LtpbcUvLQ+Zj9Lw1Pup85g0Uh0gQiZBWd66/WSMLva6uIGFpf30VmZcrMv/VT+0i
	MUoejGpy6fqleKbyHmdKie3NNp22agQ0/HI7Z5HiYlAEi5zsaDvT/0sWWmcnZjTP
	YvMdLtsjs40Y5+H8cK2hAm8fDjaC1ePclgYAchwmpyz6MIhQfQZU+/VLWkxwOfVq
	A8Cv2QqNtp58wbftsOJJBEQk3oPlrlmXVFMa3fITbNsftTgCxjgHNwlxoc+QPl6g
	Phtrow==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0ht9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:14:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so3250570a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790064847; x=1790669647; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ep+qvWrcnVbjtwDmimEQJq0arBzRXiRVSsy9QV64YfM=;
        b=g/POK2ib026oXpUb7mQNBjmHrToF9a8vVqxqEXIDg7MGZFO0RFHlrb4zh7czJQLWRm
         G3QtY/zPuBup2rBfX2EgKF6rlgGSVXClq6NkhsmHPuNKFT7vEkfZC8BWKyx1AeG8UFm4
         o1hI9VuyXlVv1U4Fzq5D582zdzTflTblr7xvW+mPPSuX6MXNi9R7cGQhOsJLzreW43BV
         KF6I3eoULNOJ5y/W/uE6dEGgodFWyPAm1BMe1duYkKocQ8bGvVKsxbrVbPtXJrzlcSBF
         oncp9YMsFEXQwwjydeMffRIYmX9ZQ3S+MHYY8sii8hHMxWDMjwxRVYDzLpBTs5tp/Rxq
         rq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064847; x=1790669647;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ep+qvWrcnVbjtwDmimEQJq0arBzRXiRVSsy9QV64YfM=;
        b=V1YV5KgJfi2jEEik38EfwGzHVy1Xdq40DJVhc28g+0+jaPfn95MTxQVMCfGi6li6rx
         W37x/ZIG4VRE6JjSvtcvuqnc1KoCYzq0lU3T2ElVVQRhpuqBMxHn3Z8IJFudytwr0Bju
         +DfKsyJa0I2RJaHNQiSLAUIsQMLfxDMlLPjMa6BhOFEYvxls5LI81g4cwK9u8VYIVj4X
         msTsKoYwffusm5rb9cLLWJ1/g7rSb30VtjxnKEw19+zUKP982NArJBBOEn9KAVR5BTgc
         IClZJm8FIQIpIlD249FlOMXql8hsOjUNwoQMwpFIMhe38C7kziHOtvuqste1QH005jjh
         pLvA==
X-Forwarded-Encrypted: i=1; AKwUvBwRvKFkNQoGeAxIIpaAVBeOvPURH7pkbw5F8fNEh1L/SAGKv0e/WAlfFHoplp6MmZrR87V4FE1Kg1m5MkE=@vger.kernel.org
X-Gm-Message-State: AFuF++lwKmMqoNDLkmY6rjf+SVLMd34l4Igs+EoEBbzeN7icXgArkbvd
	oAia7+aHw+7WHUOLKi5ds1uU8ZxxqfYkmM2mwDyaLxcokBkYDtirtdCIRa9UVIdeLoII9tCdbmf
	PSrgFki3AjNDYVRrYB1T5cpmUrn2wGE0rIZV3MV6VtsMUvXT24g6yHBcK9wL7ADZETsM=
X-Gm-Gg: AYBFou1QmWiTMHnUg2zqwky2KUuLdQ04mNJPnW9ASYwm/ZI7Gjh9s7NMkHLRKYr6Pem
	n+pK6wJ7ipuL/vnDtGzFjCXo+d6stNNxAfcam+KZW4Zrvbp0zCagdzNiHBCoomUiixNB6HB1qz5
	krSXfxkVJEQQ5lCWUT9Uea9/lBfaNwa5Q8nSiD4rwabMX3SiyfjVrzB0v7LZzz1ZVkO86DdEgBf
	1Oni53JhzA5QiL86tbZLoGJxotWfmACQC5OzT2laEXKx1vWf7qFQ9gkdDMrRCVVf2la6KfDwUSm
	z1C8T8anrfcI7uESlUIL/y8YZZTWwvncqgqJ5uwoloZNlYB8Byo9940ahh9MroDBpgv3mmfTlz+
	tWxZuc25bdhqYVxlGrATpqRYXvAHa8eQY50RyriavOA==
X-Received: by 2002:a05:6a21:3a94:b0:3dd:a196:3091 with SMTP id adf61e73a8af0-3ddec80d83fmr438631637.65.1790064846970;
        Tue, 22 Sep 2026 01:14:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a94:b0:3dd:a196:3091 with SMTP id adf61e73a8af0-3ddec80d83fmr438584637.65.1790064846273;
        Tue, 22 Sep 2026 01:14:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f294d894sm5341693c88.2.2026.09.22.01.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:14:05 -0700 (PDT)
Date: Tue, 22 Sep 2026 16:13:57 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/6] Add PCIe support for Qualcomm Nord platform
Message-ID: <arI4xchgg0ym4fzm@QCOM-aGQu4IUr3Y>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1gOhtAd8Ag1PwpWKyNKyXoQffFRiTd2C
X-Proofpoint-GUID: 1gOhtAd8Ag1PwpWKyNKyXoQffFRiTd2C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExOCBTYWx0ZWRfX7TIyCCk3X1RV
 X5n/Pjd3nwzU3g7XWX5582ijB2LIcuRkuA3uQGXF5qadZ0MUlJ/xm9NeOhUPtQsRVzj8Lc/IgBp
 eoL40VAHcZIjQ3pxjZUWkozB/ikeVPmrGvQWGe6RzdwKA1yW50zDBXVNj3HYsjQfh2SwChXtqZS
 IXvpOsNFTt0pa7cfaNlQmOKncg8HQimZCYbvXQwPG/Bk0DGQ7xrlFpH81c9N2KpYBP47gQ6M1eF
 jqKQqyxze+k+fOCDDn+a6tvOdESRzqILg/6dE7PIAQAm3BMJlVQ0MEstFDlm/RAr1+mzlFPMfUe
 3AKXwYgfS7D78W8NS2qQw/gd0NSn15SsqiXUxFpmgQ0TvgJv8VJSN9VuqZJqR8sXnNdhpktq6gC
 WzciPRjS0BdjreE/Fm9kI4XkwwJjQA6Lp8mmAmyKh+vKi4/Ig3vAJ6NNsZE1Be0EcM3/7Mm52Mx
 uIouMcuSAo8gaV/g2Ug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExOCBTYWx0ZWRfX1IQrcVpAEuT+
 lr/mqN9dTnrdbesETd5oNEyAEjqyjcQ513Ufn50kpApUbhKmmAFK5LOm+sczukLKtzwomIO4l6y
 K0bszl+h9I9QDR5gmGT7bEej6avWBnU=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab238cf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=1XWaLZrsAAAA:8 a=P-IC7800AAAA:8 a=JfrnYn6hAAAA:8 a=Arp2LTHWbRu_ztUwPq4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220118

On Mon, Sep 21, 2026 at 11:07:08AM +0530, Krishna Chaitanya Chundru wrote:
> This series adds PCIe support for the Qualcomm Nord (SA8797P) platform.
> 
> Nord has a single Gen5-capable QMP PCIe PHY block split into four
> independently-clocked and independently-resettable ports (A/B/C/D).
> Firmware selects the active lane topology at boot via a TCSR
> configuration register, and the same PHY block can appear as a single
> x16 port, x8+x8, x8+x4+x4, or x8+x4+x2+x2 depending on that mode. This
> is similar in spirit to the Glymur multi-PHY support already posted,
> except Nord's PHY registers are programmed by Linux rather than by
> firmware, so this series adds the PLL, TXRXZ, PCS and PCS-lane init
> tables along with the power-up/power-down/soft-reset sequencing needed
> to bring each port up.
> 
> The series also documents and wires up the qcom,nord-pcie compatible
> (reusing the existing SA8775P PCIe controller binding), and adds a
> CORE_CLK_CGC_DIS/AUX_PWR_DET workaround required to avoid a timing
> convergence issue in the PCIe power domain.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> To: Vinod Koul <vkoul@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> To: Lorenzo Pieralisi <lpieralisi@kernel.org>
> To: Krzysztof Wilczyński <kwilczynski@kernel.org>
> To: Manivannan Sadhasivam <mani@kernel.org>
> To: Bjorn Helgaas <bhelgaas@google.com>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Maxime Chevallier <maxime.chevallier@bootlin.com>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: shengchao.guo@oss.qualcomm.com
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: shengchao.guo@oss.qualcomm.com
> 
> ---
> Changes in v4:
> - Couple of nits in dt binding & phy driver (shawn, Mani)
> - Add proper description for link-mode & phy-cells
> - Remove soc node and address cells from example (Mani)
> - change cgc_dis_workaround to disable_cgc (Mani)
> - Split common changes and nord changes (Mani) 
> - Link to v3: https://patch.msgid.link/20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com
> 
> Changes in v3:
> - change the name to quadfurcated phy (Konrad).
> - remove min items and change clocks order (Krzysztof).
> - Factor out the common config and create overlays & try to use common
>   symbols for glymur and nord (Konrad).
> - create  qphy_setbit and qphy_clrbit (Qiang Yu).
> - and in qmp_pcie_exit() apply settings only when nocsr is present (Qiang Yu).
> - Link to v2: https://patch.msgid.link/20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com
> 
> Changes in v2:
> - Fix dtbinding errors (Krzysztof)
> - Link to v1: https://patch.msgid.link/20260825-nord-v1-0-7c02f2b8765a@oss.qualcomm.com
> 
> ---
> Krishna Chaitanya Chundru (6):
>       dt-bindings: phy: qcom: add Nord QMP PCIe PHY binding
>       dt-bindings: pci: qcom: add Nord PCIe controller compatible
>       PCI: qcom: Add Nord PCIe controller support
>       phy: qcom: qmp: Move qphy_setbits/clrbits/checkbits to common header
>       phy: qcom: qmp-pcie: Refactor common multiphy handling
>       phy: qcom: qmp-pcie: Add Nord Gen5x16 PCIe multi-PHY support

On Nord platform:

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
