Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948E13C1F57
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175447; cv=pass; b=k4xS27DfeplUdqIyCcS3c+dbihD2tfexmSEsYzqAYllmSx3Qpbxk/Y/LU62fWx2Klq6w74FiURNdWlirJqSDrN1H9PIh2ETFVa6XUprIhst0dUxozwAwrBTkCr8TfvfegAZQOBfFltuNjvPVMwDmzi5Sdkx2wEZU2r/725H0KLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175447; c=relaxed/simple;
	bh=C9vgZ5OpqoqCmfcKT8JCoWSmu766g0cDfXH9A/VZNa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TB9G7HhpPe06YfvsXO7H4kqmOzPhUa31n7fstf8I8G8sqE3ia+k4CUCow/qVwQndXiVdj4MWyO3otBe2H2JP5o8vndpOnk4AWF8JJ4fbeGaqd9UV6wsc0LvxSG8H6wwvbsvRyy8hDWZlZKjtpoVtJcr3QCPPOBb0yMiST2gTiu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E93YYZVT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eJyhUWgt; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E93YYZVT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eJyhUWgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788175444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GynAiyqKaF7zNIjy+JX3ryfv5HnQb4XBD3qIOpzfei0=;
	b=E93YYZVTZd8tdwkJfh8MLIEY0MqShSQopLUl3dA5cLJTAOZO6dwOz/9OR7EVlnV1r+BWMd
	4cVPmVQuvRqrdN8/jNIDgE1oaka+oSlSALDzob89rq9WXoiCaX0KgU2Rliye2Sin3Wt2TS
	twW4hP3LNx3wEN1RogpLrA9jYbQLn1o=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-J69aqe9YNciptabMSJeDJA-1; Mon, 31 Aug 2026 07:24:03 -0400
X-MC-Unique: J69aqe9YNciptabMSJeDJA-1
X-Mimecast-MFC-AGG-ID: J69aqe9YNciptabMSJeDJA_1788175442
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-836cfd56077so49166557b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788175442; cv=none;
        d=google.com; s=arc-20260327;
        b=UMZhlhlhr/VBWb1xRSGYXmEWrkH5SomiIFOlgBllgjNrsxhMhvsRq0xZC+6nNPD4jq
         0ksfUaEl2l6yRm2NCV5Un1xO0h+6C6jWSeiNCtExZ0qU7mz8U0l2WcrmuBIshnUZ9QOI
         n5LkmweqSI8s6WnFZ8g4y5G0Is2NvoHhpd8YUaz7dQnzGcgYwgXP2785nDL6qsQvOvju
         m2r0VsXMC0xEi80tp08YraxY3ND/II+jJYjx/xCiq3fDt8RYk37W5lvZyJ62wuZAICe6
         44rRpeYgdCxrv27qt5pLD0WLKhbr/NV2xj8BMMQaDvhwWu9b7SGFxxxyd08UaNy/+1Uo
         oU3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GynAiyqKaF7zNIjy+JX3ryfv5HnQb4XBD3qIOpzfei0=;
        fh=nybNdj0cLKBcmlezfKuW1oQxbauI7Rtd3xVtYdwCOFM=;
        b=eWpBvTTKf0pjo3nzI9zH3OWTYOpRbNEZVPl6yVGvuJzqrD+YSGQ2IRB6SkKMxzd4E+
         g4pnhq+fxuqrb5c4ZdbWFf86qZw0Z1diRYMhskkcul5nwifeS40g+Oquv6BI97vV8CQV
         YWrrpnglFQH+txdN7uhMJZcqauMKyJJ7+OlBvr2aAgzHnjY0aQhw/T7lxfApU+aBZrzL
         ftlhxMCLGLTpnWNN33zpCdewAYXB9WgndAQ6b0snO0sE4GTJ46Hksf5p2OBIWl2GDpVp
         LXIURTcXda97xysrH2PI+Kl89CESpO1KG6rFKW2iUt1J3nV/mqpE404Wyg+PK3Q1khDr
         9EPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788175442; x=1788780242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GynAiyqKaF7zNIjy+JX3ryfv5HnQb4XBD3qIOpzfei0=;
        b=eJyhUWgtKANGVUW4zMaluleGLmwM3cyd50f70DCIj5dfPFjbYnnuDyoMEhdRVd5XvP
         EU3k/0lEwdIh40wxAi1MbeNH6LErrWtsxJ0Ee+Yn8cN2pDkzWqcdj7YyOhbJmOCIl/Mj
         X7pEAR5tuoA1ocxqFUGd8zmw+CO1XcHAVkuLb/1UNimubyyIANP7wBCO0RTq85Nq0KYP
         aAO1xBSGVLVKz65tYGIP2+PFkM6sxqFgNNjuc7LBDT9IkRIj/SlNlr6oVY/B2rbJ1nDN
         6bkz4liuOBf546AARaIYMRPlHUSxTQxC0zHpnQmnR94F/WEzOzwSocAflXfvHgETG8Qa
         KUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788175442; x=1788780242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GynAiyqKaF7zNIjy+JX3ryfv5HnQb4XBD3qIOpzfei0=;
        b=nzm9zv9pUfA0vzvx+d6094mI+bi15qG/zMcueWnKEwfHc2Y7QeWRbW/BLv8q4WmzBT
         P9kCshHtce4RsWzxFt7SPDWosTMXcu52kTolkRTprztn7kE+eNjDIjQJRbIgf3Nr1Wzr
         8k+BbnFABEW8mdlDg1YTcLKyWe5Vrs0sQ1dZCtXDQfUnVI4+V4X0EJLsMe18xP0EXwFy
         CWrOla+MdZvIuK5FEv543gMe+SbfXpJrT9fSqnnlVqx7R/90Rhj4XCVvC6Bc5HMTnQq1
         gNkn+oBibiun7LMFT4XFVKewiJT3R8o7cxISEOpew5Bl9qvj977GfrGp4kar88JiC4N3
         OgNg==
