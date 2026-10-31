Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793464502;
	b=5sIQEQOqFa4dadjE6BqJVLduIpwww2w4o3g6t4UVjs3vivwaRYr7w54PNxsIqZoVL50v
	 hWMNXkY55weuv3pmot79k/A215qmImymnRuuarONHuSqRzwf8CqMbmbNtKJx9YkBtMZnO
	 zGw6RD8vzYKxs8sSjpEK96K2zme3OgqtRJOnpZNPCT5f6/u5hyTXjs2M8e9sYPUW+RrB9
	 E/VQ2UFXl/iacahYDgh+SGW2uNz5scCHCR2pbpwSWYfg0Ms/bxbOywva+BJ9B9yjaK5Ln
	 ztP3li0cNsm8C9gMgDe70FlBWklCNFi99oNvSSTo20em7YuCvUtvnudYEHY91BmQe6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793464502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xh4+zw2NsvluCtokX+uj0ZJ8AJtCAX02SKccWbKLLC0=;
	b=YQqx55jtO3pp2qayh2UunNpOWZbWRZ2RNb6LSv/AycWr26Zk1HF75LtXmU4gQi6uXVkg
	 tsRza5Q3PyQwXICBFOEkkFpCsqHd/Kww3/+ekXvUMRWV8TXuAdryLo4XI+IkV4WGbXUeT
	 BdlB6nzq6fUAg78Yd9Zo3gYcOiR2WEzlgyob2og5WD0Q2MNbrK67BGiWomu8vHy7dVheB
	 OiQoxxhCqGOo3m//AEChBu6VHh3z6KYwikYz2R03hTAQR5sJysHKQ4h3SQ6jHm9vw11op
	 QeBypHpJiybyyOAVkNDXBALeMDUTdl+uFgon21olFEqVOg11ER7GgqZZPjW6HnQMevA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aoGh7ssH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37446606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37446606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aoGh7ssH
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6798d4ab549so1549639d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793464500; cv=none;
        d=google.com; s=arc-20260327;
        b=GeEM3R0crkCzVzLjuvpWkXSFo34k+reo4jtWmuDeW6rKiFYCtPMxAA1Z1x3Dvu52az
         JgJkQere7GVuzY6Lw4odQoH1VKblv0Y6o0rZZ+1OFgfC5t6kd8Z5lkJhtXnDPvQNh9VW
         8QnpCnH5TTvvjYBIuig40kAftWWNJRfOXQIGMRDP/iAVXFOcKNcb8F/kbJiHyRkNBnVj
         XGHCOOpB6R8+N28pKSQLENt9QZ7ORrgjiItbgAIRGZ/IBAv1z6IBHpiX4OiidTHJAOrD
         ft8CjojNBYzsz9W5lwlWhGm74WPNt1QwDdE17P6FOBzJ7FFKAQg47QcpoYSmcJS6pYNY
         4F3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xh4+zw2NsvluCtokX+uj0ZJ8AJtCAX02SKccWbKLLC0=;
        fh=vn8dSN8Pj5LJ5CAmKDEif9jEtFIHJu8K8a81pe54ymE=;
        b=e3VP0gmmoke4wf7IZc3kRmzqD+Xu2+vtiEWPXDo9eEOZdZz1r8HkIzxjbqdLbn4gVd
         VjxZMgmAlSSssac83Cfe1TAXgp5LRZxc8YObvYzJNmKIC5nfT8UlFzOnL5mdZXzBO9Cm
         q6VXgxzAxedin01GmKqmagr/UO4ghEmJOparnX+lgBbW/YQ7OgsZzxAyQJPzx3Rb31TN
         8kbCdHxkP0zAF3hD9UYPOyGLQjvSGeEzp62wK1nKYTl9M51pPTn9CKoYr6bQXLj/lt2o
         l2YPa+ZNx4e4JXC8+euvFoRPh/4D0AN64UxdzhrS62P0AkOc13SBCYb5YHt6LEt8x1ga
         g2Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793464500; x=1794069300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xh4+zw2NsvluCtokX+uj0ZJ8AJtCAX02SKccWbKLLC0=;
        b=aoGh7ssHfNysRe5jjmPgNWP2iUPMihCYZefxsE3tpQ9LphCWyBj4OK3S4KDNQ5jwfP
         IT/89J2p6IUzDvRJ68We+2Ppy2slsfAHcfiShOCjkxu9sv1zYo6Hvhr3LtzO/OPGfcNW
         a2Vj+U9zpY8qjlEVpmE2OjRnqH0D3pIDSmJ9J8U5eFqrPU8yhUIfIh1jvgca4/jMa3XX
         VM5N5UbZpJV6nr/Ey73inhA0XaLsFEv6zFZ9gC0kHGltgMf0/7/eIh1cJm5iBOapYIZW
         AH2oQQ3jmjHHPJNWEaLqqZYsVpFHnqbA5WI3R+w4NyOI9wZnK6n9Ms6YYMfftP+CYut/
         lgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464500; x=1794069300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xh4+zw2NsvluCtokX+uj0ZJ8AJtCAX02SKccWbKLLC0=;
        b=VUax1vk6GrgWsx1rb4ME5JrwqJ1uwDKlE5D3IVrdeVr+QHOvs1ME1HCq1jk1ALjLDv
         3us6CVTfm60biXZ2As9C7ib/ZF85mZD55lx38dcnwMpDg69g5IvC1fEK/dJkhfYKOti5
         HAWVf0YsOttnA0I34laFJvQxloA2Benm/5K8hi/Hy/xMpWDMsFALTJJzRovKARIEeltL
         Oan/jxTeSwca0nxVwz1e1hAsZl8n8UTVDQdatMoT9vJVK8X1t34kkgaLETSLwP/pUbKS
         CPutSVJCYxd/NtMy47bS7nMYacmR5cFmkgQzzNYVi/vcnrjszx6eeG6JZdJB0HPoOsV5
         sxPg==
