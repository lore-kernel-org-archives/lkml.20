Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.128.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032028;
	b=SDGCi8BJ43I3u2uOdG8cX4EFo6ag1ImLCWZfhfuYPoNhLitpR8mlfAFdGx6xgGndwHsY
	 AtilXLY/QWfyRkrwS+zvru8Lo+YJ5HruQB25/OkoUZ5zQN02DoJV1Y97Kv3EbuZkEwxOG
	 SiYU5OqKAcHWv60vHjWfV/pAXJAk1HNf0gBqbGCLVm7skQyh1VZFZnifDMIcCNvV7UWo4
	 I0nPfdkCS3sVRk/eeyxeUciGJWHxXJzuaPgsIJT2Ow7/te875sV+R+O3d9jFJb+jUp4SQ
	 0JKW5NCy2EMX7kXM1cab+31C1YJ5+NaXSlSyHH2fm8bfNa8LXDoXUB/zkFvRK5fqIgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032028;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ANAaz8c+22RJYJaWGVW0QrQPpeeNnCFIvngIi19CeD8=;
	b=ajazW2NSvPuzTHtx6bl0hw5LJR29WZBGbxvMHCJWR+YioYP2ARGxkh6iQO8SLtgXgub5
	 BRs6m1IFhbG6CfYoyB5WmDKHHmQ9HHwdfsS2ElJytq552Xc8MaoCBCGejmr0SOF7Uf6Z1
	 8LePv/c2Z7qG9XQQ9gaVtUtrypl/RdWbfnlWcUQQRYtfSY1VKQD3Qyry/8B1fMBrRgHKO
	 uY5xFaTaNZboMpt5m0vqIjUS9RLyELEsu6xmC0sNsS+I4+M8A8X9JgpoH4jb7q3QR1d/L
	 4ONOb8deD3TQfx2VXtz8/2JBlE0VH7UhNo90XKGMz4+tnDSw/JDk0i66AjVFu2yhonQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freeshell.de;
	spf=pass smtp.mailfrom=freeshell.de;
	dkim=pass header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=V5N6cRfv;
	arc=none smtp.remote-ip=116.202.128.144
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E92A60A260E;
	Mon, 26 Oct 2026 16:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E92A60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=V5N6cRfv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1793031979;
	bh=ANAaz8c+22RJYJaWGVW0QrQPpeeNnCFIvngIi19CeD8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V5N6cRfvWRSdhIqboQ7GDT+fSljzlIXWXYotD1A8/OEosA2wkR53uLSdlji/kL07F
	 ole4JYQwWQTcApIMmvdJvbmpYD4zU7IGSnMTTnt9K5W2+NvBSWS1CjqpsmK+gKWOWV
	 kD3TPDxoWLPTqy/UYLm3VFi8vOw2X4QoU9qsTFWl0F00993IOF6oVoZnlk483x9/72
	 DVOkA75LfGV7/XRK84cXpY449WEc20rbc5UdhqH3uW179qVDMEjQe0POvSHa8s3jDU
	 Yr3aSTfI30B5lsLt4YfJ+XOzcyn9zfydDQZ2/SZJs7dijYpkV+TPiel8NAeOY/slhc
	 RvpAwiEvHzXbg==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id E6365B2272DB;
	Mon, 26 Oct 2026 17:26:16 +0100 (CET)
Message-ID: <a678fbd3-10cc-4a31-a847-81a6c0e21c39@freeshell.de>
Date: Mon, 26 Oct 2026 09:26:14 -0700
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
Subject: Re: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes
 bootph-pre-ram
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: dlan@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
 <813d3f4a-66a9-48df-b9de-6a46b9388d0a@freeshell.de>
 <20261026033813.432250-1-alan.tseng.cs@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261026033813.432250-1-alan.tseng.cs@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/25/26 20:38, Hung-Chun Tseng wrote:
> Hi E,
> 
> On 10/24/26 07:45, E Shattow wrote:
>> Split the patches in this series so we have a clearly defined initial
>> changeset that does "Extend the BootROM configured peripherals to device
>> tree bootph-pre-ram hints for any SPL loaded by that BootROM in SD,
>> eMMC, and SPI NOR boot modes".
> 
> Thanks, that makes sense. For v4 I plan this split:
> 
> 1. BootROM: the fixed clocks, the clock and reset controllers, uart0,
>    sdhci0, emmc and qspi in k1.dtsi, and the SPI NOR flash@0 in the
>    board files.
> 
> 2. DRAM setup, as an add-on for Yixun to take or leave: i2c2 and i2c8
>    in k1.dtsi, and the EEPROM, the PMIC and its buck1, buck3 and aldo1
>    in the board files.
> 
>> Capture all the BootROM SPL loader flows
>> that we can understand (USB missing currently? please add this)
> 
> USB download mode goes through the OTG port (FDL button, then
> "fastboot stage"), but mainline has no node for the USB2 OTG
> controller behind it yet. The DWC3 is a different controller. So there
> is nothing to tag for USB today, and I'd add it once that node lands.

Is "[PATCH v4 0/8] Add SpacemiT K1 USB2.0 controllers support" what you
refer to?:

https://lore.kernel.org/lkml/20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com/

"The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
support, but the hardware has no internal OTG registers, the other is
Host only. These controllers are compatible with Chipidea USB2 driver
with some flags set and reset control support."

Looking briefly at the design guide section 1.4.1 "USB 2.0"

https://cdn-resource.spacemit.com/file/chip/K1/K1_Hardware_Design_Guide_en.pdf

quote "USB2.0-0 serves as the Download interface." and "A self-powered
USB device/hub is needed to test the host function of the dual-role
controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a cellular module
e.g.) is needed to test the host only controller."

That looks to me like the target to hint. You could ask for the hints to
be added on that (USB 2.0) series, or note as a dependency for this
series and do so here.

Note also "[PATCH] riscv: dts: spacemit: enable USB2.0 controllers on
Milk-V Jupiter"
https://lore.kernel.org/all/20261009-jupiter-usb2-v1-1-ab84a00d3b64@redhat.com/

"On Milk-V Jupiter boards, usb2_0 is connected to a Type-C connector
which cannot act as a power source."

More of the same, I think, adding bootph-pre-ram hints to phy@c0940000
and usb@c0900000 or by label references per-board whatever shape of that
is best. Per-board is more useful to potential users of this at SPL
phase but may introduce inaccuracies (as it pertains to describing
hardware) as the decisions to default to "host" mode and not "otg" are
common sense things that are (looking at history of these decisions)
permissible to be different than default hardware state after possible
BootROM configuration. I do wonder if the SPL environment directly
following BootROM is something we should perhaps be describing in Linux
devicetree as its own distinct thing. Well, don't forget about USB
anyway I think there's an actionable there and it's just a coordination
issue which series should take that change.

> 
> Yixun, could you confirm that the BootROM uses that OTG controller for
> USB download, and that it does not touch the DWC3?
> 

...

> Does this split look right to you? I'll send v4 after the merge window.>
> Thanks,
> Hung-Chun

Yes, thank you -E
