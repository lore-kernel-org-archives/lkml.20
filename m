Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793861935;
	b=UkGCG9oV2+I12asUuKU4EQUikyKbBxDwyrGdiE4yBjoUHmnyXHGhC7a0juT4AcnBtQuB
	 LW4dCzdmI1veFWzdV/Vj/O61VaCQhp/1dQ7gHeuCyyEve0boGXdWCQcQKIhgYEqhbIoCW
	 q/bacBZLcFcCGTtd0E4c5KYIBmg9mBkAsYd7HcjZfUkeE7vbaBiMLH4ZZmoat3sg6UWzN
	 Nf7OFEy7UXanFm6pOuGTgfU/Lmzayio1+hUgLWvO9OgOBK1LSxgcijSoMfD9Mw/cGJ6qI
	 eQKmBLCCY8TGlove20IljnZw5Ct1oz4aPoGcb63Qc+3hOPf9lEi52NzdPOqiAuyWswQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F+6/WzYj37FJHzyiT5yPgdRk2s4gHYGoXvrEAh55Hig=;
	b=RKABOLjN0CEECGx4QUU1cspRzy6kBZ4Cf3lih5NLeSv+ZJ0lRTTwzr5CgvYHLwawo7Oc
	 wpAOdc4sAYve3qq+3r/yK10G/qAJaEwr7j/TGoGmOzVbdilteMYVG6z52z8zXfQ73NYIt
	 K/K3aylMn1ITdGaPzGE0mUzUBKo8FyA/OPVQtrOWEXUPGf1xSYc364+6bvH6v/grp5YXe
	 85DY18lxFcaXx2yJCIcVc4NwZWxfgyrS3CUS65bxRl1SIQvMo4kNEZDVlEj/YREriRFP5
	 W6FrLzLzjycUzJW7BQeEn6+J5yapWNg5wbAgYRtCNGNUhtmVu/Jq+WoMkLVrRgq7duA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BqrwMdmA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3100606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3100606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BqrwMdmA
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-945ae2daa66so155567485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:58:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793861933; cv=none;
        d=google.com; s=arc-20260327;
        b=W9PUHGzjb1cMINYR2RHj47lzIZMdHCpcDZXuB9/S9eoX9xzd6pVIpr7iW9eYIl6WZa
         vQlEAHIlDavqdGKLfO1bSJHYmRzzTbrF+pP9Km4eHJfSNGuYhJVuHLB0M3JgL8YUF13U
         iAH5liEIU+XfdNJrdFdTPctqbid5M5hj0y0lQ3vOPazmgp7RCC+/PLBqvJjb6st+CpkT
         ZsrV2GdJBfoq7iaSpk8gTQBmXGJfVDwzQe0iZ90yCZc04aNlaTwmNCLNkaZs1seRE+Tr
         vJaITpE5hlPV0GqdLpT7YutJqSp7Zz3+IZ+BqykfpPQFwHh33xikuFps2oTmHEazFPoX
         xIIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F+6/WzYj37FJHzyiT5yPgdRk2s4gHYGoXvrEAh55Hig=;
        fh=e5FHIBamH954kf6idgL92z9vxkYOsELDMprwzpts0FM=;
        b=SSAU7tUV0gfD5qQdy3zlDckqtYnsO04H24NJch0g0eOKFyruUUpsCNh8uOgn6okLII
         jctWsPbn0def1HNbW4d2c8Gfvl6+uTAwo8NPBHdU2rDfS4tph7Oe5/ZowacGW5o4ETuK
         TubyDBtYkZWPr2K2DLoun2iYnJd2JMXTiV1S4lJInhfat2X514uTFJLXj+H2Jnj+k+08
         0wp8zLf9jcIUeXHjtszjiDOYhalB1iIMSZkjv93cckg4UjF23neRBe2fChZZYa6KlVOW
         rcFK2BtFU3i84AxOpj2VYg3FQ3pgvKu+PtHpnkpe9aODwd51hAihyR/I50YEjrR065ij
         oEHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1793861933; x=1794466733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+6/WzYj37FJHzyiT5yPgdRk2s4gHYGoXvrEAh55Hig=;
        b=BqrwMdmA2JtYPOPkQa5Snv4//IJU90AUce2DQt0QQMR9udTMc/Pmkgqmkq/qF5ingM
         e7d3pJ0J/EePaCTF493v9e3GSUt/32u6X9MkdTCJwbiQNoRyWyFjHpAnT1EMEdvBmTaR
         Pu1NPPWrXXxsXLXe2gME3zMUvchiEfz3lhSiF/Yv3Wq7QtzHE2Ufu5S6NygO+5jIPmoS
         zB4u/AS0l3xFFTNBlBKSC6vSgvK3fLO+igIGEJIsrLhvG+lLzX3YUjxWe/vTyJ+6rtJV
         0K5bxYsZBh5hG9j1+ti+OoNfvbfXBzru3gFX7LzV6Jv2EQiq5feFe7kf+bcQL+zo9XsP
         RiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793861933; x=1794466733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+6/WzYj37FJHzyiT5yPgdRk2s4gHYGoXvrEAh55Hig=;
        b=UODmQS2WQMHwSo56qby39G4W5P0BUVUt8kGOimrBfEVfNDho5HJ691uaQ3YjQW2Q+m
         cC7CPRl0i5+A05XyaZ5tGxbnudsCSjc2aH+Mohy61AUg7cB5HLxCbyvK+fdkoclVwqzz
         zMo/QKkS33TH4lyzHKS8lM1xAZPrE/fyaXL2iStba6umAcFN5d9IqnqavDyt+/uxs+fQ
         yfEP7RmWLrWSC2cM9+dV7khHTKkhV3h1LL3DklP6jery2jQSjYHmBSFGJjsSmnFUS2/3
         CY0KqUCR9bzt0Dp5U1Wm0AXdxLCEF7IFu0wR4a4FwaBnaT9VF/F5zRNG8GXsV0Q5CcjP
         7RIw==
