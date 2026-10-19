Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C107483811
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397899; cv=none; b=Y3q8JSXYM+bI5IDZRCTvjel1Txzz2Z5GoVKKaZssy9Nn6O1n35HPro0rakeDtY45sn54/pN6UF6UiG7JuGhhfFuw7+G2PbNw6lusbQwiz3ogWl3KZSTtoO6GazJq8Kx9Kr2ZXt6OHx3KM7Oe6gw7zqgZ+dt7HmC1eI8OVBHFLHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397899; c=relaxed/simple;
	bh=zJbXzUjdtRbnDRMSD0ZFUF3Ql50Yc48q8DhOcPiIqao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWmE2s8nxD8rQaxfFaDw8sJRLk2x+dO8wMQBI+ZKZ1xXg2mEuG15dcXTz2xbXfpJ47AQ5uwTHKtfiK1Yz6WpDLXnJxaHrIFz9hYcW5eIJyMMR/xSvfDqP9gf9ZkucQpGH4za2V8kcIz1lg8FKaWc0MHTOxkvZpOFs+IA4W8fISs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tDfo8YTQ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tDfo8YTQ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9f6a16afcso17685ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792397898; x=1793002698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wjpKNxbRFa0QN2xvZXyNEaUJwKZqQxqRu5XGn6mWryk=;
        b=tDfo8YTQ2aUtaSaFGdWyQTSlnuka752MbLgydVdf+DN/pqkCY2Hvm4fgqCOMr3tarJ
         IZC7K5TdBOh4M679M2EsT/QJL8A8xVAZaUj/tUPguzd9HBX70ew3CU69CEHajsvJQ/Gm
         5Dx9sdRmh2Ssk8Q+MTOmk7KI3Gcvq4FS7MgVmciSSQYYo+ukFo1YfN2TvaPea12IfKRh
         ybOE3c2tf2y83nnG1Gz1+LgzcHXnidRfPxnrBh2+cWkLOu4HL/gAnFTVXdVoDp4K/D2R
         YM3t9xkV+1rcXehX+Qn/3MB/5AFia+aiWCDXIcIraUwQFe21tHtLATXzfNrepWHdA3q5
         RSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397898; x=1793002698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wjpKNxbRFa0QN2xvZXyNEaUJwKZqQxqRu5XGn6mWryk=;
        b=dqZJyCGI5AEoOolKE2rA0b1gxxMtKQJm6txYqN3wQAli148gDKTWnsyoK2RBAbCLcD
         XogBF3NGqooyGpiDY1uXdiwteZ3iMDx67uNGcQV4XtmLcHVsSdm4gw6hJn91kD6yNhk2
         hyX8RqUvOD1sm6nEt7MsQ3/3SqP2c96V05PwgNJOsPS0cqPoGcDWP7lCuQArKWin1sbx
         S7BLeQOb1zIUfJzidRNeOiAaoUM+FRrH2fhPerrM/pZ2Z0OpnJ8ewfCkDyt/wz7naSiI
         dRWl6+w/qlXxo8k+k64bkSQXpXIX+fhQdWyA6ifu1yL6QR+msSpsXPOfReW7lbQJkHvb
         31Hw==
X-Forwarded-Encrypted: i=1; AKwUvBwtav3MSu3ZOzWLCLUr0WTgAPEJoo4o9uR7ICSxL61RBAG1zN+CGAZRT119VboDi5TX8qM6VwZ37Msw/+8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIHGr76+UVq9SRtFhlCltlA+KSG+Eb++5b/gP34r+4va/rV3aa
	1dVWLs7XxWWwJO88e8XqfY8+dTA8tESexi0c0cFSFkfetCaiT0etFYrutymRfMIFYA==
X-Gm-Gg: AYBFou17zrUEJyUDsWX2Yw7ozuzXgnIlpkk76Rctxq0VofvFITVUm8et8wjNswjO73G
	eCn6A732nIyLg5G0u2GrncKmP6jfTXVVJvlcU6e02XdFt+MU6UfM2NpkHw0FCwaitBIqAm/COyK
	xTaxHxsR+4lr1kbypkfeRyVt33RvyUVcb6GeCCSQV1FIDfQmVnvYxtbVtivRC78xQYQtBEmE/IK
	luw4R5MugmFCm7mj8TI11WUY8+qFCN9FQY8Xm+p9wBaapT5li5aMLZmjWue9hGQFpfxxkSdyPeq
	R/FHmQcwbVob4k7g/Cuql1+m+5Lc2TT+lNU57gGsPZWWCbhyevNSUMaKarwIMbkq8CctSge4mqq
	Lrd5z4O5c2npuSpI1aZgSh2K7muQ3FAK0h9Tiq/5UC/4vic60VRl6EqZd/2RazpSJkZcuwply0V
	hp1TdVAe6JKbOubFfEE1m3h2A876ziFSmDFtY82N0q5OHSPQ3B7m7z29FTiOdz3BKFtwCAgqwPR
	z1PNw2Ab5C94/3KToteywKO+8DR00+CxZ5tjg==
