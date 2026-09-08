Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75EE56C634;
	Tue,  8 Sep 2026 19:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894137; cv=none; b=ZkV/k5FGr1R8mQxzknQnyOEaJOI89wKEazKL1aNnIfYXPqOezL566/dBaDSDQjuyeOO51CKJRI0kLlYhv1M3AV1yXRoQxb38BQurJrN39CzpK9cDx6fzmrUXaZSJuKnx4P799vGWJe2YTRe/xrIx62+hEfbyC2Ek07kT+8vq0fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894137; c=relaxed/simple;
	bh=9JMxYM/fEXEy4p4gMNOtX5RS4sssgy+BazRRTuaHmlw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=C4r83sfGN4mG3nV3m03KZ1YytL8kk0xxb7fKP5laRxB+7WP6R7CaaXQ0fCYjsrjOMu8IxCYbHBqsmxIxfY8xQUtVCW6KV7vtIvx68nfLXUag8izRmQpER8+l7TXEWYsp62691yeQu1VVXDryT3C+0zZDGqONLgQBgoWZ2X0Q4Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hca+jGIs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hca+jGIs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846FE1F00A3A;
	Tue,  8 Sep 2026 19:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788894135;
	bh=vw7LxsXe5xwpizej0UDbS9PMaoH0Hy0ensmVdwkzR9w=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Hca+jGIswd/2lVi0dWWe1q193xt4TDC8/iyoScFKVhgzGW49GDZXCWRvLl6uUwDDX
	 3XSa0aB0eYiIeNAXi4qQu0YcBC7mE1FH6thbDUnifyR2yKONB5ofNRd/Ro0eY2uLS6
	 skozljWN9sqiHSDnY0GjYarWuXJf5FXd3Z9vIrEjfPmx3d95/pWxrRL4zpT9nE1RGg
	 3K0Xkl1FKgQ86hSGOhElVFv551eEm/kOGW2qfW1YAPGeGHK0nkwdVwox3c4xecReUA
	 Sj4NjKBzhShKN/Tb1pbBLwZ+6yHtfYGjRKSFboHujJO2t98ycBMqdeFgNSFjpPO43Q
	 OytvgWQ41+kcg==
Message-ID: <22808191-5310-4d90-9fac-68d0d85b4c54@kernel.org>
Date: Tue, 8 Sep 2026 21:02:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sven Peter <sven@kernel.org>
Subject: Re: [PATCH v2 19/22] thunderbolt: Add Apple Silicon support
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-19-1f80085f93fb@kernel.org>
 <20260908091844.GD106095@black.igk.intel.com>
Content-Language: en-US
In-Reply-To: <20260908091844.GD106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mika,

thanks again for the quick review!

On 9/8/26 11:18, Mika Westerberg wrote:
> Hi,
>
> On Sun, Sep 06, 2026 at 08:36:42PM +0200, Sven Peter wrote:
>> Add a platform driver for the ACIO host router complex and Native Host
>> Interface (NHI) found on Apple Silicon SoCs.
>>
>> The driver registers notifications for Thunderbolt and USB4 partner modes
>> on the Type-C bus and derives the cable details from the Thunderbolt VDOs
>> or USB4 EUDO.
>>
>> After powering up ACIO, the driver boots its RTKit co-processor and
>> populates the DART and NHI child devices once their MMIO regions become
>> accessible. It then registers the NHI with the software connection
>> manager and forwards the cable details to the host router.
>>
>> The Apple NHI uses one interrupt per ring and overrides the generic ring
>> register accessors, interrupt handling and ring configuration. It also
>> uses the OF graph connection between the USB3 adapter and the DWC3
>> controller to create the device link required to restore tunnels before
>> USB resumes. As of this commit only XDomain connections and
>> USB3-via-USB4 tunnels are supported.
>>
>> Signed-off-by: Sven Peter<sven@kernel.org>
[...]

>> +
>> +#define APPLE_CIO_NHI_PDF_STRIDE			0x4000
>> +
>> +#define APPLE_CIO_USB3_ADAPTER				4
> Do you really need to hard-code this? It's not possible to figure out from
> the host router adapters directly?

