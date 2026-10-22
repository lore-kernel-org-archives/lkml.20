Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792666609;
	b=LIEc17aOIkcs0eh2UErcv3OgfNB/QyXe7eUML9pGIaoeRMr9rMX26lD6I6gQzp9fzX1R
	 VHHgy/Jq9LQa8LyQe3UYChc9SiYTuI1DZqsho2RYQnmSZ8wR7Yp9Q0GaZJ5I5fAqJjZ0x
	 xMIX9ytuMy8RTc2+wV/jLaiUShw9AYY27UbLuOpJbl8/8hgF/OK2uAbryzOYM/YR4DJ0q
	 90B8zWSKCwqpzOMza1kBoaSCt35K6TO+hYLFkMKeON0Z7QC5tIPecL9vjmaNVn3XqH39I
	 HbmU+sqOZz2Js3Dr7KauyfkLygLcTyKPQnx9yaumXUBjFHgXLmliQjYVO722UuleDsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z7CjQzBDnl04aWONNGlhTdVtRpqeXhaqo6cL0x3Dgio=;
	b=cCMOJatHCZ7IhuSobuf80a+K95vgXT6rNdMZ2Qy1mONp4CLMmidb5Wbuc8IVGXcbZoj2
	 kMZy4Ui1iXJUuk57+Yd8oYESwB20BmVjt1t4Rqm298wMK/o2ff5o605WbcSkBX74L7kF0
	 g7ysTgq7J8R1Oj34+VwPLz7MxFHhwBSx0tkuYO7OIT7xM2gGDlnhKqucG+QfnKYwddzTM
	 rLUPGozOQC6tET5SyvOqWANxtaT/bftQP2YhmWb7UMdMbSgv3XvYlooJNuM14f3b2nMWJ
	 3CeQnqbRSRHUP6RVTwap37FKIv9CeSNE6gmaeEP4RiQIi9t8fH4+zvaZmEIsxtUS6JA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ADK6qMqY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689EF606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 689EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ADK6qMqY
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b056d58f2aso15677107b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792666608; cv=none;
        d=google.com; s=arc-20260327;
        b=rmUuvqMBFoDxqVfJZZ2u+EvbSKoVuiwbwbs4GFHtEpmnxKuidqS28e60oIRkRj8Nbh
         aAW05C0DMPwiUP5/jc6C3hKDpa2/jYrfXGPxVYCODWYso6RIOmYUwrhyriE1DGyXLWcb
         q8u/THvVvMPEGJ4sUUJomuyhCnjyAJagAJwalQKf5R+VWtE4treMoN3FLpHNvEBLUWMM
         ZckEpgIfAsw+3yJn9BSTwXZoQRXyBSsO1BCfiDAa1HvnVX5Wq1TZI/ga3q2BXEUe4eZ7
         ECtgzGONiLw7E9u76jw9XZgB5vehJ9ZXidWJl6YNXlI/qPj0GVqEKeIm8MMWaRZoo3ZJ
         pQVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z7CjQzBDnl04aWONNGlhTdVtRpqeXhaqo6cL0x3Dgio=;
        fh=uldYEhvJLGKsuOzjZq+fqY+NteTsChOYWISfHYRuyWE=;
        b=i4KOONEDSgE/9rJlOr2o+6sjsH6p/8gOeoxwQNb1mhX6LgI3ExIArpx0hVj3UWu73t
         DH+qwGWnQ7HW0+Zd8+JJn/O9zX0cX0QfUJ/3YL0xB8SzpC76VfqXbHvbeJiLIGXRz3pk
         XMICknD3Ga7rnJBX8ZQdyeQ7Qg1KQUsgkaR4GM2t84fQVVE0srs1Bra1yDYMoQavmyIU
         6YeYatGx6Ncxnn/EgQS+l3fDQVYFVmy/9mf7FiQ+aiEb1m/jI8zh4e7DhTms7ssi7NP7
         /IvPucf4FWkHPcuQsXiF4oTea4RBBxwdb/1dHRWR3+oS2E7T+eyXdR/0qOjIGS9ukbtw
         N5EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792666608; x=1793271408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z7CjQzBDnl04aWONNGlhTdVtRpqeXhaqo6cL0x3Dgio=;
        b=ADK6qMqYfj++BYLCYDjZA0g4iUJRd635oOl+MQs616Hil5i2EvY0xspGPy+xBELhWL
         c1IE2JqSa+Y0ujrhJsSskK7WukOvBCZZ0jDGv82wfGzKEydabW9NgmH9mjRF17VdY4es
         +Jwdg9b3HhnWhxY5BVx65BvQ+9EKPlp27Q0rzmBCCTpe+L8a7eVBIrsHCZ8vLRtmvFmb
         uTdHwV94NpWpDO0tCJLJTiOSjm+Gc2vzj0EmVQKGpQ3gFAbfF8BHymlMYT/b1F+VRA5L
         nY7fJ6569zvJYVd7bEpvfaViRrOFFw/rxzk9VhGiy+I/mZOtPDNCFmWqyU/tmnxoi6yT
         FWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666608; x=1793271408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7CjQzBDnl04aWONNGlhTdVtRpqeXhaqo6cL0x3Dgio=;
        b=c9QkUys48fpKSs4yR93dxpAKjzLqS2S9ugzRkRYpxVBTLDlUANjytufGkIhGP9VSyE
         vZy2IyqwrZYAQvAGQW3hkoR03hPmk+fjd3iesPLhWvGP628/obOFVRbCmcIp4ZBbKEhr
         aMOS0F65xMSxpzoZzYHqgq3B6YV/VjDIEbbUtJVAC3jJ5FUyQOjMxII2PGVrmeWt+WxX
         kP9Z01P7+xTQ4DipJUvf7svUME74VPDOTrLxGlSl6OM+1yDcPYj87UROLWhGXR8fY3/X
         ANY+4Qq/Y4YOct90eRe8dBJTL3yGkg3u2T0qQXKmCWPdeCxAUoxQTQ1nzHfT8eS3E8/2
         mc8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzk1Whhgyd2I0mg42s7JHlD/wwfflTm4ioHjJ6xrEQ7+IUEKZ5Gj2fCJmQYKtJZYFOG/XG/l4RoCNaDamE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUsqE4bGqa/7vQVyhXB8RcVCnY7PV66sei7FJsvAl63myRlF6T
	qYCp60t6gIr2vKnWVBvCD4FOQsA8KldRwmw4BI8pyHOdjG8fWoQSR4wjTSL+8Q0bskUnu3rKGal
	VQzpJrJIZYUz2tfuRFHYyR9ZkhdwH4lQ=
