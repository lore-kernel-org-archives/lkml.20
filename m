Received: from mta0.migadu.com (out-46.mta0.migadu.com [91.218.175.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D503F58C9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790186962; cv=none; b=PMaM8RYP03PM6M3YQlIoz/UYm1saoqEQKiXlycqpD3pSYSu5bakIsBnlVDj7Ola5UqcvSssh1yDafmIUktY9qxtTaaEk8ElMTDvIBWQh9j1U4ScESQjXihdmw1gjEtjhcMRWfFlugiugEVS1Lxbrs92BjwL/wM/QTobiV30+fIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790186962; c=relaxed/simple;
	bh=hp4x+ywzXvafJkCdP8u0POUn9g1o98sJr1Tn/DdIbhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYQLjk5mpX8ni3gN19bfk3GjaNVkxVPUDSWBylEf9R0O0SOyuI806C3C0+RTMS3KNbswvPTiAamRcmKVvlkAmvdgMq36rUKXdpfZqvCXe+dc2o93+FJk8znBs76yGM8nYRoI8imBGnpoRwJS6hzXx1OVtIpsKv9fTLwpD0Cpd04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ks4cYNxs; arc=none smtp.client-ip=91.218.175.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ks4cYNxs"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hp4x+ywzXvafJkCdP8u0POUn9g1o98sJr1Tn/DdIbhA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790186959; v=1; x=1790791759;
 b=Ks4cYNxs0v5y4HoWkW2mo/kiu2QZyoOLphuMcl8dKfcyqvumwn92aVth+JA8lDG6FZ1mmS8m
 8LKj3ySLdRwicpLusisFpdycwmzs4O2AYShzJbdDCTkfTF9AOBj53qhmeNx+crCPKDLSbtHVknt
 ffsBwCH92j2NaZZ8YsexskZU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 49b4b9cb847e0d83;
	Wed, 23 Sep 2026 18:09:19 +0000
X-Mizu-Trace-ID: 49b4b9cb847e0d83
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so875e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:09:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzI1sR7UG93tpxuQbI4gsUDYzAmgTdIwNgYqGb7tSlowPHX7CSxTaGEVnPJsQd4r8xgeIi/BjnfC5jXnDE=@vger.kernel.org
X-Gm-Message-State: AFuF++myEorrz8WCIR4TTkzYuCl8t6mTgPhPOlNBgt7C8y0KefanDgc/
	44yQjtMhvo0yVuEIgK80AqWvMJZZIv+FycxwdaLkCm/DzZI9yIwXhD6VhLtAwXt2ojg7f8RWyWb
	HxlknXUczIiWuHBPL+YGw9kx/S6vFpObIPqrwD02+
X-Received: by 2002:a05:6512:124d:b0:5b8:c230:1241 with SMTP id
 2adb3069b0e04-5b8dda17fd1mr39666e87.10.1790186953248; Wed, 23 Sep 2026
 11:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922210839.3765444-1-fuad.tabba@linux.dev> <20260923093433.00006cab@oss.qualcomm.com>
In-Reply-To: <20260923093433.00006cab@oss.qualcomm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 19:08:36 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxcXmOk-kvQQtrT1mku=gmn4P4RdZXU2iAQhj+hn7Hjtg@mail.gmail.com>
X-Gm-Features: AclHuK_L10VanL22RC296bQJntGVijw67vDS6niPFFu4Q6Xzn6rsFFWvoeRnmqs
Message-ID: <CA+EHjTxcXmOk-kvQQtrT1mku=gmn4P4RdZXU2iAQhj+hn7Hjtg@mail.gmail.com>
Subject: Re: [PATCH] PCI: iproc: Use __free(device_node) in iproc_pcie_msi_enable()
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

On Wed, 23 Sept 2026 at 17:34, Jonathan Cameron
<jonathan.cameron@oss.qualcomm.com> wrote:
[...]
> Hi Fuad,
>
> See the guidance notes in cleanup.h.   Linus has stated a couple
> of times that he really never wants to see = NULL pattern miles
> from where it is allocated.  Best you can do here is shift
> it down to immediately before of_msi_xlate(). It is fine to declare
> variables with destructors like this inline (i.e. not at top of function).
>
> Admittedly if the scope shown here had gone a few lines further this
> would look less bad!

Done: https://lore.kernel.org/all/20260923180703.3901185-1-fuad.tabba@linux.dev/

Cheers,
/fuad

>
>
> > ---
> >  drivers/pci/controller/pcie-iproc.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
> > index afb3aa38ac6bb..b4f4e6e1d4b41 100644
> > --- a/drivers/pci/controller/pcie-iproc.c
> > +++ b/drivers/pci/controller/pcie-iproc.c
> > @@ -1338,7 +1338,7 @@ static int iproc_pcie_msi_steer(struct iproc_pcie *pcie,
> >
> >  static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
> >  {
> > -     struct device_node *msi_node = NULL;
> > +     struct device_node *msi_node __free(device_node) = NULL;
> >       int ret;
> >
> >       /*
> > @@ -1357,18 +1357,14 @@ static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
> >       if (pcie->need_msi_steer) {
> >               ret = iproc_pcie_msi_steer(pcie, msi_node);
> >               if (ret)
> > -                     goto out_put_node;
> > +                     return ret;
> >       }
> >
> >       /*
> >        * If another MSI controller is being used, the call below should fail
> >        * but that is okay
> >        */
> > -     ret = iproc_msi_init(pcie, msi_node);
> > -
> > -out_put_node:
> > -     of_node_put(msi_node);
> > -     return ret;
> > +     return iproc_msi_init(pcie, msi_node);
> >  }
> >
> >  static void iproc_pcie_msi_disable(struct iproc_pcie *pcie)
> >
> > base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
>
