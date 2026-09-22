Received: from mta0.migadu.com (out-11.mta0.migadu.com [91.218.175.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7605427FBF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111545; cv=none; b=PuQfTLjpvhgmEiVc3EohuktR9X/DisXRPCz0H/KXW9xL9pxECBVTcD8h3QSMTcAwfHic1s/OzUn051A0sOtpzCYetAnh6eBE0tvPh9krwb5M0R/pYdN+zzDGsbQr1PgbkLTF+6z8wAMYZV05okCw3/oMo4eT4XJqUksDG2DyjXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111545; c=relaxed/simple;
	bh=h6gV+3keWNApMlq6c6RQ82PoZscfFWn/9tcB/SrgqS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pRDxbSwtBCRhUwMBSre8t/eJqjvXP/q+Fu2PGRzpDXyPICYQWlt+V4xFnVyqs+5HRw1++MdMVR8UpFCFmDpQZfwSsSnqXJSWtlWSgF+UnCLfF6R/qJryUv63UubgeylkhEMWrdjedoJ1x3Dr+ERn9j5H53Erf7DCZBDq4Eumnd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=akYu1IxU; arc=none smtp.client-ip=91.218.175.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="akYu1IxU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h6gV+3keWNApMlq6c6RQ82PoZscfFWn/9tcB/SrgqS4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790111513; v=1; x=1790716313;
 b=akYu1IxUoTWmNvyigEWbbDTrwdYHyMcqhvR0kV8B+jWFumbIY4j3gAqphsHvl5AMuzW5yQ5h
 lGV+r8NzIMiU5X70sqKUXJHi21e0bv4E9Z/GQZYMEOwQ22p33TRhOrXXDOa8f/+pUKdxUZf22J5
 3CXZZgiENQeEUp3fmIkY6/Pk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0f14c2603a252d10;
	Tue, 22 Sep 2026 21:11:53 +0000
X-Mizu-Trace-ID: 0f14c2603a252d10
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so873e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:11:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzA2tOyKIeH7WEP8LH2ygjejKk0d92y7tGPtPA9yyCBcIkgdKDCQnWgStDN+HyyBZbjLX/sXJsMvZida+M=@vger.kernel.org
X-Gm-Message-State: AFuF++ncQ9HXv5bg45HBSRW45TEl7XNLQpd43e1YGbL6OQw8Yb4x67qT
	Q+L0LBh+pAoXstLasPvBHeb6Izof5p5PZwbW2+9w5c3mCII16xvBt3iI8JCluWuw0iJxqFRRPKH
	AF6VHI9vr2CnW6qnCMerHDCnxm/E44m1KM4EnQzlf
X-Received: by 2002:a05:6512:234c:b0:5b8:c871:4754 with SMTP id
 2adb3069b0e04-5b8d87f8ce6mr53229e87.2.1790111508201; Tue, 22 Sep 2026
 14:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918091052.2825315-1-fuad.tabba@linux.dev>
 <95685b0e-21dd-4446-8fef-c5664cea4057@mailbox.org> <20260922063830.472642-1-fuad.tabba@linux.dev>
 <61488ddc-b346-4ba3-b32a-e972a3bd75a4@mailbox.org>
In-Reply-To: <61488ddc-b346-4ba3-b32a-e972a3bd75a4@mailbox.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 22 Sep 2026 22:11:12 +0100
X-Gmail-Original-Message-ID: <CA+EHjTySaPWEDxY1QCjeAigetT1yzsspdY+v7srEzkS=kQdegg@mail.gmail.com>
X-Gm-Features: AcwNN1X2giFzDcFTBdxOtsqsnFJaBT3pUFrmornAsIBh_cAT0iiBtOfA2kEGgxk
Message-ID: <CA+EHjTySaPWEDxY1QCjeAigetT1yzsspdY+v7srEzkS=kQdegg@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-gen4: Fix device_node leak in rcar_gen4_pcie_host_msi_addr()
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 22 Sept 2026 at 19:07, Marek Vasut <marek.vasut@mailbox.org> wrote:
[...]
> Oh, this is very nice, TIL, thank you.
>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org> # Retronix
> R-Car V4H Sparrow Hawk

Thanks.

>
> >> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> >
> > [...]
> >
> >> "
> >>
> >> Also, I think drivers/pci/controller/pcie-iproc.c
> >> iproc_pcie_msi_enable() needs similar fix ?
> >
> > I don't think so: iproc_pcie_msi_enable() already puts the node at out_put_node, on the steer failure and the success paths alike.
>
> Could you maybe send similar simplification patch ?

Sure: https://lore.kernel.org/all/20260922210839.3765444-1-fuad.tabba@linux.dev/

Cheers,
/fuad

>
> Thank you !
>
> --
> Best regards,
> Marek Vasut
