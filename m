Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866983;
	b=hPmTnVUsnXqgIGaHDd5BMYMFXijwORNsO9mrkoCEpQbpj3p+PXGixmSc7//7jU/fVj8O
	 jz8v1rxYA4qr0mbf6VX17z2M9SBwSB7ZkFugullGwxTV+rzRPx1YBP43rEPSRaeP7md1n
	 N6nv3eNmtFjn7qJ4sqZcyitf8CMtY71VnkoyssmSXINHR1KfTwvnsSxaknnyQrBpQwZf8
	 QQbVTTzvujRrtDdA8yfXk+ztQdIqM0SN9+GnEjlbC6GQdZetJHj/NyGsXG/VN2Yr5uAU5
	 VQ23D8QXky1Y0Wx2+O5P3e0/9qnt3HaioBPUqsKEoWuzIe8q2tvUau/dq4DM3COmGEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866983;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fOli+6BvsIjpqhuefrcKzhuSda29XozGMFyBnnyYh74=;
	b=IDyfRM8ayxyb2dOxFC/ERvaNbhWbX/3h2j549C02bt/tM+OqZd+THoNmA+mJmlFqFnvk
	 aP2IEdTw4LXQS5n5MDM6VkoICBWrYgOTvfggr38r9YINAnaMetoHqGvKfCDNpXNr7NK0Z
	 u6yyCKgYdmsOSu+BjOwFAuMfsC/BCgySs8f2W50K0y4uVC6SvF+c1GqU0YpbnJW+r6wrp
	 f2IZQ4o9f4RQFlcMiySf8kmHDeeMpJqmD+CAqaMREY80h1ZtK+2er6y4woyFaA6u2C5Th
	 g+r0AzNoq+J+KmxnNR8mlesrbhQo12Lcr/XTIdJlFglis2E9w5qt4iHnTZliiDZxtew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsXqnyHc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1D6606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsXqnyHc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEBD1F000C7
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794866982;
	bh=fOli+6BvsIjpqhuefrcKzhuSda29XozGMFyBnnyYh74=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AsXqnyHce7lEeyyVJkHpcNJcQZU/SO/N0f71usLKrnfQ+LOLILWe3koRMzdV9IMW4
	 racohVJwm7KjOWH7a29eROXcPFTtngr3sA+7RLUbq0L3wCWxYRMorNpGTOP7gR9P7x
	 n9ONcTSfIgK5q9gl/Qba0Z61+IbO9WX4ighdS30nj/Mkb0qvnn+2ipHb4PTsIyeRls
	 bzS20EfRYBgbqWCdVno/WsYG3uhxdnq3smt2Q88yjfqF7wbsZeMa7hSskN0R5vmv0t
	 yoNZiScpqOcHRTOhJYu82F2OgDCWl24y5P17OyHD/iBDkSwNrKwwL49a9tlR+Zv42W
	 kBObHJMU3Hg9g==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50e9408873so148636366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:09:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH1wF627G1SGLgiJeDHgRuG49LCahO785bQcFWNYTYbJMltuZZ5pa1OwAJTiwPIUpFRWOdGqbcyNMgA9qM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Yzxe63AvFLH80MPH1HkRo04P7rVcc4jWR6DJI7nWDHprLcTo9
	ILgKEpCCljd/t3T/3Hcvhwt4GVyTHtxCIHnWgHagFVzHQMMD2B3CtGhRmvfPxgzHuswATasdVTV
	9y1Zb7tqvBcIacBq9YwgSRA+mlH71Aiw=
X-Received: by 2002:a17:907:d406:b0:c45:b99:f282 with SMTP id
 a640c23a62f3a-c509611660emr941500366b.7.1794866981306; Mon, 16 Nov 2026
 14:09:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116150411.321076-1-0xbeac@gmail.com>
In-Reply-To: <20261116150411.321076-1-0xbeac@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 17 Nov 2026 07:09:28 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-fMp7ZkwoScXbrmQkR3AeVhCSGG7RDzTLAUEYvsLqm6A@mail.gmail.com>
X-Gm-Features: AclHuK9ZcJZUGI1fuPAZCqCXO-Kcp5XqU-UcWEpmWTCSgFl8jH6fg2qujt8WjDQ
Message-ID: <CAKYAXd-fMp7ZkwoScXbrmQkR3AeVhCSGG7RDzTLAUEYvsLqm6A@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: pin parent dentry in maximal access check
To: Yuansheng Yang <0xbeac@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:04=E2=80=AFAM Yuansheng Yang <0xbeac@gmail.com> =
wrote:
>
> ksmbd_vfs_query_maximal_access() reads dentry->d_parent without holding
> a reference to the parent.  smb2_open() calls it after path lookup has
> returned without the parent inode lock.  The AppInstanceId takeover
> path also calls it on the old handle's filp->f_path without holding
> that lock.  A reference to the child dentry does not pin its old parent
> across a rename.
>
> A concurrent rename can therefore move the child to another directory
> and drop the last reference to the old parent.  If the old parent is
> then removed and freed, d_inode(parent) reads the d_inode field of a
> freed dentry.  If the sampled parent has become negative, passing its
> NULL inode to inode_permission() can also cause a NULL dereference.
>
> KASAN caught the following on an x86_64 QEMU guest with a test-only
> 100 ms delay between reading d_parent and d_inode:
>
>   BUG: KASAN: slab-use-after-free in ksmbd_vfs_query_maximal_access+0x2ba=
/0x300
>   Read of size 8 at addr ffff8881100f0830 by task kworker/2:1/81
>   Workqueue: ksmbd-io handle_ksmbd_work
>   Call Trace:
>    ksmbd_vfs_query_maximal_access+0x2ba/0x300
>    smb2_open+0x60d5/0xec30
>    handle_ksmbd_work+0xad4/0x2110
>    process_one_work+0x745/0x10f0
>    worker_thread+0x511/0xc80
>    kthread+0x330/0x410
>   Allocated by task 319:
>    __d_alloc+0x35/0x860
>    d_alloc+0x46/0x1f0
>    lookup_one_qstr_excl+0x171/0x250
>    filename_mkdirat+0xba/0x4c0
>    __x64_sys_mkdir+0x6a/0x90
>   Freed by task 81:
>    kmem_cache_free+0xb8/0x3b0
>    rcu_core+0x549/0x17d0
>
> The read is 48 bytes into a freed 192-byte dentry, which is exactly the
> d_inode member.
>
> Commit 2e450920d58b ("ksmbd: move oplock handling after unlock parent
> dir") released the parent lock and reference before the final MXAC
> query in smb2_open(), leaving this helper's bare d_parent access
> unprotected.  Commit 4e45cca31d4e ("smb/server: add
> ksmbd_vfs_kern_path()") later switched the earlier open path to an
> unlocked lookup, exposing the MAXIMUM_ALLOWED query as well.
>
> Commit 0383a66dabd7 ("ksmbd: pin parent dentries in SMB2 CREATE ACL
> path") fixed the same race class in smb2_open() and smb_inherit_dacl(),
> but did not cover this helper.
>
> Take a parent reference with dget_parent() and hold it across the
> permission check.  If the parent has no inode, leave FILE_DELETE unset.
>
> OpenAI Codex assisted with reviewing the fix and revising the changelog.
>
> Fixes: 2e450920d58b ("ksmbd: move oplock handling after unlock parent dir=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yuansheng Yang <0xbeac@gmail.com>
Applied it to #ksmbd-for-next.
Thanks!
