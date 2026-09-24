Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4751B33B6C4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259338; cv=pass; b=g7FEdCQpBy26e+q2OCAfIT61bjufj3h2HV1jKnOg4j3+NeRH+xnJK+SrD1h+hx7i88vvaqO2v3CyW3rvZ21mrYgxU4950Oyr6SJmVzoM4ELcIN9MXK4SWKWZMm/mWLR5wqpeXjLEPNcSu7WWdm/9k3o3EbHrOUJv4C4LwOQgA8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259338; c=relaxed/simple;
	bh=fwqbiIvV2P3fJebB0UiNrrEc0OEvVKiw/rH/H2+mMoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YbnNzQMtz0jkdSK67E9Kp+9SgVgDXaBDSXvTZMBs6sSDsyFNruAUw46KvQBhfaMEl3Do9Gkcfetl55GGP6rEGZD6f3wgGy4lMCvVTJm5/sEeJYeJj+HVLouggENkZRzSg6y7mgDFnXCd3sioB8FSUCYC2tz4SVY5vNy+hLL73iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3K3d5kP; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3K3d5kP"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab201f9so1909053d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790259334; cv=none;
        d=google.com; s=arc-20260327;
        b=QLdjQXxvs4GJS1+AhQdQl+AWDjzCe+MSaEvbOtgAzEbAMOudo1hH2TM6GSfXu7ZxgT
         k9c3Y6adPEQwmKWcsxHg0XBH4K65GkypkPlED9OuNv+LjE3W+PgPMfELVIZUmI0vJEVi
         mACQNZ1+3z+wSQrcpavMUPQzYZCyiSt89fmz0MmSJUnh4XC+EBfs7i9ZA/IVR0AD0IiO
         ifmZgEMVpozt2BS3CsC2f/F3sBDeb2x+gvz6vCw2dgUoW92w3X8mFiAAOfO1EzO3Al2F
         jDCIAAnerDHHeLEvmBmYl5EOKyd4cnFwkWJ++1IQ7JrzU6OYIXzUVIxaxBHVISWHX5f7
         654A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VqwT+zeVYyyeJDz/W7VPDo/dJJgtgXoVFAXAXD+e99Q=;
        fh=vChJ2tQ0PDlpG1QU2WCEia1pe8bIUZQGpm1Dt7Hiy4g=;
        b=iJbs6lWjKtPaU92rVyvbGRnstaGBFkrGbqOeH8dxxOHKR8rP5kibzWLsvvIf7KycRI
         YneKlJFuBv4mR//KNTmVOlJipL1jO/UYlEvy/aC8oldRR4sbU+xKaKa9IzM8XYlbtYo5
         oN01g3D7BWheZD6dRjEiH+ivqWOixrEAwTYbChVT06iiuwmLREcW92NA/gj1csHgyc/E
         2aKdiGLgsg7IzcanhU3gEhS1Fjx4kXfao6l8sQUT9pbgFdU0Tcf1kwZ3JNkA36+DrTiu
         yg7kYrdbIpVXnslo/i8nWNct7DjQ8F/SChlfu3VQpsHnHjhj+O5B8hPATJYWKioOtWnN
         7bdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790259334; x=1790864134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VqwT+zeVYyyeJDz/W7VPDo/dJJgtgXoVFAXAXD+e99Q=;
        b=F3K3d5kPbEPHFwpEn6i8mTBzmoXMyGURRHUcDU8wjEdayPe7V1Utuisa3T8ae7Nv8N
         SZYxwe3zrR1iZmh71CUYjjbU8+HwmygCoeTjiqSidlwnWCZLb4h5bQv5mL9rv2dJ6+7S
         vnLtJwuBD2wQoH8LjlRo9+Wle8OMwnBkh/p1xfjAa2vLwA5ep8mShx4r62ByqsDyFStl
         ZZ735AynwZyVglkXjr55LyEJrd0Mg0AGReTg9AxlEQRk1EfPv6n7WbscetSgNx61jIHo
         CaitIcmt7eOqvAhhtsy3kBe+JIQCEYbQg/yJJ89aJkKfgbNp/glXOV4FyozaaLXJSl4u
         I+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790259334; x=1790864134;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqwT+zeVYyyeJDz/W7VPDo/dJJgtgXoVFAXAXD+e99Q=;
        b=w/jV5HwN/ghxfB8nI5DOPQCTjdIysFLZ2bej+a0yxBKxDOEk57aHJ53krlNT8kqmqE
         30rcUjJgE+QaMSs+wcvKSGKgLClRBAku3DjCad7L/nn5hzIICy0pbHjYD3r6ts22wA20
         YLXNG6D5ozygtQBPBCBrlFb9boCwKbk8tqCzuhxwLVRNvRYGJlYQS2KMUzFOHOOAqSxJ
         fyLo72Tho37HqN5Iyhlc92mNVlJ1BpWQYypB/gDDhoKr9nvOAtPM9MFRdzWXZK8UjZpr
         zBIrKOOSmYaShPs83xCfnfDsyxRFWTtLIpadQN4gLem0i4P/qJvOYpdSRhHH0Skw1jmk
         YTiw==
