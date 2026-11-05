Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793877896;
	b=NMKBLExJHecqUJHezBTxE9xXcS2xgoghUM7pSiV/iulYoNqDgBlr+xwmfeoMUicv0yrM
	 MJSrbzg1AEWkpHRy1ho2rGXd5ocs2WBmpVQ9pO9gOHtqTfWHFXTYrp3p0hO7dkK1IOqZV
	 pix0SLjI6J3LkMVfdPmMbfIcaVyDaEGOqp11l4WN97QPfpa6F817eVDkK541v0wcBkpWe
	 FaVjWJ6XLf0UtmFwa/G+yUQnbOwhvP6k8ICUaLH7KpWvMV7UEwbQGRxcsK0OX9EdbimvO
	 5bDXBV0q34Z7k84eI/CyhoObAy4lbXbMC3bBueRmnxaMsgsPDZ56N+O2fYagkAEuKNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
	b=ClISKCzo/8eaV4UvHc2bpVIwPsdQoVJBqPpBpNzpSiqSpbbfmUiTnQkyTZGPx7VLxnaB
	 zEfy7I8WtJcWpCq4kZ+frcs9puS2RfKtSzFEwmisrPMliyzMk/JWhb/j/kMlGKvtktS7f
	 0o4K8UQxOPqYctDD4B8RtMwgDndpMtyqFPvvJGjXXnHhao6wV4a8+Q87mYQFvXZdNobnK
	 uKY5mpREToWy9/KvCVJBOX7FLjR02nw272RrcglhcAsM2KNdUEHZNwZYxeEaadST8Hm5G
	 QCcv8rCO6zzMxxdzPxx7ERhcTwpMITvjzHP+ImmElBqD+TxKnO0URajimXriUfMLkSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCyRuxf0;
	arc=fail smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41654606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41654606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCyRuxf0
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4ced671398so269935166b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:24:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793877895; cv=none;
        d=google.com; s=arc-20260327;
        b=SjTxwtrsqFdTbI1x6Yq2M6J89J7fvwsq03ZXVlyUylXJaMrB/W4EIEuTDpd1zkf5o2
         kjfBRgFrADVvekzug6RMm4sg/s8o/cUN9Lt2avkktd2dV6gPrngTrseo6ApL3HgQMwEt
         jQVBD8r54SB3cDalxU0Cug9PiBZjB7/zaFe/yfTaaEbTohBDEF7nug+02O6no0v1GD93
         bMvzeldQ2RhYLHOuFiHWDpnTCY4h74HP2ciNFo2o4gAsFQYDe7jLXgoGJRM7HAduxlUd
         On3VbWfu4RR2oerf+x9Bv3bUriu5aFUQ/m2LwYvmDk09VS165irnIjT/rObKliuz79gp
         UPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
        fh=SYNg6iZ2r/cBJVG9iohnyCgiYFjFIawd18cAEvywM6Q=;
        b=cTkn44izYwHMwJv39xloiHZCITfhn6KVfPBUsQ7HcD/Mqn16NTbDmJNBhLq5dK19wX
         7Pli8Y+gduD7jCXZkUvys/L4tlcS3LUQz3mCwy+ptvHD6FM7vaohaNNxikYNRWSaER42
         ahmOc5KDxv/ktgEKeKHSMcRT15o7XJLjy7HugSWnBbjFSytGEkNiFj1h48Q8efmdZJ6N
         83IKa8IUrmpNuy6FT12T6Qr2a7KOsGyUtG6z6kyOHxyFzM7pqTRDvQZd4IwDsNKgTvrM
         3G4I+ChotiKTMTLPBhkObXW0UHwACG8APL2fdmF2S13Miy1xHnEFhqJaka1/yj6vgy1g
         YQ8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793877895; x=1794482695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
        b=CCyRuxf0P6J6k8bWApFVRzmmmQ4a3nezFhlH23PgLEzGEftofIdTYht54rkMPSxqZ2
         /N6dWyeLvZ3t5ckDi74aRNo2yvUplMuzeF87p+SrRLFswIheQK11EAMfgONQoUmsEnEe
         ak3lTmUJPNYDs7n+W3y+FrnQqNLfaVlgsCS7/AoEJSXFGJS/uoo6dTu0piEUOcSwoNXy
         qSQc4qOwI5/lBCfCziXhsnKcQriiZn1/LpLXFBVGVCBa5Nm1lMvs3nCLwfOv1t+ObDwv
         66A1hJWg9khNx60mm6v/I6sK000uQTULOFdYaXulbZrAc/k9t8/TzBP4LYJIO4G33uyO
         snLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877895; x=1794482695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjqOLsC9Wph7UCiYV9mqAnewJ39Cf8CLpFtU3LV33mU=;
        b=z2/BJROErwN825SZwV40V23n04eP1M8R2/N81/ZJbXmHVBBwAAmkpn4K3GDwnaVbzn
         OvzIwCCywonBfbT70u6JfmFeus886UE0m5JjZt7c2jXO8HkNauudttdU74882pfCJEq7
         ecf1EUEEjoWEaM52ch0y7fUWUNn3P1QP75UCtqUmNgltQftsvbABI0mlOdS1ARM0NtVg
         7VJEVM/nKlrtDgWvBujTgHlYcTGAZlW45kAtoGejbhrz+ygDuNit1+lmWcdyREso91Ap
         yY4hSrU+934Y0G2ury9bgEiCLt2em1n3YU3Vk9mbzYjG7rmMusCgsXCehA8D/80rkToH
         ZQMg==
