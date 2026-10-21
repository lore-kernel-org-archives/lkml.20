Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.128.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580897;
	b=A711ztQ7xN49l7z6ngWfvxjBRwWW3vgeumUkTaHfXd2x5gyWRKTfTTrEXGWuJa+kaR3q
	 JDfjtj3aAeyyoRv1uVTn1Ns0CoVeNm7IX3B17buZ9vnMwCzo8/OnzJynJpvmwMWuQImzE
	 3bJLYDygvLBu9MNlh0BjHkJi4WrRf/dHu3Qrt5PoMeM/DJNW7+TkhvCkXJDGZkmpVku6k
	 x4zZEm9VfYsHQLEpQlEWNwxplqQOu+4q/Kl7QMb7xDmUbBRsBZCDPt1AZwVzUT+wb8io5
	 XY9xrhc46RAkKi6bNDPpihfp0A3OK4cCSxW8sD7NeR4iFmuTfneXa66ey8nFm7nGjrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580897;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Lv7Omi5n8k/bxt6p6Ood58jQjPgelYC54rFdKIGqlDM=;
	b=B8TXBzmYBphq4IHiV3wViy8iBYePgMF4pyye7HwB4e+5XiQVeHasXFNoknnJl/XseA3E
	 v1/P/f7d+ftr34YN7H/SntsnDzJ5t0jPmo0YcZypAURq1P7BLbTX+b9kqOhJxTmXp2PP8
	 5i9l36b5W59LDGPik0C+3YwtmCzHytklrRV+s6ZEMoJ9tYHoRpoLtbstQuuE5HjIMNS2E
	 Zi3Q0d7W24NybNorKje4ujnActH6CffrKME4LFiTaDTwQCNRhud0yBhBFrpdJ2SNYwWhE
	 beLx12/qB/IUKtdbo7NeUll9psjyvVudYzsuOeSpNSNyxNGgeb5lUqC7TY2EwZiXyng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freeshell.de;
	spf=pass smtp.mailfrom=freeshell.de;
	dkim=pass header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=RU6148x8;
	arc=none smtp.remote-ip=116.202.128.144
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B90606A31D;
	Wed, 21 Oct 2026 11:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2B90606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=RU6148x8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1792580859;
	bh=Lv7Omi5n8k/bxt6p6Ood58jQjPgelYC54rFdKIGqlDM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RU6148x8F8xQtgBEgbPeOFO/r4kqbrnkMiqhES+lxGo7EhBo4HEHYbI5PwrGnoLbg
	 lqngIyqKCLwBZOQKovwE5liPCfPLgURH4u6qrwu0n1EDuy6vSMWb/Y6AWXO1Y2s4KY
	 jD65I13FboQh/3dhd6PLXPRkFNOf/btq1yfHaj8dzj+fBYtQwYvziKxp073/vNt5Is
	 EmGl1FhB0tU92jWSLuDq70HFbppfvzq2iB2ckGhrYacamUUbq0HE+0ZpUsjda5I1Zx
	 BudGOG3uFTjx0qHf2gU7y2xQytgNo2+oZHcotJiT8sQJG1WbeaV7/RDQ00LsRf03FO
	 ZvXrq/m3neQ7A==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 90006B2219EB;
	Wed, 21 Oct 2026 13:07:36 +0200 (CEST)
Message-ID: <b47b95f6-600b-4b0c-8aca-acd7c75d5d07@freeshell.de>
Date: Wed, 21 Oct 2026 04:07:34 -0700
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
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: mark K1 board boot devices
 bootph-pre-ram
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>, Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261017180141.3477743-3-alan.tseng.cs@gmail.com>
 <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de>
 <20261019141752.2077207-1-alan.tseng.cs@gmail.com>
 <20261021083425-GKA125937@kernel.org>
 <20261021110001.2905669-1-alan.tseng.cs@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261021110001.2905669-1-alan.tseng.cs@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/26 03:59, Hung-Chun Tseng wrote:
> Hi Yixun,
> 
> Yixun Lan wrote:
>> but for bootph-pre-ram, isn't it about the DT nodes which needed before DDR
>> initialization in SPL stage, and should have nothing to do with BootROM?
> 
> Thanks for checking with the vendor. I agree, the schema defines it as
> "the phase that sets up SDRAM".
> 
> I also need to correct what I said earlier: the EEPROM is not only
> used to tell the boards apart. It also holds the board's DRAM
> configuration (number of chip selects, data rate and DDR type), which
> has to be read before DRAM can be trained [1].
> 
> So in v3 I'd like to keep the i2c2 and EEPROM tags, and also tag the
> EEPROM on the OrangePi RV2 and R2S, which I missed in v2.
> 
> E, does that address your concern?

Yes, as based on published documentation and confirmed by vendor, that
sounds good to me.

> 
> [1] board/spacemit/k1/spl.c in U-Boot, ddr_early_init() -> read_ddr_info()
> 
> Thanks,
> Hung-Chun

Thank you Hung-Chun and Yixun,

-E
