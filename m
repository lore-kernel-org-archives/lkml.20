Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BF844E05B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792314470; cv=pass; b=rRD9IKmqyurRtr7BaQisMUooGeFHZAoRhrEVWp/3AP1qFmOIaR1wlRceHldob6g/sOj1omOnB7U7TbmStnN7m2NZTjzdNnuAgbUL/MLmGfGxTmvjrcLvle3GjDuUupx33OvBtmxRr48bofR2HAqZr5kFMnSvGOBIZIhg0rxeZfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792314470; c=relaxed/simple;
	bh=YKEQOWHI5G+jXotkQs4G+mIlmKX7piHSbOJfVNpBUM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hjg96r8kSMQCRImSHQM84NB64SBacOwc1awc9zjeGqEC+dn+qGeJI/VLqvRBPBFdp4Hu8VByU6mZWRAZhdydHDl3Rxotnc1e0OBRiuIZqhQtFStfMBVYXv5bc5BsK9M5O4aefsQtNnyg0Rx3PkJeEXhC4YbiP8Dl/Rt51LhWZiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcfr98Qw; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcfr98Qw"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33c30fcf33fso142060eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792314460; cv=none;
        d=google.com; s=arc-20260327;
        b=dgOeTZ8GuO7cGIneXRVf7DpHGNl+OAlANAPEYJxnmZBSGsYXjEpl22mppNs3IrZlz3
         EumwWtFtRWhsnoPDDEoMZmYVWTdNobholwskRQ65Pa7inpE1bY5UkhLugirdthbMxufp
         h0dH4yJh1LSYr738ZSmMeg/ADwGgcCbN5KLM/KI4n9kSLrB/TJQ4H0jz5E+dHY/i4I9r
         oc4BlGFguq+18wMK0GMke1A2VaCuhteFsATgb4wETOGV4PtC3+vbwC1fDTK0glsUbDR5
         aRWlKA8nURw3EsJFSedu3DHpVtlTt/bnVu4DXhCqDr+oF+P5ylAPz5RgDvsgZuIo3yxN
         WP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kcRmzYJP/PyS6UQzb5xqFQEGXy1l3DQrwtRmUpt9Mjg=;
        fh=F3uhRdpHxi2wMQxuv8u157Cr+q/GjcgatWDxoQmW5lo=;
        b=IAhwuVWMzpT+qjmrlNmzlXMy62v4GD2xj/NprD530Y0x4ouvyoH7AFoZcklmU2RZHG
         IJ+Wj04A53FCEzq/yHBJcCSmJAA7u61fPpqHTrexQeB6KeAsu0Rfu+QKrewAowcq0+io
         rfjcCVopIFqhPN/24oEO+mFu69ntHHz+S55gMamUj4L3SCHZOYlPCDa54uzKdfu0gk5p
         0eVfJ3fcBRw7Q95ewul7HH2gNE3c/nMuWpb0bT7SkpqXpG1x3IL98MMmHLzkgKE3rVal
         CDnl8egMks/Vwl72TPz5i8gqs8axHayiLaqTq9VY3G8K4wQOoASnURFdY41m4n9VqQCu
         UqgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792314460; x=1792919260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kcRmzYJP/PyS6UQzb5xqFQEGXy1l3DQrwtRmUpt9Mjg=;
        b=pcfr98Qw/lKB1Kw0rrkVjwBXNa2uAK43f5bp5Cp7GjenCLWdmNo4ZPyicMFS2VEiZ3
         Eg7wh44fXMmeb6ZANNJ3tEAp3C9peFzRHPnb0Mo73K6hOqizwfgHns0OC8V/BEj7WNn8
         RSJywlzhKfEacky57Rg2qlhAa4aEYDbaX8zSMzAutt+QbRlmGw8SAIW5Qbi2F2Qqqk0v
         S4DhhkKdLg3v82f53s0fzGBI++G7iJz3RMgpkkR918IwvlwMYw+qyCs98D5byJDFCIuX
         l1Y/Us5pFjQxRQVKOK5cjQjY0S3d/x6uDHtfiyYk9Gz7WxDM1thgxqNP/XLjphMlDrYx
         xR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792314460; x=1792919260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcRmzYJP/PyS6UQzb5xqFQEGXy1l3DQrwtRmUpt9Mjg=;
        b=Ic0wBTIIzkLSBL2j92scxWSa5Edwjcg+3x4tpGyTpsSsIclzso040zHCrvzMAOW4MJ
         B2MR1WC5LV9auN5yyh57/4YaUJV8bOzuLaCofNqd9lshf+FnR3iaB5hSXOKEvbrQBZO0
         afyABSbXwvJQttE4TGSrjrbrnGXENgOc2tbRozj7zLXbdFImHWpqUxK5kvOVbIFYQ9Tq
         sTiQyxp4AZdKfku5CSygFBdBVdA91Kzn1mlQgp4b6dGkg6RXix6e3GUjhLdb6hjIrbzU
         uHT2eTb3nxaGQNSq8KjQx4Jz6hc4CfyCB5p8FxZTn5FQ/rC2yGQPsWlxIAcIHAzT2y32
         wl8w==
