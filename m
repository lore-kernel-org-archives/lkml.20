Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966423CB57E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165940; cv=pass; b=gPcz69H+UyrdGEUJryb+W9ChsmPLCF3QJVOFYmxAiQ7QVNDYHcsa6idZdgUlq7aW6DzKXXe+Do2HLa4J+v51uT8RB9LrfB/cYC9mOakVSfk116ypqv1bUquw7rsRuq2zZMIjXuT1CGX+Q+6mzVobE2Jgbo6lF87INhrwNr96sbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165940; c=relaxed/simple;
	bh=VjLyCE3ULm1W9z56D4wq6X0rbN/EyoCSd9TZqyvP8TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJddCLIAzkgTG99y4uo0ozTRvHO8t0FOz2OKoEuqj8FjSu5G00DjxVQN17fRJymIkP1wAMZ82YlqpXzQgpvdcMMTZf8VIq0WXTUMfDjooCz0JGKGJRYSXaLhlviigPNiVUxGox8sMavHKzER5FaffrjBQFwKDelOgVJJ8m3tP3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T6Pla2pK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F2Pt5yZB; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T6Pla2pK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F2Pt5yZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788165937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vg1jasgozEJAkrVTwgSp5gxj0PTi1l2mqJv39TXaqQc=;
	b=T6Pla2pK7LOuvSBi2w+KYUvlad1b0Utv9QW25GJFoK9bhk1TaAGuM2Ndgq0bgSDEmjcWpS
	TkYLOYUaasSlXCpWkrVT3wcpD7ku2/nO85THEFWOfvFk4KVVRAOItacvNQZEbrJyDd8QGQ
	8zg24/iTGtV7Rr7+YKceR9NdUrqoAWs=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-TKHuZBaTNUmqMMkmTfzH0w-1; Mon, 31 Aug 2026 04:45:35 -0400
X-MC-Unique: TKHuZBaTNUmqMMkmTfzH0w-1
X-Mimecast-MFC-AGG-ID: TKHuZBaTNUmqMMkmTfzH0w_1788165934
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-836c2b00bbaso44400027b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788165934; cv=none;
        d=google.com; s=arc-20260327;
        b=P3o2e0GDCevSAbA2MdMTPW8wG6K+X0C6I3qRoz0f5svxWZ4dv6HS7ii1oBBLeaMNT6
         nIexIyg2Jz2WxZFtbLyIopl7471l+PCl7FqXwafKXk3QPcoLyUUqBkgkvs9I6jmwWLqW
         1Ss4tDYW6n05707Q4LX5BxCerb2BNkTv4gC+bbH5bHVtilBG5rJlNd2a/4IGoth3mYSm
         6rxs9CFAsD3542WtNVLLWK/IYEpLEakSMaKkzt0h6F7usozzE3e/mEO3EAsju1xQ/qTl
         qCsdFq4uwLkkRNtz6TNMlGnDEIF+J33AUvKYls9oCCyP1UhN7Caie0ukDAjL7GQKBTCG
         5rPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vg1jasgozEJAkrVTwgSp5gxj0PTi1l2mqJv39TXaqQc=;
        fh=t53IOMGW8IP8pmlUS7S4rOZ//bfqD9RozZFIJ/o5vXk=;
        b=GjCGstRyY2OTb7W0V4eA37xhU1NmC9ebXEBHOvF1EX9Pj8TcnAIMHQ4C2ABtgmOwAR
         y2MZOG6OnpZg4Sl7oUGMp4V2sG0deLfvdvblmSSSD9XEgAj6UviVjh9pN3duOQk96CNo
         LtGmS5ujzZnXHXwmMgEMJ/ab0V1wWENgnhb0CqDGOd8uIQNJoT0JtmqCIr8x9/hpCWEZ
         FGOk4AyOTVklmqHgzmLoSXciaCRuj/ulCAR0T4SAmKfc0tQGGjViYYJVuJorbMFGqxOJ
         7VqMLAc9lo89mEtqHUQ3A3MXqXlSy0OIFsVWkM2J5aBLzCS3Oz9c0J+b+IeVajWE6D+X
         NyuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788165934; x=1788770734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vg1jasgozEJAkrVTwgSp5gxj0PTi1l2mqJv39TXaqQc=;
        b=F2Pt5yZBQ/IoUPjVPeuFlkIff/F1KhVvJo19zlPvTTV+FA4WNvcszJi4u3APb6alwf
         duqsRsIOwzgwwcLa3BcUfUQ7fjt3NbcH9yCnxW1WYyAPcCkrAaFH9H6K6OXaLnj6mwX7
         NyZYpYS8s1Na08gnpB33WeEFMYsO1JKlTYTbsh2FDZkXcgB/05xDzFkYe4bXPlzkcLQR
         OvJ8QE2xQGiByW4mrIraucsnu3GG08TDC+IYNtDrFm9BgvYvOrPc/d/HVi2TeA9zW+j9
         Batf3c3GDV86uL2IB4a45alOx9fcpUcE9h2J4IRiuzSCiBzIg6Eh2s6WKbCmuz8+smgA
         Yahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165934; x=1788770734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vg1jasgozEJAkrVTwgSp5gxj0PTi1l2mqJv39TXaqQc=;
        b=BLYekxDT+jCCm6VboiHj5bVoi9WvVWwASM+Y42UXTZ5Ghd6sRs0UPZIWzSvFsr4e1e
         dzUfsay2xgda5CcXY0LnR+EcCS4F41gc8MzmaQxKzkqVIm+uqtDXxl4f4TgeUGv9dNON
         uq+jIzZFgYVr+Mdob2FdpnBYB1zLPS3IUW6oZG3Te/xEvAc/xyL32qQk9J0DNnxs/2pa
         s/DX2SIScfFGzzJXXB/6d6b74XFenwO05ItUqD3aaxaYRkGPxbWw2X1+SXngFxqzwdRp
         MhC++KMhLB1d/yU8D4mP6AHvFDbkFeuvdK/dt9yD0SglSJC0Yk91CD+o+z/aUEx6DVVS
         eTmg==
X-Forwarded-Encrypted: i=1; AKwUvBwflqAmMLC4Ud7J6ELB5hDro+CJPWV3y+YWVOv35u/juPtuN7y0TkKoFzqazzpP2LzPMN9zkXmsrQqJMi4=@vger.kernel.org
X-Gm-Message-State: AFuF++lICIhzvo+OhjUz08FNB3lYSk30xTTQD2+Y1ltaJ9JEa/wWNvBU
	9TUceeRsGHhh1kx9cRn/HR4MYUNThoSfRDxy8vbBD3sSnU2t/cfNlLeZxtsShSNov7BKRMkMB8V
	Jcn4pqHEoGQ/nzCsvvkr61nAuNMMcL7Dht9wm0R0Ri4PSfPt3AkuNbxM50fs0Lb5K0+B4qB0R6U
	R9xTxdgI4o+Ju3l8v94L3sSsQ86HRQECqNrhCV9A87EiuzTvpM7RI=
X-Gm-Gg: AYBFou21JINhLLRYtRebhMtlzY/Su40lmD1ekNpoXY7YWD6/9BIPxSz9F2Anw7bOVF/
	w4FXE82ocK5dVOnoenBz/5icMV7lcUqzAF1lFuaKBUGPrgmuryjcJkFIrF3RwjPM4TpquRJ2sbX
	sl6DWOesanYQEEDvJNI0i7MLnRZXsEMiFMgK/0nLa+6pZF389abmSwa6s=
X-Received: by 2002:a05:690c:e3c1:b0:845:cc1a:af6e with SMTP id 00721157ae682-85d6c4f9797mr89839117b3.30.1788165934387;
        Mon, 31 Aug 2026 01:45:34 -0700 (PDT)
X-Received: by 2002:a05:690c:e3c1:b0:845:cc1a:af6e with SMTP id
 00721157ae682-85d6c4f9797mr89838877b3.30.1788165933810; Mon, 31 Aug 2026
 01:45:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-kunit_cgroups-v5-0-6c42c8753468@redhat.com> <aoyLV5ovAaY15G-h@localhost.localdomain>
In-Reply-To: <aoyLV5ovAaY15G-h@localhost.localdomain>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 31 Aug 2026 10:45:21 +0200
X-Gm-Features: AcwNN1URWgK4fv0lv7-8mBvsb3EpLpT39bC_2lvLWDVD0tpVvUbMExgZhTXTnyc
Message-ID: <CADSE00+5PWATGzHokJMEoY9fuYRYrf=H9NA1zfXXoaZA2NvPzA@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] cgroup: dmem: add selftest helper, coverage, and
 VM runner
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Eric Chanudet <echanude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 8:27=E2=80=AFPM Michal Koutn=C3=BD <mkoutny@suse.co=
m> wrote:
>
> Hello Albert.
>
> On Mon, Jul 06, 2026 at 02:06:39PM +0200, Albert Esteve <aesteve@redhat.c=
om> wrote:
> > Hi all,
> >
> > This small series adds practical test coverage for the dmem
> > cgroup controller.
> >
> > The motivation came from following the recent dmem API discussion in
> > thread [1]. That discussion considered changing the dmem API and
> > adding a new knob. Currently there are no dedicated tests covering
> > dmem behaviour, which makes such changes riskier.
> >
> > Adding selftests has an additional challenge: dmem charging paths
> > are driver-driven today, so regression testing is harder unless a
> > suitable driver is present in the test environment.
> >
> > This series addresses that by adding:
> > - a kernel-side selftest helper module to trigger charge/uncharge
> >   from userspace in a controlled way,
> > - cgroup selftests covering dmem accounting and protection semantics
> >   (including dmem.max enforcement and byte-granularity checks),
> > - a virtme-based VM runner for repeatable execution of the dmem tests.
> >
> > The goal is to make dmem behavior easier to validate when evolving the =
API
> > and implementation, while keeping tests deterministic and driver-indepe=
ndent.
>
> Thanks for the dmem selftesting. I'll respond to first two patches
> individually. I find the wrapper scripts in the last two a bit of an
> overkill for the selftest (as it adds dependency on particular VM
> environment, I'd keep the simplicity of selftests such that wherever
> they are executed (w/out wrappers), there they run (be it a physical
> machine or a VM). At most, I'd consider a simple wrapper that'd load
> ensure the test module is loaded.

Thanks for the review!

The last two patches were meant to follow the existing virtme-ng
vmtest.sh pattern used by other selftests, mainly as a convenient
developer loop. Anyway, I can see how it might be overkill, especially
in this initial version. I'll drop them for now and keep the first two
patches.

If a tiny wrapper that only ensures dmem_selftest is loaded turns out
to be useful, that can be added later.

BR,
Albert.

>
> Thanks,
> Michal

