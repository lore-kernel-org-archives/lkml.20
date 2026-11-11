Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794368154;
	b=iUnW7NhtxkvaVC+LF9uHoJtmIA9iWkCt6ISEk/EJwx2DZDKu9Rr26N9gTO4zMWQ0rgnW
	 Eb4oVu741XK4TATSfzOPi1zoLPd5nCr1wKwszGJ0OhlZ6EGEIm5OB1ij+Y6EItYgpsAps
	 NkzVg/o3kZoa3393aEK1kJ1Phk5Aqg0kjq1D94ayzsr8mGX+ZGK1RtwmEtwXtHyWMkigo
	 niH/siprr5Us96ByUyt3ArCKVxDLo+udzyF0LVQcKgOaAZBxSlunNbiKXl+QW/gNFU1Py
	 G5GvesOn0niWhkrRTwrfrtRFoHm3ZinGAH9IRtQbqVJP5QlMiZmbRDQ8DfoT/i8ZaVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8TywaaCqz892UCXpGk4xLWoIxHDkRWoTvx/KQxG7KWU=;
	b=U40kGgfH5evBJXSzaRhfHl8mwUfN+qNzRnTQaRcqucQQ3V8JoekbBTvMDtNNmFAsaSbD
	 YJiIYRYWgTfzSbwvVtQaxuaLbsNYBLse9sG91VmvzombR+5gAkpw9p8ZWfgAUoiFvg4Uo
	 CuZ0vbQ0KWvaPGLMGuGg7vks1LQ+XsHbNVtqTgNYzK4MfBh//Kejb+UTS7bvcgyjFh9ta
	 fIUbT2Eu7eCqyTKB+3mT+3zjkrHXT/8/HJy7FuLJgd/K43yPZ9Rz2cd3Yd8NtzBfW35zg
	 phBRwyrBFCFsUxXYCnYWkt04udiI490W++6tYXJY67YIqwpjf6kGClRnNlID5qsRr0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LzNPPv3q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8BB606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A8BB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LzNPPv3q
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2300978c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:35:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794368153; cv=none;
        d=google.com; s=arc-20260327;
        b=lhJYF3E3cVmbgEQ+TDMnX3sNscqUHA4jNmA4J+lKl7WB2bZn/gzfSm71SGiVFN7TVS
         SkexMmtk8pXwBrZSFFAB0oGJ8i6turc7TN8exFNRZUSNr6TaTZd68qnfpaBZwIpelp5t
         xU4/gAfzeDJV95CPRCDiU046VCTr9qUiFFSbg4swjDUjY5gORsnwOXvDVWO2mNWJLfoZ
         WorjUQj7sTPykde4kmjDx0nLzczEPDy6WJH+EI6uqyWVDMkm2fum0eKK8KGCA4etIqta
         QobzvTovMuyLIDZooURktWeUS7pD/L+dqfFM51gaUCU7Gz1VYB5cUuj+09YwddWvFzwe
         RoiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8TywaaCqz892UCXpGk4xLWoIxHDkRWoTvx/KQxG7KWU=;
        fh=iRuzuRqGgFfuoqdSxLgDVxfXX335MyVZVv9GryjQN9k=;
        b=iXVFWKWmEKIC4/MX/46l+lh/OeuVUzsbEpNkTFwyrw35DCPEoDJEhOtJ/YyNzyLnaC
         XVlcYU/uAZa1IEPXIT3FM2muhfd9d0qlIZ+OFea7w6bWl1ngUtVbxJKAjphrH7PkcSgU
         h/XVT3EHLoOgurSV0UNmv4PUbK1qk8mnMYF0V3/UOc+TphwP0QEmGDXDi+MPz/u7D8sX
         mlw50wEUbhbUV0QlCH+Ip+dSCRtHqlY2Jo7cd2b37rI45nX6MZeQc4q82H+XvzwZlC9r
         uPfS3IDJkJGVIiuNQwaWcj/ZvfheJlJjLYoV5jp5rz/0WWLB4ycpzyY9TJN4MNNSoNer
         BPxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368153; x=1794972953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8TywaaCqz892UCXpGk4xLWoIxHDkRWoTvx/KQxG7KWU=;
        b=LzNPPv3qwB9uJvUwCjDJy3dMFlRp++p2d7NddYrRWpnHJOJjwMLRUYfCYLeNyND5E3
         lC4arcKL6DgF9eKlMQOOBFA1Tv3eHoD7eHwOlwL+GlPzZiIP1mMLDOJI3f1ufQnngohU
         IRoOJeI8/mdooh4l/ZoE9PwYme3SSk+Aw0NudO8l6Z+nlerWwEPXYrTzfTycqY1n0tt2
         UOa96pe9SQDI7G2K25PnN6aGRBKcMW/bEvFfXiXPzvDubtgazJodKGEXSxZrpOwCJkcO
         a/Mu2fkvjE9OG7e1nTcGskRabuqAzRW57sv1sg93AKqKldfQz58VDfjfztMJ4nlnvQt4
         qI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368153; x=1794972953;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TywaaCqz892UCXpGk4xLWoIxHDkRWoTvx/KQxG7KWU=;
        b=UctpjSbTe2zX/FLz11rwEXtFZ3W8dLsL640dNo5fEM9ENnZ92ANcg63nbFStNEf2z9
         lc9h+KQ2gX5XRaTM4gP0/eWyrcmdL6AwGsZGdnlhU8esY+blYYJ9VktAg3wv5hkDjI4p
         h1OBnQOlEglP793j8y7Sg35levrEFqcwOZDTKpg3xbtGNoguuez8l5PNWvEacm28kMbh
         oFeVjlx00QPF2dWpQp1aHqb9bYn7TdzrFNIdzOQQ3clMcIWJm4ZWluUH9Hi0Xoj1hlWI
         3ZbH4Z4l63B22RgjN5EnEbDMBEghVz2y5bZ/00v7mcltlup7olQRl7ja3jk62B5GojOS
         y2Hw==