X-Forwarded-Encrypted: i=1; AKwUvBzxemeLtLKg3doSUGPHUwssqcQ2WEGzH+zPvH+OQ7UmXHCkheqDkGKqONe8IC0XS86jLseSAHnP/4BxRCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vRWrD3YQXazVfEAxi3TueFrJv8+BIwEOxsWu6Lpd7ZSAnyED1
	kJ5e1UumteVKz0+ketHCuSlhtxc7YOigL5FhVMeuglNGFkwEwQfjH5cO9ZPPVifGbRrIlxmqxmb
	rtTTYTeKdtG/7+LJzo7kb3Cvy20qU528=
X-Gm-Gg: AYBFou3cRtOeenACG9iEdrNNUttEQFGXf3mYxT/K2ty+32WFsGwMzcyBgwFLUKhqKSO
	Aa8agnxLR44K1wI/DC7NCUeUUB1yQE1JvzYK/JuI3AhBUyV6F3kLRHU1RKwtkeHyXUZ8yMctO7G
	6+vksDYnug1wmVE+qXK1uS2fNzpVSm4KahKRukrLHNOlauP5OSX98S1RTlup4wfjAoYX4xmkGr3
	kLVM8iX6E7nhV1pXWojjOSuC7hWY0gCTASK+r92mWhc5IgKM9aZHVrvkwitfDzqM+CzG/akoh8R
	yr6DEtfmbhF+Gxv7LJFRO5IcQwFuNqt2eWiO28+4XVHlBbtxJ+wSRN85wxWFtVYf5a6xKsJMPzr
	lUEuhWaOm79cOKzqLpJdeIt1T/ERJIWihGqQ/vljNmRUowRIOBwy+AKyyK07N
X-Received: by 2002:a05:690e:4514:10b0:670:fe59:3f7d with SMTP id
 956f58d0204a3-67ba502f92amr2477741d50.52.1793464500102; Sat, 31 Oct 2026
 09:35:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-img-pm-autosuspend-v1-1-26851840a34e@linux.spacemit.com> <DMHSRIU2XCB0.35RV6ADY6W1IE@kernel.org>
