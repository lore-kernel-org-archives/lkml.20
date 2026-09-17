Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787524A4850
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688044; cv=none; b=fph+ETD3Ir+kDlootjEScpMoz1SpKU0woiPY/yN37Y1K1IJ3b3WV8IySxcjehMUIMevFa2T/axAbuMGJCdVEXT8EQRql8JnOBREJIC3F88lx7hT5aPrXU01oNiLFISKgTLDdKeeUIqnL/w742XaMYSb/JWvRG7RsbSynu5Pj0Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688044; c=relaxed/simple;
	bh=TNu+UsGtp6p6PSM8/oFNIjpC/cnMFn+2Y+PpgTc2gpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyoMKUPiFEuMG0qus2FHQnxHhbiebFGyJdmRNV2I+wKnj1qLZVRs9E4ZmmtkhNngKq0qhXOIwMtL2Vbsj4XvE1cBKhdg+z3pOKTyYbQIAOqBXJQ1WGXH0B9dNeKSqbCwFqO1p1ONBPQxBtBl6BzzRLRCI2OYDpYmBHfTZsbo2BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XQLoEdUx; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XQLoEdUx"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dd68a16955so12844775ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789688042; x=1790292842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RQOshW1Wlhutz0RqxDn5T1g0vEprp2QiXpRdTBiiFYc=;
        b=XQLoEdUxF5TuxLGhMpwsYA0ujXMkBJZnheQ0LjsfaAewhWveG01V8Enq41j4FILr3Z
         g2Cv3/djRxHUNF//UX81HJMu0YBDm5/snmMnW0eAHJJpH1qQRx8O9ArT2EcI26DAmzjz
         M2YgoAZnZ04+XlcAqseWUA7owi2PGsYPjkb6KUwhpX2uitdx81GzAE7KCXeNqXg1ZFn2
         4kj+oUxYEimec1R6tG9lA5Xr6+XrhY/WTVVUKE8Q1Y+6zulw4Pb6mOCK8s83ruvYVCgt
         SffjPa8G3NNGY5Jl9xgR6yMLJMGOwcf4VOl3ZeZeefcZ7Qlz1jpnm9WP6ZE/KBXgXgnS
         hr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789688042; x=1790292842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQOshW1Wlhutz0RqxDn5T1g0vEprp2QiXpRdTBiiFYc=;
        b=xirn9+QMr8y1utUIfC6Gtg8In6Cg8JTb9s7TnfNXYpY+qfpSAd0041d8PLQmVIIjf1
         btfbCqXDHpIdjQRiczMkVKcAOsT44HDUho/o4ivhij4MSj+y9u9RHHYFneQkgdlAJ5M9
         vRgFQHAGiH9JwHwEPDGnEQjy7rT0KSMpEzHo9Ot/wsP7f6aDLmEClgOp+nWxf3PvzyUy
         /1u/YsqOLNZLfKA5WuU43xYWeKqk9jXfELHwt3yP7Om39fo6HWPHQJSB+c7++lwukqgM
         lfzvzORTs76dBggBphp4WMZ+jLT7FBU4CEadyAnmxOOr5SMi9hhZVSO0388E4PdvnMc7
         2fBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlmDwlAqvflzLew997y4qQbD5fZ2JipNCqIhzOqHoBjzPZOnHW8eB+CMSl5SzSkS9cr/ZoA1RwE+Xalzo=@vger.kernel.org
X-Gm-Message-State: AFuF++mL5tobY5hID6Pn71CBtfEahQ1KZLIYR+vNpJrx2YN/3tP/lrVg
	X4JDmNRU84yb4Pxc4YbVKjAuFViehgn+gZfHqfetmlL21u/2lGuEaNRbNsNPcIn9qA==
X-Gm-Gg: AYBFou3/UcXlfBUr1stZutbz0gosePNkdzLPrdSq0tekwPWpfCxoXTyu/gNKZHZUgL0
	uluH0/ogxVQwn70bD1ROzpDIOfR5egIE6QWOi9eQcOQ4dT/IfrbusUqe8s9xgZmfBxsiyEy0sb3
	Q0AN9l9xAOfmwn66MBWYsngpr2JxCoOCHCFylgIWf+POgZWPMHEIoDmhNtBMc4h1Doa8C7/aBtg
	K4X+5BCjQyxpQzk+/M3+gtiTA45iBVoEsFES6SjOR5daLlePC/pkuV2S6iDZ/bNtTENnl4jpbow
	XGgmkfCZTfYdJqrYZimbLn5KwmkxLMg3F2WkijwZhpTyaLmGnJI+C/tcho3ZJI+Yzj8ErVNM1dI
	cvr+iiFSZ4GzPduLLHX/FXs8gpBzilQgmQnwVc3lCoIQdGxrRE74bkvcSjICvtcZxMqSNPxXEsf
	jlX4SJn4wdAHQgYg6khqKnIg13xC6EFSi7rfezW5xBAO7rBKDnNMicFaaIg1k3S60SVfqlJ1tkX
	CwYMhyXKMEQSVQbDAfuWdA+/iMmHs+iA7gIupn6oCMyzLgvLaQ=
