Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438C133BBAF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145058; cv=none; b=Qd7GkPMW/WsohKVO6XwtZH+w2BMwjyzxDGCcBfL11Mczrdj/oYTTzZQa1EStxpNCF4rww1b5GL+AsgM7ftfVsj6H0nCVRmLFXq9S74/R/U8kov8DO0odbeXyO8cqYaBdKG0URBORF1XEAdQ03dQgZowDTNfPWn7SnuYQbTPNauQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145058; c=relaxed/simple;
	bh=hd5NL3Gh1DmDr5bvMSZgx1o+RubAP4rmHWQw/+dH+/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mixg/vce+VMUqSA3ynPOjwElWcanAGFqrLlqQWxVMQRI3nrKKrECJpmYmD2+mt+dbck/89hivoU0icVSocHu/aSWe3PXPxaoRve5/bjXybHfFIkVdv7D0oxahJ7nvFJs/256xaq89Q7FvL/3hdLf5aFmX5U4DMnU/iLuqlMTcd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=anElV8w6; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="anElV8w6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2db3305f94fso15666685ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789145054; x=1789749854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sNNu1TO589CWD7onDuXMEv1eJ3q2rtxkDJ3Q314d4zo=;
        b=anElV8w6OEfxZI0Pr7TpU9UjsIivDTVEo8HuBq6wOvaJaFCVqtq0q88Q475G741GVZ
         OUWUa3SvE8vzUbqsugjc5gCmX5eX9ZYNIw9lK6dtyuaJIugbk4blBfuG2SUDP7w0fGY3
         Ey6N4YTjQWdQlGqXKNuoLSko+uZVOD4QFW907KzQRLaX7GVp3tY4nqxsgtmBIFKpdo2D
         QNE32cdMFaEmVMGT+E5mg3GHyZYMZGWyO2gcIPisfNeVl0bn3FVdOup7je9BaRR5ftxN
         l3JiVdN4PBCtPhGnEfFYx9j/Pt5r4QW814nRy7QDRy3QWbeqewP05YMDvm8K+M6zmxk5
         PtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145054; x=1789749854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNNu1TO589CWD7onDuXMEv1eJ3q2rtxkDJ3Q314d4zo=;
        b=DHTajskzC9kkxderYD/kuSF5FvZ15hXYB/rLiDIiuc/3TA/bIRJ27swae9vK9dVvEF
         z0TE5DuHS/cT+z4UfbJOvQcADLl3+TmuxQfedPfzTXUvF7XNHHL9fPViGiQp7Hs2Oqg1
         sLGRb8j/5CwRXPf5nuK6cwFq75WsyA4UfeTnEPE8MlEY2Ml/OBEWiNDIF4/7gfBDlK4L
         wmdzR5ysmp2zvrKX/AbxCTY3e0QcVd4vJQGlKNdWjZEnHYTUHbVjqqWuz3XjV2CrQAVn
         P+pfiwgyE4imUN83NFVYFILFJH2bxqBZO3dPmp8mVxr1FSGfslVwNgosKl9Vpz6QR0k0
         lMjA==
X-Forwarded-Encrypted: i=1; AKwUvByJqxWWRHR0y6mfqd3ul3gwT7JG7vJdXlq281XKWZjlWzjBvo+ouXmSKQd7NqWMewIDPtqpgKhrGcfTwYg=@vger.kernel.org
X-Gm-Message-State: AFuF++m3idAVNKmsQcihiP6JjRgzigy40BT60l+ohprDi4Sfvjyn3PBz
	tDLwXQOQuXi/jycL/lFlA0Qtx4BpYPizPIwAp2eR8r0WRuI5zIHZ4xWuge9oMM4CvQ==
