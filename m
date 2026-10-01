Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D651249D5A0
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856551; cv=none; b=eFFHQJFj1cPDefNKCERHfU+I+H6uLTcORitY+9JnrQGy7CImdrDZzraXZcaCwbTijOuxVrhtWc04fMaTbUA5e9Bdoj9smpgetaROdLT9HPT//8P+I3BM/i2P1T9/QIc/9w6zvT17m4sD7LnxqJidoUXzo4RaUYqKGDeIKXYlJUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856551; c=relaxed/simple;
	bh=Efy2GeD05EfphIFlVWVsMtlBk1ymm+KYQ4arEyy8BdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmHzSZN86zZe8e71nar2GXBzrhbmIB/Jyvj0uj9yJ8HzmmR8OSN90hMbaf+dWhuDXqeCFSKZGLPAqCtlnr8RJ1y43TpzqnH3rV1koZa+tnW+2FeXl7JNzwDQeC7o7qJnnqUpcUplf8rEIOtzsod7NhYrUChWsFRsbQf4fPyWjkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFuxNW7m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFuxNW7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0981F0089C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856530;
	bh=Efy2GeD05EfphIFlVWVsMtlBk1ymm+KYQ4arEyy8BdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jFuxNW7mZ6qbHWx10RpXY9VNIRo4YZY2IZO+QYiVSPtGw0ROAJE0HCnGRCXFPMs82
	 vdPe+j6DjROF9Xhzx3kcKTcR9jVUXE0WLj5JNDWaU9IqtI4JmsSTPApfuwRbp0FEI5
	 OxGSK1shFcVAlFD3IMwK9ktrLibYGUFV/CmxWTanATzan5kRr1W46mtgGKPbg2f8ez
	 MD7iDcGg5ZeR06dEa1ngOCbJ1YAZ3sL5g49Ks0lMioEN1T4iCen72sANcOGa2C4Y5R
	 IcH28i0lmwQWnAwGirOTo0bJOkv3bmQ47J99vL8084ix7NQJe44onCLJ/c2NtV1ZM8
	 JDgOHDrKPWqZQ==
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-7fcb425fc2bso4048994a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:08:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwtFOIXVDc5+Gdmy3iMsL1sGasB++7+256moDqTFLUtNNPhLKYbm+yIYAfTO1zLW9m8sv/1vpJLjS6I+yY=@vger.kernel.org
X-Gm-Message-State: AFuF++mdxA7e3lXleEQY1SNEJCuNl4mcUdZQAcDHvEaM4VzJegYgEdv7
	UzaPZrnt1jFxrJWny5eMVUkgN2hM7/Xs1oulbW5MpfY0E8LrZaY5CHxOD3ZjQcvpelL+2JY3Zpd
	mQ4OeohPmBj3TOw8qWK00SkugnXTYUy8=
X-Received: by 2002:a05:6820:709a:10b0:6dd:fdda:290b with SMTP id
 006d021491bc7-6ddfdda4299mr1394070eaf.57.1790856530140; Thu, 01 Oct 2026
 05:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-ebbg-ft8719-fixups-v2-0-5454ae1f5581@ixit.cz> <20260908-ebbg-ft8719-fixups-v2-3-5454ae1f5581@ixit.cz>
In-Reply-To: <20260908-ebbg-ft8719-fixups-v2-3-5454ae1f5581@ixit.cz>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 14:08:35 +0200
X-Gmail-Original-Message-ID: <CAD++jL=KPyt384bEcrTR1V6y4WH3Nkz6w7rsVxZUjnJZc6_uTQ@mail.gmail.com>
X-Gm-Features: AclHuK-CfO2vaNrbhnpcNDH7OQiVrROdFcvCpCkNzNhxCoBuSHJS-Mb8OG4p1GY
Message-ID: <CAD++jL=KPyt384bEcrTR1V6y4WH3Nkz6w7rsVxZUjnJZc6_uTQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: ebbg-ft8719: Split initialization into
 enable/disable fn
To: david@ixit.cz
Cc: Joel Selvaraj <foss@joelselvaraj.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sam Ravnborg <sam@ravnborg.org>, Marco Mattiolo <marco.mattiolo@hotmail.it>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 2:45=E2=80=AFPM David Heidelberg via B4 Relay
<devnull+david.ixit.cz@kernel.org> wrote:

> From: David Heidelberg <david@ixit.cz>
>
> Move the MIPI commands into enable/disable callbacks since they
> are called between prepare/unprepare callbacks.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>

LGTM
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
