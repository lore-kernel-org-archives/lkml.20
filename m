Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794104211;
	b=IqibjQ2MeI6JZHdDCbR0bMYE2MNC41yK6fZWPXb8GabWv/9iVr3HPZ4lYCDPB8Qel7fF
	 GS5IRZWAlXxj26zYs5tDmdtLlZ4rJn/v2LJXxBh6Ixv78K80pqOzNPQlwYWa7GtpFYDhu
	 Dk0V9gSnyo/qizKxH191VxM7+tOSLhedvsmgO72R5XxG8LgKHdPBy9NmEoG+MQxs+OJrV
	 u5zYDO5g0By+5ld1iurRxKjraasOlOqpxwOHdEGKy8TuyVUB6rLRQUycfnOd+JuzLFg3J
	 cnGX+UaHcl7b4CoqnwV9BfH7OIb7b04hd19K7y7X3kS196LHZpGlI8WnXTRs4bRoUFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794104211;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rhaNAYOBGQbAJRxA/86LGQPp9w1ZXItaLYNXRKOAJ+0=;
	b=4ykyj4U6PZC3dRoD5e/9rKc/QjDUtDseAI/jD7ccdk0HbiJ4ZKYIKGytkxw0EQoFJtFB
	 CgzzAc4vR+CtRHPw83lxzc8punjOsoY8r5imw9cmwa9v+mKMn6fzROe+AbiiLbHaSh7o2
	 eTk5E/Hqg+0fffRETm8y6NrLvYhWnt5HsI5GAzSvXranbn8MYE4acgOvfIOLtqjGdrcUo
	 W1oDlcFjiTBG8/jcBY9NFsiRGDpq3yDsyeEYYJui2/oX0Kz7Rd7c3rBUy3GE2geFyrTDW
	 CthyZvZUFY7m32bAhjwBDF0iaQCGbarpEBXO8A5u6gencYEiKWLAyVFaQ1Vd8XVPfPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JPZBwQn5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D266606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JPZBwQn5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4551F008A1
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794104210;
	bh=rhaNAYOBGQbAJRxA/86LGQPp9w1ZXItaLYNXRKOAJ+0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JPZBwQn5OcX5oFVQPgyAPLyVxbtqjTdwXPBbqr59GJ+EGHmMMcyOc3wYkIplUlShs
	 U/zXJ+b7aMhCTzW/elSfIhwcFZ1lCGiyFLq+XCS6k+OwPeXzu5tgsQ+3e3M7REVEu7
	 tlQtQlYWzQwfjxhjmQXn68y5OKe6VnxkKZSZwS9j4xKDsUIRo+w7c195jn/bV/NIlJ
	 XPbOEXWWppZtgc94J/5zA8UeEH6go7PKc/kJo81exelZhH4PoAiA28DdP3ovrxGmZl
	 FocEBvQV7NAMCGiVX0Y+annnOKN6r4odq3oYSyCxLrbdttbm7Z9tPBFAHUdMneg6T1
	 +FuIyqF60OZyg==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso245694a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:16:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy9j0ZoKo3+Qn1J8WYZoCA/+035iA3Dn2U2gfL/UyECEjLKBFgIGtfL3dvtzDeMe8TC3hAmzyFzCxca71k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YF/SqApLBzcAOqz0BiGXqSbohKr00S268Yo5E4udUCn/fhTUY
	Rb55gV3jeIZgZJhGyk8TlyaY2cnmuUN9PIAI5uIYUEE7VLBGFyXg0KPxSxsX8grQMQZkvLzv+Et
	CwwY0TZezHdIwMt42Af6A7wMkD2qeLTU=
X-Received: by 2002:a17:907:84a:b0:c33:9fab:5f61 with SMTP id
 a640c23a62f3a-c4d6db7fe58mr44458366b.29.1794104209459; Sat, 07 Nov 2026
 18:16:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107020257.363811-1-fredric.cover.lkernel@gmail.com>
