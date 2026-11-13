Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578790;
	b=mlXd/1HNXTHVNiHrZw9uWkPm99pk79B2OX/sSN47pgC8ZyV9hoezdPoLgHXd3b9yiIg1
	 wAPCR3g3P2rJdE3WVEoV+FHC9rYKgDYk2ZkChk9S2UWIYUPrpyMYGet6YfMu89ooRkKK5
	 sBtd4vIosAH8mk0ARkUHtqtT5VldSbT8qiu/mPKdCASZrHKKfeygjNbJsKeQky1Xf3Zw8
	 G+TOkinbbrfL54sdmxqm8QAOqgbVNcdJa5KNNeCTZ6LXUBr+V+rLCKg0FH63ryhwQltKD
	 3xpGAlCpBFgaE4uU0F4+Ezbp0N60gpKxjDgUdiwWRTYDtABSD1c2MU85bCcIR5EECCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578790;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x/6tLgI0j3tVJVglp8MpebFbwZLk7NDdcwx4w7n1XEE=;
	b=bIXPvou2sv9wXQPY8khSNq3ICyEaLA7b11C1SJbVjhjQW/010uO/yJcLHStircg7/At0
	 7Y9dFWdDkZQf2dZQ6GU0DmF/xxoGAY26qyi9s9M7KY5GleSkF/sd/DHnVR7E7EDNYNZXa
	 JnwtOm5ZbhZT0u+o97q1Axnd5VE9qh1N/1yEyHrRw/gCJVpq1DdaOxKL0f5kGWsd57jhE
	 IARCqR7Oi+eMgB1mQdY1xImlrGj5E5AzUZ1xtvyp+vAo5Elog8rEH7mG2ww935HG9mwFc
	 1jUzi37wGpuwvnxKT+/zD77MK2ck7uxGmC+lVNKA+ej5my1fLr/ZLWVj4mcKI1w63BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BsAzAhjU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ADA606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BsAzAhjU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2191F000C5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794578790;
	bh=x/6tLgI0j3tVJVglp8MpebFbwZLk7NDdcwx4w7n1XEE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BsAzAhjU2j2JewHkKnw+C/ZBQ+7xOYCf2ToEfG27qZUBEENCy3g8aymKcFmYbCQh3
	 dHpg3S+6rtpPM+LYOmi/19+6ymRRRhvsaz+2jCXkoXJbU0JLSCj8GPri4VUIa+J44m
	 SD1hXzG6TYHETnHlV5rclXMymnk6Ut9lca6Vt2RygEQu5O9vbtK6AmZQR5r8F0NEXz
	 XyG+hcVKgD0T9isibUa6KUAlFIEpLHkeVvR76qWlY0rgZS0TUf/puFmqlf/j4Rbl07
	 NcUpiP7TyHqXT8E4nRVU54RWLJE2vr7plhPu7JJmFkKytatV4bsBdXnZjjOw6MFmB0
	 UX72Vaaym8L1g==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6798af41644so694233d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:06:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHB+amRoMSG7/dIWvSfDAczMayltRZMbBQ2uaiynAQ3fKq+EgWOdIDAotHXR9xEdXE2cpPkXJLl93adQy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e6Kcrz6sjW8ZMHg2ipqqo4TBuNZipjU2Cvt8FNnc8UWAwnYOq
	MEaZneRrjEfO6Tb4ixZ5EVV5gsVEXrJEoGYSxLZunJOzmtpeca/N9WgjcWQqJEfsL2YAgjiOKgN
	OgXPYz+16gKpZ0zLVPnxOxgxEU4SvfJ0=
X-Received: by 2002:a05:690e:400f:b0:67c:ace:30ec with SMTP id
 956f58d0204a3-67d8965a4e5mr1864240d50.29.1794578789333; Fri, 13 Nov 2026
 06:06:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113041112.3736417-1-hdthky0@gmail.com>
In-Reply-To: <20261113041112.3736417-1-hdthky0@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 13 Nov 2026 23:06:15 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-Mq2MhQK5Q2zzhbzjBTY3P873JJ7NOiuiQerMaqpSJ7Q@mail.gmail.com>
X-Gm-Features: AclHuK_a8r9z3A1EdM0ac3pA7WzYDlJ_QM45Gg2MFEYfL3Y_ra2WPhe1Yz4YumA
Message-ID: <CAKYAXd-Mq2MhQK5Q2zzhbzjBTY3P873JJ7NOiuiQerMaqpSJ7Q@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: fix use-after-free of parent dentry in lease break notification
To: Xingyuan Mo <hdthky0@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	"open list:KERNEL SMB3 SERVER (KSMBD)" <linux-cifs@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:11=E2=80=AFPM Xingyuan Mo <hdthky0@gmail.com> wro=
te:
>
> smb_send_parent_lease_break_noti() and smb_lazy_parent_lease_break_close(=
)
> pass the raw fp->filp->f_path.dentry->d_parent to
> ksmbd_inode_lookup_lock() without holding a reference on the parent
> dentry.  If the file is renamed out of its parent directory and the now
> empty directory is removed concurrently, the parent dentry can be freed
> before __ksmbd_inode_lookup() dereferences it, leading to a
> use-after-free read of its d_inode field:
>
>   BUG: KASAN: slab-use-after-free in __ksmbd_inode_lookup+0x21/0x100
>   Read of size 8 at addr ffff88801aea06e8 by task kworker/0:7/332
>   Workqueue: ksmbd-io handle_ksmbd_work
>   Call Trace:
>    __asan_load8+0x82/0xb0
>    __ksmbd_inode_lookup+0x21/0x100
>    ksmbd_inode_lookup_lock+0x25/0x50
>    smb_send_parent_lease_break_noti+0x119/0x3a0
>    smb2_open+0x5298/0x5df0
>    handle_ksmbd_work+0x4f3/0xd30
>   Allocated by task 11:
>    __d_alloc+0x3a/0x410
>    __d_alloc_parallel+0xd9/0xc00
>    lookup_slow+0x49/0x70
>   Freed by task 66:
>    kmem_cache_free+0x22d/0x530
>    __d_free+0x26/0x30
>    dentry_free+0x8d/0x130
>    dentry_kill+0x2e8/0x5a0
>    dput+0x17/0x30
>   The buggy address belongs to the object at ffff88801aea0680
>   The buggy address is located 104 bytes inside of freed 352-byte region
>
> The read at +104 is exactly the d_inode member of the parent dentry,
> which was freed through dput() -> dentry_kill() -> dentry_free() after
> the file had been renamed out of the directory and the directory was
> removed.
>
> Pin the parent with dget_parent() around the lookup in both functions so
> that it stays alive until the lookup completes.
>
> Fixes: d47d9886aeef7 ("ksmbd: send v2 lease break notification for direct=
ory")
> Fixes: c2a721eead712 ("ksmbd: lazy v2 lease break on smb2_write()")
> Signed-off-by: Xingyuan Mo <hdthky0@gmail.com>
Applied it to #ksmbd-for-next.
Thanks!
