Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514407;
	b=JihA7Thme6iGeKiuyNmiL+8oOrH9iU8tSZHVVcTqQ/aWnugHI+osEHoN11RRQo3yCCjE
	 WDepIOlfhcRxGPrNZN59nZhUqqJPE+b41LsZgSxvX+KbBwUcUBQGW4Xy6vZ/CxiXU1XoS
	 p5Y1+vvLMD6eja3uoZ2T7x0rA8c7X4OZDCMee4D9U3cSSzXjbOG+dbsYrwfYXj8dDoRhs
	 dO8/t/KRHD7/vaS7TT1VksKi5esJnZQdsHZZxVXkJ1R/UaeyMe0yNtJpsK8Ss0DN8/bqK
	 V0Bk867zx7elmiTTdHtAJfygFoVmY+96AD+XvEIBthhznmmuayvvr7QqP+Ftr90G3yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514407;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=h4e35O9vinCVQ3Dvv8AyNcp+IPtrtbVDIcNsVfa87Fg=;
	b=DJTnkrnak713nKzrdIUXu/ldYBdHqBmNZaRxVHW/zocnCasTm6in+KUMoDPwFaUNG8L2
	 kRFqqUTTUXJlpqG/lubzX0R66P+iBKj3C8EL2X5+7H4bjAzhWueTKYoD9aVcQGQkUsa4N
	 EFv3NWkXDj6QNW3yZxRgMAK+f9hTAQ8R1tPHGrL7GXtPGfQ5zL35XOCEhw8qaCCJJNIG4
	 3UlybAkK1A/EcwOqGMQF0Q8vB1dgLd4nC6gg64wUPJRmjt05D5ncSeXdF07d+NBR67aSX
	 kdVa1I916AUYDrDAEHmnVJck5AfXaECLxMAR10o4eSmbySOy4/OphgAftq819wIxglA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=f5ZAn2ui;
	arc=none smtp.remote-ip=74.125.224.97
