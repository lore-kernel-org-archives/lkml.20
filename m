Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40D73DBD41
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280058; cv=pass; b=o9t9ls+7wzXH/HpzIVy/YFYY/x1p1CzlqSJuoUA44LIwA6YFDeHcxi5RtKI20ZyhwuxwLwc3J7iHM4mMn5HeMaBdtL4CHOhiDPpwkST3C1V0iEQCUMA5DHmvq1KcWTYPEhN9Bx2ZWmn9IS81YXymftst9XZfw5gM8vdnz/ItefI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280058; c=relaxed/simple;
	bh=rvuG4iw01xPWOBqohLdEHYOYOUAXqieQVH4NTOSvi+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljBtiEGapr1JG1dhBfz+zjf4aoW0OFoiSXGaRfgYWACAjRtmX5exIgYbdG1O4kEb+vA5VpTIuowEAmEgcGlwU2fMfoXQBPM20ncywqMJ75ayF5lLMA1/UWDj0b7FiYLevs8pJ9JVrUu09k9FWi1Yd/neq58gzbBk0yS5ctQ+iUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3DRND8w; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3DRND8w"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a17baef589so2376565e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791280054; cv=none;
        d=google.com; s=arc-20260327;
        b=K+AMroI3v8uKCmq5EGe9aM+bGufanOuqENxwHyTuk+MGlh0TgFJq/HM1UDhpZwidKH
         3Ff37BPxxBV+hbo9m1mFi3k07K4QTxbh27gQUxfrXYmwBOGR+SGRbn5My45CY2EyKzzp
         fPaCRt2lt2mGA+lTU49H+MctHz/d747mjdc3QzomKWtZnvd+rPNmgxn8vxLomycWp6bC
         Pqi5N91p+ALI41CVBxBaed4jwcoJDCiGnDfTgeUHBXHM/EBy4QuHRqNDFszGvsesWTqO
         EpGUzQDjVNqtFwTjIwqe5bQ91QKVBRnS7fVZpnEGb7pJ+pf49GA11K1o6j42thUvJ7AI
         BKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CmmO8ScL+eeMfrapWdr48bCTojDCYx9YeRYZOdtKmKE=;
        fh=VKB7PKljIOT297pRGsFZnZASracfqiFu1f19ITkDktE=;
        b=Rj3xnTajlSBMVW2cQUG2XDI+5WDYVTCjQj5Y9/7OGh6nKSs+Vq4QSZyAgpf2loepZa
         cnx9fWLtn5Nuz/3OzyqDpjP0yZlBEBG8DYAwx13QiEHSXaYS96Jn3XnRIl5wHTOVMXPi
         xB04y1EH+FIQa3OgDouVDNS+zXNRNA6NXofPJf8Xh7Bk/Vx3wOnxVUtb+13i/hDM4VMP
         Enm3HIzcRsn7LRxgYsx/vdi09sPOPwIyHmXU1ZdsyygXyyIqP7iQ1/FOIl/2PJF+aPWL
         YRVgAISGAYOAxVHfXUPlu1bDZMVpqYQYkcuoTWzBN6d8bykNubyalj7svowqTEcjPYyJ
         Y3pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791280054; x=1791884854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CmmO8ScL+eeMfrapWdr48bCTojDCYx9YeRYZOdtKmKE=;
        b=h3DRND8wauswBVJM3yN8ZvaUkn5X/yoX844Nvcx6KEA5Ymo+TCXf2vLhLcKalEbFcb
         t+zky5UqYnqSXxzvnLL5+5Zr4qfQUsOV9nbs0ZH6Fs93PwmbJ0uMeAafujh6/nr8OC0j
         BpJjjGqRoxGcfCL85gMvGxeHOkIgP4jUqGlCkWJ41YEaLaxLvmGtYgbowMK2SvM3BE7g
         PzUzzV/yIyGe7A+HN9gfVfJKhmK9ngdJabJhlgF4knlb9+8DaoC9HKvPCATPoP4jgn13
         l7PRqQzFDdYN+hrlkpeL0wXcIVrqFKGI8BIQm2Lweyro1KrRdMV8PDxZa9RZG/zRo6we
         BYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280054; x=1791884854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CmmO8ScL+eeMfrapWdr48bCTojDCYx9YeRYZOdtKmKE=;
        b=d2oyvXKcsWOuDJVLaNSDake5JGfrxu75Z9zhb+fE1slti3uny1AjekwVmisv74sky5
         EgQmblqnycOa1LY3hIFfQfKA1H8spR0bHHzF4W4ZSVod7t6dOfeUx2Fu1cJPpMzfbSZw
         KcU/krW5leE1xKq8+yLFCMsNosz8XH1NZAk6eN9I8MfDqfz7cXh/dvUxCDc0hkqrAwl0
         yz78AAISLL27gEeSxPylHhdnMtVbjTguueM28cpdsOqnSf1ivKENmH1aRVvvMxDYerMx
         DI9RRnkz/MuiQJxl5UUXor5K8MkdOdK0jZM6XkxjN2Q+WlS8X8f3thHQK3XRFi3S7rpW
         RAQA==
