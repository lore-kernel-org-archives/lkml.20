Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793979714;
	b=kSZTNhekLPJ5SVqn0EzUv8dAM/DG9fAIlt+4Ij5/eL1QLUGN3wfu3OvkYMT1Eddu44Mu
	 xYZ8TXGIQBTCfjrADKBcg5KPHL5GJAZCZiruFaTOhBDIeeWpI2z/V6g3NJyFfFPLnyfwY
	 lG8DCBI2OrWBP2VBb8b8uXoR/o8P08SovggoAHSw7RFDul2xfKARvEeYtH7hbmLPZzaJY
	 k6XzKPK7cDP1NXRPBV7etvyDcasdETapk3Ik6cbj1x5vheI71oGl8KFSCUD+JiW+4RliS
	 9+biMqXuVmOo+M2KYwv1RrC6tOAgG+1423oIIixTu7a68awe35fgdyDlW4StPq1eUPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f5zCwiaGTsbGPs9eRvMEIe8q2LEwYAAZXAgxvtWlbgM=;
	b=1d2iuddJVU/PQfC+sfwByrbD1E2JQSqofIF6pBSey4nkJ+TTj8GXrppIRb2jPRz9SlOo
	 7l62+IHVRmKe55gFhJh/N6EdsZzFeD4QP9R/1ZMEwEosiSSHWWOLRF5dVlTmZoqsjcW0D
	 mCSkvoOgQLa1hHALkA5buxd4SQxnPvl4KTm6qRfPLCGvZ7ioG8dAeTZzX3mDflQ8WzYgu
	 za0GP9QDRalrV6KAAxc7JAH9Lm5aHI9zF1Rbzgue3+x6k/o+uOaotg5CJp0Q8wNjYZqvh
	 WLOo9zH5W4JOnlro5PykKx2hRbc+GHNxOg5A4qc9Ev6n2gqUZJyKCUIuP2t4cV2bE0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=YzzkId+7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5128606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5128606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=YzzkId+7
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso505946a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793979713; cv=none;
        d=google.com; s=arc-20260327;
        b=sK0c4RgmGuQOoth1Z+p57WrZAgy7GADe/z6bFlRwMUqCKfwHgVfgjJhTjY653kFAzm
         Oa57R5I4gy9pWvs2iBHfP+VX9kw/QGhBXy99h44MrFDsGYrGdPpeMTqCqODYlar7t1Ux
         yZhLEkJfKCLKqv3OG1eMJU+uO4rRF+xeMOBDydQtw0ChdlttHV6+Rlkngb8JjpRrJ47i
         nqE/UHdYkOtUPhCt6FR2z4SbY6i95eLFn+sI5h1GpkQxFpq2be0PQyQ3ZQjn6vuMdW9i
         VvC92r1l9NsP/36OKbFDJQwrXKCJsKgMpYxmTQJ9TP+cCSWWZrPgDfX9gCiO0mzDa0qI
         Yk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f5zCwiaGTsbGPs9eRvMEIe8q2LEwYAAZXAgxvtWlbgM=;
        fh=1+atljFb+EuVXlNA/Lp9VtlsM2NFT99tf9AWq8PjanU=;
        b=qZWAF+rFRwdC8u97hoBk7DTmA8XiJTWzmsV8zboBx4r0Y2v/dpHuQEVlz3VAcQ0VNh
         m19t4VKPD3eGu/XeKJIkrzPngX0uvWHjnwkEGp0t79QJ7i4hb+tzIu6LDOPyi3O7+Bmv
         ZlqQpExNDsB2HV//y4fKgjy4uiA2tIeVRjRGqvfM1tOfhpECIHfumwW04Lbh3aaM9fLO
         K1+ZjfRvXhNiuDhukTwUhPCCjIC4WI3IS50IQSN3bXHlmL4Y8z8SYPFYtdPMkkO2seZ9
         S7HSfbID7l1nQkv+vfSqD6/35PCgGalu9De75XxvnnniFB/vEoau4Q/fKno6F0K/KKmL
         L8Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793979713; x=1794584513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f5zCwiaGTsbGPs9eRvMEIe8q2LEwYAAZXAgxvtWlbgM=;
        b=YzzkId+7qJWBrdgBc3KwfkNFPjAIr2flDfLUmoyshQtncc+Ndvd9sON1MwFGvz3rBp
         VhUf+70b8rH9KxwVnJgIiQ/o3uPTubnnQg4/6C9PTyoSOFCHY23cuoI6OZcK+UoSUnVD
         XtPEQzgxzHkAgFXXLZHstTRu7Q0W5sZ4WrnTsJlkN+k76PtkLxv2iUv4JboT/5HiggmU
         cd0o63pDvyV1UoBwxLbT3ijZr2Dxspu/UqNmNP0P8Bx1TbBSh4+hMra38mZz1yWkEPNG
         X05TDXL5cHFzv6snJstidZle4eSSYbEyRHSCA/H/ky8GhV+s8vXINgjx3rQ0Y0F3UC0T
         BY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979713; x=1794584513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5zCwiaGTsbGPs9eRvMEIe8q2LEwYAAZXAgxvtWlbgM=;
        b=w5o0mQBzwRwPofGK15DtDzQxvtPbVf6nnQp1JXfxF4bEbFHdmQoGUOyij740ivdy3P
         CaLBAwLOkVY9yonNRh2lcGF3j1M8lUpMe0bdmFzlEPc0QMMXWq5WMKij1Et1I1Buk3o6
         QpgRnTA+Y6sWESz4c8YrVgaU4n+xP7LNjxECfDDfOUjfzeRgbB2xqtsSMPdvl+cScQUj
         uVDtFHt5gdUUrWoIyLitCHALNFBtVck5oPgauc7OaP49N3rGV3vaBNycCTapEBqr+ogl
         QQiheGDnNCzSE7VPpKPATyiOqqmPjxJF45PRO6d7+5tP3s84nncUG65LMUPrQS8W+zIi
         rkkQ==
