Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284912;
	b=pnBXVCbq7Ow/xLDyLAqCcdzNxuV4VuBVjAuOXG3H3q6DiLixaopxpFctp951zhwFKUb5
	 uzLNdYa5KCCJ4WVQP/JF7b5P76QyEyINBmHcFkgJkbcVRE0Rf7WkOLC1vROsIcsoypWjF
	 CTPTZSo3yfTYWcNgUXaJQH26FtKbcT2p8UUZN1JtBswdYvIoWlxDpy6HG0lU1RPVfCdAa
	 bP8qKdQPaLCd6M66oX7X7yN/lgXjL0GRnYDx8cpIMeHWuHBQ73bOlnrBfXhAzYaVSNHNJ
	 l5B2a/yM+snYb7z2zp9tINMgtoQp8qSb2kpEqg+0iLplLjL2pijvUBzwa+htUMqqJfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
	b=rBw1QByfZSiuJRj0ro/cPrH7q/4dzpqlpoTFHj8QP1jilUvi9Ih4ec9N06tNVlfb4/Hx
	 SG6vW1+ok1oYeRQ5Ig7f22I9tbShAzePtiT5iGgq0tVwqfSgESiGohYemDsufrbwVDCSU
	 CLYDEUVasYBDw0KzN/ufcDMvUpLJ50rqt/GxIwFmQLA7S+qW4g/w1bc5u1yejCbM5JwMP
	 G/njlMvDxweoNjOVzC9fJ6Eg+O4F2vt/QhIavRbq+Ofzyg66IkAouXCyl3wFzEL0sIOLA
	 2MRt92mVuoPin3AaOd9Lf0byrA91OS2COGDFG5bhIo1tY2BxHn6wYh8eCoivf9U0MKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hghgDVpJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD73606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DD73606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hghgDVpJ
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c37b612635bso315780866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284910; cv=none;
        d=google.com; s=arc-20260327;
        b=oguyil31u6uxRgw3pu+iu5AGXMXaaZUQMCzR3ZuvyKwOoufCOqBqNq3inP7Lo4Lhg8
         C8uzqizHd6tygWSJLHM4vSLEUWGsK8LJ2QNDWdGGjVowPMy+I8da9q1VdJX+rsj00yik
         rJeQOY3QNZ6D4+l5i81wPn6JwlXO3OeARpytBqKZsv2x22LwQ0ciX25oKPz3nxBzPnKu
         vMqXkbyDxGVtQiImIXrczzv3ibi4yBF9bktyEGZrVGDgxYbG9TmknE9CISCJVYaxDhKz
         H5O3g7YEvLJjz7SNj410YrgCa6fj2x1iVqZRbCBM5PISg7VnDBx99d3eBclXOSGpvYNW
         nWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
        fh=fO82z8OkccXyqKyGSEu9vBOflTgNZBsz+/PKK6qh4Tc=;
        b=MrFMjalmb7NnJx03otVu+GEs7VwHRA5fQhGNytxe1BeAzr6gagpN6iGYOg2uDoSykJ
         WDi72nyw52aLjPyTZxHkubLt9d1wkyD/mnbROgNgRxBoIv+dxo/eo0tps64L5jMgsT4M
         r/pHc+6TtFKsaqN2qwrrK7Wd9ZVlBiE2XeSLHwEZukx/zyA0uI9YGp8E39XQW4HieQC0
         uP/qWRjEhrxmC54no+lAT+CM/38KSki9vWH0wYDu1nqU+Fgp5+ucQ737bq07RCb4eQH4
         P3XXRPPn9zK7oURj0CA/HzK/5KeqEuCBDse73fPjBU/65JpzUrUXjDBvkJlEqtFE5hZC
         t/BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284910; x=1793889710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
        b=hghgDVpJP1cXYyThMA1gZBdoGMjiVg+rqnG6FbqVfyG80atEPkE+cfMHmoIWezl/C9
         XrtJ3fiu/AY80LVVtY57ZjKn4y8UbkNImktFCWOyd3Co5HvUDG0Zgu7jwoa53114S6H0
         sQMxRUtrelRiRZw9bikrEPHMBNppKhTRXp7evQQN/7A66DZ5P+sf4Nft0PN+W56HvYa1
         6pV51HwyGHwt33FcOXYuLrtRybOk9jaLF32W6SgSIJ2b67T2J7yG0qeIyqKm8NBiLxy4
         z8QoX/bA3wt6/fPsTMAsIkQ1yTdyphOax1o3EO6z5sFUVJbWXgGJHl0EOWOEJMD645jT
         fTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284910; x=1793889710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
        b=nOI+VMIVTg7aI9Et/ATPYiAUdTSZcYmV1xbQeUbHJYKub0DyEI5KbyhQn/pRUd1d5u
         3it95EEC0CILWjR8LWUoGLPVCaTnCCt3h6t5GkAqiE7mTD8c3pqUTv7Luq4XlRK9baRu
         VUoD3Q1b8knr9LcNlxiIaMWE01ocDaxws916WRFr+QNz/ml7dU/1K/bEZ6hZvxklfZGL
         tTg8p9TDvRAFRAzIey5aicgOP+ySKG8dnugWfVxze8ccQ6kPt5L9AEZZ62YSJJJDj/O+
         A1E52c/kHEiGY3yxpPRJd9ji86Zdaay1lmIsyofJNFKMFt+NPW0n+jErv9O8TZ1dHWUF
         rTtA==
