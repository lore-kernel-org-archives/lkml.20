Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296542;
	b=2Q49D2VN4N0a0JSbj3XFjlHegEFN/ZrVaZheQSAzdBMCaNB0HXtrhtDae9zw7xEL9Psx
	 84Hx98hbnDGI88Nq9nJ41VR251Kup7ADsAM8qYrWTX/dQHcEB4wVQg7jkpTPnmRNQuu30
	 mDMM9uH8KTBDqD/38fmO45UY/p0WZ/ca2vZxZugxsju91I/iD0MR/OKEjLU3RpKqCIeYw
	 0iEEYCNC6kXA9lJacm2NIzmS+8DzmWyRD4eR7GEns2Lv50ACqsyW37ydK8qzRjDYkAIH6
	 UKPS/bLCha226S/J7KQgz3t7H2lH+vnj9Sb3lzHvgcfXkgmChAf3i5d/jVID9VHWmtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296542;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UiXZ9BgIzQkn6EFH4P+iWCgrsRcbki8OlT8PLa/j/7E=;
	b=RIq/b5dhrYTXi3xtste6+cP7CHYif7gyJgm57L92C7Z19HUyp70ygrFOWeX0zfwzPn+c
	 fcWG1avtkIrqXliGTcN0cTJeAZWrAmq/Ep4YlCUiTjpEBLtxqrrzlAl2lwZg+Yn+V3Tme
	 OpX6Rq0uzRLrHj3htJbjOOW7L+L2M/pQMUkuOlX6gHNrYP6OERUchoLPDsG0m9Gr92aly
	 RCBDonBygyc7AhW2FqdYoJXi2pWppwFbIInuwxiqEGVLUvm8bmOWRLVL9JADSoecUVZ3c
	 e2C0eplGOGMlXESpW2omjzV988vM7QN/Wmr2Autc/1Lr3NC/0b+NxIgz6avJVv+LgTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R5hhTu3S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0A7606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R5hhTu3S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D071F031E0
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793296542;
	bh=UiXZ9BgIzQkn6EFH4P+iWCgrsRcbki8OlT8PLa/j/7E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=R5hhTu3SoE9opfct55crD7fQtBfueBPQGTuE0axnr8cWrs2Vu8io1eoKt6eUAYiPm
	 +c8yqPwtJGPpCsajSwfTS7LsdcG6T9IE12bBkRlIWom3tRPUsQs+nIslW+MHgGvZz1
	 4Z2KN0f9P6Ch4omAm/dJEqL8dL/Y1hV0EPuccLVdVZz5PCz3embGuzP7D3sV1ee8/P
	 j83FuPU9GLY9VDYurvzf8/28SdLYhV69nhdpv5iQjycBRLLeCeJUGZFlcJeSk9OJ5v
	 NRrSyJXJc1NrET0TTOWCgeZCDQDG4BdkocAR5+V6/cfiEoM1EnPMzywKpp+lhhFKIW
	 Un4js9OGTHOhw==
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7c33cc572e6so838988137.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:55:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByOMK+R2CUVse4eHuVl8C8zlm4AXpacCZIAKSl3kmJAodEiX2Jpd5aKNo5FuXM5N+Nr6kp0r5yjL1vgFBk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHzH66DlFMUbwPY+E9q/SWHRlYHUUobw2quJUFkKpmfji8NFsp
	Q7G4zC5YKI7kVvRNjafqsQB0L7QA32HraPBd66gRS5Lnks8oKKA55Kc/3SUsHcGdbmayqFJ6OGP
	Nn5z1+ZJmIg6ev2ALobjvyH0yAlSUWfM=
X-Received: by 2002:a05:6102:370d:b0:7cb:cfcf:3d01 with SMTP id
 ada2fe7eead31-7d05432ac0amr1157160137.33.1793296541426; Thu, 29 Oct 2026
 10:55:41 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179328314071.648427.12527832319954042748@gmail.com>