X-Forwarded-Encrypted: i=1; AKwUvByzmLxQ/7qB3aQYraYJpVPts5C55PFfJh97IED6NhcXyEl8+SeSs0uAQZxMovmG0QayhcnG8u62VVrHVMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNUwvh5tSzvtiG3U/etc9weR4oHZ6pPXbYx0S/2fW/Y1GM/jq3
	mKcrfqnUyURy5NP90jb3W2/trTMXY39yf3SHzOiLf6b1IV3XBfmlG0TlZf3/Ot9gj9UR1XFKg0m
	w+UjmuSPzaQTcuyhlaechHTRGALjeJvM=
X-Gm-Gg: AYBFou0AiLQl9pAQUIDDeTEuS58r4uL3jyE2jgIWJ5yUEt19mrt4LvppkgN1VeDMfir
	a9vrWBfQ8OWTgRtFRpNiWrJX3gOFQ0mN8XyCbVujmdFS+n1dy8KiYg0rAZRklmyrjnPwqLx1zjP
	3bHCRU8fchRV8GaP51DLIIG9gJnbcGdx02QbpUstXQV1ZTVQ63VXra/sVSieojYE7etfoBeQ6zp
	KCdQvo+xg2VPMcUQ/sc5p9/cM1e/q3yeB4Vj0bYVFZbnCdRvlDA+AKFVSQrm8XUiniXv7mQxeOq
	wTS8aq9jjdvHjw3OH9ByCnUTwia+pW2vd4ItL+7VLJKGES7/tP73FdyGegGUlG/LeyfSbmVjdcn
	g2YLsxVnaJojotQX3+9TnKY3M9iSp3IjMeKri/BZStlP3Uiht+R+9QLadfiM+f09wp8WvHiIOiQ
	gLZ071hCDXW893RhTcaeGD5ph00OgFnB5pJQWdSZHHRs1qOL6+bB4=
X-Received: by 2002:a05:7301:2706:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3619b601fbcmr10832463eec.0.1792314459968; Sun, 18 Oct 2026
 02:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017-rust-bindgen-workaround-v1-1-fbd99504b4b9@weissschuh.net>
In-Reply-To: <20261017-rust-bindgen-workaround-v1-1-fbd99504b4b9@weissschuh.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Oct 2026 11:07:26 +0200
X-Gm-Features: AclHuK-EP6tGZQJMqUJtG9M6XVncdRZpSb6-mW0FhUlz_0MVFccRLlEStP6Fc6k
Message-ID: <CANiq72nni+Z9WMUETTDuWmsb5_KR0CLyDu30udwqgc-abykY9g@mail.gmail.com>
Subject: Re: [PATCH] compiler_types: drop the Rust bindgen workaround for BTF_TYPE_TAG()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 11:55=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weiss=
schuh.net> wrote:
>
> The referenced bug was fixed back in bindgen v0.66.0.

It is tagged v0.66.0 for some reason, but the commit is there since
v0.61.0 -- I noticed because I track it in the live list:

  https://github.com/Rust-for-Linux/linux/issues/353

Either way, yeah, it sounds like we can drop that very old workaround, than=
ks!

Cheers,
Miguel
