Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F874F4D02
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414869; cv=pass; b=pXE4Shjni1qq26tKwO9k2UFsih8v8rqvpkXRvk9bsFrdLvJSFdKqHPXGbf4fsCB8K75XTrTc8WE0j5N7IcCj7j47S35UC/udWSdl5XcBpxtxL49tY/3rOP0wE0MTF7PrzCIbL4T/zHyj3e4GGIYizpl7TPJP+9/d9Vv7d7WjKwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414869; c=relaxed/simple;
	bh=de4WRoZFaD3lgjauScr5sV8aw74tWRpk4ewrSfnzero=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=agKeKT6zfUjkecKOuRGJ0GNoUETE/F9jkwedjdXCowDx2HTcI97NuASBMGL0s9p0XDeaOm9HIrELZk5HEHxovOxzsrIYOw11erg80JcMVeI3QQaJkE1oSiMKiQN2pwlC1Y4cNf6WnGIK2+jHF4KHCgAljnZYsWj+JW9WqTmK7lE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cizj4eee; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cizj4eee"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c315869241fso217451866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792414866; cv=none;
        d=google.com; s=arc-20260327;
        b=FuIBvU7iMJCh+6qZr9XT+6FDM29+prMK2cnrL2jJ/iGyGcEvIQK08j/vABit2NZjtR
         GdX01bEKPxs6qQLgo3UKVD+uJ/synuvSQaFckVPFfHxDMW8LUpOG0l/trSFe0YQXQeez
         9zBzrlgwY0OfFjjRGnVM2Xwnb5T2wCPGXRTH6J9pOrWkKNV1ZYradNdYxW8JgSaPfnzi
         HQjgnlrNfBdti4W2eKoYy3J7jjyXK0YwoYBtiael/8xcO0FBdWGEFm24vqHTPDMmomI1
         JyIaX7AfjGDYn4X0XyxWe9be+kldu76s4fu2tzd/aAML6Jixoy/Xfw84HHNlnMzgChMU
         wIUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=phogftG3FaF6nlP3xa0hV5oXVTce+rqKpGshxnP7eVk=;
        fh=K8pXJolkPNEJWuPASbgHMRdWUpcgte2FkTrdv7DsOw0=;
        b=Q5wRe5iKTEcggVVF6XEs/wfOC2oWYvD8W2l496CuoeOAXXeLnwIM4VZTUpkpE+4Vr5
         sPqzK+O3/qI549qplSVNZNot2cf0DdwraGCgbmgcLIkwao5cHrlsy6LTkAJR2ZjtEg6G
         Cv9AEYNLQj6UWZRgxBwP9KAMzijZ7bHm331YUIy0wTs0adIeee59B96MYd2cWDkLuaIF
         jfolMsgEDivMjoETZ7xKsUZfDFqsBjs2u8ox/gRgwQdsZDSng7zM033Xc5JqXhcMEy+K
         +FuEEEVCMWa6/wN7+5jEWMwyhU49ThI8c+uLZoqlRX/zcDHhJM282fYLxhJoeuk4FBZ5
         N5+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792414866; x=1793019666; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phogftG3FaF6nlP3xa0hV5oXVTce+rqKpGshxnP7eVk=;
        b=Cizj4eee5qf8fVnAE2JTD4fMX547a2d243E/Z2KkinBFCP9NmsdK/WcOLqKKpwyr1E
         7jg8BCVRUfdYo6FpmabSy5GaaKRwwfF+zQ59GSOuuJz+oPWzGsA9ZU8gmeVdkfK43uoU
         z7XtVyaBlbE/bdfUBpE0SsEdDnrfxekglKsYYpOVSOQh6cW/WYHY5f2MEMhJdaKXsJEh
         FJhS1UaX14WsQSl5vYE5DFsKWEOM4z8ZSesorgkzxYlxXFZdCuBLiX++VCZyTQCaymmv
         MXBVS0yUKKHUjdIN5DBzbGxQ0hPe1Vz4PToPjO+nMY0V1au58VXfY7SITU7j9CbFiyeq
         1HQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414866; x=1793019666;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=phogftG3FaF6nlP3xa0hV5oXVTce+rqKpGshxnP7eVk=;
        b=ps1c/919aYgyL+kcDdEnEq3i13g743VeKV4doivavzAElfGI57JAR8PC38rU99HCjo
         sPPjm5NVu2a36RbpltjAlPVKBPqEMcrq0Ij19R1bIKOj/xfdN5xFwEJeSj6hs9XEZGhP
         Js8guU4Fl12NEQ9W6veSIyoCjeh9I2xSqGVAW04Uh32kP7ZE2z0qxYPwYEm4jOIrnlbc
         JY/oNV07zEpc0IHozy4bFtBv/2/ub7NNuhdoSUYFcoFcZbg0ckQQAKf1bjb4fP/zk6v0
         pP9EdZBiPTPYtTBNr30JjyifQdCcf/MxZKkL8q9sFlTivUjUoUGx9jBSu0XOssc2AbJM
         w2LQ==
X-Forwarded-Encrypted: i=1; AKwUvBzv/2ChqNgFKB6wY83aCWGAeoV2xd/agG2dceG68kyPB/WDsV8mWlor6gYiUMWW9mkUAFSEB1diJxkF43E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLGFvxOZZnf4cwBuwkWcMMea6DDr/dBu7TLRdZlSgswyVI+eFO
	YNldNnXbh78EUFMoK+zBwZuQscPX4oCN12VZeHTXxzDxhZCldAC//AgLmxNJlWxELy/uEnmg8Wn
	vvCdYxD1Y7MomM3wI66QQPw8Ioc78BcI=
