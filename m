Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828963;
	b=LXeWmv5rIlG3xCurgzCtLjQ1wblAOgd6DMnMc9TJ5qKyru+bwP3cPlwoOFBE/oAYS3zF
	 S55NZlEqL/1+bTSDtF423XF+ZBx7Ju3FdOpaeH9unQxR0XFbVTBCtZ9uFrbcdhgM8r9ny
	 yDxIhxOdDUusoeYJk3uDjXPI9qBJ1Z9o98iH4/4pn1FrifuMnxfJHgczDIOBLsUtPvGNX
	 pAUhCgbEEsyshDdXSgXjMdzqapicIXq3XzyvGkAFHgrvwSF3CD0dNfBfYQ9pi/GuEoRl4
	 1Bb6Yct2wSepXcem25oFJHLAsAVyCdRYCC4rDY/WM8U58X3C8EkiZtdJjZVlrD9XeTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828963;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cONDghda4bSa+cgTZWKDo72U5KSXvCqZiVtuXzBZJSM=;
	b=kl0wfESgnIWyKR9SpViBjIr3swG7MNMOkQLh3u7stjxB+0lLEj9Aw3vzUjgEqT9aSzzW
	 8jSXQ3mOjUtRsaSS05EkjR1poJB/jCvhJHuGSwnNNh+kyrK9V4uM2czaglkEMLSRc8gjQ
	 BBW5yzFKjuywFKJagD/fHKtLlwu3P5VEvKUMjTt8wif4CjPXeWZ2zBbvd7qcgXzIPEF67
	 XuZcGWwUVjRSpT81iFYZ7Dsl2+98jdwt8UfCL5jcSA3V43x6LhLvv4kWIxalMZTrnJFk7
	 +/JszdMGlR8Efa6jjjVuxyPWwn4P4zOyXtH+C8fK6ZC53l1BDVgOUVjMSDZ3J12iquQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lUeWYxk3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE6F606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lUeWYxk3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6CF1F000CA
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794828962;
	bh=cONDghda4bSa+cgTZWKDo72U5KSXvCqZiVtuXzBZJSM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lUeWYxk3mxVPeUef1JnHzqQHtgCanFFGpJHsiTSzqAR4k9zjnyKk5Ffwwfk/acQ+v
	 TYfUu9lxhAA5iXaOMsqN0tNY8meTh0Gvirn9e/Lom1cjk+0FWkRqXvMhDNADpfg7v3
	 YyBrB5+5eWEiEfixJMUxyrgWCB6/LW/lE50OVuVCf9bqtydaat84emFnF9aIZGQAQK
	 wdlZvhMS+DqwxIiacUpdeNyeQipgooYAKd30q5fxz4Aj2L+8vKKnug8wEwrw44o8dC
	 HT3UoMYpyCEJiqbo8Cxoi3cqjNZFDKvyJGzpYeMgctKpygakgZtSbgj2RbK5G26v94
	 96DTbBOG+ky7w==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67da564d9f2so1603120d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:36:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFEutaQnCi2uDsiVtw/Eo2szZujdYJeZce8eO+zx9lB9Gqeycuy3xqsbmzeCVKAzgGxuS58gcB1ba6mmPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mtvtprgtqUHRaUDn7KwktDqb0K8mHEDmSbuuMkLS89zzNxFzG
	ogJ4uII6U9ztQgOyRrGWeej79A/FInilbP5tSRfD6mUEPqi5gJgR9odYT0oRl9IvTszAibaDcm8
	Nv5mWj1Ip/NbMHSzzYYrdbFAL0H+2gpQ=
X-Received: by 2002:a05:690e:4093:b0:67d:c122:e5d1 with SMTP id
 956f58d0204a3-67dc122ef28mr342914d50.20.1794828962117; Mon, 16 Nov 2026
 03:36:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115155308.415734-1-koray.fra@gmail.com> <20261116021351.2485365-1-icb@fastmail.org>
In-Reply-To: <20261116021351.2485365-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 16 Nov 2026 20:35:46 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-DUphW9wb-4bqevtC1Y6Yv4YZr6YK_etR8bg3vN9Fj_g@mail.gmail.com>
X-Gm-Features: AclHuK8rF0dDdi_WLgxZb92vf-mrgB1z8ovcL-2UOpTqgktFXuN37ve2lyRYjMk
Message-ID: <CAKYAXd-DUphW9wb-4bqevtC1Y6Yv4YZr6YK_etR8bg3vN9Fj_g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ksmbd: decode and honor DOS attribute validity flags
To: Ian Bridges <icb@fastmail.org>
Cc: koray.fra@gmail.com, senozhatsky@chromium.org, tom@talpey.com, 
	chenxiaosong@chenxiaosong.com, hyc.lee@gmail.com, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:14=E2=80=AFAM Ian Bridges <icb@fastmail.org> wro=
te:
>
> Hi,
>
> On Sun, Nov 15, 2026 at 04:53:07PM +0100, koraynilay wrote:
> > Currently, when setting file attributes via FSCTL_SET_SPARSE,
> > FSCTL_SET_COMPRESSION, or FileBasicInformation, ksmbd hardcodes
> > flags =3D 0x51 (XATTR_DOSINFO_ATTRIB | XATTR_DOSINFO_CREATE_TIME |
> > XATTR_DOSINFO_ITIME). This injects unrequested creation time and itime
> > into user.DOSATTRIB on disk, even though the client only requested an
> > attribute modification.
>
> I tested both patches with the server code of ksmbd-for-next
> (3bc1fb9c3b20). Files whose xattr older ksmbd left without the creation
> time flag now report their stored creation time and attributes, and a
> rewrite sets the flag again. A file created over SMB keeps its flags and
> itime when it is made sparse or compressed. A creation time set through
> a second handle survives a later sparse request through the first.
> smbtorture gives the same results as without the series, and KASAN
> reports nothing.
>
> Reviewed-by: Ian Bridges <icb@fastmail.org>
> Tested-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
