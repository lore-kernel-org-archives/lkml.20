Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3F54AE11A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387780; cv=none; b=XxiE6ALs3pb3dEV6P1BgOVynX3X6UNLcXMx2jEZ8mU4hx5Bk5mat9zFl8Muq5ujy8+9RagKwgrKxIkpQxIY/zzXtkChsjTrCDjFIe+7lnZI1a1leA7dfK3iPS/ypa2U814t9af9sHbYdXGmurqOF83isXa7T3NehkBRkxbZQEWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387780; c=relaxed/simple;
	bh=PlnA7pZPe6iWSdjPc1ZWRfK3KN/vULI5guFytatqI0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JrrYKvrIVd22+oHr//HY7/tK2B49UsYu/Z3FKUjH1x7zDnI/8u3/huYAwQniMLYX9VF8ZDUTAbcDGRuAHQXfbRXQtmYBeJeDkFi3UcyYv35e26BguMySJP7xluPfb9REjtK5Jp+kUKJeuCQoexry99nAhf2g33zRbUJB7k5aau8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nydws3hM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nydws3hM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA391F01558
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788387775;
	bh=PlnA7pZPe6iWSdjPc1ZWRfK3KN/vULI5guFytatqI0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nydws3hMq1EBn8Yvf6RYriQkSQFt34dD33Ns5X+It24hzLzbfsk2TeYXrX44QHIl/
	 jsFvfor8ke/GNzfcfIds0kZR5K+kwi//9RVbR5OawvW+HoJFYtQCSbB0/M42sJxYKT
	 kIN5fmKJG0crikjc+QCRkk/sIj4pGX4biAd1LqWYxgPMLSsvz1XBhWWub8iIpLl+k2
	 4MK4DbxUwvMxRY1N5fXgMMVtqDeJoe4Wy7YCzjMCVR4rMIsl77NsPc6UF2mjY8qIGM
	 pwm5mM1hnJDh7oz9Dn5ZnEVlX0TYnDlzaPxtQOtAAoxuyyao3kvk99RJRNl3p3qqQU
	 EYbMZsOOYmSoQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b159850b16so1656368e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:22:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwQSTgksc0PuUFvoGI76VmBUjkLFWkb6AMTifMuKZN2UfuRivZoiG1zB3OvDrLfWEizSUVgVGFUgbD1nQU=@vger.kernel.org
X-Gm-Message-State: AFuF++lnPuJ0i9FcEoWJQ8fhdYppnR5lVNXE2npMwE5Z0KlZj3mokdU8
	FSlvbyTmM1wh5HrL8h01lvSd9nrcy0rjzk0IL8rmN7mh29IdRgAJjOKlzZwWa+pIlVL43JaVqSz
	bydXyFDjL4Hj54sjPiNChxLLEb7MJp1o=
X-Received: by 2002:a05:6512:31c4:b0:5b4:5846:d925 with SMTP id
 2adb3069b0e04-5b60869986amr2881504e87.21.1788387773462; Wed, 02 Sep 2026
 15:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 3 Sep 2026 00:22:41 +0200
X-Gmail-Original-Message-ID: <CAD++jL=A5QWEfNXnmpKFMju8X1BQ8CsxMuqhia7mfMFbUaFfHg@mail.gmail.com>
X-Gm-Features: AcwNN1VW1RszHvTzjuJbWoFCZNyLdzuqFUCfNXCFY75SAWSdMQrzlNz5Nhvn0yk
Message-ID: <CAD++jL=A5QWEfNXnmpKFMju8X1BQ8CsxMuqhia7mfMFbUaFfHg@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] drm/panel: Add 5 DDIC panel drivers for 14 Sony phones
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marijn,

On Mon, Dec 22, 2025 at 12:32=E2=80=AFAM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> This is the second version of a largely reshaped series that brings 5
> new DDIC panel drivers (4 Samsung, 1 LGD) that are compatible with 14
> Sony phones:

What's up with this series?

I am officially a fan of these drivers and I liked the work done so far
a lot, is there something in particular stalling these from rebasing
and merging?

Yours,
Linus Walleij