In-Reply-To: <DMHSRIU2XCB0.35RV6ADY6W1IE@kernel.org>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 1 Nov 2026 01:34:49 +0900
X-Gm-Features: AclHuK-jvh4fcghfPZ1KFb682ZDJ6x2_Cukku_cOj7Mrng853tNlYasYF_Ksjf8
Message-ID: <CAKbEzns6CYjNXmf4jTx_eGSH2j6AjpKJPx=EtoqxweGLiQ85JA@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: retry runtime idle when firmware is not
 yet idle
To: Troy Mitchell <troy@kernel.org>
Cc: Baihui Liang <liangbaihui@linux.spacemit.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Yixun Lan <dlan@kernel.org>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baihui, Troy,


On Fri, Oct 30, 2026 at 10:55=E2=80=AFAM Troy Mitchell <troy@kernel.org> wr=
ote:
>
> Hi Baihui,
>
> On Thu Oct 29, 2026 at 4:38 PM +0800, Baihui Liang wrote:
> > Returning -EBUSY from ->runtime_idle() prevents the PM core from
> > retrying the idle check. Schedule an autosuspend so the idle state
> > can be re-evaluated once the firmware reaches ROGUE_FWIF_POW_IDLE.
> >
> > Signed-off-by: Baihui Liang <liangbaihui@linux.spacemit.com>
> > ---
> > Tested on SpacemiT K3 (PowerVR Rogue BXM-4-64) by running vulkaninfo
> > repeatedly. Without this change the device intermittently stayed
> > runtime-active after the last user went away, because the firmware had
> > not yet reached ROGUE_FWIF_POW_IDLE when the idle check ran. With the
> > change the device reliably suspends.
> > ---
> >  drivers/gpu/drm/imagination/pvr_power.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/=
imagination/pvr_power.c
> > index eb4b6ecdf4f..6f38249ffcb 100644
> > --- a/drivers/gpu/drm/imagination/pvr_power.c
> > +++ b/drivers/gpu/drm/imagination/pvr_power.c
> > @@ -434,7 +434,16 @@ pvr_power_device_idle(struct device *dev)
> >       struct drm_device *drm_dev =3D platform_get_drvdata(plat_dev);
> >       struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
> >
> > -     return pvr_power_is_idle(pvr_dev) ? 0 : -EBUSY;
> > +     if (pvr_power_is_idle(pvr_dev))
> > +             return 0;
> > +
> > +     /*
> > +      * Firmware not yet idle; reject but schedule autosuspend so
> > +      * runtime_idle() can be retried.
> > +      */
> > +     pm_runtime_autosuspend(dev);
>
> If I read the PM core correctly, when this autosuspend timer fires it
> calls ->runtime_suspend() directly rather than retrying
> ->runtime_idle(), so this looks equivalent to returning 0. Could the
> real issue be the pm_runtime_put() in pvr_watchdog_worker(), which
> perhaps should be pm_runtime_put_autosuspend()?

I think sashiko's point is valid.

Calling pm_runtime_autosuspend() from pvr_power_device_idle() when the
FW is busy only adds a delay, and the device is then suspended without
re-checking idle, and this is effectively the same as
returning 0. I guess it worked in testing because the FW was busy at
pvr_power_device_idle() time but reached idle before the autosuspend
delay expired.

How about moving the pvr_power_is_idle() check into
pvr_power_device_suspend() (and dropping pvr_power_device_idle()), and
returning -EBUSY after pm_runtime_mark_last_busy() if the FW is busy?
The PM core then reschedules the autosuspend regardless of whether the
last put comes from the watchdog or elsewhere, so suspend is retried
until the FW becomes idle.

I think this is the pattern described in
Documentation/power/runtime_pm.rst, section 9 ("If the
->runtime_suspend() callback returns -EAGAIN or -EBUSY ...").

--
Thanks,
Gyeyoung
