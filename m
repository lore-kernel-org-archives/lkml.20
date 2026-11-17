Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912357;
	b=pDyo0Jo07hAeou4bxQ8OIJTkLu30yWpeIhBdu8gSr/lJoXhLIIWBV75n+kILbudtsLka
	 6QBLSo6GMpHLTLjKSV+Up8+0IAafP+R4MHMxvhM+q4TtIBRIuRlzaOKhYZcBawbr5R1p6
	 BK57iJ25cpXqTq3Iky5OxW4NALxJZqjokU3mzLzom0Scv6YniFEw4+Guu/EfqZigfK190
	 it2EPpnXyEuUs0cvvMeRQTTnbh+G7nocNG6H3fBMauabZTwxvrEL1IROQw1oSsxbZaSG4
	 H08uLQltLsHWjcv+BBgFq+frTF6gEbAzOI3mG7e2s3IgutCDM6nTtUZSd56OiQCpdvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912357;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ljC7x4T0g8LuC9S2NR7Y8EuueQxUjNwhNayArSrSdvs=;
	b=ACdz3AapSilM1HjyeF4YtLh7vRpLg+zjHTePRhNfDKPxn3q0D3Hcbk/GTfhG9WZbvBJ7
	 FN9+oL7DUSkkb1nYSn1Tp+nMIkfw+XdxT6YFQRwODAkt76lWb1TChJe8kMQoy78bxG+Pz
	 UMqVEUhraJGvwn/IPx9+og2HIfwrMxJA7FkQ42u95Zewr2ECGJ1rTzhPgihv1WeTOUzio
	 KcRifcz/Ojtajas+mRQPn7g6Og/2EZyoXgU++u1KrnSsNWTBWVhQ+2H40uTaSi+woDFqO
	 AvvkthKFsysgQntsemtD4Mka2aiVgKo2AMBkhL2PAeTsSqZrmhxirL22hc0pUogOUIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V0D6g0XN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C05606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V0D6g0XN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6F01F000CC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794912357;
	bh=ljC7x4T0g8LuC9S2NR7Y8EuueQxUjNwhNayArSrSdvs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=V0D6g0XN4m5Bi+1yrhG7Ka/Zfi8mF5XBrB38c+I/pXWHPu376J4djahmED6Zu0Tf3
	 0K+m2z+lUvhT/cGvk8MC+b/MSfmVqfM/vt1HKDCWnVUo2353+MsqmIbozmhRu0j/mV
	 lHlDf9jBqiXo9m0ohRI1aUZBqfAaps68ySxPTQkwDkZLlBfjwjxSjlbgFSWR+YStyb
	 eT5rt9D50W/XgO1n655v8IZuSGq1rZHCdGDIlpDjSrJ/uC4nM63DFtg4sniwtnfmI5
	 KvZ2wWNDrU9KLxElIOa0Tl1tSWkv+W+e6M7M7HUHrCjkcR3bbvIwoq05andPieCIsj
	 UQvlT0jdO/v6Q==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d28f75d62so869356166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:45:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFeUnijo/Y6Uds7o7KYEF3KRY2ODLKQZOvH6jCVqPKIzrKuX47xo5WdVlKAb9/1LOh4LjACiegape3IpE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z96A2iZvXgBFvgZvTgivfuPD/aTehxkizA5MGM3nusCL83qrhow
	r50fY/E1ejmGyJ3EAri0xCvUojSq6wP08K2te1X0CWFhiVOLnNDnrE3zbqI9HlLgRL5c3sizGYs
	n6NvQFepXhdqnov6PsVAXwrfftNRcvu8=
X-Received: by 2002:a17:907:d06:b0:c45:c030:732a with SMTP id
 a640c23a62f3a-c50963b5e20mr1117781266b.35.1794912355691; Tue, 17 Nov 2026
 02:45:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116231923.2587994-1-icb@fastmail.org>
In-Reply-To: <20261116231923.2587994-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 17 Nov 2026 19:45:42 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9VH3wkHvDsUXjxpZe9AB-MW7Xh1A+JcbCPL49oty++Jg@mail.gmail.com>
X-Gm-Features: AclHuK8fiNc9ZsWU2pMCJRr3yCpno-tCINeQbyIc0MxW3Yc5S64LttYNY55lpsc
Message-ID: <CAKYAXd9VH3wkHvDsUXjxpZe9AB-MW7Xh1A+JcbCPL49oty++Jg@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: store the security descriptor from a copy
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 8:19=E2=80=AFAM Ian Bridges <icb@fastmail.org> wrot=
e:
>
> Storing a security descriptor changes the buffer passed by the caller.
> ksmbd_vfs_set_sd_xattr() adjusts three offsets for the on-disk format in
> place. For SET_INFO, and for CREATE with a security descriptor context,
> this modifies the client's request buffer. Current callers do not reuse
> the descriptor after storing it, but a later reader would find incorrect
> offsets.
>
> Adjust the offsets in a private copy and make the input argument const.
> Reject a length shorter than the descriptor header before copying it.
> This keeps the caller's data intact and preserves the stored format.
>
> Add a KUnit test that checks the input stays unchanged after a
> successful store and after a short length is rejected.
>
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks.
