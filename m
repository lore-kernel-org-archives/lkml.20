Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5354B99D9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792333867; cv=none; b=lAvg8XbqjtElU5uN9ql7L1I2yK9C6OBXMAtELrJKWGgbpcBajv3CWoIPeqyIh9ufgOzWPI0J1ghnXYVmC5XKuFl+jcjQtoVmpmRtGBjvBl3J6viWbRtFc62YkDXuEN/pSR95abaeSOsUuJBj0Th4ta2C7ZpAq1DpquR4L6xTf3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792333867; c=relaxed/simple;
	bh=iYRUEe3PZ45l038eObE72ihFRzzU/ncepqESTIKoxq8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bXPpMfJX+XlUcdnvustv8UnqYUPB7E6ZY8Q8gAZFC0cRCfBf4GVRcaOPWfY0zuUr0Q4AcKor+XlR7ayEHBiPJ6ChxmpRPPGc3BrN5or1BJhvpsUeM0437LDLKDwfYBgZpcqfR0xUfIZiwzbvrPZjuGaAJpCnYHi5+SjVACYuuZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNoHEqyv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNoHEqyv"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b042c0759so731491f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792333864; x=1792938664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QkrVVEoSqEIKumzhBHzfKxUezLvi+M+pFa/zf57rau8=;
        b=aNoHEqyvwfziWkqLyWX4BZ3HNKkPTa6UvsNTo5kX9ounySaabucmK28FpVdVe203jV
         dJx4JTKMNiq2mbHxnIfgNAd0hW4mTXBfzl0ErFKJwKeHwGvaaSmfKvIjKQyqn/nhBFGk
         Vuv+Oc1/JdcXch7g86JJiFpVfEWee7Vwg8Ig9CCuaR8eaAThEzdl7a42Cf8CS/19Zht3
         zAws9qBxYK+3xfPJ/qpzlk0T0RDrrl2c40Zh32WfEv1IM8yaoHmSM8/CV2jPTGON2JZH
         yUS1W6OU5DYKUmRLcgZ88ME8r/8IMl+HVq1rAVfPLHxwygoUhJTQd7dhAfNoV/JCHF+6
         AF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792333864; x=1792938664;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkrVVEoSqEIKumzhBHzfKxUezLvi+M+pFa/zf57rau8=;
        b=AwjoLEnU48FFkTTHdtkPssSmDg89CkJWugAKXrdM+zW+TqNsUVYLTsJR4C0YS+4zzN
         RC59AuEepVa1FCiAKI0nPz15MuNzf9DGMLrlvysuK9pXUEqNpr/InVyz2AZaC59+i/Q8
         Y4r7BFds/PeqtI7SywE7/PYfTeT/kakeBWJGPaa3uKQx2KgKCRzPDi8appcW6Nb/M6qZ
         Gmh19MLdEO/vFm0yJEjqpMtfgBPRLuskY6t7g7v6+t+1rukzJZhcEZRRMfDnxjtC4XZc
         g7bWrZTeDPdaLf7oFlIdAwOAziWDfjrAPc/985QU2SQp87gWah6lGKy1K5UAA8I/GpAF
         3i6A==
X-Forwarded-Encrypted: i=1; AKwUvBxmh9aUbqWlUJbF3ch991XQwvcTZSNXfwbymTrp8Qjy+xmbOEnGhInChd4REY5GEsUunJX0jSJOWsktN4E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRvFlhqRnaN6qy2yLNrlrHBuqFBVfzTv+QWhLPheDBZeQXaf/S
	DFFsnDTRWfcUB5NsCHGttNp6wG7RxkMAag9mCLzimgy2eYrAq3rUCvPq
X-Gm-Gg: AYBFou3ahAQoPl9BavmnO5BEvAz92ntokXsfHfzkuXjJ2QTcAQYwZ265MF1nvPsub9T
	L+dnntHS0dE933+fXcgtelgh80WMu7wL5wl8mCAYC6XS/Tdm0YCfEEj55mWnjFGGIuMnz0n8coj
	ozhqZlOt9F9uraVk21qAanswgYxjl877kKZ23jutEzB+4dOG/Ee8M99oBvRwf8kELDNirQ0H+f0
	xAM15bdydibQCXUUD8GGOUQ5HXpW1if/CirZGmaZfkGZ6r/qQgk2WD72CnkKST3oLkle8pYAT+S
	HPGKgwKHZ+q+3KUqiBLIg2qfJEiODPymaqfEVp1YtRunqDTcMzG6nzrkk+wfE+RBEx3rtuMTtat
	uPtUSUG913+LcF1wleiqxc1JBRMsxIHvBLtaY+pc8a1d399fVtVBM6r48TIzx/99vQMe1es8dvB
	k/AALZVKRNJ7NYpooWsQlaQ+AT4VimFRy8txOIfl/8Rs5CPl3npDrvRmE+0mbP6VPTAs1KyYima
	ttfW4fWbW12FQYWKRfMCwXB6/Ma5G/MfHY=
