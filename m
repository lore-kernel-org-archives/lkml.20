Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D47E3C13E9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159631; cv=pass; b=rB01xIBdApjsu/znmW8yX8uyp7LxEuyHCtW96aDohIvwDB6HQQu9i3XdrdieecRUFZyksx6M+4vnZ/T/ppzxaNtXQR7GPJY8pgp8POyrlDTk3vbhZMa5HF23f5HiCHH/sdEiY/zrV+ilnFxSsJYNbvJ42rn5aIG1jiTESec1BL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159631; c=relaxed/simple;
	bh=MXXcOH+y4hl0L/RNN8RX65h8+wis8a7t0lw3Dv8huxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AgeaGscTMGpWet/qal3QHkmnd1fmReCMsf3RPldq9O4oa8UxbH1mfLctbzGnKPM6SFF3RySlCLxl8QRYGCItR38SNaUyNKPAOGq7quKMwFQbq5mIXRp4NSPSTe6ncgg+XCnSyBQA1AipOljFHQ+On4q88i9Vq9R2hPdOYyiYEls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TPmlA6Ad; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=D97TOKa1; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TPmlA6Ad";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="D97TOKa1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788159628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O2DvKAa4RARvXhQhytE/c96u+c2ks0rTMPN5Qc9vZ8A=;
	b=TPmlA6AdjRd/2+J0xWM5RXJJCNsyJiBkDJ94Hs/Qny0TSK+q3bZcFR/lOm6uG5h1DF10xi
	6NCgD+HRg3R7ldc3KzDtCXWuRJwFMtIp311DP2uycmFvOufUDP773U9yft6DcWXf6Wx5d4
	cp6u4kb28BnRRKU/yZbVLu4nz4xqbA0=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-pOsYOSdOPg6TxwjYqFnd5A-1; Mon, 31 Aug 2026 03:00:26 -0400
X-MC-Unique: pOsYOSdOPg6TxwjYqFnd5A-1
X-Mimecast-MFC-AGG-ID: pOsYOSdOPg6TxwjYqFnd5A_1788159626
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836cfb589a3so18918157b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788159626; cv=none;
        d=google.com; s=arc-20260327;
        b=ifK27Ex5JMXYAsUporSYy7VzMYenWEDnNKKtMJ5BbbWmDxnVbHQHa0TzXLEeAq07yZ
         qKDTf7q7UiSTHf9cv1e4gybtmzxF4NWSfFiS5lCQaCVPMZFm8hf4h4LA/S946P3+XoZk
         7Lg86ww7V+j8DuocZ4J3wylE6cCFe9vUqJTLfc+KDXv406tA56wSXBCGXjp6kByxDhnu
         KwYOb1WrKu7ECQL307tQJRbOdRl93YtrMh/WSfJeNP2YEo5QTm+cSIZHc9CgAuDt3Poz
         asdIzkSdKf4YeIK33G/BiCTEd2VlyXh1CNLHGrUG8ZUbpur8QKLRfSlRsTdf+MiFUHQd
         sSdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O2DvKAa4RARvXhQhytE/c96u+c2ks0rTMPN5Qc9vZ8A=;
        fh=Tqs9rQqRrqt9F3t/Ck1YL44m82Fzgm1sBJYEvvT1qso=;
        b=QNpmftQSd2SUtk8aeXrB5Ed/ho7jfJVi3rQ0+Qni1UtFx0iEtAul86eZiNkwJsuZYA
         RAUAW9kOcj0OfIY+NPoy3ADYx1DJUHjvFk3lG646TxGFUEunkEXBcOnMbkUo2Z/kblU6
         5mBHL6i5U66UJtVQkxvEsNWhQ5BEYc9xLdOFbm1otVpClCaBE1nxmVkDfuZ5zepT+tWY
         JKJf7CJOV+Aw3ssw6a4vIYFo90dJUZ9ej5hrJshI/ccpx5Gw2X2F7DoY6W5hn04wcPKz
         5cY5Gsg/raSRdUICY+ebmGqf18rxZGVok8JIuifrF3z6TMlWRPP4I9xUpa/RGa+hBnVQ
         fpWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788159626; x=1788764426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O2DvKAa4RARvXhQhytE/c96u+c2ks0rTMPN5Qc9vZ8A=;
        b=D97TOKa1O4q2xCuZNP659JEZ41qDsAQtXwLy1Jeei+Fu94rugJMZqYkYalNFrOjb+T
         0fe+PYxGsmOXTYQXk6orVtwZlDiUDRfFVNEfoMVgpmvfWRiv0Rn8WOeFzDzvTUNLyEe+
         MoMHdaIIk+uVpU+rSzH5ls+Xsfn5GId7Vw9tmRnsr810kVgLPj5/QTGCpwjyqn3iLawG
         1fnB8IK0ommroUcipj7SZrib4GlaFIG+JcXRdqMbJ9qLLAD0al6/1YFosIJt+qtz0C6h
         WLS/6Sy65Klg5VspmEEy+6vnYDTSp1VFnerHCmgJQLPjvvQn4FAOfWinpcN+RkyXJGKY
         Cy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788159626; x=1788764426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O2DvKAa4RARvXhQhytE/c96u+c2ks0rTMPN5Qc9vZ8A=;
        b=HvBJWHLl33kla60MPFIdDCVPK+4ertcwHcAQ0zmZsRmGkaV0ED/H/xGczC9WaCXSeZ
         32dC35zIKzyHtr1u5jxt5F5rLAG7PHBVOGoFFfjTvpnyaipfCWaPDV5Lnb6NQEKBE3bL
         N1zIdY2X+HR3NTJUipqXODXicYxUg42bBqSU0OQg95Xsd/T1TgHFAPPjJddyTt4kfe/d
         cxAUMCkfWXlSvw5Z4NZ6qI2ky/USMAKI9sp8sQDEmMzEHI9/H3HIazy+pzShl7CbAqfu
         MVfFc7AeW5h20J0244Hr8wyBATxY5cZWdV2I22iCMQKFqUds9pO6STKjXCf4pgwo0Y/d
         Umcg==
