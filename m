Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B195B5AB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155019; cv=pass; b=suZ3WfIZhX+BENc1Vi4c+UrKzWojYupNYvxzdRTdbbja4tTJmdoW2msxsNxx6/EL4qMRqiRxQuP63FWbF5JN0YC7qzmfm4AG758HP5jKwztXPN8/w89OfJAC6Bbe3w2WDieuViwQbLDaZDDsaJQBHDFeRJ8iOwp8rhl8xBYgL+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155019; c=relaxed/simple;
	bh=1MtXL9mGYyLi0fjYCHpA9fWEu6AI4NWfXD4RPwcMmmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEt8dnI067Ud6YLdjho7S/0G6W0iiAYW5/qXLP3A6h5OUUZ+j+Enj05eZo9C6p7bn+VhrfMOKenL/s59IDbN8EerVb14u8BlaNWrwwdhHwAUDWKw5azwPZhR7J2+3SMUcQW5QOfbRA6hfAb0ViHSgnKDYryJSjLuEU+dQnIcIzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ID0hrt41; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ID0hrt41"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ad98c3fb15so54387457b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792155016; cv=none;
        d=google.com; s=arc-20260327;
        b=Q/rnS3m7DN/h6dIRbxo253ca0KDxc0TwYmqwITzeb8qcxLv7AkfboUuh/OhUHnKOpS
         +dMqWhZLN3whJFOyoqvwKBXbfP1tBtgZ86dgphSFMbCYD1gGoa4TQiqV+QR7N/swYbRt
         a1UwjM6Zwtt/zwbx2wU2DCVYlqVSjUY0qj0/ujF4X7HViIcTue+BT/mbRUWq5IQJ45fO
         Lv/H0GpUGzlfUD9SrvlDXCJ62yWZsBJ5NMslsEP0eBhRo+lS9UdnkkO1equAhIJ2rMMT
         JeiVnRp9MD4NUEkIrB2J6HAkJY5V3e8t/RlIo3AgkS/z7JuwmpJi5MD4c4yXB/hVEmbq
         ugVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ixZiXg3DpqQLlqPnsFNiW1oZccPMNZwd2UYeKFHm514=;
        fh=GNL8FsHRP5BkAN421pDwk3pvjbG96C9MFesXaCd1k0I=;
        b=MAOQPSZImSx0KRSunZCzZkrGz4F1+Qt64WEaNl4hGyGdVukzJBuB/H/gHSwgx+D7sr
         rZnrGw7lsu9oppkThpUoDGsxKQ841GuHuvZrg43nEk/z936zHQm8C7aJE5fJjQEREw83
         AZdijoMNmB0IB9Y0rtUM+k7Esu5+efin0mFCGwjnIyRsTp9u6YbmwzUBaW8NESERZ+W7
         AZ6Sj+d3uZMwCN+cheKz+jTPx7Lzy0WuBGIt2UNQopCUitowWl5U7sdHI2dUQSxTuHfF
         PkjI+CpisgamL/VEIj78FW4T9Q3R6dlNpsAijcV593XOQ3Q2A3U0izuNhbb2byr3xrGO
         omsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155016; x=1792759816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixZiXg3DpqQLlqPnsFNiW1oZccPMNZwd2UYeKFHm514=;
        b=ID0hrt41wdcA7HOdjTypyvqjK2+bp//oSrVanWKlVq+GjNEu1KvSL9Ko+A2OSqXnFz
         dF2ojdr4b95KFJc4L7kQGdhDGK1Qu/N2O5TrS6tEdRRY79T7TKH/jEoR8IgwYUtwNDux
         lrcxEX0obRU7r3Lgq9S63eAfC0aeditAHS/bghXiqj+qTZlErRgSkgQ+x13b1MQxRh7a
         Z4AgUB+OqGMbBY2dGaAt2neIIQnmtJjRujhquo7OAW1NwNrNKCKoXauPvyCsbg6EvENr
         fORFwJTxE5JQmGAJ7fnoBBupx+lHwcCxh2RxfzkexHCu/jPghxkABxXEEC+trG2lH/uy
         OhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155016; x=1792759816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixZiXg3DpqQLlqPnsFNiW1oZccPMNZwd2UYeKFHm514=;
        b=yGbhqni6XjRQRqyvepYzsIgoD+zyDNsIoi6dzRje0gP3Yp01YknTpEL8wM/ETJhcmP
         56Fku7PAYeGN/nGkaub0kUGwVvcTiK5L/bnbIRjY/aJdFsWxiy7QvdHLU+85jVZ0Wmz9
         8GwQgptQOcU6LCuvUaN6GMNL0s8YGur716HEKzy3OV/+CICG1vjZAfvQQ/tzGma3YvDe
         fNpHMJJ9ld5IVjDsvy2d1rj/PUrm1A/92JZuM5bd/dJHUMb1Rf6d3x2mJ6oaDt1bYKOU
         ESVklT1FyvWqJ0xwP2yyl+HRiWDz9DNGfd3a4hIyAxAHbQNUfudhF7rjX2COAfQY8BYS
         CF1g==
