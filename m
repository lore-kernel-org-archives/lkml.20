Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32325581FA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085529; cv=none; b=EDQa7ELEptZVewjXdzeJm53H85YyRVsnuXMqdnqk2Bw6EDdyDKuQYw9LoiqWSvcm1TMFft+BlGjJGixEyia9A7Jtcx2aKip0L5v3WcyaO0kAfkDUn1Bh8xD6TL50lyrYhVTB5Bw99AfUZENP6bt+HevqFA4Lmivr70Ra94D8JNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085529; c=relaxed/simple;
	bh=t9AKFDPUV4XpzallExuSad86V113NQeQ5vaWTZJ06io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+mkHuB5VAvHhU00+5JBR+yiVriKKPvc5hi7m8irHyc3SBz/YYJdgDnl8s5diyTj0D/iLy4eJh1Do0p6YdEppZi/HE4ka3NOQcNOL6mWl0brw2lM+lapXpWDSmAnC5mo5Q+zmggpvcF/Toa5mzBlHnu0tJYRyYkpK7G1CrcKtIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=M5npwhxK; arc=none smtp.client-ip=74.125.224.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="M5npwhxK"
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-6756a01fa01so5518974d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085516; x=1792690316;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4dbi8V90zxNAQeR/oTVOtcHS21PfrSobryONxpa2OHI=;
        b=tXV8uCe3ViUMwjLRoZTHMqyl3d19epHf5q6WyEFJO3S5Ez9FrMervMqSVO41ALSLiR
         o3shX82oGkzvEz4MnhS13Ihi+ShbeFuhuqN6lLV721V3xuAWG+0xbL4TYZLw1gIPG8iM
         Ki2IHXm6RTG9H1eqmFj/5PwT6Rg41pjrEaJy1I6gpzdhw/nGkU+WUlYFV23LqgMQlF/L
         43x6Zozh/pURGrCKAgFn90MJuOOBngMV44KvrnO2KoMR/M1p7U2oGGMDvWhOx9xADXtO
         k107qTemRXtDkhzZtGENId/9bdl2qLLPDdXbsSg1qfTKz/JQhH7NPTPvp09fxHyP/tSn
         Lj1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwB7xLLfqT1WD8VcEeVSkyQez4cbeAlxts6Z0a1UJcfsLAu53dBegEG9VVq7JAXUG3P+GREyE6b3B6A3HI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPrYDKtbwSenQv2pvi/IMKUCDWMRF0uGQwAuy3XmM/U9GIKmro
	dErnekG0OLHahIagZ9dS/mrRxPBdpcPt2nhlL447O4DIIzwUJPdwTqa6WAEcOpIMtmBXr5nDQUj
	8J0V5thpQVUHPEeX/8satmIQjP5mdcNmfgg3VtWTeaD4PDAxvZ0dEcw7AicItHtaczIhGasLffu
	Y60PtX57u9umP10IYqjmuBzW+IF4FaNi2ONxxsxcwkgChWl9oXM0MWS1bbB18KMd59NtulN2SZX
	6F3hF75yOqep97HpiHvwkNI
X-Gm-Gg: AYBFou3oRPgkxe0dcQhPdos9vqTcuKsbukscLLRwvHNWKGjM6o1ghlUUge/VECv9Sby
	P4ahXawH5b6JAyDTPGcrqmQr2usRXzBAInxv24V8ECOZdRQzyZBbmzPvzMHRNvxfXl2W6BFjH9Y
	2Ye6UHtjwvSR1HB7pxVDi+Igyp7YN9YA0eL02wpFXILfKAjbGW2cfVyL5+8QbL0w61S3PHMIE6d
	aCCiQYM1+XqO0maPAqg+Z5p3O4Bm4JSk4vRaZytNucE6VpSG9ZhgyQ3hqcsZPdVWZhf+da8f5AB
	vfy7FWWBiXyF+HapgoQOhVY1l+SyXJxvFDBJPewhpaLt02ZDmKk7w5fdY30/DGh/Bgmn2eXpdBI
	qvN7Saw6k68c/LXSlop9LViik4oQpdROdNfNEtXVJb25sSuJDK58v5hjO5JjBwYcMsVF8mhl6Mh
	e4Kgz2MStycxSgEQ3paAq4A1L1FGyfA+X2Ee9xe0/WOOQ=
