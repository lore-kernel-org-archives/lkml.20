Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372843;
	b=0Qo7xvYXIK59w3bUJhJGpkvUk+KDfbvZ4nOgPPwBJtvZdRSgWknMd5v9+n0MqV7UQiyv
	 GvufQ4YsM/TNGLL428Z6YUOLj+K/5IOS1uw3h0wT637g+/ENUY4JByY828jK5gxsD5nJW
	 +BYo10FlV7WoOQ0h3He2yYH8R1eYWewhqxLqZ5qKrpmch28RoONUPZbqexTlo54SjChaV
	 kHSIvXd2U1zT1IWJWBu7sh47LAOcBntLLoAhVf4WdndtnyxP6/2TVy4ZFZNS8ECaPy84O
	 DaT5bIirbSdc2s48NCm0b7qo/e3jm8JM2eTgyXQCNVUAq7RPTOX3Z65cr0Wig3dEKNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YNL5gTzoS0SNcKXI362OG6Cyagd0/f8y/Be+hIpJbPg=;
	b=xn0iFvpBMsd5EwGFp2eyKgtMmgY75/n3BLlEVL5sS3WB2HAc1/eIYbwVt+rrX2guQrhH
	 pjEpIjtnL82LLDq3iALVn/e2DuoHK/5qP2AW2IeYsh9BCzT5fr3cQvmjUrlTA+vGrX50+
	 A1XlC09ojsj1+Q4BfaEVpk0MY2tvKjm44ywpnpGe5N4X4YIyKOYvphwqsxeJnKdftcHNF
	 WAEtYCydmLYNQ4U2fPNICmfYsejBVa0n0VBQbjfQEdwHI69yPCjHsr89VVfR+btXDK3au
	 EUJ2bL9d8tOCiafQ74RpfuudHdFQ1qftYIJ+0u/Buf1Bt4VoQuJPxGrVchs2nmowfAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWnnIDaF;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E642606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E642606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWnnIDaF
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so8639355e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793372841; x=1793977641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YNL5gTzoS0SNcKXI362OG6Cyagd0/f8y/Be+hIpJbPg=;
        b=uWnnIDaFZDr4pqzEYcHVHDAqr85/92Q2My9fXNCJD+rkJgIdgpI1tq1Nsu/ad8rMv1
         +RWezfm2jh3eMuFkIfsmUhO1gyAqms4M0rNFpMVk2SIZgx66VY2GDIayj0MDbNPZoCQj
         P0CxcqVstEmDxE8O16N5QIJkpPdcPsFJ/MGp6i3sqw15OksJS9Ox2+geN8KZJuvA53ed
         NhD+8PloOM+6WV43JiFyt+cdUB8pC1HWVKszqyu7EQ+Dw+hClQ9Jtnh8sho7HITeY2Mv
         GPTARz0x64NBro0lE7klgoIWeExmR78Ni5nKXKZLufumNznEsjPgq9U1YNuLr5BhMcDv
         gHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372841; x=1793977641;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNL5gTzoS0SNcKXI362OG6Cyagd0/f8y/Be+hIpJbPg=;
        b=g7xI5sKyBKbmH7+gMeg7/IlnYVOq5mLh1wI4DF2ZQHdCf1gUCTIx62CIkyJd+pQALB
         v9YMfJ/5U/OuOTdOiBniIWf9aYaEvxXQv7A7MJ71DvlypyPEwVCyhPgkDLc7AEfz+AUw
         EaBW6g+sCs6VI16T8IqElOzyyaZ6Ai+6482CNOq33h4tQFz/bf6n6C4ncl//35H0XAN8
         y2gCIYeM8pUB2G045ohLnXujFaPpd/rkclzbUJRZyq2K7WuWbcWcMahRmHQ3f8e/REX3
         Mr2FMkZ3Esjpeb4/VMR453sdZNZDftlSUur2/WvHHpBvy0jSAGFE15Yl7kV1gcrWWEfH
         yD6Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+vXCfSMaLNF9aHKdKk7VouFnFmOHVvcAXKydRVn9EXD26F/JJMQpfgyiAqGGGhAt/JlaNWsPHRu54TGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ29krNZ5e2ZGIu93Jiq7AmYxMWQh56cBfG6BPgy6kIa20tqqxT
	kaRDyM35zgGtcAdrq9DnKXf+Aogk81H8O8gX0sQ9RdqfoW8uUAjn3kgS
