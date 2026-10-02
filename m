Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1B34657F5;
	Fri,  2 Oct 2026 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930712; cv=none; b=fBKaju9MB8/tCS2jvQinfGQFeUIoAS6lWOq36Vm+kj69bMN6BATGJcf791dkWr3kRkiZ9+iE7Bqj2FAm7Exq9ijiIP05ANxkUeIbLwQptEyYujgrUjCC2uLeiiLHF+dw9vE4O4/207Xi2UnLdJu6was3TfFaMGFqazWqQ3/ObjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930712; c=relaxed/simple;
	bh=/rBvAO/AZQc/jN4k2Xar6jPktmwSC1dqu1j1mnmcMGM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N9ulqvtFy3QqH1z/8mtIAjK/laF1BHBPyJ0uERHUuAskKFW3kKYgapHTD1/hQlVviZNbvNs/TRhfZhdQFMNvszIbMODThoNZ9UY9CA4vuZooZYDlokq25V8+rLLH1w0yq+nGvGDEZgKksQujfcNiKnNX9wqWDb5RVtJ8HV6smaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2S/r/LX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2S/r/LX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42051F000FF;
	Fri,  2 Oct 2026 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790930705;
	bh=KhwYdb5g90NJxDqqJyvRKBka+GvXTVinYKwenu04PuE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=U2S/r/LXHrpCOJf2df9QIp5aT+K3lkx4eIzQWAaZsvSJIJ2l8xM09rdwwU4+m3gkJ
	 Vrss+xG/GTPJFnGF+m9JMxdDcAEMrEVqYuDNe3iM8Vfvwmp6W5DmcS+k7ETQ1df8Hy
	 hfi0TzjNZGnMaxdxNWK3CAOZ2PORHbNis2nf7mAgWy4v/PtPAWO6R4zRraYl2HDAFR
	 FCd/9Iw+5OU2dqQ3gpGsz1eqZ/S37FjtLCDFsmYTs+/lTgc1c67Wmd5jrKfp953lJ+
	 peqWuTg/eaBNxIYYXMnibZWqG9gVOEUwm+w/WmbHG1dXUV1ldUnZEMPQOfy6q6MG7b
	 xCO0jQIsZ2Myw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Michael Riesch <michael.riesch@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 5/5] media: imx219: Add status polling using .detect()
In-Reply-To: <ar9bYNbuJHwpxlyk@kekkonen.localdomain>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <20261001-v4l2-sensor-detect-v1-5-a45993be17b8@kernel.org>
 <CAPY8ntCBcUXte5pAG+i0SRNC-z6GOjakfgGLjDm7D=z91A3uhg@mail.gmail.com>
 <ar9bYNbuJHwpxlyk@kekkonen.localdomain>
Date: Fri, 02 Oct 2026 10:45:02 +0200
Message-ID: <xhkdb8q4gv6cx.fsf@mkorpers-koolstof.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Sakari,

On Fri, Oct 02, 2026 at 10:21, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> Hi Dave, Mattij,
>
> On Thu, Oct 01, 2026 at 04:58:57PM +0100, Dave Stevenson wrote:
>> Hi Mattij
>> 
>> On Thu, 1 Oct 2026 at 13:55, Mattijs Korpershoek
>> <mkorpershoek@kernel.org> wrote:
>> >
>> > Userspace needs to be notified when a sensor connection status
>> > changes (e.g. disconnected at boot, then later reconnected) so it can
>> > react accordingly.
>> >
>> > Add periodic polling using a delayed work that calls .detect() every
>> > 2s and sends a KOBJ_CHANGE uevent with HOTPLUG=1 on status changes.
>> > This mirrors the approach used by DRM connectors in output_poll_execute().
>> 
>> AIUI DRM polls from within the framework (drm_probe_helper.c), not by
>> a workqueue in the individual drivers.
>> 
>> Admittedly V4L2 doesn't currently have a totally obvious place to
>> setup this, but it would be far less effort to have the polling
>> framework within the core code rather than driver.
>> Possibly initialised in __v4l2_async_register_subdev_sensor() based on
>> whether .detect is set, and cleaned up in
>> v4l2_async_unregister_subdev, with the workqueue calling .detect and
>> generating the udev event based on the return value? I think that's
>> feasible.
>
> Sounds good to me.
>
> I'd also put this behind a Kconfig option, the use case is rather special.

Ack

>
> Also there are different approaches to this: in some cases you may want to
> know the values written to the device's registers get updated so you write
> and read, then some devices might crash in a way they're not doing their
> real job while still allowing reading registers as usual. These are rare
> cases though.

As far as I understand, that's device specific so could be handled in
the device specific .detect() implementation?

>
> Should the interval be at least configurable? That indeed further suggests
> the use of controls for this.

I agree that the current polling interval is completely arbitrary and
not a proper value.
I'll move it 10s for v2 but will also look into making it configurable.

I'll also look into controls.

Thanks for the suggestions!

Mattijs

>
> -- 
> Regards,
>
> Sakari Ailus