X-Gm-Gg: AYBFou1BTMcsa2zyNK3QdCi0VD9yLg2VYtpiHnAn0jbTfrNw3b/THoq18XO4P17mhfP
	k07jplgHWiTSHLNOiwo3h3TUqBmwmmGpO4dro6dfj9tt76/DEzXikTVKZQT71JR7IXjlNkaSSVS
	+ZRPD1cSyhlqVlaoIZD6eqfVE3JQjeiHDlTfpR0tSchdWZtoLxMVwXhIXb/gSNpm8sTcoLnG19x
	Omn08N4faJoroPulUdJ0ENAh3bb2b1VYuqJdBhTFGuPKPykL98jBZMA+p2DKLPgwo6BOde03nY1
	SFS9h/SgIRQIXbkuHKcsSLDr5CHad5ZpebonJYebp+YNPB3GFSYlGGfqScoflJg90EYD1V4K/fV
	QqK1Fa48M52j3wSSnHnSWHlF0Ds/eec7eZBF7cykQSzj30embkJWKWRRl7CdpWOMBi0qDWwb1XH
	g=
X-Received: by 2002:a17:907:9702:b0:c3f:7e8:235d with SMTP id
 a640c23a62f3a-c419b13cb81mr585828066b.5.1792414865469; Mon, 19 Oct 2026
 06:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016103640.4989-2-blum@kernel.org> <CANc+2y7ruqmfO+D_nfdc9rnBE0uSSnZR9UJY2Dvc5Nez9U-61Q@mail.gmail.com>
 <atUuAsxE42s8NGEY@kernel.org>
In-Reply-To: <atUuAsxE42s8NGEY@kernel.org>
From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Date: Mon, 19 Oct 2026 18:30:00 +0530
X-Gm-Features: AclHuK9F_lIB1oQ9kkXqLikaEL15-RIDnT85r6_EBtYmdugz9hD8gsTn-BpuPrU
Message-ID: <CANc+2y6Wf8HCf6mUdZb3dALZitMUR=JdhThQWMyp_R=AdMKH9Q@mail.gmail.com>
Subject: Re: [PATCH] hwrng: virtio - prevent use-after-free after a failed restore
To: Thorsten Blum <blum@kernel.org>
Cc: Laurent Vivier <lvivier@redhat.com>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Rusty Russell <rusty@rustcorp.com.au>, 
	Amos Kong <akong@redhat.com>, virtualization@lists.linux.dev, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 02:07, Thorsten Blum <blum@kernel.org> wrote:
>
> Hi PrasannaKumar,
>
> On Sun, Oct 18, 2026 at 10:30:08PM +0530, PrasannaKumar Muralidharan wrote:
> > Hi Thorsten,
> >
> > On Fri, 16 Oct 2026 at 16:16, Thorsten Blum <blum@kernel.org> wrote:
> > >
> > > remove_common() frees the driver data during freeze, but does not clear
> > > vdev->priv, which points to freed memory. If probe_common() then fails
> > > during restore, a later remove or freeze can dereference the dangling
> > > pointer.
> > >
> > > Clear vdev->priv on the probe_common() error cleanup path and before
> > > freeing the driver data in remove_common(). Also reset the device and
> > > return early from remove_common() if vdev->priv is already NULL for a
> > > safe teardown after a failed restore.
> > >
> > > Fixes: 08e53fbdb85c ("virtio-rng: support multiple virtio-rng devices")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > > ---
> > >  drivers/char/hw_random/virtio-rng.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/char/hw_random/virtio-rng.c b/drivers/char/hw_random/virtio-rng.c
> > > index 5e83ffa105e4..a9ff520975a7 100644
> > > --- a/drivers/char/hw_random/virtio-rng.c
> > > +++ b/drivers/char/hw_random/virtio-rng.c
> > > @@ -190,6 +190,7 @@ static int probe_common(struct virtio_device *vdev)
> > >  err_find:
> > >         ida_free(&rng_index_ida, index);
> > >  err_ida:
> > > +       vdev->priv = NULL;
> > >         kfree(vi);
> > >         return err;
> > >  }
> > > @@ -198,6 +199,11 @@ static void remove_common(struct virtio_device *vdev)
> > >  {
> > >         struct virtrng_info *vi = vdev->priv;
> > >
> > > +       if (!vi) {
> > > +               virtio_reset_device(vdev);
> > > +               return;
> > > +       }
> > > +
> >
> > The virtio_reset_device() is always called before setting vdev->priv
> > to NULL. So the virtio device is already quiesced, no need to do early
> > return. Isn't it?
>
> The check is still needed.
>
> For example, during hibernation or suspend, .freeze (virtrng_freeze() ->
> remove_common()) frees vi and sets vdev->priv to NULL.
>
> On resume, .restore (virtrng_restore()) calls probe_common(), which
> could fail and leave vdev->priv NULL. A later .freeze or .remove calls
> remove_common() again, which would dereference NULL without the check.

Yes, it makes sense.

> Best regards,
> Thorsten

Change looks good to me.

Feel free to add:
Reviewed-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>.

Thanks,
PrasannaKumar
