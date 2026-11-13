Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558188;
	b=MEcmWnKAAOCipYegeiNQNIAe2ZajVSMJFMsE+zP0EkaW/ITHc5ljkbwpwl4sMdlUELig
	 Hh10UfuM2/4y5Zsd/7d2l2J1tOILVJIpRlm+cbQT8zwPpngZatgPXcTFN+BPuDyeIykuy
	 g/iOF9X5lYQBqYmcurAn5y+kIaPhHt+DZXDM1Rg6UAjlyFIBNUajXvJpPct3kFzqUgYEG
	 camdcxKxeEGomj59hUZAYluMBKLyfcWwb29TQM9A0zfkR9Ky2GWaJ59VgoZLEotcTTnHv
	 yRKmKaiW80ZnH4wIGaPPmRSTnBflE0G/h3j+tutS3qKMu9EavZ8AdC+Ywx7yPnM7f9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CHg5JHziHE4Jpt9n0k93J782O7ifEZ9yYJVMuZq1mrQ=;
	b=rCPNBZJwU+LKNY0zsqzaKV2cLC9vFvYK3vL+S+C6a/4bXStih8ZU4CCdppxEg8m3N6mr
	 B5ISEcsYJWBhuK/D4lbGgjwdjKOHPVaG8FUW+Fg/y8Ezxtme06WC9o+7ZG37i1Fp+8Apn
	 NnuZ6qBzEj1JTgCeoNvo2xFLiJueOzUXsX/Z2eYtHy5RJf8M35Bv9uruL3H1wuiVZQ+ka
	 rUvQBNs5uKdbGcMOi+csm6JPIvb+frniBtGflaXLa96YxhyjhSqC3u2Ne4GAXC8rfd15p
	 1OSZmhZ2FXnuJJuy+WJsWhLLJpf3uZF67lECYW6qqDwxbDo/za7JKzSLByacD108xLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0QYKRkeZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F1E606A339
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F1E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0QYKRkeZ
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b0cf2c0785so7431167b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:23:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558187; cv=none;
        d=google.com; s=arc-20260327;
        b=RrZVnyJtwf/C3gjtx/lqbFtCTlj0pJSW/nzs2jPlf6j4FOFcKYrvxdU9/k9u/Nm5IL
         0Ko5ZiDChcav7OvR2vf39gYP6uoP6V3zuPVX31w1eY53aAS1YnI6CpU7Nf3kACACIl8x
         STbhIIZdNREuJUuk8NO46wkaDvkLUxJFWTboR/7YTWMqEtJJZsKFTxejt573vXtGsSve
         052vUjkNVo8PELU9cg3DEDEAOOyONvLPPOq2pxFdjVjio4SVHvXCPpX9MbyQIVZSpXtW
         GcZHMIC4kYv7z9m/JHRPOuUUvWMq4oniSzVgZaM9fuHkKqKcsz0ZL5a/PGOOSfCosyA1
         DVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CHg5JHziHE4Jpt9n0k93J782O7ifEZ9yYJVMuZq1mrQ=;
        fh=ANk6B2zegcYlaRbey3xzmUGvMsSo1h1OnJ/DlBXIruk=;
        b=bf9067SnnwSXlsdtrhAsS1j3tO/jl3Q7qPhNBBMtOandBzsP0XVMGDn09fBmnWxCds
         vFEmbjWFF7rLsLfP3fi5Bk+0l295OZmTwwYw75rNBJnCMCKtbbZi0jjyVB78S+MbgdXC
         YlB2EgIZKwyICoWGQHN60mF6CF0XSI4FzmtOnwcxGPcfmqjbaHLmnAuzxzJHDW1eYctF
         E/pWpcgr9Db0M1FIhvgWyxtUYrPKWnhYgLfQVeJHpk/UCrhv0awAiK6pcVqIj5aMsE79
         9PhTTGZUhwRlzl8ixmz810tg2Wl9r3Z4q+z5JYx43Q8L5S68K/Q3Y93RkP7bEhHEfKXr
         fdwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558187; x=1795162987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CHg5JHziHE4Jpt9n0k93J782O7ifEZ9yYJVMuZq1mrQ=;
        b=0QYKRkeZGgCKAK5bk2o2chwJMGsQY7GzXb0fwyB+14vTr1jkqNeIYyu33eNOeaTSmy
         mhaaKT2ATnUTxHED0nT6gh+qOHKvLSjBN5uf0ZUj7HFsdBP3/EF7zNnJJnQt1n3+Usc2
         c7smb34IRq3UuOGo9g9yZkOTsgTxKb+XNnH3xRQpt5Pgdx1uKXlTpI83L9zWI1r9ahts
         8+edQVC3Vdhuj+dlGndhOpsK0JqIgFiK25XZ4B5beeKdfVO+DuXrOlNZoMEtrBrAnYEk
         t1EdDeOQ5NLNyVdW3qZ/WWxYxVI7uGJz2WdJLbMFrgP0mNu0jInbTj5Cu9UoM+83Z7QK
         +fEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558187; x=1795162987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHg5JHziHE4Jpt9n0k93J782O7ifEZ9yYJVMuZq1mrQ=;
        b=0AwQRBpri+o33Bn6t+PSdUAx2fuLStIbmOm5/8yUUyfeyJ7kBv4O9JErf6HTcwLvXC
         vKGsx096SahC+ssq2y43VcwyG7Q+bbxfQWOO/36jERxsKa/A8pzbHRpup8ZmA0SRXc12
         FNAS7YaOqcNb2FXj8u6Kw6R06nGwiw4P7ONWxOYnVlbEqj7VwsD6bo91PXvTFBe/uyvx
         KhFBGhmW2VbxWL7z/xi2zy0URFdtEzBZV2HqhGTYMVfS+h0iDhS8n0CuPIt8Znodv1bX
         JCvGFcyLZioSBxkmThntFKMVhwMN6PdzIvM8L/58rxxH2W28ACPkbvNSuWBeeHCHa0Wq
         IU/w==
