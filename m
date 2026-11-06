Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972861;
	b=QQBx8y7V7HRQSJezfg9RbLddMHuGY9tIdG9Oq1ShTXIlStc88CDPFunWWQUtyhIfPo74
	 ARZ9hAWIGqFeyLK//urIfF8NYY1398T3fcV4g9ZxfJnvJimYvcG7JkwgXeVITN9W3Uuel
	 LJDZ6EUwCs7YAGSqO9MLL1RSPbMys4vn4+YmIAG9MazFHqIaOaUx7eeyoJGI95ZkTeETt
	 2DjeyGKusNRT36xH1Oh5e8yxVZ1OPINoeb05PAAaYbLtyqNjpuAwAdidz4yd6SY3Hf0u9
	 d7DroLBPekFnbny0QCuyRqvoAvbESBX1ycQaqPce1jlwb66kTUaWWiH6/mtoc3ucNpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972861;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4vVL1EiPkJtSj0Q5/MEZPPVQTmsj+iOOThXSePIk96o=;
	b=kJ5ZNcI4E+irXSWLDXSFh9rm7NRsfn7+a56SXVQ+Zgcx8UWHYVmvNrrLT6/PCAU0mZ3V
	 910rnEjHUTxWsfiqx39ni97PjbZkVHoB4s3hm3VYcQMMtaUnmYyQe//CT+IK5rrYBjJRB
	 DZLXgpZik/SUHKw3aOV/K67A30smFEOkXUZnLjSVKYhPHZB1akCAUDpkxB4y2G+r4fueV
	 lqQ1bKBzPncEojnvb1FmT79A9a/apooQ5mbetFbgrN+CdvJOeG1t6MPCY1lK0t3xjxnCl
	 cVW+XdsRtGMMJfHQ8eEUsJFngkmu6MhynJaM31DNzpcEEowHJxr0Zz0pf7f7kQAVoUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hq0Bqfj2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAB0606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hq0Bqfj2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C991F008A7
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972860;
	bh=4vVL1EiPkJtSj0Q5/MEZPPVQTmsj+iOOThXSePIk96o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hq0Bqfj2UyhLMuTH5ekszeM/i7rugVYBcjwLWOQjWb5rKs5SSOkLzbvQOxdY/lWjf
	 qmNzTDIjow4/PpnuRv/OABiVlxSnKeMxeTZVMaknC3ZUax/bvINmgAKMlNidIiH88P
	 LGFWmh2WsKNsJl3zUmLa7jn/ECIt41Ur+LHGhk2bHnrozUx+tOpVNYzIcpCPuGVDzD
	 MIPAZVI/7RAaLoWyUhNo4XrDTQl55uGWDWrzWcfy+KQleJK//ZytW9nn55oa6HvI4R
	 tN5Xv/Mno20UNLkbF4V6WTbFWJqRwU16ONj5edIc9D+TkD83sv8Iy3jTTW6x45cCp0
	 O9ZoAgM2DqvwQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfa7c09c9eso475376e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:47:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzdxH55PYsLcZzk4iYMoUAgXzeeXJrA5w4KSFSzlU2aq+7BpAOuO597STwp6pkLZTY66X7w7nKjhsQgIls=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DRjL6309cjJj2CMrdML2ruwO7+8q3x97DHjB6ubzunnAkaWVa
	kL+9BvJg3s7zZ3LGa7I6cRB3q3AelQ9hcC7JwW//NSaIiz5srai6upssiDRcMwIKhMdAEso8AJb
	fFtjUcgnXf+/N/7xj1q1q1hkseuEwrKI=
X-Received: by 2002:a05:6512:3b11:b0:5bf:d6f5:f966 with SMTP id
 2adb3069b0e04-5c003adf1ecmr764970e87.47.1793972859536; Fri, 06 Nov 2026
 05:47:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103213002.1673560-1-lee@kernel.org> <20261103213002.1673560-8-lee@kernel.org>
 <CAD++jLmF0U6ehFSuauqKDQiZRkuUnqpbZd--v2aqF2YZQF=HwA@mail.gmail.com> <5c414196f5e34bfeb7a94714e5542a72@realtek.com>
In-Reply-To: <5c414196f5e34bfeb7a94714e5542a72@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:47:27 +0100
X-Gmail-Original-Message-ID: <CAD++jLmBht_EauPV1ggkw_pnydVbCTHk7s_dyHPN6OA_zXOKvg@mail.gmail.com>
X-Gm-Features: AclHuK-g1F9N5vtbEMFGavDY124RqKgGGFWqEsXHGpoz6PIuenneZBMpw1y5QLU
Message-ID: <CAD++jLmBht_EauPV1ggkw_pnydVbCTHk7s_dyHPN6OA_zXOKvg@mail.gmail.com>
Subject: Re: [PATCH 07/10] pinctrl: realtek: Initialise omitted offset fields
 to NA in config macros
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: Lee Jones <lee@kernel.org>, =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	=?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 3:49=E2=80=AFAM Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=
=90=9B]
<eleanor.lin@realtek.com> wrote:

> Thanks for applying this patch. Just a quick heads-up on the merged commi=
t [1]:
>
> 1. The first Fixes tag kept the original 'dcc9334435b0' instead of the co=
rrected
> 'e99ce78030db' I suggested.

I went in and fixed it up.

> 2. Branch: It was applied to 'for-next' instead of 'fixes'. Just checking=
 if
> this was intended.

Yes Lee reached out to me on IRC and asked that the paches be queued
for-next as nonurgent fixes.

Yours,
Linus Walleij
