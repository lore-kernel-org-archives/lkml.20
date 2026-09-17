Received: from mail-vk1-f225.google.com (mail-vk1-f225.google.com [209.85.221.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252294FD274
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664735; cv=none; b=SlmgDuU7j99WeeH4X5jPYT3eyVayo7G1hv3TSUVG9T7opb/AGZAI05vEtbVHWqlZZX2EHl+3AdVZ9Ej7Tz6nIqeiKdwrzD+NPzhaus9oj1n7AWoIomfDb6Yqa4IOzMg6A3S98nNUCNk2hznzXpEzhlTmbHkH1pMc0i8kQeNp+Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664735; c=relaxed/simple;
	bh=voESh8KNnZyYDqcPM7EScY57S21NUgKsPzeAuamylDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XgkLWGUP7VOLW294rQH8EJlX6lDQ9gyYKIRL6isyWIoDBKADmObvEoGigKeblvZL3qRH9bD/he5th3NC+7ogZWfP9PgB/5BR9Xbdw+TPYkb/SNFN2JtjhIW/3+iRxZS4AHc9mD48W1ViYG8vCRbaWyXZs4b757k0RNKGc5/Mr94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RrB6NCex; arc=none smtp.client-ip=209.85.221.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RrB6NCex"
Received: by mail-vk1-f225.google.com with SMTP id 71dfb90a1353d-5c9801823fbso174229e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664733; x=1790269533;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xZkIZE07OmYSk4DK1TncPSDCSBW3v5Bo/6rKnMUHhA4=;
        b=edJnrbfnp3V2fTovuh6zPAdoxvXEQ8t1xfP9Fz3ihmpk0oKtcg6m95ojgSuDtBUp9h
         IsibTWfhIKv7MsuXjzsjHeWo53UZ3NL92+Hy6830eJLL7/Ug6hbAlZfivJdYlNsz48KV
         KBCE9+HWstLW32I4IWBh+g+VL2z1HePdjSADTNGZAN/QRK1nZlJDkf3WQj31M01svRFf
         Anm7SrmIOtcC1y0Z3dIq3nUtpLlTFslkV43kptqGLC5pU4Ul/t86K4QvCmuPWZePuaOm
         8mk5xcvnPWlsTipO5FORHIXzOqDaFYpdINe/hfWTyg0VfxNMxfd6JE1gQOBx/j6SPSrH
         slPg==
X-Forwarded-Encrypted: i=1; AKwUvBxVRd0m6OtZ2KTZTsQ4BKN8ExK6h4RlG+LtLOrxQIw76GfDE8iALCI8LptclXLENEVQKqmK8KoRDJo6J6A=@vger.kernel.org
X-Gm-Message-State: AFuF++m3lIJJJsbPypBUlzziayo45ku5cEbS5mnkSipx5LfcMzPDfoIE
	YvNF4MHufB72n4aLexCe22vg2LUojKbXX3swDQbspOQnpdM7ZHi3u9ju3okYi9uoTnskpiK0lak
	RYSk9VGm7iM7J2jVul33y3HMn+aqAvyVM3kH/npXkv6PxI0J2WJJjYq5GaAhQ7OH6g9qwHqBlk1
	a0zBa8dQWvX29ZsDfs0ypBF5nJRBQhRaIHpu/l+kUpqBYHcmY0J/M/5j4IhhIu0BT0u7ii+gU9Y
	BDvb84jyMmrkggWyJaKvRia
X-Gm-Gg: AYBFou0yB4ju+1Gkz921m3QvCd56b9jyPFtN2Nr3ATf2lzGqHSWmaDLHbwH5SARoXo5
	6WvBPbDvWSZEwkxxikj2H8HMvjD+7+RbGbKFT04fPM5t3zqSWb86u7MB3YCoqpRVdBRz85B7X5c
	IP4YaM/FcFLN9cIC76FePju4XPtNaZB2k/b2MJOc0oBSy+YjobS+kTaPgf9t86hOusStTmvOJKl
	FeQ6cRlS/T/xga9DknoMax7MCeIn2ubdPvjGRRbWi9jomJ+BIG46mHybm8aB3vtwP/lwfZ/Q/f5
	n4JbXdDH+eQEDnIa/qGpwAL0JkA3MufAqQOhG2XRhpRzym7xmgFxk/wOYimj9y427PSh3Jl90FU
	8q2/4wOlcGWVCj8GPwQFnTxDhDAtYjeSIf2AZdtiwako6k6IuLz1vdQMn8QLCjzs8PxXi4PIWrx
	4TaogR7ySId9GBOUXKi+DpVyEfqrcZAMXrMUHdj5Na
X-Received: by 2002:a05:6102:2922:b0:7a1:f980:e938 with SMTP id ada2fe7eead31-7a1f980ec38mr2065066137.20.1789664732632;
        Thu, 17 Sep 2026 10:05:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7a1e201857fsm121205137.10.2026.09.17.10.05.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:05:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d001671a54so23310355ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789664731; x=1790269531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZkIZE07OmYSk4DK1TncPSDCSBW3v5Bo/6rKnMUHhA4=;
        b=RrB6NCexIQY3Vyp+jL5nef4kQvC0d72hwloBl4Z9TmZx9ZqgBmWrQQF68fd3mV/wPq
         r/AwOWETDzi+fESOYx8c14p26Rg37ejcG/dKDuR1AuJPcNBHg1yom1Lvf5ber+9jLuI0
         NTAziF1gNsEKX43vwEOa3YogAnLsXzi0inysA=
X-Forwarded-Encrypted: i=1; AKwUvBzSM6V9TlsJzfruWj7PXIl3PtseumcuqIgQiFmWw1KnDe9n+4Enm05uGggYv5Xp6JP2rYPKuigOWDqJQmw=@vger.kernel.org
X-Received: by 2002:a17:903:1b43:b0:2db:1f50:6515 with SMTP id d9443c01a7336-2dd8dc0f8abmr153789285ad.2.1789664731356;
        Thu, 17 Sep 2026 10:05:31 -0700 (PDT)
X-Received: by 2002:a17:903:1b43:b0:2db:1f50:6515 with SMTP id d9443c01a7336-2dd8dc0f8abmr153788385ad.2.1789664730579;
        Thu, 17 Sep 2026 10:05:30 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89eb7c87sm29904485ad.34.2026.09.17.10.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:05:29 -0700 (PDT)
Message-ID: <6ce4208a-3869-4eea-9ae1-06985c9774e7@broadcom.com>
Date: Thu, 17 Sep 2026 10:05:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] PCI: brcmstb: Put max_burst_size setting in
 cfg_data
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
 <20260911233541.1650895-12-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-12-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/11/26 16:35, Jim Quinlan wrote:
> Rather than ascertaining the max_burst_size setting by comparing different
> SoC IDs, specify the setting in the config_data structure for each SoC.
> Also add a comment on each SoC's encoding of this field.
> 
> Note: Previously, the max burst setting used for the 4908 Soc was 2.
> However, it appears that the setting of 2 is illegal for this chip.  Set it
> to 0 as (a) this is the safest (smallest) choice and (b) the 2 was probably
> interpreted by the HW as a 0 anyway.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>   drivers/pci/controller/pcie-brcmstb.c | 29 ++++++++++++---------------
>   1 file changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 047783e33ae4..8bca98e6f5fa 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -317,6 +317,7 @@ struct pcie_cfg_data {
>   	u32 flags;
>   	u32 quirks;
>   	u8 num_inbound_wins;
> +	u8 burst_setting;
>   	int (*perst_set)(struct brcm_pcie *pcie, u32 val);
>   	int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
>   	int (*post_setup)(struct brcm_pcie *pcie);
> @@ -1153,7 +1154,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>   	void __iomem *base = pcie->base;
>   	struct pci_host_bridge *bridge;
>   	struct resource_entry *entry;
> -	u32 tmp, burst, num_lanes, num_lanes_cap;
> +	u32 tmp, num_lanes, num_lanes_cap;
>   	u8 num_out_wins = 0;
>   	int num_inbound_wins = 0;
>   	int memc, ret;
> @@ -1188,20 +1189,6 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>   	/* Wait for SerDes to be stable */
>   	usleep_range(100, 200);
>   
> -	/*
> -	 * SCB_MAX_BURST_SIZE is a two bit field.  For GENERIC chips it
> -	 * is encoded as 0=128, 1=256, 2=512, 3=Rsvd, for BCM7278 it
> -	 * is encoded as 0=Rsvd, 1=128, 2=256, 3=512.
> -	 */
> -	if (BFLAG(pcie, IS_BMIPS))
> -		burst = 0x1; /* 256 bytes */
> -	else if (pcie->cfg->soc_base == BCM2711)
> -		burst = 0x0; /* 128 bytes */
> -	else if (pcie->cfg->soc_base == BCM7278)
> -		burst = 0x3; /* 512 bytes */
> -	else
> -		burst = 0x2; /* 512 bytes */
> -
>   	/*
>   	 * Set SCB_MAX_BURST_SIZE, CFG_READ_UR_MODE, SCB_ACCESS_EN,
>   	 * RCB_MPS_MODE, RCB_64B_MODE
> @@ -1209,7 +1196,8 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>   	tmp = readl(base + PCIE_MISC_MISC_CTRL);
>   	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_SCB_ACCESS_EN_MASK);
>   	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_CFG_READ_UR_MODE_MASK);
> -	u32p_replace_bits(&tmp, burst, PCIE_MISC_MISC_CTRL_MAX_BURST_SIZE_MASK);
> +	u32p_replace_bits(&tmp, pcie->cfg->burst_setting,
> +			  PCIE_MISC_MISC_CTRL_MAX_BURST_SIZE_MASK);
>   	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_PCIE_RCB_MPS_MODE_MASK);
>   	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_PCIE_RCB_64B_MODE_MASK);
>   	writel(tmp, base + PCIE_MISC_MISC_CTRL);
> @@ -1961,6 +1949,7 @@ static const struct pcie_cfg_data generic_cfg = {
>   	.perst_set	= brcm_pcie_perst_set_generic,
>   	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
>   	.num_inbound_wins = 3,
> +	.burst_setting	= 0x2, /* 0=128B, 1=256B, 2=512B, 3=Rsvd */

Not sure this one is much of an improvement, especially if we end up 
repeating the comment, also there is inconsistent decimal versus 
hexadecimal.
-- 
Florian
