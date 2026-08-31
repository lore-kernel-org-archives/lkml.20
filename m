Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668703D171C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164320; cv=pass; b=PvAxlC0YoMotVENfKtfLfHN6/v/l803uepSsXXg5DRuUnOIu6c0TopzflI8TADVelrETNJXrUw1jWfyArVeQY6IFvsvsemXaGpfHwXeRFqjQK2jF4VG7mI83rwXyvDxwRz/J9wy5Mcm7SG8qqfsD6s1tX3BiUP2lr5bbl8iFCMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164320; c=relaxed/simple;
	bh=FA91Z0TTWF8Jg5MST5f2D77GHmEYMdOhAhawJNJVwUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2llINlSinFfRSq76M6aQ5tTNPABEDcwckQEi+msdRMRJ8MOO7HhsDcccaLTagdLPx6hZ7GbumdRJADzayRRNfa+c5UqOI1Q+8fhekgqWUYLqR9uLL5o7+6o98aalmS4UPyv02pY7wDcP7k7iD0N32y1Pg9uxvIoNwIWy7/fevs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QY9NvhWE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=C1lue0rB; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QY9NvhWE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="C1lue0rB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788164317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FA91Z0TTWF8Jg5MST5f2D77GHmEYMdOhAhawJNJVwUs=;
	b=QY9NvhWEyL6BL5LbLpNEoKjPz38sl170hQWlx+3D0ZY3KyVrVOjKIKm4zv17wu3t7+wEMy
	vTncmmoLKn1f34VZeG14sOC/6XRPq4/u1mZ0GQpnc0XMDaWsGGE9G0vp+chwkBR8uL34XW
	TLxIWJQiQ3z8UVeBXkJeHhkkBLb9K0s=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-cTN0tNEzNyqsExlZi4-O9g-1; Mon, 31 Aug 2026 04:18:35 -0400
