Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792784384;
	b=zTx7xUXfEOsCIHleGqZCGh3RVYWzL6UdksG0Hf5ECOCfGi6Ak1TvhniaAZ9XVFSwGFAa
	 zrSHhMy3aMcwp/MJI9Eqh03x2FYnkEx+A3UVUAApefYS5/IdrNxxI/n6EjfbxnzspvMXj
	 9wkePlYV/RomzCRARzoWpUOfxavvOVJZ4OI49BOq6RaepnTAJzqiKvCw/fx0lHCe7pVhB
	 tR3AcXFJDAVdI/5BgzL5w9U8RjkGrcx7BNW4/X55/nuif5PAPjyEzudE4FQFsMcAsF2Hz
	 MHCP+eK/+A4hJs/H99i+iFVBgtWbpG6HvDoyivab6b3rUjGoeh3MN7yxl7EOImFvZOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792784384;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:cc:Subject:
	 In-Reply-To:Message-ID:References:MIME-Version:Content-Type:
	 X-Scanned-By;
	bh=0w7Gf4V9E2/V9Ge6rh5KvWtKWl5n9KaVAz45Uh9avvk=;
	b=KPvZnONeYp1KXhBBlG6aurM5s3OsTH4FykPNaRbTLQM/0udjRHQ2euPZ1V4bTtEdB1Wo
	 7nHHzjyw6rBG9/60VRR+hGizl9HFFXpCnuA4vLks9RirnJsHTxTdGAG5YncLma1ts2nPX
	 SAoOxK1blcdOJYkqvWTTcA62wRnf/IFkvGL/U4ODu6zXnsqfZwzpDYyT3Q+XZW2y6jJuq
	 LEKM/oGhlZzBj6DFBnsjuF70lNZ+NSRGpD0EkjGICQbca8glNZDXdmV+EvnDvIHzuN09/
	 k/EqBdtO0vYTwekobJOL2iAt7lAe1LAC2jfbsMSXi7NX1+lgLxPrUYCDuWI6rVugLRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WcLNu746;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C389F606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C389F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WcLNu746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792784382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0w7Gf4V9E2/V9Ge6rh5KvWtKWl5n9KaVAz45Uh9avvk=;
	b=WcLNu746Q9Wh//n1LaJq0GtAVIK0JyATYlihqv2JfVTJ4r7CGudNIn2nQvNb8ZklX85XOU
	wr43hEM40VQrxmgY6Apb654OLPL2sds5Nr8Ysy6XRKKtrowj5VDOi1PHu979kBpccUCLwo
	i5xaH5bBHrfCAayY3l7dWsvXbg985ho=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-286-XTKz3rlAO_aS3qXsgbEwPQ-1; Fri,
 23 Oct 2026 15:39:41 -0400
X-MC-Unique: XTKz3rlAO_aS3qXsgbEwPQ-1
X-Mimecast-MFC-AGG-ID: XTKz3rlAO_aS3qXsgbEwPQ_1792784380
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D84C8195D010;
	Fri, 23 Oct 2026 19:39:39 +0000 (UTC)
Received: from mpatocka-thinkpadx1carbongen12.rmtcz.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 635DF3000723;
	Fri, 23 Oct 2026 19:39:38 +0000 (UTC)
Date: Fri, 23 Oct 2026 21:39:35 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 0/1] fs: remove hpfs filesystem
In-Reply-To: <20261023151850.96475-1-breno3011alves@gmail.com>
Message-ID: <39b3990b-fed4-4b45-8819-88938901e57c@redhat.com>
References: <20261023151850.96475-1-breno3011alves@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi

I am still using HPFS. I have some data on it that I share with OS/2.


On Fri, 23 Oct 2026, Breno Rodrigues Alves wrote:

> The HPFS filesystem driver has been orphaned and unmaintained for a
> long time.  An RFC on linux-fsdevel stated that HPFS is about to be
> removed as it has no remaining users and is no longer supported on
> SMP or PREEMPT kernels.

This was a problem back in the kernels 2.6.*. I fixed it long time ago 
(see the commit 7dd29d8d865efdb00c0542a5d2c87af8c52ea6c7 and the merge 
7f4238a0ef8858e1f9b02a874b5818f6e9846673).

I am using it with SMP and PREEMPT, it does nothing weird. It just locks 
everything with a per-filesystem mutex.

> Recent vulnerabilities (e.g.,
> CVE-2026-97486) further highlight the lack of maintenance.

This is a regular bug, not a security bug. You can't gain unauthorized 
access throught this.

Mikulas


> This patch removes the driver along with its Kconfig entry,
> documentation, and CREDITS entries.  The HPFS_SUPER_MAGIC value in
> include/uapi/linux/magic.h is kept for userspace ABI compatibility,
> and defconfig cleanups will be sent separately to the respective
> architecture maintainers.
> 
> Breno Rodrigues Alves (1):
>   fs: remove hpfs filesystem
> 
>  CREDITS                             |    2 -
>  Documentation/filesystems/hpfs.rst  |  353 ---------
>  Documentation/filesystems/index.rst |    1 -
>  MAINTAINERS                         |    6 -
>  fs/Kconfig                          |    1 -
>  fs/Makefile                         |    1 -
>  fs/hpfs/Kconfig                     |   17 -
>  fs/hpfs/Makefile                    |    9 -
>  fs/hpfs/alloc.c                     |  582 --------------
>  fs/hpfs/anode.c                     |  498 ------------
>  fs/hpfs/buffer.c                    |  232 ------
>  fs/hpfs/dentry.c                    |   62 --
>  fs/hpfs/dir.c                       |  331 --------
>  fs/hpfs/dnode.c                     | 1095 ---------------------------
>  fs/hpfs/ea.c                        |  368 ---------
>  fs/hpfs/file.c                      |  276 -------
>  fs/hpfs/hpfs.h                      |  579 --------------
>  fs/hpfs/hpfs_fn.h                   |  379 ---------
>  fs/hpfs/inode.c                     |  318 --------
>  fs/hpfs/map.c                       |  335 --------
>  fs/hpfs/name.c                      |  114 ---
>  fs/hpfs/namei.c                     |  621 ---------------
>  fs/hpfs/super.c                     |  789 -------------------
>  23 files changed, 6969 deletions(-)
>  delete mode 100644 Documentation/filesystems/hpfs.rst
>  delete mode 100644 fs/hpfs/Kconfig
>  delete mode 100644 fs/hpfs/Makefile
>  delete mode 100644 fs/hpfs/alloc.c
>  delete mode 100644 fs/hpfs/anode.c
>  delete mode 100644 fs/hpfs/buffer.c
>  delete mode 100644 fs/hpfs/dentry.c
>  delete mode 100644 fs/hpfs/dir.c
>  delete mode 100644 fs/hpfs/dnode.c
>  delete mode 100644 fs/hpfs/ea.c
>  delete mode 100644 fs/hpfs/file.c
>  delete mode 100644 fs/hpfs/hpfs.h
>  delete mode 100644 fs/hpfs/hpfs_fn.h
>  delete mode 100644 fs/hpfs/inode.c
>  delete mode 100644 fs/hpfs/map.c
>  delete mode 100644 fs/hpfs/name.c
>  delete mode 100644 fs/hpfs/namei.c
>  delete mode 100644 fs/hpfs/super.c
> 
> -- 
> 2.56.0
> 