X-Received: by 2002:a05:690e:480d:b0:677:d9d8:d927 with SMTP id 956f58d0204a3-67936a2530bmr4458194d50.74.1792085516532;
        Thu, 15 Oct 2026 10:31:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-679b1f0a5c2sm10439d50.35.2026.10.15.10.31.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2026 10:31:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so1177053085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792085516; x=1792690316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dbi8V90zxNAQeR/oTVOtcHS21PfrSobryONxpa2OHI=;
        b=M5npwhxKjIg4KbRjKJJLRTjkqyPzuEhDg+9v/8SryoxEr9906q6E6JvGnIXKJUhZDx
         MeRHuIqkzFPYi4XZbpy4Rqxa+W1GwY3XDAHVqys5BFCfLvPhJrUFUn8V/KaMmjLgqrwz
         cVsK1UFe2vaylElwqtpQmME4VMS3TPsBgR0M4=
X-Forwarded-Encrypted: i=1; AKwUvBwms8QXPrNSfavouYs0G57l19NOATiQ9YnprLmDpgJgMTKIBbTP7arfa6ZX6df3Pe3c6Zk6IeL0lFoa3e4=@vger.kernel.org
X-Received: by 2002:a05:620a:17a9:b0:93c:ba2a:6c1a with SMTP id af79cd13be357-93ebd271e32mr3135979785a.61.1792085515199;
        Thu, 15 Oct 2026 10:31:55 -0700 (PDT)
X-Received: by 2002:a05:620a:17a9:b0:93c:ba2a:6c1a with SMTP id af79cd13be357-93ebd271e32mr3135970985a.61.1792085514616;
        Thu, 15 Oct 2026 10:31:54 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef508205csm821976485a.35.2026.10.15.10.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 10:31:53 -0700 (PDT)
Message-ID: <0dcfb2db-5536-465a-bee1-afe160535748@broadcom.com>
Date: Thu, 15 Oct 2026 10:31:50 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] PCI: iproc-bcma: Use EROM instead of devicetree
To: Bjorn Helgaas <helgaas@kernel.org>, Semih Baskan <strst.gs@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Rosen Penev <rosenp@gmail.com>,
 Rani Hod <rani.hod@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
