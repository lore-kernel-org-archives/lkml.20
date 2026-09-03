Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F53B456296
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423422; cv=pass; b=Xx+/eLNIIGbEWcVwMY0iItQ0iaoojQ1cNRu3PujZLHQvAT1DAF1QyFYYZq+DSECXCbl4sxkx0c+0XtqLY4zhc49/nAyC+CUsYLShaS+hFlb/gj2ojsdp+8HIypU8EIX6pUGtKkLKpN3wuQdeGZIPkzD84dm89dyX8ijd8nzTpsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423422; c=relaxed/simple;
	bh=F/nYNZsGTMxhWzzvUohFY6Whct0y3BXt+FoFwDELyu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MElYt91xbM3kQ0To/tmOMCN6v83wTZAD6UFBsxcAaRThshg/bRHODM/6N769H2YmAPE0kPNrzmrC03Dcg7JtdawZ3LoKzSXdS6Cb5oDTl26M/u/5pdUH/RTp8lMHu9RX+xBgdXUOqVMDby5tfxBU0VDFINYamQPvyDlJ8kuKysc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gfe6uM40; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bMr/RUT6; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gfe6uM40";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bMr/RUT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788423419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qBi2OGA1RnDTo2IDvDX78amvRnsBN8dzg7HrP+xghMc=;
	b=Gfe6uM40N3YJqAVsgZLHyyE1yP8ecjD25+s14EQP7H5TWLrfmeYis6IDizVdLfSPQ5ZIQr
	Nl68bPnShY/UGPt66mEQGPT226O1INoBFv25obA+o/B/PIbu3jghAYkKDfzndAdVbCYqJG
	+SXfXn/Oi64hvc7D/K8axC8Qn+sJF/o=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-d-_hpLr9M4epJhGp_bmDmg-1; Thu, 03 Sep 2026 04:16:57 -0400
X-MC-Unique: d-_hpLr9M4epJhGp_bmDmg-1
X-Mimecast-MFC-AGG-ID: d-_hpLr9M4epJhGp_bmDmg_1788423417
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7f5b54da461so34881527b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788423417; cv=none;
        d=google.com; s=arc-20260327;
        b=jPZU2SHrMvZco59khaLY/ykcF6NDtYHlj1UfmsE/Fxy6GvRj/XIB1PKyn3JbZRPIXV
         vecUgZyyH7YuIA7MPDiSz8QHkdHxRktGicLByTXSvh0PxNWinAPs7pazIyiGvRvDOeWC
         FroUQ5vbdi0xc1Yvvc1/R/iYTYx0Y5IVl/EABuurhuvuG47qdJuk7kcasSfUxXZYbMXZ
         +UlN2uClBX/9aQ6U7yg/T2Yx8iry0W2Tmnz4MlVt9C5OtiyDrrH/vPXGi74jyAZtGKmG
         mUjDmZ3dRqcShgLo9dg46lzdpRbsalMF7/m51HNd3rbelTWqHjd2EAuKQBALXFOWgF0I
         Fz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qBi2OGA1RnDTo2IDvDX78amvRnsBN8dzg7HrP+xghMc=;
        fh=nJUm9Pu88qclDfvZKJC2bAiEAzqFJGAa3zlxErPGXDo=;
        b=Po/pwsP6kvL09zwLRm5/i6eyWyHFDjuCmU82nRhNI+WGWYz653NQtiwZt2LV9hqxRY
         Or4p7C6un1Iip4pqIs+o/qkXH1rz22LDeZTd2h9HBLXTttpDRo1WRAuRBUoGIzS0IL92
         he2aGBrEwc9OJDw41lS3oQ3aJj6Fdo0mjAsj+imxf0H8QouXkNQV3ETRIWnOg5KC9LEu
         Bv6UN6nHOPtYO6ERV2gyximZ8rU42Qjboj+sbTVs7UjWIaOYqC/AYTygtwPJGXi8d9T/
         CVxU1HlZlV6lDTzAGXKzwLbxWGJXdhMV+s6bzPGyzKCJL+bTMDu+M+OTgmVQNecHGcCW
         +V5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788423417; x=1789028217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qBi2OGA1RnDTo2IDvDX78amvRnsBN8dzg7HrP+xghMc=;
        b=bMr/RUT6sudv7eF7yIWR8lLOOn0XMlXatWVhZa0fwlU/gTmc1qr88+LmrFzA60nTaO
         9p/pmbfs9haRuQWvKHTJqWPnBA8nse32ZHe5xfL7HiRpi8izSRYVCmK7OTMHWehKO/Ra
         PkJPiqCwX7GFyv96+S2w7S1v3AbgHhkIqPoikpLrv0T4CAG25AWVJAHnqfsGrClHpEfY
         4DeYaImg0HZNK4QKKdiCnVrAZB6g31oyGy+cUT6/f+ulkU0dEFuaBb6id07Gq0M7ND9R
         Yjpk79BzSCtbqlt6b4UvwIN+X16jm6QGJhBT5UBE1l2+F5xiBW2K9TF/OCTdyXMPy9e1
         Wkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423417; x=1789028217;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBi2OGA1RnDTo2IDvDX78amvRnsBN8dzg7HrP+xghMc=;
        b=mOohmYi5t6v8TUXO0UX6V37vWC2qIHkRnsV3w+Vg6vKZ1crdZeoBwq6yCzuVmQfpW6
         TpAfVJji37CIjJuCVbe+xHZbr116ZsMrps3zCSheIMdKF2g5tsxiud6ZFoXTNxTqIjFy
         +7cx/BXfjHP9WDsHJJoCnRQIK3NdqIuz4i9dKMgIQcO41WQuoryoXnHqef0AvQ4Zg4KU
         DI4hfs9wuYpJhJc2IJJ6aLLp2Q5iof7uDHQZJFXDv/1rRM6376G1TKEhchN3+lJ45tqF
         OacYMetq2iWD0cGhvCorrXJUIqQlA6Hn6BNh/cz20lW2GmE82rmf0qH1UCmcU/gWH4uh
         +eLw==
