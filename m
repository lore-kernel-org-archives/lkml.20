Received: from mail-ej2-f38.google.com (mail-ej2-f38.google.com [74.125.228.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2CB47A876
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790103238; cv=pass; b=CLD1sVLfTWw2eSp+7ZziktgvBJmCyRA5RbeDIOEmhdeXWeQrBGvdw7JqJbOTI6Ic+7pc0AGzZmSV7K/jsxb+7TOYP7871Im95j6a1ShXpiGCWyCpI2LQIXvQ4nKXsvcn7TLH7DeX0fUjO+CIh4PDtuRSxcRkf/QJ/3z/sRwW6SE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790103238; c=relaxed/simple;
	bh=CxQ5R0YiXXR5pS5OlXpEM54373E5joJN4ppW4x5rEyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZNTY+yb1hZlvrZCYhbBsIBsPcadRgPuyFxRfyp3V2FKqnD3bLrroe+YOIWfo4e9vcUuWbrZIij0hdG4AXxVE9Z2nVXPF+yo0kPmst/qoFVkQpFbSYwxL8sIP6eG5i6Q3PeRLZJsG7vgx4kEbSi4N/H+iYWT9uQQsS8goyf9NIwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RETCNeQu; arc=pass smtp.client-ip=74.125.228.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RETCNeQu"
Received: by mail-ej2-f38.google.com with SMTP id a640c23a62f3a-c254f560398so17904166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790103235; cv=none;
        d=google.com; s=arc-20260327;
        b=nlaEqHC1Dof00Bd3QABJsXfTuKSOan+WaHDZ6XBZa1mGFpk9A4fJ09AmIgabFpw/Ti
         /sziDXSkAUqDaf/F93reKIsXKVx+4tF3IKTJ9COCgiNciMbkcDeOg/5LC5hxRUGuDttI
         drBmBZf4a8Z9KUSyISuUVsaKGdbe9xHpB9fhU6hoK50Ohr3QtmerV1geZK0MxZ1S2EUa
         HE1lqZBdAP4Zuj7aPXVfLAvthkCrBqiIUV1EWcGs0eNgQh2em94c2P3mhTA8bxo2BUFG
         XcxmIoLJovBJS9qobVMIU+gKzxsnc1eQ4tunyoMmhN93paE++AB0cdpI8c2hLuIZ7fK2
         6GHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mk9DB7qPIG0z2a0BppKMxU3ch/ZxTA+4gqsB2SAa/tM=;
        fh=GvpznRsP3K2wqilbRZimmsVkB0iNwI17LIuQNcngu+M=;
        b=MBzgREi+VVEF9EbDCxcCtKpz0oRr/ItURr4DSCBlfwEXrTeGWJaLzVr/93nAtqoboq
         lDjGEmrcE5x/klAXDOFO2vQJzMgaGHsK/GmxS7VgTX89UddVXLshI/Dre3Aql2IESzgK
         UNgvsutlUZup0gfwFOdSvuWrsdGlLzfPf90+BgdA7/Ob/g8P4TsumbYyfClwLnyoLpno
         CrWdQRbUth61STxFKm95ULRgDwL3n2aR0bfHqINCO4r9fz5WaQqD1mh7zZ5Kg049qXqV
         HslPzDmJkKuowMX1kpc7NDGOhM4ndyNHoOGoR5NlpDAf6Xkoy6temxDeNTxaXbeO6AU7
         muwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790103235; x=1790708035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mk9DB7qPIG0z2a0BppKMxU3ch/ZxTA+4gqsB2SAa/tM=;
        b=RETCNeQuvVm9JTLE1lCy4CsIYJJeNE/cA2myl+TuU7D1MIDOeOul/CwsE6q8scD7m5
         WVODIsA6t7K0B9iTuWQygUWmSSeZmUzvvLvBDTSD63myPi86GWvWRG3MqMYRPwMk5wkE
         q+TJEe6B8v51PCjt5cXZVXfTRij30TLiR9muOA6MNns/GOJC+39fgWqRj8XwKeTbErkM
         MWJVnBi6TE7+Zz7lhsxsZbZQf7DlgSTmmk9tqPJnyuzLq8WDCJWOoKJkhgz9UZxY/Fvv
         jYdcYfTzpBeEztYVBVESm+u5IHxaYnPsvtRRvsyuUzvc69HgDcJD6m0fbe1t/y43UuCK
         1+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790103235; x=1790708035;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mk9DB7qPIG0z2a0BppKMxU3ch/ZxTA+4gqsB2SAa/tM=;
        b=zRJjn/zt/BDEdLjwsoqns4cQD9KkvmYGjg0xhjum9dsnlikFvxJvB03TmowNbiplQC
         Tf1GVTmZ6xFu+g6Lf9N9UHNfh5iEbOq9PgtyI0SvZSCeTe8Oa1WwLdsESroDfZSahd4i
         sGa8AMsW95mvUWG/Ja6wyUJtNTacFy0QsxO3DkjkiO83zGPusDGtKrn6HOJQO/gZUsyF
         DeB63VxboJVig6HFsbp6Ps+Efo9aib0dmrrGbeET8L4N+t32LaU3RzxCDbRY7Tvnxnyk
         EnpGK6pi1oloMXKx6U3GcP39wJ35Vu4E1Umkm+4ylTgRQoyiXH2vUWjTVWe4TzBAGNl+
         OLiw==
X-Forwarded-Encrypted: i=1; AKwUvByog73F9o1Cp4GIRVB3ljgrIyfQWrb7NLjSuhALf0eCfZOsvRBlhdhjOLqZtWrQKlHk402FliSm/ryJ76Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lTQ8JYaaHYNI3Mpk6kAfhls9RkN3kb48P+WU+ZuZ0zDkAEiDqE
	z56ShDAvppvUC7QTVaYOVCjrx2+dNKFliCMv6z3D7cZE1t9fhkNgMC+UEU/fnwntUWDKqdDsv2R
	BKMJzIQUvkIf2SsKsz+gRBIbRYiHTacIpDiwh+aAzzU5UYspAtyxvaB9NGvD1Ag==
X-Gm-Gg: AYBFou2MOsBws1yZnsGNspF0HrP5AQQgpqi+sqdizlzkHun4CCqwp15ifs4o96wHYk9
	a1ItZ6NH5XqFJDHS+xw/P1uMGxwEm8bJHm5MgcXrcLinoI15CzMZFTzBJo1ka2Yemr55XzL8VxB
	0fdcaP4SdbCGYUVotSMT7vbq3vVnQK1PWaOl68gAp1BFcqiHnbdjEuobXJowTdYej1nlG6TGhIt
	PPBQK7KNfDlPIZlqBo4y8xEHq1ZnZ+RtBshgkE7hRgKKR/PpzG6TtE1854h8IO8eOLh81Iw5A0V
	XLgBPyUxOLOihuRIRTymb2oLlIJvPulvOUQbVybd9lbADFwxOf3JQQSLRw==
X-Received: by 2002:a17:906:f58c:b0:c29:448b:f5d4 with SMTP id
 a640c23a62f3a-c2aae2b0595mr11895766b.35.1790103234240; Tue, 22 Sep 2026
 11:53:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918200640.887030-1-dmatlack@google.com> <2e88b92a-d3f2-41f7-bdbe-11fd71690606@linux.dev>
In-Reply-To: <2e88b92a-d3f2-41f7-bdbe-11fd71690606@linux.dev>
From: David Matlack <dmatlack@google.com>
Date: Tue, 22 Sep 2026 11:53:26 -0700
X-Gm-Features: AclHuK_mAcmGN2d4gu0q1ERBsbnyv84fOIFniqxdriBGbAgM5X1zIuozEi_ewvI
Message-ID: <CALzav=eJU+fnPr-QN4s7gY_Lj8Pc3T6KXfC9kiQQ=g4rPEDMuA@mail.gmail.com>
Subject: Re: [PATCH v9 00/13] PCI: liveupdate: PCI core support for Live Update
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 11:36=E2=80=AFAM Zhu Yanjun <yanjun.zhu@linux.dev> =
wrote:
> =E5=9C=A8 2026/9/18 13:06, David Matlack =E5=86=99=E9=81=93:
> > Future Work
> > -----------
> >
> > Following this series, we expect to make further improvements to the PC=
I
> > core support for Live Update:
> >
> >    - Allow P2P across Live Update by avoiding resizing or moving
> >      preserved device BARs and preserving all upstream bridge windows.
> >
> >    - Support preserving Virtual Functions by preserving SR-IOV
> >      configuration on PFs and enumerating VFs after Live Update.
>
> Preserving the PCIe topology, bus numbers, ACS, and Bus Mastering across
> kexec is a foundational step for minimizing downtime.
>
> As we look toward complete end-to-end support for DMA preservation
> across Live Update=E2=80=94especially for VFIO device passthrough and dma=
-buf
> sharing scenarios=E2=80=94IOMMU table/domain preservation becomes crucial=
 to
> prevent IOMMU page faults when devices continue performing DMA during kex=
ec.
>
> I would like to ask about the current status and roadmap regarding IOMMU
> Live Update / KHO (Kexec Handover) support:
>
> Is there an ongoing effort or RFC series for IOMMU handover / page-table
> preservation currently in development or under discussion?
>
> How is the coordination between the PCI core Live Update mechanisms and
> the IOMMU subsystem being envisioned for preserving IOVA mappings (e.g.,
> restoring domains or handing over root tables)?
>
> Any pointers to active discussion threads, RFCs, or future plans
> regarding IOMMU participation in Live Update would be greatly appreciated=
.

The first IOMMU series to support Live update, can be found here:

  https://lore.kernel.org/linux-iommu/20260921004834.2601285-1-skhawaja@goo=
gle.com/

The IOMMU series builds on top of the PCI core support (this series)
and the VFIO series linked further up in the cover letter.
