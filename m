Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867004;
	b=Orc3f61db1Y2IG+G/cXlypTzmk4uvV9Uq+oQdA8fEy4wi+jHQ06GTnSjklhEM9N/8DIZ
	 pQQg347wBD6ybYe58XaBFL0hxRwfNHKbqXlNhEM8lIJkPV0pHc9AWgyffWbthpQQkjjlY
	 rkJMps7sq9rqEzVW+XqpCoVN6chnJuri5CSZ0dViKDfhgsmwT46XVeJzqFFHQ4WlLyL7r
	 2JfZ4u8R1WSsNqPkKqG0yolS3o1Uq3zIV2v5KVHowEAY0WBhub8a92Dt1Z7V5KVZ9IPNy
	 zDjyF5fuC44nmt7rw/vxwy2JgJ752WQKVhZfow+Az/TSyAl+jVcFBiD2AjpcBmF4yVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867004;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8iYZBjVlYYxNkxBaWuErj357L087f22pPkodgyOQoVs=;
	b=P2tL1SXXV/TSvtOv9/3kQde2PyAkhDed3Zn7azCifzawRoxcEQuFAEreIuYu0zboU9Ps
	 n26bT2+ndcafW6HjtXri7Y6UZms24EfoutxojL6L/DHVBKk+gw7ROgEUkTmN73FXdc1Fs
	 x1vylKbAo8ZPMBejI2J9P69Tnk/N4QWgomsRDAVukGJSpr77lXZOkvLc4Uhb3C2Sg6Cmj
	 VnK7u1uGb7cQqCEwc1HzgLGL0RqZu1sbG73YzmgehTNtjX7xb1Irtc4mST/MT/n+BQuRL
	 Q8d04zl2fStgKInhyx/OcAC+nEdx9uuL/WyiuzNFr32oEUjY+0O/dD7TYOdKQgNvaJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mEFQsmDu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817C9606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mEFQsmDu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13AC31F000C4
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794867004;
	bh=8iYZBjVlYYxNkxBaWuErj357L087f22pPkodgyOQoVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mEFQsmDutZy1N/obcPtHewp3laoQcb5AY8Te27ZC+vLDcPv9oW2VST8KsXciFipcS
	 ZmnHf7+rPTgkEUl2RrA13AKeO324rCAdISNqi+NMtY5ViY1DiSa5/8TXWfAsxhNHSW
	 DYflbvIrElUcBpaABN3w09nlFF7H3+OQRF9ry0z1Wsz5f7OSJtaCtyowqsSHroVyk8
	 KokVgOrSiE0uNi4HyRvMIpjK8kbsFnSvBCYRTpdb4PZHA5O/z6tFuhl66gwJcneOTM
	 teKKXBFaqdnhQnQCZgokE9RtRSgSxWj2e8ZZuwFaPRiU2K8dfWcT9puQyOyWohWbWI
	 w7sCkZShDPQcg==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5075fa7ed0so661796566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:10:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFUdN/DnXmxcRvdJ0zVFEDNpE6nPVm20Qo9ylpTiMyX7RJDq1aCgiF5r2BE+NpZliy97+eAZbfHR5XtXd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tAg2kGYtIIU4k91iPqSTs0p+9bhM74HEA5Pf/U+Xl02E/9Yv9
	P/bEXnpHLK4Ro/BfQoS/q0EzYpQxeIBOWBbizBYTqUEOUdAcPrvQf1hf+gAsKZnWL/ebSS8p/yu
	LN9OhmDPQApYUcxG4GebSm3c/65RUTXw=
X-Received: by 2002:a17:907:3f9f:b0:c2a:34fe:ea4d with SMTP id
 a640c23a62f3a-c509631c9c0mr1078878666b.25.1794867002842; Mon, 16 Nov 2026
 14:10:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116161945.348983-1-0xbeac@gmail.com>
In-Reply-To: <20261116161945.348983-1-0xbeac@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 17 Nov 2026 07:09:50 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_2A+LVONLQPG+SppZNc3MPg3V65fJ0Qcw3+TparHjUQg@mail.gmail.com>
X-Gm-Features: AclHuK_M0ohWgSQXOtSZh_EaDA0ukBzDr0Q-FBxFQDqMPeuApASjKf1eWiUERlE
Message-ID: <CAKYAXd_2A+LVONLQPG+SppZNc3MPg3V65fJ0Qcw3+TparHjUQg@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: pin parent dentry in rename share check
To: Yuansheng Yang <0xbeac@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 1:19=E2=80=AFAM Yuansheng Yang <0xbeac@gmail.com> w=
rote:
>
> ksmbd_vfs_check_rename_share() passes old_path->dentry->d_parent to
> ksmbd_lookup_fd_inode() without taking a reference to the parent.
> Although the call in ksmbd_vfs_rename() runs with the parent directory
> locked, smb2_rename() also calls this helper before entering the VFS
> rename path, without that lock.
>
> A concurrent rename can move the child to another directory and drop
> the last reference to its old parent.  If that parent is then removed
> and freed, ksmbd_lookup_fd_inode() reads d_inode from a freed dentry.
> Holding a reference to the child does not keep its old parent alive
> across a rename.
>
> KASAN caught this on an x86_64 QEMU guest with a test-only 100 ms delay
> between sampling d_parent and calling ksmbd_lookup_fd_inode():
>
>   BUG: KASAN: slab-use-after-free in ksmbd_lookup_fd_inode+0x28c/0x2b0
>   Read of size 8 at addr ffff88810faa6f30 by task kworker/3:2/76
>   Workqueue: ksmbd-io handle_ksmbd_work
>   Call Trace:
>    ksmbd_lookup_fd_inode+0x28c/0x2b0
>    ksmbd_vfs_check_rename_share+0x8e/0x240
>    smb2_set_info+0x2b71/0x3bb0
>    handle_ksmbd_work+0xad4/0x2110
>
> The read is 48 bytes into a freed 192-byte dentry, at its d_inode
> member.  The stack reaches the unlocked smb2_rename() call, inlined
> into smb2_set_info(), rather than the check inside ksmbd_vfs_rename().
>
> Take a parent reference with dget_parent() and hold it until the
> lookup completes.  If the parent has no inode, skip the lookup and
> report no parent sharing conflict.  The returned ksmbd_file has its
> own reference, so the parent can be released before checking sharing.
>
> OpenAI Codex assisted with reviewing the archived fix and preparing
> the changelog and validation materials.
>
> Fixes: 7f8029591bed ("ksmbd: synchronize lease breaks before renaming fil=
es")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yuansheng Yang <0xbeac@gmail.com>
Applied it to #ksmbd-for-next.
Thanks!
