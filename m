Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106853161A1;
	Tue, 13 Oct 2026 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902932; cv=none; b=h5ELq66xRYXR4Vl7a7KJnE9zppW0Upau0bT1H6MoBSKEFZr8ofYENAsjZzF59dndsHd60uY7rJFhwoNZK877deFk57OjsUkGY3ji7ePVmthxftNdOEx7FIV3lNsysFZjn9eMyB3kDb4wLtdYNqetPkLesNCXDXdOsanM/YVsMRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902932; c=relaxed/simple;
	bh=6Mpf79krShWnaJEYw6WC5auN4ScDBf+Thf8mKPqyUfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewNK5gmIGdmjeozQXYF6/X0tD0tT1iGWAXAdjVgiwaIkxmWkbPnHp8SU1CHtwUfYvHgjfged9etDPl3/T+wja4mQXWtljAC9aD92GwuJSWxKupn17crWEmcJoPeB7INEr7ut39fyBrYM1T4F2FYQRo63AG2SOuU+4Hg6JjhFCn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tVNX90S3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tVNX90S3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FEF4169E;
	Tue, 13 Oct 2026 07:48:46 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF6843F673;
	Tue, 13 Oct 2026 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791902929; bh=6Mpf79krShWnaJEYw6WC5auN4ScDBf+Thf8mKPqyUfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tVNX90S3cJHE2azRU8ptUyweodZBXMeuRDdPlQb6q5Jck9QwGXVuzU6rZAfO6ey2t
	 aGZpwemaltXQ/lAe1Px+MKtiw5QcRlGfnVlUL6Gam4EUZj9U88Lykf97xeI3p/MJ0y
	 9Z87KeabKRzguLRJM0Yil4MTB3nZCBPY2FHWpC6A=
Date: Tue, 13 Oct 2026 15:48:37 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 2/8] firmware: smccc: Add support for Live Firmware
 Activation (LFA)
Message-ID: <as5EvNM9IUkGe6Lk@J2N7QTR9R3.cambridge.arm.com>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-3-andre.przywara@arm.com>
 <aq1XmaBemuGybxp2@J2N7QTR9R3>
 <0c2c5cec-3e16-49a4-b304-ddd75de4cb19@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c2c5cec-3e16-49a4-b304-ddd75de4cb19@arm.com>

