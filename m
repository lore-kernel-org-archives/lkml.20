Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885287;
	b=TqF5sJ2D/sTj675xbxxcMzHg8By3yJ6Gr3ArMP9iNuthM+U1rhFIkUBUsTrOJngknaJz
	 UPVyyoXd3qgV+/6zE1IF0V53tv4XNf8N2yOQlMQhYi/XK4mW+lbnwxzjw7gqk7SYDQ8NP
	 JbkugY604nr5yKmYvt55yt+M5cAh/YPBV0uVzgbvW8BrZvGSqCASTEmsgCsWAjBlBbADE
	 13mG9Vli9U3s0bL/ISX3Ca02E2WiTv1bLsccHxuepnToj4upRLsBbk9ZH96l52IW7gS+4
	 77AGh/5O2IX0c+S5ZjRL0PJZZEY6GYz1PFRrL+6QmaVur3RwbPKPvKNklgLbLjDyIkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885287;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8ru4HSnwu1oQ4oTSKgIFmon8BQMS/0IiXPCyBWh94vo=;
	b=D45mJT7/UcUPGh2KIK9FBBCgVPdSgCH6gb99tkSA9WN1qTAvK6T9vD28m6Ztyt6kt6w4
	 q8rImVgBbJWFgws/kPFkUxqLMMecTuYDpIFU6zFhakULuQPoM/Sx+34mhyLX7CIcgDVpO
	 P9qYJWQsI1U+z4QuKHRqGjA9sbl+1noQolpvYSEXuMk6G533YHmC17UPXrktbRP8plHON
	 5R18xLVa+W/bFtUYCyGZ+iFuKfaCY8e12JGJMqelTQ1sC6eCaWnJs9LgvQQO3rmvFG+CF
	 wO8yksdQLlL1Gq7nBVG+lo5Is9fn7RbjNGBPGjeR4PD4zN6w0nhN+rSAfq2dfl03f0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPZFFODh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827B7606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPZFFODh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F021F00919
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885287;
	bh=8ru4HSnwu1oQ4oTSKgIFmon8BQMS/0IiXPCyBWh94vo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XPZFFODhwzMFOPYnFOG/f2gIhmZlzFGR3VM9E9oC8a4Qge/gN/2bdc8JVTBaYSriD
	 dnajOTcdBBJpTxMHp+10l0Hww4xnVZ0fetIDHktnLlpt41TdKtG0jLRinIADCl4h2G
	 H9jkaltZce3g4ycvP2X5mPYMBA1gfAjsP5sGOg2OuR4EM5LCfO+vp/8U7tRacofM34
	 iDJ28HZWn6GSeK6C8KNWCQLlFKH/3v5rxnq3Z53fw/SOOGmAcXpl7LJJaarkym/vD8
	 qRWNwk970yF+LqVNBMWI1q5U5bK09AqlTE7+DQDj2FA3l1W0Orkngo/IVOfFfSff0z
	 AmmNONwv4RLBA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so2257376e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:28:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy7gl3rvHMTLXLGIYtmbtlbFHtc1v++8dCORw6hinRBCc5MP8J9mig+pAVlLQg0xZDKpj1przxT5/fjnBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gKMPZLHvT/69aOrJT2+jTlinprYrNC/SqKC6WqPUGq2R7QFjb
	X98NySsYx1Cigrmnmn0/iReF+WqkA1sbfWuVNEdgW28yqiRWd1vp9k6OIds8hFXaqmPTPslcPSB
	jB/CNMP8m+TfvG3/mqZtnxM2gcBZYyjk=
X-Received: by 2002:a05:6512:68a:b0:5bf:ec95:41f5 with SMTP id
 2adb3069b0e04-5bfec954634mr3564188e87.36.1793885285940; Thu, 05 Nov 2026
 05:28:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
 <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com> <CAMFFDGhD4K6PN8G+c-hQAL6RG9sVkjo6SXHB5===bYswHh0aTQ@mail.gmail.com>
In-Reply-To: <CAMFFDGhD4K6PN8G+c-hQAL6RG9sVkjo6SXHB5===bYswHh0aTQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 14:27:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLkRNSXt+Er3tnnucpAAj=wPa5JFMsdLLixT=8MnGYJoMw@mail.gmail.com>
X-Gm-Features: AclHuK8sEV6qv2B1_vrP6a-7LhjJiL37qYSrwskqM676CSWb53N83wbpRw8_kUI
Message-ID: <CAD++jLkRNSXt+Er3tnnucpAAj=wPa5JFMsdLLixT=8MnGYJoMw@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: Prasanth <prasanth.padarthi10@gmail.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, brgl@kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:36=E2=80=AFAM Prasanth <prasanth.padarthi10@gmail.=
com> wrote:

> I will verify the requested base, rebase the October 22 version
> and resend it as RFC v3 for renewed review.

Do you have to still keep it RFC? I normally do not apply
"RFC" patches. Consider dropping the prefix.

Yours,
Linus Walleij