X-Gm-Gg: AYBFou1L6PajT4YeK/1BUOi6HUzui0b2EChnFTEZ7FWgR6+z3Odp7zlSwTlCPiEXxdt
	vRq3QuhuWECZhTsvZdqG+OPUzBCxdCSFm4v+sustGhL0deMAZO3QxnMGmUcnHF64OC2qf+vAfV3
	upn0bdL1n4B5Etb3csG7/dVR6wi9Z1o9tzVCmuy4jAmJVEtrfr635t9oRXGYSNwnWftTDO8KdAg
	wJfVumw4TED+P+SIEoU8dwS5X7BobL7z1ket7NTqPNdD84kR6myfhHqmV4M5wBufMqCG3RwJETH
	gEXCWNIPeCOMn9FYkJEnBRgUrat7bqo+rNcsykDuIxaj7lzjmwGbPYb9sPt2Nw6Q+Z5Xy1oylV0
	FjfvaAl91gayIt3/+mEgUy0PuL+xdGPqAw9xFuBS8VTn+p6s/mY+sZ7szPUhLJod+aY7pHfLqIy
	BrQMhfSLtZDGeDxUfXELdnFmuwqE6rKuxlqa+sbd5fQlVlU3s7XKoXA3GMAU1EwTxxx+PRRTnAt
	bqFodCeDgEDskoeBlkWMX1kmBh3erVpm2yODOJE
X-Received: by 2002:a17:902:f546:b0:2dd:40cb:a04c with SMTP id d9443c01a7336-2dd40cba291mr28022885ad.19.1789145053219;
        Fri, 11 Sep 2026 09:44:13 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca263fsm14640505ad.6.2026.09.11.09.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:44:12 -0700 (PDT)
Date: Fri, 11 Sep 2026 16:44:02 +0000
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
Subject: Re: [PATCH v8 01/12] PCI: liveupdate: Set up FLB handler for the PCI
 core
Message-ID: <aqQv0jJdT4xq6VWu@google.com>
References: <20260728221007.2098560-2-dmatlack@google.com>
 <20260910234824.GA366888@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910234824.GA366888@bhelgaas>

On 2026-09-10 06:48 PM, Bjorn Helgaas wrote:
> On Tue, Jul 28, 2026 at 10:09:55PM +0000, David Matlack wrote:
> > Set up a File-Lifecycle-Bound (FLB) handler for the PCI core to enable
> > it to participate in the preservation of PCI devices across Live Update.
> > Essentially, this commit enables the PCI core to allocate a struct
> > (struct pci_ser) and preserve it across a Live Update whenever at least
> > one device is preserved.
> 
> I assume pci_ser is the state the PCI core needs to preserve across
> kexec so the new kernel's enumeration doesn't interrupt the device
> operation.  And that whatever state the endpoint drivers need to
> adopt/inherit the device in the new kernel is managed without any help
> from the PCI core?

Yes.

