Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FC648F854
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924904; cv=pass; b=nhWzBe4bS3CZ67j2//K1Nx7XMdVcurtS6paqgqvAarayCObJm3/a4qclr7mhFU5Fnz1dYiNckRqF1WIK0aQvussuujXpaUW2eQw3LvSELWX6Lyu5QO0hhnEeu6Q6EXOfQspe4HoiJYfS5SxlZxM+wOycqLwo77+KE129X6pqWnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924904; c=relaxed/simple;
	bh=JZCuofIpeJapFWVfdF+8VkTikMT6xa5Y9R7i90xDuFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNLLvff/UueKZr+TyhCLklnG2Wa9V7TsTHQ//WAgrzLlnMaWvif1wAcipIpJ+sHjLBfjxqM7hapJL/SJprn9KjRH9PD0DRhR0J9aQA2PlAY2TZgcK+Iku8V0qNMtv2GyxESkUNA+385nZ6WcDMcU3aNrcAenO9q13FEZSZizvww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0dQtwNN; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0dQtwNN"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ad549a2119so24423157b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791924902; cv=none;
        d=google.com; s=arc-20260327;
        b=LTxtOrFVuogINHo86rsd07YclGPhY0NVo4yEFuq/jmwdQVcWUgKxBXY5TOykGWaNi+
         MJ2+Zc9Y3wHJsd1IF5s8Jwm/nSMPQ7Pdr54SAy5x+q2Vz5/HrxGgKgvc1ym6RvW78V4o
         8amRAcUsoQAFTl3l5QAkNHJWES03JLttcHSv4szeDaF+nkp2QWqd0HBVTmk/U4e4ySxg
         Nzm8X5oRDhzPEZD8Z7Mb/db120AoUD/zZZoSMBkBNZD9P7xKr2tT1J0ISawTA3OnF3D6
         w8MwgNorui2w0xYniP+MUx2IvxhGKHK1Stas0/nuMiebo80ztGiuif1unvfq4giCt4Gg
         zAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tDPPTDqcsXaSDPkJD9YhM9lPuiQdYmryZ8CiiWyAbR8=;
        fh=xUjVHpEG/0TAhWO+1ScdyHFV3B5kHFIuBKJZqFqhaY4=;
        b=FBMsaUbfMOl9JU/JvlsJDab2MUvTQ+U7mETtr6rA6pZbnIOA+gEGVGILWhn/t8Fyyf
         M2ht+Gc8g11TGrkNGORWy+erDno+6Hn8NtSj3ZTxK4X1EBLHlYGGTnluI7G3b8P62Oj0
         YWsIxOy2Yb1TRH8oQaNNe/2ckytcS04yCI1svUHQPf1yUsfSF/O0xQVYsbwjkSD5/Qfx
         8OhZAekSGYdftyTjSfXTCAERI6YbgQrDaM0LI9eXPiatMo2uu+n/gPie5nfe5GzLTDt/
         5zGotbPMeeR78IkxmkDJjD1wTamuVkqpxhLKCqI7kmW+2xIjZkq2goojeozU4pP+0DlZ
         zWRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924902; x=1792529702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tDPPTDqcsXaSDPkJD9YhM9lPuiQdYmryZ8CiiWyAbR8=;
        b=Y0dQtwNN6O98HKv1eGoR5z6xWXORtvpa6ez/LYvcvP0vuvSsPPUDiNKdYjntOM6BJC
         NGrn7kNWFi8LPZbJLE+x+PpSFzp0p7GB5O8bBdd90cEB1qBj1NQNaStw6pKqm3gM5oqr
         xE1Nh/Ql6G2CRcxOZspdghddoP3xd6LaRYN6jbsjnopPtCQ+3Vkt0TLyx/qmfHn2dlt8
         De0q7WIxQhFiYh8x6SMFTmPDFH6bdHqf9+UD4TVyWSEYwxUBFadArqu55YhSaC1I/QVw
         kI+F63k9PDcoYv/sFEcYM81vhT3tJeXWNBM5AvIYhEsxUm5WizJE8KfjnT5Z77DvZ8IZ
         Ui9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924902; x=1792529702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDPPTDqcsXaSDPkJD9YhM9lPuiQdYmryZ8CiiWyAbR8=;
        b=UWumMvnsW7bGq7cqQ8hC6w/IsdpXYD6phGdkaXfbbSuMGiG1iH5Z3mhgmXVVn1Z+qw
         1YUMqgKfuevUYHPOad/laRf653be6YNI4kP0pwe28Sa6baH+BXWffPd6hamtq40az4zj
         K1nejq5K8ZyJ0KHvFzgVzGqJgBMLlYTFdgxZVjN/RqKkRpi4CH9Uw+sVqoJvauP9la6q
         cGYMUBkEu6vx7otBsbM5n/FxenS5x+TL6RB4btHed++gpb1oj+D9psfBJ/aSCFplEb4E
         Gr7jdfd/8ouEG65SKSRAffduJAan0O+qxt7UGV7Yr/GJXdFzpLC7Gi7nMWTHmxxrCtHB
         HfEQ==
X-Gm-Message-State: AFq9FYI2242yqjy2jLQc7uNk0qfW7367SbiEfeAubzc9gMQxXVi95rqB
	aSCEootZMY/AOI++Gp7T1BLeEFDl/dLNkqFSGYoHEolUiuaNoIcroY/uKZaLUUO9NfrHtvtTt/s
	0WidLMDe+DJwsszw43ZTrmDOBKCq2cpY=
