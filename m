Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACBB3CCFB0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165854; cv=none; b=E66zVUcsZ1q7kIJkAE8QU4r4plI6drNcau0b+MtNCcIshQ0VgrYaEB5/P83j/zttAACCaL4SLZFjZKTHU4PWxZlSArWgEwG6gH5UHgeU3YjpeS1eZj/2y4W0Zlc47n8tzutM4L8ZjI+ueL2hjZHc4hNxyR/cAPgXRDa9o+xmk70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165854; c=relaxed/simple;
	bh=EPXi/i8/cLIOytc/4g/nQ5+sJUy3gys8AWpUeJuA7tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Puomu2QHHd3CPD9ANQe/gV/EmUzsGpT4C1FEFXqAFiJCyaX9SdrjRZrJG39IqHYL4HXwxpi1Le7kvxW49f0Ld+AP0K1quHtcQP7UEwbTPysB6DHeIHQyHs1rkjUQTRDbnU8II+Ho9ItnU0n7onrTwSU112kfXRJxYLx47GW8VO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FgFH8d5U; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FgFH8d5U"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48433f36a21so1065107f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788165851; x=1788770651; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/IdgWJ9SyaxkF+z2j2vaf53j2K61APsWhXnC/i9sVbU=;
        b=FgFH8d5UVfQoQeiuITU/VAtc7XVKlGdSbOhxhunVuyw6LlUog9ng7y5gXW+Uyt0SsK
         u4/cAgIUZ+Rkpolz2kDKzxV5gG8FUgekS2ZU0PJ2HN+9ccX7y/Sy8uqIK5FInfadaqd4
         RcVuhgZa48uokEtEcJIKyRLjnmMWE3znAI/u7d0bHR3pVAhzpS9l3KJPtZMfZu7EUocl
         QBuopjEy2zOENnAjkNPZlgj1oib00RQzQMXNWu/ybIn8W/PQT5JnDSUVt+1dYJIJPgGS
         y6llxvvOI2jgXoL2uKkQQpacnOG/NI+EV3wmt3GuwILKZPkcdyHrqSWk1s0K5Oz93POI
         wn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165851; x=1788770651;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/IdgWJ9SyaxkF+z2j2vaf53j2K61APsWhXnC/i9sVbU=;
        b=Ssyjpmh1gWbK0vfMnv5lUs/pCrKxDds3PP8ytdY3h43qEqCXOEV1fxLhs/oxMxRi4w
         VKd1iIDIsm63fDVS/zwOFRoCfeC1rr10+98hu1+ErvtchEbJFwfHC17BfVjLinAzHKtw
         i6ndVmeETX1NEASwkZ4cfgDhrq1ELPNvHIBi5YE7qfb7G+o4r0+mBxvg01ex6BbmNHNd
         oK4pNM19JbHmlXB0uBnMt2AKculf7qRhkNL5+eJbNBYDX5KIEYDyY8NM5lVPyv0GrRgR
         55XDgGcAp4bj/bgr+ln5fETeSApmbj/m4alSrcnPAB9zuVMIuOfA9bT6ubPf2j/3g5qc
         C8fw==
X-Forwarded-Encrypted: i=1; AKwUvBxKV5qwjCnx86VvHfo2RRZ5wiavocj897/sh2gT22h1J1d8aWHZFVt8EkgWiybTP9mYUwuNlWuI4adIZLI=@vger.kernel.org
X-Gm-Message-State: AFuF++m6VXY8zqQSjcTktWLFDegwkjORbMPknRWkiWtas+L9RYiXEWM3
	0ZOTy931x2jp5hhURHmMiP//d9yw2jpaszWWxGfi0tQufGprEFi8BClt4YjG+HfnkPA=
X-Gm-Gg: AYBFou1og3qWGqLFeOE68CMLUPtcFGmDDVDhGq0Quh/WpSdX77NX5bmEeSjOFkunlKW
	52vgnqeBLw2isV21l88CLWM4ms5W+lQ3esSNYHw5EfnwWsI4JXZLD9ilYe8gbSysEpI0wE+PtrQ
	RRgmUd/FJTRLjr9Sr4UzO7FaSlipomi0S8Z2+UFQ5GwRX2GUmiDMfvnIftOk0hJiVO7bhwkl1ho
	77blAQMEHckmfQ3+50SX3VqssDb933+jSEZwz7m46VpLf9OEIwY2DpxI8Lp/Mg8KloOnOBbbw8z
	QS+Xuq4q495/r+7U2R+Jk09YR+CWdaBDIvGeav01joTWH/0Fn6t0A5I78Rg97hLmONCkljxGVTV
	qj9GiGBlC05YAepikaNPF/LixCV9gstU6J9rbQnzt1b+PGpRJGXP/upFXDT1F/AZOctapFYmrfr
	ix5lL/lhNdQJZzOFTUxM47GBwivZRdjZQLqEcSgUEO8aewVNbKni3gr0gClvDMyw==
