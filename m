Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E23137EFF4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787940577; cv=none; b=gs50sEhulS7VB56o7MdG7uDsGVuo8qub6gOQpbJAe3puIWH5do8nw0W14gCgf817GNadNxqoXCbygZfwx9XxpM3mmhBnyK6z1adS//dv6tc5TjJ+erqJaetg8IhL1KHP+5m+TnWqRSO4zYBtNXi5GxCWrT2A0d7zM7yJyg2VCmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787940577; c=relaxed/simple;
	bh=Ugpvaz+FwUowalgYQSZeQPmONoAAl1nlU+pdz9LB4tk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SgUlz6w/TfWJNp85wiMie5z1PYUYT1Y8AekpkJKrJ/lGAR44Bx6u4Bf5etdwIU8FAAn1eeMO7YcvNygSCeyl4ynWu9B+9iGfe+Opp5JmEpkH+8vJdabwwmGo9Y8ccY+joFx7q6j2RyHR8u2hO6HZIdl9N+jJWXjh6atE6YIBpls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ax6EPfxs; arc=none smtp.client-ip=209.85.219.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ax6EPfxs"
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90cdc69a7b5so12932466d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787940575; x=1788545375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JnpgDp/+EDzOPy1A4LRxbe5FNGtxdeXUihLtU+6Z1Q8=;
        b=ax6EPfxs+xV+qt9sd6JaC+nK9NrGaUP3jY/iL0oxq5hP7bfmTf6feJiwJvyXFarVDZ
         oCy0eHThKA0MvKggfQiZ0C9/Y8hbm0H0m2LqaCUfAzDo4IimAqKNttd8vUexGZzT6ulk
         W3aBWcdbsy5hkN0I/JG1ULeFn1P8TB8aMZNgjXfusSNZky7cpf01HCDSmN12jpWEzfm8
         i0tHvgj5xLYjIzBf8GWNwJeP4PxPZJX90hk599xJz8OWqL1eRP6U+SCD68e8+wGmLFNa
         041oiN6vma5v2VmkSob/4zrOv5Bviee/cy1fg7mV5bQm4UOJti1BkYeQsQ+zsX3c661e
         5crA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787940575; x=1788545375;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JnpgDp/+EDzOPy1A4LRxbe5FNGtxdeXUihLtU+6Z1Q8=;
        b=IfZO0SaYgXddeKtS/H3xXDyN4oqhTnbHd2tB44k4wCUIPqQthTKhEBCeGb+vwdUd91
         Swhz025BxwPsNECN5NBXEmwwKPgLRR/DFG5saVAOJ4e2G/f0XfobDcL9mIhzwRVpS39z
         dkKCsMKk4+S7C1CoMTRuhXRpHO2RuWQclXD7Fx5hRv0gVSLKmyb1VpizqemI4YvUhoLd
         nqRdQs5tKU+/KZtBealmHx34K52hb8Prd6dEx7aWB8Gd4QjmQMO30Z6mKw6QmyC6gtae
         JWmDWokm1WWqx3tK/hLjtlQzMY0vvOhLcDju7Sqlf7Gv5YRnB9297TLnlg+INoU8yVAJ
         4Hiw==
X-Forwarded-Encrypted: i=1; AHgh+Rqu89ly+rWRarW/RyJDebHOwYnc9yI/61Y99BfU1huA36EtLggEJOfq911r5VEroVqDZpFSNSlxarkwRZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++kHyErfltQOT2CtDn6Z97eIotPTUTsEmtpGUsGTDDX7M9wUIwk9
	NjUWs1/VC0gyw3NmjcogvCiODjENVW3j8HAGHxQZDgOllCpPcgqsMtg62Oct1Q9lKKPqxdc9cp1
	2aam2hEVwg68+tBiCJZSNipzl9TSw
X-Received: from qvjh18.prod.google.com ([2002:a0c:d812:0:b0:907:46e5:8768])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6214:cae:b0:90c:40ba:e64d with SMTP id 6a1803df08f44-90ce0c0a094mr108859686d6.8.1787940575111;
 Fri, 28 Aug 2026 11:09:35 -0700 (PDT)
Date: Fri, 28 Aug 2026 14:09:29 -0400
In-Reply-To: <20260424123123-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260424123123-mutt-send-email-mst@kernel.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828180933.743887-1-briandaniels@google.com>
Subject: Re: [PATCH] virtio: Add ID for virtio media
From: Brian Daniels <briandaniels@google.com>
To: mst@redhat.com
Cc: aesteve@redhat.com, eperezma@redhat.com, gnurou@gmail.com, 
	jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Fri, Apr 24, 2026 at 03:37:14PM +0200, Albert Esteve wrote:
> > On Fri, Apr 24, 2026 at 3:07=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Thu, Apr 09, 2026 at 06:53:41PM +0200, Albert Esteve wrote:
> > > > Hi,
> > > >
> > > >
> > > > On Tue, Mar 10, 2026 at 9:41=E2=80=AFAM Albert Esteve <aesteve@redh=
at.com> wrote:
> > > > >
> > > > > Add VIRTIO_ID_MEDIA definition for virtio-media.
> > > > >
> > > > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > >
> > > > Are there any thoughts on this patch, or any actions I need to take=
?
> > > >
> > > > Thanks,
> > > > Albert
> > >
> > > Create a github issue and request a vote as documented in README.md
> >=20
> > The inclusion of this ID was already voted and approved. The device
> > already appears in the VirtIO v1.4 specification, with the same ID (as
> > linked below). This patch is only meant to translate the decision to
> > the kernel header.
> >=20
> > >
> > > > > ---
> > > > > While the Linux driver for virtio media is currently under active
> > > > > development and review [1], the VirtIO v1.4 specification has
> > > > > already been published and oficially defines the media device typ=
e [2].
> > > > >
> > > > > Adding the device ID now allows other components and tools to ref=
erence it
> > > > > before the driver lands, and ensures the kernel headers stay alig=
ned
> > > > > with the specification.
> > > > >
> > > > > [1] https://lore.kernel.org/linux-media/20250412-virtio-media-v3-=
1-97dc94c18398@gmail.com/
> > > > > [2] https://docs.oasis-open.org/virtio/virtio/v1.4/virtio-v1.4.ht=
ml#x1-82200022
> > > > > ---
> > > > >  include/uapi/linux/virtio_ids.h | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux=
/virtio_ids.h
> > > > > index 6c12db16faa3a..f9056af0c6223 100644
> > > > > --- a/include/uapi/linux/virtio_ids.h
> > > > > +++ b/include/uapi/linux/virtio_ids.h
> > > > > @@ -69,6 +69,7 @@
> > > > >  #define VIRTIO_ID_BT                   40 /* virtio bluetooth */
> > > > >  #define VIRTIO_ID_GPIO                 41 /* virtio gpio */
> > > > >  #define VIRTIO_ID_SPI                  45 /* virtio spi */
> > > > > +#define VIRTIO_ID_MEDIA                        48 /* virtio medi=
a */
> > > > >
> > > > >  /*
> > > > >   * Virtio Transitional IDs
> > > > >
> > > > > ---
> > > > > base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> > > > > change-id: 20260310-virtio-media-id-b31179fcdc44
> > > > >
> > > > > Best regards,
> > > > > --
> > > > > Albert Esteve <aesteve@redhat.com>
> > > > >
> > >
>=20
>=20
> Oh my bad. I misfiled it into the spec folder. I will take care of this.
> Thanks!

Any plans to merge this in soon? This is a dependency of the virtio-media d=
river.

Thanks!
Brian
