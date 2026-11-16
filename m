Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841555;
	b=fZtJSXh95msnQ7ksNmD1BJrDZ4lxnjv4SRvGjESLZpJHWpjRgSWXD65LcKi50dY4oBLu
	 6dPoIAc0Z4OFtdKORJcDnRp7FzY3uMdGr/XlGHqROslk1IH7lKUYOb7ypwv263K5ahwAb
	 /y6eQJVksS57ZcxEiVicH3m4FXSIOQH+NHtJDaDnoGAsYHxdEd3p5obcpJMlfoHavNqG9
	 RqpDKoMhQxk1sj7PUD7kTzJ/MeWNMj+Iw64liRWGm9s8LVwY3GNtOzhiRpzvgcTjAli12
	 1M7sAPLrOGTeaaXNw1S1QKMGXcmPUTeuPjH4L2rQtCBxiOCoVZ9L9hgesZSjAD51GMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841555;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OLWrs6wHPjIfz7q4sqV0vSP15dB9qR0xZiDxNkgRnPs=;
	b=TF6m3tR/sLTXcQnf+OFCqcLoBZt5Wk8343le4yOVFMIdLO9wDijLGpbYmyH4BWTp/vGT
	 ICfcAabexctvpxuu/Qpj1KZREymsxK0ZhE2xAbGuWGZy/IJSefTTK/hdnmn2sQMh9IoIj
	 lG8ShvgSlzSlwILmPWiTyC5tlRuLrQQGgnNveiIQFBDKqhN7/j+CQFbs+gqKOIv0ezOEx
	 VDDSrQY2pvHJb3Akd5pj2bW5dDi/ZBCOlLOGtDdklOwqiu3HTFJVYmlyvw/cfAclRGLV8
	 UZR7FAAdRzLqQukcTYNpY9tVpOYDMCPC3B/MOvl+tBRTuRkr3DiEE9IaPypNlQd/tSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFWU1dbh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B5B606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFWU1dbh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1531A1F000CB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841555;
	bh=OLWrs6wHPjIfz7q4sqV0vSP15dB9qR0xZiDxNkgRnPs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FFWU1dbhaoZvQa91GRdHI8OMpKROvy42/LGrcfuQXbdf73zihIiGdYVwNZODlPIbV
	 Q5czS1aAFUldNovu3EQYEfoc8NHu+qSDhm6v6a8eCG4NjUp76kfyw8lV9DsKKVk32O
	 CcIoLaAkJxaGHLILcqeNkWcM46hNELFAqOhyLM6uSFD20cXkC38iqTJWOeahtcSyYd
	 gl0YXDYAHTXv1NBld07Xow1K8b2g7I8++GShq7P5vme83fnO0wDP07J8foPfiJr0EU
	 +rycpV7xKfNuwSFM0D1jd7RIE4w+CF+RlYtMpdD4VUI53TH4XpcHTY33zunLN8yGxa
	 pKvVYF2ayle9Q==
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so4023503c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:05:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGEaJ+c1IAnhW0ApONgSRJDmtWxytCDlo3kd6RRRRCEzkVMByreqPH9isNqIX06jw5Asf+Cjip3/NVpvec=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GPI0XlmKv8HDXQV7apUi1BRQUEgq1YOELxDlK7A8yQvkIxlMJ
	iUnbisCDnjisUGlrwDHIoh65GGXyV5v/PyYkm8kiuJ71eeVhZPdWTsYpdDeDiCWXs+yyn+H97uT
	HQ+pPsQ0QFTMG4ULM3XiuZXCpa1FA0Q==
X-Received: by 2002:a05:7022:170a:b0:1b3:b3de:9232 with SMTP id
 a92af1059eb24-1b503115668mr9409313c88.9.1794841554483; Mon, 16 Nov 2026
 07:05:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-3-l.scorcia@gmail.com>
In-Reply-To: <20260921113914.779393-3-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 16 Nov 2026 15:05:41 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8o7CQQ=GiRX9hiPOjWs=DMP_XSqhpz21d0cN_w3E5LdA@mail.gmail.com>
X-Gm-Features: AclHuK__YOxqBRiQVL1fHhE6d4s71_dwL_BIXyQUunv6tKh3Bya6r5Lxps8nc8A
Message-ID: <CAAOTY_8o7CQQ=GiRX9hiPOjWs=DMP_XSqhpz21d0cN_w3E5LdA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/mediatek: Add support for mt8167 Digital
 Parallel Interface
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
> Add support for the two DPI blocks found in the mt8167 SoCs. One of them
> can be routed to a DPI connector and another is directly connected to the
> HDMI IP.

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
