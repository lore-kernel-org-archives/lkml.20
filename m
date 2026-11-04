Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799401;
	b=SZXPRFhMhvIOuSnz9qosIQdhGdBpIdZaQThBaFTw2JikS9C5lTqVMjRc4/9B6uHMDpT8
	 iwOPhiCW0Heuu23gg+UM2v9dJqdGCouVzNZjVchamo07u+1yzb4jTiTmF8S1CSDmm9z5+
	 OTAZK2k62WTv7hueNdSrZD9CinIgNyjAh6gtxfdfMHsnyczA0wsZZ1qZ0nnuz5DllAxX/
	 pe8e2rZzaD8vXN3PFsZq4ZtxYqKx6OVC2j5u/Cu+P+qSZ6bCtM/spoWNslbcJI8giNZU7
	 l/snDmwlGRokP7NnMPwVmjj2l9k6n7J3i2Q8WnbsPeM2Oqq+Efi97lhJQ+s4Rw3RYoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799401;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4IW2IJC8HI+A2vE8HMXp5CkVfOyxGkyctb+UUmFFJsk=;
	b=UsuJKX70sBqs8VzAPpJ1TdBRkH1rm8VkKcG3pcrH+Aginr7UXHboBwqcNeM774LrftNX
	 QwVK1XM0e5vDRgy/obJt1LaiHH/mqhoAlx6ksZFf6413z0QTkytaSY3M0Al8wISKgaHRt
	 JFa6kni4K/r7iIsWkXSng7SEcPPOJrEaBPziBJNF1+6KFhLFn7RM2dSuMouAQEqa1ly85
	 8ECuV+c6LRawEWRVZxwRtRQ/6hUZro5VS4Qd5u4bnE968ghCIwKBEMI25oVno7QVT1W3N
	 e/7/fX2bmp99BVu+SxosAFhNglbF8aME6zSLU+hw6p+/o3UIIuj+twKiitc+lACHGxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e5zkBXRZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7966A606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e5zkBXRZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5708E1F00A16
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799401;
	bh=4IW2IJC8HI+A2vE8HMXp5CkVfOyxGkyctb+UUmFFJsk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=e5zkBXRZFg/nuA+/9YSZ7a/HIwYz8bBVfkKSb/kdADlwNjs/hnn2vFKw2B4NdqVXt
	 lgf5FhrMIkeIkGY9NDxptXausbravIDpqtlYHSO6tX8h3v9MLXQUQgSVi1WizL3TFm
	 u1oTDCy+0BymcVlBq67Q1O/U23oBvle/SHmD31QGQkU/NLwlUPtJdo0wHk4boLiBAl
	 BfVpFXudolihCiW2cCLCwrA31am2rNgoSGbHloaGJToY0nnv9viZ7ApM/jvItBs0Gj
	 75sebh5l/I5bKfVR+KWV4TY2mjCInMSFnOpSALqLjcCnp7+FWYkLcz592wBw0C1wN8
	 p9k+Eres6A7fA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so622271e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:36:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx9waG63FacPXM1/eqbeLND5DmbM/xxtwyOkRlBQ0to8gDpaoQFiUQ8DtgZYNzfx19qM5JnrPyMGis9hdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C28iO50mn+Vukh5tyCCBoDqTdC6eOUuCEg7GzbrCTQWUqL3iE
	UX5GtrxeCkLDlu2z+PcaLgKNqayFJ8Nels0QH1aOBTO7QPpo1iNx2F7KrFXeCLyQVaXKSeL+Yx7
	AaMzFIq81pHKMaUYA3ioNwq0MLU7fRRo=
X-Received: by 2002:a05:6512:3da6:b0:5bf:d68b:9283 with SMTP id
 2adb3069b0e04-5bfd9579616mr5589329e87.50.1793799400124; Wed, 04 Nov 2026
 05:36:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023204207.48277-1-olivier@mgcrea.io> <20261023204207.48277-2-olivier@mgcrea.io>
In-Reply-To: <20261023204207.48277-2-olivier@mgcrea.io>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:36:25 +0100
X-Gmail-Original-Message-ID: <CAD++jL=MppGddVSBF_CpOzYZmL7YqKVTps6RoGzT0NJzRsP6-w@mail.gmail.com>
X-Gm-Features: AclHuK-0JNw2LDUbT04QkjMt0f3XsZ3rrM3rgKxLy-FpJXBHdtz5j54CKebu4Qg
Message-ID: <CAD++jL=MppGddVSBF_CpOzYZmL7YqKVTps6RoGzT0NJzRsP6-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: ingenic: Add an X1600 group for 18-bit RGB
 on the top lines
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 10:42=E2=80=AFPM Olivier Louvignes <olivier@mgcrea.=
io> wrote:

> Boards that wire an 18-bit panel to the six most significant lines of
> each colour leave PA0, PA1, PA8, PA9, PA16 and PA17 free for other uses,
> which the cumulative lcd-16bit and lcd-18bit groups would take. Add
> "lcd-18bit-msb" for that wiring.
>
> Used on a HiBy R1, which drives its panel this way and uses PA0, PA1,
> PA16 and PA17 as GPIOs.
>
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>

Patch applied!

Yours,
Linus Walleij
