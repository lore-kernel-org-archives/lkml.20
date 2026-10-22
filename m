Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677099;
	b=vLoUbk3t3on1jYDay8SLWE9USqX9Cvr+LK0S7PFCfz4In0DmDz+rOXd4N8ML9LlwlLNG
	 6UH2XG973mvtzTkl6W3ETGlfzndsd4yBlLJweOmxwiGcCTYttfteEibts8b5/j/OOsf5Y
	 o+ols4DgjqozgNoofI4VL/Y5gbQ6JWMEZwy2VWC2TbaIb3zkKeTUBVqGxDrjKxsNLkGiQ
	 ValOQkPNEpeDKo8D+RRJrUHAauaDOVF68g7IghlQ64IgS7FW5X6XAuqASjLym6wUAZ/wI
	 S/a6RI5B5+Si9C2X+9Y1Ufe+H/gZ3lf+FPAW1R41jLE1ejaVQfPHu9JVYoRxyFNRzTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3AMzmTxZ8irr3o941QbW5F8QIQhOchreftiX6DcpbdY=;
	b=W2or4Q5A7wY+wrQk9YD2maVLs0VQjZS03/r7sMJaaTkv4V6PGgsK2Iy4Io4V56+fUab/
	 hSq/s7zdt8fHDJrhrlnXcdaqBxVovmfUtKIpQvzf3d6F9Mt36hVeQNA0z2alIdJkxi4O2
	 pYGv7jrg/2LmsCDErwrdr0NLCQvsq5qChUEy1E7c4Jkhn935KDDppyj30gi0N5QEyvnoE
	 09Eq5zX0TwBfip75Rm9SeSpab1zgsYJKTRxHAHAZY5GpxgVAzOAW7+PPEVTGoatGpeQ4r
	 vSW9RQI7bnDmKTCoI2R1NdDrriAt8hCyh9qxN7tK2lApmSFlJ1xdXEGd6r76+1Vbgww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=P32fr4BZ;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F41B606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F41B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=P32fr4BZ
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8726acc5eadso17260887b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792677098; x=1793281898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3AMzmTxZ8irr3o941QbW5F8QIQhOchreftiX6DcpbdY=;
        b=P32fr4BZjij+rD5LraykhzhDfK+ay3sYhjxH/jlCUBM+aixlrMyW9mHNIwV5haFGQv
         7R2DpV0fqFMUpQMQ2mpn2Pg/ayPsrBt0rhnSNesomauMzfy9DyTdSGB96zrhDCgdx9gB
         tSdkrzanKtOPXnR1D0GrGFYGIalJdtcRiZ1b34R3VLSBpxanlQ7jCWxgT6tg7Q7YbukY
         cK2LRg0NuIiwKnrGlBqm6PDXCQSesSoxpTfXiJW5lUoDx8iWEa+BUdE41Swxqb9sCfmr
         2Re9+tZCoz8Xhp3h1tS6jMPVLDqHAUNI9JIuD0YRtnzGCfmBb3lb9pjeuiMe59olYDn4
         nGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677098; x=1793281898;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3AMzmTxZ8irr3o941QbW5F8QIQhOchreftiX6DcpbdY=;
        b=I7zPekkIB0v5K+l8XkgS0iGxXIBjSUV4tELxCF+gLWDtORoP/qBy/ZIBa/sbo6KHnE
         4gE7A0Czz5c3NRRn9Zt9MkSnHL3NpdClYLfjQuUjLu7POoYs+eyM1BDGi55O4uS74KMO
         6Md0NLODR5HkQw15Oh84X9y7fTj6+Xw68u9L5Biq6KkHsqreiA9trtPtFQXcJ72MKzHk
         XeXo+loVB1GazNI0k7iZD1N6dOD67H8L/5mdQ9GDeGtlnLM4543lVoXkXasc+63LTYZo
         NjdEMtO+29XYasX0rMeY7p5DGt15j3kuKuUz5zdqDwrTt8zHdYrYuVk9IpU/soKq0P0o
         pTEw==
X-Forwarded-Encrypted: i=1; AKwUvBzDCehdeJ7L6NReE9FmPAdU3jN145nwnd+mAC4iqne3wl+WQBN08GBt/FiGm3uK6Ty7Xi2tE6tGslTFb1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaXFIRVdNuLHSowOyDVVmv/GDyKGRtQ+WwoLcP4HDikACtoMx4
	Tp0REt7rjVgXR2qCzmLUytHl51aVT9fjAUgm3Jn3bqZ2GKHlk4y9bq6XomaSAAQzfNGHCNIyKZz
	ejwzwpA==
