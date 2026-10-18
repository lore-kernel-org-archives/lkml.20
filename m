Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A49413221
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351564; cv=pass; b=QPAeMneL26xMCNWMSA4DBqpZFPTKWXH+7TiPASHYPjC1ElSAkDMTiRE8/F8VhhDwjaUYC42YLJ1swahc6LDP5TC78Gy5m3sUJhpnzcCDqzevEHuTn99qDqs0lK0gsnG6kESSO8fiLOtw6cf108XsNPDdYhjyFdfhICgRDzJxtA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351564; c=relaxed/simple;
	bh=g1sNKS6Y2D8MgzS3phRmfLPaJwlUJ8H+dXZDqf+DD7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MCSgwuiReXD/fgy9HgOHZrdMy3ytGzpxUvvFhPcGk0MXQt+d2ha7laPiN3HgRFATeAGTyoi4DZ1TyySNy4RURi3qYpWFNd0c5XVdoD5MG6bfNP4PLVyXE0dSdvscS/NrkFIKAjEYgG4gat+YQvyBjcWU1jckQTkLfEHi2BowOIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMnPt26C; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMnPt26C"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f22a8515eso143586185a.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792351560; cv=none;
        d=google.com; s=arc-20260327;
        b=MKYXSsIslqEfNEgrbY2IBUwf5aIGxvvdesxkpRk4nXbcurlZgb7m7XI6CgbruKVfPa
         uSM2noZXak3uUzVACr7whHCXJ1cn19q7VniIZQUCPEeVaMCjnJ4oJRB20vyks4vIHGi2
         bOqZFD6FbN/uB6Qlo7AGTXy5Ywr37oVKxYEfIBPU/YbdYn/GIKnGe/T16tbakdHiTEqy
         3CmECnZpuJk6Zfm17sk03cAyk6bEoNMxZl2pPepuszZwgl7Ow1QM9NC5oyKSplurcFTb
         PJKt4qCR7F6smD6Qf6tgecXftJwWgtxYqb5SupTZWahKxYJKlolbUc4WYKfKcKHM6Wv5
         cODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f7bcklpKlwFfTmIsv/K4nQ97GKPuHRN3wR8aU9Whm6Q=;
        fh=jNFllKrZkSg9Jx31II+mG07Dc2aqjVgA/W/P4NIkXcM=;
        b=NceqnkmKifeARScg8hza/Nu2LZhtbPXYOTAO+EkSjZYLJHYXZ3EVDsnpqmrf6M1oQ3
         CcC4jIEqp/kfR3a8f+h8yQOKvhFS/hbGQYBDpNwNx+bZvpLuGoupPauWS6cQTa0dN+CP
         TzNOGr2FXi+G01dqweMDkTmGlzppftYbJ9a4nTTPM3X8MrLQmpXIoH5yme1JZ64yy/e8
         3yCY+ImGoVnWSDuYMtSp5PclZH6vyRz8oWrRJ045AFHWAYQvoY+Y4nvXfbtI+uDb9ZNB
         h0ZAj3fUmBFd50GeRM+8d+cWnRCoBKs+70sJ+DkZveRw4yaPczDElGtlDKpo0X1b83Sb
         ko4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792351560; x=1792956360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f7bcklpKlwFfTmIsv/K4nQ97GKPuHRN3wR8aU9Whm6Q=;
        b=nMnPt26CnIac7n2jE/Y8Et5SbElar+fak714AgkoMqNT9ZQxSUAmNXm2VbZaEqlmRY
         OCMTDEs76RpYVy8nqzslC8qNCRj5NnBq783/UgIFdP93cD+hpVR2MBmOh4IfWNM8WF7a
         BQxFz7vsEjnVHVPaoCbMX5DX0nYxLGZNpAJF3GGIaXMQiQjnXz8x8ue3rS2a6xEEmahr
         fzF/fPdTzLalQ0mSNXHVioTSjNHFvGGilWe+IF5PZ5LOAmwGm/e3GSglBsHNOjFoMrgV
         v8OOzRSwv0ZqGhFVkhrZh27pJidGlar8h6crRUmXT9pE7bUkPXTjN4yqQ+QZlB7YmRzD
         mXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792351560; x=1792956360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7bcklpKlwFfTmIsv/K4nQ97GKPuHRN3wR8aU9Whm6Q=;
        b=I7xECUUXBLdZKBl+eLf65LNMOB/9bZ5DSlYc++sT0lSOpoj5cAQrBhhjijfv0fw4Yt
         qa/CKJRye/Gqlme7C+9h+FcNHFx9+cEqXw1zUR7q5/w66pponqhqjcOtafksi2QaFxai
         QtpDzGXTbWzaClYS6/kvrqCAyjV7GbyekTzIgAb1+++Wwf7gB8zR+Fv14cCnXB5kTg3T
         5OFkZtJbxDITpzbQEmrsaTzCHnHsAI87x3AnccjZuch/VTEkWhdnZT4HO1cLY8WNwjW5
         EvwBPs/lMJA8PF1R4OiEShWjzFYR5oeE3qGQrtkAovellvamNoDWBa+dcvlM7xzJ99WD
         njjQ==