It's possible I think but the host router isn't up yet by the time I 
need it to add the links in tb_probe.
>
>> +
>> +#define APPLE_CIO_NHI_IRQ_STATUS			0xd0000
>> +#define APPLE_CIO_NHI_IRQ_ENABLE			0xd0010
>> +#define APPLE_CIO_NHI_IRQ_THROTTLE			0xd004c
>> +#define APPLE_CIO_NHI_IRQ_THROTTLE_INTERVAL_MASK	GENMASK(15, 0)
>> +#define APPLE_CIO_NHI_IRQ_THROTTLE_GRANULARITY_NSEC	256
>> +
>> +#define APPLE_CIO_SRAM_IOVA_BASE			0x10000000
>> +
>> +#define APPLE_CIO_NHI_BOOT_TIMEOUT			10000 /* ms */
>> +
>> +/*
>> + * The Apple vendor-specific extended capability contains a cable-information
>> + * word which has to be programmed from the USB4/Thunderbolt details reported
>> + * out-of-band by the Type-C PD controller. It must be programmed into the
>> + * host router before link discovery starts.
>> + */
>> +#define TB_VSE_CAP_APPLE_CABLE_INFO			0x01
>> +#define TB_VSE_CAP_APPLE_CABLE_INFO_PRESENT		BIT(0)
>> +#define TB_VSE_CAP_APPLE_CABLE_INFO_ORIENTATION_REVERSE	BIT(1)
>> +#define TB_VSE_CAP_APPLE_CABLE_INFO_ACTIVE_CABLE	BIT(2)
>> +#define TB_VSE_CAP_APPLE_CABLE_INFO_BIDIR_LSRX		BIT(3)
>> +#define TB_VSE_CAP_APPLE_CABLE_INFO_20_GBPS		BIT(4)
>> +#define TB_VSE_CAP_APPLE_CABLE_INFO_LEGACY_ADAPTER	BIT(9)
>> +#define TB_VSE_CAP_APPLE_CABLE_INFO_TBT2_3		BIT(10)
>> +
>> +struct apple_cio;
> I think you may not need the forward declaration here.

