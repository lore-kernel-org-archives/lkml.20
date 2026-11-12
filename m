Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794524471;
	b=ZZjbKkxFvX8Tr0COjsesbNmU3gionh3h7WbZlh8MRrk3n8Ngyya6bXoF4JxOUda73Z0Y
	 OlcB70q+04s20jUz3AidaiHqbb+PVrof7Ou6gT+CHa5x+GTeufYOdm8eXiPpUSwcGtt6y
	 sperLMdvU1TE9o/AZtowZOUq5+Rh7V5rPmTqUTMouw/fHncfKIoyyUkB9JiCBLGoi4rMW
	 aPVXZIqkl+IrJyhFPdHmdTpl6gocgm+GpcxD7zdvwjZyvAdc7WoNYUqjqsE6co5o4exBp
	 r/D7JO0JEUXwnVRu1xhU3sYs0Kz7UA9ecz2pLUtRcnHcnUb8A9dfvsztokDadTDl6iQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vKFbfdMvXjvxtZz44CJBuXtclzOrS0keJtHN0viUnbU=;
	b=CxSiyJZLXd/hkIePHRd8DGL05+dhn+/jAXAxXFyLsZUf8MJq8P4ioVjb25dCBXknYV+Z
	 8UUB1HW65LeIQZsj66++zCtIoDaZqbSU/NEsLizBv+3eaoUa5fj+GZLHQTnnATyWGQQUb
	 heKbfSz8OCiWComa+8cmuVqA0tOCQUIg6BXVPIJCJFStd1xF6XhYSzzy+pY6h6aOuvDoI
	 UM4IiqhFuJWN7TnU04I3w0M51lho/zitMYezyBhiACT+XDLzhpIjqHGSGMW+WIcmfq4pD
	 +bqbBkbI3eYsIRPf1eyxq6f8YIhWxgW361cx7T+lW1CvJ9+vrYTwwHxFMnTEFvAYsKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=CXlT56pF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CA0606B176
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5CA0606B176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=CXlT56pF
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67c2c2ac1c3so424407d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:01:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524470; cv=none;
        d=google.com; s=arc-20260327;
        b=TmIsxNixpd8w1jz03LB3ii3pPamZNy++NigZKm08KAPR7TlOW1nWG2l4f2LPCEQc+h
         8tTIfweSFIU60PoAtT0pdHdeXlh5Ih+ZASsIq81ohPf5cB8erWFPiA8szoHC+3dL+EOT
         MZILe+gf9oGoW4BNWHntogj5cKt3YRYOIardC0AmF5rFIYKuTBXrKrl5A5og+yKJEO1/
         KDlT5S7h4QAwq3kImpQHZgqzXMG/uT3eyxbKcqUBfw3qTVBObRVuj3k1UAkS54pCNwY4
         /GmYEhobPA9zXXFEjsaKzjeBnz61FaTKmSSgYw7dCMACr80HYMR7tvbN3yeo5FMi2n+3
         U1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vKFbfdMvXjvxtZz44CJBuXtclzOrS0keJtHN0viUnbU=;
        fh=2fgyKA2S7b/5C0SMXqSbLfvBcEWq+5JRYYjuKmCb3d0=;
        b=Xb/tcVv2szZPJWfyYcBRnp0yUyccjS/TQxw/OTD+bCM8rHAIYz4uCJS346D4C5WnAd
         538hr6zdTYPY0yW47wEuoBFWPobIDKQoXBAaIhISFs1ltzPWhQCjAZJQzfAmHWPyxoJS
         dQ5qSRl3OetSPU33nvOP5Z0TE0PeWW7rPaUc0HHJzt3YMjdVs/RkkpaRkE78ZDt7xRnK
         hhD/SpLDlfvnCGK55kBcT2QeCk7Yt/GFAl9OUrIlSb+QyVwSSIoMcYmGRFqWZkJsQNN4
         mp5h2wU8Ydof61KDxxMirkMQ/2kWwylPx/unliF47CFvxkAU4Jm0CmC3MjHq6o0unZTW
         DrdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794524470; x=1795129270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vKFbfdMvXjvxtZz44CJBuXtclzOrS0keJtHN0viUnbU=;
        b=CXlT56pFul1lv1YPKO8zZAVXf8GTj+cVomOhtG7fVNxd1Jizl65XkXtdLpXxhxYkfK
         MG5qJRszhp4MR5CBfSPPc3BXoOxA2LGLqbkxcpi3ENrSA6WnFNDe8b+q+gKzjladg5tP
         PG3HzYXcvOZDkQHF9bTQRJL1loqbWULjtrhJO5HKRR8Z3GLoJ7CLuW4n11zrTmHyGw41
         kahbPkzAa7mK9d4QhaOd9CrBPzwFxXJDHISZBKi6iTpqyGesDYyLxfNNm48K9K4LuOVp
         9Sq9yEzO66xQvYpCpcyrxaSXwGYjasHUy9jgXCFFw+2b9l15TM+VPB70lVoYZfL2CuhS
         1YSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524470; x=1795129270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vKFbfdMvXjvxtZz44CJBuXtclzOrS0keJtHN0viUnbU=;
        b=wUjPXdeF28oB5Kf7km1CTZz9AWSZ4mmfvwbShbeVLxhaeV1/u3YTtjNk0l7nhzTrj/
         gjiKW5865yxigzB7Zwru9cCb8cNwfSNEFKEUrETpcfl5L0ryD8Najup+oAj8W3tMKjoV
         fhmmHF2R3WnvUI3zz10sxtndc/Tx600OyQBPwtFTVVooOdswC+aNw3rIJH9kvwALu5Lc
         SHLJ0OT6A5zS69zFpMac/VnbwsVMw85fI6lcGYPDYCsbyH0+6eHlQmuTWm0XMFCYtRF+
         BrE72mVRmFI1h4gpSBwg7ZBmIen1NHo2ks2/OGmW6h7lVN4NEeir0Hm3eSpfrQ0ydN4K
         fEHw==
