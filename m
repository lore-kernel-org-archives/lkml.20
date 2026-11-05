Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.128.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875384;
	b=y+y6Pycc4xr0UFilEuwmifSYmiHIBTow+awOC5arrl/56y5mNRj3hpYoMkW0148fHCrg
	 nkZvtZJyXUJNYBOvNOlCSKydQEwspOe2XS1KapDRPXD1DdDgCXtMRcJU6BDRdLSqpQKAn
	 F/vMs1TP4IifaX8rX7pcDXKmPFMcO8xNH0pa14QG23yywHaJAlNEePWG6rAQ2doQo+lzb
	 0j/YX/C6W34oPEgFmQMFqT6RvVIjKwTcHk5bYXgTQRE/5+/V4V5F74LfGUIfJSybbPQkI
	 jrQ749X1z5p+cPmLqd7jq20UPNapzMgJZr+9kKmCUxVEreqF8g+vIFknN9h3JoHR+fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875384;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=LY48cpV0y54qEv+ziTpWevRO8FRdZm6CABLVHzZZ+3I=;
	b=St3+8Q6Gu3wu0ihaxqTQ3ygmI9M8DvCK1KctgzJfvyBjsomHen37AHN8ELSNSw1ahsDw
	 BBd4BcLsCF+LWk2nz/+6TsKViQM1RBQ0m1jMGyIW1dsbwo4Gzz/mx3w2SHkS4TE5N4M+C
	 0F8CN4o1qNK6F1QA+3Lj6liin42agkwDAkjDGwtCcE5zd6rCL/id9FvE3KUAnCQSykVgG
	 obVMkTmEZYZrUf+V+fMYceV3fqX0KO/qgVhlrzr1e8IhjUoN09BCxcSvGA/ArJApWbpTF
	 4/tU28SJIySjquoAcZKq7qEHlNEIwOzGNLHKBXHZktbGXSANCfGJ2Iec7mBLSjpaHEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freeshell.de;
	spf=pass smtp.mailfrom=freeshell.de;
	dkim=pass header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=TBry9vQL;
	arc=none smtp.remote-ip=116.202.128.144
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B239606A31B;
	Thu,  5 Nov 2026 10:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B239606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=TBry9vQL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1793875341;
	bh=LY48cpV0y54qEv+ziTpWevRO8FRdZm6CABLVHzZZ+3I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TBry9vQLy9zXjlzdD3mWMp0vCGbmJRard8DI1NekNJ8v9IEzcDd2wRrQ+wtMkpzKI
	 bbON9/TC6zvv7ZF/nYCLXhF2kqdINuVz5NjU5+/3KhN+r3IL++BEWtXByMA961lr63
	 5HKtD+j2Y7AwQA0QwhTJLFt5tO2rv6yLjWUwDR3dp+Aat6+6tozWUCHMZSnMAIjRHg
	 S/YnpZt6mmDLqrQpq7ATUWePWVcD6+MhRHZWwNG6E0nHlI6qdslQJJjpy5dwSBA64S
	 CuFj2bN66jqxyxD2muvdE8NXC9W2m3TND81rZETFSF+LbK3DdtselDhJL79w6e8sgo
	 8nHiNed7bvZ0A==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 63687B22067C;
	Thu,  5 Nov 2026 11:42:19 +0100 (CET)
Message-ID: <0c4b79f0-383a-4884-8132-59dcb3487cd3@freeshell.de>
Date: Thu, 5 Nov 2026 02:42:11 -0800
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
Subject: Re: [PATCH 4/5] riscv: defconfig: Enable AT24 EEPROM and ONIE TLV
 layout
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-4-138b39d74602@linux.spacemit.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-4-138b39d74602@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 00:23, Troy Mitchell wrote:
> The OrangePi RV2 and R2S device trees take the Ethernet MAC address from
> the ONIE TLV data in an AT24 EEPROM, and the K3 CoM260 module stores its
> MAC address the same way. Without the EEPROM driver and the ONIE TLV
> layout, the MAC address lookup keeps returning -EPROBE_DEFER and the
> Ethernet controller never probes unless the bootloader passes a MAC
> address in the device tree.
> 
> Enable both drivers as built-in so the MAC address is available as soon
> as the Ethernet driver probes, including for network root file systems.

This does not make sense for platforms which have no use for EEPROM
driver in Linux userspace.

> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 04ae305d5511..a76f801d8eed 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -276,6 +276,8 @@ CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
>  CONFIG_PHY_STARFIVE_JH7110_PCIE=m
>  CONFIG_PHY_STARFIVE_JH7110_USB=m
>  CONFIG_LIBNVDIMM=y
> +CONFIG_NVMEM_LAYOUT_ONIE_TLV=y
> +CONFIG_EEPROM_AT24=y

Enabled as module, please.

>  CONFIG_NVMEM_SUNXI_SID=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> 

-E
