Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [83.223.78.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E8C4E9C3D;
	Tue, 13 Oct 2026 11:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890143; cv=none; b=O1amOpnt7udyHgmrqoz5rIcwSmyiMjdZ6hxXWykcqHtZGXvmL8NDJbd6oCKkAP9Ma38Q0JKTia4bhwbZyfzQD9Y1zXWyMbRfVOl/jRV4kwHb0oPKQ1SREdT+0jtDJFO0A0xBSfFGrjTACJqWgDjH4azd6H8P34HS6QuV9ZczAMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890143; c=relaxed/simple;
	bh=8bS7YvNLYVdkXjgAtzxO0/0ag92VJHNK5hZSq/pHnFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKnilp04ZxE29ZFNckeEhKOIJ0HqIgpUBjGZKQ8x7KofgU1lzvIU2od4vJlS0czvzpMTYw7qZ6aSGdoIvQ06x0gqtrrKz+GCEBpS0EvZ99pD/Y2/rhHV4sc+ADeR5DIqhoiZ94UoLVx4j9w9/kJNINLUvvamI5Gl+ksNoNHLYls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.78.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 3ECB578C4;
	Tue, 13 Oct 2026 13:15:36 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 207086106ED7; Tue, 13 Oct 2026 13:15:36 +0200 (CEST)
Date: Tue, 13 Oct 2026 13:15:36 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Mark Brown <broonie@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Priyank Rathod <rathodpriyank@google.com>
Subject: Re: linux-next: manual merge of the pci tree with the pci-current
 tree
Message-ID: <as4S2GFTRLLuwAXS@wunner.de>
References: <aslAEm5Qsgp-9xD9@sirena.co.uk>
 <CAMuHMdVRP2RaDvX1-usBjiYUW0sCaCccd64a=rAH-LubYMkTyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVRP2RaDvX1-usBjiYUW0sCaCccd64a=rAH-LubYMkTyg@mail.gmail.com>

On Tue, Oct 13, 2026 at 09:55:54AM +0200, Geert Uytterhoeven wrote:
> On Fri, 9 Oct 2026 at 21:36, Mark Brown <broonie@kernel.org> wrote:
> > Today's linux-next merge of the pci tree got a conflict in:
> >
> >   drivers/pci/pcie/aer.c
> >
> > between commit:
> >
> >   79c168e2aa957 ("PCI/AER: Skip error recovery on false alarms")
> >
> > from the pci-current tree and commit:
> >
> >   d4c842c3af5bc ("PCI/AER: Fix memory leak in aer_recover_work_func() when pci_dev is missing")
> >
> > from the pci tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
> > diff --cc drivers/pci/pcie/aer.c
> > index 922a726a52a50,c376c3adbefd2..0000000000000
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@@ -1393,15 -1383,15 +1391,21 @@@
> >                 ghes_estatus_pool_region_free((unsigned long)entry.regs,
> >                                             sizeof(struct aer_capability_regs));
> 
> While your resolution looks correct to me, it can be shortened
> by inserting
> 
>     if (!pdev)
>             continue;
> 
> here, avoiding the need for breaking long lines.

Actually the resolution I would have preferred is:

		if (pdev && err) {
			if (entry.severity == AER_NONFATAL)
				pcie_do_recovery(pdev, pci_channel_io_normal,
						aer_root_reset);
			else if (entry.severity == AER_FATAL)
				pcie_do_recovery(pdev, pci_channel_io_frozen,
						aer_root_reset);
		}
		pci_dev_put(pdev);

I.e. change the if-condition to "if (pdev && err)" and keep the
pci_dev_put(pdev) outside the if-clause.

This was documented in my patch submission:

https://lore.kernel.org/r/0552ed277e40a288e0157af799257ee6ec722534.1791460615.git.lukas@wunner.de/

Thanks,

Lukas