> > Preserving PCI devices across Live Update is built on top of the Live
> > Update Orchestrator's (LUO) support for file preservation. Drivers are
> > expected to expose a file to userspace to represent a single PCI device
> > and support preservation of that file. This is intended primarily to
> > support preservation of PCI devices bound to VFIO drivers.
> 
> Where do drivers expose this file?  sysfs?  I guess it's a file per
> preserved device?  Thinking like a driver writer, I'm expecting a hint
> about how to expose this file (should also be in the file doc somehere
> if it's not already).

There is no requirement about how drivers do this from the PCI core
perspective. For all intents and purposes, the VFIO PCI variant drivers
are the only drivers that are going to be supported in the next 1-2
years. They expose a misc character device for each file.

> 
> > This commit enables drivers to register their liveupdate_file_handler
> > with the PCI core so that the PCI core can do its own tracking and
> > enforcement of which devices are preserved.
> > 
> >   pci_liveupdate_register_flb(driver_file_handler);
> >   pci_liveupdate_unregister_flb(driver_file_handler);
> 
> So a driver calls pci_liveupdate_register_flb() once, then
> pci_liveupdate_preserve() once for each device it wants preserved?

Yes

> > When the first file (with a handler registered with the PCI core) is
> > preserved, the PCI core will be notified to allocate its tracking struct
> > (pci_ser).
> 
> The passive voice here makes the actors a bit obscure.  I guess a
> LIVEUPDATE_SESSION_PRESERVE_FD ioctl on some per-device file kicks
> this off?

Yes. (And I will reduce the passive voice in the next version.)

> I guess the pci_ser allocation is in
> pci_liveupdate_flb_ops.preserve(), i.e., pci_flb_preserve()?

Yes.

> So the PCI core tracker (pci_ser) isn't actually allocated at the time
> of pci_liveupdate_register_flb(); it's allocated on the first
> LIVEUPDATE_SESSION_PRESERVE_FD ioctl for a driver that has called
> pci_liveupdate_register_flb()?

Yes. The first device that gets preserved triggers the allocation of
struct pci_ser. And the last device that gets unpreserved (preservation
cancelled) triggers the freeing of struct pci_ser.

> IIUC the call tree for that ioctl looks something like this:
> 
>   <driver>
>     pci_liveupdate_register_flb
>       liveupdate_register_flb(fh, &pci_liveupdate_flb)
> 
>   luo_session_ioctl
>     op = &luo_session_ioctl_ops[...]
>     op->execute                               # eg luo_session_preserve_fd()
>       luo_session_preserve_fd
>         luo_preserve_file
>           luo_flb_file_preserve
>             luo_flb_file_preserve_one
>               if (outgoing_count == 0)        # only for first FLB device
>                 flb->ops->preserve            # eg pci_flb_preserve()
>                   pci_flb_preserve
>                     ser = kho_alloc_preserve  <-- alloc pci_ser
>                 outgoing.count = 1
>           fh->ops->preserve                   # something not included here
> 
>   pci_liveupdate_preserve
>     pci_liveupdate_preserve_device
>       dev_ser = pci_flb_alloc_dev_ser  <-- alloc per-dev PCI core serialized state
>       dev_ser->bdf = pci_dev_id(dev)
> 
> Seems like kind of an awkward way to allocate pci_ser.  Couldn't it be
> allocated on the first call to pci_liveupdate_register_flb()?  That
> would be a lot easier for driver writers to trace through.

I agree the LUO FLB API is a bit awkward, but this is how it works.

If we allocated it during pci_liveupdate_register_flb() we would then
need to stash it in a global variable to hand-off the LUO later. Despite
the awkwardness of FLBs, it is useful to avoid globals and have LUO
management the lifetime.

> > When the last file is unpreserved (i.e. preservation
> > cancelled) the PCI core will be notified to free struct pci_ser.
> 
> There's a lot going on behind "PCI core will be notified".  I assume
> these refer to the first-time behavior of luo_flb_file_preserve_one()
> and last-time behavior of liveupdate_flb_put_outgoing(), which is
> honestly kind of hard to suss out.
> 
> This series doesn't include a caller of pci_liveupdate_preserve() (or
> pci_liveupdate_register_flb()), so I can't figure out the ordering.
> Obviously pci_liveupdate_register_flb() must be first.

In every version of this patch series I have sent I included a link to
the vfio-pci driver changes that build on top of this, rebased that
series on top of this one, uploaded it to my GitHub, and included a link
in the cover letter. Here is the relevant section from the v8 cover
letter:

. This series was tested in conjunction with v5 of the VFIO PCI driver
. series:
.
.   https://lore.kernel.org/kvm/20260714151505.3466855-1-vipinsh@google.com/
.
. The full set of patches used for testing can be found on GitHub.
.
.   https://github.com/dmatlack/linux/tree/liveupdate/pci/base/v8-with-vfio


> I first thought pci_liveupdate_preserve() would be called via the
> fh->ops->preserve() in the luo_session_preserve_fd() ioctl path, but
> it's not.  pci_liveupdate_preserve() is intended for the driver to
> call it directly.  But it looks like it has to be called *after* the
> ioctl?  Obviously I'm confused :)

It is called by the driver during it's fh->ops->preserve() callback. In
other words, it is called during the ioctl by the driver.

LUO just knows that a file has been preserved and what preserve()
callback it needs to run to preserve that file. It is has no idea which
files correspond to devices or which devices. The file could be a memfd
for all LUO knows. That's why the driver has to call into the PCI core
via pci_liveupdate_preserve() to let it know that a device is being
preserved, and which.
