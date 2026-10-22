Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690583;
	b=qpu/ig8QH4ODwilfJ58E5nS3VCHDTzYhvudHCdaY3U55Hg6p7HYHvGz1QjT+9aCt+8L0
	 ZOwVm3RnUv2vPTGY/kDBQpGakW4CwO3Pgmk9xRZUuspeDjR5roxRKDAvjFl9zuLPM97QU
	 lF/6iYnkpdZEWMcBrGl4MeAzm81yHkvVlDUoDKe/aVzZo/olT9BMQYX6bXSL9yt6t91HD
	 J5GRRJRtPDKnjIL1xWBMHWPGMWYgNXvOC39ak08b6QdBRbWg+dESgyc6saZGi26HESnhh
	 /Depiui9aXIEYO3HNU+um4343VMXVNXU7HYAt/sSzegd8u4EHyCDjn8UYD5oyJ/nprw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690583;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=aQ9LiTLbh2uxFCSppkL9rHsktv+7lwK3tJuZ2euHX10=;
	b=em7qo1UliF5U4AyDSrajAcwQEcwt0Pfa+fh6Xg1wJNJ/DDDfjFmQIUXv3a0F+EwF1heb
	 GlzLOYH/zjmlwEtIlYDmKMBnXrRAdkBplrY4wkaxOdPyQh9jXxpX9SaTAjRDOjypK9ssJ
	 JX1WM1qViG/aoI/7zYZh9KwUZvyPH0SRIQWYHdTXB53mANlw9jGMpsWToiegd2phtCFGc
	 Hln9W2WjQUse20Rywfrb+Xi/EzrfM+4+7v2c4dTbKk9uXK8mfc8yqPWp+Bzp6mfExVJCY
	 ZgBxOVWY8TllWkPV+DgNTLZEM+QDONyzECF5gVDRjgB+fC2M/QYSclYkc34yMEJ/61w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KkyuDElZ;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A465606B7AD
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A465606B7AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KkyuDElZ
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so51628a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690583; x=1793295383;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aQ9LiTLbh2uxFCSppkL9rHsktv+7lwK3tJuZ2euHX10=;
        b=lhCYS0V4DOuKn56lYsb5FFBfrpkZdLW/KXx/tda9aqp8EymJ8LDK6YvSCmjlC8oPEU
         R9gDLUAZ9NJEc3i5TdJi40KHl8Ma7o7XaiThhIwOBWCgiiSAEr+QCmmbzxENHt9iZmFI
         8e4fuk9LYH7Esvs11crU8cI04J8Hw3+FTFXBI8aGrjuH+qxpW0wwlraVLUu9nBKYTr+W
         z0VrIGYizDbiA9WuE1p7KBwgMCVhnT9UiNIzklK8No4p3Xswse77wkuhg4c9xsm5NJpx
         upteUvKd2W5cE+9pAj/8XmvJ+OmHTUwbm4/8DfzFjFlbSqbN0JqOnycbVZX+9qFL5FMG
         RvHg==
X-Forwarded-Encrypted: i=1; AKwUvBwUKFe+Z+pbTALt/y56hJlzEEEESRt+zPZ8xEOVJjWiziTDvVFRLEfKz2oB+TKW8hqzKTBdvuQV40S7HYg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpMiKmp+rUNvu8j91Hj4svKzNZbZh9qBfHppcH22jsfp/FjStV
	fkW3aQo9q1goAxDVymLPH0UNuVyj9NDv9jyqlW1Gw6FRHwydEoUijcohH83hJDuduGguBZAE2JW
	TkEnff/M5M3iseqA8MIYBK6nFxcYN0lyGB7oUt/diyTzpTnnHYUJkS8pUFO2Ajx1IHsRx1pJ+Ud
	Kt2Va6dl9DbAtdVy6sSM+Wd+Djj25AVFCe8YTSmrroGJmNY+2UkSoFemPDb8KQm6QqRo64FVIlO
	zDX9y5gLt5A9CRgmhBh4Bbz
