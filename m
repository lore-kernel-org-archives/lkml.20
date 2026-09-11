Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AB84A64EB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789146030; cv=none; b=CTgSO0a2VG7ggimdQ7OX1pP506f5FeVjpg4AIRlxNl3/11/vZml0Wy7RJ/rNeOQlio8R87enW1Ag+nWJ+cAzGbCuZ8Y8M+/e/qH3M2v0RblPG+jmVis4AH95y2usBKW+9AA1c38aTgqFGQvPYS5L4PpCBDkkrAWFEMOJoE5QaT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789146030; c=relaxed/simple;
	bh=pKfXcTh9ufGXtOnZL+dqvriCFW8mQUY1BS2IMX9Ms9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=de0OleD+0szjWIJh/LqmsUSjDRJUHjK0FaJcxAD6hm6gBeGaVBUBKQdATMDzh4hOtbwK/x/xGSGQp9VPLGx1kXz3kTY+6JagsDOgYCkMxlZ6ahryGa+mBxJSuajE8/VoHwhhIsC2NHP1+9DIhTegGuZ/OcClqVRyykEps6Ned9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v9IZvae8; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v9IZvae8"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-46f53c8a5fbso429059fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789146018; x=1789750818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mwDk3fh+JvGyN78BSU6J48zvCwmsI7FUHYkydOLS1VI=;
        b=v9IZvae8x3v7JgAqqSmQc7lofPXLQdMwsx7ZhjXhc6Rlpl2KXPkWOgZ7a+IWL1nWMu
         +DP7CEjyls27Vt8D1cL0jT+Md5SqE0bLYtHiyKJI+uqfPE9PiFmcr6FNR2FzmWN97zh1
         E6BDQ3j9Fri8ayc2ozmMvpEO05vlOeAd7hkh805miCy4eRQb3DJR8eU1yyinK9jeylJe
         7z/suCBZ489WUbR1mp71Z8Xy/pqvoJtchYDW9KJvtxm1wv2YWt1EMsbNq3PvIb6XW7Fw
         skXJnHHu+m4b2yqsY5m7z5talvSxE0sgVpsj0+2v33enKhdmqMwoQY9as3qhj2+VVyoy
         tR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789146018; x=1789750818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwDk3fh+JvGyN78BSU6J48zvCwmsI7FUHYkydOLS1VI=;
        b=kMX6Ij4Nn54q7Yjn9clhQFXEJG4QAcjmuMRMBZz69Gfz/JAef5LPbF/yuZhT92mGox
         1t12BnlfAz/dvgojVEa7No/uPZVndwbyKsPTzNwBi55NJyv4uMQYL99CjSMGRZ81t/WE
         CbLYMLwPa7FxLO6f+fvvW9QctuIlHMnDT2hwVXkmunhSdUHtztMZ67dK9N5FYuwh1ANB
         DfD4vgTKVqNkxcOVksfdKoMneM1WFIbHdoGVpunH8ycYT/UOpA8+mBil+HilzvK835N2
         kgAvRzgc2EEAOhlQXdn14mncnej0Av9tEqvUGSFqFo28WvW/Xj/b2mV6hlSyRgfupwdZ
         v2tg==
X-Forwarded-Encrypted: i=1; AKwUvBygnxsW9/dv1rVVJz0SMz3MvhCB6LViktVVnSGq+e7TbePDwd2EyR4FEgN9MBcsJwICGc0WXRwjN3lE41U=@vger.kernel.org
X-Gm-Message-State: AFuF++nR/+X8UOBU84f57yQmjqVw2IaX2lUmDH6zzSOMmy04xfrYrcb5
	p1/Mah/WylsxbBj6Kd1i+09lHz2FkUuqTbOIZzOA1kg4lsKxvH0WGJwRcOIy+pbxeeXbY5ELTMY
	MeMap67A2
X-Gm-Gg: AYBFou0jAjxdaIFH1WeVGnAksEBmhsBaiX3+JgtC2lyLDJkUwSnAow7vpXELBlsqUJn
	UcxqyEVCKKeQXh1WmJs6nwT2CtujyPyHV4QBme0CyoPK/QzXbi8OQ6Kn6g66yHR1tzvJ55Lqgge
	yIAXeGv0Mi57dXcUtNnTADLEWlR+Q2bWr2OboXHKNMpsUdrqQ9ViH/NlcIXwa2V7XUc6eXxS9iL
	Ck0Tl8IU1glR6LE63P4bbzCW/TisV0w2RJ3SMNQMIar62zSf6w+n5E2O3HCaecBT0bwgvMNwA6h
	mjs8WVKBMgOzoiCVzSXUqNx8Je4Mh7mABqBz+MxiN+SYPQpUMZraEyF4UgF7zH1PvXlb7ul6oZb
	Qm7IAOiZd1LUP9bNZ6mZUlyQ5d5cMdOY8OKmVjHf9PJsrmXRSmjv+Pt2W+Z1It47jeLDdaAmZT/
	6lqKFSYdBEqquZ2WLNFdLzXWIFRvJic2cKYeOaMgDTGZQSxHGoA3eJnIR6xMVqd524s4zi5EaPE
	RvP/WbIv6l2L7NlyOcbjcLGiszAeYL1qtDSz8x7
X-Received: by 2002:a05:6870:7183:b0:475:a112:1275 with SMTP id 586e51a60fabf-47debded110mr3337322fac.34.1789146016740;
        Fri, 11 Sep 2026 10:00:16 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8bd0284sm2467114fac.9.2026.09.11.10.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:00:14 -0700 (PDT)
Date: Fri, 11 Sep 2026 17:00:10 +0000
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
Subject: Re: [PATCH v8 06/12] PCI: liveupdate: Auto-preserve upstream bridges
 across Live Update
Message-ID: <aqQzmvgILmU8F4TR@google.com>
References: <20260728221007.2098560-7-dmatlack@google.com>
 <20260910235126.GA367952@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910235126.GA367952@bhelgaas>

On 2026-09-10 06:51 PM, Bjorn Helgaas wrote:
> On Tue, Jul 28, 2026 at 10:10:00PM +0000, David Matlack wrote:
> > When a PCI device is preserved across a Live Update, all of its upstream
> > bridges up to the root port must also be preserved. This enables the PCI
> > core and any drivers bound to the bridges to manage bridges correctly
> > across a Live Update.
> > 
> > Notably, this will be used in subsequent commits to ensure that
> > preserved devices can continue performing memory transactions without a
> > disruption or change in routing.
> > 
> > To preserve bridges, the PCI core tracks the number of downstream
> > devices preserved under each bridge using a reference count in struct
> > pci_dev_ser. This allows a bridge to remain preserved until all its
> > downstream preserved devices are unpreserved or finish their
> > participation in the Live Update.
> 
> This seems to hint that we're going to allow bridge reconfiguration in
> some cases, e.g., for hot-adds.  The simplest case is "leave config of
> all bridges the same", and I thought that was what the previous patch
> commit log said.
> 
> What's the benefit added by this patch?

It is used in the following patches:

 PCI: liveupdate: Adopt ACS controls in incoming preserved devices
 PCI: liveupdate: Adopt ARI Forwarding Enable on preserved bridges
 PCI: liveupdate: Do not disable bus mastering on preserved devices during kexec

to preserve certain configuration on bridges that have downstream
endpoints that are being preserved. To support P2PDMA we will also have
to preserve bridge memory windows (future series).

If we are ok with applying those policies to all bridges on the system
whenever one or more endpoints anywhere on the system are being
preserved, then I agree we don't need this patch. But I thought it would
be cleaner to track things per-device.