X-Gm-Gg: AYBFou08P+D7TsEOMautwzuv5wl9v1XcYHGem4C1qQvvEdhIq3bf7jM2KC7X4RZcYgs
	hhT2FM9+E9bCIGqgPTA4K0SdQY84PdyKYr2BNBPjnwjlCR2rcY8XPHPEBjg6hst6SATm4G4MzfH
	IXwB8zwPadTzHmANJ1LIGpFJMnVa6R4l7wr+qD67sjEm4A0GhDWK27/GJwZF44o87/2RG54Iif1
	mPFAMAtMv4x9K5kOjtc/40sTMFLSB0M/AWtWQn5RXUqLav6uVCEEbUJ+NZZjDi55Sr1B25hNv23
	4fLPwyYZ3NivCYdJETlZ9vk9AH5Ez1YG+UkVAQQ20FUoTNhmS9SfshZ6GWJvUSGpFY6J95weZ+S
	6d1TkFGAJ0X3IAgaKNUWNNvXh3CkWePa4zZ7PYvM=
X-Received: by 2002:a05:690c:e252:20b0:8b0:ac9e:14f7 with SMTP id
 00721157ae682-8b133fb3f9bmr19361017b3.28.1792666608356; Thu, 22 Oct 2026
 03:56:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-pmb-2439c851f82c443c3600-v4-9e7df0ea42c36afe6171@gmail.com>
 <87h5igix41.wl-tiwai@suse.de> <CAFRLqsVe0JjW9VTbjBG9w00LFuQBxyK3CCjTnqaCXzcUPDCE4w@mail.gmail.com>
 <87v76uccta.wl-tiwai@suse.de>
