Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F70D370ACA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792184494; cv=none; b=CS6ckRdwSIiO7LBDz7NSKX6owqDIXG3/X7XUoi5JOoGNYTk0MwtfMaF993fKe40HAvaS09aKOkYN6UtTWSQZbt2wHBhklTllHRd3qfgPX9Q1DQI6rxiv+PEz0VTq3CYh1FTlGrbM1z6fviY+BbO4AtzUgVzeCHWuFuDNhgiB+88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792184494; c=relaxed/simple;
	bh=x84aPTx8609GVu9kidYl7vrHKXVzx1OJjssGI8EzzJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=It5b/+uPt0WlxdC9WAN3SdDk14vRzOwuQjChgsU3e86CPg5xTrXnNcG+4MksEwUsKeGgTphL81yBbZFwATnjnmLVeBb53+CI3BfITLa+NeFMl6W/6TE4dGgpdES3aiX435XUVRTAlln95NZHcXI7X0wMLACsjKrrtRbHkjJZNOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gjmg3vLz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gjmg3vLz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A171F000C8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792184492;
	bh=Q3xG/vQ/oHvjXvJdtmtHwaYrf3UPIKtY4II7aIFXNyI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Gjmg3vLzNilF8SOJF0uslQx/s8kO3JMAmo/88NN7rmZ+homAw4ZgRsxX+EbrL0OVL
	 7c2uxoSR5zouQu/MAQCAlfULSAn/PokD+lUoyYqFsvvMvP4ILhJ/PNp+ppZyoUm9/X
	 EFlTlIIjJ6P/9j1rJqrUkVGMsn4RMctXTGcDIQu3yaIzIbQj8oCapp9ueZUaXzDoN4
	 gxPHapusHPhMTQ8RxwvXO83DRZrRG8UWARA7/9y7CEn+c7zEuuuhCjez7OpVs6NlUA
	 BE6zgl2Qhrbc550uptKBtLrIRY4u1Zh0FgFdM2iRxc7H4Vo6VZjDRHf++JRlrgumV7
	 DjpgpNlMARJQQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab07d956f2so1681031fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:01:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4L5xT3au3g0IuJsOZ+UJnp7uDi8XSkxqVHsZwl3DY3mzh5RPtsNygDu/J75f5ybpVwMBtuSl+/fO4LOM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGhPqr7G8BHSr+Rnf2HJOh6Y232wOcU7rCS6HsxTAnSfAOirt9
	BtV2hD75Dl+iJdPou7c1t0YTMA35Kr95HRBL09ZQcb2gnFESWg/gJWeUacN/3qQbbzlvYfP6y6u
	glmw/zwAsbwQ+3BdjSwWySD7AAoOrVD4=
X-Received: by 2002:a2e:be08:0:b0:3a9:9b66:c5fb with SMTP id
 38308e7fff4ca-3ab2940bda6mr2317381fa.29.1792184491585; Fri, 16 Oct 2026
 14:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-iio-light-gp2ap002-v1-0-7c93312fa8d5@rudorff.com> <20261016-iio-light-gp2ap002-v1-2-7c93312fa8d5@rudorff.com>
In-Reply-To: <20261016-iio-light-gp2ap002-v1-2-7c93312fa8d5@rudorff.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 23:01:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLkSjbMRV_53rjpd1D+vxg=OVVWzVwiddUL0eqmSBoONHw@mail.gmail.com>
X-Gm-Features: AclHuK_-uCiG2lo-MUzDBEEJ29WextQc6K-sVKLlU4i1vx2eSoj4AmldZKoXnFQ
Message-ID: <CAD++jLkSjbMRV_53rjpd1D+vxg=OVVWzVwiddUL0eqmSBoONHw@mail.gmail.com>
Subject: Re: [PATCH 2/3] iio: light: Update DT bindings for GP2AP002
To: Christoph Rudorff <chris@rudorff.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

thanks for your patch!

On Fri, Oct 16, 2026 at 4:43=E2=80=AFPM Christoph Rudorff <chris@rudorff.co=
m> wrote:

> +  vled-supply:
> +    description: LED power supply a phandle to a regulator

What datasheet is this from?

My datasheet for the GP2AP002S00F clearly has only
VIO and VCC, enjoy:
https://dflund.se/~triad/krad/GP2AP002S00F.pdf

There is however two *outputs* from the GP2AP002S00F
called LEDA and LEDC.

These read "LED Anode" and "LED Cathode" and is where
the IR LED is supposed to be connected.

I'm just puzzled by this patch.

Yours,
Linus Walleij
