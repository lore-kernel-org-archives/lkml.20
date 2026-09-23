Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FCE40DB4A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196981; cv=pass; b=DjN20vxFiM4GFlrMWvNPX/k8eKoGAu8OEORSQTQ8Q2OBTrlD3W5suaFZLjMQfMLxmiHbw3C3ISg11v6LvHkg8oiNy30JduviRgqtjVwiXTKJ9Wkx20ihkCAz589OF8a59mQy3885p6rwnb3WxI1ublFDcCfbjBNC+3hXDEdwta8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196981; c=relaxed/simple;
	bh=AfsNOKliYq6zL1eqw3cqwWjdNoNKiv3VUp2n3SA8M3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EeIst/BFFNoh8VcnXAwU7l/v3vd+gvSLRb2KuYTxRQ+tuMUfx0GXcjLyzDQ5FgKN/d8YDaVYnv6nYpIQtMMk4S5OTQC4hraH+ESbyOfF5AfblsrMBF46Vyzz08isanLLWS46eHNseAcNVsTVaQCAVgRcU2dqU8GABRVNHR4rK/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=SCxH7Yqu; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="SCxH7Yqu"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so589823a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790196979; cv=none;
        d=google.com; s=arc-20260327;
        b=ZNszgOrnzTGtngnmdeWNfDpfnPefS4TZ548RbOmbJRwyvIS/FuHL9Eo+Dj3PBmpS7f
         Jwko9LBdiwft78DGnxTG/FjGMya/GoGIkiIyRCmkVscWw4ZLb0PAjFa+oEH8CprvgZ6P
         dzTcLX2EXsTpJexZLefREAivavsb3q7tASf5STqJKqGrrZDOp8b5OWRn6WEPVTdeAXSS
         KLXfVUBbV3Kok4WgoQnNzY54wqpF7FRFxqkueow6kspYv4i5hroRQsNjhLVsumgZFxJf
         S8YBKTuw+dyHxli8XETQgzNLHJlIiaRdqxBd89DBn9M5z2+qgKGBTyGKeLolz0O2Nck8
         vcuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uKXaOIOrNPS4pMqCdHAkufQqbDvyLs8wmA+yFUKQc+s=;
        fh=5Ia49CQ8nnGQ5imeuUYuCrYLlIqPu4PYzq9WwpI1Uig=;
        b=lnvBT6d3kSnG59gFWV94MLVX7+y8qeXwArrFnnWK9vJdIz3cjN/zO3PHM5L99zzDl7
         be7OcX7ZAKUyCzt1cc6JAc1UrvcjlZt7hXpQiWh69rJB2BW1BVbTbFEZFJho4RS1p+Uk
         qskgzedqv0lEGam8V1i2tYgttLmhxi6N3RQ3TTfLxjfw+dbb6Ep51rLs3Zjdl0RG15dk
         qxoNi52VhzUn4XOE77o2yIPc/W5ajelBoJEUdLS5zM9QLT270GCH4nGtpMmrYH7kALYN
         IeUMV1vCKyS6gv5P2kMIADzuosmeDFIYFunGd+jfxc86NS2LPfP/5GApF0ty1fDaa4/Z
         lnlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790196979; x=1790801779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uKXaOIOrNPS4pMqCdHAkufQqbDvyLs8wmA+yFUKQc+s=;
        b=SCxH7YquEqV+DMQ7X1Pwfgpngy1rqsZTafwV3mLotiecr9XnNUqcX+RS8aIvbk2rZJ
         TrW5VOSZPCGF1FbUz+UxdHCtJnGzIsJhWdArB+Y1x53R1JAF5z9ZiWARgW7zmf0YtjXD
         gWxkaWdSTlG/RoeSErfU1k0wQOiUNPXkOeUC811Gopln/qQ+H5lMNd3jS0TUJ+sJSpWi
         ElVRopfx5aQFpVpg2UhgtFn7Z6D/wnKhPuGlqVbQ8GqBIaPj3WHWvUJvFamrtdGOOutJ
         LbqCKYGocOk5c+lLDP1zE03fhY2K64vAesqPmvutPKZFGCbADlFOM75BbbyNFG/AoMLq
         dTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196979; x=1790801779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uKXaOIOrNPS4pMqCdHAkufQqbDvyLs8wmA+yFUKQc+s=;
        b=FCiej0PFJVk0OriMhn4tZ7Kf2jGsBw4rwLcfDC3ZZeE2IzJ/A9XcYBzAftscSaebHe
         82075HndH4qZS4S0m4mkXsaL3c6P9obnmKgJTQODrQkM11NzQp38J1grR5suoeK9Jk4T
         zP8Sprqxn1Cc2G9krIDxDVikWgIQ9UNDI1KZMfK41H400R7ZZfVV0TKWmMcizbraPTeI
         k91ik1dG9tp04+crZVRD/GOzdg/awXkvKse5fhUqvoU8YfGGQ3jJ2OZupKHdqfmDp2k+
         ruzB5Rc4fmlgHxnXPKeN7fVwE5duP2L1m5hlOyv1dbT3BdAJZ3Sg2iI6ZeT9wVYrwMHw
         N0AA==