X-Forwarded-Encrypted: i=1; AKwUvBxY/aPXbe05nK2lZ+RM1S0dQny7NwVgwXsvpWYZ6vIJOurCWe0cIs6WL4mksOpB/KQpqRboQ4Qed/xKS38=@vger.kernel.org
X-Gm-Message-State: AFuF++lPpAQv6Z10qnIEE24QCrYywH1lBiT9avA+rVgxnoKJYVxSIJWi
	z2wfFdvKc5LOJFouX0CasVfFbTrFdVJCzZ6PJlrFjRnyfEKpOxHsa4nbkxbJb5qJBD045I5YRqI
	bKqoIGhJe50yEm7cE2oQN3PJH04i7az8=
X-Gm-Gg: AYBFou0rxNWkoKDdxjOFWVNnz4qKYjZedWznY5AMEwX2TPJ/0Zf5wi+bkQMRCwU2Smv
	vmbxU7YoQJt9fln6GQfXy4Z3mnihNkK8jCHRl60eVtwQAKZk316MoZhEYnMqGbLM8OJ6DDd73gG
	B5UqzTHfozmNY2TZUIxxRgGK1CCMA97cR3iWVTBuEJoO3q2w9jFvWTJSWw9ePmKoDANv2fLpsZh
	BIpW21FWy3kSf/sI+1HQdYNlLwbVGr2efqQ4NNINO64IBNZS5rfP2J+ErRLR0VAKsI34yYLEvDj
	ZBGZB7ixAj69wk3gvlY6DkDuFa//I1m0No6rx5zh+0IPsYi5c866sTb9LWe8ayqrbkm2OPd9OdH
	HJwFk3Pz8Hw==
X-Received: by 2002:a05:600c:5883:b0:4a0:12d7:4c88 with SMTP id
 5b1f17b1804b1-4a168101d97mr118976795e9.30.1791280054184; Tue, 06 Oct 2026
 02:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006002307.2669023-1-usama.arif@linux.dev> <20261006002307.2669023-2-usama.arif@linux.dev>
In-Reply-To: <20261006002307.2669023-2-usama.arif@linux.dev>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 6 Oct 2026 11:47:21 +0200
X-Gm-Features: AclHuK-gPua9uIItL7R1xoKxAEDDoC5tNOgy6aNtMtneqHY4TcEmx3Ke8MvnYho
Message-ID: <CAKEwX=O=QNWUCTn9kcCwu9V3pTrSwTj8SMCMS6Z-8fwhGjrkdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: zswap: use separate compression and decompression requests
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, chengming.zhou@linux.dev, dsterba@suse.com, 
	hannes@cmpxchg.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	terrelln@fb.com, yosry@kernel.org, riel@surriel.com, shakeel.butt@linux.dev, 
	alex@ghiti.fr, senozhatsky@chromium.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 2:23=E2=80=AFAM Usama Arif <usama.arif@linux.dev> wr=
ote:
>
> Stores and loads serialize on the same per-CPU acomp request and mutex.
> A low-priority store can be preempted as soon as the compressor drops
> its stream lock, while it still holds the mutex. A higher-priority load
> on that CPU then waits until the store runs again, which can take a
> long time when other tasks are runnable.
>
> Give compression and decompression their own request, completion wait
> and mutex. Since commit e2c3b6b21c77f ("mm: zswap: use SG list
> decompression APIs from zsmalloc"), the per-CPU buffer is only used for
> compression. The two requests can share the per-CPU transform: no
> in-tree implementation modifies transform state while (de)compressing,
> and shared codec state has its own locking. Loads can still wait for
> each other on the decompression mutex, and stores still serialize on
> the compression mutex.
>
> This follows the proposal from Sergey Senozhatsky for the same split
> for zram [1].

Thanks, zram peeps :P

>
> [1] https://lore.kernel.org/all/20261005122036.718976-10-senozhatsky@chro=
mium.org/
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Code mostly LGTM. Just one question:

[...]

> -        * If there was an error in allocating @acomp_ctx->req, it
> -        * would be set to NULL.
> -        */
> -       if (acomp_ctx->req)
> -               acomp_request_free(acomp_ctx->req);
> -
> -       acomp_ctx->req =3D NULL;
> +       acomp_request_free(acomp_ctx->comp.req);
> +       acomp_ctx->comp.req =3D NULL;
> +       acomp_request_free(acomp_ctx->decomp.req);
> +       acomp_ctx->decomp.req =3D NULL;

Hmm do we not have to null check here anymore? Does
acomp_request_free() handle NULL itself too?

For instance, taking the code blob below:

> -       /* acomp_request_alloc() returns NULL in case of an error. */
> -       acomp_ctx->req =3D acomp_request_alloc(acomp_ctx->acomp);
> -       if (!acomp_ctx->req) {
> +       if (zswap_acomp_req_init(&acomp_ctx->comp, acomp_ctx->acomp) ||
> +           zswap_acomp_req_init(&acomp_ctx->decomp, acomp_ctx->acomp)) {
>                 pr_err("could not alloc crypto acomp_request %s\n",
>                        pool->tfm_name);

Here, we can success with the comp's req but fail with the decomp's req, ri=
ght?