X-MC-Unique: cTN0tNEzNyqsExlZi4-O9g-1
X-Mimecast-MFC-AGG-ID: cTN0tNEzNyqsExlZi4-O9g_1788164315
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-85c370a5eaaso57705597b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:18:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788164314; cv=none;
        d=google.com; s=arc-20260327;
        b=LQabPLQSdcO19auFpLN5q8F6SWMeeDyMHqW7O6DLqlSwj6POicRY7V+L5s7IHkFxmR
         aVI5aQSae8fECtbFopjDPs2ln2Gy76+p++7QHJFscE6qyyOYIETORAiixT3Kx8B1abSX
         4SiB0ZNsmb+fosoHme6YTN1x0ijQQTMvAdwe2B+79cXYGEl0aACgXcs73nx/1aam6lxs
         Dyt9GSBaHOu7dz9C6csZgTTsyOmYAGPFJ5v+hejYZJJyJf8gO+g6AnoNarwp7sNV4Nyj
         ly0cyfbMPR2GjDRoGHKT4K4IsUTOlLPE92x6rxX9STmyTi1IBirIgeVdhars4CGdR/Oc
         eZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FA91Z0TTWF8Jg5MST5f2D77GHmEYMdOhAhawJNJVwUs=;
        fh=fW66ASkJnJ4/yQ4vCSOyTZNN1izCBRoP1peMpLe8SOI=;
        b=EazginImgqaAq1x7HU25c1YR9gLCKQQAahZW/NAzNqra9efZrS24vXgebCtjkvlYXU
         vAZ8f8lw7xI53MXRB+qtrSIG6RJBdqoFbpRjDsMwcGYBTG+Ejsa/n3Wf8MfcAZo0DIEk
         1jcZXdZWwcKzB/UifEzAXhxN2vPwwn/Ozxc8diPXFf1Do+cfzITGP34UXj/khLc7FPQa
         WfNKFp6LS/gFFKT5AqKQJUNNZ4zMrznAcHsSRS0VmxBRwmF1Cv1G/EXbWEoM6A54L/Yz
         Wg+BuhtHKhtXSi9QcpU6Jbw/aH/OJhLN/b1dmFY9cUb4aTSGMKQP2UGEknNkZIPv3VYG
         y7TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788164314; x=1788769114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FA91Z0TTWF8Jg5MST5f2D77GHmEYMdOhAhawJNJVwUs=;
        b=C1lue0rB6CPwiiVmeciGJTEOQyG2F7KM48uwyjrjW/rQAwGM1/5+5Zzg4vwWx/dR4e
         GgORYwCJqUzVxk4PWpH6P+ybT4tboEkrme9l6toOEoyuCygf/u+xpTmfhRoBIFtrn20k
         2qKDMPPZTehtvrYUYOqSOd59wZMs27hzR3G3mzwNOHbARFtQ03QCw/MxZcgaaZvNVOW7
         i0xYTwp5wsTLBTc3vocUXSdatS77ucl6RPR58CwCDiITkEQj+SBcmIukbGkUMiFBlM5K
         l67e4OmkKH/OMhCDJWXaxF0wwvLmjV5eFt5g5/dCXKYJDXZMxFXl8VhT+nAjHMR9/VcZ
         2qrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164314; x=1788769114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FA91Z0TTWF8Jg5MST5f2D77GHmEYMdOhAhawJNJVwUs=;
        b=T2f7vki79kpRp6c4Ip0wVKhzhMow+pCjhEaMFq0qc6/5BIdU1Qx0D7OxFqJK+XqN81
         3zIyn8mhvwtlT4oJD3TKRUTuTSPQ2Es1RAF92osm/Wau3F2thag/PxYBRFkoqFZINIT1
         FJZVeYVzEPUhcBfRmoi3o/HFBX9sqnyLUw/pqDNSwJed0CE8STtwRfVPA83BneOcHeWx
         QJJzjP0bj7qiDGdGEeFDQNkWS0q0InfOemHXhFaWar8ILv18BsTk2wtEhwGsSpNodz2E
         MYy4vbCNM+iXc1cpvDq7vIocQQRMMdJBXP2LiFqadqH6lz25DtiqM9P66GXZskEQgUu+
         PpBA==
X-Forwarded-Encrypted: i=1; AKwUvBywQMuY4jBFmcqsMGkT4biixtTgtWxQPkRVf16G3EJh6eIp3ZM1iaIrVoUq36DdhdEDE0CCtYZE1HDxm7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mDKZluqFq6+ZNAMvwq4bdqlZn6GJbSJuDOC+YzMfR9rRp7EcEi
	RLW4nmrQQxKuo47ibgM+ny5eE5cnqyhHIiCqQf92iEp/H//gR5NKgzOQqIBGrO/Ku1ax0V8EITG
	yCR1f/kSlKcQ6aWtJlMmzyjDph0EO4DcWJ0A36dJ2zBhGIQIyKsa2CyLnc/La64DnPOdxONWbCY
	tE/pDDTpiqHrILA4ziFkn1K/BguG+9IEnPpbw6MKg+R58bv3VJwaI=
X-Gm-Gg: AYBFou3Zwx78zxhb3Xcmsbo5YkfU5Z2hspNznAcbLjm/pqQ1NCbgMQwpTeZRSccRueu
	KkH3MwO7FLz2Gml1p+Ds1iR7EaymzahlzZJidz43u8UyV5W5ylIYrreZZ8Kro+Nu+vcYK+H7IV5
	yBMTcTDHssNYuHk45bIU4HaZa4N0cUOM2uXRliEVPP//TPF7AdBFfdwLi/BvvG1Y+nsqse6FnEP
	Hn7XdRdslIwmVVb/1xXxOdykOiGCVTvBymBNu1RoByaeoXH1z59cdWBJHQ=
X-Received: by 2002:a05:690c:d1c:b0:80e:c332:1796 with SMTP id 00721157ae682-864f424051cmr19065537b3.10.1788164313606;
        Mon, 31 Aug 2026 01:18:33 -0700 (PDT)
