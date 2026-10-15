Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8C027057D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093533; cv=pass; b=q0X4IhHo4Xr6RL92QNOXsM370rxWPqhDokHC3EktZsrZpJoASjyFkdE5OCtC6JN9njd+x0VBHJUTMZEZ16S0IutXAyH1HiYtV0dln+i9N8Pt586LjmsFeEkGJYmMoKwDm/VtJN9UhU6y7PJFnlGcoscFtGxrnx+qxmEDE1Um928=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093533; c=relaxed/simple;
	bh=rUeS/xuQsA6DpulQ5gLZTPgWyt3PFheEdxPEtDmQpAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Azy+odd+uQ+2CG5fKfzrCO60KQZ6DQBhd1enzvZsxx+ejDpghcYDRCwPxESdbXij1A3Mjk5l8BFpIOShzFf9ImlMugIl21YNfv2noqZvi8mo7WTE9hUa/T2X3Y1WPntzBIiZUapJ1VgYX31ruZ1oOKoC+qTx+pkQq9iBmxMavlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CkeK1Meo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YStH/6zs; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CkeK1Meo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YStH/6zs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792093531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e/jCg/YDFTxo4rxhpppNdODIDqzYkL4lcpoJNVladB8=;
	b=CkeK1MeoZkoVWk+LxXD4mCT3yHaqcyKdBCdT1ffomQdBX4UfZhcZTVPoGhW+FMdnguM2Iy
	PCDD2NFy1dUMi1xARwIQYeCDsv/OLotbJafeYunB+DoYlVmiNjf3J90vwM3PV0AvID6mIe
	qyU8z5yeOc8YpnRPTzu/8cfbPa97WYY=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-bpUZ_YC2PvSxxo0Ou93tiQ-1; Thu, 15 Oct 2026 19:45:29 +0000
X-MC-Unique: bpUZ_YC2PvSxxo0Ou93tiQ-1
X-Mimecast-MFC-AGG-ID: bpUZ_YC2PvSxxo0Ou93tiQ_1792093529
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e93fab204bso2026296e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792093529; cv=none;
        d=google.com; s=arc-20260327;
        b=Bvc6Q9tuP6ehU6cpo15yBes+/xle08YsIaU/Q1gNO1xoPUibMdwXh8EZ00+7+we0S8
         8z7GFXoe2Vz50yMBu9nSN2vioazrM5oCSaLiwz80oinXt4vKPaCELxc7BSTYyjCIdeAs
         YHD0psHoY+RGAW5tJXAiiz3TIBWEw5R1RA4ir7Rl+D18BzKUMGPemUZ6RmsPeXxAlHZf
         rbKfvwwY3hnymPimhzGzIVJEFQy5aBxiIJ4CFnBc/2fNEEaBi+Mp9450NYXv5jwgPUTZ
         W17Hi8IEdy/9ChfBBZ53/isJjoIk58dKds0nPt8RtzvKqmQN81KgYzvrqWVZrFMjd3we
         Fnbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e/jCg/YDFTxo4rxhpppNdODIDqzYkL4lcpoJNVladB8=;
        fh=lRTiKDoHv7aKbq8ixKkKn3wdXdB5AQOOkvNmxS+WScc=;
        b=hnERGzas+gdEhJx4hjk67jm7hB+eukuqX4nXINjZDeKomFEfU9w79XpW4jwOKW61ck
         q9HiheZSw2wQqIkpgp5oCxnxxS2eiq/FFgC7iLyM+VjHZ1pBdQJgoK22ay7CHKhU0Cqn
         esjnSQe2JnN5QGRkbu70kGzua5V6B/Iw2BpvMLW6+mG2YGY6vbdFKP33ljzLKgCifK3i
         AzQ36BDR2KeNaJkBHt6+9MeZbIXKlFiWLRNMGz17dpUqF74q+ITqL4K1IKIxbI8+bd8u
         mHCUtO74Uy2WTI4T+Sv9OaADhDSe8VB/3MHpPQ/RKI/iUl2bnSABV/5h0sz39uWbBpRl
         TQXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792093529; x=1792698329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e/jCg/YDFTxo4rxhpppNdODIDqzYkL4lcpoJNVladB8=;
        b=YStH/6zsrUgqq738WWc3YwiFice/4xeIcv2E3LZpYhV3u8nRzceZ9RkXTR3OnHLQQW
         EIS+7Pi6mVZggvRQdvdDfovtmpiBH16/tjiZzWDLFWv30I6z6EwsBNrcXG3Ag5ZiCBtS
         Aj/Pn/bxEL1ok8uDMMRxH8pdJTIJJM44L/XMS3sg24yKdPiytGTngO4wDZaimU1ULBYc
         qgsXaHT1DV/eLLd6PoEHtwihMKS11eQvQYPesrIXr+K/lWy9wRKgolFLJBXLlTj7jnT5
         4KQlI/FJ9X7uTRPWWNAC/uBV53+8BL3EVxILBcxuBFhoOq5XlxBMJ64MEsPP/Jy0BI52
         dbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093529; x=1792698329;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/jCg/YDFTxo4rxhpppNdODIDqzYkL4lcpoJNVladB8=;
        b=QZY+01w+mZxuugZQL3ELG7J2AgLastWJoVC3UbvCX/jrmJJRKM/NuueD4VXEsgc6up
         fA874SjLD/t8RzA55EBt2HONxGFSEZY7ImyUV8+1Oj+aDCWNCMADlMjjIKdSKtaR8PB5
         Z5hjpC9vZgoNRnPlFzQQ0PgIe/kd2FWFAm93jXG/xoJBBWMQljfwY373+OlDD+K77d4d
         aLzqbepHxTU6ji/8KfWHREPznpomZa77vgxbRtiq3iGbbc5WRZQfdcR4pKxG2VD9CG0b
         ohz+lx2JE74n6qHtLauAQu5gswMWHy39cib+uInegvf6t+M2KMQ+8IFo6x+r1G4ruVHM
         fu8w==