X-Forwarded-Encrypted: i=1; AKwUvBwKXhEPmCV6TRh85NBDWUSL202F9Ew+tLlMG9ARdNQgWSUUBe+fzEw3H6Z0g2ZiVcUAef/UhR8hrGuh1As=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V/QRUjuqBQz1ByoaNcrjMBzfDnJk6sq9BVayj0vm/nZKXqLk7
	5njtey2hl1F5gBnuH0ig1EDKc6rtAmz0f+w0/qipF712OaewV5DQHl3Of5jaXhZLX00ZppUPM5M
	gOB6LRd+gVlpXadTonYxt9NAVtHtJ41zX3AVhunR+3dtpAJMLp5ms8lBn6CNZ
X-Gm-Gg: AYBFou2CxK1mGwM/gR8BQKnUIj9OUeyQg+UCfDHyFYMXjQw32KL43tnUptxhgcCenUi
	R1ELzfNflUFN0y6rTjtsXCf/HJtTihlpeocinXyL/cdTUdg4tSHBWsuPDDdWJMOlCFybuSVBiHh
	DEndsQnzrD+cxsotBcCYnCTHVhRXPufZviBarNEz0CCJxgyecvHX+7/PwJxWqd75xR7Zdmm4b4v
	z8hgD/N6jBhwXDMff+DhdMBKZksolXDjjmaJo4mNjVJ+PF3xr7xit/gBdX90v7Y7JN10CAHwrYP
	f0MAZ90MBNyl+1o7LxZUBC05sPINLITkH+AmV0HBwUoR7NOhD3yhKgmtGOaeKyqFR3h95Jx+PQi
	grToF+2w43JEdTfi4ziX7kVUoxoq2cKmQbFgHLep/aSMQkD4uihj+sAAoMRb+IlDja7OnkLHS8Z
	YsdDXYOcLH9mhShQ+zoP8=
