Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793852934;
	b=FeCoUe7Dhp7vVIwtRzPFMzDJWf6AdToOS8n5+36FXMCa8cRxq5KNwSJbBbqSR9i7pmWo
	 JD1qTMDFHH1s7qaA80+Uy/I/bjxNd+VMHCk2F6XAvwbCdH5oFAGbCmuxv778Uapvunfoy
	 E27UDZ44d9R7mzeEQIKTDuqreG95RK01Fp0c6hfY18HJ23xxBgRL4f9A8UnYhggwLrQOE
	 sS+DugTp+2rVZtXYW+c9NliT/Qizgz2cekXuvqiJwXlUIA4ZSKrgrAu3Z2+Oacf8zYfdX
	 mQPLg91PnqAo0lOHc+bzOxQ53WTPyaLeZokQbghji1q3V0dEhCAwhIq5fyLCneT89Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KEm42QihUL6odJc0vgDavSCwsWRiCbS6wHuc5+HRkrA=;
	b=tRGM40GpWYUZtV2p0lwbiLDEthf8wgem+b66+5Bqqr/e+fL7xOWNUf2kmJnfqahDf5tF
	 2SKrIWzH5b7nN1/VgqFms9lYvSv8qAwXgBmIRobFhavN2MX9DiyD5X7r8AZWJa09H77q4
	 ZZK4/h+E1qAfJ1Kl444mpQFrLmNqMp8YQ0julvX3Q6kIKGtTYuU0+T0Hq0UKcgvdaHwvZ
	 H9j6Ybio5/v/UJINsxjao7PoecwZwbSUcK7PWCqDIXMBcVh8jjTOv2Dq0Zl9+Y0Q32BDV
	 5RW45WC76DclzYxXfXlX69iJyV39K+yVvWb2bii+64r2dYaHxIh26GEh1h6tYaAYaTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Pz8epZir;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A783C606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A783C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Pz8epZir
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533861a59b8so14333471cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793852933; x=1794457733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KEm42QihUL6odJc0vgDavSCwsWRiCbS6wHuc5+HRkrA=;
        b=Pz8epZirP16nHrgC4NO3PtdE3tUSEr3wJ+iQYqzaekJJRox81tcwLnWeIbBdoJMsvU
         uvgXwQF5elg9BvTN6nZS3BJ5NvVeNpCkEZHrA+i7J9fDvWGr3EN5ttyWtefaDG4Q/6nn
         I46sb4z0BLAyOZdtWa+LKOXoaQJNAvFaemIe9+Z9HALKuCgoTtMkrIIez2l/2sHwOQmG
         RrVrbh3rzYmaTo0NjYPEcbp5eDJM2cknb2pJhClM1wA32YSQxQ26JB2IEFMVDcVTvX3n
         7virYrZ03byn73qeFxsEGsKhTU26y450YpB8T0hRjsUlCjjfI/9os3AXNPTT8YmnFrlu
         p4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793852933; x=1794457733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KEm42QihUL6odJc0vgDavSCwsWRiCbS6wHuc5+HRkrA=;
        b=KMaDl/TWyG6gpYtRwV1GTzejph6jT0DktJ2l7aDvYOR6rvz7p+nNfoVakSVRYJ6KUj
         CJqCuWmWrcxDaivbNUtv0q6tvQ3QKL0/cvSW9qSxhHVezL86ko+N2b1IN9/hEWAGCtF3
         bjjvmnf5nRm0wKa5EWnWzkty7izHnm2+X2xqkBZl+nF10gtfzZD0IzE+TN9O5Wc2BSaY
         7LZLfHcVCty39NNGWUABB7Mf/NAw+pwRPzvbXdtwREn5Y+JOFXDMMojepAi9jZqWvIST
         c3cywwhLj+cdOKEpqeiiyVLbQ+p3UwRfMiw5GUK5A4mzugugpsfxxY9FACsdtbyXZY3+
         K27Q==
X-Forwarded-Encrypted: i=1; AKwUvBxjX0fyFcjq8uC06MzZmqFGQymYQZZU9lhOklUlTz7hhwMrdTEyEHaOwEUTzZJ/cRmNBTRikAkOjHNlbD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LDFNK/i6kMYaS7UgD5nBK/ajbRDWBY7RFId5qz18dPIkVd+8X
	BxP+FKVWGWsLqgE1WpILUVJxVhOT+3xnvYPN7JTszMHaPMl8Hu6hTkNBax//qPPKYg==
