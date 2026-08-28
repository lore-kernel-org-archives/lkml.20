Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368BF36C581
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932263; cv=none; b=rO+qvTP9bUffhb0Yl0JeD4dycy/Xa61n3CiOe83kIhH/iNG5OVjWqiXvLKQnrNv36hZepCV5e4HkYc01KEqk++0S7TIEhKs9ttGBFIYBhWu3auUZysE59rJSuId0MUtke859F6HhKja0ZSpbzDCGxVHXMLKp7rzaqblqoZsxTyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932263; c=relaxed/simple;
	bh=ReIfV+XfN9CJ7gWGHVy+pvxz4t/Bfm9Oz0pHx1zUvmQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JQXzH+5IPdaycmo3pmNMx/JqqGNjiosQYKpKcrVPvu2oMh+oLA4yD9ibmlfnozU1BoiInKebGbtsNIDD+4iQGV7cxQXTm1CRpma7bfotb2xF9Kq/x+mIaR0cIMw+VJcdLaAwJWF+QVtnSrBuk/C08wb5IqT9E0VqGj5qmLP74S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Po3ok6Co; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Po3ok6Co"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a60a4f1ae2so1476640a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787932256; x=1788537056; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNXgP9aiWGCY8sBDBkxQ5jGmQfHLh/8XePeePdlfGZw=;
        b=Po3ok6CoqSt0K7p74Ie5YqBocIN+aT+ywCfyYaEW0nyMCqj9P2obgLfhD1uZp3moPR
         ZOwWxmFXCI4XDkVBaGeCOC79P3b4afBm7F8wF/CDagFghN/DdWkDh3WWpmvzWgeMl8Ve
         eca34GBPI/3jBYUahiMGbh+fyAxAcAry29jpcoG/RZlzJRU8VaCUWm3Cdjp6/uGeN7DS
         HGzO3pufLwguWh5e7bjNyWFERjBLppaSQ1XxS2i6ZDmHfUq5tOZDA9ubLCvSxJww2WDu
         AbbuNAnwdQEZs0jiXOqJpPZa8qiJrE+Dw6WZmGLRPg5P12aM9fA796C0jcpqAOlJ90Ry
         rTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932256; x=1788537056;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNXgP9aiWGCY8sBDBkxQ5jGmQfHLh/8XePeePdlfGZw=;
        b=UueGePkNMRKGMAQh9Yez9/Z7BP59P//n1A0mRKrWq8f8VK6o3gLfNuyyB3v9+1IwXM
         Pc/ruy4QZK0l70BuA65+Izgygnt8ww9aG7dBUFHGJ4H2WD5EXq70QbpYXuGAnG/1TPDm
         R1zXD0tttV41Uscko96Zz8KBhA1x+R+4Ch2/VaYixqIo04rcHALASh9Rg0lIXYZncJz3
         hESaAlygDQq0l5slpnDv4Bw4Z6HZOLus+1eFjH0I5kDkb76ubdxez04fKrbAtOQZ0k+N
         JZmVv7zHp4mhw894slWLRJsv72z+nSVAore6L2Fj1svKFXxImEODd0H7BTJiry2EjnOg
         qRGw==
X-Gm-Message-State: AFuF++n4x4L1n2LkhzyqqDYCdwU9T0FePNpQS2afjpSqljJWKCi9xhGJ
	w4JKlZusXdr1sppmaUjcfB5QiMmEGV7f6N/pXfQ3CyCZ+XKTpy9s/9vZ5IaOFK3HOE63Prsm2e7
	M/NTgYQC3C5z1BVTIew==
X-Received: from edrb21.prod.google.com ([2002:aa7:d495:0:b0:6a6:a82:8b98])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5286:b0:6a6:1c30:bc4c with SMTP id 4fb4d7f45d1cf-6a61c30c3cfmr2134011a12.5.1787932256221;
 Fri, 28 Aug 2026 08:50:56 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:50:55 +0000
In-Reply-To: <20260821142414.150892-4-djeffery@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260821142414.150892-1-djeffery@redhat.com> <20260821142414.150892-4-djeffery@redhat.com>
Message-ID: <9huzjypaz1k0.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH 3/9] driver core: warn should device_move try to move a
 need_parent_lock device
From: tarunsahu@google.com
To: David Jeffery <djeffery@redhat.com>, driver-core@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Stuart Hayes <stuart.w.hayes@gmail.com>, 
	Laurence Oberman <loberman@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>, kexec@lists.infradead.org, 
	David Jeffery <djeffery@redhat.com>
Content-Type: text/plain; charset="UTF-8"

David Jeffery <djeffery@redhat.com> writes:

> Currently, no device has need_parent_lock set and is moved by
> device_move. need_parent_lock is only set by the usb bus and very
> few device types ever use device_move.
>
> Add a warning to device_move to catch should it ever be used on a
> device with need_parent_lock set. The combination would break
> the immutable relationship needed between parent and child for
> need_parent_lock when locking and unlocking both.
>
> Signed-off-by: David Jeffery <djeffery@redhat.com>
> Tested-by: Laurence Oberman <loberman@redhat.com>
> ---
>  drivers/base/core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index bd9c2921e326..75f5931165a8 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -4712,6 +4712,14 @@ int device_move(struct device *dev, struct device *new_parent,
>  	if (!dev)
>  		return -EINVAL;
>  
> +	/*
> +	 * device_move() should not be used on devices with need_parent_lock
> +	 * set. Concurrent reparenting will violate the immutable
> +	 * relationship needed while locking and unlocking both parent and
> +	 * child.
> +	 */
> +	WARN_ON(dev->bus && dev->bus->need_parent_lock);
> +
>  	device_pm_lock();
>  	new_parent = get_device(new_parent);
>  	new_parent_kobj = get_device_parent(dev, new_parent);
> -- 

Thankyou for adding this, Please feel free to add
Suggested-by: Tarun Sahu <tarunsahu@google.com>

Also, I have seen sashiko complaining about another problem with
device_move which is impractical/impossible. So I mentioning it below
for discussion/information.

Sashiko Claim: There is potential deadlock if a device is being
registered with DL_FLAG_STATELESS which skips the reordering of
the list so device_kset->list will have device dependent devices out of
order. Also same problem can be create by device_move.

=> This is impractical because a device being registered with
DL_FLAG_STATELESS must have its supplier already registered first
(Documentation/driver-api/device_link.rst) which inherently puts
them in the order.

Similarily for device_move() affecting topological order is very
impractical. Unless someone mis-use the API
device_move(..., DPM_ORDER_NONE). Which, as well, not favourable
on upstream.

Once topological order is messed up, neither async shutdown nor serial
(sync) shutdown can work. As it is precondition for it. except
DL_FLAG_SYNC_STATE_ONLY, which is handled in both implementation.


~Tarun

> 2.55.0
