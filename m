Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794101483;
	b=bjqWf/N3OtyRUk4Acs7E2TO1X3tgsQM30YMefoyi+axG4od/3AdWpKfIowRS8Nr54TOu
	 h7V/tF2Ieo51jeNoxx0wO/grKXFAJk0BXRFWIuJ9Pb1ZEgyQRJE+j+fO+bhXQOeo87ZPn
	 QtRAFRwm9YQCW9wYGI4vYGkDIt1zS9mZgOBYomayJFBqS1E3DvXiyxUyJ5Z9vUHjoJlak
	 KQxNtgkwkf+lDDNNFpnHOdHYSb1O260UzQQyc3wQyI6nm1E3Ux4GLIZpf145yv0vwrELB
	 8BNH0T13vab4CMQESxCAjQAby3J+nlbFFuBCStosSLjTIM48NFuyIfYpJryCKH5WfRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794101483;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=dM1vJ0OTbEs6tY2JexfLiPQVEjP+CijryoqT4IMo0+M=;
	b=iTFsBaf1fEOxTsBCefq76+k7ERWOA0XjhXcHQrIVUC8w9g627ck5PW/Rb3RfVCOLHk9Q
	 atm2KbIUejOJIrkcBwwhjO4L1FXEuhQKr4ZRa5qBqE+XeETWsK/XeOSjECzyY9zjHfybi
	 yXFLlRxkuxtFAVOpkgjrpUqMir9wDcSsFIjBQeCbfo4tdvk6zgJKyR0A5guQPTUvflXLB
	 vZwjGfBZ4bLFNYhr3NwJLikRSuakVJxCG5po7jr5yvfQPlt6ERrFEO/8Z6rXaynFMR3pH
	 UWmq7/PdBsxNH9g+M5o0k8Fvx/PhLo7Ng65w9PPzmsQkOhzX0SEJRjRKz24ckbIm9pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0Minf6H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC42606A330
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 01:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0Minf6H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627CA1F008A3
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 01:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794101482;
	bh=dM1vJ0OTbEs6tY2JexfLiPQVEjP+CijryoqT4IMo0+M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P0Minf6HhPFoBhIOibmqA46xi4JB2RfwFpj84GGhJrnpDAHP5IWSFHnstgCwiot1v
	 hcsbx/6aneuHVFV0kpySI4TfsYReBqT6EWTGcfdd6Do3H/JjEEe9BQLb1nK6zawPfl
	 od7wrD5+czozvzQtSZldh6uV/rru0z8U/ls4ksdRPhHDe5otYHzIEfDqWJja7aYbjc
	 Ef/JEwaxwWkGL5tjT0QB+ejKPYYVDXgTHLKxsNE1HUQ9JnTdtCHWzJTOjmid8QvTib
	 ckaDvKUsny9wE9W6xIhJsgaMLpnyjzrhLmzU/qjFLrFs4updOLV93ucjUvV9kCNVwB
	 DFMAhmdNS7pdw==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4550d8ab15so14097466b.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 17:31:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwh1ACqTo2F2UtMfSoKFcjHbxCFW2LOFZnNJ7xgX01ZI74dIrfUI/Sd1Qb9hhlARFpKNhHsbVMvuGTdlbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kWkm5bfuGs27uRsu7oC1Kp6o1wiWSj0pbzJ6tEqEv+dC4R6FE
	1W78ueb69fCCT4BlTo2p++frTTbXjBvoT1j1mXj2cfj3AVzhP/nveHMbxo5AAE57JxEJeyirBDf
	SFtS2SWwTFyGY9uc9u2FzBOkkYXuCmzo=
X-Received: by 2002:a17:907:60c9:b0:c42:24ea:3220 with SMTP id
 a640c23a62f3a-c4d6d78ca24mr29636066b.31.1794101481018; Sat, 07 Nov 2026
 17:31:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107231941.1824289-1-icb@fastmail.org> <20261107231941.1824289-2-icb@fastmail.org>
In-Reply-To: <20261107231941.1824289-2-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 8 Nov 2026 10:31:08 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-jNcP61uk8wm2xq6dtuw4_Cf-r1WDdUHSBQLJzdkOF2w@mail.gmail.com>
X-Gm-Features: AclHuK8ZxwM_IDYFpU40-keF-dJrDcSMiQYEPa6fwW594x2Se9ShicBNQ9Tq1Mk
Message-ID: <CAKYAXd-jNcP61uk8wm2xq6dtuw4_Cf-r1WDdUHSBQLJzdkOF2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ksmbd: evaluate the DACL in order for explicit
 access requests
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -1680,7 +1706,8 @@ int smb_check_perm_dacl(struct ksmbd_conn *conn, const struct path *path,
>                     !(ace->flags & INHERIT_ONLY_ACE))
>                         or_ace = true;
>                 if (!compare_sids(&sid_everyone, &ace->sid) ||
> -                   !compare_sids(&sid_authusers, &ace->sid))
> +                   (authusers &&
> +                    !compare_sids(&sid_authusers, &ace->sid)))
>                         others_ace = ace;
For a guest session, this can leave both found and others_ace clear,
allowing the POSIX ACL fallback to overwrite the ordered DACL result.
For example, consider a file whose DACL grants only FILE_READ_DATA to
Authenticated Users, with a named POSIX ACL entry granting rw to the
guest UID. An explicit FILE_WRITE_DATA check returns -EACCES on the
base tree, but succeeds after this patch. A preceding deny ACE for one
of the guest's groups can also be bypassed through this path.
Please retain the fact that an Authenticated Users ACE was present
when deciding whether to use the POSIX ACL fallback, while excluding
that ACE from the rights granted to the guest. This also affects
anonymous sessions and remains after applying patch 2/2.

Thanks.