X-Received: by 2002:a17:903:1967:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2e9b332b4d8mr6634505ad.15.1792397897247;
        Mon, 19 Oct 2026 01:18:17 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58017244sm3517077b3a.47.2026.10.19.01.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:18:16 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:18:08 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v11 07/16] genirq/msi: Cache MSI message in
 irq_chip_write_msi_msg()
Message-ID: <atXSQFvKWo_xAw9l@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-8-praan@google.com>
 <875wz4eyqe.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875wz4eyqe.ffs@fw13>

On Wed, Oct 14, 2026 at 11:52:41PM +0200, Thomas Gleixner wrote:
> On Tue, Sep 29 2026 at 03:45, Pranjal Shrivastava wrote:
> > Currently, PCI MSI caches the composed MSI message into the MSI
> > descriptor inside __pci_write_msi_msg(), whereas platform MSI and other
> > device MSI domains do not cache the message in the core, forcing
> > individual drivers to manually copy the message into desc->msg if they
> > need to restore it across power transitions.
> >
> > Cache desc->msg in irq_chip_write_msi_msg() before invoking the chip
> > callback so all hierarchical MSI domains automatically record the
> > latest message. Document why the redundant assignment in
> > __pci_write_msi_msg() must remain for direct callers outside the
> > irq_chip hierarchy.
> >
> > Suggested-by: Thomas Gleixner <tglx@kernel.org>
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> > ---
> >  drivers/pci/msi/msi.c | 6 ++++++
> >  kernel/irq/msi.c      | 9 +++++++++
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> > index 80a9db417dc8..f7bedc31d486 100644
> > --- a/drivers/pci/msi/msi.c
> > +++ b/drivers/pci/msi/msi.c
> > @@ -257,6 +257,12 @@ void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
> >  		pci_write_msg_msi(dev, entry, msg);
> >  	}
> >  
> > +	/*
> > +	 * Although irq_chip_write_msi_msg() already caches the message,
> > +	 * keep the assignment here for callers that invoke
> > +	 * __pci_write_msi_msg() or pci_write_msi_msg() directly outside
> > +	 * the irq_chip hierarchy.
> > +	 */
> >  	entry->msg = *msg;
> >  
> >  	if (entry->write_msi_msg)
> > diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> > index fb5f372215bf..df460a574d80 100644
> > --- a/kernel/irq/msi.c
> > +++ b/kernel/irq/msi.c
> > @@ -634,6 +634,15 @@ static unsigned int msi_domain_get_hwsize(struct device *dev, unsigned int domid
> >  static inline void irq_chip_write_msi_msg(struct irq_data *data,
> >  					  struct msi_msg *msg)
> >  {
> > +	struct msi_desc *desc = irq_data_get_msi_desc(data);
> > +
> > +	/*
> > +	 * PCI Multi-MSI shares a single descriptor across all vectors and
> > +	 * the device stores only the base message. Cache the message of the
> > +	 * first interrupt only, so that sub-vectors cannot overwrite it.
> > +	 */
> > +	if (desc->irq == data->irq)
> > +		desc->msg = *msg;
> >  	data->chip->irq_write_msi_msg(data, msg);
> >  }
> 
> Sashiko reported correctly:
> 
> > [Severity: Critical]
> > Does this code cause a NULL pointer dereference for domains without an
> > msi_desc object?
> 
> So this needs to be:
> 
> 	if (desc && desc->irq == data->irq)
> 		desc->msg = *msg;
> 
> Did not think about that, but that also means that this patch was not
> tested on any recent (less than 10 years old) Intel x86 platform or a
> x86 VM exposing HPET...
> 

Ack, I'll fix that, and yes, I've tested this on arm64 platforms only.
I'll pick up a recent Intel x86 platform as well, to test this.

> Thanks,
> 
>         tglx
> 
> 

Thanks,
Praan
