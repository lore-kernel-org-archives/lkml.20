Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D3B48C8D2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787855356; cv=none; b=XqBcF+nHKzpYQn3M5Tgsq5DLE8ZI0A+gw9NMUs/lXJshYs8RkUrv9f6ovzFGldpJRskqaXljK+uCgwsaEBthmJnanbu4ukb4d7xrmCHbRWa5l5VaZDW+ZtElVsVzNuJ/ovPKYOc+c9dTaO9O2E/XV7UsUTikROB1BZoEMTBjAYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787855356; c=relaxed/simple;
	bh=Bvlk6a/+ZYUQ3qd8DQywcR7qXIrmuptJ04plHRpcS30=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=O7wgVZ7KUulRrYnElWbAthBkhpbwBkKy8zadqM2Tdnhksib2FTf3LNnLwpT9RdpS2rZm3KIzFvoRfeF9BieIIzPzFSokkkUmhXs1yD6mX/M5Kp2OEqqClkYmxRAy7TzsHi0UztDM9Fq/KOz4YF1+NKEa9f1CvIsJB8BQGpH6KYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=ev41sxC6; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="ev41sxC6"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2544ff970dso27319866b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787855351; x=1788460151; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uvanX6LwER3+dYc3eyM0edZztrpqWdRZ2jTMJJO+V0U=;
        b=ev41sxC6uAa0y8mFGjPrBybUnoxf0r5qWNSL2x36GqNa9mYdj46UDvqEzpLkd4Ox3n
         enaEJnqbpzXpvIGT09pls3BGOTmjK93xAMRBvTGuizNa9gqPnodajEhPXmdHL/ppMyS+
         uh209Nkkae9raKltbTZY5FCeBYoGMzYt7Hi5YUdq+RpLzuLTFPkJa/749so1TMZpZO3X
         zdCdhSPOcjmmtogS0BJUBEgo0CUAurpU4WzXyPQaTMehA73JDz3P8a89cWSZVszUddvh
         C16YsQBADMZEILSDSAHhHdH+cTFJQUjyQ54WEAjH1KDbPsxCuQd4BkZ8b6Wzppfsr2lt
         VcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787855351; x=1788460151;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvanX6LwER3+dYc3eyM0edZztrpqWdRZ2jTMJJO+V0U=;
        b=CMSsndJTeUaZ+wi7aQvVkCzZqVY8kaD9gyE3Q0NXLUgqCPrbthxCXJbmHXyI2GRq04
         ce+NAPtV2H6loYjn9N4oxDzXGKy3GfKIG/zOWL3T4kOkkgM+2LznH8YR/N9r8WoTTReC
         bxE6exYkx4dRIFHQfPYtIytSoJtuOlwOCtUWbN+l/bZ5bPH+c1uh1GcxwMEvVwpSh4Tr
         nD2zb2aeg1KFTpKVS2bi8vQf7tM/xdnSrB7yd6L+/yYLWDP8mZ73DdaCECS2oYHuz+H2
         +b0P/8DenHEWJ8flfiqDAFXOLxbinsFmGfgvJOwoF09ncIf/uxZOpX0XxCDLJScLB7yq
         ESVw==
X-Forwarded-Encrypted: i=1; AHgh+RovfygzaE3gDJJqUtSnwYchOuNDPX5k2EnDY1M6xalTxVsTo8iiUGEEXM8+qbYXkUCzeE5YN6ajK7/PY2M=@vger.kernel.org
X-Gm-Message-State: AFuF++nb3hRS5GoKICFgK+3ZwV4jqlMsn4X2cBGtLZ75vS1xde0gGviu
	Fcn0KsEDIsDZ3+ZNeDtiQBbsvYUuZuRIqHH118cwwlKWgI++F5+QMu3PrgTWT1GQUw==
X-Gm-Gg: AR+sD12Q+UrifVW9AJV1b6ttJgTSfm14v0bjlQ2qUUrqn7+3hW9TFg/w8fdtI4X6pMn
	rPqUXrhieXXYh8Q+ulUrfFEp1/GFyLLMXoNTfvAzcJq2R11iAaM+9XGJ9Fhp+PZLcEbP73yL7GI
	DMz7BbIXFvqhCaYp2uQXv8OB58M9Da4OhCqKoaNbRMj9R7xL/ZJAwGXz6kuhLLM3KF7va2BymiU
	IvqSHoYazF+urXF1LH4Iwz8Hskaeur19oSGiVVQtuvbuNtt523zCQcPmx1mzQPNPJN4VSwSikkL
	L9lZ3mTGrCntVdUfQPa9F7rafrJwmszo4RN9UfeegJdq2H8l+QuPcy0rD3IzHJGPAQeF0RfhIbU
	VPF8OZKNZvLYF/Mc/4WpxuDoYRgXI1cz+iQmuMDnOz9aLN9vZ+yDMz+eD7v6in9GZpY135O+nY1
	hP+zSqB7WzrGhTGyMGO2O7ey/Tq9S+BK8h3TvuEGm/mbedUVyWSR0xM6eVxoXLt9F3OCOP
