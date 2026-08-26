Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F538446073
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756291; cv=none; b=l4K0AmbAS4Z7MUGBL7w3h510hjgb+6tSVVtO6oeDbs8XrO2sMI49Hml5e+258B9tsanUOB9RwrtSzIucQkvNCz8BjjuuFMXHhJ3ef43MF8/S3CgL47AbuliHBTQxtKwN4Dr7wtw5vnJEcFfsnVWrjtqeQFkHtmW1FAz9qVH4Zn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756291; c=relaxed/simple;
	bh=YvujksyLFDhmPQJuueDPzzMP/JE9fimvOtcAO4bvLZU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfqAgmqjh+JLmMeRtBwCqNoyzixTYQyvldDswA8d01OWF1bmqL6OqdzXXTphnnV2lrU7HHyLuSdMXM96Be1is+WRk1U2bPlkk5ELt4vRQRyEuPPDN5+TZEdysFjwxDgtleMk9GvvI1pv0ufD5eT6hbO4vIJxA+qCoH6tLPCGUA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUqdbNvZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUqdbNvZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D7B1F000E9
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787756290;
	bh=YvujksyLFDhmPQJuueDPzzMP/JE9fimvOtcAO4bvLZU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=RUqdbNvZSuWZezsEwc2FRMAC80gbuiOrO0thk1oS3UG015LUJ/UnqR591EohEUPyU
	 xOAhXABHctlRziAcUC0LE9RYCyZxxt7s6wRpzNlNcKKxX98Q9OxdtPI3CVCyHjOHps
	 L8rXPCgFQhLIqdnKn6QTgAwvP2OuzjURwQGyLzH0mbkqt3/zbMh107qENU77OlavjS
	 b82KQ+WNr49Yt84SSFXjyGTBidYmInjjkOwwZTUTaFDn0X+FDz9gvanBFjgcmYEllM
	 OcHg+rw2f4+IOzT5aVeE7SOyFByCLQuxEOrJOduhYt1PkBlZRroLjYANjmgLjqzpUb
	 0smNflUQs9wZw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so678650e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:58:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqjrUOur34VaX5/wGe25fDjGA0NSpFrq7pan+eFFD4yazISfK8ec4w0JXYhDbwijatwHpkLuwVhp18MDDo=@vger.kernel.org
X-Gm-Message-State: AFuF++nUmjdUrbOZ4IUEKjHL8E0wl7qUWNdW1O5a3RZgpSYp4VBSMRwq
	3KPMaad3A/9QEzMtD5B9iZ3IvCkztioEW3wW2kKLEnyKqe6gXfIE0EexvnkFfzDTwV4FzUJY+ka
	XGN0H9VH8T7Ge4ta34J414E98jeE3kpxKKGFKszhXcA==
X-Received: by 2002:a05:6512:318c:b0:5b0:197b:9827 with SMTP id
 2adb3069b0e04-5b4a9003109mr2324523e87.3.1787756288681; Wed, 26 Aug 2026
 07:58:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 09:58:06 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 09:58:06 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260815150946.12142-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815150946.12142-3-thorsten.blum@linux.dev>
Date: Wed, 26 Aug 2026 09:58:06 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mdbk0tH=-hG=MXwFpY9ARzuAuMmvi7fhTKEPzmpuw5_AQ@mail.gmail.com>
X-Gm-Features: AcwNN1Wnew0yhSJaB7OhGm28Gy9RvMow8DWUWA6z3mUd8NRlAST-l5JlU_tfAYU
Message-ID: <CAMRc=Mdbk0tH=-hG=MXwFpY9ARzuAuMmvi7fhTKEPzmpuw5_AQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: qce - simplify control flow in register functions
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"

On Sat, 15 Aug 2026 17:09:47 +0200, Thorsten Blum
<thorsten.blum@linux.dev> said:
> Remove the goto statements and handle errors directly to simplify the
> control flow in qce_aead_register(), qce_ahash_register(), and
> qce_skcipher_register().
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