In-Reply-To: <87v76uccta.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 22 Oct 2026 18:56:37 +0800
X-Gm-Features: AclHuK8C3qRffRiZ2Dmc9zttsL0U6qgzV__R004le6XLTPii7twzMle1FS1Gtf0
Message-ID: <CAFRLqsUjzhcMwCZb+LNCGFFbHv=GF+2+StrbHH0md4REgyADJw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcm: Drain proc writers before freeing preallocated buffers
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8822=E6=97=A5=
=E5=91=A8=E5=9B=9B 17:19=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 22 Oct 2026 10:58:02 +0200,
> Cen Zhang wrote:
> >
> > Hi Takashi,
> >
> > Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8820=E6=97=
=A5=E5=91=A8=E4=BA=8C 16:40=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > I believe a better fix is to handle the disconnection of procfs more
> > > properly.  The hda codec driver calls snd_device_disconnect() for eac=
h
> > > pcm, but in the PCM side, the procfs removal relies on the card level
> > > disconnection (snd_info_card_disconnect()).
> > >
> > > That is, something like below works instead?
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> > > --- a/sound/core/pcm.c
> > > +++ b/sound/core/pcm.c
> > > @@ -1119,6 +1119,7 @@ static int snd_pcm_dev_disconnect(struct snd_de=
vice *device)
> > >         for (cidx =3D 0; cidx < 2; cidx++) {
> > >                 if (pcm->streams[cidx].dev)
> > >                         snd_unregister_device(pcm->streams[cidx].dev)=
;
> > > +               snd_pcm_stream_proc_done(&pcm->streams[cidx]);
> > >                 free_chmap(&pcm->streams[cidx]);
> > >         }
> > >         return 0;
> > >
> >
> > Sorry for the delayed reply =E2=80=95 something came up to me over the =
past
> > few days.
> >
> > Thanks for the review. Handling the proc entries at PCM disconnect
> > looks like a better approach.But I noticed two possible issues with
> > adding the call here: proc removal can invoke a prealloc release
> > callback that takes open_mutex, which is already held; freeing the
> > subtree also leaves pstr->oss.proc_entry pointing to freed storage
> > until final unregister.
>
> Hm, basically we don't have to release the resources but just
> disconnect procfs (that guarantees that the pending callbacks are
> finished).  So how about something like below instead?
>
> > I'll follow your approach, but perform proc rundown outside open_mutex
> > and retain the entry objects until final cleanup. I'll also prevent sub=
sequent
> > card registration from republishing the disconnected entries.
>
> But those are assumptions: the proc rundown must be after all pending
> stuff is gone and it shouldn't be called until the next registration.
> And, running re-registering before the complete release is already
> fundamentally broken, and that should be addressed instead.
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> diff --git a/include/sound/info.h b/include/sound/info.h
> index adbc506860d6..4b08a32ff4fe 100644
> --- a/include/sound/info.h
> +++ b/include/sound/info.h
> @@ -117,6 +117,7 @@ struct snd_info_entry *snd_info_create_module_entry(s=
truct module *module,
>  struct snd_info_entry *snd_info_create_card_entry(struct snd_card *card,
>                                              const char *name,
>                                              struct snd_info_entry *paren=
t);
> +void snd_info_disconnect_entry(struct snd_info_entry *entry);
>  void snd_info_free_entry(struct snd_info_entry *entry);
>
>  int snd_info_card_create(struct snd_card *card);
> diff --git a/sound/core/info.c b/sound/core/info.c
> index c4d57d0809ad..bb9f564001ea 100644
> --- a/sound/core/info.c
> +++ b/sound/core/info.c
> @@ -737,6 +737,15 @@ static void snd_info_clear_entries(struct snd_info_e=
ntry *entry)
>         entry->p =3D NULL;
>  }
>
> +void snd_info_disconnect_entry(struct snd_info_entry *entry)
> +{
> +       if (entry && entry->p) {
> +               proc_remove(entry->p);
> +               guard(mutex)(&info_mutex);
> +               snd_info_clear_entries(entry);
> +       }
> +}
> +
>  /**
>   * snd_info_free_entry - release the info entry
>   * @entry: the info entry
> @@ -749,11 +758,7 @@ void snd_info_free_entry(struct snd_info_entry * ent=
ry)
>
>         if (!entry)
>                 return;
> -       if (entry->p) {
> -               proc_remove(entry->p);
> -               guard(mutex)(&info_mutex);
> -               snd_info_clear_entries(entry);
> -       }
> +       snd_info_disconnect_entry(entry);
>
>         /* free all children at first */
>         list_for_each_entry_safe(p, n, &entry->children, list)
> diff --git a/sound/core/pcm.c b/sound/core/pcm.c
> index 1e4e0ecb3dbd..58098ee894a1 100644
> --- a/sound/core/pcm.c
> +++ b/sound/core/pcm.c
> @@ -520,6 +520,11 @@ static int snd_pcm_stream_proc_init(struct snd_pcm_s=
tr *pstr)
>         return 0;
>  }
>
> +static void snd_pcm_stream_proc_disconnect(struct snd_pcm_str *pstr)
> +{
> +       snd_info_disconnect_entry(pstr->proc_root);
> +}
> +
>  static int snd_pcm_stream_proc_done(struct snd_pcm_str *pstr)
>  {
>         snd_info_free_entry(pstr->proc_root);
> @@ -580,6 +585,7 @@ static int snd_pcm_substream_proc_init(struct snd_pcm=
_substream *substream)
>
>  #else /* !CONFIG_SND_VERBOSE_PROCFS */
>  static inline int snd_pcm_stream_proc_init(struct snd_pcm_str *pstr) { r=
eturn 0; }
> +static inline void snd_pcm_stream_proc_disconnect(struct snd_pcm_str *ps=
tr) { return 0; }
>  static inline int snd_pcm_stream_proc_done(struct snd_pcm_str *pstr) { r=
eturn 0; }
>  static inline int snd_pcm_substream_proc_init(struct snd_pcm_substream *=
substream) { return 0; }
>  #endif /* CONFIG_SND_VERBOSE_PROCFS */
> @@ -1119,6 +1125,7 @@ static int snd_pcm_dev_disconnect(struct snd_device=
 *device)
>         for (cidx =3D 0; cidx < 2; cidx++) {
>                 if (pcm->streams[cidx].dev)
>                         snd_unregister_device(pcm->streams[cidx].dev);
> +               snd_pcm_stream_proc_disconnect(&pcm->streams[cidx]);
>                 free_chmap(&pcm->streams[cidx]);
>         }
>         return 0;

Agree that. But I moved proc rundown outside open_mutex because
proc_remove() can invoke the
prealloc release callback, which takes that mutex.

Best regards,
Cen Zhang
