Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6834835E1AA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 23:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791587590; cv=none; b=LdeoCcJwdTBKK3VI/uGZTqBqQq1flCplxRd6zE4To3C/0yUNRbjq4j1V8SLAim01WdujQaxC/nPxIOiO4LZQDyrCSNfFDHttGNFfV04iNnFY233xE1xyq+qKuu/0ExZASwc6ZBEw4EVR7zbFVcnH6HIeWZOqKmMgOug7gLqJZFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791587590; c=relaxed/simple;
	bh=s83eBtjs3CTrQfA5p5bneQvSXUthPyRrCQt/cuRlAWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8hjWUfS+m+PscjUeFfqvQVkgcG7inU8qXTADIOItEMSTu32fawna9S8eKwb2vSYRa2XSFfCurdhaL9uLJNJ82oZjP7MFiWxW7TDHqVd741hKQEhkKUxdQSnhHUwP51tZLbPwS3OFCPs1q8ENv1+Od30P0L6JSCh96MEL8fLjo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSMdQkWx; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSMdQkWx"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-351767ef18cso561667eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791587588; x=1792192388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0dVfqbuQS0jFBu7gqbbTWIDQC9KN8X3iAuJsotVEqB4=;
        b=PSMdQkWx7b2coIGL2T13rtqUvxtq6ErCgJ9yg8LzK9+P/FdY3r442He4UmVICfIfdA
         g5XP6k9KZZptBJMUPuezbZ2CL0GJeLg4egTE6WTvCox9J76l3yshdzINgY3ZxGbfyF0W
         E+FNYxqA9TgRIC02fAWiGYnOhxVHjfnpCx5ToreerP1IRxFRHnBhOOrbFCVRt2bVq+C2
         h7+l+8gegRwPKCpOcpZQadN3W5Lvv9Ld9rBi4S/VDeDLek2jQ3KHsX5al/TCx6a2oc7T
         nTKYiyc0YUV2FApXiqmnF1zgFFs0q26b3PvwC8iWB9BSDmxIlWuiCc89eShw8Vf1Akkw
         4rEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791587588; x=1792192388;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dVfqbuQS0jFBu7gqbbTWIDQC9KN8X3iAuJsotVEqB4=;
        b=vVjHFMor8MPLeg26Ax4sojJVmB2rvXbZd/EbuSa8hqWvSrrXHasdZ0OWbsBmq4aqJv
         jowrCS/2QV9iQBsZM9PDU0vksVDGFD3mEs5s/s2BSorqfNt1gEwafFW9ri+kzC6Z7P2Q
         PApp/GrPWoYiRNP4PalQ+lIFzkxLeO3s0WWIEdHeKmSPREGmUXI5AKmCxOnLg5dDgq4E
         v6avGmdPW/WFI0eQHalWbzBdXyWrDTJryR+I2p7X8jphub1oe/uJTi1R0jZAYmFfuWw9
         Ffnp9qX7/PRy+M3g1QYHFVKI0OuAgMcBw6J6G4qkxHPvcYiFZJoksN8x41DJS4xpuNH2
         UgjQ==
X-Forwarded-Encrypted: i=1; AKwUvBynJlq7jRtrIXZAHTYzU5sfIygo0hVE9AWOKBb4ZaukpMf8e2FT/zvn3Rseae2RJvsDgyAbIVaoWDfWlYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcy1bEB4N5G627/+LVYULioJlOPS2KThCIg5azUWO/q6ANP9eq
	9rLnt+KeaKkknhaZMg5aqzn9/576Fr0eKYGwNBEhuIzwRqACmOHg/nDx
X-Gm-Gg: AYBFou1BRmNWCOpi094/E+7UYGjCqPiB5ke7FXD3ue3A+5wPeV2nxG7U6jbx3DDmFxB
	fjTImpqEV6JHgMsRpEraBteDwfcfFMPhh2NP/s6W0LlLvss8Km40nfckbdiiDQGfI4JWUbtBHTK
	RVX2pzLbOnYEX5p1s2v0bwFUAYdeBs7Yl3jwhtT1Y74KYFeeLcX1tc2iLLmE0DBlqtWCQjBXM+D
	h5KgOI4rAqMxqlt13SmPgv6thO79Ll1hLs8ds/8xrUXNw1Cl7bVXhpznQfAFPbIk8GFthQPlNhf
	ECMSSEVk36d2pB8nmoI6658BcneVkWQIWZ4YUQPpRLB+DnQDdCCZagnZiFkB67C73BShRIe8KCj
	5W+aeF3GKQyd/kkaF0ekzQK0TqRLHMSNWa1V+lZ5nN3weHu2FONQ+mWaNuUDdlyaHT3xSN8I3EQ
	twF/Qk/n1SsXalcr9tpp7/FCSIQtNaCOP+5BSowIvdzFPqHQPRl3i3WkbAm2nnwDWGQf3A06IS+
	ne/mJXrO9gVeUWGFe+78ZfWKybP1zS50s+E7Lxqx86yUaTKYSs=
