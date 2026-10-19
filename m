Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA6E486B81
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396862; cv=none; b=FfczYP1GwMgi3SOjd/yFZeFYhyzyut6eutd5O6DA1O3iuPCygGlw9QXKXfVFvg0CIc59SjyezR9qjEMotrhCpUprHs0TKGlhakqUyqfTz5hzqPmnkzffWgmkQSrpHJJoQZvXQNDP7eaD3/gHt9FsvCkLmdMvYZLBkgRn7QATlCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396862; c=relaxed/simple;
	bh=v1DdUPCVUmOFI/TIUBIHp6cItFNA8BFk10P0B9BsNgo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=iGAmjJGydspEubuDBQjo8r924WKoZGwoBuQAlj4oIkbn98anFOcpacdXbR4lVqBH6JuAf9Xiihgh1zbo5sb/5OA0rFU055hSGdG6vl8UsG2vk0rKuUlR90SSpLYiCjxENOquv6BykxSnBbSRuonX5B5oyg2xmuEWfZToEZW9eh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7MicdCk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7MicdCk"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso293407766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792396859; x=1793001659; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J19aiaw61ESfpZhpHesVzTPqjjzjeVttorDaRwN+W08=;
        b=X7MicdCki6f2c9ThLW8NGIGjLMZyt1hmOsz+MwWY3oV8E5bNM3xdVb43/FVHywz55I
         PHf5gnnvFh4SxFejO3czQZ0tW0WxmVqIk+p5JED9+QxiNRrs1JY6towTH0nvikLA1mIG
         tspdAOUmriusjIxOaOjU+UOAtsho05nD3Y0JmyjPI7v7YlNc0W12kQUo/q6QsLhuEs2+
         qHIgTvNLXsGgncKwqEMrO5f5XLhPhxl1a//DUzenXQoOEQVaTKjxjBDTPAWlL3t/R0rS
         Yxt3ERFgW4QARYQUjfbMGgo7DSsOhxju0fbaqqQffUPR8zPxssw8r0FbM3u2sso6Nbe8
         8sPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396859; x=1793001659;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J19aiaw61ESfpZhpHesVzTPqjjzjeVttorDaRwN+W08=;
        b=Jex9xwEvO4yC2fE5zDV0o0en+4Ar6GLD7AboLk4oeMDisRYWSxbPaknbkkjrbw0tWy
         urNXLfs67/m+7uCZsPlZbviFK0Y8L16PeUEC0ZTqMUHEFtwhjL2PKGebZ9Wy2FzzQ1yF
         dl/OkZVFbvFCt30kXndkeOA3sdWtqZkGLT6cJ5uLMcCvjAMSSxOXJx9/Is0+GmvBll8v
         C4McruMR9AkY1Xwf55wAPOdpu83swwUM/6AzzBllJOcm261SqR3CLeL1kLCdDX0kGVqB
         0ft+EmKVJrvwBwWex7Jidz4mnvWLbpspQWNJxF+3JtEb3rGONxg9wGnjf3afQfLV1Wr5
         Ed2w==
X-Gm-Message-State: AFq9FYIBqRjMDqz+z3+6jeFtKL+teVC1BgMxfCkvPe1VEBkB8jGEzdmB
	MPSFJ1kGm5t5U5YW/0qX+ACJZzJ30PDaozHL4xQLxudvzKzwQqmzynVLj+KHsIt7
X-Gm-Gg: AYBFou18a3z3ucXpzRv0R6AGns1sS0++AI5RdTacxGYIWThh35UcgDmdI5+VGITS/it
	AYr4ig7oZEXQw7HzBBiD5FNzRZtbEJpceuaYikgKw+0VvQHaptgd52ZZgckLR8h4+PRqhEc1URM
	5WMCi3Q4jvmmgNQP+ZKo+rVz7hgbJdyKRrhLZY7LDmh6qwJTmdUL47h+OYuJ7chU5DZKnGmVYbw
	QWgZa5+akIGZNX/VpkQoSONqbQ8BGDipLo+fIGf/abyzqyc5on3IYW1VL3dN3YbrHVhIECMg34Q
	K1oNGUJYwwKCs1F9sF2VE4GGtMqhXonVF2AiAw4cLYMGeZVP19FWH3X3RRS1CFRTQVTsvBC6/WW
	pRg6zmAE0Pp47PA8YnnqhQKt8dsQNRbpqQvHMMrp0NqNF0DO2Xi1mC3x2obRhkTM+MQz2Iqu+F9
	ApXd2eOCDjBFv+vdQGVIke0pB6XMH+xGJBYk2aK1kY7ESbmqtT5nRkIZPWt5lapaRNYuDZsHF6J
	T0=