X-Forwarded-Encrypted: i=1; AKwUvBwoRTZNlQopqrPHEjAWbiAdo3EzzP05PeS73HU8NGoae6TnniVQiNNM14TNQbzb6fktZMoAtb4ZNTfDRMI=@vger.kernel.org
X-Gm-Message-State: AFuF++mMQ9FNQz5Yl3ulPa95xEMeN9f9p9G5A8GXyKrnRNRfYytedW0S
	vQ3GCSZLSx+6/35Iumc9W/T9Pprmgllc7zVymYuurhp9zJpfqSgNWTom46QDaTk84ORQhZjmcIN
	9mdDSizIgiCq5lua6jTzRzkgXK4BuiPjVg4hPGEY/3yY/SmQAlvw5Xf81XR1TfUPYR0zppU1xrW
	DVvZHSCboX5tRXQmCx7b1XBR0y5GHHWU+UUnCSLtWLLgQvPk3r
X-Gm-Gg: AYBFou1zY56zYd5mcR0Nkl83vKHLaorA8E6yfsN/2nZV2nQitOry37kEAXNzqWI0LSx
	tc23YkQyZFqPkSPdmNB8E8vR7RmI11tXcSzAxPNtAYHb//b/HiXowhRLTb0iB1Cev560DJpgBZf
	yzZoWH233/zcq18CNw1Zfp2ogRAzFvSTlvjhUwUA+WU7o4BzBkUAzFTXt2NSBBF8N7Uis7nv5y1
	FBMQNeMguPervVDbsm9skcGNS00PCs+dVz52plLcD214fjYyHOu32h+DOw=
X-Received: by 2002:a05:690c:e18e:20b0:834:fadf:6085 with SMTP id 00721157ae682-86c4e201d3dmr40719367b3.4.1788423417307;
        Thu, 03 Sep 2026 01:16:57 -0700 (PDT)
X-Received: by 2002:a05:690c:e18e:20b0:834:fadf:6085 with SMTP id
 00721157ae682-86c4e201d3dmr40719117b3.4.1788423416899; Thu, 03 Sep 2026
 01:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902092459.1983909-1-eperezma@redhat.com> <apgahfkAdwYcu_5a@sgarzare-redhat>
In-Reply-To: <apgahfkAdwYcu_5a@sgarzare-redhat>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 3 Sep 2026 10:16:20 +0200
X-Gm-Features: AcwNN1U8Cyero_j5_fzuPGrKVCe3JL9kEPdI4kDTanDts-9genlh11Ba6z-3HwU
Message-ID: <CAJaqyWcQic2mRTPaXY+jt5Dscvsf4XQ659NNnn+pbaKGmKu0Tg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_virtio=3A_add_Eugenio_P=C3=A9rez_as_Maintainer?=
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: mst@redhat.com, Jason Wang <jasowangio@gmail.com>, 
	Laurent Vivier <lvivier@redhat.com>, jen@redhat.com, virtualization@lists.linux.dev, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 2:49=E2=80=AFPM Stefano Garzarella <sgarzare@redhat.=
com> wrote:
>
> On Wed, Sep 02, 2026 at 11:24:59AM +0200, Eugenio P=C3=A9rez wrote:
> >Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >---
> > MAINTAINERS | 6 +++---
> > 1 file changed, 3 insertions(+), 3 deletions(-)
> >
> >diff --git a/MAINTAINERS b/MAINTAINERS
> >index 3a19da74d00c..a92c5712d8cc 100644
> >--- a/MAINTAINERS
> >+++ b/MAINTAINERS
> >@@ -28877,7 +28877,7 @@ VIRTIO CORE
> > M:    "Michael S. Tsirkin" <mst@redhat.com>
> > M:    Jason Wang <jasowangio@gmail.com>
> > R:    Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >-R:    Eugenio P=C3=A9rez <eperezma@redhat.com>
> >+M:    Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> Should this be moved up before R: entries?
>

Ouch I forgot to reorder this one,

> BTW thanks for the effort!
>

Welcome! :).

> Stefano
>
> > L:    virtualization@lists.linux.dev
> > S:    Maintained
> > F:    Documentation/ABI/testing/sysfs-bus-vdpa
> >@@ -28954,7 +28954,7 @@ F:     include/uapi/linux/virtio_gpu.h
> > VIRTIO HOST (VHOST)
> > M:    "Michael S. Tsirkin" <mst@redhat.com>
> > M:    Jason Wang <jasowangio@gmail.com>
> >-R:    Eugenio P=C3=A9rez <eperezma@redhat.com>
> >+M:    Eugenio P=C3=A9rez <eperezma@redhat.com>
> > L:    kvm@vger.kernel.org
> > L:    virtualization@lists.linux.dev
> > L:    netdev@vger.kernel.org
> >@@ -29009,8 +29009,8 @@ F:     include/uapi/linux/virtio_mem.h
> > VIRTIO NET DRIVER
> > M:    "Michael S. Tsirkin" <mst@redhat.com>
> > M:    Jason Wang <jasowangio@gmail.com>
> >+M:    Eugenio P=C3=A9rez <eperezma@redhat.com>
> > R:    Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >-R:    Eugenio P=C3=A9rez <eperezma@redhat.com>
> > L:    netdev@vger.kernel.org
> > L:    virtualization@lists.linux.dev
> > S:    Maintained
> >--
> >2.55.0
> >
>

