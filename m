Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE5349F13F;
	Tue,  1 Sep 2026 19:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289593; cv=none; b=dUkiogSOEYvZ4pbOrQ4wwdj1cNGqrCveWQSZYZlZXw9dHX3O1dA56/NcZ9JKZnJSUm/MZfUoOAwXvgVe4+pk+LiLv9tY741jt3GGE4w7+AUaYWYvGw3d8gvuWDsLO+UF0QnbF26LHrO9dSOAoF/GXmIwZcqexoTwCTETZel/Hkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289593; c=relaxed/simple;
	bh=/FWCNLazy6NKb3LwXJlewtPpko8OiWbGpl5nh+5evA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbdLdCfuc+yStOL/xWY1n1CVgFS2ksmQljwgBP8/1M5jE7s307Igl40i8M2aE128IeQBqpI5XsivOppMEb8Ee/YKUIcic8DaxKNZZJzj4v+QjnF5MPYHSOgacddYaQdjeuE3JAFibO74wAOvFonzsU/zEioVXS9M8V6UJoAn5tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hndb1yFh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hndb1yFh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30081F000E9;
	Tue,  1 Sep 2026 19:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788289591;
	bh=pFTu49OcoFU2MNqhD13fTc84uxSJ3zdV8FqsYNvRr9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Hndb1yFhIuNwm7aONHjx++9wFUwCYpwvIBPkXjxpLTEUp2PUAEwec2+XBT2/8QrOC
	 +m8PWXhVywXt6pd6lTbd5w0Z+/HFsiNbT8sEE9kpAgls5Cgi6/QR/MWbMQpuxS423Q
	 4+6GmWqEOnb4BGGVGsjWYHaPypcvIXQKTL6uZ7cVvlQICpAF6O0rHVYlXzDRND6GKH
	 fO0JpaDp9YDtJ0UO/DsQTj1xITo24/zyn1Z6vgNArZFPL086aRpX0cAYBgDxMJd1/e
	 pnTseL9lx7gLBjjqp6zslAzoIwr7wpARhQAsDbpwhdsOYI04eqcb2fHKyhHSP+VQSG
	 P6Af8MnvHQrBQ==
Message-ID: <05070c4a-6e78-4649-b1c4-32093fbfa80e@kernel.org>
Date: Tue, 1 Sep 2026 21:06:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] thunderbolt: Add Apple Silicon support
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-16-44bc9348683c@kernel.org>
 <20260901100925.GF106095@black.igk.intel.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260901100925.GF106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

thanks for the very fast and detailed review! Will address those points 
for v2, some comments below:

On 9/1/26 12:09, Mika Westerberg wrote:
> Hi,
>
> On Sun, Aug 30, 2026 at 10:19:34PM +0200, Sven Peter wrote:
>> Add a platform driver for the ACIO host router complex and Native Host
>> Interface (NHI) found on Apple Silicon SoCs.
[...]
>> +
>> +	/*
>> +	 * The firmware samples the ring configuration when the valid bit is set and E2E flow
>> +	 * control never engages when configured afterwards. Write everything at once like macOS.
>> +	 */
>> +	writel(flags | e2e_flags, options);
> I think we can do this flow in the generic parts too. It makes the driver
> follow the CM guide more closely.

sure, I can adjust that as well.

>
>> +}
>> +
>> +
>> +
>> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(42));
> 42?

42! don't ask me why but that's the number of address lines they hooked 
up. I'll add a comment.

[...]
>> +
>> +	anhi->nhi.tx_rings = devm_kcalloc(&pdev->dev, anhi->nhi.hop_count,
>> +					  sizeof(*anhi->nhi.tx_rings), GFP_KERNEL);
>> +	anhi->nhi.rx_rings = devm_kcalloc(&pdev->dev, anhi->nhi.hop_count,
>> +					  sizeof(*anhi->nhi.rx_rings), GFP_KERNEL);
>> +	if (!anhi->nhi.tx_rings || !anhi->nhi.rx_rings) {
>> +		ret = -ENOMEM;
>> +		goto err;
>> +	}
>> +
>> +	anhi->nhi.dev = &pdev->dev;
>> +	init_completion(&anhi->nhi.domain_released);
>> +	anhi->tb = tb_probe(&anhi->nhi);
> You do need to setup device links for the tunneled protocols as well. Have
> you checked if they describe these in DT? I would expect so.

I'll look into that, the DT already has the ports which I'll need for 
notifications to PCIe and DP later anyway and I should be able to add 
the device links then as well. Right now only USB3 tunnels work (by 
accident: I'm not following what macOS does and will probably need a 
notification once I get to suspend/resume as well) but I'll see if I can 
already add device links. Either way, the dt-binding already has enough 
to describe the connections to dwc3/pcie/dp through the graph 
ports/endpoints.

>
>> +		tb_domain_put(anhi->tb);
>> +		wait_for_completion(&anhi->nhi.domain_released);
>> +		goto err;
>> +	}
>> +
>> +	mutex_lock(&anhi->tb->lock);
>> +
>> +	if (!anhi->tb->root_switch->drom) {
>> +		dev_err(anhi->dev, "No valid host DROM in the device tree\n");
>> +		ret = -EINVAL;
>> +		goto err_unlock_tb_domain;
>> +	}
>> +
>> +	cap_apple = tb_switch_find_vse_cap(anhi->tb->root_switch, TB_VSE_CAP_APPLE);
> This should not be done here. It belongs to the CM.
>
> We can do it in tb_start() for example, because only Apple silicon has the
> cap.

Ok, I'll find it in there and just expose it to apple.c somehow then to 
be able to write the cable info from here.

[...]

>
>> +	case TYPEC_THUNDERBOLT_SWITCH_TBT:
> Probably cannot affect these anymore but if can then _TB instead.

That was only introduced in the first patches but after Heikki's review 
it'll go away anyway. I'll make sure to TB instead of TBT anywhere else 
though!



Thanks,


Sven

