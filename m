Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF460488204
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973169; cv=pass; b=I+wiYULim/yYuNQTYDrGOwCm66/t0bTTwsC709hgdNp+w+Fun9RZyvs2QmEnBf+GZ+Ae1OEfUwbzRecfjg1r+pAzD+RtOhLVKnDjK/FuIWAiPz1e6cFhemipt2yxXSi8mEBbTsBTKfXeG8ls8Stc9MzSVyGXTD2qKne1Jh52a/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973169; c=relaxed/simple;
	bh=5XC3ePOEfPfhdjRLNfiDYOmx8DhdOuHxUMpgkVnPMoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tWu7Sh4LLeB5nyXeMp3c/3V4JZ38WPS/5x3v8nM3mlkxkcurHZ4HfLQmr5yepVwBiKJHKYiv4TcUn4t+omygUhfJr1CWQluTajdLguPo+wUkmPrIH7KVxLJpaCG887K0hgc4XcfHSxsqOi+LH7RY5bFzHJ4tAg8hn0GvtzprxPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXDHt3En; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXDHt3En"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8871ada1a26so6967117b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791973164; cv=none;
        d=google.com; s=arc-20260327;
        b=TMXgi+vCKZp4QIstT3S00tU9Gx2ZJXeRG7Y9Vq867Ex1kK1kMBUeAwMw7/QjwzL6yq
         hvxnZnevo3G+hGbSOuB/2GJijcRiR5czDdnci5K0rb9FpxuKsxMRV70Sym0b/+dOT13v
         k24fT+rFsAXXMdlZZuv03Z0FfpmSuyDWHiG7a+JYMafdSo999WAwuaBh19QPRfOjVEaN
         Y+WqXgXQLGPLTKEwPMFaF5JSzgHUrYm7NFL1+U/U98LHpWTAdHZKUtkbCPAIBnmQKMJL
         ljG5DKGbPctHNYkVqs8SBOQvFVf5yTn3B4DaMjrBq/syFnDxyu88e3KFjZtRLrz5J5H4
         Dprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TueIpr4580/+gZvYJMMIRybUm6mt4G86k3V2wAjgF2w=;
        fh=YN0cpx5b1Fhmy1D0o+oQ6CDkacLTI2C8KCdWxr61whg=;
        b=a6AbhXRfsPNUjcDyDGOxswhtERuxFK+nJMrbMS1snNIRIncbns8oWkSiggWkYNWCuw
         GtV7KNMZ1yJoKz6Y0oar+iopUEJLoqEiJG0Q68fRFU9OUukdXZhrjr06VoGJr+hYAqP9
         g7LqO+FLk6P3BkHuwRw19kK19hCKQi8YoJb4rpXQw8lsRRy/Exji2gQlmk2bX9eHwd+V
         OwLN5+VSK4nc0i2y6F6x+whTL/qZF+QjMMa5kx6uiIOtk6geluWtW1wdmEEySdRkhJiz
         ypKOP8ss/ar3zGFrazzU/INZJGKpb+FD5VLd3m4XkS3hc06HC1F2GwCGJ8HNsQPMlg3m
         VkHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791973164; x=1792577964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TueIpr4580/+gZvYJMMIRybUm6mt4G86k3V2wAjgF2w=;
        b=mXDHt3En+ypP1mh+V4AVtV9OV3UOCtu3p6U2kLglRgHbD1C52vBJp/Q0iEatZzwBL6
         JJ88/DJ+/Y8VIVzq6OXZnG1S2GUuRTkE0cJrO3vTm2bInC73V4kyQyBKJZzbNWSAA/i8
         ChUrS++IY4xy7RPrijYV6EUYwan36gpQAj59NWNcbZ6G1PPUHXCdnaY8XXFDVRkJ+etx
         lBSYdK/Vf8ZVG10/fUqvkRtDHUSuyDvy2UuDpoHwSA/Ont8JPTPPLzbQRJRKDBdUd7U/
         B9354f0kt4Om37q/hK4TgUrB9h2YetKiL6AO+KPmvcLoelveoBI5hhbQ7MIiUE07aaID
         QSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973164; x=1792577964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TueIpr4580/+gZvYJMMIRybUm6mt4G86k3V2wAjgF2w=;
        b=ePTiHkPKw4ZbvnPCwyWFvnwr6J8XYQFBKohqX9VHDn8Z/X+8mvO2Ll7fMFRZ8skV6r
         1bwwud1bRadKhVM0HjBYtQ5vvkEZJ+PBXFsp8yA4hvJpietpc4FBpnfVKe57+48bErdq
         I3VlhwkVScvyJexpPOyg00VioVUYX7L6Je5txgHk24ahxOJdXgdloZlUiQJiI4sJzBbn
         g0tETZH4nH+wHYURwI7vfr7mvOLzuPwX38cvrVX21rZtGf2BFu/2QGjEfzCzS6Dt7Qx3
         YTitzjzVi0g0udvfeP6wmDwMAQEwqhNJ2piFBwlwE2koCeQhFjuQwZSMIWPCIton+O7Q
         2UNw==
