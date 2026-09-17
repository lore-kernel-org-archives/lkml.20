Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AA13AD52D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789681911; cv=none; b=Jt2fiyOvBiRczwxKdiVSlW3oym8f5qUUndi2TNRnuRUAut76iczrd1picqU+XpkPaI2fiDlyhlVNgl4nLt5gpYXdLdaTL9VgQ1oTeKXsRKeQ3CX0wrHQJzpP3qj/WRObfnlhcIjhLCspJ4nRNoq+SOOXR4csw4GH8fPqgac/89g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789681911; c=relaxed/simple;
	bh=h5HxmjVsexGSgQzBTaXxA5FRuYE5grZdMOjOrxCYIkA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gqq6W11GpYerfqDVZAXAGcDi/Y7k5EocnBasFoezyatDge3MlpxOipqkWFPIonpvpWgPwZXbO9kE4pT+PMnXfX3jCANUrHQWm02PihUpYvf+4R5qaAEufkgMz+RnmLM+15nvLGeq/gCiIztm5qm6v1Px4V+nQHTmsoeO+sgbKoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=enX/Heai; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hgiZnVgf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="enX/Heai";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hgiZnVgf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789681908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tt8WLUmC8MzD51c/rGvlTmZw5aHynyLZDMykNoT0CLY=;
	b=enX/Heai1WwIQkMgFWw12ULDmPMqX0dfubFtDGzhCE8Kz9rjVcHK/XOYsnoHwzZAncbeCR
	w6N8IO9xbpBkPGnLOCcCVTqT89sKc7Oj/0I+LG+YfpyyRSgpT91g5xVFuefGKc61CcRlI/
	ZC8AnZPr8s6u724XwrU6tX1izQ1g6jw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-59dft1NSNtKZbyR_6Jxyiw-1; Thu, 17 Sep 2026 17:51:47 -0400
X-MC-Unique: 59dft1NSNtKZbyR_6Jxyiw-1
X-Mimecast-MFC-AGG-ID: 59dft1NSNtKZbyR_6Jxyiw_1789681907
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9104ba8bf51so4223336d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789681907; x=1790286707; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tt8WLUmC8MzD51c/rGvlTmZw5aHynyLZDMykNoT0CLY=;
        b=hgiZnVgfPrdspf1CiXJyUtVSdHQgFsUjpXweHWbYNREtE0JXDT/kfk4ocpTjcE17l2
         7TlZLs/CFTiVtx2YAsw1QrPkqMjv7SxsPm+UvpWUuuP2Dx4Pa9wjR555hVbTTzSu7Ts8
         mCEnnnAkpufWpFQ7fmNV8nHa713BPvn1sXMkIpmqtjwCToUZkfEHJ5cakgH0XoeOuUUS
         +PVJWo5KGPcSAlXgZqzFQ4WnKIaPeJCv6ml4fmI7MozNZb6EfbOOyYdPE8+nOmPeKPky
         nIZnagVIO9u8eI38sIr/k4dAHl1Ci0tU6kbk9ZAuZwOIHQXJcN9qceAtAxjGzSQwBDAF
         dUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789681907; x=1790286707;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tt8WLUmC8MzD51c/rGvlTmZw5aHynyLZDMykNoT0CLY=;
        b=Wn2Jc1IyMNXn/ZX7oa7ElGLNCPEJTowORqRXy4Pj53XtWWkyL1A/q89g4CvH8UZXzh
         4BZzkvcEt8wc5U3HSA51nwm/4rrJnJNO5wQXnCGTVWNs6x+XhlIYlhlGXXV7Mjudi8a/
         L0pkYd5r3g8bhHAvatFsj5bBeP+IiaoRUoVOve6zp3RHNM9HL4RF08Vf4AzNIbVuc986
         iPhMzWI+AHdWgw+uQNlMF5J5sN8YCVJZWCLOxhLSn/wI7GViBZWpVlSjloksyXmYPLGd
         W6qhQsKAcHYYTjNqCfFsEJ9kyfVR+jUodjNJ0oGNlYP4my6n4tGZUSNEKi7J5nDXTRkJ
         BPSg==
X-Forwarded-Encrypted: i=1; AKwUvBxQrM2U402sn1jVdV+vFpZLjpftcKvJKpWtP5MZskxbOD5bzIrcwkCQob7rizpBYY4xjLCfnTc26k6zaw0=@vger.kernel.org
X-Gm-Message-State: AFuF++l3xvwxOSjZj4Sw2SMr+6bduohdWj2o4A4lCjgMMY/Xti2zTSST
	tJRQjzqwTofw6ukGhjflU9iiaxkhU9tNHMfi4GE1xJ+BFjL8QsOrrOSmhGnnLEbCZCC2f7410j5
	UEbXwZZNbI1OtMwdMjOmZQKrmX3KenkcziY00Y642V+RWYwpwcKQtO75K35JmjNkGuA==
