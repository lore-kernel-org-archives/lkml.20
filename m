Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05B33B9922;
	Thu, 17 Sep 2026 19:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671955; cv=none; b=iEV8UV5ic3WG1afOe5jhF/M9bvNt/djT2KvCDFm/rDzIbz/IxFRxuFTpfXa3NBJSfzzF6dwnhKKYv4frpGfiRbOjbh40Jbvs2gMC6cSaW1JcgJruJiqtKR9TinlgzVm1WqDUYiCIY2qGbPaFth5CLutJlTjM2RonicLogttBT4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671955; c=relaxed/simple;
	bh=iWss4BA5cY0gBqeP9AXZVn8nZYhA8v2LXLeKSLy+YM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6mIPJRjR1vmId4nLrTOZTdHcW45tg65m4pQmeo7Bms4x40soi1SntviZ8Ud2yL7LopElEFrp3fXfbh29Q20ZoeVLYfE+oyS0m0xagZncVOyL9OJ9cGm/xFqEFMytwh6Z5Ppa+WQPDo7V84zOKEaMXi8k9AjsP+n7YzwUGhHTzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqgSU13c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqgSU13c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 705E11F000FF;
	Thu, 17 Sep 2026 19:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789671953;
	bh=6TZ37CAeePpQmRnllKX+Aqan/MVjgNrMVatDTqYQR4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DqgSU13cs2hUNnUswA+a/YC5PVQuD4vlgIxaMcPlUA1b5++RNmOEH5FnXcRfzmeWe
	 he+GgrzYfnHcHFN0SEPhTNpqL48btmCtZ8Gfhale8oVjwWDa31rVm1iOnI0GgeFqay
	 Tb+WBQmqC1nQQb0S2DImU083AqZiOntcnOXb/CZ+8O8h3Ylq4JHa2StyDi+Be7RZQ9
	 2qAYHdPOd+T26zRfoCBhNpzJCutYfDpGnCyPv5laNJfnqU4e/xdhMbN/8rtiZ9AsSE
	 WeaTRt5fVOzRAjNVJGSWFu3uG5kuIKXQhhP7Potf9lNCKplq5AEo7bP8Jw698Q+Ogo
	 S2wiw7tOD7b6w==
Date: Thu, 17 Sep 2026 14:05:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>
Subject: Re: [PATCH v3] of: property: add i2c-parent to fw_devlink supplier
 bindings
Message-ID: <178967195044.3153967.12195554835318788893.robh@kernel.org>
References: <20260815-b4-of-property-add-i2c-parent-v3-1-c22588b6482a@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260815-b4-of-property-add-i2c-parent-v3-1-c22588b6482a@nexthop.ai>


On Sat, 15 Aug 2026 20:33:13 -0700, Abdurrahman Hussain wrote:
> Platform-device i2c muxes (i2c-mux-reg, i2c-mux-gpio, ...) reference
> the bus they multiplex with an i2c-parent phandle and hold a reference
> on that adapter from probe until remove. Unlike muxes that are clients
> on the parent bus, they live outside the adapter's device hierarchy,
> so nothing orders their teardown against it: if the adapter's device
> is unbound first — e.g. while reverting a device-tree overlay whose
> changeset attached the mux nodes before the controller nodes —
> i2c_del_adapter() blocks forever in
> wait_for_completion(&adap->dev_released), waiting for a reference that
> is only dropped later in the same teardown sequence.
> 
> Teach fw_devlink about i2c-parent so the core creates the
> corresponding device links: consumers are unbound before the parent
> adapter's device, and probe ordering no longer needs -EPROBE_DEFER.
> 
> A plain DEFINE_SIMPLE_PROP() cannot be used because the property has
> two incompatible layouts: the i2c mux bindings hold a list of bare
> phandles (i2c-demux-pinctrl takes several), while toshiba,tc9563 holds
> a single phandle followed by an i2c slave-address cell. The two forms
> are indistinguishable in the flattened tree, and a 0-cell parse of the
> tc9563 form would read the slave address as a phandle, linking the
> consumer to whatever node happens to carry that phandle value. Use a
> custom parser that only takes entry 0 for toshiba,tc9563 nodes.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---
> Changes in v3:
> - Fix the tc9563 compatible check: match "pci1179,0623" (the actual
>   binding compatible) instead of "toshiba,tc9563", which never matched
>   and let the bare-phandle parser misread the i2c slave-address cell as
>   a phandle (Sashiko AI review)
> - Link to v2: https://patch.msgid.link/20260815-b4-of-property-add-i2c-parent-v2-1-239c6da9e097@nexthop.ai
> 
> Changes in v2:
> - Use a custom parser instead of DEFINE_SIMPLE_PROP: toshiba,tc9563 puts
>   an i2c slave-address cell after the phandle, which a 0-cell parse
>   would misread as a phandle (Sashiko AI review, Rob). Kept the full
>   phandle-list parse for other users since i2c-demux-pinctrl takes
>   several parents; only tc9563 is limited to entry 0
> - Move the Signed-off-by into the commit message proper; v1 had it below
>   the '---' cutter line where it would be dropped on apply
> - Link to v1: https://patch.msgid.link/20260813-b4-of-property-add-i2c-parent-v1-1-a2487e920ce1@nexthop.ai
> 
> To: Rob Herring <robh@kernel.org>
> To: Saravana Kannan <saravanak@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/of/property.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Applied, thanks!

