Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793218452;
	b=2gFTjnUktbZsu+2pYIU8WfLWii9/w4NUELYyiJaTNwJX/ZFJ9NntmxWmD58wXHEYGMeM
	 5KjkXllw67RWneJkHKdb0/hkkkI8uljVZSuV4GFkY7fFRtfwKZ/OrtdVuGIiKpj+mYqro
	 d4iI1IH4sASd1weQKzXxQIHJNH2Wn+A7CblF7qULaU7XqGrBVboc+exHPKr2G9q7Yb2qP
	 kXL9yY9Q7G7jf1KZj6WNxilXj4vwxJATFJ+LDg3Jq6pvAk28wSNn3qqFEIAx2uBtRM6y7
	 3TMDGj2nhI6HH3hf5juTAANDHk+/NSO47uE7eWKrNH1iNd1pVTd8OyA/eZKwHlGrzJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=csQ/box973kWuUGXHjUHnb+JSV/cr2As/2S3bZoGtKw=;
	b=g0GNe9VCF4aCnmwDRoJsFBMV2IlxFV9LIEg85r49WFwIufQ3CZuBckH3JIuh22oV48KP
	 OE+PpG8tQefaX/ojPCTsiODNY4VQynvv/D8uEfUnlXYdNSxSTn/KzVqT7JnsP4NVeOsGg
	 MTS+ZDrJKuxEmZEcMJeEmth22GkOGZSPE1uzFWlDnIjfl/2Jy6VUaLh7cKwK9SzNmG+Ka
	 UGhgsALCNwg7rMJ9sWK/yDxok7H5QjtO3QLffeXVRDnZ241IWA90k0taiESmmu/y8ndzO
	 FSxE67dIWXLMOFVnooW7yrnld6W5HhFQJQ5hpxvg/UmHevJO/aBX8E7uiQb+A1psW7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GrkbgZj8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB1C606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FB1C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GrkbgZj8
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53bb57f1310so16950501cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793218451; cv=none;
        d=google.com; s=arc-20260327;
        b=N5uxaZCtnabcTCutfjw4QmZGqjV16pp0RM/uCkAB7zcHuwsNkAWVMFuxxv1e7Aq6m3
         MTygtRLfZp7fSE9HR1cKmABJ+f1xAR0PsG3qmSQDFAgDIVeem+CGz0a+nJv2ZygPiF7e
         dPUVx/FtzMcC/ef3USe1e1IuCL1+o66ba8H3GlDYo5bj0H9T5aPg9lChiFrvMHJm0l49
         3J68/j1IWiiLnw3Ia93GT8yoXVIz2CpSp+2yIeooFd6wcCT+uI2ASd/J1AvvH4+YPZk7
         3VJf9dMU5RMZiymSDd5/3h21hVbFoRZbpFg/0xO5mFpJ5GmULMbBf49r27Hff5z8SSfj
         pHGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=csQ/box973kWuUGXHjUHnb+JSV/cr2As/2S3bZoGtKw=;
        fh=yERhqToh4l1VX4FvOLTYwPEsCOevvtbh4mKotofXXkA=;
        b=CI33S1ceehLJQmfVcPEkbSuQdmn+aeUkeEqGDQJ7TzVpoqEhtkqwXwANqGZoxkDjNH
         gK38iE3Cqf7pKoJ3XLeW07qFpWoZGdjX7HFnnTsSoQt6+Dd8b7FVgVlyEyjm0tUm+gCb
         P9HanzT0kOLe5kyZm54cqtRpZcVobUmsMu7toY6hEGI8vd80GAfA8g2GItoL/W3Vn7Qb
         Zij0n4gzDx2jNajLoI9FcYmCZsG5zVcb99M1kAiXE6PAgdMRQzLTRDId95CW3E/fXljH
         XZfbnB5MnBqQ+CYF3mwA2Eez1ebFRJTznIur53msYMnuhqzcER2thom5q+SsYEvyHEDE
         fpTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218451; x=1793823251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=csQ/box973kWuUGXHjUHnb+JSV/cr2As/2S3bZoGtKw=;
        b=GrkbgZj8YBEsBwIO1OQTS2rh7snbAH21CTecRXJlz60RQzoxkzBiqwCplXDuMntJnY
         OMyClbsk/Ai2Qx2glN4KJTcPlWQWqCw1v113QTDp/ioJ6hLLy19gDuqDMpdf6ZXHElVf
         4AHWl2McaG4h5wW4WJrovav4XFIbirEZw8urzto5qjM6OZ+5C7PvMXScrXF2PBgsRMcT
         SyyN+8XNSgEq1bSxuIMeOyUPHTGlqhxBPG+XsATLbHaDEi7lMr7YJc5xb/XKGH7lR/Sg
         tEoFudP/e1M2GvReYGX3jNqb8ou+i28WftcaHDKMd46o+kg7m3WVtndlX+ZYIsHtBZwc
         khfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218451; x=1793823251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csQ/box973kWuUGXHjUHnb+JSV/cr2As/2S3bZoGtKw=;
        b=jnir3bQvGX8OdvxFDNcBu23vRjzPFlNN0selq7nuvMIMnlM2f8aHG4JufaSsc7zALi
         Kb/3fQ4m+xp+RxDcZxzYbnZLIAWqkFySHdlTygMSEYfBuQB6svLbuuFqXWKJVz5a73c1
         NOSrrelWeKAF1h9CArbA5TwVJkfPJuwlqWvF1pgFpZPQlBTLQv8QWGYvopIFjqbyQS4I
         Iu435+hR01tLixELKVxBG5+sMNUWKxczCoWnkE11FiWF6YUIacc8YscFf1hPk0p5TjOf
         5c6NVtVCsZB3iW0WslYDgHxqlmgxXqhizcBNy+A09Airsi2M4fNZq36JI64v27tiUNpJ
         m6wA==
