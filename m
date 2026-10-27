Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793109903;
	b=DyfS5WakecHop8MUri8eKdUSb7Qa8KK84qcsy3LD4QiOLGLCQK7jP1Nn6qcweohHGfdL
	 iP6buSeOp9Gm8fn2OxUMPLKVV1sC39i3eHujWjaamOkQnzZ4zeh5gsw+AOrub+8aAaWhy
	 KL76NBhT18vkOK1uVtxUKB/m7OwFAlgSOHfSX9a6t0H4BKuKzkPD+GzaIfY8dUZwuFeY5
	 L2sFQoxifiiov1FM/yt4VacdeVmOWYFqe7MkAYJWNQJRSkoneNIoOTsSGBTxQ4pxQwwjs
	 +AgtgcQM3HwUA894VREnWbhvAXbKs1d5hsXQ4nLFEA1igtNCLxjn/m08U3pkcLYs+Tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=W7qpgLW06+QZrv93vDvbBbOUt30oIfC1Mu6jHbXPALI=;
	b=BxPmv8o7sWaPb+9osevqYieXrL01IKAjOKMmpZH3UDI4RslGKP6MgQQG7e9KaunNvhZa
	 ClC8vwKi7JdhaRdbEiJonUNHX+JOJwzNPxybf0dJLMy1EtZTpP8Xpf8z8zb+RdueuMHZO
	 fgEq+VM9TDa9pd5DZuyflRHzIEsSHVx5aYI/ae72cIsNmBI1kznhm+eU7sgURi52xpdcH
	 iKqw51ENSwGHMYhuWJbSwf+uzFTQhne82ZsAwl/ouNI+BTrR9+frYgp+CfIzbk6r8r1/n
	 HTxBVWoHKNj5GgG4Ek/WhddHv3XkEjuZfxZn8agGcUOmztzM4vxHFm6LT9OvFNBDrjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f4CKSjku;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03617606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03617606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f4CKSjku
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7c2f48f3a96so1422425137.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:05:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793109902; cv=none;
        d=google.com; s=arc-20260327;
        b=AfbLLb703J1PFiqDV1R312+u6oMUBQihH/I1MutbDQQMHzwPPOz8xD0a/CWhukmL1X
         Gsg4avpprSZwH0zyeCStVwcm7p/wCaIpXcMZVznIvQpi1iqPzkbd6nkkcYkV5eZtxMqR
         3fsHEbLerZ9L2GnpVPo3b6BPTRuD2dm8LbT1o6T+kXxATHjCowGE30FqNaK1g9FXS+kN
         RZMmy/DqLqAklFeMAp/GbP0WWWgHXxOkj4K82srHrr9qt0Zdw2WXvLQQqygZECVeXfE3
         ZwGzuur+KJQsNZN1G8DzGBO73QFRZdlha4Sq+k7TwAQyfjqxFwC1DwG/waWXY1Wc82Fs
         hgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W7qpgLW06+QZrv93vDvbBbOUt30oIfC1Mu6jHbXPALI=;
        fh=fwO2zYky0IuTLj85hNlVIGeVUrsoIMX5Awlgc/fT/b8=;
        b=pam9LO5Jt/4OIcOap9B51KcxRQFlOoEtPXcCKErZzsbk4mB0pqJxOtJpaMFx5rAf/e
         YVjCjaza/Opzskfp1QnYsFf7R9EESZhHajz5ZdUe9lPbQ6gYUJ7jVRm2Dka++qatMZte
         l82JXXa2qNM9q8sZrkFvvLk8fIH19En56Q0+qnM9DBPhGOzhZbNJ8P6fbRGXlx0l2Ddm
         mZiMgprCplraI2a5UMxM+7vHGe4C3F1KVzNHBBJ0PQ4XTkr4t507TXlnnBqnop55WKLq
         4Ho6r8zKzZ2/o37DqKFGnIQsSbVn0FsP9/X7liUXM6en4qOzbPf1IAbugBY6bYG8zgLx
         2iEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109902; x=1793714702; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W7qpgLW06+QZrv93vDvbBbOUt30oIfC1Mu6jHbXPALI=;
        b=f4CKSjku6gUhocCowGjqd8WSenkgeuJb5RsCcPvqoahEPcMOi8Ba4l72MvO/FVe1oZ
         AAJ+J2pDTco6WxfDjEJW5eGVZgxq0k0JaGF8ku8MuKrvKSEVVIXCfU16ix1Zf/NdyWhO
         8b4dbTsRpXqiILHVmpdb7M3wJLbMZd097wjwzoArfFSPGldtQ3kpM6d6rgLspTXbXPNm
         ufkvzR1c1+ONm1gOcHPQ6sMd+tSLzZ5tGJoCUS77b7vR1PJQSxx7kwoPsyOzJsn2tQBu
         gOMPd2I1m4rnMLlCKgXdqEFXeMcdTxpmxq4FFPJ/r4tBJfl85fxXzCJPZjnX5VJtyBLF
         mc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109902; x=1793714702;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W7qpgLW06+QZrv93vDvbBbOUt30oIfC1Mu6jHbXPALI=;
        b=v18oh8WGq98NW+ri/Kd8f7k6uVmto1khhrVsbVlr7pPAehoG+ESewneBK+USaic8AZ
         rHTduV+el+KTRTg191vVnRCSeB+HLKDfHKoOFaG0XC45fcCmxaG5jfoteW9yiZr2e6Db
         bIRSK/3owoQxocUVtsnKpZsimDwKvH2V1WMKH91d4zuHEz8SpAbzfklYWSMILpZhhuYJ
         2/OwpR3MSewWZmeqMEmTmJHwsswSoRv8yC69X00kYgOJZw29HFwThwVTnY1SXsQHseID
         Gl5v4n9wsmf+d+S5uGaM8eMtiPKJ4ppOcMFVTDA+/kwv6lZ2oiGgPkW0Uwi6QHDYoCuB
         FTwg==
