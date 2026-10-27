Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107381;
	b=aoVdV5oI7ekqUmALJSntwAkAbSK+engKLoQB/R3YthoIaWPDo7m6eog8hf9PX8PDBNSR
	 Mkk0EoMeBF4stsZk1+XcsNJgwYf+wVXgGCpv7ScUIMuTYxxXJ/cT8vZSnZTEJKqNGtvxH
	 gS90IND5CesWfE4LjgaUxwvDCr9XELDbYTVb8KA9cBnOQKQ2S4x6Qys29vu1W5Nr6IO8p
	 bEHsNYzt0bpmQ7aKMa3IxZOTZp9j8klFBuJiTDAS1jGhG8wOhPRtKIc2rMM8i/SUPnkXu
	 9Uo5NezaQ+mkmHg1YsoVIS1ppwg/IfyO+Flkwk80dVsShp5SahCOLbXkx4ykkMcSpPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bt8+RMZDmd6s3sr6pjCs6SFKWlDJZBaHmutX4rG7P/I=;
	b=Yr2K1VD1ptbyNPkc2K91n40TnQOp9VuDc3QBvQWqr2W0D8LEBW3431jr/HkDuJx4A+0+
	 4mdCeCmsmFkDo5NuPr8oF0o8kbSaWWsArkL9o6x3iZkjkO/PuR9b/mdclrzDM9/+EPylg
	 34Hpw5WErPkztI1KBaePhI3edzuAPLHOqsOQeMxSeNu/YC6GzfhKCgbfLrJE66wa0czuw
	 Cdx/RIBOXJtrrVtb6zLEm1X3WT3l1qZOXxXyPDWJr2wljCYpw62/77aLM/EbRrQ8k5Z/P
	 gW8UpecynFm8QaG9CPn4+GBHb3s9pNdvCneJsueMP83xnX52JPvzK1g7TIbQJGdtsnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D9I2Gz1I;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE20606A338
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE20606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D9I2Gz1I
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e47347279so1868072f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793107379; x=1793712179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bt8+RMZDmd6s3sr6pjCs6SFKWlDJZBaHmutX4rG7P/I=;
        b=D9I2Gz1I6TohXPedOvNnB4ot89+HPLVnTkGptL1nmvPR4Ebd0vQn2mx7tGT4eB0wit
         W+dL+ixtQthAPpXmXGw+in0Ctz2kcsbC7kvOahclFSp3KfkjUGqV3ABxYzaD+KwrlTD4
         BeGIYXqQXlyJOjpqkE4+SfEnC7QOcgIF3nBUyOkghRDfERqmQA81j0Cf9h1GY+YVjcQT
         pmi0J//7BiN8/L+QE6jbor1n6tDO9QgrBax8oRoYgFG5p1K5OAkUDsAmLXxsJOJH/haN
         VJR4dII5YeaaxYhDUvgLePp4t+Vaoq38Df1PdbOvbABf7w3llPt9EfabyodDQesC4ZgT
         wM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107379; x=1793712179;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bt8+RMZDmd6s3sr6pjCs6SFKWlDJZBaHmutX4rG7P/I=;
        b=voNiaQooPPZTilETW/SWA1GsEgYVGfQN/t5WZ+dOc0YMWtSBaDHhT1/Nq8UiQ5ubDq
         ADU7VYNy5Qw1G/bDntnV5theW9Rlt76u/ZZwzjDDX+zVOaamUzD4rWpU7CpiQn2wF6kH
         lqlcL088pTHOmcVA25apaH5IV9OaV08d2fj8kN3Wm3sNWJfX6ZudwKVCDD8kAg8d+vuu
         gUVmWOmDtKMVtKFwc8OXzhPtn7/T2WlcGq4FiUemMU0ECfkKzVZ4KqPKJX4H0JgNzIcg
         aro01O5uwVQmP71LjKmizU035Sts9Lg5OSOyhmg2HOCPiXHTWTlwitUcFLzbGw9S+bt/
         C8pw==
