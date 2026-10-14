Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15439352C34
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958299; cv=none; b=YnJWabe66ZLJPJMJGOcmKPqfuqbonNtRvMrvt7/ZFbDEr7XJZKUC3fRaVQwlo/Zd51f5ARlfjoSEwDZneHNP6w1A3O0H3sB8ZPb3TkHF7M3VJKZ7YvLdgGZFjLJfEd81SVRzHi4+Kec1gpTh2M68MV1FjVyU0P4prBT+TVJ+uQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958299; c=relaxed/simple;
	bh=t1YRdeswWvqlBzieA3h2TG0wvtuBGH0lC1Eh/0VBSKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agsO9074/jHp9V/7385P9HKWW0e617R1no31gvoAgMKSvv86EgcvRpnf7s/FHoTVCEinmyX0qbKRTFVJvmQsv6sJ/d6VSBBOArn1Zp2emyE9Em4GnZTXN28bVnrccwmjgUuVkJhcbq4ShGv87AfIx1CD/sAm5/mOvQhUvmnW7xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXQ+WAKI; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXQ+WAKI"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so1070022eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791958297; x=1792563097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZm/vIlfQJTUqTZZrMVb2/qO3rbKTGj4bQH8tA6ISMs=;
        b=iXQ+WAKIWMWaSUel7dzLwhrZ3hpfkfspPAAA03VA8DnkuefZJ6gQJN+cFFMWMvZzDh
         RA5l2nNXNINMz54DwV192ar/ZwHa9NjwwkOQM2vsLpMhiehn/PdDCel0LvTi8Mf5+nLI
         jPIngFphnrHFJBf9tYAco+XEx/+i/9b30QbHPu48Lkhds7qNHczLbzOQ5wZmJ0mXHAgM
         zurgJvt/hR0KjjHJ211Hga3br8cko93KYsL7Sq2ThQLIc1jI1sv6G018ZgKdgsam5boy
         XWmpLZZ2EZ37Wo2j4d8baXTKpA1LRXeb2wmSmEdGtYdUrER2ktznD/IasKh3atRpkjqX
         5vYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791958297; x=1792563097;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZm/vIlfQJTUqTZZrMVb2/qO3rbKTGj4bQH8tA6ISMs=;
        b=NopYb9IKV8pffFmnykTHwNmFe+tRCC72QZXPtGVhn5ki7nQfJW53IsX8PRihFGxzYK
         pcbUTJFpctLzGcCWjo2Zc++KUvPT+Z8220CTqW19reBjw95uu+z8mnSdfKjG3hwc8HVg
         wGiSlyuf9Dc/6jK3v7neo63Wm/GUaOBhEHyHmMuH7J5yW7ROkXppVKE5edNbw3ri70Yc
         UaALuJirR279v3kIhQTArVJCIN0hsHHStsyVIMB9y3TngPuh3O73DsHZCUZbjdtxCf5W
         COf3vilFaYkGUarvYUKYw6oHNjPHll4zIweStYCILv5fKX4OdexWpS2R5k/x8m0SKH4B
         UNqA==
X-Forwarded-Encrypted: i=1; AKwUvBznmuv5gcPnXApwXbtGc078E1d4G9KYh/Ab3C6JnKZwQAdcKBAY0Zoa4k4RlZizvXNEOhtekEkvUN5S0Uc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIilOZzj3hVwQQatSzal/jBPEfzDx6htEIcykyXnWGYauc8D9VU
	YGwjydv0hZFntuuH965C6hU+hRqAiAqkMqZSiqbxNKSOX12CeFK7tfcr
X-Gm-Gg: AYBFou0D8caZm6FT9l098+QCxkCihVU+69HWXI1ONts5ZWk+2fWgAhXBcR0/+sQUN8x
	nOzLVn3QigSN9xFXgaAQDh9JgIVpCz+Kickrb4y+9sP27cHjXlJXlwGYAE+iGjX9Mvj8QRCRP8O
	7XR8yMdpYfbsO6CUtjLJO3y+PqVwMCEeJ7QZoneb5pIMKfEFavM4pPFs9NuIfwO5rv19MJ6dvgp
	5oKbWi6V3TgqgdY7/LOOLESaiSwqpYkg683rqOvxcrQIFyuqHeNTd9jxl/KqBkXDtV/w0hcPfYN
	m7xeXxdRvKz2hctF7PTGvbuSTcnTm3zUKkvKrp9YbCU4pW+i0cTsKVeJu9Wi9Wk05H8VGPsNwVv
	qr712nQBjNlBZdWAZrtjGAjAupVWHx/0VAtTRItvRyG4vItrwlxpRFjraLCRpChP35oytn/sEv0
	vIx7fd/bENMAASuRP32N/ZCApWoMDJ5o2+mie8XIlOGAQLnQdFZm16aCsZWTST+pfmVtxdYHYqx
	Mi3gm+FU025No7+oXIHFJo0nud1CGvpEia7q2oC
X-Received: by 2002:a05:7300:de48:b0:353:82b2:205f with SMTP id 5a478bee46e88-35382b220a7mr18363369eec.16.1791958296806;
        Tue, 13 Oct 2026 23:11:36 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:875a:117f:b9ea:5a08])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm39504600eec.15.2026.10.13.23.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:11:36 -0700 (PDT)
Date: Tue, 13 Oct 2026 23:11:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: fix race between bus_remove_driver() and
 dev_driver_uevent()
Message-ID: <as8dAu4R99pP1GHD@google.com>
References: <as71DkwHeLGNDsPv@google.com>
 <2026101444-unnoticed-caliber-21d5@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026101444-unnoticed-caliber-21d5@gregkh>

On Wed, Oct 14, 2026 at 07:31:19AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Oct 13, 2026 at 08:24:20PM -0700, Dmitry Torokhov wrote:
> > When a device driver is being removed, bus_remove_driver() removes the
> > driver from the bus klist before detaching it from bound devices. If
> > dev_driver_uevent() runs concurrently on another CPU, it may acquire the
> > bus klist lock after the driver has been removed from the list, read the
> > still-valid driver pointer from the device, and access the driver's name
> > while bus_remove_driver() proceeds to free the driver structure.
> > 
> > To close this race window, acquire and immediately release the bus
> > drivers klist lock after all devices have been detached. This ensures
> > that any in-flight uevent generation that observed the driver pointer
> > before device detachment completed finishes reading the driver name
> > before the driver structure is destroyed.
> > 
> > Fixes: 18daa52418e7 ("driver core: fix potential NULL pointer dereference in dev_uevent()")
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> > 
> > Extremely unlikely to hit so I would not worry about backporting to
> > stable.
> > 
> >  drivers/base/bus.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> > index d17bd91490ee..8b3aaf451e4f 100644
> > --- a/drivers/base/bus.c
> > +++ b/drivers/base/bus.c
> > @@ -830,6 +830,15 @@ void bus_remove_driver(struct device_driver *drv)
> >  	driver_remove_file(drv, &driver_attr_uevent);
> >  	klist_remove(&drv->p->knode_bus);
> >  	driver_detach(drv);
> > +
> > +	/*
> > +	 * Ensure that any concurrent dev_driver_uevent() that observed
> > +	 * dev->driver before driver_detach() cleared it, finishes
> > +	 * accessing drv->name.
> > +	 */
> > +	scoped_guard(spinlock, &sp->klist_drivers.k_lock) {
> > +	}
> 
> Shouldn't the compiler just no-op this away into nothing?

It better not. Why would it?

Thanks.

-- 
Dmitry
