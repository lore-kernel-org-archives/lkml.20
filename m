Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662895;
	b=tcup9L+DFQXVPOMylRmXokDLbVF/GhPoy1RdFdhP2u+sFue7Viol8HIhtTAsn+AAYAtc
	 KYSBJtqJ6uSYd5nK0ybAjT9GPkUOp5w7AYgv4kFYfpEI0gy6SyUvx4OL/lNP7coj2tq1r
	 b2vOu6ya5Aborx+Yohs70eRTUdDQoGKfUxW/mgVnBArOAANExruahTVY4wrirIkpY85ER
	 OlSlAbeEAxvmF3CovUq3t+LvAcQ3dVrVCtsYjFN9ESBGb9AuCVRHhfkZa3DPOP1Ii3dkq
	 0UkEYN7AcPrpXLJH/p5PRZ3tUfxz9WFZGM0FPx423BI9XBMwHFpZu9ilDSOGM79mhBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662895;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Dyb0KNEBDyW9YUH/H8NB1sb2XfBQhpgJT9JPFKBIQR0=;
	b=WldtqZ85y7FbM/kPVqYGliVIqgKdWuPNFY70wKfV44LeCHxtQtCRIP3TPnSG+nQ+/lk3
	 80mUU9aWjHciULYdrGM9qGO1PTWb86AnEcgE1Z1ynKye0WdbxA8buaGnlmZPR9G76pnCg
	 peczVIs91UTkfD4CuZoOlnurBKpndcGhY1ChZFcumg9K/DhtXzJVnunkyKJzv1eKOgTfa
	 27NzhYBQMJ6ryQTYBDOBkDuIfDwi0pZpp7MnHiSxkkekW1+XSjdH54UG2+ZvdCzEGQVuv
	 kAbx6TgqqpYexawEbFEhWNhX79DOGoOG0GBfsAv+brccOJoggnMvmkvKnhn1IekZ15A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gcEKMJZr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEA6606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gcEKMJZr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAE01F00A1B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793662894;
	bh=Dyb0KNEBDyW9YUH/H8NB1sb2XfBQhpgJT9JPFKBIQR0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gcEKMJZraK7/1lnoIxsE4M0dToWDBIVmwxvZeTbAW0zRaJ9SXE5zevsln6eLNtZzo
	 yDxbYFWO3a6eKMh3u+gpl9RLkQfCLMmwPC6UMrPVcpJ7KyYSXdAy7z9hX3WmzNGlE4
	 rp6EfVtsi7JEA2yppF2327WS85/tKckSlQeRLVR3NzvAxu2/iFLplc8+gh/bAHPtdN
	 XupmLrstuma9RYmMcF0Eqo2P6v8HdOjbe4EpfAKxT3JDCq7e7M1nQJIBtSadaVrtQ8
	 11h9HAghsglPYIAc0vQH+rM1a3dnxedJilUTdrxlPWB2bfbloh1G+GN4U+XPJMha6m
	 DwUMS89EGMIMg==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so576064466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:41:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwEoyF/4nshOZu3jA2n2DPRLwUHUCq/Ue1+VlXmI552/b6uLpQzuop8GbhXsg3XdANsVFmLArn4LmV3BQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8288i1czaSqHahXNUrLc/B71+l1HRYr1laLoV+gGKYfnB8XTdM
	p8lNVMRd17hzqJfWVAqGCT30xxxDnKDJS6uQZ9G3VLbqUTeiZewC9/bhxTP1q/AA6N69DmDUmto
	CBozAoZ9j32McwOw+NqlPtdF7quXl3kA=
X-Received: by 2002:a17:907:d91:b0:c35:babe:ab44 with SMTP id
 a640c23a62f3a-c4ca740b297mr962386666b.0.1793662893123; Mon, 02 Nov 2026
 15:41:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102200353.884509-1-icb@fastmail.org>
In-Reply-To: <20261102200353.884509-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 3 Nov 2026 08:41:20 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-s-g2V4LNY8e5SsH=+0r3qLY+AeOa5Lp9K0T5p_tnA8A@mail.gmail.com>
X-Gm-Features: AclHuK9G_vi4S7-_Tc8OkG8LlBlaaJXENvc1ro0Hs3ReisFb84vo12Ihx1bBJSU
Message-ID: <CAKYAXd-s-g2V4LNY8e5SsH=+0r3qLY+AeOa5Lp9K0T5p_tnA8A@mail.gmail.com>
Subject: Re: [PATCH v2] ksmbd: grant a caller what its groups and OWNER RIGHTS
 ACEs allow
To: Ian Bridges <icb@fastmail.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Aamir Ahmed <elb12345@hotmail.co.uk>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -1562,7 +1586,8 @@ int smb_check_perm_dacl(struct ksmbd_conn *conn, const struct path *path,
>                              compare_sids(&sid_unix_NFS_mode, &ace->sid) &&
>                              compare_sids(&sid_everyone, &ace->sid) &&
>                              compare_sids(&sid_authusers, &ace->sid) &&
> -                            compare_sids(&sid_owner_rights, &ace->sid)))
> +                            compare_sids(&sid_owner_rights, &ace->sid) &&
> +                            !(groups && smb_sid_in_group(&ace->sid))))
groups is false for MAXIMUM_ALLOWED, so this skips group deny ACEs
too. Consider a file owner whose group has a deny ACE for
FILE_WRITE_RIGHTS, followed by an OWNER RIGHTS ACE granting full
access. The group deny ACE is skipped, leaving full access in ordered.
The new fallback then returns those rights.
An explicit FILE_WRITE_DATA request is denied, but MAXIMUM_ALLOWED
returns 0x001f01ff, including write access. Before this patch, the
latter request was rejected. Since smb2_open() uses this mask for the
handle's access rights, the client can write if the vfs permissions
allow it. Could we also process group deny ACEs for MAXIMUM_ALLOWED
requests?
