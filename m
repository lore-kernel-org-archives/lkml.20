Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832232;
	b=erE7b+Y45X/TTUTwXugH74yivL+I4IfLurfr9llJeEeZc0VmTziGsf9yN34Msk7IowR7
	 iLfcFf0FT/ftNriniX7t4wG+LpPB96/99m/lr9XM3fjpfV4eaYGjK67Zt1TWkwOthNyOJ
	 YGYLtYhhCtRWAEFmGvcyL1nEWqVfEwIDoZn0Q0yHbIfTRrE9wbtwyVxiUclsIzBr2d/0P
	 FyG90fS9LOa/+oMGO9jzI9dA8sGXd1XyW+8GCvCmtlF6bzRhV4frD3zNW86MrnwqTPtAF
	 kgbBeXoIdE5J/KyVdEvEnF6peB16u4vmer2QPBwcFMHuPlK035zkombCpNExesbAyvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832232;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2rkLY6y6+ClNNLzzESKqswesvWfc3fvsu05JVfc9L34=;
	b=ks6XjFYbDJY4a9pkY4Ve76986FKlDcefwIuqEjOCtzN2i7BluF7nxJHtg/DNbBwvWdwV
	 Kh6ugTzldjuLMotv+L2AwlR7OgUFnbxRYYe1Ws26dOwQR5aYupDhbzabPsVjxqTtZKRCt
	 GDTeUVTdfciImQksqxtqeUp3vj4WJG2ADv1QEBFbtlYND/RoQixDcHNR3Denl0IUBzl69
	 8t1yfhkv3/UnbWCPh+Er9J6Whw7G/JSHGFdjVvcTtaClgxyL2X7sffWJdRzxna2aqyR2r
	 8Y93NPIcRnJENTlPenvm4Xkz1eA7oWA5TWQohu/wJpCdhwN20krLw8+jqQQhagrtdbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mtiVx2yc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12636606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mtiVx2yc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FEDB1F0093A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793832231;
	bh=2rkLY6y6+ClNNLzzESKqswesvWfc3fvsu05JVfc9L34=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mtiVx2yckBtGxjgyq2jK0ld8nk086LHroqX/mF1C9u60q5YnJHou+C4Gl2qEJh8Zl
	 EM54MwpQ2gbUuZ5RxO0VtMS+ASVwuXLfxwNO2b+Hx/dpAogqf/jRo0qsBeKIig/ml1
	 w/hL6lJpdUg7Zgd9jAsCIYvT07olqait9nrZOJiUa+rQ2O/r+kOSIkh+3a+4xiOxb7
	 9thLkwXKV65WPejzE76MZskqSduOgUDIYTwP/6EKL6Dz7t1aClBxDsnsiJ3K7JVdum
	 NBLdensF7OVFfCA335wlEIaD+3ElUeeQECTyTD1bPvyHetmzQjxl7Q1EMopmz8XiIu
	 xtvuAJH0woqzQ==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2e8c710847so218775166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:43:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxMTc2BIDZH/q2aO1SxQnJx2+DDhYY4oT2LhofYsW/sjdRuo+WoLFRsLAZ2T+BOx7lMnUUjcqaQPuQpEPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yjxZ5ywEmtpzQnMCYihCJE7Pz42q65740wJDGCe9uLeUGI2Ja
	rNWXvkb02aHTF2GfU/Z0lvRiuJ6DIyi8JlaiAp1W7nK4fBYI+tt72Q0gMNgxMJHBCuGJfrLIgGt
	2uesqCCWsiuFph8p/Jv8Hl13eK0VPDwE=
X-Received: by 2002:a17:907:3e96:b0:c49:b9b9:26cc with SMTP id
 a640c23a62f3a-c4ca7a68457mr1455407166b.23.1793832230305; Wed, 04 Nov 2026
 14:43:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104185804.195058-1-icb@fastmail.org>
In-Reply-To: <20261104185804.195058-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 5 Nov 2026 07:43:38 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-Sfd91-Kic7rg-_Zfzip9HcRy6k8w=fTJ1skDonS9Z_Q@mail.gmail.com>
X-Gm-Features: AclHuK9EFmOzCcqJH386Xw40dE2d_X2dJooISE5fjAA1xzRZ3mqpcKFtb2l4oZY
Message-ID: <CAKYAXd-Sfd91-Kic7rg-_Zfzip9HcRy6k8w=fTJ1skDonS9Z_Q@mail.gmail.com>
Subject: Re: [PATCH v4] ksmbd: grant a caller what its groups and OWNER RIGHTS
 ACEs allow
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Aamir Ahmed <elb12345@hotmail.co.uk>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 3:58=E2=80=AFAM Ian Bridges <icb@fastmail.org> wrote=
:
>
> smb_check_perm_dacl() does not match ACEs for the caller's Unix
> groups and refuses an owner named only by OWNER RIGHTS. These callers
> cannot use rights the DACL grants them under MS-DTYP 2.5.3.2.
>
> Match Unix group SIDs (S-1-22-2) against the caller's credentials. Use
> the ordered DACL result when the existing SID lookup and POSIX ACL
> fallback do not decide access. In that result, deny ACEs for the
> caller's groups limit what it grants, also for MAXIMUM_ALLOWED. Count
> only the exact OWNER RIGHTS SID in that result, since compare_sids()
> also matches shorter and longer SIDs, and return only file access
> rights. Preserve the refusal for non-inherit-only object deny ACEs,
> which ksmbd does not parse.
>
> MAXIMUM_ALLOWED still excludes group allow ACEs. Including them
> requires corresponding changes in smb2_open() to avoid breaking
> existing opens. An open relying on group grants can therefore still
> fail when it requests a maximal access reply. For the owner, that
> reply leaves out the rights of its groups.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