Yup, I think that's just a leftover. Will drop it.
>
>> +struct apple_cio_altmode {
>> +	struct apple_cio *acio;
>> +	struct typec_altmode *altmode;
>> +	struct notifier_block notifier;
>> +};
>> +
>> +/**
>> + * struct apple_cio - Apple Converged I/O block
>> + * @dev: ACIO device
>> + * @np: ACIO device tree node
>> + * @rtk: RTKit instance for the ACIO co-processor
>> + * @rc_base: ACIO root controller registers
>> + * @rc_res: ACIO root controller MMIO resource
>> + * @rc_tunable: Tunable sequence for the ACIO root controller
>> + * @sram_res: ACIO co-processor SRAM resource
>> + * @sram_base: ACIO co-processor SRAM
>> + * @reset: ACIO reset controller
>> + * @pd_list: Power domains used by the ACIO block
>> + * @lock: Serializes cable transitions and ACIO power changes
>> + * @current_cable_info: Cable information currently programmed into ACIO
>> + * @target_cable_info: Cable information requested by the Type-C PD driver
>> + * @nhi_boot_completion: Signals completion of the NHI bringup
>> + * @nhi_boot_status: Status returned by the NHI bringup
>> + * @connector: Type-C connector firmware node linked to this ACIO
>> + * @typec_lock: Serializes Type-C alternate mode attachment and removal
>> + * @typec_notifier: Type-C bus notifier used to discover partner alternate modes
>> + * @tbt_altmode: Thunderbolt partner alternate mode subscription
> @tb_altmode if possible
>
> The driver uses "tb" everywhere so that's preferred for consistency.

And I thought I got them all! Fixed that one (and another one below) as 
well!

[....]

>> +static const struct apple_rtkit_ops apple_cio_rtkit_ops = {
>> +	.shmem_setup = apple_cio_rtkit_shmem_setup,
>> +};
>> +
>> +static int apple_nhi_probe_irqs(struct apple_nhi *anhi)
>> +{
>> +	char name[64];
> I think you can move this into the block where it's used.

Yup, will move it.

>
>> +	int nirqs;
>> +
>> +	nirqs = platform_irq_count(anhi->pdev);
>> +	if (nirqs < 0)
>> +		return dev_err_probe(anhi->dev, nirqs, "platform_irq_count failed\n");
>> +	if (!nirqs)
>> +		return dev_err_probe(anhi->dev, -EINVAL, "no interrupts found\n");
>> +	if (nirqs % 2)
>> +		return dev_err_probe(anhi->dev, -EINVAL,
>> +				     "invalid number of interrupts: %d must be even\n",
>> +				     nirqs);
>> +	anhi->nrings = nirqs / 2;
>> +
>> +	anhi->rx_irqs = devm_kcalloc(anhi->dev, anhi->nrings,
>> +				     sizeof(*anhi->rx_irqs), GFP_KERNEL);
>> +	if (!anhi->rx_irqs)
>> +		return -ENOMEM;
>> +	anhi->tx_irqs = devm_kcalloc(anhi->dev, anhi->nrings,
>> +				     sizeof(*anhi->tx_irqs), GFP_KERNEL);
>> +	if (!anhi->tx_irqs)
>> +		return -ENOMEM;
>> +	anhi->rx_irq_names = devm_kcalloc(anhi->dev, anhi->nrings,
>> +					  sizeof(*anhi->rx_irq_names), GFP_KERNEL);
>> +	if (!anhi->rx_irq_names)
>> +		return -ENOMEM;
>> +	anhi->tx_irq_names = devm_kcalloc(anhi->dev, anhi->nrings,
>> +					  sizeof(*anhi->tx_irq_names), GFP_KERNEL);
>> +	if (!anhi->tx_irq_names)
>> +		return -ENOMEM;
>> +
>> +	for (int i = 0; i < anhi->nrings; ++i) {
>> +		snprintf(name, sizeof(name), "rxring%d", i);
>> +		anhi->rx_irqs[i] = platform_get_irq_byname(anhi->pdev, name);
>> +		if (anhi->rx_irqs[i] < 0)
>> +			return anhi->rx_irqs[i];
>> +		anhi->rx_irq_names[i] = devm_kasprintf(anhi->dev, GFP_KERNEL, "%s-%s",
>> +						       dev_name(anhi->dev), name);
>> +		if (!anhi->rx_irq_names[i])
>> +			return -ENOMEM;
>> +
>> +		snprintf(name, sizeof(name), "txring%d", i);
>> +		anhi->tx_irqs[i] = platform_get_irq_byname(anhi->pdev, name);
>> +		if (anhi->tx_irqs[i] < 0)
>> +			return anhi->tx_irqs[i];
>> +		anhi->tx_irq_names[i] = devm_kasprintf(anhi->dev, GFP_KERNEL, "%s-%s",
>> +						       dev_name(anhi->dev), name);
>> +		if (!anhi->tx_irq_names[i])
>> +			return -ENOMEM;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static unsigned int apple_cio_ring_index(struct tb_ring *ring)
> This can take const
Ack
>
>> +{
>> +	struct apple_nhi *anhi = nhi_to_anhi(ring->nhi);
> And this can be const too.
Ack
>
>> +
>> +	if (ring->is_tx)
>> +		return ring->hop;
>> +	else
> Drop the else here.
Ack.

>> +		return ring->hop + anhi->nrings;
>> +}
>> +
>> +static void apple_nhi_ring_interrupt_active(struct tb_ring *ring, bool active)
>> +{
>> +	struct apple_nhi *anhi = nhi_to_anhi(ring->nhi);
>> +	unsigned int idx = apple_cio_ring_index(ring);
>> +	u32 reg, interval;
>> +
[...]
>> +static void apple_nhi_release_irq(struct tb_ring *ring)
>> +{
>> +	if (ring->irq <= 0)
>> +		return;
>> +
>> +	devm_free_irq(ring->nhi->dev, ring->irq, ring);
>> +	ring->irq = 0;
> I think it reads better if you do
>
> 	if (ring->irq > 0)
> 		devm_free_irq(ring->nhi->dev, ring->irq, ring);
> 	ring->irq = 0;

Agreed, will change it to that.

>
>> +}
>> +
>> +static void __iomem *apple_nhi_ring_desc_base(struct tb_ring *ring)
>> +{
>> +	struct apple_nhi *anhi = nhi_to_anhi(ring->nhi);
>> +	void __iomem *io = anhi->nhi_base;
>> +
>> +	io += ring->hop * APPLE_CIO_NHI_RING_STRIDE;
>> +	io += ring->is_tx ? APPLE_CIO_NHI_TXRING_DESC_BASE :
>> +			    APPLE_CIO_NHI_RXRING_DESC_BASE;
>> +	return io;
>> +}
>> +
>> +static void __iomem *apple_nhi_ring_options_base(struct tb_ring *ring)
>> +{
>> +	return apple_nhi_ring_desc_base(ring) + 0x10;
> Here maybe use macro for the 0x10 magic number.

Ack.

>
>> +}
>> +
>> +static void apple_nhi_ring_configure(struct tb_ring *ring, u32 flags, u32 e2e_flags)
>> +{
>> +	void __iomem *options = apple_nhi_ring_options_base(ring);
>> +	struct apple_nhi *anhi = nhi_to_anhi(ring->nhi);
>> +	u32 sof_eof_mask;
>> +
>> +	lockdep_assert_held(&ring->lock);
>> +
>> +	if (ring->is_tx) {
>> +		/*
>> +		 * All TX rings share what macOS calls a shared buffer with 232 entries. This is how
>> +		 * macOS splits it up, ring 0 only carries control packets and gets the minimum.
>> +		 */
>> +		if (ring->hop == 0)
>> +			writel(2, options + 4);
>> +		else if (ring->hop <= 5)
>> +			writel(40, options + 4);
>> +		else
>> +			writel(5, options + 4);
> Any idea what's special with the ring 5? And why the numbers 40 and 5? I
> think they refer intra-domain shared buffers (which is what we are going to
> use for XDomain connections in Linux going forward too).