X-Received: by 2002:a05:7301:18a3:b0:353:8122:27b4 with SMTP id 5a478bee46e88-35381226e68mr4262353eec.18.1791587588247;
        Fri, 09 Oct 2026 16:13:08 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7ea:19aa:c6f7:8c02])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d202sm8687858eec.13.2026.10.09.16.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:13:07 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:13:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>, 
	Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] wifi: carl9170: revert broken devres conversions
 for input and hwrng
Message-ID: <aslvBb9VbMvnHmHi@google.com>
References: <20261008-carl9170-reverts-v2-0-3ecb12089797@gmail.com>
 <5771235e-fa91-402a-b5d2-ebb153872c26@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5771235e-fa91-402a-b5d2-ebb153872c26@gmail.com>

Hi Christian,

On Fri, Oct 09, 2026 at 09:37:36PM +0200, Christian Lamparter wrote:
> On 10/8/26 11:39 AM, Dmitry Torokhov wrote:
> > Commits 23de0fa0d2a0 ("carl9170: devres-ing hwrng_register usage") and
> > 87ddb2fc29f1 ("carl9170: devres-ing input_allocate_device") converted
> > the HWRNG and WPS button input device registrations in carl9170 to
> > devres attached to the parent struct usb_device (&ar->udev->dev) and
> > removed explicit unregistration from carl9170_unregister().
> > 
> > In carl9170_usb_disconnect(), the driver calls carl9170_unregister()
> > followed immediately by carl9170_free(), which frees struct ar9170
> > inside the interface .disconnect() callback before devres_release_all()
> > runs. Furthermore, devres on &ar->udev->dev is not released on
> > interface unbind or registration failure in carl9170_register().
> > As a result, both the WPS input device (whose input->name and
> > input->phys point into freed memory) and the embedded struct hwrng
> > remain registered after struct ar9170 has been freed, leading to
> > use-after-free bugs.
>
> Ok, so you just reworded your patch? Sight...

Yes, as I promised I would.

> looking at the WPS input
>
> |        input->name = ar->wps.name;
> |        input->phys = ar->wps.phys;
> |        input->id.bustype = BUS_USB;
> |        input->dev.parent = &ar->hw->wiphy->dev;
>           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> the input's dev.parent is set to ar->hw->wiphy->dev and not ar->udev->dev, right?
> Does this do anything at all? If not, why? The wiphy gets shutdown by
> ieee80211_unregister() and having the "freeing" stick around after the USB device
> is gone should not hurt, right?

devm_input_allocate_device() explicitly states:

	NOTE: the owner device is set up as parent of input device and
	users should not override it.

That is because managed input devices split teardown across two separate
devres entries: devm_input_allocate_device(dev) registers
devm_input_device_release() on dev, whereas input_register_device()
registers devm_input_device_unregister() on input->dev.parent.

Overriding input->dev.parent splits those two actions across different
devices: if carl9170 is unbound from the USB interface (via sysfs unbind
or rmmod) without physically unplugging the USB device, or if
input_register_device() fails, &ar->udev->dev is never unbound and
devm_input_device_release never runs, leaking struct input_dev and an
input-core module reference on every unbind/rebind cycle.

I'll look into how to make input core reject such overrides. So far
there are 4 drivers that do that and I'll fix them up.

Also, using ar->hw->wiphy->dev as the input device's parent has
its own issues: wiphy devices can be renamed ("iw phy phy0 set name
...") or moved between network namespaces ("iw phy phy0 set netns ...").
Because phyX sits under a netns-tagged ieee80211 glue directory whereas
input_class is not namespace-tagged:

- renaming phyX changes the input device's sysfs path without emitting
  KOBJ_MOVE uevents for child input/event devices (leaving udev's cached
  DEVPATH out of date); and

- moving phyX into another netns re-tags the phyX directory to that
  namespace, turning /sys/class/input/inputN into a dangling symlink
  in init_net.

> As for the hwrng, wouldn't it make sense to use the wiphy dev there as well?
> So the whole reverting can be sidestepped by simply going with wiphy dev.

If we do that then unregistering of input device and hwrng will happen
inside ieee80211_unregister_hw() -> wiphy_unregister() -> device_del(),
which will hold both global rtnl_lock() and wiphy_lock(). Unregistering
the HWRNG there stalls global RTNL while hwrng_unregister() waits on
cleanup_done for any in-flight read to finish, whereas explicit
carl9170_unregister() tears down both WPS input and HWRNG upfront before
wiphy_unregister() acquires rtnl_lock() and wiphy_lock().

Until carl9170's own lifecycle (carl9170_alloc()/carl9170_free()) is
managed via devres on &ar->intf->dev, explicit unregistration in
carl9170_unregister() is the right way to manage these sub-devices.

Thanks.

-- 
Dmitry