X-Forwarded-Encrypted: i=1; AKwUvBxICIByTqtnNd1dCgVEMpZRbpw2DN2zBf8HrUgb2KEbaTEkNxmoKrxfuSLVp+o2JCSKr4dVH6ntS0m3aaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfoS5h9P+pi0+Ttkz952+cSsWZHQhuuogGZlHvu2DUKW0Qh3AB
	dCeycDVwFZT0DPRcBuMJp+eODdIFsgIxbf17FlV3HPXl+DKVLWPkqIdoKH67t2L0QIbTHQAOByX
	SYkeG6FE56dxvYKRBCotV38sNIaLp7BQ=
X-Gm-Gg: AYBFou34yWy9HEvAzRz8788Wu41UlFTo4+RChpkwKe7Dc0vu3QVlDQqccv6yGMgON/F
	OC8DhkUPy+bPrA5BpFPALHpqY/YCNCTqO9laIxHfHjVDlU9D7sxOFd1ES/mQ4R3qhX/ltshB8TM
	+B5wCT7TxZLjMY9gCmtpF1KP5xKXjtsKODw8F8b1BfJwyqbrE0mT+2kgJME9x1Y+fGTA6CDu3yT
	bO8Jj7MT6G+q6GKsyHgwQFJ5LfwcnlF6difcrsoo2r5R2z+jpkWDzEQ3O8Kc+LgWXiU+h99ec/J
	1C2/pjYiR2gL7OfO0qOrr+6WKS/paQLiDoNKF2OX9ptiPhAexpx9+ImHDQ==
X-Received: by 2002:a05:690e:bc9:b0:671:3e72:de4 with SMTP id
 956f58d0204a3-672ed2a5798mr1189306d50.50.1790259334119; Thu, 24 Sep 2026
 07:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920055519.3778269-1-lgs201920130244@gmail.com> <CAKfKVtGZH8OaXp0WtJSD7AAQb8BSWg=xo+x9jj1sbjSxjEanGg@mail.gmail.com>
In-Reply-To: <CAKfKVtGZH8OaXp0WtJSD7AAQb8BSWg=xo+x9jj1sbjSxjEanGg@mail.gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 24 Sep 2026 22:15:23 +0800
X-Gm-Features: AclHuK-fZqbWgXfBotsQgsWCdm5fHoCRS2vmaG_pyD4sYaLoKbt6W1Kj9w7yy-s
Message-ID: <CANUHTR_yAgnZN05PBLae3DSk3xo0haLRRgHyKxswSYDE2tHgFQ@mail.gmail.com>
Subject: Re: [PATCH] EDAC/versalnet: fix memory leak on device registration failure
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shubhrajyoti,

Thanks for pointing that out.

