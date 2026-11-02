Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611513;
	b=Kk03iL6v192Tg8U1v557DqMqj4EXhE4l3IXjaUxLX9Cqkix31ZO2s1Swi0SixN05D64g
	 QRdxETpcbNwuA5bioZaU4tpRCZRKKVP8xDEBk0AnHzAxygRiyxsGDEFqv0ZiGnbHDvGts
	 rARQwUIWMbG2T8PfeE1RnMKX1QF8m+fee/f3c9ppaSrhdgLCpKNDXOJRcjRH8r8qUz4rY
	 V9IcXcAWt2F6+1F7LqvwsEBTwHuxeqqhdbJCkMAH80u/moiASUbbmmVGu8qFYq84krpx7
	 tYIcnjorDzntwX55URZUuyjLdyTcHtWsaUdwmszOjpE0lbG90pY+k7+X8+8Cg2Jhfbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611513;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sQmszYsiU1aH4zaNe/s9tHOhAixVwmjm3hciCk+1aLg=;
	b=4i0wwGWZs9Z76y0OBHCPrq2OfYFCZH9gyceQ8Y4Vg07aIdrQtV5U3Qa4SwgHxQyzQW1M
	 A0J13g8Yw1gZ1PYJUmJmwiLfxN3fn0fp+N/XXe+yIbIATqc0epZwLCp7HtE37QalGfEgR
	 FFjYvfrs4Y7PjW3b+LXOyA2QykoCKjlh82cniuGmx97D9FH600Jl8rqNqGvNW/tXH0AXt
	 NzoAR+DS28WDw4Z4nbFcjGDJY0OoM30gD3c1soYjG8z+46OIJ1Sj2QtgzRm7M4zNUdOkK
	 0et8XPSkbDg3CjNszifs5Qo19dOjxG6ub+mEPpFyRL5utdPSEuBV0zoGsNoTXDLKNDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPLMAb0N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B4C606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPLMAb0N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC471F00A02
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793611513;
	bh=sQmszYsiU1aH4zaNe/s9tHOhAixVwmjm3hciCk+1aLg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SPLMAb0NvBbOFBUdM/6Zni0FVowpO/PF6vu1PZBPI1f/TzZU2eCbsNKPybVG19hf/
	 4PtwU3h8QcMSH3BNAsdUJCh3v09ZyJ0eLPhACdNcPVLcxk6GR1YbBfJMjp46IJ3F9E
	 3d8R++T1W9v3pedygE7yq1gMcslvZLM+BvJdLHTVvchE+oMx7ucsOmEFe6qBzuj65w
	 GJp5/TXC7W2kpzV7FuPTSeDgaBqBrLfy0cvYMivjhEakreTy0G2VQ8f5bgfZWVdFci
	 dAkdF5O8ltpz7OXvuUiE8MB87VnQTKG/2Dz4AaYeKBlB1Wp943aOay3XfAXgdjbowA
	 1G2t5Erl+Dksg==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e8c710847so368525566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:25:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzuPSjYuR34k8Y7/NzKfvnQM8AQOTRZqPhDRbkFG6NYBYlwyuPw8ODcnzogg5JpHf85ymlBiGsGEMpT5UU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6woUqSvD8bRNjLqcVaD7zpQ06GSAXG8sKX7+9NSnPTQSliCMM
	GcWsJnk57r6j+9KCBOBnftvg5djkR/EcTjA1wpT3QPm1ELzyv+IEYWs1NHZrkDt5FdxUDaFVjCU
	IAvs7xYwNoCnr4nXrB+w135hNDOPOV/o=
X-Received: by 2002:a17:906:99ca:b0:c41:53a9:c65c with SMTP id
 a640c23a62f3a-c4ca7a9ecc8mr749164566b.34.1793611511940; Mon, 02 Nov 2026
 01:25:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102051428.817037-1-icb@fastmail.org>
In-Reply-To: <20261102051428.817037-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 2 Nov 2026 18:25:00 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8RJGv-KmuRnJtbF0Y2rBikj3JfW5f6ss-bKU5JihsBWg@mail.gmail.com>
X-Gm-Features: AclHuK-EqfaD1FSUon1FCnGqHCPYw4AXak4Fb9tDIjzrIOt-u_mb-5HU_Qy_ces
Message-ID: <CAKYAXd8RJGv-KmuRnJtbF0Y2rBikj3JfW5f6ss-bKU5JihsBWg@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: grant a POSIX ACL group entry only to the group's members
To: Ian Bridges <icb@fastmail.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 2:14=E2=80=AFPM Ian Bridges <icb@fastmail.org> wrote=
:
>
> When no ACE of the DACL matches the caller, Everyone or Authenticated
> Users, smb_check_perm_dacl() falls back to the file's POSIX ACL. It
> takes the first ACL_USER or ACL_GROUP entry whose id equals the
> caller's uid. For ACL_GROUP, this compares a gid with the caller's uid.
> A numerical match grants the group's permissions even when the caller
> is not a member.
>
> Match a group entry only when the caller is also in the group.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Reported-by: Namjae Jeon <linkinjeon@kernel.org>
> Closes: https://lore.kernel.org/linux-cifs/CAKYAXd93czbFD=3DznZUq_pJLXzDR=
5N3zc_auvAGWT7pzKR1f9Ag@mail.gmail.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