X-Forwarded-Encrypted: i=1; AKwUvByg45aDUVlxWPCLYJJt8QZoFVkyMVc/09c/ecIkgQoelK+E7P57tFk60U82xzpOaWM83AgtZGDMeMZNi2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLS33WvMTAUiQTh2apcR/gfgQzQQCwuOpcxUWvWbfjZjUf+a5Zq
	6l8ed75xbU/WoNyEKlOAye/Ccpm4zALGlDaBBqqIuizrHALqkXoob+7+5toiGXoIXDCESxEdyIj
	mVKh/+53VSXLN5j7viY813DVegsYuy4Q=
X-Gm-Gg: AYBFou3kJgXXfBl5ZXpYr93wKpGehfnrU3MJ22zmhIINrdk4v+DTsCqHuPgMQ5fEwmi
	zK3gAAedqgHlGdGpVZRq9C6lBOi2X1abzYONBUw3SfP4xWJzYnKYFLIfLau7ccINiD7cIvp0+pu
	CnrKtTsm7F1snxVYae32+pAVivQ5xBIAMsMTuNSfvxkmlCpyJ5VeOES5GQrfVFu9X6FD8FG1jcl
	+8L5BzEFqJEAay7pVm/MFBsjnk59pDiryV6+ZBdBLAOb3VXHsO54BoLT8ujf7wahwYGoY1rzF2Y
	dIQqUvR+YIH4kYkFy4TlSsKypX/rujRbLdPyuGJjKd7SDUbSHyieU+4=
X-Received: by 2002:a05:620a:3715:b0:93f:1823:308f with SMTP id
 af79cd13be357-93f29dabcdemr927150985a.81.1792351560281; Sun, 18 Oct 2026
 12:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017-zenbook-duo-keys-v1-1-45f72d3db5ed@gmail.com> <1a35e100-010d-4327-afe5-1d2496ad7e24@linux.dev>
In-Reply-To: <1a35e100-010d-4327-afe5-1d2496ad7e24@linux.dev>
From: Victor <victor.gillholm@gmail.com>
Date: Sun, 18 Oct 2026 21:25:49 +0200
X-Gm-Features: AclHuK8vhc7ir1MLvBSsSGSdg1S3U70fVAOXN5uE_S3fn1CjgTs2Ev7hqTK5k0Q
Message-ID: <CAKspSoNJxEcEH1AwXHyNY5cWVvCQ3LN0fcZ8d9ajAoShdBMRKg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: map ScreenPad and Task Swap keys
To: denis.benato@linux.dev
Cc: corentin.chary@gmail.com, luke@ljones.dev, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 10/18/26 20:02, Denis Benato wrote:
> The driver is handling the screenpad so why not implementing the
> functionality in the driver instead of doing the dance driver -> evdev
> -> remap -> driver ?
>
> Unless I misunderstood what you want to do... Hopefully not!

Hi Denis,

Thanks for looking at this.

Handling it in the driver would work, but the key would then only be an
on/off switch for the ScreenPad. If I remember correctly, on Windows the
same key cycled between modes: on, off, and using the ScreenPad as a
touchpad. If the driver toggles the power on every press, userspace
cannot do that, because the panel is already switched off before it
sees the key.

Reporting the key as KEY_F13 allows both. Users who only want on/off can
bind it to the asus_screenpad backlight device, so the power control
still goes through the driver, and others can use it to switch modes.

It also matches hid-asus, which already reports the same ScreenPad code
0x6a as KEY_F13.

While testing this I also found that the ScreenPad power control looks
inverted on this model (UX482EG, stock asus-wmi on 7.2.5). Writing 0
(power on) to /sys/class/backlight/asus_screenpad/bl_power switches the
panel off, about three seconds later its DRM connector reports
disconnected, and writing 4 (power off) brings it back. The result was
the same each time I tried. While the panel is off, actual_brightness
still reads 89, so the firmware seems to report it as powered. I can
look into that separately if it is useful.