X-Forwarded-Encrypted: i=1; AKwUvByzg1WqX211v9Zsp7I4jJscrGIWMRbCM7t2Fq4g0dy3+CTmnZlj9ysHtFRW9dBeSlm8iyUM5AFBTBdkOU4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJIk12aTEDSEbhkVJhhcDEmK8TN9cyPjspdhE+W+BF6y0OxvqK
	n5Armw49NJxeeY22u6b+0/1wB5PCB5IKE06L5H8ejk53w08DYuK3CSYGCdzzl1IrXLeuiBwcLyA
	KfN5FhCXNy7ULPv+VZqsCxf7fNVjq3R2x2bETPt/mt70IxcXYlxKb55s5FbW8NbQP5QXR2uVl8B
	ht7cUdcfy7lnP3oqCVc/sx9QJmQ24H324RM4TeYNma
X-Gm-Gg: AYBFou0bgEXJ6exKSqscY0bwb2mImKsTkpj9kmY4sFxCxQD2uFtVvLS3H0Mo+e1Ds+T
	PsXdzhKMSeRyUqvqUl1tGiZBYCXxuC2UPXBj7NUQ/pB5Ks8Og3s56uQM0BwrnbaFB+QC5aXzHQA
	4V4g1EMQWf7/zn5gVKPcUESynsEiRhkuG7MILkQQtL4tVjBjtUvLEsmtC01radTlNPHK8C68AOp
	Y/UJZ6jgD+IV10w/yopxknidm3PslC9wY/sZvi9Zmy2dgk99JgrYG4/LFq8GmYBkLlwLWXU+ln1
	cTSDjBJVnc4ko/6b5sKht3Vc6w==
X-Received: by 2002:a05:6122:3d0b:b0:5e6:82ca:c551 with SMTP id 71dfb90a1353d-5e91f591b44mr7262723e0c.22.1792093528999;
        Thu, 15 Oct 2026 12:45:28 -0700 (PDT)
X-Received: by 2002:a05:6122:3d0b:b0:5e6:82ca:c551 with SMTP id
 71dfb90a1353d-5e91f591b44mr7262713e0c.22.1792093528527; Thu, 15 Oct 2026
 12:45:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a01d0a297a3e174d21741a3ad586ce546327603e.1792081664.git.amarkuze@redhat.com>
 <20261015183548.GE2170687@google.com> <CAO8a2Sjr6XSizdgobZK1ZAO8PUd5tCDFKjdD-=3TXHwqOU6qfg@mail.gmail.com>
 <20261015193800.GH2170687@google.com>
In-Reply-To: <20261015193800.GH2170687@google.com>
From: Alex Markuze <amarkuze@redhat.com>
Date: Thu, 15 Oct 2026 22:45:16 +0300
X-Gm-Features: AclHuK-i9Hsh1nRovFHiSF3i8Hp7Cu5cMuuh8GOgLNjfxQfG6bb774db-F-FpUQ
Message-ID: <CAO8a2SgiFTarbcg-qgTLgjk1RsOMLwHsjj9ko8HgT99F1DAYrg@mail.gmail.com>
Subject: Re: [PATCH] fscrypt: allow filesystems to disable symlink target caching
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-fscrypt@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubo.li@clyso.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I didn't want to conflate fscrypt patches with Ceph features; arguably
two distinct patchsets.

I will CC you folks when this is acked then.

On Thu, Oct 15, 2026 at 10:38=E2=80=AFPM Eric Biggers <ebiggers@kernel.org>=
 wrote:
>
> On Thu, Oct 15, 2026 at 09:52:11PM +0300, Alex Markuze wrote:
> > Hi Eric,
> >
> > This supports the concurrent CephFS subvolume quarantine series.
> > There=E2=80=99s no Fixes: tag since this isn't addressing an existing u=
pstream
> > regression.
> >
> > The quarantine series adds checks to Ceph's ->get_link(). However, if
> > an encrypted symlink target was cached prior to quarantine, the VFS
> > bypasses that callback entirely when following or reading it. While
> > the target data is still valid, access now needs to be denied.
> >
> > This patch adds an opt-out for symlink caching and enables it for
> > Ceph, handling the encrypted-symlink case for the concurrent series
> > without affecting other filesystems.
> >
>
> That series wasn't sent to me.  Is it
> https://lore.kernel.org/r/cover.1792074165.git.amarkuze@redhat.com/ ?
> It would make more sense to add this patch to that series so that they
> can be reviewed together.  I can potentially apply a prerequisite patch
> by itself, but we'd first need to know that the rest has been reviewed
> and will be accepted too, otherwise it will be unused code.
>
> - Eric
>