X-Forwarded-Encrypted: i=1; AKwUvBxBPZGZNomhUeOVFtXExFAWsmujaYDK1eefqHDc2Mh0ykemwihSJJBWhfhdDFy54ZOHGVrJCbK5yiHI0ZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKDzsViH9TZDTbjtGazbqvbF/BI2HE0f4Pc35G2fDL5AICxhWH
	A4UnRWd4/ZYS0fuAIJZe5DtagDQXVRzK7/wfgrGeStQl4uuA+8QoWBt+zQiGmwiEBMu8cjFt/E7
	I0I3GlRK1L/H0RkO6Fqs6AM95Xb5wCXM=
X-Gm-Gg: AYBFou2QRnoqI+jcWaQgyQR90V5p/xv4NDJ8Nk7agHG9ORPZCqkIz99jyAGYkFloFkm
	KcW+d0ZtjjBoazW3WqJDD//88qUK5d6jAfJW2y1FfC+NcPXiT5fX6+EmEqnEKd5w4llCT3JdG0m
	Q7l84HdArzzHNSCFooyAQ8xQ8vSWawDmkWkR9yn/V5aKLd5ycgzaKu2k4xDtCxc61m+uq7aJNOq
	LAXaYoGKePU547DVliqmODbZs1CbfO6Dn+aiOv5K3Z+reLsC88S/0ugJY0fvAgVWYBih9j5XKbh
	vty/N3F3EG6I49x/268GYc7rW6/633vjp0cLQH4/vbpxyPUa1djF6oOW0FsmoPCC5nanxIi79Fl
	mkDWjFnZlzTMw7tnSPjPGR299mxPqXtezFHnmzDJM2FilEGG1+JfntQDfl8UaSqrCLsVA8bk5sk
	vl8lns9txNK8lJcyGQ0Ao/6+w7KluyI2j3M+ALfO5TK1bpE0lS33U=
X-Received: by 2002:a17:907:a88e:b0:c46:6a50:40b7 with SMTP id
 a640c23a62f3a-c49bdf25ef1mr512176766b.10.1793284909657; Thu, 29 Oct 2026
 07:41:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com> <20261029-gpio-vf610-fixes-v1-6-45b484b4c434@nxp.com>
In-Reply-To: <20261029-gpio-vf610-fixes-v1-6-45b484b4c434@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Oct 2026 16:45:14 +0200
X-Gm-Features: AclHuK8IDt-muCciisOmWbSe4tpMQXEP57E_Zd-8ek8gdIf0pEg9SXZFYjLfJ5w
Message-ID: <CAEnQRZCT2ghW69zvZZHPb+GHVLGFO=2A2hGxjuM0Phqjve8xgQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] gpio: vf610: drop unnecessary wrappers
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:52=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Remove trivial wrapper functions vf610_gpio_writel() and
> vf610_gpio_readl() that just called the relaxed versions directly.
> Replace their usage with direct calls to writel_relaxed() and
> readl_relaxed().
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