X-Received: by 2002:a05:690c:d1c:b0:80e:c332:1796 with SMTP id
 00721157ae682-864f424051cmr19065427b3.10.1788164313135; Mon, 31 Aug 2026
 01:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818211425.91009-1-graf@amazon.com> <20260818211425.91009-5-graf@amazon.com>
 <CAJaqyWeGaoamHzYRd1ZVUJ+6fx_4RWDim+jLO964qKtgZ=zogQ@mail.gmail.com>
 <CAJaqyWe1fKBwBXXxHqDV676Uw03Pvr0uLizPmHKqm+sqmY_LgA@mail.gmail.com> <20260831022012-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260831022012-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Aug 2026 10:17:56 +0200
X-Gm-Features: AcwNN1WheummLpWtW7LZn6dlmsoQ7mHWDchQmoKxwqk99R4q9CywoIs821OVsqM
Message-ID: <CAJaqyWc-a5orY1Rg2S_PmdPWt6gcGFM7-FyN4Pqk5hPd8vi0PQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] virtio_ring: return -ENOMEM when a packed ring
 mapping fails
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alexander Graf <graf@amazon.com>, Jason Wang <jasowangio@gmail.com>, nh-open-source@amazon.com, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Halil Pasic <pasic@linux.ibm.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 8:21=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Mon, Aug 31, 2026 at 08:00:00AM +0200, Eugenio Perez Martin wrote:
> > On Wed, Aug 26, 2026 at 2:47=E2=80=AFPM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Tue, Aug 18, 2026 at 11:15=E2=80=AFPM Alexander Graf <graf@amazon.=
com> wrote:
> > > >
> > > > Commit f7728002c1c7 ("virtio_ring: fix return code on DMA mapping
> > > > fails") moved virtqueue_add_split() and virtqueue_add_indirect_pack=
ed()
> > > > to -ENOMEM, because virtio_queue_rq() maps -EIO to BLK_STS_IOERR an=
d
> > > > the request fails. We still return -EIO from virtqueue_add_packed()=
,
> > > > and virtqueue_add_packed_in_order() copied that when it was added l=
ater.
> > > >
> > > > Guests that bounce their I/O through swiotlb (SEV-SNP, TDX, s390 se=
cure
> > > > execution) run the pool out with enough I/O in flight. On a split r=
ing
> > > > virtio_queue_rq() reports BLK_STS_RESOURCE and the block layer requ=
eues
> > > > the request. On a packed ring virtio_queue_rq() reports BLK_STS_IOE=
RR
> > > > instead and the error reaches the filesystem.
> > > >
> > > > Return -ENOMEM from the packed unmap_release paths too. Both are re=
ached
> > > > from a single goto on a failed mapping, which is where
> > > > vring_map_one_sg() already produces -ENOMEM.
> > > >
> > > > That way every ring layout reports the same errno, and the block la=
yer
> > > > requeues the request instead of failing it.
> > > >
> > > > Fixes: f7728002c1c7 ("virtio_ring: fix return code on DMA mapping f=
ails")
> > > > Fixes: f6a15d854986 ("virtio_ring: add in order support")
> > >
> > > Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >
> >
> > Even if I'd like to see this merged, I'm having second thoughts
> > because it introduces userland visible changes in some drivers. Are
> > them acceptable?
>
> I mean, fixing the kernel for the userspace is kinda what we do, right?
>

Yes, but changing error codes returned from the kernel to userland
always reminds me of this old thread so I wanted to give a heads up:

https://lkml.org/lkml/2012/12/23/75

Now I don't think we're in the same situation, though; probably no
userland app checks the actual errno in these operations. However, the
userland apps are not limited to VMMs; they include actual subsystem
users that do not know the backend is a virtio device, so the base is
large. If you still think that will not be a problem, I'm totally in
:).

Thanks!

