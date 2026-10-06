Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F5A497B6D;
	Tue,  6 Oct 2026 15:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791299417; cv=none; b=XGJdvLHqPptHpI9dBC/9Vfxe3p2rWX7bX25fs5tbx06U957f2z7bR8aNCXAkc/iKKwR/wyd7ta8LkywRA6MRdtaYKZuoyKw7cqBqJpK9QUiqz1I9c6eEu+lYZgIDWfdxQhoV1q50esyvnj9ki4GY6O+C8zZcPhtQLfrZGjPLgXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791299417; c=relaxed/simple;
	bh=VkZbF5Ix4Bnh/LDAKPb1Q/dRJ7mFAi944jLXyhb9vLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJ/yTcQXNmTfgccLhrCCSIGSpU/C3EfAUivh5qgq2lcf8eHfs75ABi1DNA/5uSp8vjMTngFG6Yuo5m/UTq2yj2ET4Z1BuzscUhjsm7eHB7QPkLfYPq9ZFQyzV+IUC6yfWyCBk/kQ/9muOZ1NRak57uTvbxReMQhau9543QNQncc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5eiZaIM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5eiZaIM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42561F0089B;
	Tue,  6 Oct 2026 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791299416;
	bh=/8MwodWIc7pSXoyonykfDnVGjP6esjgcz4uVWq2ywBA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=T5eiZaIMlFsFmdSMBbX7eLmldhAkSuyF4MC4iWzTFxgZk2MLYdLtk8jzJeWuC7aTw
	 BBPpyzAqQ6J5qcpNMnEvITLSxNYdH28iGtaRarLR45SATLCVDG8FXeoa/Ws3XqwXyy
	 Wfqw6A4pDfI+lkqU0WaVj5KA5tTQSYJzHvkRPYW6+H9ftovC+fFIYwiZ8juvIiV1UK
	 F+eHMerfYSWhy6I79RPArfp4r+o1srzi+myJaNa9bDSum0VdIgLDsGQ6di4f9pX+K3
	 3Atnhpkqu6NkF2LpmM6Ku6Uc2/e6jDDdtfvCmEb7OiNA+K3pb+A3A5w3oEkiFnvjOC
	 KRsCetlFLy6PA==
Message-ID: <b6a552a8-7710-4472-aeaa-96d50856f896@kernel.org>
Date: Tue, 6 Oct 2026 17:10:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Add SpacemiT K1 USB2.0 controllers support
To: Yixun Lan <dlan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Peter Chen <peter.chen@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>, Ze Huang <huang.ze@linux.dev>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
 <20260928230310-GKB2079@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260928230310-GKB2079@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/09/2026 01:03, Yixun Lan wrote:
> Hi Greg,
> 
> On 19:40 Sun 27 Sep     , Junzhong Pan wrote:
>> The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
>> support, but the hardware has no internal OTG registers, the other is
>> Host only. These controllers are compatible with Chipidea USB2 driver
>> with some flags set and reset control support.
>>
>> This series is based on 7.3-rc1 and has been tested on Banana Pi F3
>> development board.
>>
>> A self-powered USB device/hub is needed to test the host function of the
>> dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
>> cellular module e.g.) is needed to test the host only controller.
>>
>> ---
>> Changes in v3:
>> - collect tags
>> - merge the two dt-binding commits
>> - use local variables when acquiring devm managed clock/reset
>> - drop manual clk_disable_unprepare() from the remove path
>> - enable related drivers as modules in defconfig
>> - Link to v2: https://lore.kernel.org/r/20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com
>>
>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>>
> 
>> ---
>> Junzhong Pan (8):
>>       dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
>>       usb: chipidea: usb2: use devm_clk_get_optional_enabled()
>>       usb: chipidea: usb2: add optional reset support
>>       usb: chipidea: usb2: add SpacemiT K1 support
>>       riscv: dts: spacemit: add USB2.0 controller nodes for K1
>>       riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
>>       riscv: dts: spacemit: enable USB2.0 controllers on OrangePi RV2
>>       riscv: defconfig: enable ChipIdea USB controller support
>>
> Any chance to queue these patches (1-4) for v7.4 cycle? Hope it not too late,
> and then I will handle the rest part, thanks

Can you drop the fake test tags while at it?

Best regards,
Krzysztof