X-Received: by 2002:a05:6000:481b:b0:484:3600:35a9 with SMTP id ffacd0b85a97d-4843978e680mr12471515f8f.3.1788165851386;
        Mon, 31 Aug 2026 01:44:11 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48435b024fbsm12215795f8f.29.2026.08.31.01.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:44:10 -0700 (PDT)
Date: Mon, 31 Aug 2026 10:44:09 +0200
From: Petr Mladek <pmladek@suse.com>
To: Song Liu <song@kernel.org>
Cc: Harry Hsu <x90613@gmail.com>, jpoimboe@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com, jikos@kernel.org,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] livepatch: Clean up klp_init_object_loaded() when
 fails
Message-ID: <apU-2f7rffaTUKWC@pathway.suse.cz>
References: <apBbjoEHJ98DWN_W@pathway.suse.cz>
 <20260828125244.509977-1-pmladek@suse.com>
 <20260828125244.509977-3-pmladek@suse.com>
 <CAPhsuW7Jr16Wyd4oEXKEwJPwX=p7HWLZTA63uNeu=13GYf+=Uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW7Jr16Wyd4oEXKEwJPwX=p7HWLZTA63uNeu=13GYf+=Uw@mail.gmail.com>

On Fri 2026-08-28 10:44:38, Song Liu wrote:
> On Fri, Aug 28, 2026 at 5:53 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > When a module is loaded, klp_module_coming() iterates over patches and
> > calls klp_init_object_loaded(). If initialization fails, it delegates
> > cleanup to klp_cleanup_module_patches_limited().
> >
> > However, the cleanup loop skips the failing patch. Each function called
> > in klp_init_object_loaded() is supposed to clean its own changes. This
> > works except for the changes done by klp_init_object_loaded().
> >
> > The current code is a bit messy. The changes done by
> > klp_init_object_loaded() should get cleared by klp_free_object_loaded().
> > But this function also clears obj->mod which is set by
> > klp_module_coming(). And relocations are cleared separately.
> >
> > Fix the situations by updating klp_free_object_loaded(). It should
> > revert all and only changes made by klp_init_object_loaded().
> > This requires some shuffling:
> >
> >  + Clear obj->mod explicitly in klp_cleanup_module_patches_limited()
> >    and do not rely on klp_free_object_loaded().
> >
> >  + Clear relocations in klp_free_object_loaded(). Remove the explicit
> >    call from klp_cleanup_module_patches_limited(). This requires
> >    adding the @patch parameter.
> >
> > Finally, call klp_free_object_loaded() in the error path in
> > klp_init_object_loaded().
> >
> > Reported-by: sashiko-bot@kernel.org
> > Closes: https://lore.kernel.org/r/20260823062313.1321B1F000E9@smtp.kernel.org
> > Signed-off-by: Petr Mladek <pmladek@suse.com>
> 
> Acked-by: Song Liu <song@kernel.org>
> 
> With one nitpick

> > --- a/kernel/livepatch/core.c
> > +++ b/kernel/livepatch/core.c
> > @@ -725,18 +725,20 @@ static void __klp_free_funcs(struct klp_object *obj, bool nops_only)
> >  }
> >
> >  /* Clean up when a patched object is unloaded */
> > -static void klp_free_object_loaded(struct klp_object *obj)
> > +static void klp_free_object_loaded(struct klp_patch *patch, struct klp_object *obj)
> 
> nit: Do we still need to fit every line in 80 characters? checkpatch.pl
> only enforce 100 characters these days.

I do not have strong opinion about it. My editor highlights characters
which are over the 80 lines limit so I automatically fix it. I haven't
found a courage to change it yet. And my eyes are getting worse over
the years so I use big fonts. 80 characters per line look good
on my monitor ;-)

Best Regards,
Petr