X-Gm-Gg: AYBFou2qMPiYCCl743hgPfuNbgV48uTzJ3goEBh9T7HRqbZrjNkfxuanrbRfoFLsc+E
	ggc5hSdpSXtm9Zjl/zJ9iG/dpR7tmJ6b5e+Y+FhyO+qOAWiMDWsdO+AogjRd76wTrLbCPBCyzc+
	lJqxvR9Wrv7Hu5zxXoYiV3kHEa5B06CScoXWeDC6vC+stXr4pdFdIOVo8DAhDYuj56xjLtsKEB+
	dNI2RlU1j3ygkzl/9ooUwyqtzpdN3/m8n+Vfa+L0Nf41BWLQVoW1hEoxb76fOCDWTM6QXTy48ic
	J7OGNkA5GfaLZHN5mX+jmfPCjI+Tvf6GMXJf7brDfMEDF8iCCw+efGJF5k9COepmHtXPrQywZhu
	/amz5Jl7vXcuFCDx+sl5Id9y5iVGbmLGyXGeGORhk
X-Received: by 2002:a05:690e:bc5:b0:677:d79c:f6b7 with SMTP id
 956f58d0204a3-67935f17bf1mr3978437d50.6.1791924901762; Tue, 13 Oct 2026
 13:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791887415.git.mst@redhat.com> <CAF=yD-JhTbmYmHUkkruPcyvSWv0QhVeGWC=K=ZvvpMdkzA-jig@mail.gmail.com>
 <20261013143716-mutt-send-email-mst@kernel.org> <CAF=yD-LLNm1K5r37-y2thyvLJN58ruffUUHy-6BUh1CGVmep0Q@mail.gmail.com>
 <20261013163109-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261013163109-mutt-send-email-mst@kernel.org>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Tue, 13 Oct 2026 14:54:24 -0600
X-Gm-Features: AclHuK8U1HzJlOl1AX2NjtB_mdQuaMcoNZfkwLnR19agOuqNwgvKv4h_E94K76U
Message-ID: <CAF=yD-LtGVWrGzs2shhfxzDdwfid=1=TYBcOVQ8Nt10gAHpjWQ@mail.gmail.com>
Subject: Re: [PATCH net-next 0/4] more virtio-net csum hardening
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	virtualization@lists.linux.dev, Max Krasnyansky <maxk@qualcomm.com>, 
	Paulos Yibelo <habte.yibelo@gmail.com>, Chris Arges <carges@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 2:36=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Oct 13, 2026 at 02:29:53PM -0600, Willem de Bruijn wrote:
> > On Tue, Oct 13, 2026 at 12:41=E2=80=AFPM Michael S. Tsirkin <mst@redhat=
.com> wrote:
> > >
> > > On Tue, Oct 13, 2026 at 08:41:19AM -0600, Willem de Bruijn wrote:
> > > > On Tue, Oct 13, 2026 at 4:58=E2=80=AFAM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > > > >
> > > > > Allowing untrusted hardware to specify csum start/offset for
> > > > > CHECKSUM_PARTIAL was not a good idea, because, if it edits the pa=
cket
> > > > > outside the actual checksum, and depending on the setup, the netw=
orking
> > > > > stack could be looking at the packet both before and after the ed=
it, and
> > > > > seeing different results.
> > > > >
> > > > > Previously, commit 6785011f8b16 ("ipv4: validate checksum_start b=
efore
> > > > > completing checksum") validated all known instances where this
> > > > > causes the most grief, but the real fix is to make sure
> > > > > that either only actual checksum fields are ever edited,
> > > > > or the checksum is completed before the net stack looks at it,
> > > > > so it is always consistent.
> > > >
> > > > +1 on the general approach of performing the checksum offload at
> > > > input, unless the input can easily be validated to be one of a few
> > > > common protocols. That greatly reduces the risk vs my previous atte=
mpt
> > > > at trying to drop.
> > > >
> > > > Since we do not know the full extent of grief, I think this too sho=
uld
> > > > go to net and stable.
> > >
> > > I think it needs a bit more testing to be frank, I do not see it
> > > wait months out of the tree. So if this lands in next before the
> > > merge window, we are good I think. If we miss that I will target net.
> > >
> > >
> > > > That would mean initially a single patch that
> > > > touches as few files as possible. The helper function in
> > > > include/linux/ip.h and conversion of existing open coded parsers to
> > > > use that can follow up later in net-next.
> > >
> > > I don't see the value to be frank.
> > > What moving code between files accomplishes, I donnu.
> > > Squashing things surely makes review harder?
> > > Does your backporting system really struggle with trivial
> > > dependencies like this?
> > >
> > > I can drop patch 2 and will if I am targeting net.
> >
> > Good. This is not about "my" backporting, but upstream stable.
> > Refactor patches do not belong there.
> >
> > Since patch 3 might have to be backported in the future if a serious
> > abuse surfaces, even if you now land it in net-next, it is better to
> > not depend on other patches.
>
> Right. While this is targeting next, I will reorder it last in series so
> it's obvious for people it can be dropped.
>
> Thanks a lot for the review!

Of course. Thanks for the fixes!

I would open-code ip4_parse directly in "net: resolve uncommon partial
checksums at ingress". It's not a lot of code. Then that patch stands
on its own.

And then optionally squash patches 1 and 2 and place them at the end
of this series as one dedup patch, or send that separately later.
Personally I would drop that entirely and leave the existing code as
is. But either way.

>
> > > >
> > > > > This basically does this: checksum at ingress, except in a narrow=
 list
> > > > > of specified known good cases.
> > > > >
> > > > > Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
> > > > >
> > > > > Michael S. Tsirkin (4):
> > > > >   net: add ip4_parse()
> > > > >   net: use ip4_parse() in receive validation
> > > > >   net: resolve uncommon partial checksums at ingress
> > > > >   net: account for ingress-resolved virtio net hdr state
> > >
>
