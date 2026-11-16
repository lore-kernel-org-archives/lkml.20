Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841288;
	b=ujhz+XYC+AYxi6+gCI4yoE2H20qQWXBGWpd/FtV8oO+A0bVXLdqrapOfzu0yyOvRpBfn
	 Lq4/n/wRDU4hfdSAVfRPLz30+3QCbnTyfbhdgd08A3pNV1Q2P40QfYChXCJ5WU9CZ8CPl
	 njHNs8jwgwhKJUuRYHNNeP2w1CvTXDjRUUlM+rrdpWEiTm/NFzURfQpMcrSOVCGK4fD9N
	 mNhxQBcVDyRPbjLjEhDU5/ow2qVGRQc3UgoqtPOH6Kp/a4Gc23lnExCnrevqDVHeZ507b
	 P8g5Lsxi/aKYJPEFRQxtd8uvVHiN7A+m6XD0JlrOP7VQ142SQXH5W8N4dInssGFEOrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841288;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jsBT0FZpMNikULzHhEfNl07JkOQbHVwUC1+MdqdHryk=;
	b=pZ4ctmqSQGB4Rqyuo59VBXrh4C7B5KDRyI8BxyC2arIoqHV+5NOcupmbx32N/Mt4araL
	 RpH/9tufaMGmbNFgAp+bnlHmZNrLP0aadoUtHD0/u9yHT4Y+q1Y/1PS+/WWD4wjx87bpe
	 FD9rXXmBrwmJgtKHFwHGyni5ANaIaZVP08LUObDdDcRhmaH+niKs8b+tzlePKD3unAgPp
	 EZv+F/cfZi62lYTnu/U0AF6jC15NxhUxbM6SJuCnkdGo5u6pM1FXXn8k334YlPW8mJEKV
	 52M/TErBtlWSZILl10oZASgqkWZ9Z6tCAGEUV6Wh74CtOHUGjzI1zB7v+qXXHlz/w7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WgkdVXM/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5663F606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WgkdVXM/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFDA1F000CB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841288;
	bh=jsBT0FZpMNikULzHhEfNl07JkOQbHVwUC1+MdqdHryk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WgkdVXM/UXQ+P/8FVeaG3uctBI70rCd3thyWrq8PgYspDz9O/pUqZJCa/8rQC4dng
	 GwQvURFQU6YqndYAWAZ+TcpG/e0NSDMfGsot24t5yN08P/NOW0Vlq9uPzUqL0nRjoq
	 2djWIcrsZbuCPc30DJtuZunOnH5WgsljMzcZvo+pLvGWprScSYdlu7b07fh0ag0Srv
	 rrtUbpJWtwTQdt5FgOQ/cZYb32UPI9QkJfcOWKzeaBcu9PCTMnK4EqEcIQGPNX1o9P
	 rGL1oO6kpYd6v6D2/nw/jGQoOKFKHVzZML+cscsIHCPEiB7J21GQkvEWuJkmAemcrp
	 dzKTZN1W5AJ4w==
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1438d9363fbso1718463c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:01:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGwjqF2s4MCV66vKxNBEg9mdtuagtVLBsd5PBVbX1zVt6v7iYH60GBBhgFP0c2WyIfTNa8f9c4rAc19/EY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PI2JTMg1D3mHC0jOIEhqw0lx9Eeh/jTS4til5BKTbPpMdn2Dv
	5pwkz/KEE5dXwSuq5VCDFFgtcDKIMDmEebkvcjdneSQHNprn85pxA96r7OVnm95d6FskJhuDufw
	63CRANfhMhpVf5AxM+ufj0HmlDut33g==
X-Received: by 2002:a05:701b:4648:b0:1ad:1574:aa9d with SMTP id
 a92af1059eb24-1b502f8a3femr9454273c88.0.1794841287247; Mon, 16 Nov 2026
 07:01:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-2-l.scorcia@gmail.com>
In-Reply-To: <20260921113914.779393-2-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 16 Nov 2026 15:01:14 +0000
X-Gmail-Original-Message-ID: <CAAOTY_9W4MmG74gMgXx=6-QncXs2-DqdR6FqjckJG9bsevyWnw@mail.gmail.com>
X-Gm-Features: AclHuK8ZIdYSrxKs1dMZwhPrKku_6kwGWxmzNQVSAncsA778TJy7Qtii6vDGXkQ
Message-ID: <CAAOTY_9W4MmG74gMgXx=6-QncXs2-DqdR6FqjckJG9bsevyWnw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add
 compatible for mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=
=8821=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8811:39=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> MediaTek mt8167 SoC has two Digital Parallel Interface (DPI) blocks,
> one can be routed to a DPI display while the other is wired to the HDMI
> block. They are not compatible with any other device, so add a new
> compatible to describe them in the device tree.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