X-Received: by 2002:a17:902:c410:b0:2dd:b442:ea48 with SMTP id d9443c01a7336-2ddb442ee33mr2803545ad.19.1789688041146;
        Thu, 17 Sep 2026 16:34:01 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd9e79bb2dsm16491025ad.25.2026.09.17.16.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:34:00 -0700 (PDT)
Date: Thu, 17 Sep 2026 23:33:56 +0000
From: David Matlack <dmatlack@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v8 12/12] Documentation: PCI: Add documentation for Live
 Update
Message-ID: <aqx45FqmkRps0wCF@google.com>
References: <20260728221007.2098560-13-dmatlack@google.com>
 <20260917213912.GA1049556@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917213912.GA1049556@bhelgaas>

On 2026-09-17 04:39 PM, Bjorn Helgaas wrote:
> On Tue, Jul 28, 2026 at 10:10:06PM +0000, David Matlack wrote:
> > Add documentation files for the PCI subsystem's participation in Live
> > Update.
> > 
> > These documentation files are generated from the kernel-doc comments
> > in the PCI Live Update source code. They describe the File-Lifecycle
> > Bound (FLB) API, the device tracking API, and the specific policies
> 
> Most uses fully hyphenate this: "File-Lifecycle-Bound" data, object,
> etc.

Ack, will fix.

> 
> > applied to preserved devices (such as bus number inheritance and bus
> > mastering preservation).
> > 
> > Reviewed-by: Pranjal Shrivastava <praan@google.com>
> > Signed-off-by: David Matlack <dmatlack@google.com>
> 
> Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> > ---
> >  Documentation/PCI/index.rst           |  1 +
> >  Documentation/PCI/liveupdate.rst      | 35 +++++++++++++++++++++++++++
> >  Documentation/core-api/liveupdate.rst |  1 +
> >  MAINTAINERS                           |  1 +
> >  4 files changed, 38 insertions(+)
> >  create mode 100644 Documentation/PCI/liveupdate.rst
> > 
> > diff --git a/Documentation/PCI/index.rst b/Documentation/PCI/index.rst
> > index 5d720d2a415e..23fb737ac969 100644
> > --- a/Documentation/PCI/index.rst
> > +++ b/Documentation/PCI/index.rst
> > @@ -20,3 +20,4 @@ PCI Bus Subsystem
> >     controller/index
> >     boot-interrupts
> >     tph
> > +   liveupdate
> > diff --git a/Documentation/PCI/liveupdate.rst b/Documentation/PCI/liveupdate.rst
> > new file mode 100644
> > index 000000000000..96b1d7f5df3a
> > --- /dev/null
> > +++ b/Documentation/PCI/liveupdate.rst
> > @@ -0,0 +1,35 @@
> > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +===========================
> > +PCI Support for Live Update
> > +===========================
> > +
> > +.. kernel-doc:: drivers/pci/liveupdate.c
> > +   :doc: PCI Live Update
> > +
> > +Driver API
> > +==========
> > +
> > +.. kernel-doc:: drivers/pci/liveupdate.c
> > +   :export:
> > +
> > +Internal API
> > +============
> > +
> > +.. kernel-doc:: drivers/pci/liveupdate.c
> > +   :internal:
> > +
> > +Live Update ABI
> > +===============
> > +
> > +.. kernel-doc:: include/linux/kho/abi/pci.h
> > +   :doc: PCI File-Lifecycle Bound (FLB) Live Update ABI
> 
> Ditto (and in include/linux/kho/abi/pci.h itself).
> 
> Trying to understand the FLB concept, I found
> kernel/liveupdate/luo_flb.c.  I know that's already merged so this
> isn't really the place to ask about it.  But FWIW here are some
> questions from this naive reader:
> 
>    File-Lifecycle-Bound (FLB) objects provide a mechanism for managing
>    global state that is shared across multiple live-updatable files.
>    The lifecycle of this shared state is tied to the preservation of
>    the files that depend on it.
> 
> I understand "global state", but I don't know whether "global" is
> relevant here.
> 
> I don't know what "shared across live-updatable files" means.  Is the
> sharing a fundamental aspect or just a typical use case reflecting the
> level the data is for (e.g., bus vs device)?

