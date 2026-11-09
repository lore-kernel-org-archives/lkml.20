Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794210020;
	b=Eewk5NGhYKxqUpt1QpE5ja+jb8ImZyy4U6Iyvbz1KUMdKpUpkGvDzZFjrLJF+XrasweG
	 23wJdyXKSr5SkN5YSBi6Xqqoc9JBFt+ZdbBqBTvxRnHTdol1nwPgAN1bcKP8nZx7AyToc
	 LO4sJjF90tnO1rDzg5BNKPHYz5wkd3grgOOsJ3sVVel1B1Ijji0Y8vQXpr7R2hrbxRfYk
	 az5psfO87FBPHQOnk89T7Md9stRAmkP5tGTIx7COA1Q0pGpRdZAnjeJAQd6INhobXQH7m
	 Pszz+Kolx684jU7uu3aOqHrtAw/uQT7SmiSaYPYOm1+Z3+XuDgrsZoYba0kJ504UBog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
	b=4RAycfiXrPExilW+artPogzLQP3pzFKLhnACRxJGxRjJ1zJHrwYbG5ElzLgp/C2RXQy5
	 URn9pHoY3RvNHLFYKOXckVt4W0mWOg65TW+SmIEliaz5xS/7ySXjdHIko9VJWmdxeQbU/
	 Mq92aUi0PHRd0RF816Q72JOVQPxf/cc+AEwGVlZk2Eoqod3rfeOaUdXK0kIyd0NUFXnOi
	 HPk58QpATfSUw1081hUPJN9LQemEMPv1mQuA/jH84eXrd3aHlKvZAOtwwwHqMsPHjFfFo
	 5lfT1yHLjRqxftTmMvoaEtr1Pq28rrQ3nzfGDYA+gzQp6E7OyBh0Mntj1aRPiufZVzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fw1HJ3eB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F61606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F61606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fw1HJ3eB
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0a2a44a0cso294143a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210020; cv=none;
        d=google.com; s=arc-20260327;
        b=bIHy3C0O/Au4ifl6BWlqnC50Ac2xb+n+H2FsRfdsg3UxQRZPCB/GQnWAI24yQGXnHQ
         GZ2Uh2qNJ+PRaCXnRj+La7qpd7MO7zdRXVQL8PbGmIIoQIDURxGsgvcIpJVTuhfLqXgT
         arvrl4nLEDF/b99fgBlfMAOjI67xYHPF37q7HQbHuTPM7fLlEbdk2a66laV2KeJKHtJ4
         hWw2VXAdrGerqzG4DLXK4IG1BxNdqinhTGOfi7ckE8KY4Tm9tXR5Iw65hyPN6FdWnqXO
         OLcpyeO2oce7n7IR6Lmpyrn8ma8+iqrSu5qKIA+ZdKqhOfh+yisQ6OUkAu4UDzzgUq+V
         UizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        fh=b0uOxwcNFJIFGEY1GURHk7xb9DK3CI+CXa5o7PcGPJE=;
        b=gwBvNmvBbrJCN1TLhA+QLIjDDOr9rnYpxg5Sf6VRhv+JjuQ/amN9EfWeyWJd4wjeEu
         yNyt+eEDzp2H1SZ23XLpUwzbMJ3oMSMvkpbUyzuhB1OahRaj8FXNmgeJkyq7bVHwRo2A
         +07M6ZcRgWlwkoj1d7XK2G4KLEpRhrM3qpvEpoZIMgG6jeXCrqLFn7nLMP97kTtZC99j
         ua+JdF2RrJgyewpWc9rtahXL3nogwFm0PKMjs/Qqoyih6L5/bckKGJm/sp4GwCWnAzbf
         kBIugi6n+YsrnXvviWW4MP5TD69nUNM7I58f/3NUHgJsVWbIgprijwnCSydBJXfdiO6D
         DBxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210020; x=1794814820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=Fw1HJ3eBrEG+YcG2OfXIKNyXLbtxL6pFyShNR64xnTBicLVJTLcqI70PP7XlmXPNx6
         VWmQ662eksYGc8vJo+lcMpjTIaYcJB9aokKPIxavS8OWhjpOs8W89bix1ozwYvKeb3b4
         M7C1Y4n+R7cdsAeFDh3I3fT0WNvzf0CnRZWDlQZYC+5M2rSyX8wMQx9uS+vQs8QSo0d/
         2FLip2Uo0zLuYIubK7TNTBZ4sl8ZrZ+JeHk7SDm/ZlHHFtWu1M3YyNEi+YttPBGWC2RM
         X/hXAhXzRlZNf20NwByFmIPl+GnzmQCqAB4nehLzmm3jWxLA5k3xC+msTg/JbR6XvUqv
         ep4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210020; x=1794814820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=pPAUdjngVr8lcDbWN2NnPEL69p4zLLqLpOC/OqoRkHa0sxXJDVz2jo3VxVb2eoIqho
         Y7ti6x4I0V3Xjzu1Q3hBrWQudj5sflbbpdED6XtboqszA2peBVxwSkXRryXsgBm8abTR
         PUGRXaulDSrNEtoOH9ueIQcffG2fpihjNPCFZFOaVOZk503FA9/o/Byzhtd6FbUoAXPr
         i5sMPv7Yb5nfRxDefiyyQk/Fd/kekj9X6K5e4IKzwyt4xUl/9LLAt8yO//WfhlfJbAjz
         mJVv3h52WETzWku5hLYRMMneBjMBqdFCDx6CR9CMf9s4vaZGZY4PGd5rL5738pFouJ2K
         +zzw==
