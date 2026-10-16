Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38433D6CC3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145883; cv=pass; b=mrFllb88yhY+SMvX2GUHP1OWDLqSXucB3CKaFp1lEQIJpLfwU/4FdPIyWXvlmX+rLizQYPLWw48sNbEK0rRXcYvSvK6kmSLvGpPW5jl5Zsj7ohRuwBPOv8UsRzQzszZrL8fhz1CWiSyntZpKz+CtdsLELy+nfIlPewkCrHAzg0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145883; c=relaxed/simple;
	bh=Sj3xvQXzBwK5FlxAyMdrOj5qa7nyHTSMWIZmSF1lNkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BP7659opPI53ymZQiCPTu7belcKWgvTRDB0RMQZbO9saMKidmMxquvd4wbCRZ6MmepdLkN8bOhb+Tdp57PG1ZgUrbII9E+VdacUlN+I8MJ+pLb1i1xryQJPHF57U7c1JYvkqzgD2PzesvOj6Ro7pjXbaz3gqYWwWGyy1FylUgJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=OuyEkAcy; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="OuyEkAcy"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53396adbc53so27594221cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792145881; cv=none;
        d=google.com; s=arc-20260327;
        b=TygFj2FvLwTyhzydcZXk1Nrk76AyhvFVL0dTYiaDhuq+ohC6FNmzGIAobXlOz8mwox
         z/gy03LULzBu6OmGL/9d0R5qYMBz3dQdDCKjVJJHAmfeB66lf372zDxoEOP/j9sBkWGt
         p6q0Bs7tv4xONmK7E8rv/n7KeRY00g484G6tsj/30ycO/lBced4pKFk4CDFG903toT8A
         Tn/FraHHsk7BJNtQ546Axbg6LoX/NBTxgqxv369GngfKwuYIFEQcB6Vpprv3xqnBUbxh
         IfQpGOyr+tmdf8RM6N30v+JJ67bU6yXEL/WfG699NxYosv56WiwDXUJmsvHH6pfa8aVY
         YkRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lEC/VqWw8QmnDgQ20hndozyHJsfsJu9lNxjgfFPQVRM=;
        fh=X8C6VreHqabey0+zNWlimJuOC1ZMYu3Ex+FushugXbY=;
        b=Hb1UvHZDV8/Gx2SI8eq92AY7TTav1qTrVwJVRZ2qHg76pE7mDhKhA/W1OuisrulTe0
         ODXCfbyjbxT2/hqX/ARGvdbqOYvTNy7GHqQ4Ial+DTpq5esR2yYOc0E+0TmXHFTxGWG+
         80r4YrL+5QZoijQSya6Znau9NrwkOUsuD1KizLeRTnMZYc+RdfX0bT4N4ZOmslL3Aqsb
         VRU7l2PzTEBb1CefJDEn+Vjb3WfaafGM9Tl1y2mxkIKClgCwGuZYY5xEyAq5ZfZPYqWJ
         s7hBdhi2/RKsCLSlsYFfdEW51wmWJSJ/rDbSJuJjVjm7MVVRN8yhioaJ5kbOaPklHECf
         Ap0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792145881; x=1792750681; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lEC/VqWw8QmnDgQ20hndozyHJsfsJu9lNxjgfFPQVRM=;
        b=OuyEkAcyVJlp7CN4PsEtbh7AG3bdMUkB2h2Mo4DMPlLZ5T6DyBJ5F+WmZAsaT0PEht
         v+Rj31FHi9Xfvh/shD6MkxWrQZK0dwC9+6LuB7OfnXBzCtQOnoygHdXjubxwnjjEJP+n
         /YJjyQjcHj7QqRvGEXGNhxQiKSwfJAb+BxGjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145881; x=1792750681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lEC/VqWw8QmnDgQ20hndozyHJsfsJu9lNxjgfFPQVRM=;
        b=Hv0/QhVX7eCEBf+AkDtdkjjWmQcfAYpwW3OzwUB8MzGMc1dv6idtNsH+mge3SR50tC
         nuUNw4oKfiAlOcHjdvMUs/YAwwmcfpj9GPs3GWIIgkLC1kxwJ85TmjshXxRvT0e49+o5
         FMt2s2IeI6+6167lqbkhFHaDSfhoEif2DU+L6F4C64fTUfo7nS02TCiNl8/udFDMU0tL
         gx2T0Y4BExucxBw5fF/an/8q5UxNr/ZG7ssC7L71pET9GPPJ4vgjbKc+p9/qviR9L9sh
         HkLCXsFdGe24Rw7a0GvHOPifFCaZ7oog2c9Gv258uGwUnjM/i/Uh5Ka+gH5Qvo0/NWaz
         gMBA==