X-Gm-Gg: AYBFou3M7AOFuB5mRe3P5gvuSCmDl9fayw9mdU6Y4nhh8dzCIyhwIN+kmjBZ14g3oi0
	TYsHPIanrQw8Y0q9A9Est6Us1UCLaN3r6NiXaB3BcRmwK5dqp+O+fC36y5KANZL+6R+XeclibPb
	gt1AWST8jjqlrEJhJuE7viwdK1fLsmnIMpfpeW9b9Q9N4rAcPjM19BLjuaAtvegiHx19lhePhP3
	EOEk/pS1uJxf/JMNxeDCoPkcp9tax1rCdpHZH/WYyDjBnIax13GSUO5RGFgGh8iFtwOA7u1igyn
	EXnm+HkeMTT1ZbC7IURpZd7SpFw9QOMvWIbR6viLbqY2JoHvCa2trr3aZf1ADRxuZgYzYq/E96c
	U3pL84V8hLffWlrdJ16kY7Hc7je3xKv2Al+VA+02wH7Bgvye0xX9EWt17f/Y2+BdcMDeg+FOuO0
	EJOibt5GGPh4Yr7I3Ma2jYvK1JHgOjWYo/1FAg8DeM4z127QpGQ6+fuUNNVgOAlMmxbhR+DZQfE
	vBQqMwiCCZBePlsRTzwzL8oaoTiW5OdOzpuA7LVi09Srr/1CgnZtvP4d33BUqp3YRIwIoiw4Pzc
	I84rFB89Xq6ObgT9zciImtk8ztY9SDcYqOuN5s1Y8qxLj5/U0Jc420okkQ+omu8qoQ==
X-Received: by 2002:a05:600c:4e8c:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4ac1793ff26mr57275105e9.15.1793372840727;
        Fri, 30 Oct 2026 08:07:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aab10sm64599465e9.9.2026.10.30.08.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:07:18 -0700 (PDT)
Date: Fri, 30 Oct 2026 15:07:17 +0000
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
Message-ID: <20261030150717.094d8a35@pumpkin>
In-Reply-To: <auNes2b11NqUey3C@pathway>
References: <20261012-dd-cmap-part2-clean-v12-0-3c8cc5725def@gmail.com>
	<20261012-dd-cmap-part2-clean-v12-33-3c8cc5725def@gmail.com>
	<as4W9hToBqAvbzJ-@pathway.suse.cz>
	<20261027132253.5f3a461d@pumpkin>
	<auNes2b11NqUey3C@pathway>
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

On Thu, 29 Oct 2026 15:56:51 +0100
Petr Mladek <pmladek@suse.com> wrote:

> On Tue 2026-10-27 13:22:53, David Laight wrote:
> > On Tue, 13 Oct 2026 13:33:10 +0200
> > Petr Mladek <pmladek@suse.com> wrote:
> >  =20
> > > On Mon 2026-10-12 20:37:04, Jim Cromie via B4 Relay wrote: =20
> > > > From: Philipp Hahn <phahn-oss@avm.de>
> > > >=20
> > > > pr_fmt can be used to add a common prefix to any output from a modu=
le:
> > > > 	#define pr_fmt(fmt) KBUILD_MODNAME ".%s " fmt, __func__
> > > >=20
> > > > But adding additional arguments breaks dynamic debug:   =20
> > > > > error: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" passed 4 argumen=
ts, but takes just 3
> > > > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > > > |                                                  ^
> > > > > note: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" defined here
> > > > > | #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)      =
 \
> > > > > |
> > > > > error: =E2=80=98DEFINE_DYNAMIC_DEBUG_METADATA_CLS=E2=80=99 undecl=
ared (first use in this function)
> > > > > |         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_=
DFLT, fmt)
> > > > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   =20
> > >=20
> > > I wonder what this error about undeclared macro means.
> > >  =20
> > > > > note: in expansion of macro =E2=80=98DEFINE_DYNAMIC_DEBUG_METADAT=
A=E2=80=99
> > > > > |         DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));=
         \
> > > > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > note: in expansion of macro =E2=80=98pr_debug_ratelimited=E2=80=99
> > > > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > > > |         ^~~~~~~~~~~~~~~~~~~~   =20
> > > >=20
> > > > Add an additional ', ...' to DEFINE_DYNAMIC_DEBUG_METADATA_CLS to s=
lurp
> > > > any additional argument, which `pr_fmt` might add.
> > > >=20
> > > > --- a/include/linux/dynamic_debug.h
> > > > +++ b/include/linux/dynamic_debug.h
> > > > @@ -351,7 +351,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descri=
ptor,
> > > >  		dump_stack();					\
> > > >  }
> > > > =20
> > > > -#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)	\
> > > > +#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)	\
> > > >  	static struct _ddebug  __aligned(8)			\
> > > >  	__section("__dyndbg_descs") name =3D {			\
> > > >  		.modname =3D KBUILD_MODNAME,			\
> > > > diff --git a/include/linux/printk.h b/include/linux/printk.h
> > > > index f594c1266bfd..5d701952e739 100644
> > > > --- a/include/linux/printk.h
> > > > +++ b/include/linux/printk.h
> > > > @@ -742,7 +742,7 @@ do {									\
> > > >  	static DEFINE_RATELIMIT_STATE(_rs,				\
> > > >  				      DEFAULT_RATELIMIT_INTERVAL,	\
> > > >  				      DEFAULT_RATELIMIT_BURST);		\
> > > > -	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));		\
> > > > +	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);		\   =20
> > >=20
> > > IMHO, this changes the existing behavior. The prefix added by
> > > pr_fmt() will no longer be stored in DEFINE_DYNAMIC_DEBUG_METADATA().
> > > Is this intentional, please?
> > >=20
> > > Anyway, if we do not longer pass pr_fmt(fmt) then we should not
> > > need to add "..." into DEFINE_DYNAMIC_DEBUG_METADATA_CLS().
> > >=20
> > > By other words, we newly pass just the format "fmt" without the param=
etes.
> > > The 4th parameter was added by pr_fmt().
> > >=20
> > >=20
> > > IMHO, the right solution is to keep pr_fmt(fmt) here and extend both
> > > BEFINE_DYNAMIC_DEBUG_METADATA() and
> > > DEFINE_DYNAMIC_DEBUG_METADATA_CLS()
> > > to accept var args. I would expect something like:
> > >=20
> > > #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)	\
> > > ...
> > >=20
> > > #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)		\
> > > 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt, ##=
__VA_ARGS__)
> > >=20
> > >=20
> > > or maybe, we could "eat" the extra parameters in
> > > DEFINE_DYNAMIC_DEBUG_METADATA. It would mean to keep
> > > DEFINE_DYNAMIC_DEBUG_METADATA_CLS() as is and just add the "..." into
> > > DEFINE_DYNAMIC_DEBUG_METADATA(), aka
> > >=20
> > > #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)		\
> > > 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt)
> > >=20
> > >=20
> > > Or do I miss something, please? =20
> >=20
> > Don't think that will work.
> > Won't you end up with ".%s" fmt as the string without the extra argumen=
t.
> > So you need to keep the expansion of pr_fmt() together until is is fina=
lly
> > substituted into a printf-like call.
> > It is possible to enclose it in () so it is passed as one parameter and
> > remove them on the final expansion. =20
>=20
> My understanding was that the format is stored in the metadata as is.
> I mean that the string is not formatted in this code path. So that
> the parameter values are or can be ignored. We just need to make
> the compiler happy.
>=20
> But I might miss something.

If it is formatted in any code path you need any argument added by pr_fmt()
otherwise the values printed wont match the format.
Indeed, in some cases, the format has to be formatted in the same code path
(or at least scanned for anything passed by reference) to avoid accessing
stale data.

I've definitely used:
#define pt_fmt(fmt) "driver serial %s:" fmt, foo->serial
which relies on all call sites having a local variable foo of the correct
type. There may be some in the main kernel tree.

Maybe I'm missing something.

David

>=20
> Best Regards,
> Petr
>=20