In-Reply-To: <179328314071.648427.12527832319954042748@gmail.com>
From: Filipe Manana <fdmanana@kernel.org>
Date: Thu, 29 Oct 2026 17:55:04 +0000
X-Gmail-Original-Message-ID: <CAL3q7H6tz-YXxtTk3MVm7cLAQh1coBAkcF7KkH+GUwZnznnFrQ@mail.gmail.com>
X-Gm-Features: AclHuK86Gn4r3KoV1EZing1H0aYPBgdIG60MDZvYx2WshoVoFo2GdhtUwvldtTk
Message-ID: <CAL3q7H6tz-YXxtTk3MVm7cLAQh1coBAkcF7KkH+GUwZnznnFrQ@mail.gmail.com>
Subject: Re: [PATCH] btrfs: reject zero num_stripes in the system chunk array
To: Cheng Yongkang <teel4res@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 2:12=E2=80=AFPM Cheng Yongkang <teel4res@gmail.com>=
 wrote:
>
> validate_sys_chunk_array() reads the on-disk num_stripes and passes it to
> btrfs_chunk_item_size() to check that the chunk item fits in the system
> chunk array.  btrfs_chunk_item_size() has ASSERT(num_stripes), and the
> only num_stripes =3D=3D 0 rejection is in btrfs_check_chunk_valid(), whic=
h is
> called later.  A crafted superblock with a BTRFS_CHUNK_ITEM_KEY entry
> whose btrfs_chunk has num_stripes =3D=3D 0 therefore trips the assertion
> before the invalid chunk is rejected:
>
>   assertion failed: num_stripes, in fs/btrfs/volumes.h:714
>   kernel BUG at fs/btrfs/volumes.h:714!
>   RIP: 0010:btrfs_validate_super+0x3ce7/0x4210
>   Call Trace:
>    open_ctree
>    btrfs_get_tree
>    vfs_get_tree
>    do_new_mount
>
> Commit 2a9bb78cfd36 ("btrfs: validate system chunk array at
> btrfs_validate_super()") moved the validation out of
> btrfs_read_sys_array(), which rejected num_stripes =3D=3D 0 explicitly.
> Reject zero stripes in validate_sys_chunk_array() before calling
> btrfs_chunk_item_size(), so the crafted superblock is rejected with
> -EUCLEAN before the assertion is evaluated.  open_ctree() turns the
> validation failure into -EINVAL for the mount.
>
> Fixes: 2a9bb78cfd36 ("btrfs: validate system chunk array at btrfs_validat=
e_super()")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
> ---
>  fs/btrfs/disk-io.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
> index c628c50..920ca4b 100644
> --- a/fs/btrfs/disk-io.c
> +++ b/fs/btrfs/disk-io.c
> @@ -2389,6 +2389,19 @@ static int validate_sys_chunk_array(const struct b=
trfs_fs_info *fs_info,
>
>                 chunk =3D (struct btrfs_chunk *)(sb->sys_chunk_array + cu=
r);
>                 num_stripes =3D btrfs_stack_chunk_num_stripes(chunk);
> +               /*
> +                * btrfs_chunk_item_size() cannot represent a chunk witho=
ut

I find this puzzling, using the "represent" word since
btrfs_chunk_item_size() does not represent anything, it just does a
calculation.

> +                * stripes; such a chunk is also invalid in the system ch=
unk
> +                * array (system chunks are never remapped).  Check befor=
e

Also the "remapped" detail is also confusing and I can't grasp the
intention or why it matters.

> +                * btrfs_chunk_item_size() so a crafted super block is re=
jected
> +                * with -EUCLEAN instead of tripping its ASSERT().

Something simpler and more clear for the whole comment:

"We can not have 0 stripes, and passing 0 to btrfs_chunk_item_size()
triggers an ASSERT(), so fail immediately if we have 0 stripes."

Codewise it looks good, thanks.

> +                */
> +               if (unlikely(num_stripes =3D=3D 0)) {
> +                       btrfs_err(fs_info,
> +                                 "invalid chunk num_stripes 0 in sys_arr=
ay at offset %u",
> +                                 cur);
> +                       return -EUCLEAN;
> +               }
>                 if (unlikely(cur + btrfs_chunk_item_size(num_stripes) > s=
ys_array_size))
>                         goto short_read;
>                 type =3D btrfs_stack_chunk_type(chunk);
> --
> 2.34.1
>
>
