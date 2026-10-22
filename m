Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691473;
	b=QxS1m+3Bs06Glg3LqJGWrN07/Xn0ksNMVGztvJEUDeU7g01vtzLNLKDKqtWXmyV2Rkuj
	 yrradBxxcZnzfktzLjVtyyegJS7s10PVqe8eHO8ojzgDcIPU3uxhvEsR/QZSmkjJ4+wHx
	 c/0nLWuRfasgWZvPd71KvyZ0vMu8+YDvadZTsncRv5NAeXDlEi1Z6saCrcJgEO3URL1y2
	 hbViyzbW/86NRt8/bvmT7i8Edsj0uPxOx/qSygbVjOMqYTFhD3/WWpcXGSYJmfOO55s6X
	 VdK4He0jRYJlWrSTNWzF4cQTkZxF8odSbCvapyUaJkuVXEQS5wjuK14J2KqOdph2NkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691473;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=R9bdZDRYMZKsVAULKpGjrw6cvUzg31C4HzoC6qyPpxg=;
	b=ZD8qUsouz88LlolsM/vtIys6TZDbCHXLgCiQcpX77ovKGqKKtNC727N8y2slVrL9nPG+
	 Uyy+Y+C9eAu/B6xOA0T0/R9v63sHLEcq3dOZfpkYwucD9hzyj6z65crIGIwoRl9NTYxyM
	 dbR3Hw7aD+joRQbjLNPxh05l4cdwIe7/JDRj9dVvn42lWX/4R4HYcjuX/Rypu2nyHXoeL
	 5t1YWrfuDDL7ZSv+Wu6qDxqGAfRRkGJSEGAAkF3IWjspOKNe9A5oay/3WPumb6W22EcOm
	 bz0zxHrFQ4NrL7gRHJmUyrP9H0xWuM1l9j+j4Q+FhQiZjD7RXD60KUuG7xxR1X0R6YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ANdt5ILk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622F1606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ANdt5ILk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6AB61F01825
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792691472;
	bh=R9bdZDRYMZKsVAULKpGjrw6cvUzg31C4HzoC6qyPpxg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ANdt5ILkD8VnnU3i44IPS57FjGN9fB4EBCGGxjxv4mYiDZhhM79+8bdNEr2t5Lo8M
	 3c/R8AOwA655vNuqnP+8JnOQ09sH70Y/btOPsjjjCfIGixJiIK2XAIRqzmirewrZ/j
	 IbxkTqZJ/k7JPbJMpApQhArNsYdQmgm9C6l27IyRIyTkidOvAlseiJSn1/ejXGLi/F
	 DlgM66IjDwTQSi4piyjjhyDx3QIIQ46FT5R8nL7mFLoWjcBLiekCLcIWBXFyRVTSAM
	 rCBaBS7HiOq9ptscyL9WSUBakZnctQqKfGoEQIMTiOB4BJZqsXIxPjfp73YvzlA8YQ
	 /o/MiFlYfsnsA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5ba328513b9so1925070e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:51:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByKk279vCojRvholya4IvZyiirY+Vo9zzdg42kYdHN6Ed4fa2m3RtIvkvhr2FdRMNVdfX1sAD75I/PZKZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDYrQptynDYdur9L6dk35BhVdBSDps7PdHQ9pHnG2EURNgiwDT
	GDBcTdveKFKu3OkaZljGaOsxpnpKhnw8Dc+3l/VaAki62RhQzMeaQnXKFlKKNO3OndWQ911mnmn
	VKfUvoMGMZb9j+AeG86P3FAUTPd6OMw0=
X-Received: by 2002:a05:6512:124e:b0:5bf:a036:3e4b with SMTP id
 2adb3069b0e04-5bfa1bb87d5mr2514627e87.7.1792691471347; Thu, 22 Oct 2026
 10:51:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929181056.4746-1-mhklinux@outlook.com> <CAJZ5v0jNJBCK1Zj0cVuTK3mtyJFF3MbEH8HKvTNKCa84eMUdmQ@mail.gmail.com>
 <MN2PR02MB6863A57660077B2466B77FB8D4652@MN2PR02MB6863.namprd02.prod.outlook.com>