X-Forwarded-Encrypted: i=1; AKwUvBzb6MIrsC8PHPyB4MMUrfJQi2kL1BqGwQhsdhuGfltHbw7VGYE5VEjJRaOCgtNfHatiied18pu9LeicgVY=@vger.kernel.org
X-Gm-Message-State: AFuF++kAd4MPIn4k2Euz7Nhrk6VCmmiKlNemPfaDn03OvVZB3qRPey2H
	UOsZVuMbvY3WSUYgfgdiHo6qVyy+oc39AlozenJI3NnOa3gY8nyb+RxCbsQuDD7NEC30YDnwUbG
	Xm6zxWoQ7VqUVmY0d34q48z5EANvy2pE5obfJ9odg
X-Gm-Gg: AYBFou13+qv257B7CYtKuMCGjZtzJwC0iyU627GU1icTy0FWSgtlIaBZ0gn3/9i16ps
	BCiJBLqpFTp+N4cDG3sDnq/UCBhi5V3H9VoPuSRfikimVBMkIt6acN6d56FXr8sgExbSW9xSXpj
	rYi5oDqsgACTTqmKZe3xO2NLNgNDfbEezBhaXIS+hiiMXqpYjdUrSI66f/GEjtCBbpkRHZ7znkR
	OaCeldQz9XZ9/Um7+ZxLN7bkzIonv3wUsS83uBRBYFWuabuHuVOmJGfmz0dkvNioC2Yr8IyBOrY
	AdMVIYd8OLD/7mbykIFLgJKltec97qEsmJjFQeSdmCALjT3+jJCYM3jylOoNxeYUD4brgDvn3Ho
	WHh0HvcCmujY=
X-Received: by 2002:a17:90b:5783:b0:395:8124:ac53 with SMTP id
 98e67ed59e1d1-3a09860ee65mr161639a91.6.1790196978912; Wed, 23 Sep 2026
 13:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915150739.284189-1-daniel@iogearbox.net> <20260915150739.284189-5-daniel@iogearbox.net>
 <CAHC9VhR2Zp9LzDRwDOZoesOC7o8hretfgRH-PRqQRXA0EES2vA@mail.gmail.com> <CAEXv5_g1XQAwsydnbu9SUvxNBdYQf+xXjPaZMeC8hxgfThP+pw@mail.gmail.com>
In-Reply-To: <CAEXv5_g1XQAwsydnbu9SUvxNBdYQf+xXjPaZMeC8hxgfThP+pw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 23 Sep 2026 16:56:07 -0400
X-Gm-Features: AclHuK90iLZutEt8vQpJHROuzrBD7oVO2vZ8qgmd-e8wc1UQ4r8BY_tG8pTzJSY
Message-ID: <CAHC9VhQCcbu9v5aNPBxd6sqwjn2bWZYKJcPMMd=kBQJUuSPPAQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 4/8] bpf, lsm: Let BPF LSM provide xattrs at
 inode creation
To: David Windsor <dwindsor@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, alexei.starovoitov@gmail.com, brauner@kernel.org, 
	john.fastabend@gmail.com, memxor@gmail.com, kpsingh@kernel.org, 
	matt@bobrowski.net, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 3:14=E2=80=AFPM David Windsor <dwindsor@gmail.com> =
wrote:
> On Wed, Sep 23, 2026 at 12:57=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> > @David, simply for my own understanding, did you ask Daniel to do
> > this, or was Daniel operating on his own with this patchset?
> >
>
> Daniel and I work together and both have things written on top of this
> kfunc. He reached out to collaborate, I agreed. We're also going to
> send bpf_set_file_xattr shortly.
>
> This implementation was chosen due to its immediate mergeability (it
> only touches security/bpf), but was actually suggested by Kumar in v1
> or so of my original series.
>
> That said, sorry for any confusion about this appearing as a new
> series rather than as v7 of my previous one.

Thanks for your perspective.

To be perfectly honest with you, seeing this patchset land in
linux-next without it being posted to the LSM list, or at least CC'ing
me, after all the discussions on the previous iterations seemed a bit
suspect, especially considering the rather rocky relations between the
BPF and LSM communities at the moment.  Regardless, hopefully we can
get this sorted out.

--=20
paul-moore.com
