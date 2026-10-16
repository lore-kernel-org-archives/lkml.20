Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D43B5AA671;
	Fri, 16 Oct 2026 18:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792174424; cv=none; b=e8CpUBumAafahodFXN3uJItSiz0biIzE2+9ElXt7MGSVsnB/lDfJ1qCpnrIt91utd4ZFxUmaZ1dIPzU9Sjf2bCTGe5TOcweucq0q+BDZj45JUDcCCfgeyN7zwvSkO04TgjIqzmtJcZNjOhlkxP+X9HAexdo6FSCKsnVW0p+vNW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792174424; c=relaxed/simple;
	bh=U7yEG8UPjnbkYVj7PAK2SWUfhEahVqNNM5HNCuTOawo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i68nHXrNUJuWYj6AzPcN8E6RVX2JFyFSpTC2JvQhADlHMMpt9NN3oh8JmxjgBFYn3U20jDtQIscKKZ6zwnBedYYW6/aMiBLzZYJY1ljNnO6z57IzxCxhkyTCD35HFLHUb85cYdKIoXhCjPDYrROr5Se3+18aoaVEiy+Pe8jmHgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FMjzzyfk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FMjzzyfk"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E16F14BF;
	Fri, 16 Oct 2026 11:13:37 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E59213F7B4;
	Fri, 16 Oct 2026 11:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792174420; bh=U7yEG8UPjnbkYVj7PAK2SWUfhEahVqNNM5HNCuTOawo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FMjzzyfk8F/+tjNxuUgszUujlARXNNzXOvPi9KToA/YXsqvsvqaX2SAuL7maUJNw8
	 PziVrP5emG/KFg1A8AY0YgivxX6KBkzDVrM4tv8dYITcXIZN7rB/s7j53wQUt2wDiH
	 I/1M2XXnAXbs3BQAVawj7/iiSM+6zr0Y+CPMZsiQ=
Date: Fri, 16 Oct 2026 19:13:28 +0100
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
Message-ID: <atJpPoYAsUECh7p0@J2N7QTR9R3.cambridge.arm.com>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-3-andre.przywara@arm.com>
 <aq1XmaBemuGybxp2@J2N7QTR9R3>
 <0c2c5cec-3e16-49a4-b304-ddd75de4cb19@arm.com>
 <as5EvNM9IUkGe6Lk@J2N7QTR9R3.cambridge.arm.com>
 <cf0ccb1c-42fd-409e-ba77-3837d5c905d4@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf0ccb1c-42fd-409e-ba77-3837d5c905d4@arm.com>

On Fri, Oct 16, 2026 at 06:42:52PM +0100, Andre Przywara wrote:
> On 10/13/26 16:48, Mark Rutland wrote:
> > On Mon, Sep 21, 2026 at 05:25:25PM +0200, Andre Przywara wrote:
> > > On 9/18/26 17:24, Mark Rutland wrote:
> > > > On Fri, Sep 18, 2026 at 04:11:05PM +0200, Andre Przywara wrote:
> > > > > From: Salman Nabi <salman.nabi@arm.com>
> > > > > 
> > > > > The Arm Live Firmware Activation (LFA) is a specification [1] to describe
> > > > > activating firmware components without a reboot. Those components
> > > > > (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
> > > > > usual way: via fwupd, FF-A or other secure storage methods, or via some
> > > > > IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
> > > > > at system runtime, without requiring a reboot.
> > > > > The specification covers the SMCCC interface to list and query available
> > > > > components and eventually trigger the activation.
> > > > 
> > > > It'd be helpful to have a few basic concepts covered here or in the
> > > > code. For example, I have no idea what a "rendezvous" is, and it's not
> > > > at all obvious from the code.
> > > 
> > > OK, I can give a brief summary of the concepts, but I guess doing this a top
> > > comment in the source file is more useful than here in the commit message?
> > 
> >  From my PoV, even placing that in the cover letter would be fine. The
> > key thing is just to get enough context to be able to review this
> > without having to ingest the entire LFA spec.
> > 
> > In particular with "rendezvous", I have no idea why the admin should
> > have any choice at all, and without some context I can't tell if there's
> > some sensible use-case I'm missing.
> 
> The admin should indeed not have a say, and if the firmware component
> requires rendezvous, it will always be used.
> But for firmware that claims to not need any rendezvous, we default to using
> it anyway, because it's the safest way to guarantee continuity for the
> kernel. We don't know which firmware services might be affected, and if they
> respond with something like -EAGAIN or just block for a longer period during
> the activation. The kernel seems to rely on the firmware services (TRNG,
> SoC-ID, SCMI, ...) replying, once they have been initialised, so them
> suddenly returning an (even transient) error will probably confuse the
> drivers.
> So the safe way to do this is to send all cores into the firmware
> regardless, there they cannot do any harm.
> 
> Now as users asked for it on the list, if the admin knows exactly that this
> firmware component does not provide any services to the kernel (say some fan
> controller), they can override this policy and allow a single CPU to trigger
> the activation. This was meant as a compromise to keep the kernel side sane,
> but still allow less disruptive updates. The idea would be that some user
> space component sets this attribute at boot time, if it matches some UUID
> that is known to be safe.

I don't think it's a good idea to leave this up to the admin. The admin
has no idea what the kernel will depend upon (especially as this can
change over time), and if they get it wrong, everything is broken.

If LFA permits arbitrary firmware components to enter a transiently
broken state, then the LFA design sounds broken.

You said someone asked for this on the list; can you shre a link?

[...]

> > > > > +static const char *get_image_name(const struct fw_image *image)
> > > > > +{
> > > > > +	if (image->image_name && image->image_name[0] != '\0')
> > > > > +		return image->image_name;
> > > > > +
> > > > > +	return kobject_name(&image->kobj);
> > > > > +}
> > > > 
> > > > As before, please just use the UUID.
> > > > 
> > > > I *assume* that we cannot have more than one image for a given
> > > > component, and hence we cannot have two entries for the same UUID? Is
> > > > that mandated by the LFA spec?
> > > 
> > > The LFA spec speaks about "firmware components" as its area of interest, by
> > > design all the real firmware *image* related parts, for instance how the
> > > firmware update image lands on the system, is left implementation defined.
> > > So yes, each firmware component, identified by its UUID, appears only once
> > > in the system, by design.
> > 
> > Ok; does the spec *clearly* mandate that?
> 
> Well, there is only one logical bit (somewhat confusingly named "activation
> pending") to say whether an update image has been provided for a specific
> component or not. If someone pushes another image, it would replace the
> already "pending" one (depending on firmware policy).

My concern here was more that each UUID appears only once. Where I said
"image" above, please read that as "component".

Does the spec clearly mandate that each component UUID shows up at most
once?

I know it's "obvious", but people WILL get this sort of thing wrong
unless it's in black-and-white in the spec.

Mark.