X-Forwarded-Encrypted: i=1; AKwUvBzyKRZdEnDwzWlcA8o5+en2yeij63bEnzb4fn7ygEMg74SW+WmNNtx8nGaF4wJEmieiwCPkNMfbSNwjZls=@vger.kernel.org
X-Gm-Message-State: AFuF++kTdac6iYqnm0TqziKGeS/tRJF3rvOLlq/VGpT0bNfx6onFOiR2
	m5GiNrwgOSLzS49yV7dqGIbn8IIL2oO5/cWI7PfXB667Dh6JPpyImQJqIuD7M2KChzKyYGwnQfB
	8qkrCjbqVOwaUogbIBReab89xcx8ezbgtS5y9sNBy2t6jZ9f0JBC8VVotShEmJTHblJ8ODAZpKg
	QNubiRl2+20h/3C3LkJ2yoWFyJJBW+7bin0NkwlwiF
X-Gm-Gg: AYBFou3cAgtDZv6Oa2qA4Myu/PC5jZ0kqIw9/brfW8s/EU/Nh2k7LCTRYPqu9XBKan8
	6TkYVt1U0SvcQLDx2/47b8IIJuvZfqQSHI30+iSHCeKyz/QAHN2hUoBqHYirykvZfS0o4qdi7/E
	MKWk+9zq4GG/0298HzdR0MYwQRNdLstqQA+KHbOCIJgFntf2iOIS0B7lo=
X-Received: by 2002:a05:690c:f08:b0:866:8f18:450 with SMTP id 00721157ae682-8668f274eb9mr11820557b3.26.1788159625647;
        Mon, 31 Aug 2026 00:00:25 -0700 (PDT)
X-Received: by 2002:a05:690c:f08:b0:866:8f18:450 with SMTP id
 00721157ae682-8668f274eb9mr11820317b3.26.1788159625076; Mon, 31 Aug 2026
 00:00:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424123123-mutt-send-email-mst@kernel.org> <20260828180933.743887-1-briandaniels@google.com>
