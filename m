Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692731;
	b=iZGpw8S2/0U4yETGAQ9TOwN4zmdLEjof4hZ/cfcf31BdRg666anEbRru4+CEsKy703My
	 EiwjWI/r4AFmjmz3S5gRxF2tsE/lnlFdnX+PFnwBW16LqS4rch11BRBW9j4ShNevEkHjR
	 kk2abitgC61qM88TitCLSSPFzQEX+/Hygp5jr2Saxju/BZZiw3g/nnQZmB8PHs5NciVkR
	 aJu8Rh8XooLxxGlhhQFRdiJ1YHVpyZJzk9QHu0qoi9IedGHng2M3+d9Vdh9TaLzbKBVxZ
	 Wychf8RU3nDWsYzrvZU/DAL6kYMoS/KxzW8KGvgxS6WFjvTg7wTAHXUeGQ+R3wKnB+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692731;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=14bHShu2iPXe36kFNXnmMY1PSKPIdcxdfamaZqMSzpY=;
	b=djVRBjYzI5SBg20O8sQ4+24bEhsFeX4MmJAlWiEZAENVeoXZ7vJS/MPwVGr0xvRaKcF6
	 sXOJDibEXD3s8TwXPjAwHMPJz3Rmvewf/3REK1wRNFDke/kiIeF93Z4yY308cpqbDpziM
	 9Del7oXGD+DQwxrhQPRSRr5xhgE1XeiPJ3dF84iqFnVnvmQggffezxVj+6pL2s43uLf8g
	 FhrHvsG4H10Y9Tqf6vgdm7rDWkEUmYfa/QVBIatpWhzudVVT+6+lFp2WZUpACGtgz8qdd
	 q5lfKS70zR8fQtIRm4+l8HQSW+2t66KIbVQ/aZYOwifJ/ENIYbVU1W2B/TpJiVxLiGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4C6606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C4C6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A470668AFE; Tue,  3 Nov 2026 08:58:45 +0100 (CET)
Date: Tue, 3 Nov 2026 08:58:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robson Cassiano <linux@robsoncassiano.software>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexey.Bogoslavsky@sandisk.com, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] nvme-pci: add NVME_QUIRK_NO_SECONDARY_TEMP_THRESH for
 WD SN740
Message-ID: <20261103075845.GB3882@lst.de>
References: <WnzOhxjlW7w5jwpSIQmUzrvduOStpoX2h3FS@robsoncassiano.software>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <WnzOhxjlW7w5jwpSIQmUzrvduOStpoX2h3FS@robsoncassiano.software>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Oct 30, 2026 at 12:05:13AM -0300, Robson Cassiano wrote:
> The WD SN740 (15b7:5017) reports two secondary temperature sensors in
> the SMART/Health log but returns the 0 and 0xffff (Kelvin) sentinels
> for their temperature thresholds. nvme-hwmon exposes those as
> temp2_min/max and temp3_min/max, producing -273.15 C and 65261.85 C in
> sysfs.
> 
> Mark the controller with NVME_QUIRK_NO_SECONDARY_TEMP_THRESH so only
> the sensor inputs are exposed.

Given that this is an older device I suspect we're not going to
see firmware fixes for it.  But given that we had quite a few devices
with issues like this, I wonder why nvme-hwmon can't detect these
obviously fake values instead and we could drop the quirk?

> Assisted-by: LLM
> Signed-off-by: Robson Cassiano <linux@robsoncassiano.software>
> ---
> Tested on the affected system, WD SN740 512 GB, firmware 73100004:
> 
>   # lspci -nn -s 01:00.0
>   01:00.0 Non-Volatile memory controller [0108]: Sandisk Corp WD SN560/SN740/SN770/SN5000 NVMe SSD [15b7:5017] (rev 01)
> 
> Before, on 7.2.8:
> 
>   temp2_label    Sensor 1
>   temp2_input    53850
>   temp2_min      -273150
>   temp2_max      65261850
>   temp3_label    Sensor 2
>   temp3_input    38850
>   temp3_min      -273150
>   temp3_max      65261850
> 
> After, on 7.3.0 with this patch:
> 
>   temp1_label    Composite
>   temp1_input    45850
>   temp1_min      -40150
>   temp1_max      83850
>   temp1_crit     87850
>   temp2_label    Sensor 1
>   temp2_input    59850
>   temp3_label    Sensor 2
>   temp3_input    45850
> 
> temp1_* are the Composite thresholds and stay exposed; the quirk only
> suppresses the secondary sensor thresholds.
> 
> The quirk also covers the other models sharing 15b7:5017 (SN560, SN770,
> SN5000); only the SN740 was tested.
> 
> OEM systems: Dell OptiPlex 3000, Lenovo IdeaCentre AIO 5 and Samsung
> NP750QFG-KS1BR (the test system).
> 
>  drivers/nvme/host/pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index 77317e5..4f1f10b 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -4170,6 +4170,8 @@ static const struct pci_device_id nvme_id_table[] = {
>  	{ PCI_DEVICE(0x15b7, 0x5009),   /* Sandisk SN550 */
>  		.driver_data = NVME_QUIRK_BROKEN_MSI |
>  				NVME_QUIRK_NO_DEEPEST_PS },
> +	{ PCI_DEVICE(0x15b7, 0x5017),   /* Sandisk SN560/SN740/SN770/SN5000 */
> +		.driver_data = NVME_QUIRK_NO_SECONDARY_TEMP_THRESH, },
>  	{ PCI_DEVICE(0x1987, 0x5012),	/* Phison E12 */
>  		.driver_data = NVME_QUIRK_BOGUS_NID, },
>  	{ PCI_DEVICE(0x1987, 0x5016),	/* Phison E16 */
> -- 
> 2.56.0
> 
> 
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> 
---end quoted text---