X-Received: by 2002:a05:620a:4541:b0:93f:4d4e:ff66 with SMTP id
 af79cd13be357-9442158604emr3201847085a.5.1793861933502; Wed, 04 Nov 2026
 22:58:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103155338.1949294-1-sidong.yang@furiosa.ai> <CAKbEzns7nqMP0FSf+G9e31nXR-c+vy+Vv-gTyFV5jv46rAgwRw@mail.gmail.com>
In-Reply-To: <CAKbEzns7nqMP0FSf+G9e31nXR-c+vy+Vv-gTyFV5jv46rAgwRw@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 5 Nov 2026 07:58:42 +0100
X-Gm-Features: AclHuK_bZHeJEa7e_9FUDx7rW7Uy1RIrUnE2siMSCiWZgpaSPYjC7zLaNmI7dzs
Message-ID: <CAPsqS2TTuYmDfBGgTt-EMJZBUW-jUJxhPVEh0=faDNLW3R9K7w@mail.gmail.com>
Subject: Re: [PATCH v4] accel/rocket: Report NPU usage through fdinfo
To: Gyeyoung Baek <gye976@gmail.com>
Cc: Sidong Yang <sidong.yang@furiosa.ai>, Oded Gabbay <ogabbay@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I agree with Gyeyoung.

With that:

Reviewed-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Btw, I think we have had a backmerge already.

Thanks,

Tomeu

On Thu, Nov 5, 2026 at 4:22=E2=80=AFAM Gyeyoung Baek <gye976@gmail.com> wro=
te:
>
> Hi Sidong,
>
> On Wed, Nov 4, 2026 at 12:53=E2=80=AFAM Sidong Yang <sidong.yang@furiosa.=
ai> wrote:
> >
> > There is no way to tell how much of the NPU a client uses. Implement th=
e
> > DRM usage stats: account the time each job occupies a core and report
> > it per client as drm-engine-npu, along with drm_show_memory_stats() for
> > the BOs.
> >
> > The cores are identical, so they are reported as a single engine with
> > drm-engine-capacity-npu set to rdev->max_cores, the number of core
> > slots. The time is summed over all cores, with an atomic counter as the
> > cores complete jobs concurrently.
> >
> > Jobs can outlive the file that submitted them, so the counter is
> > refcounted and each job holds a reference. The time covers the whole
> > period a job owns a core, so it also includes handling the completion
> > interrupt and the gaps between the tasks of a multi-task job.
>
> nit: "the time completed jobs occupy a core" would be more accurate than
> "the whole period", as timed-out jobs are not accounted.
>
>
> >  * RK3588
> > +
> > +.. _rocket-usage-stats:
> > +
> > +Rocket DRM client usage stats implementation
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The accel/rocket driver implements the DRM client usage stats specific=
ation as
> > +documented in :ref:`drm-client-usage-stats`.
> > +
> > +The NPU cores are reported as a single engine, npu, with a capacity eq=
ual to the
> > +number of cores. The time is summed over all cores, and covers the who=
le period
> > +a job occupies a core.
>
> Same here
>
> > @@ -139,7 +183,28 @@ static const struct drm_ioctl_desc rocket_drm_driv=
er_ioctls[] =3D {
> >         ROCKET_IOCTL(FINI_BO, fini_bo),
> >  };
> >
> > -DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
> > +static void rocket_show_fdinfo(struct drm_printer *p, struct drm_file =
*file)
> > +{
> > +       struct rocket_device *rdev =3D to_rocket_device(file->minor->de=
v);
> > +       struct rocket_file_priv *rocket_priv =3D file->driver_priv;
> > +
> > +       /*
> > +        * This is an estimate: the time is taken around the whole peri=
od a job
> > +        * occupies a core, so it also covers handling the completion i=
nterrupt
> > +        * and, for a job made of several tasks, the gaps between them.
> > +        */
>
> And here.
>
> with these addressed:
>
> Tested on RK3588: no OOB access, and fdinfo reads correctly with several
> apps running concurrently.
>
> Reviewed-by: Gyeyoung Baek <gyeyoung7182@gmail.com>
> Tested-by: Gyeyoung Baek <gyeyoung7182@gmail.com>
>
> --
> Thanks,
> Gyeyoung
