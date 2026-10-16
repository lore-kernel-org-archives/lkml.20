Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C7E4E13F8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167548; cv=pass; b=RB56xvi8WzHmXby2EjVYgmgdN6gxTaWkfQ0X6qM2+ta9Sww+MxZqXW16ZFUE0xZvDaOGLGil9M9a8rGHtX5EGVy3SlHBhSQSwo8AbD2KIlGk/MTGa0NEp37c0SPD5Y9N6N91jS5wMa3w+3SLikZU6wtHP6rYLp03Hb4fV4nCa+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167548; c=relaxed/simple;
	bh=YqysHJ8hAbl+2oZfzAZW2MnUcV2oUbJcutj15vKNC7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EoXtH77mncF7lS+WApFbwFcb9Sr6mQx5N1cuj3IDVEj48JPX921suP2p1lOHoVGkl3dHOOWWcL2CM16J6XzDXZ+bKHHEio+yY4Dz8GNEH02cc8wBmmDYyjNYlrXFPcVau9IRTA1xeiVlTtG5ZT6fVsvjZgU8JFGk5r+xJV2U1vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MtdRJxAh; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MtdRJxAh"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso96089e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792167542; cv=none;
        d=google.com; s=arc-20260327;
        b=FWjpXO4O2mdj8Mna2n85kbYMhFy4nkkTz5FxCte8G4Aj+dY6yKlpNC9fSAEnVqQ8g7
         jarwSmFa0fvdrVqJaTwazRmbAQeY26zX7OHJzK/yedTvi0sQQKBUmUxU5wT891B1ZhJ+
         wSYVJN5SVI+9GbEpZMueXd1tQcE002LTHB3ojBVFresglJ9uWGRLFf2A2GjND/yPzC3J
         IVwHaE3NeKo8YW7HoupppTl5OvXkcWZhKKsvHVl/FBfagGk0LpizjamEAc+ebU71RmjD
         NytjBvDq5jJyOS2szd1uU9VbWbrVUYPdC0aq7CHiCUTpWbPzXDPoX+/hxIv6e47yxx8g
         IiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IvChtf9LSS/4ddYPCnwVANDKqgly2aSTJ7xH0ngfMCk=;
        fh=rTegZYQw5WJ7WPjpno245A1anP+ThUmHnuc6MC2swWg=;
        b=LKRiqtaKtMUxze1FW/3FauzFUzBPyWzygFdvQSalG07jQg3hT1WChbiZlrYIfopV8O
         +0im24izFP+eqGegwXfrWBWl67zjnlIG/QzLXMJUbOB9mcm/Jigfl6ZLoyO3bytiTNKW
         S65IL6CT3UmHMniWvqv8bW+aJpyZWpMQ5fy9wwkgYpCwxWF6mbdf7TyG+oGggPdIyB04
         2ywd/9+9tqm1y6jfaCUo167I0UMiVxRVx1zapFFlVSE4gAXgrHf/yDIB4FYNrLQIrG2G
         vO9vv4C4201ruCw7hzDpoSph+OWKCcc9FpZ5g/v7NIWa6tk+XuiEH4bEee2BLpZJtMQp
         dt9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792167542; x=1792772342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IvChtf9LSS/4ddYPCnwVANDKqgly2aSTJ7xH0ngfMCk=;
        b=MtdRJxAh5ciFEmTBHIaULAGIt9DkqfMzRXEO5kB4IPRlWoZl0eYWuEjpVtXaFkGPpU
         EC99yss6Tcjmz7leYPPHid0fHYRjSzhp3ROyZkHo9Ct35UfkmdAGSV28KJmoT2h/7UfB
         YCnxfn1TFw4TkErcjSkdPVWzW+et44M6JuJxOp3s4Vd1dau9GeDLrgd426ODhNhRLdVi
         f+1E2iYGApVKdolluyyGPWtgMDu3QY+UeYNNinrNZJNuhxQpe1FHCitdZiVmV/t3Xt61
         fqfFgyqbw1w+RidEh5bCk4ud9FTpFo4tf6NiRN6VB8e02x5sB1J0pAas+wklqGOYF2OR
         82eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167542; x=1792772342;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvChtf9LSS/4ddYPCnwVANDKqgly2aSTJ7xH0ngfMCk=;
        b=POwPZQv01l8cF7zP1hd9TiOWfgDmXD+k4n6Tuy0j5UKe/2najv2lZn7+HavBns+PDu
         QO/QHTjHIb5VMH3+dVjmc1BVm0OQr03vOqasnuFkNSIAFAIW8QuEBybODF+VZW2dbkJf
         2/fVr9rw/e3tY3065FB8fvJOW0UqlFzve7FBQENsAzgJ13kZMQDjNlmysk9aZQe/J7fl
         B2uArfhHPCrbMPyj8lN1mS03fW+TsS6vT5X6Z6OyEpmJ7EKg0Ncy0lwqmIdAmiqlhJal
         t9+8tGze3OrZCvpJexu6l3+nMnaK1xBfSZpJQQ6S2nfp6CFVhfrjYQTlYnsIKefZmYj5
         3Dig==
