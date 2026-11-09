Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794263409;
	b=uyJrQWkAZZY9uDXM8OV+CWRZwK4UNbR/srZwIlVvGepAH+3WOvaGZi//pOw9bGjLCkwq
	 ipLb32DYu4L+vIrGB1cdtp4eOxhgEUfhWOo7vb44tu0Ba1D5NhdIwI/Nm4jClgC3j4Els
	 YAdsbNLKRw+ZRwZS1APUIir1CIUl3ir0PLefMOmzBKNZVwtvdAplg4bfqdZlq8QaC69a+
	 NVR1FqEaAEAkQiwaOx/sVUxN5rddX8I+fpKS/O0v4GMB9AbRDl2rO9PeQlhJx2ifNTLwe
	 ZS91zn/SVXik31HNsKUUCMIRtgx7aC5/GVRwtsfN9l50IsqkR8ile7zikh+c8xkARpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
	b=ikhJhBLMuUHZdX8vzSJEajurZgef48A2RzIu//scjEegotaoVRMkAtrvK6S5cEiLZZPZ
	 ZIGyPA2OPe3IAs00mwU1gxaMj0Kki1sp58VT4VxC3/TQDVaKfT/UWllW2oFsbt5kTP8Z+
	 3jsjP8Zv+6L4l9KoNWy1Z2QaSWJIYWsKG4ypFHSZe9dbPwRsn9n0awI05R1w9XZSx26tZ
	 QhLWxDnwWOflCLaYTsHAQBTEEvkOBIK+lp2vmf3JXrw0FDnKXVBZxGsldlhR0iDYtLpBH
	 2DeMt4EVbrSKiZnfj/R/Hq2/W6FgLLe9y4s412xMFk6BQcRPiQHs8nlDu2RtcBNdO2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bc6ecKnX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B42606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B42606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bc6ecKnX
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533202fe429so33361cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794263408; cv=none;
        d=google.com; s=arc-20260327;
        b=DVCQ+4EEN9mbMikxK4F/BJPgjpkkf/Gw4lfLlSAuH3M5aeffIxXUyFGVUORFFlz7nw
         Poid3rYlDr2CSRN0+nkEQ28iFKEZWFVzem1f6aXyxpYzMfzX4DYwIAGn3PQ9UJH+vFPR
         2HO0cKF7qYL66ejMBMphkXUBDu95Ue8DIfZzbVuD2c3CjFLQZvK8J3S9F/n/iedf9JLz
         /kTN3Idn5LgUgt0OkxaKcwWgw2VrFXtdSQEMXOeI5/9vLkX1ttvmVzox5yaf2GgZxgrs
         G438EQTsVQ7PYZQlLctiyloYQXhEWLNsV4QGlCBJEjtoB9kMIizutJxoV/fgRNq1QUJO
         pMcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        fh=+he5gF8Tc9wbNrDywy2dQQOcibjUVrNJb1rSAD40UpI=;
        b=qtTnveSPW1CZtdqt14OOvPwxrFIukYBpbtuOoMz7fBoyXWd1GrFsoAghorqgJGB2Vl
         Algwnv2dHsndmeE8OiKhGwlnpTaHjbrOr1NZ9pN6W99ssVXTOoxSFStOHVr4SRosd10v
         ugSBYFeo+IomPHlpsCubo5XTOfvAD/VN9kFKGWVuX9bhT8pcVMBp0ajqJfwgdARrZJVL
         HAb8mv9leA7Mpiya2O932jJPnvEF7YsuT6mS3jAtTVEMw3kyE0/N7RRfSD9VKWWb8TsP
         YXqmFtFeqt9Lg8KXwCpCU214101ExwJp2uSUp/KDkC+DMXRBN8sQu6vhlc48uk6ITSld
         H5RQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794263408; x=1794868208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        b=bc6ecKnXzqp5zahKN5US+W/GLFNu9bOCxLTorv75CdL/TyOgB/Qh6QFUi86M3M/XI3
         3gbxOXuAYS2+xcjqU4SLj5C27dCKM/SCCgBGdSbxDV00eICb4MzgEjo9vjECQ1QTCTmr
         MgCtojiqIWlVyB6AunwAs2qSQJP0tUdJsdT71C1y4WilJg+rQa++O5B+9FpAikzFpyGD
         TU94u5aUZCMHCz2bEPFushfsTW1bpin21NCA0WBKSF7omxyVw4eI3lnqeaGfI4JhzN5X
         ZQZwi7mBvwRBGIVH1EKWZ2xsmVHzuYxoBrVKANockiyw6pDDJKKlw7J5nTOQpM4hDjUm
         KR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794263408; x=1794868208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        b=NYT5fpXp+XYfmDBpyahtjOnzHAstRWXNQ7t2W86y4yOyp8BxPCrJ7CSGjx2n3K+dPT
         SPocCCZ59q+NdKA700We74TslhHm3YRQG0QOcvRQ00iGRTB0ILMTvaHf+NemSYk1QedS
         VdAjtEoTg+XPLxKHlO+QzTyOuTH/L/X8hr4tGnp8AjmY7CxHovXK49weOVYF+SHsI67b
         jlLCrqgnV/OIiw17SQzNHUEEJDOlZyDn8spZSWfE6D8SvUQzlV09WkBKQ8+uGSOZu1ts
         tXE3qpMK+V8nFA4eDfZGJNH+dV5o6e2GDDVrEve71WnR+IrTlZhEOb3SN72eihJOnsln
         Vc0w==