X-Forwarded-Encrypted: i=1; AL+hErE/zikbgWMr0dnpauWojeNB6Ocl4jqIERlaCWuGilPzu/SKu6dgnbtSltBm3dRfQwdV9Lfl4so68epe+vk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eS3N8k0h+3hV3V42o5IejVUyEG/l0ub2ES3HfNvvVQLBm1Bng
	/2GXlS0Rbm06jJKZr3Ugq3/hxFYMNmaMUftGdLEzU7O9SpAE2bpONaMm1TIakStaQeI3EeaXRDD
	tjpsT4bgrE+DPwa9T0E1zJFjFYKjwHuw=
X-Gm-Gg: AYBFou3ghkVri3I31ObT2b3XF1DEPLiKFNWd2Tp/T9iwOwZmw4EGkXXgOrl8hE5zMoV
	u8ZlbyYZQTdrfCQ6k5Lu1IRWccZTcD+g31hf6mcd4Wyw0qkcJiu7wV6AKuSDeoNX+EoxdP5HLRL
	wE9chcNc7OYki/JP0eEh8Utp7AhSRQifmHGHuISmSXYDJ4pK75vLvWVNWaBLbaHmPfu6Tp4JEfX
	8AzUrOwNTj5fDLLxUHSTBArd2CIHBAX9QzgjVBzIk8wG5IbPnaeiP4G13q/RmOrkLn7m6A3C4IH
	S++clFG7vlmz1lULnf7HhyrL7ovttqjgZaOsOv7pjRzH7CdVHOT85AJELVOPL8BsQVsITF6nLh4
	swZ4noQm/EMnhCHznUMPw1nUJYxGNGTX+goF1atPLuxAZ7IkorXHlh6jgKBvnpMctHSv22BWB+b
	h9DCklikBn0R10vUYEjP5nSOD/+sQf3ZzEsY0RlnWkAmN7yvIXuOLZgpdeKW8V77+TNv9UtI9dT
	hJ1JikXVDkHd2eGYTMHfPbbRyrG6ERlDLyobjEJH0Jt4CBaGDRGaZ/RfBMQUA==
X-Received: by 2002:a05:690c:a923:10b0:8b3:2c71:b338 with SMTP id
 00721157ae682-8b4aa33e3b6mr8947087b3.82.1794558187196; Fri, 13 Nov 2026
 00:23:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112164642.38692-1-hmjm081106@gmail.com>
In-Reply-To: <20261112164642.38692-1-hmjm081106@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 10:22:30 +0200
X-Gm-Features: AclHuK9gEreXQTMuEgxDO8HwoqRpAAdAWE2GTFJcD6vpcMJ_zpISOrJRwj1DDhI
Message-ID: <CAHp75Vczc7pg5SaBw++eTbca6jo8nWjTBfOaEmmF6Q4Lnd1j+Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Remove unneeded return statements
To: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 6:47=E2=80=AFPM Hezekiah Mogere Joseph Mayaka
<hmjm081106@gmail.com> wrote:
>
> Remove the bare return statements at the end of void functions
> throughout the driver, along with the blank lines before them. They
> have no effect and checkpatch.pl warns about them:
>
>   WARNING: void function return statements are not generally useful

Reviewed-by: Andy Shevchenko <andy@kernel.org>

Not that this is a really required patch for the current state of the
driver as a whole, but let's process it to avoid new patches like this
again and again.


--=20
With Best Regards,
Andy Shevchenko