X-Forwarded-Encrypted: i=1; AKwUvBze0wYwEMXdKRnZvvwMeSjJfwLHbfjBjE3dD42dF3aTiEoumuNTjLvEuezu1Lc8+55q5nYlOcoVcogzgcA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yidJvU04bDnAO3TFGm5FpTHP1a4KDBmB944ySpak2Bpu7oCjf
	Mc21oN3C9pCBkR0a5fWy1+FscNNgidurbYs290ydEmE4uWO2Ee64YWcf8E3phd0S+vEbmTFBIGW
	IYYRljsSPvXvDtCodx/u7TvIMXhzImmQ=
X-Gm-Gg: AYBFou1i5mtQurR5JHecOlF6tcO4pkanHWB5sXjgBGbbZKEbKSqrn33zl8Nouiv2XOs
	c5vPvk0SxuothSHhN0z5zshNaZhvMIy4g3vw8vfrH8rxB8j8DamZMbk3J/OUQ9bLBLhfsEpHOXP
	070fJjG4jtlpnqq2x5rD8qkj2qrulaiuBlwDxHylg3PGOw31jrvHyVI2d/LcU6LYxOPdlljSMP4
	Q/xoCa+DX1jkpkllmVFgCaMaZp6D7686vUWYzFeo1OifGC4hhPiw7QP4nbviUCsOT2ZV5La/wMp
	0uduA21WgXmFWA2ETeePr5dRgvm2MA1afNos418Prn29FIVnJKLRGmhDiWuMSnJ94zCUg797x2/
	Wgmp9mKesfHS6ENAl25Pgv4XM5wlrOk0GRm5oh/8MT8kEvUnKPGeiUa2HdzNpUd3gVgpXzVp3aX
	y+dYHe2uwtM8SJlTZ5rPwK3aYbK1LR+ya0GYa8o5PPLHb7b9CLbYJA9iocPmw3/xO+QcLou3HbD
	Yftz2c+cxypjUgwA0nvjXUBlxLBb1JaGbgrNlKGAOp98OrO8ZJFqyuApPPa9A==
X-Received: by 2002:a17:907:6d20:b0:c46:75e7:25af with SMTP id
 a640c23a62f3a-c4ca7a0dcb0mr1704269766b.11.1793877894389; Thu, 05 Nov 2026
 03:24:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793876837.git.alx@kernel.org>
In-Reply-To: <cover.1793876837.git.alx@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Nov 2026 13:24:18 +0200
X-Gm-Features: AclHuK8KWMbqNnaK7YSgn2BAcqklpjMSStieDr0-B_LC0DeuPxzb2lhrGJOckGM
Message-ID: <CAHp75VdFH146fNhw1ysUbgCPbpv+K++kWvbyZxU=V7tDh0T88Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add strprefix() and fix a bug with it
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-hardening@vger.kernel.org, alx+linux-hardening@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andreas Schwab <schwab@linux-m68k.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:13=E2=80=AFPM Alejandro Colomar <alx@kernel.org> w=
rote:
>
> str_has_prefix() is based on sizes and lengths, which means it must
> overload the valid length 0 to mean not found.  This is a typical
> consequence of choosing to design an API around sizes and lengths, and
> vanishes when moving to pointer-based similar APIs.
>
> This patch set adds strprefix(), deprecates str_has_prefix(), and uses
> strprefix() in one place to fix a bug reported by Bartosz.
>
> We can later work on replacing the other uses of str_has_prefix(), which
> might hide similar bugs.
>
> Testing
> ~~~~~~~
>
> I've built this patch set with 'allmodconfig'.  I've not run the
> resulting kernel, though.

No, all lib/ new code should be accompanied with new (Kunit) test
cases. Update the respective lib/tests/* for that or if not yet
converted to Kunit something in lib/*test*.c

--=20
With Best Regards,
Andy Shevchenko
