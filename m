Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A086E54B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 01:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790989378; cv=none; b=R3VgWinegLgKvzhfgMEpcBLegnaCScQE1hTY5XIPJEF+lwHRkCaUJ+he8eMhI+tIQotmadfW2y6JMtaU1b8BRttLtL3h6mcSm+YZ1S1NsU4grWw3siJkiAGAJQkBU9dLl0PH3C+iuFPmZh71TnE9H75kJfutGb8zTpGLjelz970=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790989378; c=relaxed/simple;
	bh=Kj5llcIY+svQvxZHTM+UqXM54Tt+P1GZ4LqrVWD43yI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGmaX1h5wHDA0HJgcAqAHj91t5e8cRG9MnAK0/D2IhgLRoiOE/AVtkx/q+MW95wUJL/OrhESM4GlhseAqVbqsCV99Hcj49M6SSjWrACz5Tm2sFH/6JgUJYNKZ9GoY0uLe59gH+MUA+7TOsD4tSnmePfsdqP5lgJPRjnkDeteeTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuPCr6w1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuPCr6w1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C8B1F000FF
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 01:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790989377;
	bh=KnskPGPzkkcRKxtukZtrCYl1jV0R5UqGVxWuRH35Ffo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QuPCr6w1HX0Y5uROGUfGfp0ZdaEUz0rmaVB+cDIlLOK2bVQnGA/lgPbkvG5zn+Njk
	 QbyaOYFxaIUkg/o/9NkZU9k4KLL+iDt9ayF3IbGNjmYxO7FH2w6HBl/67+r/qLJjhn
	 rJW+TqSWsBTbDvFIm2lDAPgTXMaeTqbbhCMoYlcEkIg4rl4W09h2/LLjvcNHnRQlNN
	 91DcEb1xHMxH4A45BB8RQ+s5a5ZT2IDrPTMAyBV1HcwemhUYZpgbz7byjnHOmxXZ0q
	 WjTJdmUAgEAqc/wHgMJiFdmR5qcnTIKIm7GwViRfU6VzJ5LwVHPc4L845SdWrA8+M0
	 +Xxqdefu3sicQ==
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3dcfe205so59318766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 18:02:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzHi0UoPPuSJleEVLZ0vsdtK9CwgU09ef7mz/QDHLyvzuJZOwT7P5yNHmo7y9cxgpqRRHo3Yuc7mtDFK+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUBhivs9rvbOs8ZjPCERD/Gf0K4YBZjaeRg7mbBxnPXsRBTTyh
	27KS+jM7QPWorslrfhBnA8s+iCicH3c+Nf+IuSFIBlZlISUWHk/PGUbV84MvLxcVMXC//HNGRqq
	cGbKuXL1Yx68bmrW5gjXu1Ao6ksBdiqQ=
X-Received: by 2002:a17:907:c318:b0:c26:1649:47af with SMTP id
 a640c23a62f3a-c2e4af5c551mr317488566b.37.1790989375844; Fri, 02 Oct 2026
 18:02:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002043459.1695429-1-matthias.goergens@gmail.com>
In-Reply-To: <20261002043459.1695429-1-matthias.goergens@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 3 Oct 2026 10:02:43 +0900
X-Gmail-Original-Message-ID: <CAKYAXd918+PN-x58fkLnyQN9CNz424+Kyx2jz4VgTsV1Xi0Q+Q@mail.gmail.com>
X-Gm-Features: AclHuK8n1a72wNoEp9jnGeuKZpdcjCWFG_rAXUd07co_YGNL_QdYesrtbetQi10
Message-ID: <CAKYAXd918+PN-x58fkLnyQN9CNz424+Kyx2jz4VgTsV1Xi0Q+Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] ntfs: fix the undo path of $MFT data extension
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, Baolin Liu <liubaolin@kylinos.cn>, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 1:35=E2=80=AFPM Matthias Goergens
<matthias.goergens@gmail.com> wrote:
>
> These fix two bugs in the undo path of
> ntfs_mft_data_extend_allocation_nolock(): patch 1 fixes a use-after-free
> of a pointer into the runlist across the truncation, and patch 3 makes
> its $MFT runlist locking consistent.  Patch 2 adds the runlist merge
> that patch 3 uses to keep the runlist of the new clusters for the undo.
>
> The undo path only runs when something fails while $MFT grows, so I
> tested it in QEMU by forcing each failure once with a debug patch, and
> tested patch 2 in userspace against the merge code it changes.  The
> debug patch, the test scripts, the volume images and the userspace test
> are at
> https://github.com/matthiasgoergens/linux/tree/reproducer/2026-10-02-ntfs=
-mft-extend-undo-v3
>
> Changes in v3:
> - Patch 3 frees the clusters from the runlist that ntfs_cluster_alloc()
>   returned, using the merge from patch 2, which leaves that runlist
>   intact, instead of copying the new runs with ntfs_mft_copy_tail() in
>   undo_alloc (Hyunchul Lee).  The undo path no longer allocates.
> - Patch 1 (patch 2 in v2) is unchanged and keeps Baolin Liu's
>   Reviewed-by.  It now comes first, as it can be applied on its own.
> - Rebased onto current ntfs-next.
>
> v2: https://lore.kernel.org/all/20260930033556.169300-1-matthias.goergens=
@gmail.com/
> v1: https://lore.kernel.org/all/20260927105706.3111333-1-matthias.goergen=
s@gmail.com/
>
> Thanks,
> Matthias
>
> Matthias Goergens (3):
>   ntfs: do not use a stale runlist pointer when undoing $MFT extension
>   ntfs: add a runlist merge that leaves the source runlist to the caller
>   ntfs: balance the $MFT runlist lock in data extension error paths
Applied them to #ntfs-next.
Thanks!