X-Forwarded-Encrypted: i=1; AL+hErEC+83ISVZz5SHVA0mcDi1/QVoJ88JkcAnhlIGcynaMd0XiefcS17JuDfETMilJAvYvCGTQ1lZne+jVKts=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iDcUvCGABPY2jm9g0D27bxkicmI2UgiktrrBMkfJh64sOha28
	3ChkQiMYQid+ahpCkDcdWqSdkh99xQQYCtF8J3BHEKSNqdesoZFt+6Sfv6lPP1DpsYgrpmjSm1n
	uKKfBVZqGNy1/SvLpVteLqF28+c5kIdwVZRKnd5Dcc43sI/XcHG6eVc9r
X-Gm-Gg: AYBFou3SD8SXB7AZvocQDLIEdVXIOrHNNdNycvuiqXOx/LMemmYZ8CwZVptl60fiEOL
	PpQbOD4BrTIBpssYaBoHkq7i9V9Lcn0tahb9wLP8iWtE1BUbLQHezZQTcGPEufJQsEUVCq5jjd0
	eIMP9NxD+0YWxea3bBOsPZh8Yf4uucH0ViD0j4Lv7u2eRoTKhL3ef/+EDeWvqaDsPh/3ZHqQlYh
	IDdTylqN28wUCM8zmSez5MuHX+emDVfNterOosTv9bbF9yjKGZn5frNYJwD7RqeoORQl6SdvO/E
	y4NjrjKNBneUXsutm9gwNwlj7cC3pmN3MjT+1eLR8MGPhgrtTH24ciB50dFBzxTkbHob/xfsFxy
	yJxIMljVqRBipQdGmGE6HRRwOrTkDyW1/meEE+iGZ3QE/pfuhwdvBVsvW1+YO8F3si9zL
X-Received: by 2002:a17:90a:e7cb:b0:3a8:bd51:205b with SMTP id
 98e67ed59e1d1-3b0db6dc4d1mr3040927a91.37.1793979713085; Fri, 06 Nov 2026
 07:41:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <d85ece6e-27f9-4d9f-83af-4101bc76fef6@app.fastmail.com> <356db94e-f5d6-4fb2-839a-b97aef72256b@app.fastmail.com>
In-Reply-To: <356db94e-f5d6-4fb2-839a-b97aef72256b@app.fastmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Nov 2026 10:41:40 -0500
X-Gm-Features: AclHuK_vNxeGvLMu2q-_O9-3vD4QrJi4Z55I0p-SIXPf7gkTSj9ZotO9tBGrYyA
Message-ID: <CAHC9VhR9sjunJRnM9gy-BkBZkapQTrr8a8FtmaK7JkAmUqTrLA@mail.gmail.com>
Subject: Re: [BUG] bpf, lsm: new first argument in 7.4 inode hooks silently
 breaks BPF LSMs
To: roblabla <linux@roblab.la>
Cc: Daan De Meyer <daan@amutable.com>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul.mabileau@harfanglab.fr, 
	linux-kernel@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 8:39=E2=80=AFAM roblabla <linux@roblab.la> wrote:
>
> Hello,
> First of all, I'm sorry if I'm sending this email to the wrong mailing li=
sts, it's my first time reporting a linux issue ^^'.

Hi,

It looks like you sent this email to the right people/lists, well done
on the first hurdle :)

> In commit 16959c469f232f5c76cfb628297cafbf6dbdba79 (lsm: expose mount idm=
aps to inode hooks), merged in 7.4-rc1, a new argument was added in positio=
n 0 of various inode-related `security_` functions. Specifically, it added =
this argument to inode_create, inode_link, inode_symlink, inode_mkdir, inod=
e_mknod and inode_permission.
>
> This has the immediate effect of breaking eBPF LSM programs relying on th=
ese hooks that were compiled with BPF CO-RE and using BPF_CORE_READ.

...

> Now, I'm not sure how the Linux Kernel treats eBPF LSM hooks - if they're=
 considered part of the userspace that shouldn't be broken. My understandin=
g is that kprobes are not part of the Linux Kernel stability guarantees, fo=
r rather obvious reasons (they allow watching the internals of the kernel) =
- but I'm not sure if this extends to the LSM Hooks. I assume not. Still, t=
his kind of breakage is really painful for us, and I hope we can find a sol=
ution.

Like kprobes, the LSM hooks are intentionally not part of any stable
API promise.  While we try not to needlessly churn the LSM hooks, we
reserve the right to modify parameters, the LSM callbacks associated
with a hook, and even the basic hook semantics from one kernel release
to another.  The reasoning is very similar to that of kprobes: the LSM
hooks are linked to kernel internals and thus need the ability to
change as the kernel changes.

LSMs that need to provide a stable API must provide an abstraction
layer between the LSM hook callbacks and their stable API.  The LSM
framework is not responsible for the stability of individual LSM APIs.

> Could we fix this type of breakage by making sure new arguments are only =
added at the _end_ of the LSM hooks signatures,

I'm sorry, but I can't make that promise at the LSM framework layer.
It is impossible to predict how the kernel internals will continue to
evolve and thus I can't promise how the LSM hooks and callbacks will
need to change as a result.

Regarding the specifics of how the BPF LSM has dealt with this in the
past, and any plans for the future, I'll let others speak to that;
hopefully they will have some tricks you can use to make these
transitions easier.

--
paul-moore.com
