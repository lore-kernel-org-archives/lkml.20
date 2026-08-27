Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A453842A14D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787827328; cv=pass; b=TYRATvozuP5Y9J/M33EYG/JvArclJIqEpz+qgyv1nshR/rMDpNOoZa7X9B5jDBhfB369pSien36gA5ob1PQffDUAE/SagyIcwoIDuBVctV0FICLRianE4KPwvHxYB3TUp8VXm7Hx64HoevwosWvQAJjkbOwGDqu+rCAvEUEzUe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787827328; c=relaxed/simple;
	bh=jDDNSeL3p69BtSLhg+WaA8iRlZDcoKpu7R79daNaadk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OhKM+3wmjLvKGZjwiFICdECEukZUV4YokYhyrtZduATT0Cn/vb4gvRh0OzBALyL0twQHEPlLnMKSswA5M3A0Z1cJx7RpAD0Kh8jet5PQ4T6m5TCJy7hPkuecF4nUHQUnMca/orRkk3Rwi4E8+BEjOqsDDizfYFXir/YKANCuehA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIoscuDS; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIoscuDS"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4b1be215736so1934538b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:42:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787827325; cv=none;
        d=google.com; s=arc-20260327;
        b=OH8mmqWf7ydvmzdijoLNBKcs/KjBG+nIEKETiPVKZECIT6BSsdkcpFnKgp/uVrlHUQ
         Tr9jp4Dt4FTwYPrcGzSm6QD09zJRg50zJbg1UhWz1pXpRXSM+g+NPGQQk0bIhxMlul8K
         5TDNtCovb/A6df3B8+tH18nIlRAXyF0TV28Lw6AIWQLrzqU6yn4G72WluvIhiz+Li+BV
         sfZbgU+BKR9+kTbQJ4PaLB7Y0c0S7BklrpHB19wzs0Q+LRqPzgpLGeMW8BazCo4DjkOR
         L0i2s2ZrzlZqSicKQmEU/ujyIcTPVrWHl82BXG+V6mMnHLpRsOZdytLz1+cR/bA6cbZt
         2SSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SW3eZUWQgcNcoxpUig7bTY5Pye+NgQJZFhS+SMbV1ak=;
        fh=sVFv3i3UmViLkxzzcHv/a3KnG75dYZyhtcAUgVY3OO4=;
        b=PS1Awi6Z9XLmIitG8E+BKN7ZDtvVYzdFA8fIrCwsgI6fN4waC3NY9IxVBIgwSsD2I8
         f8Uvo9lOXjNTMg2XdFbkvzvIYe8pVANjRAfYNWMLVdFiK+DWWt/mNUb/sBcYOKMeuO8p
         NV/iREV6i9JUFoDCkf9xga3pDIsblUSwGNnmSvRI8Ih5Hp2uUREMLifcziaT9G3XezzH
         KcK2eH3x9Gca9aNmH4cTjyEoMJOomP9yn/UI0umdd0f/OgE55yxoKQwzq4X0mEMSnqwX
         CF0oHNDL/mRZMADdEc6AwSYILGFn4+QB3ocdjftJ6hvAHu7Dq4YQNKBUxYgLFfHc3LMo
         OB3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787827325; x=1788432125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SW3eZUWQgcNcoxpUig7bTY5Pye+NgQJZFhS+SMbV1ak=;
        b=hIoscuDSaxJg+VFZqS/l2b+JNhKXL/OVF25XVpKMArgBdrop4SZ1gypl9wcAteGzRd
         EkE+eJHjRA3lKbiKUGSIkP5+HO5KUO5UHNxvpcjtPhVS0X7+TdgXwSgNq/K5LWIaaZtc
         4furVILxpOCh1vcsz9g0yO2/39YsGdeD3A9xDLs/YJ8U158M3SFt5XdcNAtr8d8WWTHx
         kZ4hfZQmoKQAYejMKvr/F2SHyZ7U/vQuhqvx81YixCINznTD1thCjgxhybuA2yDQWMPo
         cdPOlYZ5CZbhKqK+EKKp4Znz460txVJc6tLaWT+JLoOYwy+vIJW3YoyV61qz3jl6UfNF
         EhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787827325; x=1788432125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SW3eZUWQgcNcoxpUig7bTY5Pye+NgQJZFhS+SMbV1ak=;
        b=nbTXhK6o6HjigevGUZXNtuxHTZQZSAkPpLYBSvyO8s8iE5hcqComxADQbyc/euwup6
         eeORSJIshps9ECV476W4ZrGohdnF7mOuVtGSO0CWEePlwyideMbuKKmcaRCFuN5H99Eo
         xVse1SsNI61zrhDHF4zyvdgwsiCgEkMLvuN/2eEHZpTeTuLtLkdtPWUvRkp2Z4fZlHgY
         sWvdkBzc+NtqutRjS4NpsKfeyQf1ZKlXq/Vc2ZwxTUCh/seMx84/0FbXwBY8NBmHNhFj
         /b2TOSjHOiuIZuyd/IkapjbjSefmN5LF6YawX9jrvqGbEYJEnhaFGlS6CmiNpisxbpbp
         Kd+g==