X-Forwarded-Encrypted: i=1; AKwUvBw9vA0XsEQ9m3IReCHWlPx6AusZqwoiSzNPuGLMI6M0cLwoi6LQPOerXckGP9wuwT0ElWPjl7DW/W121mc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7X+xB01U90OpKfGyuIkAfc6r3qIJLNMCAfdqnUUylZvAc+kjx
	2pypGTsgbmnqvemM9JtsQ5wJLMnq16NkzZ2NfhC22A35Se9MMGZjkO9w
X-Gm-Gg: AYBFou0AL7cKwSH1sVnkTXgPPbInEGFfqbzKUum8h3YVcFT5JOGMoGSa+TQUpErQSNV
	S4Ru0OrqcOy8pnThWF9fP8h2TsjBxI1N9UXBuebQauiaxxnvHTPERWNe6NLvyRrebWFLvTNOfK/
	nj4VFNdkBIvjF4wWiwhlrmC+CzAeJTUgf/PxgrdqKEQIuIzMXp9sIGYXNGU8u9XzXRS4AoQkrs2
	PTTMijwpEF6Dru5zsRgVcm1gGNdxV5uIFLZGIE7ItVAlnOXjYg/FBTHdBK6SUR3j9qqEPdTnvgW
	hSw/ovyhPcthFbY+v/HwpOdCCb0tGuRHjHZR3brM24zOSnrUQXsHH0x7G0ebzv+4QCYcgJ5bvQ4
	VwuAY620SJU3I/Dw0lEhe1AucMeBidAUy7WD+OaXMEe3WMKRssmJUCw27pUG1dE2NCXI58Y8DIt
	9kse3itLgBxwvr8NHKwQO5RF2q6EBf5bc7JgqBIfyeeLh3LcVHYw/2WkaET5nUH3iw0KqllWBPz
	orcYeoiSMctLZEOH7UqcYO+m+bhckQ8zVlKOQqJJWlIrlgcvfAq0pzY2Hxb4GYUf94nbRVmM/KV
	+eCkD9n7SBzDxxyKm9YqYtPGqLFbPLWPmwOvWQ==
X-Received: by 2002:a05:6000:2388:b0:48c:7386:af18 with SMTP id ffacd0b85a97d-48e3eb2cf0fmr19717600f8f.8.1793107378393;
        Tue, 27 Oct 2026 06:22:58 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm23819954f8f.11.2026.10.27.06.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:22:56 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:22:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: jim.cromie@gmail.com, Jason Baron <jbaron@akamai.com>, Shuah Khan
 <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Arnd Bergmann
 <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
 <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, Jonathan
 Corbet <corbet@net.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org, Philipp Hahn
 <phahn-oss@avm.de>
Subject: Re: [PATCH v12 33/40] dyndbg: Ignore additional arguments from
 pr_fmt
Message-ID: <20261027132253.5f3a461d@pumpkin>
In-Reply-To: <as4W9hToBqAvbzJ-@pathway.suse.cz>
References: <20261012-dd-cmap-part2-clean-v12-0-3c8cc5725def@gmail.com>
	<20261012-dd-cmap-part2-clean-v12-33-3c8cc5725def@gmail.com>
	<as4W9hToBqAvbzJ-@pathway.suse.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Oct 2026 13:33:10 +0200
Petr Mladek <pmladek@suse.com> wrote:

> On Mon 2026-10-12 20:37:04, Jim Cromie via B4 Relay wrote:
> > From: Philipp Hahn <phahn-oss@avm.de>
> >=20
> > pr_fmt can be used to add a common prefix to any output from a module:
> > 	#define pr_fmt(fmt) KBUILD_MODNAME ".%s " fmt, __func__
> >=20
> > But adding additional arguments breaks dynamic debug: =20
> > > error: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" passed 4 arguments, =
but takes just 3
> > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > |                                                  ^
> > > note: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" defined here
> > > | #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)       \
> > > |
> > > error: =E2=80=98DEFINE_DYNAMIC_DEBUG_METADATA_CLS=E2=80=99 undeclared=
 (first use in this function)