X-Gm-Gg: AYBFou2XiGq4DjO6ilHzXcMXyim9ggcG6V3Bmg2iQBWiCMxJGCdQYcjiog1+TR3T1ch
	aMBzNcutoLsK+6w3SsooIpa+Kww7sk16Alm1qGH1ohmd4COr4fb/KVOcs8oeSvjg2oklOwt4kbi
	b/N6eyCTAa0KHunr5DlemzCyhZnQRBbz3speLx+DU3seAW7grozATTjoOeYecysHuzPJb1YSxGw
	paIMKQy7rsLn1/ll720kQu5fvhOTcOCfnm/q99+3SMln8q+ufvq6/JyykAZaQSXlr7jhOUXRH/7
	735z703VsOQePMJwWuueGYQOAmqr/hg9gACavtFAG2lRMCTpSdX6P5/heyEN0tmN7+0KZv9J+1G
	daKW57mlWcUHtNDIt119Vu5G/DeV3NVkowunIoNXT7TGobfARvztXYRzIO2+azRBytgqTBtV01a
	J5PQ5PLml0rmmQQVfUXYTYB0w0gbnHNMOJRxGJSOQb
X-Received: by 2002:a17:90b:4d83:b0:3ac:7449:40b4 with SMTP id 98e67ed59e1d1-3ad86f017f8mr5332941a91.45.1792690582654;
        Thu, 22 Oct 2026 10:36:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adc9333399sm20167a91.3.2026.10.22.10.36.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:36:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88c768886a6so83399b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792690580; x=1793295380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQ9LiTLbh2uxFCSppkL9rHsktv+7lwK3tJuZ2euHX10=;
        b=KkyuDElZruiEKTF+WYjfqgvZyRoqKAU3KXLhrjI4RhGx7qMYnlqLln2+jOzDreR8aA
         KrVhJtHPL7uKHI5QWkq4K4xwfmJneyc1ZjcEaxmzIRx133Ulmgr11PV3AZO2tdDvDg5t
         zL5/7Axi+acwjHAz8zhsyXRtcVsyKSxNRUM58=
X-Forwarded-Encrypted: i=1; AKwUvBwrLXmXhOrrgGWvcROVg50i/D6H2T44qJ9enm68o7/KLe46xJZ8H9k44m4Ry7338wPARntf8ZavKB6crKY=@vger.kernel.org
X-Received: by 2002:a05:6a00:2d16:b0:89f:7ac5:9d54 with SMTP id d2e1a72fcca58-8a089d0736amr5427158b3a.17.1792690580571;
        Thu, 22 Oct 2026 10:36:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d16:b0:89f:7ac5:9d54 with SMTP id d2e1a72fcca58-8a089d0736amr5427131b3a.17.1792690580106;
        Thu, 22 Oct 2026 10:36:20 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b4292sm2389220b3a.20.2026.10.22.10.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:36:19 -0700 (PDT)
Message-ID: <84bf86db-618b-4387-bef7-5cc02078c99e@broadcom.com>
Date: Thu, 22 Oct 2026 10:36:17 -0700
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
Subject: Re: [PATCH 3/6] ata: ahci_brcm: Initialize the NSP interface clock
 and reset
