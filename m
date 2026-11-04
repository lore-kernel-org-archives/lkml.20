Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783227;
	b=U9hbJwWTcqSbWgKsqhrDo17pIFGKr4ZkWIYr2Oa/U7PDdhjngIS3wiXKmF5SLIL2yb/b
	 1Bk/+XjC45GJvwzpC/020KO06wVIHjrPcUriG9qfschXjh8MOy8EOveSvsjg8v+lcHjQ8
	 Z/fR6hv/qgo960gAtM5J1bSsyAgU9Tyc7j72OFbpZUem28MpDxnR5QoV6/78mUMYON5Kx
	 DYqKinFwFjsz8EqUTn1a9KMaE8qJOnYVG0AQXvLpKbPAHGppJ4uD1igNbc2AVfpnqD/BU
	 hW0obM7v8fXrzawA0SKFFF6DJQ1ZPZ8EvRt+B9A+dLJynuAetZ+i8Vg6AVPeXl3ypuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783227;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=eCc2qBqKGvgJdQ0+SWeePZRdJVP3CAaWU6edxwz4TQY=;
	b=QUHw9ID8/MoEGHHUprwv3Kaujif43N1WcY0yrVCCtLFK+i0W/DRBlWMnwNksBRLFAp68
	 xajTCV88qB8JlokI2zNxaAFLnVb82qFtsK280cTN9wfSR/K1stiehPBfB5gxjra8obu1P
	 V+S/M3O4hQzg0xtq/JCxJQC06zLDiJ8+bwQHVSv42V11Dz1ScBEir8JDtaNa0tXa6Dg9N
	 m6F8t0xcjmlT50AaOWZcvNSEZI2n6spqJGk9YGqteljMVKplMJ2StKfXGEXoKxy+ORoMJ
	 d5RqLlyeXXxlrbsBLm0slIr/ip8aljiDGQYBNJonCyB3SDs3twwgJJeP+PJJ2KUOkTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SuNjJN99;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DF2606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SuNjJN99
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B451F00A02
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793783226;
	bh=eCc2qBqKGvgJdQ0+SWeePZRdJVP3CAaWU6edxwz4TQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SuNjJN99NRA0UbhPNfw9qTqWb5QjOBDWr9heKrtV/dPkbwyIFeZbvRA6m9a0HSo+U
	 Y9gCVSNhZReI8fj2xXtorBkVP/um+Eb4q79dyqA6rRFrwSC6V+r8Cc2t1fxFslW1Id
	 1YBQGC8Csnta+6O5+kBVhrG5jBRaF5O9UX9z/L4YmPJ0gT71GZvKhgPton4Uw5HhbL
	 yHiyYwfSsYn/hYhHmsgj7ccxT0A1JVlxg13252CpY+708jwSXmxlHuiV/1rj9TXJ6o
	 rghwNCBz99yKGQTaYh3IPebk3HW3NWUx/UCNva5j8z6JQh3AX7HaUbIuf0kMrPJc49
	 2FdXqXra8Z9mQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4ceaee6770so64653766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:07:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBysCb+j//bWMzjnG0eTLUX+UXg5Z+MkrynaS4+WrVjUT3Pg2Mve9QO6Bq/tQJxAHPFK1Y3kUuNcL87ZN0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z++diTHdvL03BZ2kBYOv6u8a6uayVEdNfvMJGv3xWDuRFiylpfG
	yMG5ZoqgBD3JWESyHv5P2c9ZOPBVmXi91hZ9LVJqeg8iNlGFXihEqe5Gi+brkTVpMPJJ43oJl7L
	mnEc3OLE2oGVsL4ln73llqr3MnMJ3KaY=
X-Received: by 2002:a17:907:3d93:b0:c3f:c878:7c1d with SMTP id
 a640c23a62f3a-c4ca7a19decmr1442941066b.9.1793783225125; Wed, 04 Nov 2026
 01:07:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031052857.1542936-1-liubaolin12138@163.com> <20261031052857.1542936-5-liubaolin12138@163.com>
In-Reply-To: <20261031052857.1542936-5-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 4 Nov 2026 18:06:52 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-ec8ve6HD5eBJik-LF4PUhZjV7y0c52E2xpALLFA=j2A@mail.gmail.com>
X-Gm-Features: AclHuK9hyX810Y3t8eLuM2Emnv78qo6s39NjYa7uDhd4dU4G_YiYuHSvlEDQHvg
Message-ID: <CAKYAXd-ec8ve6HD5eBJik-LF4PUhZjV7y0c52E2xpALLFA=j2A@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] ntfs: write unlinked file attributes before
 dropping their cache
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Xuewen Wang <wangxuewen@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

> @@ -4052,6 +4052,14 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
>
>         WARN_ON(!NInoAttr(ni));
>
> +       /*
> +        * Attribute inodes of an unlinked file have no links either and are
> +        * evicted at the final iput(). Do not leave their data in dirty pages
> +        * that eviction would discard while the base file is still open.
> +        */
> +       if (!VFS_I(base_ni)->i_nlink && !ntfs_inode_is_named_stream(ni))
> +               sync = true;
This misses data dirtied by ntfs_attr_make_non_resident(). For
example, with 1 KiB MFT records, create an O_TMPFILE, nearly fill
its MFT record with a resident EA, then write 4 KiB to the file.
Growing $DATA can force ntfs_resident_attr_resize() to convert
SECURITY_DESCRIPTOR to nonresident form to make room. the conversion
only dirties the folio. With patch 5, the subsequent
iput(tvi) can evict the zero-link attribute inode and discard the SD
contents before writeback. If the file is later linked with linkat(),
it can retain invalid SD data after close. Please also ensure that the
converted data is written back before dropping the last
attribute-inode reference.

Thanks!