In-Reply-To: <20260828180933.743887-1-briandaniels@google.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 31 Aug 2026 09:00:13 +0200
X-Gm-Features: AcwNN1XSJkuXBjZEwDIkh3xfc6n2M5txJOihoNH8-v1dWqr5sLesJvNRUV3Jp0o
Message-ID: <CADSE00KB6g7Qya2H7w4hjczZBWtdrNR=hhL9X1c10uOTZd1ZAQ@mail.gmail.com>
Subject: Re: [PATCH] virtio: Add ID for virtio media
To: Brian Daniels <briandaniels@google.com>
Cc: mst@redhat.com, eperezma@redhat.com, gnurou@gmail.com, jasowang@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
	xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 8:09=E2=80=AFPM Brian Daniels <briandaniels@google.=
com> wrote:
>
> > On Fri, Apr 24, 2026 at 03:37:14PM +0200, Albert Esteve wrote:
> > > On Fri, Apr 24, 2026 at 3:07=E2=80=AFPM Michael S. Tsirkin <mst@redha=
t.com> wrote:
> > > >
> > > > On Thu, Apr 09, 2026 at 06:53:41PM +0200, Albert Esteve wrote:
> > > > > Hi,
> > > > >
> > > > >
> > > > > On Tue, Mar 10, 2026 at 9:41=E2=80=AFAM Albert Esteve <aesteve@re=
dhat.com> wrote:
> > > > > >
> > > > > > Add VIRTIO_ID_MEDIA definition for virtio-media.
> > > > > >
> > > > > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > > >
> > > > > Are there any thoughts on this patch, or any actions I need to ta=
ke?
> > > > >
> > > > > Thanks,
> > > > > Albert
> > > >
> > > > Create a github issue and request a vote as documented in README.md
> > >
> > > The inclusion of this ID was already voted and approved. The device
> > > already appears in the VirtIO v1.4 specification, with the same ID (a=
s
> > > linked below). This patch is only meant to translate the decision to
> > > the kernel header.
> > >
> > > >
> > > > > > ---
> > > > > > While the Linux driver for virtio media is currently under acti=
ve
> > > > > > development and review [1], the VirtIO v1.4 specification has
> > > > > > already been published and oficially defines the media device t=
ype [2].
> > > > > >
> > > > > > Adding the device ID now allows other components and tools to r=
eference it
> > > > > > before the driver lands, and ensures the kernel headers stay al=
igned
> > > > > > with the specification.
> > > > > >
> > > > > > [1] https://lore.kernel.org/linux-media/20250412-virtio-media-v=
3-1-97dc94c18398@gmail.com/
> > > > > > [2] https://docs.oasis-open.org/virtio/virtio/v1.4/virtio-v1.4.=
html#x1-82200022
> > > > > > ---
> > > > > >  include/uapi/linux/virtio_ids.h | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >
> > > > > > diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/lin=
ux/virtio_ids.h
> > > > > > index 6c12db16faa3a..f9056af0c6223 100644
> > > > > > --- a/include/uapi/linux/virtio_ids.h
> > > > > > +++ b/include/uapi/linux/virtio_ids.h
> > > > > > @@ -69,6 +69,7 @@
> > > > > >  #define VIRTIO_ID_BT                   40 /* virtio bluetooth =
*/
> > > > > >  #define VIRTIO_ID_GPIO                 41 /* virtio gpio */
> > > > > >  #define VIRTIO_ID_SPI                  45 /* virtio spi */
> > > > > > +#define VIRTIO_ID_MEDIA                        48 /* virtio me=
dia */
> > > > > >
> > > > > >  /*
> > > > > >   * Virtio Transitional IDs
> > > > > >
> > > > > > ---
> > > > > > base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> > > > > > change-id: 20260310-virtio-media-id-b31179fcdc44
> > > > > >
> > > > > > Best regards,
> > > > > > --
> > > > > > Albert Esteve <aesteve@redhat.com>
> > > > > >
> > > >
> >
> >
> > Oh my bad. I misfiled it into the spec folder. I will take care of this=
.
> > Thanks!
>
> Any plans to merge this in soon? This is a dependency of the virtio-media=
 driver.

Hi!

It was already merged:
https://github.com/torvalds/linux/commit/2187be212179243f33da1271248571aca3=
e99a3f

You should get it if you rebase.

Thanks for working on the driver!

BR,
Albert.

>
> Thanks!
> Brian
>