On Wed, 23 Sept 2026 at 23:03, Shubhrajyoti Datta
<shubhrajyoti.datta@gmail.com> wrote:
>
> On Sun, Sep 20, 2026 at 11:25=E2=80=AFAM Guangshuo Li <lgs201920130244@gm=
ail.com> wrote:
> >
> > init_one_mc() allocates dev with kzalloc() and registers it with
> > device_register(). If device_register() fails, the device has already
> > been initialized and holds its initial device reference.
> >
> > The current error path eventually frees dev directly with kfree().
> > This bypasses the device release path and can leak driver-core
> > resources associated with the initialized device. The existing
> > versal_edac_release() callback is responsible for freeing dev once the
> > device reference reaches zero.
> >
> > Call put_device() when device_register() fails so the initialized
> > device reference is dropped and versal_edac_release() performs the
> > proper cleanup. Return after freeing mci to avoid falling through to
> > the direct kfree() path, which remains necessary for failures that
> > occur before device_register() is called.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR con=
troller")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/edac/versalnet_edac.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_eda=
c.c
> > index 3a06b41c1d84..db3bf5a1345b 100644
> > --- a/drivers/edac/versalnet_edac.c
> > +++ b/drivers/edac/versalnet_edac.c
> > @@ -829,8 +829,10 @@ static int init_one_mc(struct mc_priv *priv, struc=
t platform_device *pdev, int i
> >         dev->release =3D versal_edac_release;
> >
> >         rc =3D device_register(dev);
> > -       if (rc)
> > +       if (rc) {
> > +               put_device(dev);
> >                 goto err_mc_free;
> > +       }
>
> There was a comment earlier from sashiko
>  failure path calls put_device() with dev->init_name still pointing at a =
stack
> buffer before device_add() copies it. That's unsafe in
> principle (dev_name() would follow init_name)
> >
> >         mci->pdev =3D dev;
> >         mc_init(mci, dev);
> > @@ -852,9 +854,9 @@ static int init_one_mc(struct mc_priv *priv, struct=
 platform_device *pdev, int i
> >         device_unregister(mci->pdev);
> >  err_mc_free:
> >         edac_mc_free(mci);
> > +       return rc;
> >  err_dev_free:
> >         kfree(dev);
> > -
> >         return rc;
> >  }
> >
> > --
> > 2.43.0
> >
> >

Would splitting device_register() into device_initialize(), dev_set_name(),
and device_add() be a reasonable way to handle this? For example:

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -64,7 +64,6 @@
 #define XDDR5_BUS_WIDTH_64 0
 #define XDDR5_BUS_WIDTH_32 1
 #define XDDR5_BUS_WIDTH_16 2
-#define MC_NAME_LEN 32

 static int init_one_mc(struct mc_priv *priv, struct platform_device
*pdev, int i)
 {
@@ -730,7 +729,6 @@ static int init_one_mc(struct mc_priv *priv,
struct platform_device *pdev, int i)
  u32 num_chans, rank, dwidth, config;
  struct edac_mc_layer layers[2];
  struct mem_ctl_info *mci;
- char name[MC_NAME_LEN];
  struct device *dev;
  enum dev_type dt;
  int rc;
@@ -773,13 +771,17 @@ static int init_one_mc(struct mc_priv *priv,
struct platform_device *pdev, int i)
  goto err_dev_free;
  }

- sprintf(name, "versal-net-ddrmc5-edac-%d", i);
-
- dev->init_name =3D name;
+ device_initialize(dev);
  dev->release =3D versal_edac_release;

- rc =3D device_register(dev);
+ rc =3D dev_set_name(dev, "versal-net-ddrmc5-edac-%d", i);
+ if (rc)
+ goto err_mc_free;
+
+ rc =3D device_add(dev);
  if (rc)
  goto err_mc_free;

@@ -800,10 +802,13 @@ static int init_one_mc(struct mc_priv *priv,
struct platform_device *pdev, int i)

 err_unreg:
  device_unregister(mci->pdev);
+ edac_mc_free(mci);
+ return rc;
 err_mc_free:
  edac_mc_free(mci);
+ put_device(dev);
+ return rc;
 err_dev_free:
  kfree(dev);

  return rc;
 }

This avoids keeping dev->init_name pointing at stack storage and uses
put_device() only after the device has been initialized. Would this look
reasonable to you? If this looks good to you, I=E2=80=99ll send v2 with thi=
s approach.

Thanks,
Guangshuo