No idea really. All I know is that there's some string calling these 
"shared buffers" and that there are 232 in total.
macOS assigns two to the first ring (probably because it only has 
configuration traffic and doesn't need more), then 40 to the next 5 
rings (which are presumably used for xdomains most of the time) and then 
5 to the rest (which I guess are rarely used) so that it ends up at 232 
spread across 12 rings. I think the setup is arbitrary but I have to 
write something >0 here or otherwise the ring won't work IIRC.

>
>> +	} else {
>> +		sof_eof_mask = ring->sof_mask << 16 | ring->eof_mask;
>> +		writel(sof_eof_mask, options + 4);
>> +		writel(sof_eof_mask, anhi->pdf_base + ring->hop * APPLE_CIO_NHI_PDF_STRIDE);
>> +	}
>> +
>> +	/*
>> +	 * The firmware samples the ring configuration when the valid bit is set and E2E flow
>> +	 * control never engages when configured afterwards. Write everything at once like macOS.
>> +	 */
>> +	writel(flags | e2e_flags, options);
>> +}
>> +
>> +static bool apple_nhi_add_links(struct tb_nhi *nhi)
>> +{
>> +	struct apple_nhi *anhi = nhi_to_anhi(nhi);
>> +	struct fwnode_handle *endpoint, *remote;
>> +	struct device_link *link;
>> +	struct device *consumer;
>> +
>> +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(anhi->acio->dev),
>> +						   APPLE_CIO_USB3_ADAPTER, 0, 0);
> Okay they have the power contract as part of the DT description that's
> good. I just worry that if they change the USB3 Gen X adapter place this
> will break.
>
> Do you have a snippet what it looks like in DT description?