X-Received: by 2002:a17:907:c19:b0:c12:9b93:61fd with SMTP id a640c23a62f3a-c2556c2bea8mr46389166b.6.1787855351489;
        Thu, 27 Aug 2026 11:29:11 -0700 (PDT)
Received: from localhost ([185.213.155.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68desm1116779366b.10.2026.08.27.11.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 11:29:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 20:29:09 +0200
Message-Id: <DKZXTSZPJMY8.XM7YYCVPT3EP@9elements.com>
Subject: Re: [PATCH RESEND v2] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is
 supported
From: "Michal Gorlas" <michal.gorlas@9elements.com>
To: "Frank Li" <Frank.li@oss.nxp.com>
Cc: "Richard Zhu" <hongxing.zhu@nxp.com>, "Lucas Stach"
 <l.stach@pengutronix.de>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260827-l1-conditional-imx-v2-1-40b324aa2a94@9elements.com>
 <apBvfYOnCHfl7Zu9@lizhi-Precision-Tower-5810>
In-Reply-To: <apBvfYOnCHfl7Zu9@lizhi-Precision-Tower-5810>

On Thu Aug 27, 2026 at 7:10 PM CEST, Frank Li wrote:
> On Thu, Aug 27, 2026 at 06:51:00PM +0200, Michal Gorlas wrote:
>> Since commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM
>> states for devicetree platforms"), ASPM states are force enabled
>> on all devicetree platforms. This causes PCI devices on some i.MX SoCs
>> (for e.g. i.MX 8M Plus Kontron SMARC eval carrier) to enter L1 even
>> though CLKREQ# is not supported (and consequently supports-clkreq is
>> not set in pcie controller node of their DT), which causes the device to
>> never wake up from L1.
>>
>> Hence, disable L1 capability in the LNKCAP register if supports-clkreq
>> is not set in the DT explicitly. For devices that set
>> IMX_PCIE_FLAG_BROKEN_SUSPEND, disable L1 on resume as well, as these
>> skip imx_pcie_host_init().
>>
>> Note, the logic here is very similar to 613f3255a35a, only difference
>> is that leaving L0s enabled does not cause issues (at least
>> I never encountered them myself when testing on the device) as its
>> not dependent on CLKREQ# being physically there.
>> Since there is already a way of specifying its presence in the DT,
>> the driver should be aware and disable L1.
>>
>> Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for d=
evicetree platforms")
>> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
>> Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
>> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
>> ---
>> Changes in v2:
>> - disable L1 unconditionally on resume for platforms advertising
>> IMX_PCIE_FLAG_BROKEN_SUSPEND (Sashiko)
>> - typos in the commit message
>> - Link to v1: https://patch.msgid.link/20260719-l1-conditional-imx-v1-1-=
a55a57915c68@9elements.com
>> ---
>>  drivers/pci/controller/dwc/pci-imx6.c | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/control=
ler/dwc/pci-imx6.c
>> index 98e1db751132..1fdcbcd2422e 100644
>> --- a/drivers/pci/controller/dwc/pci-imx6.c
>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1318,6 +1318,22 @@ static void imx_pcie_assert_perst(struct imx_pcie=
 *imx_pcie, bool assert)
>>  	}
>>  }
>>
>> +static void imx_pcie_disable_l1(struct dw_pcie *pci)
>> +{
>> +	u32 val;
>> +	u8 offset;
>> +
>> +	offset =3D dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>> +
>> +	dw_pcie_dbi_ro_wr_en(pci);
>> +
>> +	val =3D dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
>> +	val &=3D ~PCI_EXP_LNKCAP_ASPM_L1;
>> +	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
>> +
>> +	dw_pcie_dbi_ro_wr_dis(pci);
>> +}
>> +
>>  static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>>  {
>>  	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
>> @@ -1442,6 +1458,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *p=
p)
>>
>>  	imx_setup_phy_mpll(imx_pcie);
>>
>> +	if (!imx_pcie->supports_clkreq)
>> +		imx_pcie_disable_l1(pci);
>> +
>>  	return 0;
>>
>>  err_phy_off:
>> @@ -1748,6 +1767,7 @@ static int imx_pcie_resume_noirq(struct device *de=
v)
>>  			return ret;
>>  		imx_pcie_deassert_core_reset(imx_pcie);
>>  		imx_pcie_assert_perst(imx_pcie, false);
>> +		imx_pcie_disable_l1(imx_pcie->pci);
>
> Does l1 disable permanent after resume? should it be
>
> 	if (!imx_pcie->supports_clkreq)
> 		mx_pcie_disable_l1(imx_pcie->pci);

It would be unnecessary, the imx_pcie_disable_l1() there is already
guarded by IMX_PCIE_FLAG_BROKEN_SUSPEND, so we know that only iMX6Q
ends up there on resume. And none of iMX6Q DT's sets supports-clkreq.

Best,
Michal
>
> Frank
>
>>
>>  		/*
>>  		 * Using PCIE_TEST_PD seems to disable MSI and powers down the
>>
>> ---
>> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
>> change-id: 20260713-l1-conditional-imx-c2bfd20ae085
>>
>> Best regards,
>> --
>> Michal Gorlas <michal.gorlas@9elements.com>
>>