References: <20261013220421.1588051-1-bhelgaas@google.com>
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
In-Reply-To: <20261013220421.1588051-1-bhelgaas@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/13/26 15:04, Bjorn Helgaas wrote:
> This is a combination of these two patches:
> 
>    [PATCH v3] PCI: iproc: Use the EROM outbound window on BCMA
>    https://lore.kernel.org/all/20260807160526.379-1-strst.gs@gmail.com
> 
>    [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
>    https://lore.kernel.org/all/20260912043626.437-1-strst.gs@gmail.com
> 
> I think it's a little simpler because it keeps the use of devm and it
> doesn't require two pcie-iproc-bcma.c patches.  I didn't sign off on the
> pcie-iproc-bcma.c patch because it's Semih's work except for the minor devm
> adaptation.  And the commit log probably needs some work, but I don't know
> enough to describe the platform/bcma driver issues.

Humm, this is not materially different for me before/after applying tihs 
patch and unfortunately but here is what I am getting with these two 
patches applied on top of Linus' master at 
0fcb05b72344f40806cbe810de8872f1698bf053:

bcma-host-soc 18000000.axi: bus0: Flash type not supported
iproc-pcie 18012000.pcie: host bridge /axi@18000000/pcie@12000 ranges:
iproc-pcie 18012000.pcie:      MEM 0x0008000000..0x000fffffff -> 
0x0008000000
iproc-pcie 18012000.pcie: link: UP
iproc-pcie 18012000.pcie: PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [bus 00-ff]
pci_bus 0000:00: root bus resource [mem 0x08000000-0x0fffffff]
pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0xc8 may 
corrupt adjacent RW1C bits
pci 0000:00:00.0: [14e4:8011] type 01 class 0x060400 PCIe Root Port
pci 0000:00:00.0: PCI bridge to [bus 00]
pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
PCI: bus0: Fast back to back transfers disabled
pci 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
8<--- cut here ---
Unhandled fault: external abort on non-linefetch (0x1008) at 0xc896df40
[c896df40] *pgd=0101f811, *pte=18012243, *ppte=18012013
Internal error: : 1008 [#1] SMP ARM
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.3.0-rc7 #324 VOLUNTARY
Hardware name: BCM5301X
PC is at iproc_pcie_config_read32+0x50/0x3c4
LR is at pci_bus_read_config_dword+0x6c/0xb4
pc : [<c044c5b0>]    lr : [<c04264e4>]    psr: 80000093
sp : c881d9f8  ip : c881da38  fp : c1ce1a00
r10: 00000001  r9 : 00000001  r8 : 00000000
r7 : 00000004  r6 : 00000000  r5 : c1ce1a00  r4 : c1ce1f80
r3 : c896df40  r2 : 0000ffff  r1 : 00000f40  r0 : c1ce1a00
Flags: Nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 0000404a  DAC: 00000051
Register r0 information: slab kmalloc-512 start c1ce1a00 pointer offset 
0 size 512
Register r1 information: non-paged memory
Register r2 information: non-paged memory
Register r3 information: 0-page vmalloc region starting at 0xc896d000 
allocated at devm_pci_remap_cfgspace+0x4c/0x88
Register r4 information: slab kmalloc-512 start c1ce1e00 pointer offset 
384 size 512
Register r5 information: slab kmalloc-512 start c1ce1a00 pointer offset 
0 size 512
Register r6 information: NULL pointer
Register r7 information: non-paged memory
Register r8 information: NULL pointer
Register r9 information: non-paged memory
Register r10 information: non-paged memory
Register r11 information: slab kmalloc-512 start c1ce1a00 pointer offset 
0 size 512
Register r12 information: 2-page vmalloc region starting at 0xc881c000 
allocated at kernel_clone+0xb8/0x348
Process swapper/0 (pid: 1, stack limit = 0x0133d9de)
Stack: (0xc881d9f8 to 0xc881e000)
d9e0:                                                       0000072f 
00000007
da00: 00000000 c094fe97 00000801 c044c560 60000013 c1ce1a00 c881da78 
00000000
da20: 00000001 00000001 c1ce1a00 c04264e4 c881da38 c094e684 00000000 
368113e9
da40: c1095d80 c881da78 0000ea60 00000000 c1ce1a00 c0429f08 c1ce1a00 
00000000
da60: 00000000 c1ce1a00 00000000 00000000 00000000 c042a774 00000000 
368113e9
da80: c101ef54 00000008 c1ce1a00 00000000 c1ce1a00 c042a828 40000013 
368113e9
daa0: 00000008 c1ce1a00 00000000 c1ce1c00 00000000 c042bb34 c1260000 
c1ce1c40
dac0: c1ce1a00 00000000 c1ce1c00 40000013 00ff0100 c1260000 00000000 
00000000
dae0: c1ce1c00 00000000 00000001 00000000 c1ce1a00 c042b94c c7ff18c0 
00000000
db00: c7ff1924 00030000 00ff0100 368113e9 014000f8 c1260000 c1ce1c00 
c1ce1c14
db20: 00000001 00000001 00000000 00000000 00000001 c042bcac 00000001 
00000000
db40: 00000001 00000000 00000000 00000000 c881db64 c1ce1e00 00000001 
00000000
db60: c1ce1e00 c1ce2210 c7ff18c0 c1ce1f80 c7ff1924 c042bf58 c1ce1e00 
00000001
db80: 00000000 c042bfdc 00000330 00000001 00000000 c1ce1e00 c1ce2210 
c044bf5c
dba0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
c1ce2210
dbc0: c1c0f140 00000000 c0921b88 c1ce2210 00000001 00000000 00009012 
ffffffed
dbe0: 01060400 c1ce1f80 c1ce1e00 368113e9 00000000 00000000 c1ce2210 
c1ce2200
dc00: c1ce1f80 c1ce1e00 c7ff18c0 00000000 c7ff1924 c044ca40 00000000 
00000000
dc20: 00000000 18012000 18012fff c7ff192c 00000200 00000000 00000000 
00000000
dc40: 00000000 368113e9 c0f740f4 c1ce2210 c0f740f4 c0f740f4 00000000 
00000000
dc60: c0f79d74 c049d398 c1ce2210 00000000 c0f740f4 c049aff4 c0fba560 
c0fba578
dc80: c881dcec c1ce2210 00000000 c049b448 c0fba560 c0f740f4 c881dcec 
c1ce2210
dca0: c10dd240 c049b594 00000000 c881dcec c049b4cc c10dd200 c10dd240 
c04992bc
dcc0: 00000000 c10dd268 c120d7b8 368113e9 c1ce225c c1ce2210 00000001 
c1ce225c
dce0: c10dd200 c049b8b8 c7ff1b88 c1ce2210 00000001 368113e9 c10dd200 
c1ce2210
dd00: c10dd200 c049ba54 c1ce2210 c1ce2210 c10dd200 c049a1a4 c1ce2210 
00000000
dd20: c1ce225c c114aa10 00000000 c04979c0 00000000 00000000 00000000 
00000000
dd40: 00000000 368113e9 00000000 c1ce2200 c114aa10 00000000 00000000 
c7ff1924
dd60: 00000001 c05a4584 c7ff18c0 00000000 00000000 c083fc70 c114aa10 
c05a4774
dd80: 00000000 368113e9 00000000 c881dddc c1028040 00000000 00000000 
00000000
dda0: 00000000 00000000 00000000 00000000 00000000 368113e9 c1095d80 
c7ff18c0
ddc0: c7ff1478 c083fc70 00000000 c114aa10 00000001 00000000 c0a45870 
c05a4a50
dde0: 00000001 368113e9 c05ae584 c1028064 c114aa00 c1028040 c7ff1478 
00000000
de00: c1028070 c05ac398 c1095d80 c1028040 c114aa00 c114aa10 c7ff1478 
00000000
de20: c1c0f4b8 00000000 c0a45870 c05b184c c114aa10 c0f804b0 c0f804b0 
00000000
de40: 00000000 c049d398 c114aa10 00000000 c0f804b0 c049aff4 c0fba560 
c0fba578
de60: c114aa5c c114aa10 00000000 c049b448 c114aa10 c0f804b0 c114aa5c 
c10dd200
de80: c881df0c c049b6a0 00000000 c0f804b0 c049b5c4 c0498ff0 c10dd200 
c10dd254
dea0: c10b0fb4 368113e9 c0828eb0 c1c0f480 00000000 c0f804b0 c10dd200 
c049a438
dec0: c09409c8 00000000 c09409c8 c0f804b0 c1130f80 c0a23978 c1095d80 
c881df0c
dee0: c0a39860 c049c020 00000000 c1130f80 c0a23978 c0a2398c c0f89000 
c0a01314
df00: c1130f9d 00000311 00000000 00000000 00000000 00000000 00000000 
00000000
df20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
df40: 00000000 00000000 00000000 368113e9 0000009d c1130f80 c0a39840 
c0f89000
df60: c0951bd0 c0a39860 00000006 c0a016b0 00000006 00000006 00000000 
c0a004dc
df80: c1095d80 c0f03f80 c07b7924 00000000 00000000 00000000 00000000 
00000000
dfa0: 00000000 c07b7940 00000000 c010012c 00000000 00000000 00000000 
00000000
dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 
00000000
Call trace:
  iproc_pcie_config_read32 from pci_bus_read_config_dword+0x6c/0xb4
  pci_bus_read_config_dword from 
pci_bus_generic_read_dev_vendor_id+0x24/0x150
  pci_bus_generic_read_dev_vendor_id from pci_scan_single_device+0x6c/0xc8
  pci_scan_single_device from pci_scan_slot+0x58/0x230
  pci_scan_slot from pci_scan_child_bus_extend+0x28/0x250
  pci_scan_child_bus_extend from pci_scan_bridge_extend+0x290/0x430
  pci_scan_bridge_extend from pci_scan_child_bus_extend+0x1a0/0x250
  pci_scan_child_bus_extend from pci_scan_root_bus_bridge+0x60/0xc8
  pci_scan_root_bus_bridge from pci_host_probe+0x1c/0xb8
  pci_host_probe from iproc_pcie_setup+0x8a0/0xd94
  iproc_pcie_setup from iproc_pltfm_pcie_probe+0x10c/0x1d4
  iproc_pltfm_pcie_probe from platform_probe+0x48/0x84
  platform_probe from really_probe+0xc8/0x2c8
  really_probe from driver_probe_device+0x34/0xb8
  driver_probe_device from __device_attach_driver+0xc8/0xf8
  __device_attach_driver from bus_for_each_drv+0x90/0xe4
  bus_for_each_drv from __device_attach+0xf8/0x164
  __device_attach from device_initial_probe+0x3c/0x48
  device_initial_probe from bus_probe_device+0x28/0x7c
  bus_probe_device from device_add+0x524/0x768
  device_add from of_platform_device_create_pdata+0x90/0xb8
  of_platform_device_create_pdata from of_platform_bus_create+0x1bc/0x360
  of_platform_bus_create from of_platform_populate+0x60/0xb8
  of_platform_populate from bcma_bus_register+0xec/0x5f0
  bcma_bus_register from bcma_host_soc_probe+0x68/0x94
  bcma_host_soc_probe from platform_probe+0x48/0x84
  platform_probe from really_probe+0xc8/0x2c8
  really_probe from driver_probe_device+0x34/0xb8
  driver_probe_device from __driver_attach+0xdc/0x164
  __driver_attach from bus_for_each_dev+0x7c/0xcc
  bus_for_each_dev from bus_add_driver+0xcc/0x1c0
  bus_add_driver from driver_register+0x80/0x11c
  driver_register from bcma_modinit+0x14/0x48
  bcma_modinit from do_one_initcall+0x7c/0x1e0
  do_one_initcall from kernel_init_freeable+0x1e4/0x264
  kernel_init_freeable from kernel_init+0x1c/0x12c
  kernel_init from ret_from_fork+0x14/0x28
Exception stack(0xc881dfb0 to 0xc881dff8)
dfa0:                                     00000000 00000000 00000000 
00000000
dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
Code: e1510002 0a00000d e594300c e0833001 (e5933000)
---[ end trace 0000000000000000 ]---
note
** replaying previous printk message **
note: swapper/0[1] exited with irqs disabled
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

-- 
Florian