X-Received: by 2002:a05:600c:1d05:b0:4a1:bd69:526f with SMTP id 5b1f17b1804b1-4a1d75ab235mr101854615e9.4.1792333863572;
        Sun, 18 Oct 2026 07:31:03 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce325107sm169279385e9.3.2026.10.18.07.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:31:03 -0700 (PDT)
Date: Sun, 18 Oct 2026 15:31:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: sysfs: Reject unaligned resource I/O port
 accesses
Message-ID: <20261018153101.59d276f5@pumpkin>
In-Reply-To: <CADhLXY6Pb9Y5f9r12RZA1bbjBS_ctXAkXHPwY8qWwn_1WOJAsA@mail.gmail.com>
References: <20260928123036.7902-1-kartikey406@gmail.com>
	<CADhLXY6Pb9Y5f9r12RZA1bbjBS_ctXAkXHPwY8qWwn_1WOJAsA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 18 Oct 2026 16:30:19 +0530
Deepanshu Kartikey <kartikey406@gmail.com> wrote:

> On Mon, Sep 28, 2026 at 6:00=E2=80=AFPM Deepanshu Kartikey
> <kartikey406@gmail.com> wrote:
> >
> > pci_resource_io() validates that the requested port lies within the
> > BAR but never checks that it is aligned to the access size. A
> > pwrite64()/pread64() on a resourceN file with an odd offset and
> > count=3D2 or count=3D4 reaches outw()/outl() with a misaligned address.
> > On arm64 this becomes a store/load to a Device-memory mapping
> > (PCI_IOBASE + port), which architecturally requires natural
> > alignment, causing an alignment fault and kernel oops.
> >
> > Reject misaligned 2- and 4-byte accesses before they reach the
> > low-level accessor. With natural alignment enforced, an access that
> > starts inside the BAR cannot extend past its end, so drop the
> > port + count - 1 range check.
> >
> > Reported-by: syzbot+7134530b25073b4ef373@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D7134530b25073b4ef373
> > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > ---
> > v2: Check alignment per access size in the case 2/case 4 branches
> >     instead of using IS_ALIGNED() with a user-controlled count, and
> >     drop the now-redundant port + count - 1 range check.
> >     (Bjorn, David, sashiko)
> > ---
> >  drivers/pci/pci-sysfs.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> > index 1f21856aac8a..8118cc6b3a61 100644
> > --- a/drivers/pci/pci-sysfs.c
> > +++ b/drivers/pci/pci-sysfs.c
> > @@ -1209,9 +1209,6 @@ static ssize_t pci_resource_io(struct file *filp,=
 struct kobject *kobj,
> >         if (port > pci_resource_end(pdev, bar))
> >                 return 0;
> >
> > -       if (port + count - 1 > pci_resource_end(pdev, bar))
> > -               return -EINVAL;
> > -
> >         switch (count) {
> >         case 1:
> >                 if (write)
> > @@ -1220,12 +1217,16 @@ static ssize_t pci_resource_io(struct file *fil=
p, struct kobject *kobj,
> >                         *(u8 *)buf =3D inb(port);
> >                 return 1;
> >         case 2:
> > +               if (port & 1)
> > +                       return -EINVAL;
> >                 if (write)
> >                         outw(*(u16 *)buf, port);
> >                 else
> >                         *(u16 *)buf =3D inw(port);
> >                 return 2;
> >         case 4:
> > +               if (port & 3)
> > +                       return -EINVAL;
> >                 if (write)
> >                         outl(*(u32 *)buf, port);
> >                 else
> > --
> > 2.43.0
> > =20
>=20
> Hi David,
>=20
> Gentle Reminder. Please let me know the status of this patch.

You need to prod the relevant maintainer, not me.

David

>=20
> Thanks
>=20
> Deepanshu