> > + { KE_KEY, 0x9C, { KEY_F14 } }, /* Task Swap key on Zenbook Duo */
>
> Fair.

Thanks.

Best regards,
Victor


Den s=C3=B6n 18 okt. 2026 kl 20:02 skrev Denis Benato <denis.benato@linux.d=
ev>:
>
>
> On 10/17/26 20:13, Victor Gillholm via B4 Relay wrote:
> > From: Victor Gillholm <victor.gillholm@gmail.com>
> >
> > The ASUS Zenbook Duo 14 UX482EG has two keys next to the power button:
> > one toggles the ScreenPad Plus, the second screen above the keyboard,
> > and one swaps windows between the two screens (Task Swap in ASUS'
> > ScreenXpert software). They emit ASUS WMI event codes 0x6a and 0x9c.
> > Neither code is in the asus-nb-wmi sparse keymap, so pressing them only
> > logs "Unknown key code 0x6a" or "Unknown key code 0x9c", and both keys
> > are reported as KEY_UNKNOWN, so ordinary desktop key bindings cannot
> > tell them apart.
> >
> > Map 0x6a to KEY_F13, the same keycode hid-asus already uses for the
> > ScreenPad toggle code 0x6a. No existing keycode describes moving window=
s
> > between screens, so map 0x9c to KEY_F14, following the existing use of
> > KEY_F13 and KEY_F14 for other ASUS-specific keys in this keymap. Both
> > keys then emit distinct, bindable events.
> >
> > Tested on an ASUS Zenbook Duo 14 UX482EG: with this change the keys
> > arrive in userspace as KEY_F13 and KEY_F14 and the "Unknown key code"
> > messages are gone.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Victor Gillholm <victor.gillholm@gmail.com>
> > ---
> > Tested by building asus-nb-wmi against 7.2.5 and loading it in place of
> > the stock module. The key mapping was checked with wev: before the chan=
ge
> > both keys arrived as keycode 248 with no keysym, after it as XF86Tools
> > (KEY_F13) and XF86Launch5 (KEY_F14).
> > ---
> >  drivers/platform/x86/asus-nb-wmi.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/=
asus-nb-wmi.c
> > index 3b0f3346d..c6eb525ec 100644
> > --- a/drivers/platform/x86/asus-nb-wmi.c
> > +++ b/drivers/platform/x86/asus-nb-wmi.c
> > @@ -641,6 +641,7 @@ static const struct key_entry asus_nb_wmi_keymap[] =
=3D {
> >       { KE_KEY, 0x65, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV */
> >       { KE_KEY, 0x66, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV */
> >       { KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV=
 */
> > +     { KE_KEY, 0x6A, { KEY_F13 } }, /* ScreenPad toggle on Zenbook Duo=
 */
>
> Hi Victor,
>
> The driver is handling the screenpad so why not implementing the function=
ality in
> the driver instead of doing the dance driver -> evdev -> remap -> driver =
?
>
> Unless I misunderstood what you want to do... Hopefully not!
>
> >       { KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
> >       { KE_IGNORE, 0x6E, },  /* Low Battery notification */
> >       { KE_KEY, 0x71, { KEY_F13 } }, /* General-purpose button */
> > @@ -666,6 +667,7 @@ static const struct key_entry asus_nb_wmi_keymap[] =
=3D {
> >       { KE_KEY, 0x93, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV=
 + DVI */
> >       { KE_KEY, 0x95, { KEY_MEDIA } },
> >       { KE_KEY, 0x99, { KEY_PHONE } }, /* Conflicts with fan mode switc=
h */
> > +     { KE_KEY, 0x9C, { KEY_F14 } }, /* Task Swap key on Zenbook Duo */
>
> Fair.
>
> Best regards,
> Denis Benato
>
> >       { KE_KEY, 0X9D, { KEY_FN_F } },
> >       { KE_KEY, 0xA0, { KEY_SWITCHVIDEOMODE } }, /* SDSP HDMI only */
> >       { KE_KEY, 0xA1, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + HDMI */
> >
> > ---
> > base-commit: ea40f1e9f07aab937b9a217633be7a1f66260394
> > change-id: 20261017-zenbook-duo-keys-7e0b3f94354a
> >
> > Best regards,
> > --
> > Victor Gillholm <victor.gillholm@gmail.com>
> >
> >