X-Forwarded-Encrypted: i=1; AKwUvBw1k946ICAGVeoqwZXncy3OmO3k/Pb/Ew1CHL5aWx15IaryAM25WNpTaivAX46+nHyoVKt60+4Ag3r98B8=@vger.kernel.org
X-Gm-Message-State: AFuF++kHKxz+Caet5dFp4nSAEyou2sa0e4vbDYJgXRDSg1w3e3dQFSry
	Qt1riZniYkfVNljQCGkdpvSS7ai9BkZDLgc4xZb/5ZT8FHwCyim96CU4ptHCBxPzAw0rrXIRq+h
	h2XT8vAgfWVn1OIytxNbKWV745ICZM/IskIVrDWFrulftKnXkwTS8LYbYnXvqsJzlroiOB87yjq
	DfFpG4Ric8meWC/7lCj+7fkewxKS0GyVhFWHeQrSao
X-Gm-Gg: AYBFou0HJMoKX0kPVdqC8eMTTMiqGaQtlrAnRfKRq0O8+bce6w3HcSd6pcZif+CCvBm
	s76B+F84JHPnQWhY+i6/hIX1QR8vFQpSIpmN4uowtwiLXbvDNhxe/xc7wLyP5c11IebR/RHzgR0
	4Tn4+3q9J1gDtFyiNfXEtv4AL6SbzgUw/jQtQkIX6S1cJoeTOeWDGcFJI=
X-Received: by 2002:a05:690c:e3e6:b0:81e:6a10:f90f with SMTP id 00721157ae682-85d6a2e13f3mr94107827b3.17.1788175442427;
        Mon, 31 Aug 2026 04:24:02 -0700 (PDT)
X-Received: by 2002:a05:690c:e3e6:b0:81e:6a10:f90f with SMTP id
 00721157ae682-85d6a2e13f3mr94107637b3.17.1788175441869; Mon, 31 Aug 2026
 04:24:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-kunit_cgroups-v5-0-6c42c8753468@redhat.com>
 <20260706-kunit_cgroups-v5-1-6c42c8753468@redhat.com> <aoyFYWYmocJkTeXk@localhost.localdomain>