X-Forwarded-Encrypted: i=1; AKwUvBxSSpGQg4/p61SZYR29drLSOvyhC8g3Fj63+vktXy6HN4kiV6VCQzVUSn69uQyfQ5mcnp370U3/rRFBDsQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXMzjfgs3zy8GjZ8haarNhlj4QBktClGpWpBSUpTwicmKUAa4d
	zyPWdrbmk4dhL+st/Vtz1TmvZcCGGbblCgT8q32f6JFQnOSAnIY0xeIbXwqombDm0fBfKw5gQyK
	6ascOR35X3ybO3Zwp4kghLYNtYKi4JwU=
X-Gm-Gg: AYBFou3meSIveRpQ+VcO93hOmUlcnRJ2357T1c6pt9bWgGmYUNpERDjT4KO3ObKJzAl
	iEjXn2ttvXU1AAmvfkntxEXszIRTOMoFpa+Mw/TF1lAZXItQJ2NsryzCh4M7KSaR9DDjh6iw1t0
	Nx3unoCl8wyvQsaIIXz987h0MlUCGhRcHY3lfBiEotmkITjdu8SOSUvAAi4eHTOHxr1FGtd17z2
	H6X1yxsUbPtrFCyLbQp/KbuoZpEPgejIXaCLTJnVj23gXBPy8WA0S8+CuU444sGvZOOVcKeIT4Q
	Q7XKq6wNZ11wJ5CTfLQeOnfdrb4jbqIye+xNlOYhmTNEZje/OuvMoPRyJS37UAHxrwqBb2EdiHD
	AfkgEsqBpfCE=
X-Received: by 2002:a05:690c:a186:b0:8b0:d36c:14f6 with SMTP id
 00721157ae682-8b0d36c1ee8mr19025677b3.51.1792155016446; Fri, 16 Oct 2026
 05:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-7364ede2179b8830f660-v2-ca37049bc2e3679bb65f@gmail.com> <87h5iluaqg.wl-tiwai@suse.de>
In-Reply-To: <87h5iluaqg.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 20:50:04 +0800
X-Gm-Features: AclHuK_zr_wz7gkffPgcSUdCxRifxJeRFC54lcCq55oDX3Fga1mI679bJ9E-H0o
Message-ID: <CAFRLqsUi3te_Dq=o8jDCQyXMO+OmjEKMqa7n8KiRLbifRuHnsQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: dummy: Refresh the CD capture switch before use
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, thomas.weissschuh@linutronix.de, 
	kees@kernel.org, phucduc.bui@gmail.com, sammiee5311@gmail.com, 
	clemens@ladisch.de, tglx@kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8816=E6=97=A5=
=E5=91=A8=E4=BA=94 19:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, 16 Oct 2026 04:01:10 +0200,
> Cen Zhang wrote:
> >
> > The CD Capture Switch control must remain live while
> > snd_dummy_iobox_put() updates its access flags and uses its ID for
> > notification. snd_card_dummy_new_mixer() caches the control pointer, bu=
t
> > snd_ctl_remove_id() can unlink and free it without updating that cache.
> >
> > This requires a kernel caller to remove the switch while the dummy card
> > stays connected and External I/O Box remains writable. Userspace
> > ELEM_REMOVE rejects this driver control because it lacks
> > SNDRV_CTL_ELEM_ACCESS_USER.
>
> So, the removal shouldn't happen, but...
>
> > With I/O Box initially 1 and CD Volume still
> > present, the following ordered sequence is possible:
> >
> >   1. snd_ctl_remove_id() takes controls_rwsem for write, finds and
> >      unlinks CD Capture Switch, sends removal notifications and calls
> >      snd_ctl_free_one(), then drops the semaphore and returns.
>
> ... how this happens at all?  Unless 1 really happens, the rest are
> fictional dreams.
>
> The same for another dummy driver patch.  Does it really happen at
> all?
>
>
> thanks,
>
> Takashi

Thanks very much for the review. You're right. It is AI obfuscation.
After carefully checking the code myself, I could not find a real path
that removes them.

I'm very, very sorry for this noise. Please disregard both patches.
I'll be much more careful in the future.

Best regards,
Cen Zhang
