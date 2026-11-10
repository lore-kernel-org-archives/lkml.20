Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322649;
	b=V2C9wfyWcDiro7vZPd+TjwkZoEh++AoGKhOTzvEOiyBvVgc/uhIjyfjrbRrd0yROxAKl
	 ef4m+76Lm51oQ4JMey1HNIi4WdKC3xIkigLAL6FyTAgl8SapF9bUxWbvX0pUVrqQ6A9kT
	 J3StwpIA0YghVIRUHO/59MhOUFjYQXuKD5l5VcgNzqnENQ9PgvFVPuNYziCPEjm0uVBu0
	 wLowh/zCPNXf9+34tz3YypXWUzWCYIXxh46sRho18EtrxBAHeaYUfOqQ5QSkYFtbp5OhS
	 iBQT91YZLh4EOxfTGdZgW8s09sY3+oYlhze1VcC+gsfO7VLb/97eFApddVaEAQCncxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322649;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oh4yG9NOUAfpCtnzTEnP89jyoSqnXOuZC9TM1PcPNdg=;
	b=4btdMtG1ShzxIjCIsLADT0K3fL8rqBrcM7OBJ4OO6Dfke2WaYIUCqmXDAOAOdHSzD+bx
	 ORj4cYo7KLUJugqUk38vjmnfmqu8u2j3hiThjePdRBuxhaRMG4V0ti848pvhFIL/tWQuD
	 RwGOKyjeeI8XYoqmkfDp+5JRFZk4AISBkoZVZPoG+k+PCxMpDzQDFPVjnG6MQE7Fhd0t2
	 muxRIW+PaVaxR3uz7tued9+jWvudgndj2K5bMpnndtcYkjywQuA+/t/kzge289ijX/++W
	 DjxyWbT6ZO7hgT+ZnLbMX6mDv7IRga7ynvvfupIN5HLzxcc2ka8/3HW7tVC06CDrTLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhk0ABiv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E78606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhk0ABiv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5971F008A4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794322648;
	bh=oh4yG9NOUAfpCtnzTEnP89jyoSqnXOuZC9TM1PcPNdg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lhk0ABivNnU3S88s1ukwtFAklNxvgs9TICfGSJEmgriy2JBWGxvwGSL0tfZlA3+5S
	 xzFIHN9J9KNwRJeLxRpgTfo2uw5PVfJGPGDHwX7k+pe8Z3t4bAHJ4MY/QIg/xUNMXT
	 +S4ARy7RhXxCnlzcYLLautoMbFFoS4udN2EzKmgnUjQUIZP9WjWzxsRy9IPkTBzp0k
	 QivVyLdoULNB2z9q/b0ZO0/CVsb9z5BArdcYHmoJGEMJfPOO5LiRZ7WYWTdT1vDnsY
	 gwDBKYzp3BgxvuW7KRrSWw7P2uH55onQBqjtFMlKXgfePrJk5pL7fe8XPrYWnYdlH4
	 fBKsxPPEQkbNg==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so1420947a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:57:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFsGnkOIWy2xZMbjkw07fzYaNey0sUcQkJhHhTWtrS+t8iI3GKsh8vAZR7/5F45IwpSCl82+wYuFgrYaEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yN60wfGPqxbMls/lpDNkEulloYUK9Jwj+/trtr42y6yTpJKj2
	xasH7lBTffk9Aa/kZRFnETQcL3cXxDZd3yyhhJGi7vK17QczQQJDqeaeBsibybYqHBJLjpOeYAu
	+Dmrrrzbg8gcZzTRDVHDN5dUvX8zQIsA=
X-Received: by 2002:aa7:d58c:0:b0:6b3:c422:9257 with SMTP id
 4fb4d7f45d1cf-6b756ae1e9fmr1840057a12.25.1794322647248; Tue, 10 Nov 2026
 06:57:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110023344.2105916-1-icb@fastmail.org>
In-Reply-To: <20261110023344.2105916-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 10 Nov 2026 23:57:14 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_cmLv7bM6ZQJNS=CU9MHGPJkZjBD4RNTnaSGS_1oz1=w@mail.gmail.com>
X-Gm-Features: AclHuK8yUXWZTkmnwrOZJOIyVL-xjDKwS1ouvX_skQFgof_Rc-YmlA5vKTXAMwQ
Message-ID: <CAKYAXd_cmLv7bM6ZQJNS=CU9MHGPJkZjBD4RNTnaSGS_1oz1=w@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: keep group denials when a POSIX ACL entry decides access
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:33=E2=80=AFAM Ian Bridges <icb@fastmail.org> wro=
te:
>
> When no ACE names the caller, Everyone or Authenticated Users,
> smb_check_perm_dacl() lets a POSIX ACL entry for the caller decide
> access. The entry's rights replace the result of the DACL walk. Deny
> ACEs for the caller's groups, and OWNER RIGHTS for the owner, are then
> lost.
>
> For example, a deny of FILE_WRITE_DATA for one of the caller's groups
> should refuse writes. A POSIX ACL entry that gives the caller write
> access still lets the caller write.
>
> Remove the requested rights that those ACEs deny from the entry's
> rights. The DACL walk already records them in grp_denied.
>
> Fixes: 42ac1f1917ae ("ksmbd: grant a caller what its groups and OWNER RIG=
HTS ACEs allow")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20261102200353.884509-1-icb%40fastma=
il.org
> Link: https://sashiko.dev/#/patchset/20261103150458.11591-1-icb%40fastmai=
l.org
> Link: https://sashiko.dev/#/patchset/20261107062233.1579198-1-icb%40fastm=
ail.org?part=3D1
> Link: https://sashiko.dev/#/patchset/20261107231941.1824289-1-icb%40fastm=
ail.org?part=3D1
> Link: https://sashiko.dev/#/patchset/20261108182011.1888520-1-icb%40fastm=
ail.org?part=3D1
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
