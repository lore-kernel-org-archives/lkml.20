Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792712790;
	b=SePM13Y9/F9tLizGX/9Ldq5QQWSuNtczSB+nWYZ8TrdHwxGZDAeOmYNskcd9m61lI0DP
	 mpI5aQg/qnvuMx7x8y6e0szx3HJUN9gT+rQPNbe1NE0u8cesA/QReRHaRd1XKNFT9l9OT
	 qFeDo3gp5GYxro4Hqn8b2cJkDfCP6dsu7RpV251DQlydZ7n9OE1v/wz2ux9hy46h4ssTK
	 1BdP66HiJusWEr1TP8zr6Fdg7r81X0JnqcWxTmFft1wX/8Fg5M3Dg1tGsJ2QzMKPIxfri
	 wientgY+EVaDVLpjURzqRk3Vu1ulSk62STvDsCrH44EhVDVZYJiezqxAydtidaCX3sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792712790;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fi4Wn+lh1Z/zpvInQk71rHUv00wJPQShP80oT8WfkFc=;
	b=lPaoHPI+dPmnc6GUkWwgrfQksztHBd685/AAbPo03PccgmUdMGrFjSJsil+RUGYYtx4e
	 O+SSRdlTR0rPLLzoXzn3RlnSfxne6Irj1E8A0lG8ka03ISkg/zOadLOIx5j2BN6P/pv5a
	 RD0Hoj015xDi2ZqIfyq1TRGD5YjVBmfQP8i19hBN0IB847e4f8jVaKsEfiC2Gzbduindc
	 5zD6uczhMLqk4ol/JXbKsGdxQfK+nHMXo3aEqyy8Fe9ar6XeAueH0g1+A4HJow/a2ibBk
	 FdAoY9O896uGx8ozLF+IEfPsi4RqtiU2hDI5Qrgcym6U0skPg0iaoXZk3SMoxWn5f9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TKVEd+Un;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C31606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TKVEd+Un
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C74E1F031E0
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792712789;
	bh=fi4Wn+lh1Z/zpvInQk71rHUv00wJPQShP80oT8WfkFc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TKVEd+UndD438MIOUAjwBqyuR8mYz7+RLGZ7ygAaY/4FUMdjnIUfQenwO3XDqRGSu
	 FAd6PeGLQZRzqTVxZ9ptmBWiX6mZpgtBffWDr080VBU1t1cSVN/itZnT9zFYiNFzr8
	 4qQR1UZIIwxFVA6ckYci6rOVhV04/joFykfAqtQL4D5V15dJWBVcPX+2ZW7sHtym4D
	 HvF6csEwwq51usBjazqfWR9piIdwqv5iieyionnaX5b1THVwrReWrB0LN0p1+06eVg
	 KRPKycHYrat+2bOECzKYYH55FrZ6ex7FDKikxQVb126mcHHiwYtbSzM8drkKq5Og8I
	 AxAXnJF459PVg==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4697404c2bso41605066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:46:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxNOR80ew95Z80fwlwWQ2aiOr9cQqsY7iODdaos5EpngvQdDt9FIX7dtEVkXpV1sz5ViWUvu0VY4O3dunc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaj4/IdXU1xaDcO0Y2/KHk2+LgyjvoVMlSgiBSXrCVfKmgnRQt
	bED+8sk8wjg0juQPC5RXb++7GZA1IezRNUd6OqpO53qDR/JaGke8gCmsldH+wKlD7pHKZjbjYaA
	hyhvtiV4hLunaoVTIywxdI5hHzcNojZ0=
X-Received: by 2002:a17:907:9446:b0:c29:4fcb:2886 with SMTP id
 a640c23a62f3a-c46a948d935mr87657766b.39.1792712787878; Thu, 22 Oct 2026
 16:46:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022173832.14696-1-d3bugee@gmail.com>
In-Reply-To: <20261022173832.14696-1-d3bugee@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 23 Oct 2026 08:46:15 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_BRG+M96UurdeeeUaWmhkQSnXupk5JWRmKAf5g26kaZw@mail.gmail.com>
X-Gm-Features: AclHuK9yKdvGpizgGXSa7ZGgAUoWzc6AaCk5JarpvFhKat0FEK8DS9LWvWooc7Y
Message-ID: <CAKYAXd_BRG+M96UurdeeeUaWmhkQSnXupk5JWRmKAf5g26kaZw@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: serialize directory emptiness checks with readdir
To: Yongjun Gwon <d3bugee@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 2:39=E2=80=AFAM Yongjun Gwon <d3bugee@gmail.com> wr=
ote:
>
> SMB2 QUERY_DIRECTORY holds fp->readdir_lock while it calls iterate_dir()
> on fp->filp. An SMB2 SET_INFO request with FILE_DISPOSITION_INFORMATION
> can resolve the same FileId and call ksmbd_vfs_empty_dir() on the same
> filp without that lock.
>
> iterate_dir()'s inode read lock permits concurrent readers and does not
> serialize per-file iterator state. ext4 stores its dx readdir cursor and
> fname RB tree in file->private_data. Concurrent reset or refill can
> therefore free a fname node while the other worker still traverses it or
> retains its RB-tree link, resulting in use-after-free accesses.
>
> An authenticated SMB client with list and delete rights on a directory in
> a writable KSMBD share backed by ext4 can trigger this when the directory
> takes the dx readdir path. The client overlaps an SMB2 QUERY_DIRECTORY
> request with an SMB2 SET_INFO request carrying FILE_DISPOSITION_INFORMATI=
ON
> on one live FileId.
>
> In one x86_64 SMP KASAN multi-shot guest using ksmbd-for-next at
> 171df27077fb, the unmodified kernel reported a cross-worker use-after-fre=
e
> before a panic. The first report's access and free stacks show the two
> request paths directly (trimmed):
>
>   BUG: KASAN: slab-use-after-free in ext4_htree_store_dirent+0x488/0x550
>   Read of size 8 by task kworker/2:0/29
>   Workqueue: ksmbd-io handle_ksmbd_work
>   Call Trace:
>    ext4_htree_store_dirent+0x488/0x550
>    htree_dirblock_to_tree+0x535/0x990
>    ext4_htree_fill_tree+0x319/0xba0
>    ext4_readdir+0x175a/0x2f40
>    iterate_dir+0x1b6/0x630
>    smb2_query_dir+0x1003/0x1cc0
>
>   Freed by task 279:
>    free_rb_tree_fname+0x67/0xc0
>    ext4_readdir+0x13a9/0x2f40
>    iterate_dir+0x1b6/0x630
>    ksmbd_vfs_empty_dir+0xa2/0x100
>    smb2_set_info+0x2ffa/0x45d0
>
> Take fp->readdir_lock across the entire emptiness check. This places both
> iterators over that handle's filp in the same lock domain while
> preserving the disposition status handling. The exact code change
> completed a warning-free x86_64 KASAN bzImage build. Tracing three reques=
t
> pairs showed that the two iterate_dir() calls no longer overlapped and th=
e
> expected statuses were preserved. A further 1,600 reproducer iterations
> completed with expected statuses and no KASAN report, Oops, or panic.
>
> The reproducer and complete guest configuration are available privately
> to maintainers on request.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Yongjun Gwon <d3bugee@gmail.com>
Applied it to #ksmbd-for-next.
Thanks!
