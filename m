Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793918059;
	b=B9AryALIegAf7WLE2G9/MQ6xXH1mBsuArriRpXQBUvrLiP/Pu/RNEvoUq8B1JevroYb6
	 V/oY2+qI2I2Oorf1/EoH6JBqYX8gvc6IwNh/K5/r0YLC7sdP1sehB2D0kfy2qtxEW1Xd2
	 3AkKeI2KF72kA0GDF8vavffM8IJOQ2G0Hvm2mSXTyi/t6y8YZqxfmktNZUOt0hCHv/Hag
	 T6gPYU1dA1/8+F0uMEY/0jamyEgtcadZQ7C2MRhJFEYsZPFL4iZrCrfuACsM9AW3znjEg
	 bJZr2+9TNpNfehUgD1gijDfWazqfX5pX/uxHUC69/huSY8Te22lY1PDuCPDYwYNFa8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918059;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iIWyxXCkV5ahjt2ebCV4WwQbZmTr+s4l0TyythVjJvU=;
	b=sUYcXgSMnDOpOL22BddMtRmnVGBy1H6RQ/kJKRM8/vBb0Uh0nu5zZe00KpxI2dBrJbMw
	 QB0rlkxZ+/HCVezE7nUw5GJJDe2txMe6IFW+suP60gEOTee5hSrynFHgrBdmFUZ9JhImL
	 ECWcl7FdgVZxiuA9uNU4hBV8vRg4868TwZGpJQ+8xBODgJ0vbs9V6SP3ZH4JaeiPhAVd3
	 6nN519aG5A3Ee+74ayY7TD1SAB7xDAI4o28vwMwj2Ay801MKxMkHu0v+Wd1mnu9398YoC
	 nWvR+eW8n6dwixmbkGJWlIpKlCd+QB4KvtZO/0x9WuXkJMbkfQ+IbqOFLsWo/GD8nZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LpTQOPsa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C561A606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LpTQOPsa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDE21F008A6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918058;
	bh=iIWyxXCkV5ahjt2ebCV4WwQbZmTr+s4l0TyythVjJvU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LpTQOPsazkS046yyu7iM/H6joY8tK05w+5aAecGuEF859grYWgXiB0qwH94f0v91u
	 H9ZGV95ZVEp372EQYcpdhqBDbwWyETlxO2MXUA+Kfpvgf4kaeZdumCilG321pHF9fQ
	 ir6w9AtFriLkQ3QBwri1xhrULnMmAqYMi2mSQZC/w5ZUVw+on9rPT+jT/CJx8win4o
	 jfxSzyYGtPSo7RvCK6NdMtRJ22dkTptcY9L4IxSHXlxoEvTOO3Zty8Frw2PEg2OQK6
	 mocIswp3bXfJLwXQtJFWJf++XgzHtVg258tnU4Nh3VhIx2xXS30WX16kqoEB0VDvM6
	 odTsR0MKM4pPw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b561b60b78so1702815a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:34:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzhMDDOQJ9UfTJNFvSMtzbouH10auZy9+H6kICt8fJ1FCgHOArr/OJ2xBebMEDVZeNopBD47qQKHyl4LTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9383UpWwKeAogMa3quXOA+EAGTg4iStBtNAHUnG/Eu/Om7qQgm
	9qpus5PjN8YUxo3VrkdQ2WpTQTUcYupjfTWoIPtsJcekFrdsbm4OO4psvAAYQ/z5SsEqntPlfbE
	6Otxb2FqJYfrL7O1iLxbQamH15WQrZvs=
X-Received: by 2002:a17:906:ef03:b0:c40:2439:4d9a with SMTP id
 a640c23a62f3a-c4d207ad09fmr313558066b.28.1793918056929; Thu, 05 Nov 2026
 14:34:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105173838.1882328-1-wahidzk0091@gmail.com> <20261105211943.696696-1-icb@fastmail.org>
In-Reply-To: <20261105211943.696696-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 6 Nov 2026 07:34:04 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8E-tBJhmfYdT7bwikCj2dN_sk_L5aSrAjyKX3-4wAZCA@mail.gmail.com>
X-Gm-Features: AclHuK9MVVizSVLgfQxPDF_PUbcOqVST15KpDkJmfqMFUIuoIHX5YpXWT38l6mk
Message-ID: <CAKYAXd8E-tBJhmfYdT7bwikCj2dN_sk_L5aSrAjyKX3-4wAZCA@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: refuse to read a handle that is not open for reading
To: Ian Bridges <icb@fastmail.org>
Cc: Wahid Khan <wahidzk0091@gmail.com>, smfrench@gmail.com, senozhatsky@chromium.org, 
	tom@talpey.com, chenxiaosong@chenxiaosong.com, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 6:19=E2=80=AFAM Ian Bridges <icb@fastmail.org> wrote=
:
>
> On Thu, Nov 05, 2026 at 11:08:38PM +0530, Wahid Khan wrote:
> > Return STATUS_ACCESS_DENIED when the file is not readable.
>
> Tested on ksmbd-for-next with KASAN. A READ on a handle opened for
> FILE_WRITE_DATA | FILE_EXECUTE | FILE_READ_ATTRIBUTES hits the warning
> before and gets STATUS_ACCESS_DENIED after. smbtorture gives the same
> results as without the patch.
>
> Reviewed-by: Ian Bridges <icb@fastmail.org>
> Tested-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
