Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484448;
	b=Oq6UjI3GvFtq64ySDgkAgWdvwbBcsmObp1rRC/DiOBxvcDBqprDtRBz8BWEFO1RHOZJ1
	 AL3/7vzECdVKn8JP+4D9W5l8o0vjb7I5PkCQ8cT9XC4hijoWmb4iz2olcngFXmFQfHmwP
	 N2JyBrY23XBChx+qjwmIYNN6tZk66ytMisyskue94KDuQJKVNki9c6PVaJ7zc9RgDxQyb
	 pa26A4dv9AIVlnvXHTKCuuEFWZYkZPBQyJPGWUalR5n0GAyMtY9HvGbGfJts0LnZSZ80J
	 wwZHGwzJznWQRaHICbTnS+O1/9QntAJWGK8O8V6O+Tgu2QkwdEMoZ9uyB2gq4h5ed0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484448;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=kKIkBo5KGbrigOoOGFBrL+Ie2szW3g61E8oJn61TwLY=;
	b=aUEQ0bI5AqP1ekV1rZoS6JcA9CEbyjG3Cc+bKUNhKH1LOKXkM2Dl2vqu2b3dPdlTc19t
	 Qmt1nV8Oj70mAX4rpbZ479akLfrV2f3+IiE7bAvfFBbDDhyg0kSCdYblVuZT/M8m9k6mX
	 Xvm0XiQb3nasJzyOZB5ezZHQ90gpUVOUvCn6vECHofLabRLGZHZhBA6hTrzm9Hv6gRTyg
	 Ca91DcRw6eeYEWSxx87/9flojnL4p/wp6AZHiVXMBH4ZH9BeV+8BMCrdEH1iD+jXvJ/NU
	 R3ck3SNW/xGdE2jdZIMDiqRhpqIpxZiu8KA9PPTOeymoL69MJFcr7hwnvAC1MI1Hy9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JZlEUg/v";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD5F606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZlEUg/v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1861F000C8
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484447;
	bh=kKIkBo5KGbrigOoOGFBrL+Ie2szW3g61E8oJn61TwLY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JZlEUg/vZOsRC78i1JbqYA0dy/MCc5MAhreBjwDzxBBKweLRDyrIIXD8cmbGTE1VI
	 nOIsDyczBeqgjWs5LmfGoU6tsAK0mI+rPAVFy+ZDahXY8IdrSqhPiIQqj0oKm5O4Kc
	 fPKQO3fAxTjkJ+tAt5x278Wkv3DVyGjDCB4WOm6o1kcq0QQ4VTp6fSbiOC2Sa2ewki
	 Zq7pA91+Q/28XwFRtXBLGC55fZMAzYOCL9ExFkG4j1mxFTYJ64YmITihqb6v9gAzTy
	 AMBcm0iycA8FCuo5nLKVkVtRV4NboSnLdvm17xx9Z24iuPASRnY8mlGFDSQqvJVWyN
	 Mi75A9aWhBMmw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so2075326e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:20:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwXYCJpcg50olAdN/qN/y29O3MZnEqG+B51bgGl6QEMf0Yd1JqZHg9wKhXhaT1nCBKmO77VpQ80rAKl6Ms=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfkUYJ+AOF68mIcIan1XIyu/pLcuBZ8u0rTs2oOq6voZ2RP5KI
	SBR8o6pYF8AVMfHE//WBK+F+L98B7ncYDhLSuTKjHw0dFBG/wZbE0AoBeVBAOv60GwWty+EHdKM
	5ysLzdjUbIK7QmhWMM3/YGOd6m1twB2d5Dxf3PJoWwA==
X-Received: by 2002:a05:6512:31d5:b0:5be:55b6:7a92 with SMTP id
 2adb3069b0e04-5be55b67a9fmr2509119e87.30.1792484445158; Tue, 20 Oct 2026
 01:20:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 03:20:43 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 03:20:43 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 03:20:43 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mfw+gy4wiQNH9wCY3UeyHa37ZWf2FPHi=30dccfenqY2Q@mail.gmail.com>
X-Gm-Features: AclHuK_I405DPm3BS8wwZk1JHxnrPGnEzBl9zhK4ySt7lFNe8JQMTPDxLEmJBRU
Message-ID: <CAMRc=Mfw+gy4wiQNH9wCY3UeyHa37ZWf2FPHi=30dccfenqY2Q@mail.gmail.com>
Subject: Re: [PATCH v12 0/4] crypto: qce - fix self-test issues in skcipher
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 16:46:04 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> This iteration will hopefully fix the final remaining comment from
> sashiko.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Phew, no comments from sashiko finally.

Bart