On Mon, Sep 21, 2026 at 05:25:25PM +0200, Andre Przywara wrote:
> On 9/18/26 17:24, Mark Rutland wrote:
> > On Fri, Sep 18, 2026 at 04:11:05PM +0200, Andre Przywara wrote:
> > > From: Salman Nabi <salman.nabi@arm.com>
> > > 
> > > The Arm Live Firmware Activation (LFA) is a specification [1] to describe
> > > activating firmware components without a reboot. Those components
> > > (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
> > > usual way: via fwupd, FF-A or other secure storage methods, or via some
> > > IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
> > > at system runtime, without requiring a reboot.
> > > The specification covers the SMCCC interface to list and query available
> > > components and eventually trigger the activation.
> > 
> > It'd be helpful to have a few basic concepts covered here or in the
> > code. For example, I have no idea what a "rendezvous" is, and it's not
> > at all obvious from the code.
> 
> OK, I can give a brief summary of the concepts, but I guess doing this a top
> comment in the source file is more useful than here in the commit message?

From my PoV, even placing that in the cover letter would be fine. The
key thing is just to get enough context to be able to review this
without having to ingest the entire LFA spec.

In particular with "rendezvous", I have no idea why the admin should
have any choice at all, and without some context I can't tell if there's
some sensible use-case I'm missing.

[...]

> > > +static const char *get_image_name(const struct fw_image *image)
> > > +{
> > > +	if (image->image_name && image->image_name[0] != '\0')
> > > +		return image->image_name;
> > > +
> > > +	return kobject_name(&image->kobj);
> > > +}
> > 
> > As before, please just use the UUID.
> > 
> > I *assume* that we cannot have more than one image for a given
> > component, and hence we cannot have two entries for the same UUID? Is
> > that mandated by the LFA spec?
> 
> The LFA spec speaks about "firmware components" as its area of interest, by
> design all the real firmware *image* related parts, for instance how the
> firmware update image lands on the system, is left implementation defined.
> So yes, each firmware component, identified by its UUID, appears only once
> in the system, by design.

Ok; does the spec *clearly* mandate that?

> So I guess using "image" everywhere is a bit imprecise, but I am bit
> reluctant to change all identifiers now. Not even sure "firmware component"
> is a well recognised term in the first place.
> 
> Let me know what you think about that.

Using "component" sounds fine by me. Then we can clearly describe
loading an image *for* a component.

... unless I'm still misunderstanding the terminology here? I assume
"component" is a logical entity, and "image" is a specific binary blob.

[...]

> > > +static int activate_fw_image(struct fw_image *image)
> > > +{
> > > +	int ret;
> > > +
> > > +retry:
> > > +	/*
> > > +	 * cpu_rendezvous_forced is set by the administrator, via sysfs,
> > > +	 * cpu_rendezvous is dictated by each firmware component.
> > > +	 */
> > > +	image->use_cpu_rendezvous = image->cpu_rendezvous_forced ||
> > > +				    image->cpu_rendezvous;
> > > +	if (image->use_cpu_rendezvous)
> > > +		ret = stop_machine(call_lfa_activate, image, cpu_online_mask);
> > 
> > What prevents cpu_online_mask changing under your feet here?
> 
> Right, I see. Is cpus_read_lock() safe to hold around stop_machine()?

Looking at the core code, the locking is handled within stop_machine(),
and since cpu_online_mask is a pointer, we can safely pass that around
without extra locking.

So this is fine as-is. Sorry for the noise.

[...]

> > This looks odd given call_lfa_activate() doesn't seem to distinguish
> > secondaries from one another. Does LFA expect all callers to pass the
> > exact same arguments for a "rendezvous"?
> 
> Yes, even though the spec doesn't explicitly mention this. But there aren't
> many arguments to deviate anyway: the FID and sequence ID are naturally the
> same, and the flags just indicate whether we skip the rendezvous, so that
> doesn't really apply here (and inconsistencies are checked and handled by
> TF-A).
> The LFA agent (the firmware side) just elects one primary core doing the
> work, I think in TF-A it's the first one doing the SMC. The others just wait
> in EL3, to not mess with the update process.

I think i'd be worth describing this somewhere. Even if just the level
of detail above, with a reference ot the relevant part of the spec.

[...]

> We had it like this originally in v1, I don't remember why we changed that,
> and it wasn't mentioned in any of the reply emails.
> Maybe I thought it looked neater to explicitly mark this as a retry, as we
> don't expect this to happen, normally.
> Will try to change it back and see what happens ;-)
> 
> > > +
> > > +	lfa_cancel(image);
> > > +
> > > +	pr_err("LFA_ACTIVATE for image %s failed\n", get_image_name(image));
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int prime_fw_image(struct fw_image *image)
> > > +{
> > > +	struct arm_smccc_1_2_regs reg = { 0 }, res;
> > 
> > Do you need separate input and output strutctures?
> 
> As mentioned above: in this case yes, since we call LFA_PRIME potentially
> multiple times, and then the function ID would be overwritten by the error
> return code, at least.

Ok, but you reinitialise 'a1' every time round the loop, so can you just
reinitialise the few registers you need each time around?

See below for a more concrete example.

> > 
> > > +	int ret;
> > > +
> > > +	if (image->may_reset_cpu) {
> > > +		pr_err("CPU reset not supported by kernel driver\n");
> > > +
> > > +		return -EINVAL;
> > > +	}
> > 
> > Unnecessary newline again.
> > 
> > > +
> > > +	reg.a0 = ARM_SMCCC_LFA_PRIME;
> > > +retry:
> > > +	/*
> > > +	 * LFA_PRIME will return 1 in reg.a1 if the firmware priming
> > > +	 * is still in progress. In that case LFA_PRIME will need to
> > > +	 * be called again.
> > > +	 * reg.a1 will become 0 once the prime process completes.
> > > +	 */
> > > +	reg.a1 = image->fw_seq_id;
> > > +	arm_smccc_1_2_invoke(&reg, &res);
> > > +	if ((long)res.a0 < 0) {
> > > +		pr_err("LFA_PRIME for image %s failed: %s\n",
> > > +		       get_image_name(image),
> > > +		       lfa_error_string((long)res.a0));
> > > +
> > > +		return lfa_to_linux_errno((long)res.a0);
> > > +	}
> > > +
> > > +	if (res.a1 & LFA_PRIME_CALL_AGAIN)
> > > +		goto retry;
> > 
> > Should this be a loop?


As above, if this were a loop you could do something like:

	bool retry;

	do {
		struct arm_smccc_1_2_regs regs = {
			.a0 = ARM_SMCCC_LFA_PRIME,
			.a1 = image->fw_seq_id,
		};

		arm_smccc_1_2_invoke(&regs, &regs);

		if ((long)args.a0 < 0) {
			...
		}
		
		retry = res.a1 & LFA_PRIME_CALL_AGAIN;
	} while (retry)

... and the initialization of the registers isn't a special case.

[...]

> > > +static ssize_t pending_version_show(struct kobject *kobj,
> > > +				    struct kobj_attribute *attr, char *buf)
> > > +{
> > > +	struct fw_image *image = kobj_to_fw_image(kobj);
> > > +	struct arm_smccc_1_2_regs reg = { 0 };
> > > +
> > > +	/*
> > > +	 * Similar to activation pending, this value can change following an
> > > +	 * update, we need to retrieve fresh info instead of stale information.
> > > +	 */
> > > +	reg.a0 = ARM_SMCCC_LFA_GET_INVENTORY;
> > > +	reg.a1 = image->fw_seq_id;
> > > +	arm_smccc_1_2_invoke(&reg, &reg);
> > > +	if (reg.a0 == LFA_SUCCESS) {
> > > +		if (reg.a5 != 0 && image->activation_pending) {
> > > +			u32 maj, min;
> > > +
> > > +			image->pending_version = reg.a5;
> > > +			maj = reg.a5 >> 32;
> > > +			min = reg.a5 & 0xffffffff;
> > 
> > You could use upper_32_bits() and lower_32_bits() here.
> > 
> > > +
> > > +			return sysfs_emit(buf, "%u.%u\n", maj, min);
> > > +		}
> > > +	}
> > > +
> > > +	return sysfs_emit(buf, "N/A\n");
> > 
> > Why a string rather than an error code?
> 
> This value is somewhat optional, it's only valid if there is an "activation
> pending" (read: an update image has been provided and waits for its
> activation).

I'm confused. This function is called pending_version_show(); is that a
different thing that's "pending"?

> But it's not really the firmware's or the user's fault here if
> that's the case (in fact it's the common case), so I am not sure if an error
> return is appropriate, since in the current state the value is simply not
> applicable. And the "cat" command returning with an error looks ugly. Since
> it's a string, it's easy to distinguish from any actual version number from
> userland, in scripts.
> 
> Any suggestion how to handle this otherwise? Just return -ENXIO?

If this is a legitimate state, returning a string is fine so long as it
is clearly documented.

> > [...]
> > 
> > > +static int lfa_smccc_probe(struct arm_smccc_device *sdev)
> > > +{

> > > +}
> > 
> > There was an interrupt in the binding, not detected or used here. What's
> > going on?
> 
> That's implemented in patch 6/8.
> That patch here is already quite large, also different parts (ACPI, timeout,
> DT, locking) were contributed by different authors, so I kept them as
> separate patches, to give credit and simplify review.
> I can of course squash them all in one patch, maybe it's time to do this
> now, but this makes attribution a bit fuzzy.

From my perspsecitve, if the interrupt is expected, it's odd to add the
probing support later. At this stage inthe series, the LFA driver will
probe even without an interrupt, but then suddenly stops later in the
series.

Mark.
