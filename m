Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412586;
	b=O18KVoEnPeE5BXixIqMIDEJiIOY3MkKKABFyKlpmuNvuUf69t5bLY0LIXbRibJsgIOit
	 be9Mequ2UjikYn2phbXSYataBoENJVm1i/rvPMTjXrWM61JcmA44NUwbeXC40rht/EKbI
	 YZ1q/R73L5cq9QLFHW+uFCSpGXPt5Ai3A+3LN9KvEe5S4rtXOafLWdgu5OWXry5TIYOu4
	 LYv7NDu4pVBEG0PQXwYMlWz8C9mx5yO0rBp9WzjD38x3cNaxMbI3/6xVQbbMh+3ClS/vv
	 arrWZFGo7FrgbS5nziqxwlK+Vc8SuLJDPHoKEDHP2nWQZYl05KMep3fCrNaV5y23NLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412586;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=0fhsmLg+/R1e6vDeTMj0qehUFlPHkkHCiukF5Cl8254=;
	b=14s13gkDyuNJv8SRfGTqTh1vwNlpP7eYFOQ+LJm7uYotPKwI7MTZ4yq6rrmdFcOsdkeH
	 g00leT4njpVG+PPoLF0oZQNgPIEL5UKERxtY220slPaXAqUiR0n1htE2CapuEtcegWfAm
	 vClFUI8oHpamE5Vz3Na0ECFaOnWAcbGf/yK+rbQ0Mp6aXPlXpuORv1Eq4gWuEOS3jFgWE
	 +/U/GwG0Ea+N2obzsT22JTyVPNlfDRXoRJwvXrgrpPU4RL7/qnMStMvkGTdbPib0SjxIp
	 9FVt4dD1qcM2lUNL0SFhjJTk1rwW7BCtqSt1mf8MMiuqMpBTjj01J+7yevAfcKfaO0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cYco0U6J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E16E606A325
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cYco0U6J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A9B1F00A18
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793412585;
	bh=0fhsmLg+/R1e6vDeTMj0qehUFlPHkkHCiukF5Cl8254=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cYco0U6JNhpJm+j9Lu5Q4JNTMLOWJ3wC1e8HjKQGkesV0ebvSZNBMWRFDrDMlu0Zj
	 m04xvzXwuCOJ5lvuXrYAuM9wUXa5xCDk8hLp70X9b900qcUxxEFNb0tzwdSQAHgRLn
	 hiIvkRx/C1E3mnANygmh1Y1k/SeDPqNN+yxCvqfb2ZzMJc01SIqOGOoURQu5IxNTy4
	 DyjWyeXoqgP26JLbsYaLzuZWqGKkndb/c9Zw0B9yg5Qz9r3ml8bSC3ZYlCd6XzrVvJ
	 +UJ1OQX3z1Gk2JPKsxHmywOGVMUU0ycOkvd20CLUEY14HL4s+/0bdCpMzRlm+zdrof
	 P1gMS7+UijRgQ==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso202719866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:09:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByl+6Au51iKXvJ4Ed/uk0dF047DTLp/KUYq1db306RhM1yVjR59RkrNvWKwEKrQCypCFDIp1HYlqggNxjo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIht1r2qTe6wQGWra2D6taGuFGn3q/oNXnfDU5zEjyHD3LU2hv0
	knlUYdzkeUiVqEFA/kzaww6k2Wu5lcxQ7zIMJn/TuiGSQXSvLKqK7GT3GRbvGxXWDEr6mFiLGpG
	5MY6CNRHH6B8yqhErNMn95mp+I+lkDH8=
X-Received: by 2002:a17:907:96ac:b0:c49:b8ec:a9e3 with SMTP id
 a640c23a62f3a-c4ca7abe67amr377807566b.43.1793412583658; Fri, 30 Oct 2026
 19:09:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030020523.302085-1-icb@fastmail.org> <20261030020523.302085-3-icb@fastmail.org>
In-Reply-To: <20261030020523.302085-3-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 31 Oct 2026 11:09:31 +0900
X-Gmail-Original-Message-ID: <CAKYAXd93czbFD=znZUq_pJLXzDR5N3zc_auvAGWT7pzKR1f9Ag@mail.gmail.com>
X-Gm-Features: AclHuK_pJofjvX5FQy3V3RmY683i0MSmA_O1khwZaSiRXh7FWc04LdLmaOE3Bgs
Message-ID: <CAKYAXd93czbFD=znZUq_pJLXzDR5N3zc_auvAGWT7pzKR1f9Ag@mail.gmail.com>
Subject: Re: [PATCH 2/2] ksmbd: exclude guest and anonymous sessions from
 Authenticated Users ACEs
To: Ian Bridges <icb@fastmail.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -1611,7 +1612,8 @@ int smb_check_perm_dacl(struct ksmbd_conn *conn, const struct path *path,
>                         break;
>                 }
>                 if (!compare_sids(&sid_everyone, &ace->sid) ||
> -                   !compare_sids(&sid_authusers, &ace->sid))
> +                   (authenticated &&
> +                    !compare_sids(&sid_authusers, &ace->sid)))
>                         others_ace = ace;
Skipping this ACE for a guest can leave both found and others_ace
unset. The POSIX ACL fallback then runs. That code compares ACL_GROUP
gids with the caller's uid instead of checking group membership. For
example, consider a guest with uid 1000 who does not belong to group
1000. The file's DACL contains:

  DENY    Authenticated Users   READ_DATA
  ALLOW  S-1-22-2-1000            read access
  ALLOW  owner                         full access

With S-1-22-2-1000 also set as the descriptor's Group SID, DACL
conversion creates a POSIX group:1000:r-- entry. Before this patch,
ABE hides the file. After this patch, the fallback mistakes group 1000
for user 1000 and lists the file, although the guest still fails the
POSIX read permission check. Please also fix the fallback to check
actual group membership for ACL_GROUP entries. The UID/GID comparison
bug already exists, but this change exposes it for the DACL above.
