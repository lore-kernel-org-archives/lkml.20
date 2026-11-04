Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753433;
	b=lo1TvcIQ04ajyKmOiJrJUk6HV7XLYMn9Rm8TqG0uoDyxUx776EXAcIDOcv0vkVKG4yoa
	 r0Wq/O4b1cf9e4M93r2lqeKNlZp6RqScnJe9lIIagOgsGvsJipQ56Fjb+p0M8kHX1XP93
	 Xu0Uw6tQvr8T/Z5ctPsUGzwixfvu5FcNn1eu1gI2wtEwM9CO8iO+x0BhretMEZMWk9c2t
	 F7czMxPyPa1KNpnudRWcWq74xez3bg/jRVY8+QKUz7FjWQ2PbgL+Jr9wyhDBEgD+6VSAr
	 NV9EIR7QctcvKDU50FuM5nWhXI1iSX8M+U91vG2cqaRtNbUzkwfsyu3WK/Qb/Ljlj7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=umzTAMpmM2XXT0BjWwg/HN9i4Q16VzBGEqlJacN1TW0=;
	b=5k/p1l4udvddonwZzKx+zqD+M1LnPAP/h4Gg3kZ8mMdHM+hGnmMSlAI7qGZeUYpeIMbe
	 MCqlsZ0Z3ptEauUjE/EcPvHlzZ6dkh0h0awhfRM0cYfQvUbri6dQGzda9/XlaaPoZ3EyY
	 Q4rcXjHaxbjLJ2+iFByyxHixxqTYYQCxlgZdvdip9qRIAi8X1dDYlSC6G7OngXDV3YxYw
	 5KeOQFCpJERQMHAEAPCMVq0Xd1W31uQi4ija1AQCu6bVZ83XJG6uyZBpPBC4hRkxkxhgI
	 O//hnyE4nhKiFijA8oyR2KWAGhXs8HRuGE+Z4xxsLd0wKbUIPt8PBH7MXjieZUlaokA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VC2exd99;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ADE606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39ADE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VC2exd99
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so15555ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793753431; x=1794358231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=umzTAMpmM2XXT0BjWwg/HN9i4Q16VzBGEqlJacN1TW0=;
        b=VC2exd99VsrvRMmqoBrO2vSZ26xsG/UB3gvQjMBAAh/eIz9DNxFzehOSmUck+5b5y0
         OKFlj4se0No5/ClRl5Ohk5lpxiONvjudA9VVOdqfMa2gRlT38fVi2x1wdxCU3i5wzAly
         pmnGLjRNophq7OiHQ0XsZ/sCK1kv9rvJBYDL7LpgGtbPiZyPzfE5sG4jSQ1s0EUTbfrj
         zZN1qx/1FTipjxbzMrt/MX6l+J+uPCPy5bGJWPe0piNKGsqp1l0wN6rN7QVxOey0xfTE
         zj1QbhPkkGbEZLWSw+OnJ2lrhe2heRwLX6KZVJ2i9nH1i8hJjPitw8aLoSqDlc2lA3iv
         DSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753431; x=1794358231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=umzTAMpmM2XXT0BjWwg/HN9i4Q16VzBGEqlJacN1TW0=;
        b=PCzGSpC6cz2gEO0lC5yHZjBVxnac58MfGoiYyb5Gb8k/Lxxw7hHlCNCrP+U1nMSUjV
         Hofh2pZGCyqv/9ejC9y2wZU6Q5tYBYWNUV3MjeTgDC3yvIkdwebc4wL44DxL8E+/UwfA
         4et+f7MksAQ2uJIymutSsiBjolxRo+5FeYtWmFzitrKAqWkuAlT/0tfk9XOgS+Pm6T9W
         cb/GJ1E1WAoocu6zsyC8yJ67CgxAQi3U8puTYkzvWnCAFPF5V+EJ9yDvJxTxYBRGB0vs
         ek/nWTVtm6x8iFuyv2xIctbgpzeldtCOiLcJ3b2knhfMWfQKM4p3wWrJfXVOL+FGscOx
         cn6w==
X-Forwarded-Encrypted: i=1; AKwUvBwiRAKd4LmZR2uuUAeMG10vnyhQHfbcIPRqo9ftnFFsdlhl4bCXpUQ+7vAE3JGCYko3U8lCVX0N0SEbqao=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Had7Bqz6AV/nRKBZtb0HbjE3UO3I9AHKd/QwqCbhcRVTvF2iT
	O0arf7e7XUos0lB8QgoxdrWz1vkfHdO0ts5GLJivOaAbUcishGrQAUJ1ZTHb3b+suw==