In-Reply-To: <aoyFYWYmocJkTeXk@localhost.localdomain>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 31 Aug 2026 13:23:50 +0200
X-Gm-Features: AcwNN1U0KtJvFymBd5EOdAW56G473bYb8daTnzAjeFTLioL1I8ELNQhwXHMDOSE
Message-ID: <CADSE00+8E_6q1PRhQdnH+HfqCHca5Oy4b4wgM67QPq-X6Z6FwQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] cgroup: Add dmem_selftest module
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 8:28=E2=80=AFPM Michal Koutn=C3=BD <mkoutny@suse.co=
m> wrote:
>
> On Mon, Jul 06, 2026 at 02:06:40PM +0200, Albert Esteve <aesteve@redhat.c=
om> wrote:
> > Currently, dmem charging is driver-driven through direct
> > calls to dmem_cgroup_try_charge(), so cgroup selftests
> > do not have a generic way to trigger charge and uncharge
> > paths from userspace.
> >
> > This limits any selftest coverage to configuration/readout
> > checks unless a specific driver exposing charge hooks is
> > present in the test environment.
>
> What about that
> drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> ?

But that test does not set up a dmem region (man->cg =3D=3D NULL), so
ttm_resource_try_charge is a no-op. Even if we add a region there, it
would not exercise nested dmem.{max,min,low} from userspace as
intended here. But I can reword the message to avoid sounding like
there is no in-kernel coverage whatsoever.

>
> >
> > Add kernel/cgroup/dmem_selftest.c as a helper module
> > (CONFIG_DMEM_SELFTEST) that registers a synthetic dmem region
> > (dmem_selftest) and exposes debugfs control files:
> > /sys/kernel/debug/dmem_selftest/charge
> > /sys/kernel/debug/dmem_selftest/uncharge
>
> Nit: I'd think about alloc and free (to denote meaning not how it's
> implemented).

Works for me. I'll change the naming for the next version.

>
> >
> > Writing a size to charge triggers dmem_cgroup_try_charge() for
> > the calling task's cgroup (the module calls kstrtou64()).
> > Writing to uncharge releases the outstanding charge via
> > dmem_cgroup_uncharge(). Only a single outstanding charge
> > is supported.
> >
> > This provides a deterministic, driver-independent mechanism
> > for exercising dmem accounting paths in selftests.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  init/Kconfig                  |  12 +++
> >  kernel/cgroup/Makefile        |   1 +
> >  kernel/cgroup/dmem_selftest.c | 198 ++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 211 insertions(+)
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 5230d4879b1c8..6fab65d6b44ea 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1267,6 +1267,18 @@ config CGROUP_DMEM
> >         As an example, it allows you to restrict VRAM usage for applica=
tions
> >         in the DRM subsystem.
> >
> > +config DMEM_SELFTEST
> > +     tristate "dmem cgroup selftest helper module"
> > +     depends on CGROUP_DMEM && DEBUG_FS
> > +     default n
> > +     help
> > +       Builds a small loadable module that registers a dmem region nam=
ed
> > +       "dmem_selftest" and exposes debugfs files under
> > +       /sys/kernel/debug/dmem_selftest/ so kselftests can trigger
> > +       dmem charge/uncharge operations from userspace.
> > +
> > +       Say N unless you run dmem selftests or develop the dmem control=
ler.
>
> Could this be made w/out introduciton of a new Kconfig option? (E.g.
> what tools/testing/selftests/livepatch/test_modules/Makefile does)
>
> (Maybe reword to insmod if you choose building the test module as OOT.)

Ah, nice example. I'll drop the CONFIG_DMEM_SELFTEST and have the
helper module as OOT.

>
> > +static int __init dmem_selftest_register(void)
>
> Just an idea to reduce the amount debugfs of boilerplage -- the testing
> args could be handled by module_param_cb().

Ok, I'll switch to module parameters and drop the debugfs boilerplate
and DEBUG_FS dependency.

BR,
Albert

>
> > +static int __init dmem_selftest_init(void)
> ...
> > +     add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
>
> Great!
>

