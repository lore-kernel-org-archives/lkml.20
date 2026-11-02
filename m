Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627911;
	b=ldT5AegfQsOBn3Frqp3fon+1QugAJFJGVwGTmfXUPBn32vWO6IuCcWLG81bxY4sS5Vc4
	 wA9br88Pjpdo6N0U3JR53hx3a8r/FDVmaew1xQbW5U/oR8wodugTedClg6mZ+YCLYFoBq
	 gdsjV4bdKDHO1/JvzwvhtMH2Yw+XYo2qFa8RrOgY6ydYUnX6+v/rv9nhk3CMuu5EjfcMP
	 7hCXJvHlFq6lNJ1xuUoozqrYKivVKcOaOg3pqa5SrOasntfnpVPxHIEJTCHe2cF0x6qrZ
	 rfjEDOFyOR+QVSNr3Mik2H8UQxG6JyCkl3qawmZidtMA+dd2zhyDvEb7o7u8VjTkRgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627911;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0B2e2A6J6CcyMvYVfZjLEsMV3nr/MkV2RVJAVx6NxkY=;
	b=AhP41B7R37Pwati89UZXDJcLAPN5szPnVEZ1xW7uGQFy+9BsU5UvdweyCI3Zm5Zd9909
	 +/Dpn/Q0iRYjlSlMPh2pdvYC1vlDtX9iF9hlBDfeRf+oUV8YSWGkBUa5F3yoOyGqh+cKg
	 cc5IxB6PVONf7aYguNjWijrl41QQVO0BqOqQ9wDZ+0OreJq4cQG5i9Miuf+t7L2+MVPaz
	 xSlJOhJpchooqCqKa1OSVs2GoL0t5siCMJWrZKHa+wWvvYyX7Es8LlD3PU18jAqS9BTLR
	 jL4pttp5ONTvNiw5MgdMiA63LjUlUlcjb4j7O8y3vPNDWDNaKYNw8uorLX2GI2DgnRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRjoxj3z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E540606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRjoxj3z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EBFC1F00A16
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627910;
	bh=0B2e2A6J6CcyMvYVfZjLEsMV3nr/MkV2RVJAVx6NxkY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZRjoxj3z8OYzSGULLKCmvztPh94ZYVQvWzpL5NJrmV4P3EpmRvPf9ul/oYHK4aDGn
	 rhUiIgDwEdxEsjgblJBbVEHVWhN0oVrTfRD7Hf5DGpu+nH4ScWWvfA/6V4k5iS8iHT
	 i/9mUHYRyE7VKgno/cWFqe465teGs3a6yVIgbexCcy4HaWLA7I0vViC/Tr3lTsiGZ6
	 Q8goUO78Cdw+U+q5YG1V5mlda7kFnbbnR8Gs+8McgW3+vzI53DthhtFA8Inz4/ywq+
	 /JpV8odc2EHAPu25aTikXKnnKV8fMzS7kTlKHL18BE0SOmEiPZPfMaEOE9J7Sq6zVu
	 7dnnsB7LNcSNg==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4ceaee6770so1698766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:58:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwbxhPTyMZ2NSsfUWG+vccTjZiiqikb9kA/QHLdutXRMvXWyqe8+rNJL78Hs2pAdPnsItAOWrbcuxDdalA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxWIc/4Dq4scugrIFdFDzfW1OjXvqe7ErUKF12vl4NikRrIUNu
	ILHW8+Ieb8Z7xI6fucHEDEzOcIhiyCXvNTmaz3ux5G6/CfvXKg5wDB4wzcsBhns89Wf7eupH3s7
	A0ysjG6TXjdeRf5bXM0YnTny5FSlQfBs=
X-Received: by 2002:a17:907:3f1b:b0:c46:5973:2a1c with SMTP id
 a640c23a62f3a-c4ca7aada3dmr812890766b.37.1793627908877; Mon, 02 Nov 2026
 05:58:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102093543.1199671-1-zhanxusheng1024@gmail.com>
In-Reply-To: <20261102093543.1199671-1-zhanxusheng1024@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 2 Nov 2026 22:58:16 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8fARb5Ow27WSa3wA3nEkini8j1rEYvWY2Xf+12M7x1ZA@mail.gmail.com>
X-Gm-Features: AclHuK_p0GkJn1d8FnoGiSqpwVEvXw3gnNIBGTj2sIJBhrIpyHP4RefuVBBIWF4
Message-ID: <CAKYAXd8fARb5Ow27WSa3wA3nEkini8j1rEYvWY2Xf+12M7x1ZA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: don't allow compression on volumes with clusters
 larger than 4K
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhanxusheng@xiaomi.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 6:35=E2=80=AFPM Zhan Xusheng <zhanxusheng1024@gmail.=
com> wrote:
>
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
>
> On a volume made with "mkntfs -c 8192", a user can set
> FILE_ATTR_COMPRESSED on an empty file through system.ntfs_attrib.
> Writing to the file and reading it back after dropping the page cache
> then crashes:
>
>   BUG: KASAN: slab-out-of-bounds in ntfs_read_compressed_block+0xa2c/0x20=
40
>   Read of size 8192 at addr ffff88804355a000 by task dd/106
>
> The read path only handles clusters up to 4K. It copies each cluster
> out of a single page, and a compression block of 16 8K clusters does
> not fit in the 64K ntfs_compression_buffer. Loading an inode already
> rejects compressed data on such volumes.
>
> Reject the flag change the same way.
>
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Applied it to #ntfs-next.
Thanks!
