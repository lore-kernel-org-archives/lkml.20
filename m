Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660627;
	b=sO0mA2cXTrHgaQUmNmdmCDVS1vCQtnInIFVqQbK+UrQowVwQYOGLenxZHc6NqsK/zajY
	 YyUOFu9+ol+H3VahoBUEPGxxEfqSrDJZLZzxmNUGnulmyt77Yjrh0KwJMhJ+H1FQPokIW
	 J79+TAq8pKEO0OcTcfZD63NgYPTjOv9nZeSN9mFD381I8jNv4qBkToTS3lCxumvW4hDLn
	 xkPkhgsON4n7d7yFEjhxhJaIf994pkew8MTMk/haHq6Aq9m0ydt6sMTHKa6eJBAfPil7g
	 waZ74jxX8ZSeIlPxbXDngFlgX//YpcoSFOTF7yAzx1IyN3eouROTbzELw831HC2Vl+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660627;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=TOCj0cvfOMcwdE+2asmc5YrfnJ5Rb+uIiOaWLNlRZwI=;
	b=oDeImur6rJyJN5g6/9Ht0lhvvTa18Fu8Iz/3VthZbU7GZ0irLDzZJ3Wv2tZMMGvgUF0x
	 sfdM/uUg1rHEvcFxqeefFsWStT7hSpa6wN7U/WzYekCir5bU0uzm4Lf3CMhAvR5KKutG4
	 1oVdRIDuXZlMWRQBnmYJaas49k7lShH7OkCuO58TABMe1vAS2n5GQnJI/te9hqiqfmyys
	 wW634qN2yVRYbqZ49lLkz9LeJHFVqT7RCuUcKgFdB58Jfd8P11EEDlCvOOr+6gdO9mdZ8
	 tDuEQNgFzXaoYhWL0IfO5l8VttU4XkMN/CKo1Tc9NDQ75HoN7RhHWvqr0ZEjCDKjFpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUMxQjH4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A45606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUMxQjH4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024E21F00A20
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793660626;
	bh=TOCj0cvfOMcwdE+2asmc5YrfnJ5Rb+uIiOaWLNlRZwI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HUMxQjH4baTzG8pm5hQhi324eB43eyyV540nF4LklvF0lVZosj0Ok1EUmU+SdsH4a
	 3h9KBSHeJ6VVTsZVuBA9YZq4WO6d3TXPNLx8FfmSOhD/JafKt4VXJG+k+R5X1ePNgS
	 q/PQLdHB9y/KxXn1C7Lri+Ut04qtVWXs1eYcff90KPKaSSP+UV1x4iZojSO1M2AIgF
	 G2JwreVan9DydZjNt2ojlpKClf5jXdtCpnsfYwBOco523Q86nNE5fxGJF4Js68xvI8
	 wZUs1Mwn47HbPHtK3xv1OZIt5FRICtu4CZwLx8Tz6TJTSd+8oTVMVmVrMce6xKaMzo
	 3mLOPWgIJxwpA==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso521110366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:03:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy1SNkjMB7e4Jp/tSjJiVR38ApSYlvawTCcPRnQt/Y+jZbTshMSDD74wIwe1M1UqPlRy2r7MbhjOScDiOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lHvpHEJ2BScL3Ff0XmFpU+Aa9WPn0aBWkSgX2hI3xIHrjlC2k
	I8A60aNZaPF1fpyFPgppXohk+dx5SUZZe1BF3z35rZvY5wUhCzJiM86cBErAvQGsc0eV6VW6yfL
	edjwb5ijH/8C8iAj6tqUAHlrdHs5c+H0=
X-Received: by 2002:a17:907:c5ce:b0:c29:63f2:99bb with SMTP id
 a640c23a62f3a-c4ca7acf3a8mr975101066b.47.1793660624646; Mon, 02 Nov 2026
 15:03:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179362071772.29269.615878810410303214@stu.pku.edu.cn>
In-Reply-To: <179362071772.29269.615878810410303214@stu.pku.edu.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 3 Nov 2026 08:03:31 +0900
X-Gmail-Original-Message-ID: <CAKYAXd96EhhA99O-xZyZ66a=tHB90DkmgFe2YhTwKRKT136bJg@mail.gmail.com>
X-Gm-Features: AclHuK8qzNqMYHI4Ba66Ka9nSMCYCzbbTHTLaBo2b77zwDgZoRBYxqX7hCpqpTI
Message-ID: <CAKYAXd96EhhA99O-xZyZ66a=tHB90DkmgFe2YhTwKRKT136bJg@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: require NUL-terminated EA names
To: Yifan Zhang <yfzhang23@stu.pku.edu.cn>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, linux-cifs@vger.kernel.org, 
	Tom Talpey <tom@talpey.com>, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	Steve French <stfrench@microsoft.com>, Ronnie Sahlberg <lsahlber@redhat.com>, 
	Hyunchul Lee <hyc.lee@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -3419,6 +3419,11 @@ static int smb2_set_ea(struct smb2_ea_info *eabuf, unsigned int buf_len,
>                 if (!eabuf->EaNameLength)
>                         goto next;
>
> +               if (eabuf->name[eabuf->EaNameLength]) {
> +                       rc = -EINVAL;
The NULL-termination check looks correct, but returning -EINVAL here
causes smb2_set_info() to return STATUS_INVALID_PARAMETER. MS-SMB2
section 3.3.5.21.1 describes STATUS_EA_LIST_INCONSISTENT as the error
response for a malformed EA buffer. Please return -EBADMSG for this EA
format error and map it to STATUS_EA_LIST_INCONSISTENT in
smb2_set_info(). Since smb2_set_ea() is also called from SMB2 CREATE,
you need to update the error handling for that caller as well. Also,
the patch was sent with quoted-printable encoding. Please send it as
plain text, preferably using git send-email.
Thanks!