X-Gm-Message-State: AFq9FYJmeUGK4tcamGmIUz8XeEU94Al/50efiKHEJTMwjXLPkgWtuXja
	gI7HN69KpKuqEUNInPUUh/1VlP1IuW6EZywvdT9jtavxhJ6yB5XjGMIgKop/LR5i+M0lipXXS7Y
	96VdIHT+HqdsybhnJQjGke1W9iLTOF/jv4P7kEYKjKQ==
X-Gm-Gg: AYBFou0I+G0QqUdA9o3Rb4865y3vmRZMEGVfu6sUcfIUGzcfCHt1/5JtEuI3oB2WAON
	LANhxXf2BGufN8P1H9/JiCIQdUMYb2WXLduJk4AnjpGKzqdMuhx+1383oBe8aOgJNUFdZ+sq5a1
	s8uFxKG7e5IMnAVjD/h3GN3X6L6rKbqwWGNKJ3al10yJB+vzePOi+EfinhdFXh8gK+buL+wedzx
	Nx4l/2ntJQFZRlB3CPcPiaxtbP05wrC8Kc5JT0V060gCefIrEusyHYlzLMCdipZ/E3cph5t2t1t
	RRxHyugnwcnL9L4wn7nQ35X7pKiTNFypyCB9FnBIcrc1noHEk1ka+SNrobTUuxsDXR0TVosn4F5
	mI7OvcJ8veUWv
X-Received: by 2002:a05:6512:3a87:b0:5b8:edbd:60a4 with SMTP id
 2adb3069b0e04-5be50a7c7a2mr18956e87.43.1792167542360; Fri, 16 Oct 2026
 09:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015140148.231126-1-marco.crivellari@suse.com>
 <20261015140148.231126-2-marco.crivellari@suse.com> <atI8hifJ8K4BAIPg@gmail.com>
In-Reply-To: <atI8hifJ8K4BAIPg@gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 16 Oct 2026 18:18:51 +0200
X-Gm-Features: AclHuK8T302MrEU1xK_LCn3oN6nTR-2-96zXg1E6YBBWCzWaDxufp4CRGKbUz6w
Message-ID: <CAAofZF43y3_R-0rifCPkxydJ9SH9rWFHyWE3o86Aka_BLDU-DQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] workqueue: Make alloc_workqueue() unbound by default
To: Breno Leitao <leitao@debian.org>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 5:54=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
> [...]
> > @@ -5895,12 +5895,33 @@ static struct workqueue_struct *__alloc_workque=
ue(const char *fmt,
> >       struct workqueue_struct *wq;
> >       size_t wq_size;
> >       int name_len;
> > +     bool wq_unbound_by_default =3D false;
> > +     bool wq_dropped_percpu =3D false;
>
> Nit: I think these declarations would look better in reverse xmas tree
> order. I know Tejun doesn't feel strongly about it, so it's just a nit.
>
> --breno

Cool, thanks for the hint, I will change this along with the removal
of pr_warn_once().

--=20

Marco Crivellari

SUSE Labs