LUO is fundamentally a system for preserving files across a kexec. FLB
solves 2 related but independent problems that arise when trying to
preserve files:

 1. For certain types of files, there is some data that needs to be
 preserved that is not necessarily tied to one specific file. Instead it
 is shared across multiple files. FLB gives you a way to allocate and
 preserve such shared data. The association between FLB and file
 handlers tells LUO which types of files require which FLBs to be
 allocated.

 2. For certain types of files, the next kernel needs information about
 preserved state before userspace has come up and is ready to restore
 the preserved files. FLB solves this by existing separate from the
 preserved files and thus can be fetched during early boot.

For the PCI core we use FLB to solve both these problems.

 1. The files userspace is preserving are VFIO device files that
 correspond with endpoint PCI devices. Bridges can be shared across
 multiple endpoints so the PCI FLB gives us a way to track those
 independent of the VFIO endpoint state that is inside the file.

 2. The PCI core needs to know during enumeration which devices were
 preserved by the previous kernel so that it can set up those devices
 differently, e.g., adopt ACS controls instead of programming new ones.
 The PCI FLB contains the full list of preserved devices, making this
 possible.

> I'm imagining a *kernel* being "live-updated", i.e., a kernel being
> updated while things around it (devices, some user-space things) stay
> alive, so I guess "live-updatable files" would be preserved across a
> kexec?  I don't think of devices as being "live-updated" since they
> themselves aren't being updated; in fact, the whole point is that they
> *aren't* updated.

Yeah I think live-updatable is not an accurate way to describe these
files. I would say "preserved files" instead.

> Do these FLB objects appear in a filesystem?  Or are they merely blobs
> of data that are preserved across kexec?  I suppose there must be a
> mechanism for the new kernel to identify and request one of the
> several FLB objects saved by the pre-kexec kernel?

They are not exposed anywhere in the filesystem. They are blobs of data
(e.g. struct pci_ser) that the kernel hands off to the next kernel
across the kexec. To request a specific incoming FLB (i.e., FLB passed
by the previous kernel) liveupdate_flb_get_incoming(). Strings are used
to uniquely identify an FLB. PCI_LUO_FLB_COMPATIBLE ("pci") is the
string used for the PCI core's FLB.

> What does "lifecycle is tied to preservation of files" mean?  I
> expected to learn about the beginning and end of the object lifetime.

Specifically it means:

 - Just before the first file goes through liveupdate_file_ops::preserve(),
   the outgoing FLB is allocated (liveupdate_flb_ops::preserve()).

 - Just after the last file goes through liveupdate_file_ops::unpreserve(),
   the outgoing FLB is freed (liveupdate_flb_ops::unpreserve()).

 - Just after the last file goes through liveupdate_file_ops::finish(),
   the incoming FLB is freed (liveupdate_flb_ops::finish()).

>    An FLB represents a global resource, such as the IOMMU core state,
>    that is required by multiple file descriptors (e.g., all VFIO fds).
> 
> I have the impression that the important thing about FLB is the
> lifetime of some data, e.g., something that lasts longer than the
> kernel that produced it.

I think that is fair way to think about it.

>    The preservation of the FLB's state is triggered when the *first*
>    file depending on it is preserved. The cleanup of this state
>    (unpreserve or finish) is triggered when the *last* file depending
>    on it is unpreserved or finished.
> 
> Maybe this means .unpreserve() (in pre-kexec kernel) or .finish() (in
> new post-kexec kernel) is the end of an FLB object lifetime?

Hopefully my comment about explains this more clearly.

> > +.. kernel-doc:: include/linux/kho/abi/pci.h
> > +   :internal:
> > +
> > +See Also
> > +========
> > +
> > + * :doc:`/core-api/liveupdate`
> > + * :doc:`/core-api/kho/index`
> > diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
> > index b3c689e633c1..2bce2644eba2 100644
> > --- a/Documentation/core-api/liveupdate.rst
> > +++ b/Documentation/core-api/liveupdate.rst
> > @@ -74,3 +74,4 @@ See Also
> >  
> >  - :doc:`Live Update uAPI </userspace-api/liveupdate>`
> >  - :doc:`/core-api/kho/index`
> > +- :doc:`PCI </PCI/liveupdate>`
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 08a724b860dc..347c435ca404 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -20833,6 +20833,7 @@ L:	kexec@lists.infradead.org
> >  L:	linux-pci@vger.kernel.org
> >  S:	Maintained
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
> > +F:	Documentation/PCI/liveupdate.rst
> >  F:	drivers/pci/liveupdate.c
> >  F:	drivers/pci/liveupdate.h
> >  F:	include/linux/kho/abi/pci.h
> > -- 
> > 2.55.0.487.gaf234c4eb3-goog
> > 
> 