Received: from mail-yx1-f97.google.com (mail-yx1-f97.google.com [74.125.224.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39118606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39118606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=f5ZAn2ui
Received: by mail-yx1-f97.google.com with SMTP id 956f58d0204a3-677dbe051d4so3110532d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514406; x=1793119206;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h4e35O9vinCVQ3Dvv8AyNcp+IPtrtbVDIcNsVfa87Fg=;
        b=jf+Rhc88p0sozhtRKl1GOF1y9MMF8O/bz105OgFgP+jG7iM71xSj+h1v0rzA7NU5KZ
         RkVWWiGHZ1fG1rYr/Osnx/mjbQWF9+scCbyS+sWAZJ76ENgc9/hyE3Gjkls5PInPzX8/
         CC5ApMnjidNK6KtuNPfJBjn5+pYChhXhOAd850Mz7m/fsBTQc6Og4cB7drwPL1Z8OYXo
         lfrmpI+qfJq5smziArpjZ9jlKiQMNZ3gC2pHjBZhmZwtkbfW+ihUmVYb1OfrdCtp2dI8
         ocPMuOVTfVA2a4Pf3354UMfptWs99lAQgITWzDcRjzWAoo39ASUnNMkIbsS6u/M1PhYY
         MMoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgf/Ip7joNJmY/Dybxf3rBRxdW6qvouDtOkRODHbgt4SZRRvMlLIM5a0H5kTSCcmeOj9DTmp6cLaxNt40=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE6lseSLNe3qYQCXesuHGc9XEijsWrO3Pgz7K+t+tKYcJesSHC
	ofLR/ZkW41V7llsj7AIIsVrwWWA5eu7xh9rjyb8gW2fwlES5ivxVzl7qy3n2m7Ovmof1mYdR/1l
	KGy4T+YUZnxh05pBuMehMJIQCuYwQTXiu7i4w3cXCLm5RSrruZRyJF5TbCFHIv2QUfrlDLSKv3y
	bCTeV0TBseGr/52MHxvme3XpznWNeV7Uegcu6jat2HN5eCB2G8mOeyhqPKUV2Es4kbeSETYFkkL
	K2sMwE1c7RtfA6f7edQfAMp
X-Gm-Gg: AYBFou2OdFK1MbxvWo3Ge4Q0JlFcxXns5jUjWH42rpBVeMlyLGxL8foTBVuPp+MxMbm
	wYwXuRiOwuD+1RwDRBKYHfNUJ1eCzYCZmdrKq2X2V9jQpr4AZPpFrd1dZyfMYd/7tg4hcq4CQrU
	INAS2FqwbqYgiqNpeUcgIyhOl1YJZMQLxGNrvbyY92P9ulkBJMOhyeBPLM6wTPFEnyV3PDt5dwn
	rN+6f7Wc65egChhrM1f2jpy6lxCDvdA/sRAZMzbGpAIU+eYfStmMm/ratZDhREm20acUcTk4u98
	RHLIVhfODVSfrMaXRqxZYo1meDXf7xYDQozFHF2zPcNLdDkTrgpleDVf+bu8x9ZnuxNsPm4wbl7
	lY6Bl/0ItKYYdxB67HrcfLfSQ3eXS1CIzgu4D9kcrECHYzIs58Xdm27Pk9W8bCVgjCIzMWcEcJV
	vwhFXzUws+zWTEQoU0ZXZbUwqYbl2tB9n2MHpR5VNsi0c=
X-Received: by 2002:a05:690e:4393:b0:679:5b51:3396 with SMTP id 956f58d0204a3-679ca7ca9eemr1699192d50.44.1792514405523;
        Tue, 20 Oct 2026 09:40:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-679b1e26ff3sm247156d50.8.2026.10.20.09.40.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 09:40:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91be1227fdeso68067646d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792514405; x=1793119205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4e35O9vinCVQ3Dvv8AyNcp+IPtrtbVDIcNsVfa87Fg=;
        b=f5ZAn2uisPrO4JPbTpZIaiPAlniZ1m3q9gcugHsL9B2seyjs95OenZNxs2SH1v5lpK
         JwwESNmIE7wZUSFPrO2JYciOg20S8vnx2u08K84gP510xqGhqXaQMwGvo1AVKclmkg5n
         OfW//GcLbQK3bPZW2UAcjTaqdS4/cIWzECA/g=
X-Forwarded-Encrypted: i=1; AKwUvBxsyzgRqArB2enpBDhG/5zQ+3Eknv6U7CQRiU6EYhFBVqxRyNdIpU4u5fWLHiz/KN9xxCwGSxX/YbsbD8o=@vger.kernel.org
X-Received: by 2002:a05:6214:62cc:20b0:91c:5ca:801b with SMTP id 6a1803df08f44-91c05ca85ccmr31567626d6.24.1792514404544;
        Tue, 20 Oct 2026 09:40:04 -0700 (PDT)
X-Received: by 2002:a05:6214:62cc:20b0:91c:5ca:801b with SMTP id 6a1803df08f44-91c05ca85ccmr31567116d6.24.1792514403938;
        Tue, 20 Oct 2026 09:40:03 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10bb221fsm2310886d6.20.2026.10.20.09.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 09:40:03 -0700 (PDT)
Message-ID: <14d6f296-c117-4f72-a5a6-a4e97fa32a0f@broadcom.com>
Date: Tue, 20 Oct 2026 09:40:00 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: iproc: Skip BCMA-attached controllers in the
 platform bus driver
To: Semih Baskan <strst.gs@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, bcm-kernel-feedback-list@broadcom.com,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20261019065249.552-1-strst.gs@gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261019065249.552-1-strst.gs@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/18/26 23:52, Semih Baskan wrote:
> Since commit 767012397976 ("ARM: dts: BCM5301X: Describe PCIe
> controllers fully"), the Northstar PCIe nodes under the "brcm,bus-axi"
> node have compatible = "brcm,iproc-pcie". bcma_bus_register() creates
> platform devices for the children of that node before it registers its
> own cores, so pcie-iproc-platform probes these controllers before
> pcie-iproc-bcma does, as IPROC_PCIE_PAXB.
> 
> IPROC_PCIE_PAXB sets has_apb_err_disable, so the first config read on
> bus 1 reads APB_ERR_EN at offset 0xf40. The report in the Closes: link
> shows that read taking an external abort. On a BCM47081 (PCIe core
> revision 0x01) with a device behind the root port, the board does not
> boot, and it boots when has_apb_err_disable is cleared.
> 
> Return -ENODEV for a controller whose parent is "brcm,bus-axi", before
> the driver allocates or maps anything, so that the controller is left
> to pcie-iproc-bcma. The devicetree stays as it is. The check does not
> depend on CONFIG_PCIE_IPROC_BCMA, because a kernel with only
> pcie-iproc-platform does not boot on the BCM47081 either. On a BCM47094
> (core revision 0x07) pcie-iproc-platform enumerates the devices on its
> own, so there a kernel without CONFIG_PCIE_IPROC_BCMA loses PCIe, as
> before v7.1. CONFIG_PCIE_IPROC_BCMA defaults to y on ARCH_BCM_5301X.
> 
> Tested on an ASUS RT-N18U (BCM47081) on a 6.18 kernel with the
> controller/iproc-bcma changes backported. With both drivers enabled,
> pcie-iproc-bcma binds controller 0, the BCM4360 behind it enumerates
> and the platform driver logs nothing. With only pcie-iproc-platform
> enabled, the board boots without PCIe. Without this change, neither
> configuration boots on this board.
> 
> Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
> Reported-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Closes: https://lore.kernel.org/r/0dcfb2db-5536-465a-bee1-afe160535748@broadcom.com
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Semih Baskan <strst.gs@gmail.com>

On a SmartRG SR400-AC which is based upon BCM4708:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>

Thank you Semih!
-- 
Florian