X-Gm-Gg: AYBFou3250EmM4wXNI8MzvIA2MzZbJp2GJfaMUqCL4u8Uon3oLcgASmZN+8DGJEgzIt
	UEi7XXUZPn9cKVSGYaqTaXUbM1OCN+yy2thGUUCrhe3m5IbS+ZT51lsRFfZEuyaW0FMPvRMbzt3
	xPzAlJwi01syePOPc2/ADBODmWoEln/4yFlds/MUwH02FcM0Vqc7KIL5ELUXppbkAwVNoe+BcDF
	p9Xf/0r15jGRcEnS1z77myVriAMA6GZ80DcHciblJxkUSn+kw1kUGnOP919/ebJZjGJmuqrbIe5
	nTb8s5e8dJurGlXgr9Kyn4ulOcxUxcom6tCs9ahf9wQ9rUvilzW4MlsaMi0zeu4s1k3d1sEFZne
	7noTpys2P1BxxrEVuEfUwUPmJWHQzkf4yYenAk3voTqcTuR36rURT1kHPdmUnP2pTJ4QRb2SnC2
	1F3QYrwvcjOCDIhQjvONEHt2Mp12h5ZI4vCwSIewAEIidMy1gt1TCckm89mW3cHdu0l5d5+YKg9
	mZrsRMZOrsalrQZ1rPVE52qrIq6VyzCF+SBJhHhYTsLqeaGtJsiAaK1s9EnHei4/I6CGeI8VzG+
	p9P76YE/423ptWZUdi6WmEeZZPFrZLZrXxlOHuPiqw3mGbLrZuTwONga1ljKGQewDvF1CGmbA2Q
	B
X-Received: by 2002:a17:903:4b0e:b0:2df:42af:2f9f with SMTP id d9443c01a7336-2ed08e69329mr1597975ad.1.1793753430917;
        Tue, 03 Nov 2026 16:50:30 -0800 (PST)
Received: from google.com (210.109.125.34.bc.googleusercontent.com. [34.125.109.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9b0ec5sm6480537a91.16.2026.11.03.16.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:50:29 -0800 (PST)
Date: Wed, 4 Nov 2026 00:50:24 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Chris Wiseman <chriswiseman@google.com>
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>,
	LongPing Wei <weilongping@oppo.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dm-verity: use bdev_rw_virt() in verity_recheck()
Message-ID: <20261104005024.GA1247794@google.com>
References: <18e49db5e159b72d.3137322e32332e3235332e313736.1d9cee.0000sendgmr@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18e49db5e159b72d.3137322e32332e3235332e313736.1d9cee.0000sendgmr@google.com>

Hi Chris,

On Tue, Nov 03, 2026 at 06:50:28PM +0000, Chris Wiseman wrote:
> verity_ctr() creates a dedicated dm_io_client (v->io) for every
> dm-verity target, but its only caller is verity_recheck(), which reads
> a single data block into a page from v->recheck_pool after a hash
> mismatch.  Because dm_io_client_create() preallocates a mempool of 16
> bios and 16 biovec-max (4 KiB) vectors per target, each dm-verity
> target permanently pins ~70 KiB of unreclaimable slab that a single-page
> read never uses (~2.4 MiB across 35 targets on Android, or ~4.1 MiB
> across 59 targets).
> 
> Replace dm_io() in verity_recheck() with bdev_rw_virt() and remove
> v->io.  bdev_rw_virt() puts the bio and single bio_vec on the stack and
> waits for completion, while keeping v->recheck_pool per-target.
> 
> Fixes: 9177f3c0dea6 ("dm-verity: recheck the hash after a failure")
> Link: https://lore.kernel.org/dm-devel/20250423115013.4004577-1-weilongping@oppo.com/
> Signed-off-by: Chris Wiseman <chriswiseman@google.com>
> ---
> TEST (ARM64 QEMU, 59 dm-verity targets, sha256, 4K blocks, mem_profiling=1):
> 
> /proc/allocinfo growth from 0 to 35 targets (bytes):
>                                      BASE     PATCHED       DELTA
>   bio.c:biovec_init_pool        4,587,520   2,293,760  -2,293,760
>   bio.c:bioset_init             1,196,160   1,052,800    -143,360
>   dm-io.c:dm_io_client_create     107,520      53,760     -53,760
>   mempool.c:mempool_init_node      36,680      23,240     -13,440
>   Total (35 targets)            5,927,880   3,423,560  -2,504,320 (-71,552 B/target)
> 
> Unreclaimable slab saved by target count:
>    8 targets:   572,416 B (  559 KiB)
>   15 targets: 1,073,280 B (1,048 KiB)
>   35 targets: 2,504,320 B (2,446 KiB)  [SUnreclaim: BASE +8,436 kB vs PATCHED +5,960 kB]
>   59 targets: 4,221,568 B (4,123 KiB)
> 
>  drivers/md/dm-verity-target.c | 24 +++---------------------
>  drivers/md/dm-verity.h        |  2 --
>  2 files changed, 3 insertions(+), 23 deletions(-)

Looks like a nice improvement!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