X-Forwarded-Encrypted: i=1; AHgh+RobdV/7BDFzL6vR1thplJXQNP5+Nq16EHCl9L9LP7Al2aWee4e0NG8bDiXuuuh8so1dXPZsMNjOOB6QR/o=@vger.kernel.org
X-Gm-Message-State: AFuF++lRH2lx+SXnljeDcWaxqymGU3frAElwx1uM2PvZyUY1sH5Iv6YE
	47bxt6D5ug01gfWLWZ6w7n230LTCNwjyzBvI5T6s++CgqCxo0mz9/JZJTqxX3t7XYMVWdPs8jUp
	JY+PiRZkBT3bkuk2vJE/TznC1Y4WecWJwDB3MN+o=
X-Gm-Gg: AR+sD13mB46UUjWaSeqFkInLB8NwWMNH2jTqnmGkIoI24KbjXhw69p7OC9HfvfLbCAR
	BR7N24O3Xohl62Gx4aH/R1g/uZLMdV0WSKiWH3FRaEbXgSIknHu/WO6RM9hffYeJansVaSFIEX6
	nVDGlsnpy1bCLFET4S9kw4q2KGt7yWvTuil3eEq19ubZzetYN6Op4h1BOSfXC7buDN1fciTsVQz
	D0gMHE5KFwdbld7qZLd5p/jBrl5fVDkzyTy3H2i5DdZ9uyuBv3mkVU79PL/1wN6DPRE7rKmtDUl
	u8VZNKFEO/gCopCQxXpfSa/OPVFMkp5OEZ48x8NCSVYK
X-Received: by 2002:a05:6808:15a0:b0:4a4:ed9a:e7ac with SMTP id
 5614622812f47-4b3669f06a4mr14189855b6e.1.1787827325398; Thu, 27 Aug 2026
 03:42:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827051859.45511-1-blbllhy@gmail.com>
In-Reply-To: <20260827051859.45511-1-blbllhy@gmail.com>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 27 Aug 2026 03:41:54 -0700
X-Gm-Features: AcwNN1UevfzNgu75Mwt-YYuX6NdsUL3CSX5zO7op3uaz_fQCeJoL4xqHlnCj_DI
Message-ID: <CAMB2axNFOC9G2RwOCnsWDth83REMWnmPE8gxMwbLYoGusw9miA@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Fix NULL pointer dereference in __bpf_sk_storage_map_seq_show
To: "Cen Zhang (Microsoft Security FORGE Labs)" <blbllhy@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, martin.lau@kernel.org, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, wangfushuai@baidu.com, bestswngs@gmail.com, 
	mattbobrowski@google.com, kees@kernel.org, menglong8.dong@gmail.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	AutonomousCodeSecurity@microsoft.com, xmei5@asu.edu, 
	tgopinath@linux.microsoft.com, kys@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:19=E2=80=AFPM Cen Zhang (Microsoft Security FORG=
E
Labs) <blbllhy@gmail.com> wrote:
>
> Iterating a sk_storage map is two stages:
> bpf_sk_storage_map_seq_find_next()
> returns a selem, then __bpf_sk_storage_map_seq_show() uses that selem.
> __bpf_sk_storage_map_seq_show() re-reads selem->local_storage via
> rcu_dereference() with no NULL check. A concurrent close() can run
> bpf_selem_unlink_nofail() in between and set that field to NULL, causing
> a NULL dereference of sk_storage->owner.
>
> Oops: general protection fault, probably for non-canonical
>    address 0xdffffc0000000011
>   net/core/bpf_sk_storage.c:809 __bpf_sk_storage_map_seq_show()
>   bpf_seq_read+0x366/0x1120
>   vfs_read+0x174/0xa50
>   ksys_read+0xfc/0x1d0
>
> Return if the re-read yields NULL.
>
> Fixes: 5d800f87d0a5 ("bpf: Support lockless unlink when freeing map or lo=
cal storage")
> Reported-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
> Cc: AutonomousCodeSecurity@microsoft.com
> Assisted-by: Copilot (Grok 4.6)
> Signed-off-by: Cen Zhang (Microsoft Security FORGE Labs) <blbllhy@gmail.c=
om>
> ---
>  net/core/bpf_sk_storage.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/core/bpf_sk_storage.c b/net/core/bpf_sk_storage.c
> index 1d295a8769fa..7228520aa2b6 100644
> --- a/net/core/bpf_sk_storage.c
> +++ b/net/core/bpf_sk_storage.c
> @@ -806,6 +806,8 @@ static int __bpf_sk_storage_map_seq_show(struct seq_f=
ile *seq,
>                 ctx.map =3D info->map;
>                 if (selem) {
>                         sk_storage =3D rcu_dereference(selem->local_stora=
ge);
> +                       if (!sk_storage)
> +                               return 0;

As pointed out by CI bot, should this be SEQ_SKIP?

On a seperate note, __cgroup_iter_seq_show() also seem to return the
wrong value.

>                         ctx.sk =3D sk_storage->owner;
>                         ctx.value =3D SDATA(selem)->data;
>                 }
> --
> 2.55.0
