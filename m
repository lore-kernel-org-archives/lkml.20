Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794763408;
	b=s6IJ7BY/yabj4BpoXKOKorOadb0/7QZ80YDc+571b2S2/z1SDrwlX7oP3XSFShB7bfxd
	 EtBnZG4e1SV3mHmCiauhs4Vxuk1C/ke+QHI060oUx6mvn56pze2d7gkGS4/1FCb02FE0c
	 M9R42YqpaSSJNGLCMptPKMIX0N5kYC+mARpIr/TzpI8ylVadW9h5569yB812G6qlkQ7PH
	 hkwEYc4yxvJgtLfIBwSELXUeZhlLfSXjqferwvu6kmlLPyniv2SI6rq87SYJjcoEcBpGL
	 Qtzg9h5ncDBnm4Mvx+H/oPdKb+A3xaZ/Uy4kR4S6pJcXFxvrdlk+BtbNmxjPius5x8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I3GJPV2DHNp3ky3wZW9vV3FEZiN/tK0itP4DFAjD/zs=;
	b=WqzL12lWThzFsSE1AfOZPrMhQXlFA2Ymo2dXme76qewlU9vAyP7cMQL1LsMmAMphTmXN
	 vNA6NlRtWpVT4EvyHzflIaEMAO6YiNq/W6SzwzVSz3dupnwTyDS5LIfXeltr0HGk1ATE/
	 FwbQQDb7ECKy29Sp97J+cfjB2EzYVPs2pafFRfQUUiWQU27eDRyDWynx1nkICac+VMsL/
	 Gdv2vHhMd8IeJYEyf+URa+Zu2lcduqK2pLVUz9NVwGMASOVcGzAzqPZw9ujsoviv0soPY
	 B5XUiZLBaW4AeHLxSLHgAanqLceso1EpGpaUFqraEZQi9QcNebkKVZeE0mspYN1CDuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JRJyzGj6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C885E606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C885E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JRJyzGj6
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55be673e029so197881cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:23:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794763407; cv=none;
        d=google.com; s=arc-20260327;
        b=gwDcwfATD7qhJuc2igp0DKmfAhn9z6Iil4FQXXYhY4h4kR2nd9v7u286ztgsRatWv3
         r/gS99FwBZnEYQBZf/bcOBA8rGZkmwYPKP/3NjCzVKwlLDeyKd6gfbkMReh7h+dR+TBE
         6lIFRAcgRM1EFUyH/BaIsM7IDF9A+cpEjWmA5zYn3PblvHwdP7Cety8YoN5AuWgtZVu0
         1ipUhRzr1meDNAdUKiponHu2kEeXiQ/j7ZQUL0zC3JD/1Uc9/KVbzOKjpxQLD/6FAzIB
         XPON9L78ioXrQmmCvyohIVRmIaglmCfXt0QVYQ9hPfXc3gksVErJ8f+WZ8n9f+DVcWHi
         cDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I3GJPV2DHNp3ky3wZW9vV3FEZiN/tK0itP4DFAjD/zs=;
        fh=8i98G+orvbb0Bqnju9z5Y3ywDcus/M2CuGn05MpwSLk=;
        b=aR0ZGwqP5+l/v0dxU6kfpVps4gX2a/XTd5YJreCI3VZpIIjsk/XwI/YzIJ9oQp9AO1
         UymXdr42SnTHXgnfmLGbf3++URb9AtneEHMyE12xKpfUvE0Q5ZEp7W1R3iD2j3ZV8bWY
         ZzcoEJIr33in/7+T0XEGkOvDEkiYSfczCvW4AFqAvxNSlWtBhpaea8CaEKgVPZyFV5WZ
         J1M0yfeT2c/NPCvmYx3xIwKcj8d8WelI1fDT/eMIFNhHV3CK36toOCF8XDK5i1/jnurw
         1dB53yHL/UeJwjPgyTc9RY97o0twuADBhX99lw2OxZM34A66njs3HTkOm9FLJZuFrFcF
         xcRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794763407; x=1795368207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I3GJPV2DHNp3ky3wZW9vV3FEZiN/tK0itP4DFAjD/zs=;
        b=JRJyzGj68632hJplsVF2tEzCUeB/Vf8X/HpM4Y1Mu0x9QQWCKqYK78QXn8WRlAAp99
         NSSYLD7EzSgbeztDJnF7pK+Dly7A8B8TKCo75cuasa4k/wpLMJ829nU0SQ4pw8etXQvy
         Sl7QD2zOjJKHc/YN08A7f2W+7BlcaPYKvJz8rNMVH0vSklOijmF1+THvXvH70egvuq3I
         TaNJ0c06GSlmSfRNQp3FhczibwCDR15VsZzRaafxrh0enRAxC5TFpwRDLPndB9KHjzSc
         tu34YOM33QyVpjZDyCTdmWUjxfbXE5xTJX37GlTtCQtRAiwtgU0uc82EX4sl3ATkTpb0
         bhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794763407; x=1795368207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3GJPV2DHNp3ky3wZW9vV3FEZiN/tK0itP4DFAjD/zs=;
        b=2VYZvGYgGSSYmgnbcoAgnHprKwyLUilXioV3oH3Lz6SM2+mGsjraLumfzyVoPDCZ/a
         PS+OOLVByritOLUHoavlNcRGYyyKvkPJPFX8tx85AC0lK7oOhIjSNZZ9amebUEr94fkp
         ODiCS4dhqWMWEDFzHXZtwdzKzEdCilElVcNMxXhB7FkGT1myvBBUYNqaWyu7Vg2OHs16
         yew79TQZgQbDxxTmuWbwj8jsLAVcZTN39G1/VHBfY7qrsZrSHd+DfrZdnJ8+dJagUid3
         ODK5lyvhmGy5GiIeZOWhpkdxzoUabHqIDM9MfYBfTAeqUomI1Byf4GzUKfLKTKLwqFEl
         BtnQ==
