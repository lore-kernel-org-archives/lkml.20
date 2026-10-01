Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96924908AC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843706; cv=none; b=g1AZvcLTFkJvlnQAl2nPnZhtDvekAtSwOPUJxq6iTqk7z9kAwOZHxKAcp9g/ugG6KR5d9YfPjgWw68dwT99EE7YRITmUGyXdEBV8M5iHJQzKA1uGytB38sEatt7q50d0sT00Icr/MwnFCguY5mgn24Zy0SxXIOIoMoh/bjMMoZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843706; c=relaxed/simple;
	bh=nRbIKtsqOqygVzGsujZN6/nCxuJYbBISgZetm9P74vE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rQAeOjgh/SwGdszKzyTcf7QAk9erwrGSdLxPdb1nHuohAXUHQdZP+OqoSHjPqSs+yJzoiU+qZzJ0IdxhDymYNJZ/+hNrmObiL8V0Ov12IF29Q25VNI2CT/rXZA9CeSTEgyGTUyP4puRGVNflGc9vcMvduud07jozVrITSrhFaXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3Slhvcu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3Slhvcu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649121F000FF
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843705;
	bh=nRbIKtsqOqygVzGsujZN6/nCxuJYbBISgZetm9P74vE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c3SlhvcuQrJSyZoW9VcteJICxeUldHXylfc0gTU6cl9V9f74rwDXanedOzcCzlsIM
	 vswt64LHLMRnb8NHBIWe8gc2vmrkKOWVKRS50WGHUdmcOWc4zp53V+H+C4nVaKGVDl
	 w+Bt0IS+IF87pVzi8Xvf8rZEHU+gahzeTbYeUA66BZ+fVKM/OfEKVbuGt4tL8AqSkn
	 rMf9Laexa3+O37DxX/FCz++g8+RYLyck4j5xVNQmOJxFvjKFGzfCCtDzbLkSrFglKm
	 EvcOg29Wr+wBRsMF/lvqePmxLAiUdDkLgkH6xS6+gkFUOR9saE6Izx186mwo7itaga
	 4H1QiGn/AsfMQ==
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-493cf6d8e60so2600031fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFx93zok3M8DcK12AP8BiQAVci6JlkTRWmYBygQzZVG2xPrvEY+ZSKh/QLWtr4G9ljsmUxcRq1VXUkKmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvqjTDKxxYUu5PlVmPEnZX3bTVGqBcRQdxYTPc/avq3A5JdCvQ
	RJtdjxG+5gvZ44EXK6ghtOOmRMMrU2m497LfUVSSF4VLXrw6U8RBwk5PIpOtq6aWU+1FYLe+qoq
	lhSZjsGDpDadxoWVPkd6VwqmMym9oaXQ=
X-Received: by 2002:a05:687c:20d1:b0:491:88f1:f3aa with SMTP id
 586e51a60fabf-49dddd46654mr4533364fac.26.1790843704807; Thu, 01 Oct 2026
 01:35:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-b4-mt7629-pinctrl-v1-1-23904cb0c3f3@gmail.com>
In-Reply-To: <20260926-b4-mt7629-pinctrl-v1-1-23904cb0c3f3@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 10:34:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLndGJmGzeMvHk695Kh9y56Zxye86DiFTuoKBiWTnvkmLg@mail.gmail.com>
X-Gm-Features: AclHuK8ING7eVXmVQv5H-ajPOg6LfXVJcEvYhwqQVDz3x1__fBSswtm27gPTJNQ
Message-ID: <CAD++jLndGJmGzeMvHk695Kh9y56Zxye86DiFTuoKBiWTnvkmLg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt7629: fix the 2.4 GHz Wi-Fi pin mode array
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 12:04=E2=80=AFPM Chuanhong Guo <gch981213@gmail.com=
> wrote:

> The wf0_2g group contains nine pins but only eight mux values.
> mtk_pinmux_set_mux() indexes the mode array once for each pin, reading
> past its end when configuring pin 78 (WF0_2G_HB6). This can select an
> unrelated mux value or fail with -EINVAL, preventing the Wi-Fi device
> from probing.
>
> Add the missing mode 1 entry for WF0_2G_HB6.
>
> Fixes: b44677375fee ("pinctrl: mediatek: add pinctrl support for MT7629 S=
oC")
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij
