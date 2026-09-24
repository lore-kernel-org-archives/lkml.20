Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8A5463B8A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269122; cv=none; b=GzEtnaFIBEDRs3aThttDaY1wnqsddvTHVwj5WU8sj82QeWEDmry5QPoVMufGkahdNSEfqng9Ui2VeJW8HjIhKJUXsD4HIsEjViZdoe+bsKmMCg2bTMjeZDwepN/SrIrMQzQ3V7K/TrTB8ENeytGJEcG3TlCbI+6OADvLCkg68KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269122; c=relaxed/simple;
	bh=Xx98EkKYGwy/Wd4VFaiCxEe/mwTcrzmdpTxQ821uLZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sWmwCXEJNwa5SM/L+vOkXWgbDAyHA754JMVKB+Wbb7oRry9J4pqHJcwNKrgvcmAeVWPHyrv7VeQRprNFsrqGgybs6tioQz/cnt6S/gKowLvHU9EhwbBl648fFvdnjw4Nuglvz6Zt0DfwggKxdHQsaS+aNFpKV2EMoi79Z3S7tko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAXXpbum; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAXXpbum"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70921F00893
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790269120;
	bh=csH6Vcyq35ljdvX8BuMxaIS5iOFQptRneyHpcfiSYCs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CAXXpbummvXFSI2Sr/4dp3B9B/UCPRDOMv9pcFzpa90nZ3w9KoWHPsctLRMZEoIFu
	 +hwBqdSCL1SH6SprM19DFLaTUmMj/CzYhKiHy6V61nwDvjD/l9khGEIF/LgQdLCkmN
	 8P+Qgrtd46KbePnXkJ7JC1n1OtS03jbwOwu9707aDJzAHkFEpNrvj45de52qRLMVAX
	 ul/pNsgy2LKVaYbPbaiJLY0sZL9RrK0C/CHGFEuJq530qo2G2RC/AJK4DPCoxIiiFi
	 Ut2YjJ5pkpN6qA/YpP6g65aLrXLpltZwWIW3om3cg6Mfc/PbpoN5aA+bovFieGG7PR
	 85YPbVWnbbrjg==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a6287d59b2so18503541fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:58:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzwx+7ZcgjvAxr3T2++9BXk4FHNzOxxXizx4yRMNwCCkOI6hrHltTWj++2NpoeqBmC/hqLcs3NXB0hzKQI=@vger.kernel.org
X-Gm-Message-State: AFuF++mae5jTB6m656hzp+u2eXpCqUilw08fRRAXCkpOOo7X6LJctytK
	1FHliHOy1PR66i5NrtosAyfcrLVfFAzJ28+O2k+4nvdnpo28AyA4PskCggrBgRKqguUFe5pOpwh
	9/Zcuokkl0j9EBhzQe0MJBC6Iz0F/WcQ=
X-Received: by 2002:a05:651c:210d:b0:3a5:f982:9c62 with SMTP id
 38308e7fff4ca-3a63bf52555mr8023201fa.1.1790269119345; Thu, 24 Sep 2026
 09:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813-acpica-pcc-field-leak-v1-1-3d6c5f0eb557@debian.org>
 <CAJZ5v0isQYRN9aZCmWty-kZpjHvZWyJT2AnRXs9RDszy7b5TkA@mail.gmail.com> <arVPNWY3HziZkU1p@mail.gmail.com>
In-Reply-To: <arVPNWY3HziZkU1p@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 24 Sep 2026 18:57:03 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gk95pbFkhJK2fwdaOWRF3q8SRVNBKK1-Azq_m7tn1bJA@mail.gmail.com>
X-Gm-Features: AclHuK-got4QeHfDRQr4rCOqvHkneOIjKeJSoheBE4t2njMTpm8O6tX6kuP1Zdc
Message-ID: <CAJZ5v0gk95pbFkhJK2fwdaOWRF3q8SRVNBKK1-Azq_m7tn1bJA@mail.gmail.com>
Subject: Re: [PATCH] ACPICA: Fix memory leak at acpi_ds_create_field()
To: Matthew Wood <thepacketgeek@gmail.com>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>, 
	Len Brown <lenb@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Bob Moore <robert.moore@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 6:30=E2=80=AFPM Matthew Wood <thepacketgeek@gmail.c=
om> wrote:
>
> On Thu, Aug 13, 2026 at 03:39:37PM +0200, Rafael J. Wysocki (Intel) wrote=
:
> > On Thu, Aug 13, 2026 at 3:35=E2=80=AFPM Breno Leitao <leitao@debian.org=
> wrote:
> > >
> > > acpi_ds_create_field() allocates internal_pcc_buffer for operation
> > > regions in the PCC address space.
> > >
> > > The function runs once per field, so a second field on the
> > > same region overwrites the pointer and orphans the previous buffer.
> > >
> > > The matching ACPI_FREE() in acpi_ut_delete_internal_obj() only ever s=
ees
> > > the last one.
> > >
> > > An arm64 platform whose SSDT declares regions with multiple fields ea=
ch
> > > leaks two buffers at boot, as detected by kmemleak:
> > >
> > >   unreferenced object 0xffff000051e65400 (size 192):
> > >     comm "swapper/0", pid 1, jiffies 4294668436
> > >     backtrace (crc 0):
> > >       __kmalloc_noprof
> > >       acpi_ds_create_field
> > >       acpi_ds_load2_end_op
> > >       acpi_ds_exec_end_op
> > >       acpi_ps_parse_loop
> > >       acpi_ps_parse_aml
> > >       acpi_ns_load_table
> > >       acpi_load_tables
> > >       acpi_init
> > >
> > > Do not allocate a region if it was previously allocated before,
> > > preserving the current design, but, not leaking memory.
> > >
> > > Fixes: 0acf24ad7e10 ("ACPICA: Add support for PCC Opregion special co=
ntext data")
> > > Signed-off-by: Breno Leitao <leitao@debian.org>
> >
> > As per Documentation/driver-api/acpi/linuxized-acpica.rst, please
> > submit a pull request with this change to the upstream ACPICA project
> > on GitHub.  The Linux patch will become applicable when there is a
> > corresponding commit upstream.
> >
>
> Hi Rafael,
>
> This change has been submitted, approved, and merged in GitHub:
> https://github.com/open-acpica/acpica/commit/c71849d476bb5f97ca1867849e89=
3368e12a69e6
>
> Can you please review here as well? Thank you.

So please resend it with a Link: tag pointing to the upstream ACPICA commit=
.