X-Forwarded-Encrypted: i=1; AL+hErEiJDxMDHit7speI3D7pLHTPCy27pq47ZAvQG/Vs7DXoDPSPJWdZkkh8GKB04u4EWlw2jLB3PlcXvp+lLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HxOUhdZB3Q5Rttq2AvDE7kuIsmdToRuqWI2RXPVmaNIsPxgze
	uZ9Tp6Tkqruy4ou8a9vXGN0snimQ1L6TZI0FufDyWzyBurHOVP8KwGNKUTe3dK19Cu22lO6V94r
	4o1KydchUt1tWDsAYQzW5uiKaJpe4jjV0Ar0nJKAl
X-Gm-Gg: AYBFou319tqZAQ8+MOIOKdOIguvBE262GzQTnTxxHBnr8uQSYu9yKfFqW4ol2PFyaZI
	rtpsT+OGYEc6683S6ieLozwRIS3jv+XZcrFAdrfFNcFQJyon6KgsemlK6mN9wXL0VzfZXHGVM5i
	jOjDaI9/hQ3+D1S9GL9evyYAX08hT55zlleCYmyHUIU5W8gAFGnH7r30El2ToSpz79THeY9xpLF
	vssgj8c5nWmGymLymaFUyflWxzmmg4NcFPQ64FFTvHbwOo6nOX9Tln6yhEH/h9xV8sCqtswPM7T
	RlLQpKr+9CyBcJ/C+6G2WdlwXkve0IkebMKNvHdNbFYBL6Fjah22POK7NUYOwaxOTrk7aeib4tp
	6AwKKe/rHJIos0t1vc/ip97Dl+kPCxD68UMgMa8t438dr9uCUQAPgp0X010O6tvpIOmE=
X-Received: by 2002:a05:622a:1b16:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-555290bb288mr6464421cf.0.1794263407457; Mon, 09 Nov 2026
 14:30:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-7-irogers@google.com>
 <b8d171de-52fe-474e-96db-d119840c6240@suse.com>
In-Reply-To: <b8d171de-52fe-474e-96db-d119840c6240@suse.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Nov 2026 14:29:55 -0800
X-Gm-Features: AclHuK-dlWDp0B4FdK6V9QBR5LM_sA67_T-19O3ovPwDJ5RdBpzojQ18ICzxF_E
Message-ID: <CAP-5=fXd640kfaR+soPdiEV2mfqCPGDANCt04KzaXBphYP4Htg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
To: Juergen Gross <jgross@suse.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 10:56=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> On 08.11.26 23:39, Ian Rogers wrote:
> > hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
> > with kobject_create_and_add() (which allocates a dynamic kobject using
> > dynamic_kobj_ktype), and hypervisor_subsys_init() in
> > drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype wit=
h
> > &hyp_sysfs_kobj_type, which had no .release callback.
> >
> > Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
> > kobject release behavior.
> >
> > Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >   drivers/xen/sys-hypervisor.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.=
c
> > index 91923242a5ae..0e8a2cd69fd6 100644
> > --- a/drivers/xen/sys-hypervisor.c
> > +++ b/drivers/xen/sys-hypervisor.c
> > @@ -659,7 +659,13 @@ static const struct sysfs_ops hyp_sysfs_ops =3D {
> >       .store =3D hyp_sysfs_store,
> >   };
> >
> > +static void hyp_sysfs_release(struct kobject *kobj)
> > +{
> > +     kfree(kobj);
> > +}
> > +
> >   static const struct kobj_type hyp_sysfs_kobj_type =3D {
> > +     .release =3D hyp_sysfs_release,
> >       .sysfs_ops =3D &hyp_sysfs_ops,
> >   };
> >
>
> Wouldn't it make sense to have a common function for just kfree(kobj)?
>
> In your series there are 3 instances of .release just doing kfree(kobj).
>
> In case this is not wanted or with using the suggested common .release
> helper you can add my
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks Juergen!

lib/kobject.c already has a static dynamic_kobj_release() that does
this (and there are ~15 other places in the tree open-coding a static
kfree(kobj) release wrapper), so include/linux/kobject.h +
lib/kobject.c would be the natural home if we exported one.

I kept them as local static functions here for two reasons:

1. Patches 2/9, 3/9, and 6/9 carry Fixes: tags, and keeping the small
   local callbacks avoids a dependency on a new driver-core export for
   backports.
2. Since kobjects are normally embedded in a larger struct and freed via
   container_of(), I wasn't sure whether Greg and Danilo would view an
   exported kfree(kobj) release helper (especially alongside
   __must_init) as an invitation for misuse on embedded kobjects.

Unless Greg or Danilo would like dynamic_kobj_release() (or similar)
exported now, I'll plan to keep the local callbacks for this series
and can send a follow-up cleanup for the tree-wide callers if
driver-core maintainers think a shared helper makes sense.

Thanks,
Ian

>
>
> Juergen