In-Reply-To: <20261107020257.363811-1-fredric.cover.lkernel@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 8 Nov 2026 11:16:37 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_yf2eU7fJLaE5JR6ddO=EXsDOMBC0xyByuSJ4imPJvow@mail.gmail.com>
X-Gm-Features: AclHuK_rAD0_X9-1rzYyea-9ppXgdhtoO7-wF5lKZILAvB31CXfCLyGzIrTDMfs
Message-ID: <CAKYAXd_yf2eU7fJLaE5JR6ddO=EXsDOMBC0xyByuSJ4imPJvow@mail.gmail.com>
Subject: Re: [PATCH 0/2] smb: client: fix DFS handling of non-ASCII paths with
 non-utf8 charset
To: Fredric Cover <fredric.cover.lkernel@gmail.com>
Cc: Paulo Alcantara <pc@manguebit.org>, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	Tom Talpey <tom@talpey.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 11:03=E2=80=AFAM Fredric Cover
<fredric.cover.lkernel@gmail.com> wrote:
>
> Hi Paulo,
>
> This series fixes two problems that show up when a DFS mount uses a
> non-utf8 charset (iocharset=3Diso8859-1, or a kernel built with a
> non-utf8 CONFIG_NLS_DEFAULT) and the DFS path has non-ASCII
> characters.
>
> Patch 1 fixes an out-of-bounds read in dfs_parse_target_referral().
> path_consumed is a utf8 byte count (the DFS cache works in utf8), but
> it is applied to full_path, which is in the mount charset.  When the
> count exceeds strlen(full_path), the unsigned subtraction wraps and
> prepath points past the terminating NUL.
>
> Patch 2 fixes a double conversion in setup_dfs_ref().  The path is
> converted to utf8, then converted again by dfs_cache_find(), so
> "=C3=A9" is sent to the server as c3 83 c2 a9 and the second-level
> referral fails with -ENOENT.
>
> Order matters.  Patch 2 lets these mounts get past the second-level
> referral, which makes the over-read from patch 1 reachable.  Applied
> in the other order, patch 2 would turn a clean -ENOENT into an
> out-of-bounds read (a KASAN report on KASAN kernels).
>
> Testing: Samba 4.23 DFS root with a link named "caf=C3=A9", client on a
> KASAN kernel, with iocharset=3Diso8859-1 and the raw 0xe9 byte in the
> mount path.
>   - On an unmodified tree the mount fails with -ENOENT.
>   - With only the setup_dfs_ref() change applied: KASAN
>     slab-out-of-bounds read in dfs_parse_target_referral()
>     (strlen(full_path)=3D29, path_consumed=3D30).
>   - With both patches: the mount succeeds, no KASAN report.
>   - Regression run: iocharset=3Dutf8 with "caf=C3=A9" mounts as before.
>
> Known limitation, not addressed here: when a non-ASCII link is
> followed by a path component (e.g. //srv/dfs/caf=C3=A9/sub), path_consume=
d
> is still in utf8 bytes while full_path is in the mount charset, so the
> prefix path is offset incorrectly.  I saw this as -ENOENT.  Patch 1
> only prevents the out-of-bounds access.  Fixing it needs the
> consumed length converted to mount-charset units, which changes the
> dfs_parse_target_referral() interface, so I haven't attempted it.
> Paulo, how would you like that handled?
>
> I haven't added Fixes tags.  The strlen() - path_consumed arithmetic
> was moved by commit abdb1742a312 ("cifs: get rid of mount options
> string parsing") and appears to date back further, and the double
> conversion in setup_dfs_ref() also predates 5433c629e8d4, which only
> moved the call. I couldn't pin down where either became reachable, so
> I'd appreciate it if you could add the right tags. I haven't added
> stable tags either; let me know if you'd like them.
>
> Fredric Cover (2):
>   smb: client: fix out-of-bounds read in dfs_parse_target_referral()
>   smb: client: fix double conversion of DFS path in setup_dfs_ref()
Looks good to me:
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>

Thanks.