> > > |         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT=
, fmt)
> > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ =20
>=20
> I wonder what this error about undeclared macro means.
>=20
> > > note: in expansion of macro =E2=80=98DEFINE_DYNAMIC_DEBUG_METADATA=E2=
=80=99
> > > |         DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));    =
     \
> > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > note: in expansion of macro =E2=80=98pr_debug_ratelimited=E2=80=99
> > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > |         ^~~~~~~~~~~~~~~~~~~~ =20
> >=20
> > Add an additional ', ...' to DEFINE_DYNAMIC_DEBUG_METADATA_CLS to slurp
> > any additional argument, which `pr_fmt` might add.
> >=20
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -351,7 +351,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
> >  		dump_stack();					\
> >  }
> > =20
> > -#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)	\
> > +#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)	\
> >  	static struct _ddebug  __aligned(8)			\
> >  	__section("__dyndbg_descs") name =3D {			\
> >  		.modname =3D KBUILD_MODNAME,			\
> > diff --git a/include/linux/printk.h b/include/linux/printk.h
> > index f594c1266bfd..5d701952e739 100644
> > --- a/include/linux/printk.h
> > +++ b/include/linux/printk.h
> > @@ -742,7 +742,7 @@ do {									\
> >  	static DEFINE_RATELIMIT_STATE(_rs,				\
> >  				      DEFAULT_RATELIMIT_INTERVAL,	\
> >  				      DEFAULT_RATELIMIT_BURST);		\
> > -	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));		\
> > +	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);		\ =20
>=20
> IMHO, this changes the existing behavior. The prefix added by
> pr_fmt() will no longer be stored in DEFINE_DYNAMIC_DEBUG_METADATA().
> Is this intentional, please?
>=20
> Anyway, if we do not longer pass pr_fmt(fmt) then we should not
> need to add "..." into DEFINE_DYNAMIC_DEBUG_METADATA_CLS().
>=20
> By other words, we newly pass just the format "fmt" without the parametes.
> The 4th parameter was added by pr_fmt().
>=20
>=20
> IMHO, the right solution is to keep pr_fmt(fmt) here and extend both
> BEFINE_DYNAMIC_DEBUG_METADATA() and
> DEFINE_DYNAMIC_DEBUG_METADATA_CLS()
> to accept var args. I would expect something like:
>=20
> #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)	\
> ...
>=20
> #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)		\
> 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt, ##__VA=
_ARGS__)
>=20
>=20
> or maybe, we could "eat" the extra parameters in
> DEFINE_DYNAMIC_DEBUG_METADATA. It would mean to keep
> DEFINE_DYNAMIC_DEBUG_METADATA_CLS() as is and just add the "..." into
> DEFINE_DYNAMIC_DEBUG_METADATA(), aka
>=20
> #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)		\
> 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt)
>=20
>=20
> Or do I miss something, please?

Don't think that will work.
Won't you end up with ".%s" fmt as the string without the extra argument.
So you need to keep the expansion of pr_fmt() together until is is finally
substituted into a printf-like call.
It is possible to enclose it in () so it is passed as one parameter and
remove them on the final expansion.

David

>=20
> It is possible that the macros work another way. Or this depends
> on another change. I checked only this patch...
>=20
> Best Regards,
> Petr
>=20
> PS: I was curious what Sashiko says about this change and it seems
>     that it does not review this patchset from some reasons.
>=20
> >  	if (DYNAMIC_DEBUG_BRANCH(descriptor) &&				\
> >  	    __ratelimit(&_rs))						\
> >  		__dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS__);	\ =20
>=20