In-Reply-To: <MN2PR02MB6863A57660077B2466B77FB8D4652@MN2PR02MB6863.namprd02.prod.outlook.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 22 Oct 2026 19:48:51 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iSn8_sxdaXcSv8zvzwUpUPVTHpZw0Tg-OEPmq+xAFOmw@mail.gmail.com>
X-Gm-Features: AclHuK9OQn02mgBMGrBtFonnYHv87q3DVWCFzjepFTk63xsOK8_QFIiC_dLyc3Y
Message-ID: <CAJZ5v0iSn8_sxdaXcSv8zvzwUpUPVTHpZw0Tg-OEPmq+xAFOmw@mail.gmail.com>
Subject: Re: [PATCH 1/1] PCI/ACPI: Remove Hyper-V special case in pcibios_root_bridge_prepare()
To: Michael Kelley <mhklinux@outlook.com>, "bhelgaas@google.com" <bhelgaas@google.com>
Cc: "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 7:14=E2=80=AFPM Michael Kelley <mhklinux@outlook.co=
m> wrote:
>
> From: Rafael J. Wysocki (Intel) <rafael@kernel.org> Sent: Tuesday, Septem=
ber 29, 2026 11:23 AM
> >
> > On Tue, Sep 29, 2026 at 8:11=E2=80=AFPM Michael Kelley <mhkelley58@gmai=
l.com> wrote:
> > >
> > > pcibios_root_bridge_prepare() currently has code to handle Hyper-V
> > > guest root bridges with the sysdata parent field set to NULL. While
> > > this special case existed when commit 7d40c0f70d92 ("arm64: PCI:
> > > Support root bridge preparation for Hyper-V") was accepted, more
> > > recent commit 8d21732475c6 ("PCI: hv: Propagate coherence from VMbus
> > > device to PCI device") always sets the sysdata parent field to a
> > > non-NULL value.
> > >
> > > No harm is caused by leaving the special case in place, even
> > > though it is no longer needed. But in the interest of overall
> > > code cleanliness, remove it.
> > >
> > > Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> >
> > Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
>
> Is anything else needed for this patch?  I presume it should
> be picked up in the PCI tree.

Right.

I can pick it up, but then I'd rather have an ACK from Bjorn.  Or we
can try asking directly:

Bjorn, if you have any objections or concerns regarding this, please
let me know.

> >
> > > ---
> > > This patch does not just do a revert of 7d40c0f70d92 because
> > > an intervening commit moved the code to a new source code
> > > file.
> > >
> > >  drivers/pci/pci-acpi.c | 12 +-----------
> > >  1 file changed, 1 insertion(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> > > index 42d545edd7fa..452a90317c58 100644
> > > --- a/drivers/pci/pci-acpi.c
> > > +++ b/drivers/pci/pci-acpi.c
> > > @@ -1572,17 +1572,7 @@ int pcibios_root_bridge_prepare(struct pci_hos=
t_bridge *bridge)
> > >                 return 0;
> > >
> > >         cfg =3D bridge->bus->sysdata;
> > > -
> > > -       /*
> > > -        * On Hyper-V there is no corresponding ACPI device for a roo=
t bridge,
> > > -        * therefore ->parent is set as NULL by the driver. And set '=
adev' as
> > > -        * NULL in this case because there is no proper ACPI device.
> > > -        */
> > > -       if (!cfg->parent)
> > > -               adev =3D NULL;
> > > -       else
> > > -               adev =3D to_acpi_device(cfg->parent);
> > > -
> > > +       adev =3D to_acpi_device(cfg->parent);
> > >         bus_dev =3D &bridge->bus->dev;
> > >
> > >         ACPI_COMPANION_SET(&bridge->dev, adev);
> > > --
> > > 2.25.1
> > >
>