X-Gm-Gg: AYBFou1kHjcvfq44vgBX7t+lWE5MSfbLyDt2UJzob+yjZrh5JxuZIT/9iCXrafJH+jU
	3oME31efh7qFyLNubsWDcbTiAuyFhlgdSqosPm4nBHnLKtrnzKVA07Dbu+TnuCbOTjIkaWOekL9
	J+PhHKR0VwJ0scW1GUi3WMaOvqGtHjx+jFVD6k8b8L6aqBGU5zbbxy3fJnRDJrdp+2arYNGE5yv
	wVheO6uoCKUe+/9g2CeJshCprD3kxiIMHwAP+ELmUXPZzROQJeuoU3vyfpWyOHeLxek7GNRGQyd
	4uSxhYKte6+d2zlXuJ6rMFBcP20pgPsJpKQ5QUed6TARpVXbbZHKgtEQZgsl0JH/kp12esHSry9
	cMqmrIkejl/QAvJNssnHADcmzyY1eJ+kmOz1a9WoDTp+8N3/CwFHU5KGEjAFl/loI02jJwWE01i
	4Z+53L6elwGldbBkjl0DEVce8Bsv33ZK4hFJzquwg4JtyT6vFPOYDX725QwL7FcvUyAX/O9Q8Bq
	0QjgRqrbu+zGiSdJYZhqwmgpKyEGmQ3DMirgGhHPe5Bwbx7Z6ZNoERPbjYadErIAKoIHoaEnMIU
	BNy56pcP/e9xV4Q+R+M6ncjaxUVs
X-Received: by 2002:a05:622a:514c:b0:53e:82eb:c111 with SMTP id d75a77b69052e-542b75248f7mr298071241cf.36.1793852932573;
        Wed, 04 Nov 2026 20:28:52 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e9378dc70sm16474186d6.37.2026.11.04.20.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:28:51 -0800 (PST)
Date: Wed, 4 Nov 2026 23:28:48 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v5] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Message-ID: <82a746b7-4e87-4d46-88c3-bb881f11b8de@rowland.harvard.edu>
References: <20261104000031.679944e7.michal.pecio@gmail.com>
 <20261104035637.3325-1-25031212351@stu.xidian.edu.cn>
 <20261104151544.26672-1-25031212351@stu.xidian.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104151544.26672-1-25031212351@stu.xidian.edu.cn>

On Wed, Nov 04, 2026 at 11:15:44PM +0800, YuanZhe Liu wrote:
> Alan,
> 
> Thanks - that is a fair point, and I agree that the generic exposure is in
> the core: usbfs can drive port state on a hub whose driver is being
> unbound, and usb core does not serialize the two.
> 
> The awkward part is where the lock would go.  do_proc_control() releases
> usb_lock_device() around usbfs_start_wait_urb(), so the control request to
> the hub runs without the device lock, while usb_unbind_interface() ->
> hub_disconnect() holds it.  Making those two exclude each other on that
> mutex would mean holding it across a synchronous URB, which I do not think
> is acceptable.
> 
> Two shapes I can see on the core side:
> 
>  - refuse or queue hub class requests to a hub while its driver is being
>    unbound, or
>  - make usb_disconnect() of that hub's children wait for in-flight
>    port-state requests on that hub first.
> 
> I am happy to prototype either one; tell me which you would prefer.

I'm still not certain I fully understand what's going on here.  It 
sounds like one thread uses usbfs's do_proc_control() to send a 
Set-Port-Feature(suspend) request to a hub, presumably without claiming 
the hub interface.  At the same time, another thread tells usbfs to call 
usb_driver_release_interface() for the hub interface.  Is that right?  
If so, read on...

The issue here isn't a race, or locking, or a matter of a port's state.  
The real problem is that userspace can use usbfs to send a 
Set-Port-Feature request to the hub without claiming the hub interface.  
If usbfs had to claim the interface then the problem you encountered 
could not occur, right?

It looks like check_ctrlrecip() needs to be more careful.  A whole bunch 
of requesttype/request combinations -- basically, anything that isn't a 
GET-* -- should be forced to call checkintf(ps, 0) if the target device 
is a hub.  After all, we don't want userspace interfering with the 
operation of the hub driver.  This special hub-class handling should 
come directly before the code for the printer class.

Can you write a patch to do this?

> What is xhci-specific is that xhci_hub_control() is the only one of these
> paths that walks per-device state: xhci_stop_device() looks up
> xhci->devs[slot_id] and drops xhci->lock while sending the stop endpoint
> commands.  ehci/ohci/uhci only write port registers there, so the same
> interleaving does not give them a use-after-free.
> 
> So I would like to keep the xhci hunk as well, as memory-safety hardening
> for the case where the core does not catch it.  If you would rather see
> the core change first, I can send that separately and rebase this on top
> of it.

That's fine; I'm not concerned about the xhci-hcd portion.

Alan Stern