To: Damien Le Moal <dlemoal@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
References: <20261021165555.652102-1-florian.fainelli@broadcom.com>
 <20261021165555.652102-4-florian.fainelli@broadcom.com>
 <79a81f1d-2964-4b2a-80d1-64e01c202468@kernel.org>
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
In-Reply-To: <79a81f1d-2964-4b2a-80d1-64e01c202468@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/21/26 23:50, Damien Le Moal wrote:
> On 2026/10/21 18:55, Florian Fainelli wrote:
>> The NSP probe path assumes firmware has enabled the SATA IDM interface
>> clock and released the core reset. The downstream iProc config_AHCI()
>> sequence explicitly performs both operations before accessing AHCI.
>> Without that setup, a cold boot can access an inactive controller.
>>
>> Map the optional NSP IDM register region and enable the interface clock
>> before releasing reset, retaining the downstream settling intervals.
>> Perform the sequence at probe and resume before reconfiguring SATA.
>>
>> Keep the resource optional so older device trees continue to rely on
>> firmware initialization.
>>
>> Fixes: 3ee2e6dcaa35 ("ata: ahci_brcm: Add support for Broadcom NSP SoC")
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>>   drivers/ata/ahci_brcm.c | 34 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
>> index 29be74fedcf0..2ed60806b671 100644
>> --- a/drivers/ata/ahci_brcm.c
>> +++ b/drivers/ata/ahci_brcm.c
>> @@ -6,7 +6,9 @@
>>    */
>>   
>>   #include <linux/ahci_platform.h>
>> +#include <linux/bcma/bcma_regs.h>
>>   #include <linux/compiler.h>
>> +#include <linux/delay.h>
>>   #include <linux/device.h>
>>   #include <linux/init.h>
>>   #include <linux/interrupt.h>
>> @@ -83,6 +85,7 @@ enum brcm_ahci_quirks {
>>   struct brcm_ahci_priv {
>>   	struct device *dev;
>>   	void __iomem *top_ctrl;
>> +	void __iomem *idm;
>>   	u32 port_mask;
>>   	u32 quirks;
>>   	enum brcm_ahci_version version;
>> @@ -230,6 +233,25 @@ static u32 brcm_ahci_get_portmask(struct ahci_host_priv *hpriv,
>>   	return impl;
>>   }
>>   
>> +static void brcm_sata_init_idm(struct brcm_ahci_priv *priv)
>> +{
>> +	u32 data;
>> +
>> +	if (!priv->idm)
>> +		return;
>> +
>> +	/* Enable the interface clock before taking the SATA core out of reset. */
> 
> Long line. Please split before 80 chars.
> 
>> +	data = readl(priv->idm + BCMA_IOCTL);
>> +	writel(data | BCMA_IOCTL_CLK, priv->idm + BCMA_IOCTL);
>> +	readl(priv->idm + BCMA_IOCTL);
>> +	usleep_range(1000, 2000);
>> +
>> +	data = readl(priv->idm + BCMA_RESET_CTL);
>> +	writel(data & ~BCMA_RESET_CTL_RESET, priv->idm + BCMA_RESET_CTL);
>> +	readl(priv->idm + BCMA_RESET_CTL);
>> +	usleep_range(1000, 2000);
>> +}
>> +
>>   static void brcm_sata_init(struct brcm_ahci_priv *priv)
>>   {
>>   	void __iomem *ctrl = priv->top_ctrl + SATA_TOP_CTRL_BUS_CTRL;
>> @@ -369,6 +391,8 @@ static int __maybe_unused brcm_ahci_resume(struct device *dev)
>>   	struct brcm_ahci_priv *priv = hpriv->plat_data;
>>   	int ret = 0;
>>   
>> +	brcm_sata_init_idm(priv);
>> +
>>   	ret = reset_control_deassert(priv->rcdev_ahci);
>>   	if (ret)
>>   		return ret;
>> @@ -453,6 +477,14 @@ static int brcm_ahci_probe(struct platform_device *pdev)
>>   	priv->version = (unsigned long)of_id->data;
>>   	priv->dev = dev;
>>   
>> +	/* Older NSP device trees rely on firmware to initialize the IDM. */
>> +	if (priv->version == BRCM_SATA_NSP &&
>> +	    platform_get_resource_byname(pdev, IORESOURCE_MEM, "idm")) {
>> +		priv->idm = devm_platform_ioremap_resource_byname(pdev, "idm");
>> +		if (IS_ERR(priv->idm))
>> +			return PTR_ERR(priv->idm);
>> +	}
>> +
>>   	priv->top_ctrl = devm_platform_ioremap_resource_byname(pdev, "top-ctrl");
>>   	if (IS_ERR(priv->top_ctrl))
>>   		return PTR_ERR(priv->top_ctrl);
>> @@ -493,6 +525,8 @@ static int brcm_ahci_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> +	brcm_sata_init_idm(priv);
> 
> Here, this is called *before* the clocks are enabled, but in brcm_ahci_resume(),
> brcm_sata_init() -> brcm_sata_init_idm(() is called *after* the clocks are
> enabled. Does this matter?

The NSP platform does not support suspend/resume but the consistency 
should be preserved, logically this should be just like during 
initialization, thanks!
-- 
Florian
