Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837766;
	b=WaXORnpEMR93snN7U7NcIjP1aPBqVyEPTih1S6T4FZkXx5wouR6vJBpRBivkFKxK3i7V
	 uPj9xJMS160CIOXkyB2ZwUyfjc5iErdVW+0k3GXFnD6i8IfpFxB1ngt9V8UjNzqK3Fzqf
	 9bt5ouKeUaD8JPjAOl4/QojCCb9bu3Yp/AtdAJkWjIL68QVsIMU7/runpn4X/Wpg9My2d
	 me8p4mrxaTaRrRLNgDjeIsL4BsTLH3bBdOsR4AEAwrohRgvPG2rw2RyNSJRGqkkgt2Lau
	 I291uJFmgoXDawEQeIn3LsmP8jQsOuVcJ2XYmBplqL2l90VdE1ZvxidL4arxIMHwj6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837766;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TJmPcX0jlQEhCukA/l5pSJzFcBRF+gLl1xeZVV+XUyc=;
	b=Ype3oQ1+OMRR2FFW5Vex8AgCNxgZrUElKfjY6btQOZ7ZJ/I0PkFXS9p/mCWRQnUL/wnG
	 XvggunfG7RWrKqIMnado42EjEEqdqg6Fad4RPNjDIdVj1jCURVd8Iq0VdmI1a1PzgKszB
	 e0dGEpPLxcbBGIy819VzEzqq9VQa6AgjCiwGX+/x/NtnV3XQmrGMA6rOxFxKg06bicF0P
	 qK4csRuxdv5xo1+sFCxRNvrmBAlqeRV7KVaaPD2ZAvMbjR6pQCym5qS2gVXvaRAxG3Fkj
	 ZpEP82ECWYm9aUL6t6oMBRFg5PR9s3+t5YxzT6LZl96RSaD7KjFJ2kBD10k0ZDEcY0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=US+yckQj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23698606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=US+yckQj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B111F000C9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837765;
	bh=TJmPcX0jlQEhCukA/l5pSJzFcBRF+gLl1xeZVV+XUyc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=US+yckQjfPhoBBZ2NFnM888mUhXibQLMeBwiTob/UcxyTEIWr4F/3I/OR9+eF97xo
	 7OgYsGjkTmrTN8KrZxswFtJgnxMU5JB0q/jSr69JajFA+8i+gMeIl1RoKOgDD363Jo
	 VnjMYpi9xMCAZs9CAdMtHHP1JFssgSlAW31NCHR2l0TU1oDx8DmeNA5lxnM52hCIJQ
	 cCqkbkpVmXxUBK68rlUMjr5HLLs6BD8tCMcJNYy9CvpncG4bXs9G+HypRNQ2KnvwPe
	 lonjPrv9OtCaSeBVh22DvP4VZ6AwR9gepfxZrEnNZX8uF+hPx+LajBNaMeGMUx4tuf
	 T2a1aVYNr8mFg==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67db1f6f50eso1238783d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:02:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGNKySL+AKpP8XxF7d9kJGDGsH2xKZgsbp7J2CHlSSZCDogkrNWhoZQgGZcwXkl+F/NYAamiBzc8/rzDcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8saWnd+9xApj1+qAmoOkkOXgxagt21O3QAi45uE+2r0Mly0wFX
	WnXNNDlWF5qPyTFfVZLpKohiFNPOF4MHCjFHQhI0oNE31qzC+dMt2WMb+Ts6oAHE/ghMqI1GMqt
	ooUq/yZ3urTbUROBq51Zkgu0h0954/U4=
X-Received: by 2002:a05:690e:bc4:b0:67d:ae02:45fc with SMTP id
 956f58d0204a3-67dae025d9cmr2328051d50.45.1794837764984; Mon, 16 Nov 2026
 06:02:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116124441.2521447-1-icb@fastmail.org>
In-Reply-To: <20261116124441.2521447-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 16 Nov 2026 23:02:29 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-RabFCYgURT4jcAuOPRUYqUfD443Y4+g5-bzjYnsLyyA@mail.gmail.com>
X-Gm-Features: AclHuK9Caz4wzvgmBauJMGfLXbVcdLp4mgFdfHci7iv10rOa0L_5dZXULXUOFAU
Message-ID: <CAKYAXd-RabFCYgURT4jcAuOPRUYqUfD443Y4+g5-bzjYnsLyyA@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: read create context data at its DataOffset
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 9:44=E2=80=AFPM Ian Bridges <icb@fastmail.org> wrot=
e:
>
> ksmbd reads most create context data at a fixed offset instead of the
> client's DataOffset. When the data starts later, ksmbd reads padding or
> other bytes. For a security descriptor, zero padding can be parsed as
> having no DACL, so CREATE succeeds without applying the client's
> descriptor.
>
> Use DataOffset for security descriptor, extended attribute, lease,
> durable handle, POSIX and allocation size contexts. The context lookup
> already validates DataOffset and DataLength. Check each payload's
> minimum length and keep the existing parser checks. Add
> smb2_context_data() and a structure for the durable reconnect data, and
> remove the request structures that no longer have users. Contexts using
> the usual offset behave as before.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Fixes: c8efcc786146 ("ksmbd: add support for durable handles v1/v2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks.