X-Forwarded-Encrypted: i=1; AL+hErHz9anbdnnRPAUGtHkk7xkdykOlOf1qHj+ZykKtbVnj2ZlNCPrqLEAfb0VKTBDRUKEUpXtQxSg3eD3qo8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OoeZhZVOmcmKq7247+CVch3djAuZBqQMm4kNe0uDtlLD/T8DI
	SFHMK0ycV/iRcqKA2scWGxt2+ZREKd/Eu7y9kszCbso2yeyyYCzRPn+mryqfDQqLXFkOgwAbiIf
	Qdx7t42mnzPgcnKEOwXv7q2IeCKXe452R0mDki7c=
X-Gm-Gg: AYBFou3Dt0Fr4Qmft7PyevEqTnZW5xC6lfyPHhe7sJxBo+vR6XO6hy7nJkKkLZMZoTf
	Rt6XKzmB6BN7hs85DQd6io0QiEZ3/z2vEmtUCC0P/m6AXriOJPMmwVg0uAoP5RgkNxT+0gaaeMX
	SLPKqfPyThLh7d6F1GKINn32ogDmr6x/SY4EAvX8MKfArY7l6fwXw73BiWvB8sZeslsVBt+WiOr
	rsvgjChejaaiAiMdaHoY+5BHFrRlDmdWzSVMtHBeaVzT9mtN3f+gDp4vW9HlCcCupPxgPMYEykA
	zcfLikX36K51KHBHD5Ns8SlSuKKQYAUvhJWCs6dqudwtL16a1KWnPYTt2CiCDBiLxU4v35uRx5B
	pVh/fDcsFrh4UTculPEYZ4m7hJbB8KQJ6m1Q=
X-Received: by 2002:a17:90b:384c:b0:3ad:a270:a623 with SMTP id
 98e67ed59e1d1-3b12d107e44mr3364118a91.4.1794210019701; Sun, 08 Nov 2026
 23:40:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org> <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
In-Reply-To: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 9 Nov 2026 15:39:42 +0800
X-Gm-Features: AclHuK_dnPMk52UN3-2_wspDGRy5a6s-cwmnh8paY6ZY-G54Qz5KZ0bygsAWCVc
Message-ID: <CAAfSe-shr1+0YpxEvf+4k+DyGe3==PUiD72CwjE+RC4gX-ShiQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Ivan Vecera <ivecera@redhat.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 at 10:39, Chunyan Zhang
<chunyan.zhang@linux.spacemit.com> wrote:
>
> On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> > Unit-addresses by default (and most commonly) are hexadecimal. There's =
a
> > number of cases using decimal patterns. Fix all of them, limiting the
> > pattern to match the 'reg' limits if there are any.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
>
> [snip]
>
> > diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yam=
l b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > index afa551f6185f..222d70baef1e 100644
> > --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > @@ -47,7 +47,7 @@ properties:
> >      const: 0
> >
> >  patternProperties:
> > -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> > +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":
>
> Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Following up on Andy's note about this:

Please disregard my Reviewed-by. Even though I did look at some of
the other hunks, given that I'm not familiar with the other hardware,
I don't feel comfortable giving a whole-patch Reviewed-by out of
caution. And since I'm no longer the SPRD maintainer, an Acked-by
wouldn't be appropriate either. So withdrawing is the best option =E2=80=94
sorry for the inconvenience.

Thanks,
Chunyan