X-Forwarded-Encrypted: i=1; AL+hErHIqsfu/w1kiM1+Y7T9Ix3OYeNW7W7wEYoonK7dIoaGln+BmM6s2QbcjOjfOIwmZ+7IdU30HQn1ZLacyf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9afVulKRDgGvXniA50o3yQ/PqAarFLwARmpg4vN0eNqNE3/TIH
	qOowAbYEII52o9GZ4b9pzgX45UFAeaOUfWTbYyNoECr+OhbPsZtKpEcYx8ctgYZI97dPyEuM2Yc
	DRqjHZCjdhVg46ozgfX3l78NkCJDHMmI=
X-Gm-Gg: AYBFou1K3FN9NeO/4k+Odr69Y3ZR9OQUKozJPSXj89WxCf8vAe3t7PBS6Cz4vNmTNdQ
	Co5TRAZ5advjgg7NJ8zX7SJS9v9oUjdVjxGcOEX3fIxAqLXqX1miK6Q+0kr0EqG1Z6lhGxBeMDt
	uEBBy6Mmq1SmqDoSB10lTTUO02I4MRBH3huYPviN7O3F12zpejEos8nXgKOYP+8FdM+e5RAdLM9
	cTOn9hvhkhkYYlmGDgz1Egd3y8iVxNo8syTt14gZIu/9SftgcHsMsCE1IkPcz71RCAZJfZ5D82H
	rVwhCaQszq+Tg7UnT1FxZPpzRxX3YtH8AQ4YyyD+qoLqXtFXZflv+XAJJIIkOzWsr3yeZWWGeF0
	ocPrTRLE70i/oarPhkIudyezFqa6UUbaqdbXSrTRWv1zbHkwzHO5mPyDrSDwYCPJZF/fgzCc=
X-Received: by 2002:a05:690e:1182:b0:67c:1eb5:48d0 with SMTP id
 956f58d0204a3-67d895a730emr587688d50.21.1794524470098; Thu, 12 Nov 2026
 15:01:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
 <20261111-gx-formatter-use-spinlock-v2-2-763241aeca52@baylibre.com>
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-2-763241aeca52@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 13 Nov 2026 00:00:59 +0100
X-Gm-Features: AclHuK_m4BWciMvBzZXogG5H22e1sIVJEt1HWBlLSLAAMEV4Eu9tlsQViR8cFLo
Message-ID: <CAFBinCB7Okxzq0cjAdpynmJb-oOuiYkGaf6w--091_nU0OJFKQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: meson: gx-formatter: add lockdep_assert_held check
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:12=E2=80=AFAM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> The documentation of 'struct gx_formatter_ops' states that
> formatter's callbacks for enable/disable/prepare are called with the
> spinlock held. Validate this by adding 'lockdep_assert_held()' in
> 'gx_formatter_enable'/'gx_formatter_disable'.
>
> Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