X-Forwarded-Encrypted: i=1; AKwUvBzfAvyFzwcaxTpX4hwZ7fXPOuEkwQUJfcf+PKsoIsJ7j/2fdEjmDdF1lL8CqYENLa2hCLVd1mimZnbGPq8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDv2V9mwNTz3KRlKmk9Qi32mWrSqSlRQTP8tva2HSDaphYYSzp
	SbtiGTdY/4ZkQD+kLrvGzcdWWcLzBxgRXkGf0VURB+0wr+Xsd6DKnbtO5JaVPFqT1cNRis5BAP2
	7K3v8TdhFf4sxIMRp9rRjyHd6bVnZQoQ=
X-Gm-Gg: AYBFou3YtQgH/xpb6jnKf9VuZn246GI2++0Mpr6hjFg62s+i0YO5cH1i7OgVxJtGxmd
	bAZ1vfP3zRRh8uBX/kzgXTUFRXy+j7x7VEPqLxperTj4uhu/H6ECaV0UmBo7Jzm5kz124SSy0ts
	Z6dgtXIo6QYYUT3+vUIIipb2v71keesNKwpVonDC9NOq96SsJ21CirlG5nffz4a3//FxEpYWjKi
	MIZWF3pwY7CeDTeGvLvxenvOl3HxQSuxDjrHboK/HCV8veGXwL4qQUP9vRNtMvPLAtCEZt7LOyB
	0d4Wove+o3FyhfgRR/jHljwa3v20qZFBa600ZyByruKcD35JDYik2h/+yA==
X-Received: by 2002:a05:690c:6885:b0:8a9:d345:1c59 with SMTP id
 00721157ae682-8b07edf81dbmr47364987b3.44.1791973163588; Wed, 14 Oct 2026
 03:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-9c80f858ccc13b3de84d-v6-d4059ea2910fe5430f5f@gmail.com>
 <877bjkg35f.wl-tiwai@suse.de> <CAFRLqsUH-ehHgXsqFGANE2h0-3WBkeNh7-AOvf5ymWAOH5r5Mw@mail.gmail.com>
 <87v774ejkp.wl-tiwai@suse.de> <CAFRLqsX8rqZrJfLPBOhBmuwXHq_wnxiwfxDGevfQ3wMFo2thgg@mail.gmail.com>
 <87o6cweheq.wl-tiwai@suse.de> <87jynkegu1.wl-tiwai@suse.de>
In-Reply-To: <87jynkegu1.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Wed, 14 Oct 2026 18:19:12 +0800
X-Gm-Features: AclHuK-3Nxy_za_FH1VpGI9imnki_cW__M4TNzexL-eHphdCbnypFU88832XpzU
Message-ID: <CAFRLqsXShbWJPQnoQ=3qWcqOQGOZOorwJHYGTmzFJOpBPkqqWg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: dummy: Defer hrtimer data freeing until runtime detach
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, sammiee5311@gmail.com, 
	phucduc.bui@gmail.com, kees@kernel.org, thomas.weissschuh@linutronix.de, 
	tglx@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8814=E6=97=A5=