X-Forwarded-Encrypted: i=1; AL+hErF98iF1gjjFOLfQ2+6UrUEb8OKo4O6lRtlFtKHsXCAm2fIJ5CSe3XqYpKd6pX05jA/aseEsOGXDNYwc9so=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qO12ZKUn2mSTToHIGWM4RyBg8cHdoLH71aCXuzymrq2NMNsOc
	XluvaDCnwZUAUKpjAJGP4LGebR0BYXKzdOP1oC62OOpK5Wn+dHW9Q/f9WNs6BU62VEkd1ufh+Zi
	OwklpLVfEHkKPtq4+fBI4HIjo2DlJDpIFn/svKQfcFSEEPZrpkBwpi97XyXWwaDKA
X-Gm-Gg: AYBFou19rfHakdPWs622EwCSuIdWioA7eMnjkbn3XbjhoatUngneo812Qhj9wo5S2Gu
	0QafoxpmBHW63QRghBTV1vvRvKHyp47lW7z9WR0/L4gLbUNB6uOTXoBd8D4vfpKsRndlcBSDzJ9
	yQB6L0WxdKCeGOhPuLXQuFsnbC5jWyal7NR6I7ynQhiMCklY7qy3qj6yWGp4VlbFJOQ5ZJf+lc1
	sWAxLzis+D8ocWwFsa+h4oTpk+W1BNddGSCvRXCOzRVAxwGTLiVgUS++OekBgBn8Pc25jaHhv72
	5NPKs6JfZ3yggQ20r56BDebStEhN2DuBU7zvrhSF/PCy0zKF9yAMauBDEHypdZNEAB1o65rJl8/
	BQUebaMh+RKP5BJ1QSkDNXWPfkbGbRUdcHpg0DdCIqJ8XVLrQODkhmmKwSu8196Zr6HDmDskSF5
	FsT+LmY7zXMIEUJHpdnM76AW7T+g==
X-Received: by 2002:a05:622a:c05:b0:545:7949:80a5 with SMTP id
 d75a77b69052e-55c6934cf84mr23298521cf.12.1794763405925; Sun, 15 Nov 2026
 09:23:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-4-vamshigajjela@google.com> <au4HBJBd7AD6WCeY@monoceros>
In-Reply-To: <au4HBJBd7AD6WCeY@monoceros>
From: VAMSHI GAJJELA <vamshigajjela@google.com>
Date: Sun, 15 Nov 2026 22:53:14 +0530
X-Gm-Features: AclHuK_5V_UVndhWj1-YMtxVTtoYTR1vzesn2C0sHyenO3AfXcdkS_s7RvC5uV4
Message-ID: <CAMTSyjoGH-vdL8U-ggQEF5FmgDkWvHNKxceauSM6sW_2_mWDZw@mail.gmail.com>
Subject: Re: [PATCH 3/3] spmi: Add SmartDV SPMI controller driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:28=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Tue, Nov 03, 2026 at 09:56:07AM +0530, vamshi gajjela wrote:
> > +#include <linux/mod_devicetable.h>
> > [...]
> > +#include <linux/platform_device.h>
>
> Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
> good enough to provide of_device_id already. If you insist on full iwyu,
> please use <linux/device-id/of.h> instead.
>
> > [...]
> > +static const struct of_device_id smartdv_spmi_of_match[] =3D {
> > +     { .compatible =3D "smartdv,spmi" },
> > +     {}
>
> { } please

Will drop <linux/mod_devicetable.h> and update the sentinel to { } in v2.

Thanks,
Vamshi Gajjela.