X-Gm-Gg: AYBFou1iU0U1PHf3zOAfi8teSSzTbUZaWjI6YeSouXlh10K0jfQo070EqFmDgTYnu9L
	xo9T74NAbk2VJFuRzsYpXJ6uLrySmhQu1vELYGI3ZaKMt+i+BTiRijUVgSfEWymwj4YyYGNcQQ2
	VdQjoWB4bq05z7+shaM/BmMRlxlR0o4yVq6B16c4l/Ta5Q3s09vgCXx/JaAXoK7FctwXQV8TgT2
	uqwiBxt9wRDIqrM3V1OR6axEHsHqcXMc6btaBfDG/6CJhiFPNpDYeJ9+FdS+zmRoCh1AifN6gtO
	oO3BCb2czNMFLKD34/N2NDRRD+cZVV408jbqD+Ep+DR3LlOMbVNbHhmk7gqt2QWezo9qyWg2
X-Received: by 2002:a05:6214:5b02:b0:910:346f:1027 with SMTP id 6a1803df08f44-91254cb1252mr10497406d6.37.1789681906735;
        Thu, 17 Sep 2026 14:51:46 -0700 (PDT)
X-Received: by 2002:a05:6214:5b02:b0:910:346f:1027 with SMTP id 6a1803df08f44-91254cb1252mr10496896d6.37.1789681906238;
        Thu, 17 Sep 2026 14:51:46 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252c5bef1sm7946836d6.9.2026.09.17.14.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:51:45 -0700 (PDT)
Message-ID: <b020f35ab8adda3907ec2be57057996be40717c5.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: RCU-free the scheduler-containing
 nouveau_sched
From: lyude@redhat.com
To: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>, Danilo Krummrich
	 <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu, 17 Sep 2026 17:51:44 -0400
In-Reply-To: <20260902012717.880724-1-malhyuk97@gmail.com>
References: <20260902012717.880724-1-malhyuk97@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in just a moment

On Wed, 2026-09-02 at 10:27 +0900, Jonghyuk Kim(MalHyuk) wrote:
> struct nouveau_sched embeds a struct drm_gpu_scheduler (base).
> nouveau_sched_destroy() calls nouveau_sched_fini() (which does
> drm_sched_fini(&sched->base)) and then frees the object with plain
> kfree(sched).
>=20
> drm_sched_fence_get_timeline_name() returns fence->sched->name, and
> the
> scheduler fence keeps a .release callback so it is not ops-detached
> on
> signalling.=C2=A0 A finished fence exported to userspace via drm_syncobj =
/
> sync_file therefore keeps pointing at &sched->base after
> nouveau_sched_destroy(),
> and a later get_timeline_name() -- reachable unprivileged through
> SYNC_IOC_FILE_INFO -- dereferences freed memory (KASAN slab-use-
> after-free
> read).
>=20
> Per the dma-fence lifetime contract the exporter must keep the data
> backing a
> signalled fence alive for an RCU grace period.=C2=A0 Free the scheduler-
> containing
> object with kfree_rcu() instead of kfree().
>=20
> Fixes: 5f03a507b29e ("drm/nouveau: implement 1:1 scheduler - entity
> relationship")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c | 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.h | 1 +
> =C2=A02 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 2cbae003d6de..48dbb851df2f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -516,7 +516,7 @@ nouveau_sched_destroy(struct nouveau_sched
> **psched)
> =C2=A0	struct nouveau_sched *sched =3D *psched;
> =C2=A0
> =C2=A0	nouveau_sched_fini(sched);
> -	kfree(sched);
> +	kfree_rcu(sched, rcu);
> =C2=A0
> =C2=A0	*psched =3D NULL;
> =C2=A0}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h
> b/drivers/gpu/drm/nouveau/nouveau_sched.h
> index 20cd1da8db73..51ce8dcf6285 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
> @@ -98,6 +98,7 @@ void nouveau_job_free(struct nouveau_job *job);
> =C2=A0
> =C2=A0struct nouveau_sched {
> =C2=A0	struct drm_gpu_scheduler base;
> +	struct rcu_head rcu;
> =C2=A0	struct drm_sched_entity entity;
> =C2=A0	struct workqueue_struct *wq;
> =C2=A0	struct mutex mutex;