=E5=91=A8=E4=B8=89 18:07=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 14 Oct 2026 11:54:37 +0200,
> Takashi Iwai wrote:
> >
> > On Wed, 14 Oct 2026 11:33:54 +0200,
> > Cen Zhang wrote:
> > >
> > > Hi Takashi,
> > >
> > > >
> > > > That's not what I didn't understand: do both A and B use the same
> > > > device?  The release shouldn't happen until all detached, so the
> > > > prepare and the release can't happen concurrently for the same devi=
ce.
> > > >
> > > > If A and B are for different devices, they don't interfere with eac=
h
> > > > other in the case of dummy driver.
> > > >
> > >
> > > Yes, A and B use the same PCM device. The test opens
> > > /dev/snd/pcmC0D0c twice, and SNDRV_PCM_IOCTL_INFO reports:
> > >
> > >   A: card=3D0, device=3D0, subdevice=3D0, capture
> > >   B: card=3D0, device=3D0, subdevice=3D1, capture
> > >
> > > They are separate substreams with separate runtimes. With the hrtimer
> > > backend selected, dummy_hrtimer_create() allocates a separate dpcm fo=
r
> > > each runtime. The test configures both with HW_PARAMS and explicitly
> > > links them with SNDRV_PCM_IOCTL_LINK.
> > >
> > > Sorry, I should have been clearer about what is being released. The
> > > PCM device remains alive throughout. The object being freed is A's
> > > runtime->private_data, from A's driver close callback.
> > >
> > > snd_pcm_release_substream() checks A's own ref_count. When A's last
> > > file reference is closed, it calls A's driver close before unlinking
> > > A, even while B is still open:
> > >
> > >   Final close of A                  PREPARE ioctl on B
> > >   ----------------                  ------------------
> > >   snd_pcm_drop(): group -> SETUP
> > >   do_hw_free(A)
> > >   dummy_pcm_close(A)
> > >     kfree(A's dpcm)
> > >                                     snd_pcm_action_nonatomic(B)
> > >                                       Take link read lock
> > >                                       Walk group: B and A
> > >                                       snd_pcm_do_prepare(A)
> > >                                         dummy_pcm_prepare(A)
> > >                                           Read freed timer_ops
> > >   pcm_release_private(A)
> > >     snd_pcm_unlink(A)
> > >   snd_pcm_detach_substream(A)
> > >
> > > B reaches A through the PCM core's linked-group iteration:
> > > snd_pcm_action_group() invokes the prepare action for each member.
> > > A is still linked and in SETUP at that point, which the prepare state
> > > check accepts. The two dummy runtimes do not share their private data=
;
> > > the group action explicitly invokes A's callback with A's substream.
> > >
> > > The final close holds pcm->open_mutex, but the PREPARE path does not
> > > take that mutex. PREPARE holds snd_pcm_link_rwsem for reading and the
> > > members' buffer mutexes; driver close does not hold those locks acros=
s
> > > the free. The link write lock is taken at the later unlink.
> > >
> > > That is the overlap I meant: A's own backend data can be freed while
> > > A is still reachable by a PREPARE action issued through B.
> >
> > OK, it's then about unlinking in addition to the sync-stop.
> >
> > I believe that we should rearrange the call order of unlink; it should
> > be rather called at the very beginning and unconditionally.
> >
> > So the revised patch is something like below.
>
> ... and after re-reading the code, I noticed that the
> snd_pcm_sync_stop() call is redundant.  After snd_pcm_drop(), the code
> continues as:
>
>         if (substream->hw_opened) {
>                 if (substream->runtime->state !=3D SNDRV_PCM_STATE_OPEN)
>                         do_hw_free(substream);
>                 substream->ops->close(substream);
>                 substream->hw_opened =3D 0;
>         }
>
> and do_hw_free() does call snd_pcm_sync_stop()
>
> static int do_hw_free(struct snd_pcm_substream *substream)
> {
>         int result =3D 0;
>
>         snd_pcm_sync_stop(substream, true);
>         if (substream->ops->hw_free)
>         .....
>
> That said, the only missing piece is the rearrangement of unlinking
> call order.  The hrtimer was a red herring, after all, and rather the
> access to a PCM substream that is being released via the PCM link was
> the real problem.
>
> Please verify whether the fix below works for your case.
>
>
> thanks,
>
> Takashi
>

This approach looks right and addresses this case. Thank you for your
patience and help.

>
> -- 8< --
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index a845f242a163..4fea3f6df682 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2792,18 +2792,14 @@ static int snd_pcm_hw_constraints_complete(struct=
 snd_pcm_substream *substream)
>         return 0;
>  }
>
> -static void pcm_release_private(struct snd_pcm_substream *substream)
> -{
> -       if (snd_pcm_stream_linked(substream))
> -               snd_pcm_unlink(substream);
> -}
> -
>  void snd_pcm_release_substream(struct snd_pcm_substream *substream)
>  {
>         substream->ref_count--;
>         if (substream->ref_count > 0)
>                 return;
>
> +       snd_pcm_unlink(substream);
> +
>         snd_pcm_drop(substream);
>         if (substream->hw_opened) {
>                 if (substream->runtime->state !=3D SNDRV_PCM_STATE_OPEN)
> @@ -2887,8 +2883,6 @@ static int snd_pcm_open_file(struct file *file,
>                 return -ENOMEM;
>         }
>         pcm_file->substream =3D substream;
> -       if (substream->ref_count =3D=3D 1)
> -               substream->pcm_release =3D pcm_release_private;
>         file->private_data =3D pcm_file;
>
>         return 0;

I'll rework the patch based on this approach.

Best regards,
Cen Zhang
