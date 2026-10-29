Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263977;
	b=jGKNVR49xUDzWJZAAKFfacTkbJiKiVwh/hj3mTcYEA9p+NAB3wUTzoEJHCaf6EULux8u
	 RkGvQAChAuVczMEEMGJc2t77qS0POBKvKeV/VDoqEbf28iqJTdMUxJ4mFwb3V/SnJLizJ
	 fl+GNaTyjYA/aEQRRMWD+l4jr/92ZLlZsrAXbVS2IgSQbEXH+D8t3eyowblpcrpvC3L84
	 WqSdEWyFDFD1U7C/91eW2GSea+kOpqOk8bGN0iYqbr+SlzASu4XoVasXIKcXFfiBbr8uq
	 kOMA5OKgqZtLjiOCAxDOA+RYLGTZo2Vm6G45nQ/0Lu57Mg62byqBLfaB95wZPc3GLOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263977;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9gLH4+a6pMv1endj/otCM4ulkCr0wO6stpwjOWcjwYE=;
	b=vJKwTuRkPfzBCMpLlCoAAbCUsCtaO9+GWRVgu1JNu5Zvet8/mJHJ8/vnck60gbiYX/b8
	 Y5/RVXg5nCO3mxXIZUtXO2+Uzqoqg2r3ygtT2tLze6a2TI72gmasXv0PNK2xqz8+iBrP6
	 Ea85aKa4+pFBuWrH+F8/LZSX+T9jvSDi+DyVpQBCV7tYd/iMF0tRu34QDbAFf34T6v/OU
	 4ydQl7nX/NaiZiQuXovMhHNigyGauxicCvCkyuTraND/I/z6juWsfdYUtb3YHovIrIVhW
	 WJJh3+tmQp43gutmQQIdHcfYe9NDfHgYVsyuvN99bUW8wXbmrdO90ZVJwSPtk/URZDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QyUkOBI1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56953606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QyUkOBI1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8CA1F01825
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263976;
	bh=9gLH4+a6pMv1endj/otCM4ulkCr0wO6stpwjOWcjwYE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QyUkOBI13AnqeHLszW5lc1AgLi7a8LzgcQR+iLd+CdBJVp19DamnLD9liFg9XbYX7
	 IlZNM7oRWf+uEDJZR4ppUOwyJmNvCbzA3r0pQITqfve49AjpVr8ZY+OYPJIFNF0fBT
	 uJI7GEwqYKWC/7s7La0ORotZT33djo2M9LuP6r6ALk3klGFXmd2fhGi2jzN6/yuADs
	 6GMp/soin/PAc5zJCvX1WJEeNmvtecBsuyrma9Hc9efX2u8ZvCczeMxOnUAcQQjOai
	 7Reoov75iy1ZYNd/MicXpJg+0WmWaxUIkyjVLGTBxnmF80BZbJdYBLj84xLfRyxz9B
	 rG+FtCmXKxT4A==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c169ae1cb26so74734566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:52:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzJljY2Kroiaij07N0NfqQju3WQQQeZOoCeWzrn8YYY8JDyP00QYm3bd8dM24ipaVaIfBDTDo2SUbImvNA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3ASJEQPxm+MnyIXPZnt4nI7ZipLHbQNclKYA48MmuNRZZUHfo
	UmoOjD8RRwnpOlTPGtIlvz4Oy3n6+IPPLVrL3nYimrMQDj1jMWMqo4f3ICroa7hxcYVTksiRAnw
	s8ydyR9X2mkI5GcaHz+1djOPeYQVORR0=
X-Received: by 2002:a17:907:60d3:b0:c42:fc8b:6c6a with SMTP id
 a640c23a62f3a-c49d11b4b51mr148488966b.14.1793263975482; Thu, 29 Oct 2026
 01:52:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028080656.1027283-1-zenghongling@kylinos.cn> <20261028080656.1027283-2-zenghongling@kylinos.cn>
In-Reply-To: <20261028080656.1027283-2-zenghongling@kylinos.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 29 Oct 2026 17:52:42 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_5RoJ=2FT_1JCppuSZ8Zgv5EgS9FcFm9TZsLjZvP-6CA@mail.gmail.com>
X-Gm-Features: AclHuK8lSwyP9-_9RYpa_Yb3ldfgKOHtdZkEvLNGpg35GLYZmXd7zqJnkmRcPiU
Message-ID: <CAKYAXd_5RoJ=2FT_1JCppuSZ8Zgv5EgS9FcFm9TZsLjZvP-6CA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ntfs: fix a self-deadlock on writes to non-resident
 named streams
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 5:07=E2=80=AFPM Hongling Zeng <zenghongling@kylinos=
.cn> wrote:
>
> The stream write ioctl holds the stream mapping's invalidate lock
> across ntfs_inode_attr_pwrite(), which calls
> ntfs_extend_initialized_size() for named streams, and that function
> takes the same lock again, before the check that could skip the
> extension.  A write to a non-resident named stream through
> NTFS_IOC_STREAM_WRITE deadlocks on itself.
>
> The ioctl is the only caller that reaches the named stream branch of
> ntfs_inode_attr_pwrite(), and it always holds the lock there, so
> split off __ntfs_extend_initialized_size(), which expects the caller
> to hold the invalidate lock, and call it from that branch.  The write
> and mmap paths keep taking the lock themselves.
>
> Fixes: 3f11c48d4f94 ("ntfs: add pathname access for named streams")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
