Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418353;
	b=owHcCtDYHYeIJ+YIhAuEagMu6+SyqM22HXv3N4QK1w2OZd8zRD1WpuxkCJNrHbYmGput
	 UCEx+zhHqi71EHirC7d2fqlQHO8mbO+QH+5PW4wfq90xsKM8zp9Qh3do/K1JtHZc6XDus
	 mQBhwzFSHHY9lh//viW9moVwe+nNqeY8hId4HbhGBuZr2jWrs1qyZK+BVM2zIuOO4UgMM
	 AYcVdFjOUEHEk7weNcXl1Pp7LwMIruGT/jGKQrJ91cPfqgG7Sq3bcwkh0ZEcplNdzjGso
	 BUHswP3JvBVR6g+e27e8AMfzpkXYYzgpdJTWWiybWEWVD55F0xIgR6L0pkOG9BX8hSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418353;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ywa8GwVt/KmL5oJA+4U2uk95z2A84lRU6JltZ9dFa1g=;
	b=u8YZ1RXctAESuJvLaSjbpumwbl+AuLornn3mMS3Cmpy7OVPuDu5YWpfMHnZhjsm3V4+4
	 3KBtxwYcygxVtNa4EdeliIswtWVG3EOekwBoKPN47NsquTTMzZyN3l+jwKtwe/jyg5B8z
	 sXNsWptlIVFdzZIN3DkR9REEUnZfdtTxQ2alM3YrEkg7sIXZ8QwIBKGNzUTm8/f3nT5Ge
	 +ItW/gWByIYn3xMfAwkbQZedYw0IByDx7pIE7sKDPBjZxrxGx6Jo9ISYYV/v2oCk5K2Ra
	 Nyn3SkE7y3+bOwSjVy/AunHd4C9u64MEAbOxi98gIGBBUwgK1yK6ugJRSaqlRk4uAPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NGcmfYsV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0D9606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NGcmfYsV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3FBD1F00A0A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418352;
	bh=ywa8GwVt/KmL5oJA+4U2uk95z2A84lRU6JltZ9dFa1g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NGcmfYsVMNK2jIfECKW6t+ogu13Iy6hUN7/rS1lQ+V8MSkXzcuVEYy9UxV08PriOH
	 SfNc851qukWrDdzXQweALyQHN+zDLztgOwD476HRau2sboh1Xqb34XcSxSJk8Q8rLe
	 s9oa+HN1AUS6gEbTRTofZpPjmYN/NWLPgxEL9gxWIICy+UH3S8nYZq8ykFPxk6vkRS
	 aYw9Qu/HBioGO0BDWkkYK91BgzWzbMjNkszfZzJnPzw9X1dfLrthrFo/xjcjKDoKr6
	 pkYj9HJI8lnT3PC5Dc83Vq+jLrYxJt8RNoOnd3UBkfG43dK1hhCCse+0fsv/POTAWp
	 c+6O+wCwiNFrQ==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f269e335eso404007885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:32:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGZXS6n7pZT82/QaKSQXSPfYyANxJwYJPxm1KbbopfqmjJ9jATKd8cBgv09KyAGKW90neWHDyIaFLui06U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v3Fqw0wfIIH7KAfu6KcGehq3/rVH/2xPqaMGtDyL8zigSrNy7
	M3Y44HMVf+I+RMB5wxotAouV2alCMWgpQln4NLtLJA94zmnMues6mBTjUUmbdBGreZ02/PUZ8vT
	AuiLaqkvVwq6g4XMnF84hX2iPweq1WgA=
X-Received: by 2002:a05:620a:2a04:b0:947:8018:978e with SMTP id
 af79cd13be357-947afcd6a2dmr491643685a.6.1794418351931; Wed, 11 Nov 2026
 09:32:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111053551.3367903-1-song@kernel.org> <20261111155441.GA1829883@joelbox>
In-Reply-To: <20261111155441.GA1829883@joelbox>
From: Song Liu <song@kernel.org>
Date: Wed, 11 Nov 2026 09:32:19 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6_WsuabPQ6unancwouSPZStQQZa8WoDG82-n6Bi5gPhg@mail.gmail.com>
X-Gm-Features: AclHuK_XeHXwre1C2swC-LPtC0Eivggyjbn1-sGfs75SfQVLn2Iu7oIm5rK3Dq0
Message-ID: <CAPhsuW6_WsuabPQ6unancwouSPZStQQZa8WoDG82-n6Bi5gPhg@mail.gmail.com>
Subject: Re: [PATCH] rcu-tasks: Use pr_debug() for callback contend/collapse messages
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: rcu@vger.kernel.org, paulmck@kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, rostedt@goodmis.org, leitao@debian.org, 
	david.dai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 7:54=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> On Tue, Nov 10, 2026 at 09:35:51PM -0800, Song Liu wrote:
> > Commit 5de907d24919 ("rcu-tasks: Disable callback contend/collapse
> > messages by default") added the rcupdate.rcu_task_collapse_debug module
> > parameter to gate the three pr_info() messages that report RCU Tasks
> > switching between CPU-0 and per-CPU callback queuing.
> >
> > The kernel already has a mechanism for debug-only messages that are off
> > by default: pr_debug().  Use pr_debug() for these messages, and remove
> > the rcu_task_collapse_debug module parameter, its documentation, and
> > its boot-time announcement.
> >
> > The messages stay off by default.  On CONFIG_DYNAMIC_DEBUG=3Dy kernels,
> > they can be enabled at boot with:
> >
> >   dyndbg=3D"file kernel/rcu/tasks.h +p"
> >
> > or at runtime with:
> >
> >   echo 'file kernel/rcu/tasks.h +p' > /proc/dynamic_debug/control
> >
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Song Liu <song@kernel.org>
>
> Makes sense to me,
>
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
>
> Will apply for 7.5.

How about we queue this for 7.4, say rc3 or rc4.

If we delay until 7.5, 7.4 kernel will be the only one that has
rcupdate.rcu_task_collapse_debug. IOW, if we merge it to 7.4,
no official kernel will have rcupdate.rcu_task_collapse_debug
at all.

WDYT?

Thanks,
Song