X-Forwarded-Encrypted: i=1; AKwUvBzNvhUlHAyGov3QDZQwmGUmoJiGFo6o0vm4L+wvVLaKW7DYFtAJxXZMQRZvPt2JmFnu97N9xhym1f3XnTA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhaAhc5WtsGu7gjp7HwdvvHPogGzgPkZuhxdqq+srfyjBf8Jvy
	eiGSc/MmWEPc7nFlDr8KS0JD92dAVI5yC35vC3t9ZY1OKvJxV2c7WJ9FpTzGDrPP5Ksa55oINtu
	aiiSY7tP1lAVEqlb2WoR/PnTuyGnriD0=
X-Gm-Gg: AYBFou0IgaDxNhDPccA3S6d4IHVkjFbfUSFu+1CRAhSLUK0KKGnganwxve/vqC1Wci6
	eVQEWpkmzS3KmB69kaJEwBzNDzJtjV4zXbuRoBLIHMCL8Yu+mK3SAaat66gxo/Cy9ZlxCrpaL6a
	teKViwnG/ZnUAZsBGIFXgMaKTedS985XOIbx1NuFsVfWI7Y1E9U04z3axNG0PRQC5UW/0nfIDwa
	ujtAy4Ovd/2H6GVXb09/okzzAYu9xt9j3SAxMsg5fzZIjVLGTy1xM8baOdicH8nRXesX3JbwJHM
	z9q50+oJTeGDctmQShSkhtqIfcfiZOFkyu/jhZkvD23h9mB53nLgY5/8s0SfURgEtom/CPbz5Hm
	lR6XEB+NhW4+krfYoohhkBUASn6Rlu5Mce9ft
X-Received: by 2002:a05:6102:3309:b0:7ca:e2c1:9a0f with SMTP id
 ada2fe7eead31-7ce5cd20f82mr2802725137.17.1793109901915; Tue, 27 Oct 2026
 07:05:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260802195328.175328-1-f3lix.dev@gmx.de>
In-Reply-To: <20260802195328.175328-1-f3lix.dev@gmx.de>
From: Cedric Blancher <cedric.blancher@gmail.com>
Date: Tue, 27 Oct 2026 15:04:25 +0100
X-Gm-Features: AclHuK_UpWvnj9vrPaA3gM9vlPqsDL7lIYE2q4KB2vEFQmM7Zny2Xldd1i_stCA
Message-ID: <CALXu0UcEbcHbb4F+pKG1vM5XmgTcuHiLn8Y6y_hQJAYjMdZeMg@mail.gmail.com>
Subject: Re: [PATCH] NFSv4.2: request mode after CLONE
To: Felix Hoffmann <f3lix.dev@gmx.de>
Cc: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Peng Tao <tao.peng@primarydata.com>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 2 Aug 2026 at 21:58, Felix Hoffmann <f3lix.dev@gmx.de> wrote:
>
> The NFS server can clear setuid and setgid bits when CLONE modifies the
> destination.  The client currently omits mode from the post-operation
> attributes, so the cached mode can retain setid bits after the server has
> removed them.  A local process can then execute the file using those stale
> privilege bits.
>
> Request mode in the CLONE compound's GETATTR.  This lets the ordered
> post-operation update install the server's mode before CLONE returns.
>
> Fixes: e5341f3a5762 ("nfs42: add CLONE proc functions")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5
> Signed-off-by: Felix Hoffmann <f3lix.dev@gmx.de>
> ---
> Tested on x86-64 using an NFSv4.2 loopback mount with Linux NFSD and a
> Btrfs export:
>
>   - before this change, the client retained mode 04775 while the server
>     stored mode 0775, and the privilege transition reproduced in 10/10
>     non-debug runs
>   - with this change, both client and server reported mode 0775 and no
>     privilege transition occurred in 10/10 non-debug runs or 3/3 KASAN
>     runs
>
> The reproducer requires write authorization to the destination; NFSD
> rejected the same operation against a non-writable 04755 file with EACCES.
> A working reproducer is available privately on request.
>
>  fs/nfs/nfs42proc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/nfs/nfs42proc.c b/fs/nfs/nfs42proc.c
> index ab86246fc364..35a4909d51b7 100644
> --- a/fs/nfs/nfs42proc.c
> +++ b/fs/nfs/nfs42proc.c
> @@ -1302,7 +1302,8 @@ static int _nfs42_proc_clone(struct rpc_message *msg, struct file *src_f,
>                 return -ENOMEM;
>
>         nfs4_bitmask_set(dst_bitmask, server->cache_consistency_bitmask,
> -                        dst_inode, NFS_INO_INVALID_BLOCKS);
> +                        dst_inode,
> +                        NFS_INO_INVALID_BLOCKS | NFS_INO_INVALID_MODE);
>
>         status = nfs4_call_sync(server->client, server, msg,
>                                 &args.seq_args, &res.seq_res, 0);

Felix, did you report this issue to other NFS client implementations,
like FreeBSD or libnfs?

Ced
-- 
Cedric Blancher <cedric.blancher@gmail.com>
[https://plus.google.com/u/0/+CedricBlancher/]
Institute Pasteur