X-Forwarded-Encrypted: i=1; AKwUvBzzqMaK1HJCFtS94qCUOlx2UUBFlRLEilDY++/iJZ6vzJ2EJXKTvlLtiOY2qO6G+seKvyQq1M9jgzvIicw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh2smdKhB+SaV8BniZypwrkoKyehrqL2OBhmA9nPfjdMBIAlDr
	QD+Aq1SLNE/gZtkOqaz45M0aVASKJ4m6l9HkGPsoEPfZgXzbwcQaM+QJsK73FEo7vTU8ITjT0p4
	JWoNwje9eLuRySzzIJ2qMlCGSm5kRIk7nxPSasYN6tjkevM99JUuY+TM=
X-Gm-Gg: AYBFou2mumLIwcgyA3vpkCi2B7GSBtWPLBn6PBbvOiwwCPClaacf25A1+0RML29KSJ4
	/h4sOIsPP3nNUytHzN/QxZoTA3F0nJd+cWlvdTyJtlFbI35sg/fY9WJPZNMO0mXmL1dF4RWRN6L
	OniJVX9EEBB9vPd3a+ODaeRlqfd9k4HCxHZrGFeg5tKEt6xfyOElSYSLmhi3W7nKKXH8hP9gkKU
	oahShxeL2z/zU7N5FhsHzY8hwzJ02mwUmITwh++w4mKyOTKC+pZtgSaoqCmy3gf2hc+jRY9c6hq
	1HgXtJpbJjqJnVV8hJKCUllNbEaO3QvGoOc6OAEDY+NkQ2jecNgI4ZKZXOEccsS9ECH2UswQ0Un
	GXjHIbSg=
X-Received: by 2002:a05:622a:1e12:b0:532:c057:9564 with SMTP id
 d75a77b69052e-5359fab3627mr359378831cf.23.1792145880855; Fri, 16 Oct 2026
 03:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-fuse-full-objects-candidate-0002-v2-17d6013e5066de33396c@gmail.com>
In-Reply-To: <pm-fuse-full-objects-candidate-0002-v2-17d6013e5066de33396c@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 12:17:49 +0200
X-Gm-Features: AclHuK-GA-MxM9Iu4dlDwiNkLK28UyhPoiqmCUn-nyc9cOB66nsj-BxHZ_7_UWE
Message-ID: <CAJfpegteiu8+=1QJbHq9Z9BuBHRYnmHAkYn2bMxbxxhNGvpBxg@mail.gmail.com>
Subject: Re: [PATCH] fuse: serialize processing table installation with I/O
To: Cen Zhang <zzzccc427@gmail.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Oct 2026 at 08:29, Cen Zhang <zzzccc427@gmail.com> wrote:
>
> The processing table of a /dev/fuse endpoint must be initialized before
> I/O can use it. fuse_dev_open() leaves pq.processing NULL, and
> fuse_dev_install_with_pq() publishes fud->chan before assigning the
> table. fuse_get_dev() accepts the published channel without taking
> fch->lock, so the installer's channel lock does not protect the reader.

Thanks for the patch.  I arrived at a very similar fix for this issue:

  https://lore.kernel.org/fuse-devel/20261016082243.2865588-1-mszeredi@redhat.com/T/#u

Added Reported-by: tag from you.

Thanks,
Miklos