X-Gm-Gg: AYBFou3WuNF0g25x506EmPtbbboI90nGlATaqdLgMivqHBI9FQyDJi76GXaBBg9zBnd
	utkByPzX5MSBDb2SB7q43mZa2Q3Yj9J2bhXECjC5xnul8GHBE6j+rf56rtur79UxDWs6bJTMeuF
	MZb7uUW4p9fl7gtL6+xxHr9WuSXaCn4GuqvArS9pVdVmdiWBgBFmlFZ6cUhlK19fKcZQHj4cGnB
	GDibam1g4GDhHnUdw0ezTeWXVuIDFKdBvXj6XXmsKmKzULw6zyFHiYG0LMCPB5n2J7dp28tzRWF
	tN6l/yKmxtdQp2t9XBprvYWL+ZdMJ+ic8yrBFhW+7b8Ix14hq/VeYZVYmtNbJI9FWpwC35bXk3h
	TV0aRyY2aSsFVy9sWaba9pAfvy+FORDhkExMYVJivL8VdtCMPN58lYJeZI3kdYmN+dRxOBSccRY
	82E7TcAHu1sQ0h84cCqq67N6yqbWbqUONZoACMdCM0iMMJ5YdcgsrtrqRKqjD/b53WyyZjxBB0h
	Sks+bhL2vFpm7Axi79/7gFLnRjt+SYLNhbtipsC1UIps3iBUhi+vQSmsfpFTo/hHIpQIe9YJx/3
	wXM=
X-Received: by 2002:a05:690e:4090:b0:66d:112b:769 with SMTP id 956f58d0204a3-67a0e02c93fmr2630941d50.1.1792677097897;
        Thu, 22 Oct 2026 06:51:37 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a0e185441sm2707787d50.3.2026.10.22.06.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:51:37 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: slava@dubeyko.com
Cc: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hfs: report errors when extending files with setattr
Date: Thu, 22 Oct 2026 09:51:33 -0400
Message-ID: <20261022135133.1411613-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2b9ea598558ed4b7dd25eb26a05f6667522c3afc.camel@dubeyko.com>
References: <20261021145627.288953-1-hengyul@cs.unc.edu> <2b9ea598558ed4b7dd25eb26a05f6667522c3afc.camel@dubeyko.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Slava,

On Wed, Oct 21, 2026 at 02:22:41PM -0700, Viacheslav Dubeyko wrote:
> I think now this code [1] becomes dead. And we need to rework it:
>
> void hfs_file_truncate(struct inode *inode)
> {
>         ...
>         hfs_dbg(...);
>
>         if (WARN_ON_ONCE(inode->i_size > HFS_I(inode)->phys_size))
>                 return;
>         if (inode->i_size == HFS_I(inode)->phys_size)
>                 return;
[...]
> It will be great if you could share another patch with the fix.

Thanks for the review. I made this change and ran the whole xfstests
set, but the grow path is still reached. The WARN_ON_ONCE() fires under
fsstress in generic/013, 076, 476, 650, 750 and 795, every time from
close() through hfs_file_release().

It comes from direct writes:

1. When an inode is read, phys_size is set to i_size, which does not
   have to be block aligned, e.g. 100.
2. A direct write does not go through cont_write_begin(). When it
   needs a new block, hfs_get_block() only adds s_blocksize to
   phys_size. A direct write of 512 bytes at offset 512 makes phys_size
   612 and i_size 1024.
3. At the last close, hfs_file_truncate() sees i_size > phys_size and
   calls hfs_write_begin(). cont_write_begin() then zeroes
   [phys_size, i_size) in the page cache, which overwrites the data
   that the direct write has just written.

So today this path loses data, and removing it would only replace that
with the warning, while phys_size stays behind i_size.

The issue can be reproduced with:

    truncate -s 32M hfs.img
    mkfs.hfsplus -h hfs.img
    mount -t hfs -o loop hfs.img /mnt
    printf 'A%.0s' $(seq 100) > /mnt/f
    umount /mnt
    mount -t hfs -o loop hfs.img /mnt
    xfs_io -d -c 'pwrite -S 0x42 512 512' /mnt/f
    umount /mnt
    mount -t hfs -o loop hfs.img /mnt
    od -An -tx1 -j 512 -N 512 /mnt/f

On a804c5742bff, with and without the v2 patch, the last 412 bytes
read back as zeros instead of 0x42, and fsck.hfs reports no error.
With the cleanup applied, the data is intact but the warning fires.

HFS+ has the same problem. hfsplus_file_truncate() has the same grow
path, and commit 5f63ac80aef2 ("hfsplus: fix issue of direct writes
beyond end-of-file") only covers writes that start past EOF. A direct
write of 1024 bytes at offset 0 to the same 100-byte file loses 924
bytes on HFS+.

I think the direct write path should be fixed first, so that i_size
can no longer get past phys_size. Then the grow path really is dead
and your cleanup is right. The simplest way I see is what
fat_direct_IO() does: if a direct write would end past phys_size,
return 0 so that it falls back to a buffered write, which zeroes and
accounts through cont_write_begin().

Would that be fine with you? If so, I will send that fix for HFS with
your cleanup on top, and a similar fix for HFS+.

Thanks,
Hengyu