X-Forwarded-Encrypted: i=1; AKwUvByk/fkpIU2nOU4N8Xc7sPYNulpc6jSFwfkW/Lhd0NuKSfKlHAn0fOqj0aaj+P/qrv7QQx6jZOYEDdfF5PU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRbqIHjjTY8iTI1FJUOzMEwwAsc3IU6z8bg6+jpBiwN7odVxon
	aExE/Gv03O9ACbWkNmoVIgvGOKyPyGf+MoOm6BvnUarB0mmft71YPSeLOGH5VmHLn9EWAGh8O8B
	K4oPBron/JU77pbS171WHDxRQLHYAodIYvR+0BRJW1w==
X-Gm-Gg: AYBFou0BLknYSe/QAsM9+OTAzEEM+8uoR5kPTRJ/D6+TK4EwRFddIOU/y/LCQndlIdF
	V89xhhIKzZ4COqGX2Z9KopZRYBpw5jyufNKYEyqmGdRUbD9qa4HHpU5/n9tsi9aYv5rUerevdg+
	bLyah601frUkLOTsoWR3dov00DNdNx5L+fV0ZA90heBpNPysesr/LCrywUur/osFGYTD3b1vEG+
	umsHvA/FVTx0+7H9aiMuIEyVgNErDhowKLQ/3AbwThWYpBg7M2wJ1AJ7Dc98WKB609aXIbLsnHf
	xUohsZDFlFBzY5X/6B0uDCzgktm+ggGg066JZrP0SDU9/gFRS0Jrn9TUpAEDyNLQZar9Ut5otPW
	Vc0Ku+ZCruQdsQNRWqC9aTujjzDWg8eN36YTx
X-Received: by 2002:ac8:5d8b:0:b0:536:64a3:aaca with SMTP id
 d75a77b69052e-53fcc6caf38mr60121161cf.62.1793218451089; Wed, 28 Oct 2026
 13:14:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028155005.174417-1-mbkchelofficialdev@gmail.com>
In-Reply-To: <20261028155005.174417-1-mbkchelofficialdev@gmail.com>
From: MBKCHEL <mbkchelofficialdev@gmail.com>
Date: Wed, 28 Oct 2026 22:13:59 +0200
X-Gm-Features: AclHuK9QKQWnwAVDv7GI9zgwHXTw8N_TI4_-PW1Dq0nQhME1r2ltFbMpbGG5jvQ
Message-ID: <CA+YDrKBeYvS99gpg+3knSXRuNj1a3_YQjX84xfQzQgNyrSpUAw@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: document emit_base in ModInfoBuilder
To: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Please note that I made a typo in my last name in the "From" and
"Signed-off-by" lines. My correct name is "Ivan Tverdokhleb".

If the patch is accepted, could you please apply it with the corrected name=
?

Thanks,
Ivan


=D1=81=D1=80, 28 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 17:50, Iva=
n Tverdohleb <mbkchelofficialdev@gmail.com>:
>
> Add documentation for the emit_base method within the ModInfoBuilder
> struct. Explain its role in formatting metadata strings, handling the
> differentiation between built-in and loadable modules, and managing
> linker sections and conditional compilation.
>
> Signed-off-by: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
> ---
>  rust/macros/module.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index 0a7b9e24c..6f361013f 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -49,6 +49,16 @@ fn new(module: &'a str) -> Self {
>          }
>      }
>
> +    /// Emits a single metadata entry into the module information table.
> +    ///
> +    /// This method formats a `field=3Dcontent\0` byte string and places=
 it into the
> +    /// `.modinfo` linker section. For built-in modules (`builtin =3D=3D=
 true`), the string
> +    /// is prefixed with the module name (`module.field=3Dcontent\0`) to=
 avoid naming
> +    /// collisions in the final monolithic kernel binary.
> +    ///
> +    /// It automatically generates a unique static identifier using an i=
nternal counter
> +    /// and applies appropriate conditional compilation attributes (`#[c=
fg(MODULE)]` or
> +    /// `#[cfg(not(MODULE))]`) based on the target type.
>      fn emit_base(&mut self, field: &str, content: &str, builtin: bool, p=
aram: bool) {
>          let string =3D if builtin {
>              // Built-in modules prefix their modinfo strings by `module.=
`.
> --
> 2.56.0
>