X-Forwarded-Encrypted: i=1; AL+hErHNltPTPwCbsGqUAgnfS9zZ/34JikuN6W1uHrNZ04SjX8ERjVNRMnQqbmRaokqqtQrQxjuNNrJXEaTqGgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4bBnRHFm3emjo4XSIPxyzqHgcHZV21uCNtJuymyp6b0RFSVxN
	SG7F2pMW3vYDgRjgNoWJX3gH8PaMjKArQ21/+YjLN180c4m+cmzPAeYRPE40YKF2VVUzmPofDfd
	L593AK0JdYfe6j34D1ucU7lKQZdSaYww=
X-Gm-Gg: AYBFou0+gFCIR2mNpaYzwFacckNz5bzCw+vLjIBc6XgoIi8vE4Ue1R3Yhtk41wUEt7p
	Ih0F/g8gM8sYip/LfaUWVetIhTTGFYosoqWpU/6rrofMegAxx+B8oKXuLFSvr1Nhkqz/1T+iY/a
	ikSfivjc3U8Bagrmv1qObsdzOdgc0PveW/kKeiYir/S3WCUgXSfUAY33+mzrQpcHKxo/oULsP6i
	wes0xhWcp3DD32UPlp7i3HnqDL/GnWVb2TIpjQMU54BxbbRgQBHNTfZmflX22a0vIukzKzpqgNy
	/T1LnR0Ys9qWQiTK3clvZCmLsPLcDIt7ykltAU4L10IcNPYsEa2s0a40sau8L7KBxn98kerymnW
	R4Y9xfwKUri7zqhvh8it7vh+CW7XjV7HyPO6lXZCWVSyGyS8MoJc/5JAiV/o=
X-Received: by 2002:a05:7022:2594:b0:1b2:581d:5dc7 with SMTP id
 a92af1059eb24-1b3bef4c4efmr2201891c88.25.1794368152653; Tue, 10 Nov 2026
 19:35:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110090343.1245744-1-islituo@gmail.com> <a0b9693e-2a6d-474d-b178-3bbd098a69d2@web.de>
In-Reply-To: <a0b9693e-2a6d-474d-b178-3bbd098a69d2@web.de>
From: Tuo Li <islituo@gmail.com>
Date: Wed, 11 Nov 2026 11:35:41 +0800
X-Gm-Features: AclHuK-kqsOOs5H_16jkpDsqZVeQRaLEmyypq7XD1DrM4zT8OmsZXESULclmxGk
Message-ID: <CADm8TenZPgqksu2VJsLhM0dDrgyq1YYMWZXwytj=Vd5A82eFvw@mail.gmail.com>
Subject: Re: [PATCH] media: dvb-bt8xx: Fix potential double-free in frontend_init
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

On Tue, Nov 10, 2026 at 8:22=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > Remove the redundant kfree() calls from dst_attach() to avoid
> > double-freeing the state on failure paths. This keeps ownership with th=
e
> > caller until a successful attachment transfers it to the frontend.
>
> How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv7.4-rc2#n145
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/stable-kernel-rules.rst?h=3Dv7.4-rc2#n34
>
>
> Would the specification =E2=80=9Cdst_attach()=E2=80=9D be more appropriat=
e in the summary phrase
> instead of =E2=80=9Cfrontend_init=E2=80=9D?
> https://elixir.bootlin.com/linux/v7.3.1/source/drivers/media/pci/bt8xx/ds=
t.c#L1693-L1723
>

Thanks for your suggestions. I will update the patch accordingly and send a
v2 shortly.

Best regards,
Tuo