X-Received: by 2002:a17:907:9623:b0:c26:2eee:ffc7 with SMTP id a640c23a62f3a-c419f709628mr476872766b.35.1792396858464;
        Mon, 19 Oct 2026 01:00:58 -0700 (PDT)
Received: from smtpclient.apple ([62.171.228.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091fab836sm331499066b.83.2026.10.19.01.00.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:00:57 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH] Revert "Input: matrix_keypad - force switch rows to input
 mode"
From: Alexander Kochetkov <al.kochet@gmail.com>
In-Reply-To: <20261002100935.449473-1-al.kochet@gmail.com>
Date: Mon, 19 Oct 2026 11:00:43 +0300
Cc: linux-kernel@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Siarhei Volkau <lis8215@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <36834AAE-F2DD-4974-A5A9-60B30F29DCF4@gmail.com>
References: <20261002100935.449473-1-al.kochet@gmail.com>
To: linux-input@vger.kernel.org
X-Mailer: Apple Mail (2.3864.700.51.1.3)

Hi Dmitry,

Gentle ping. This is a regression fix for matrix_keypad with Acked-by
from Siarhei (author of the reverted commit) and Paul (Ingenic
maintainer); it still applies to your next branch. Is there anything
else you need from me?

Thanks,
Alexander

> 2 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3., =D0=B2 13:09, Alexander =
Kochetkov <al.kochet@gmail.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB=
(=D0=B0):
>=20
> This reverts commit 01c84b03d80aab9f04c4e3e1f9085f4202ff7c29.
>=20
> The commit makes every scan call gpiod_direction_input() on the row
> GPIOs. On pin controllers where GPIO input and interrupt are separate
> pinmux functions this switches the row pins out of interrupt mode, and
> enable_row_irqs() does not switch them back: it only unmasks the
> interrupts. Row interrupts then never arrive and the keypad stops
> working. Seen with a matrix keypad on an Allwinner A64 board (PINE
> A64-LTS); it works again with the commit reverted.
>=20
> The workaround is not needed on Ingenic either: the author of the
> reverted commit re-tested all available JZ47xx SoCs and they all =
report
> the live pin state in interrupt mode, see the thread in Link.
>=20
> Fixes: 01c84b03d80a ("Input: matrix_keypad - force switch rows to =
input mode")
> Link: =
https://lore.kernel.org/all/4130C026-2A83-408B-836A-ECA044491C47@gmail.com=
/
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>
> ---
> The same three-line removal has been in use on Allwinner A64 hardware =
on
> top of v6.12.33; this version is rebased onto v7.3-rc5 and =
build-tested
> (arm64, CONFIG_KEYBOARD_MATRIX=3Dm).
>=20
> Siarhei, Paul: you both agreed to the revert in the thread above, =
please
> reply with your Acked-by/Tested-by if you would like it recorded.
>=20
> drivers/input/keyboard/matrix_keypad.c | 3 ---
> 1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/input/keyboard/matrix_keypad.c =
b/drivers/input/keyboard/matrix_keypad.c
> index 8863b741d1a3..cda2888b2e56 100644
> --- a/drivers/input/keyboard/matrix_keypad.c
> +++ b/drivers/input/keyboard/matrix_keypad.c
> @@ -134,9 +134,6 @@ static void matrix_keypad_scan(struct work_struct =
*work)
>=20
> 	memset(new_state, 0, sizeof(new_state));
>=20
> -	for (row =3D 0; row < keypad->num_row_gpios; row++)
> -		gpiod_direction_input(keypad->row_gpios[row]);
> -
> 	/* assert each column and read the row status out */
> 	for (col =3D 0; col < keypad->num_col_gpios; col++) {
>=20
>=20
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> --=20
> 2.43.0
>=20