We don't use Apple's Device Tree at all, we make up our own 
representation for Linux device tree and supply that in our bootloader 
m1n1 to the kernel. See the dt-binding commits and the later dts commits.
If the adapter place changes the new hardware will get a new compatible 
and we can determine it from that one then. The other alternative would 
be to just walk through all ports (except for the type-c lanes) defined 
in the DT and just add all links here. It's a bit moot right now since 
we can't do runtime or proper suspend anyway yet.

I'll need those graph connections later on for PCIe and DP tunnels as 
well since they need a software notification whenever a tunnel is 
brought up or torn down. Here's how the connection looks like right now 
though. It's a graph connection that's also used to e.g. connect dwc3 to 
the Type-C controller. This hasn't been reviewed by the devicetree 
maintainers yet:

  &dwc3_0 {
ports {
#address-cells = <1>;
#size-cells = <0>;

port@1 {
#address-cells = <1>;
#size-cells = <0>;
reg = <1>;

dwc3_0_ss: endpoint@0 {
reg = <0>;
remote-endpoint = <&atcphy0_usb3>;
};

dwc3_0_usb4: endpoint@1 {
reg = <1>;
remote-endpoint = <&usb4_0_acio_usb3>;
};
};
};
  };

  &usb4_0_acio {
ports {
#address-cells = <1>;
#size-cells = <0>;

port@4 {
reg = <4>;
usb4_0_acio_usb3: endpoint {
remote-endpoint = <&dwc3_0_usb4>;
};
};
};
  };



> (I'm still in progress to setup Asahi tethered boot on my m1 mac so cannot
> check it at the moment).

You've probably found it already, but we have a guide here: 
https://asahilinux.org/docs/sw/tethered-boot/
Let me know if you run into any issues!

>
>> +	if (!endpoint)
>> +		return false;
>> +
>> +	remote = fwnode_graph_get_remote_port_parent(endpoint);
>> +	fwnode_handle_put(endpoint);
>> +	if (!remote)
>> +		return false;
[....]
>> +
>> +	mutex_lock(&anhi->tb->lock);
>> +
>> +	if (!anhi->tb->root_switch->drom) {
>> +		dev_err(anhi->dev, "no valid host DROM in the device tree\n");
>> +		ret = -EINVAL;
>> +		goto err_unlock_tb_domain;
>> +	}
>> +
>> +	if (!anhi->tb->root_switch->cap_vsec_apple) {
>> +		dev_err(anhi->dev, "unable to find VSE Apple capability\n");
> Maybe "missing Apple VSE capability" or so because finding was already
> done.

Ack.

>
>> +		ret = -ENODEV;
>> +		goto err_unlock_tb_domain;
>> +	}
>> +
>> +	ret = tb_sw_write(anhi->tb->root_switch, &acio->target_cable_info, TB_CFG_SWITCH,
>> +			  anhi->tb->root_switch->cap_vsec_apple +
>> +			  TB_VSE_CAP_APPLE_CABLE_INFO, 1);
> I would prefer if we could keep the USB4 stuff outside of the host
> interface. It should be fine to do this in tb.c based on the capability but
> getting the cable info there is tricky :(

Hm... I wonder if adding apple_cable_info to struct tb and then 
something like this would work

anhi->tb = tb_probe(...);
anhi->tb->apple_cable_info = acio->target_cable_info;
ret = tb_domain_add(anhi->tb, false);

since I have to call tb_domain_add for each new cable that's connected 
anyway. I'll give it a try and maybe move the VSE cable bit #defines to 
tb_regs.h as well then.

[...]

>> +
>> +static int apple_cio_prepare(struct device *dev)
>> +{
>> +	struct apple_cio *acio = dev_get_drvdata(dev);
>> +
>> +	guard(mutex)(&acio->lock);
>> +
>> +	if (acio->current_cable_info) {
> This could use a comment too explaining briefly why.

Sure, I'll add a comment. It's required for now because the power domain 
would be brought down during suspend and neither the PHY nor this driver 
has the proper bringup sequence right now. We'd just resume into an 
SError because bringing this all up again requires more than just 
enabling the power domains.



Thanks,


Sven

