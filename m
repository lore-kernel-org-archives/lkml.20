Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC3B4FECE4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057554; cv=none; b=c76/qjCxNmcjD9G5lX7g1g/seO2pVbX1KTEF9rG7lMWr77NkwxYkjxRiEKLIj7DHykdiF0tKJ5+0V8J0lv7O9khKonDlv8GnhS3Nm9QQru/DrK4SS5lsIMrsZXCUH2wtS/TjSWxHrMz4+tMN5g9J1/ipjgt8Yg1YHbHyexlnuV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057554; c=relaxed/simple;
	bh=bf/9IynU/TZAaugNj8YxcWTY0Uypv7i19g+dA1h42KU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EeuVJWwlr2ImNFyFbGDPPfpDJW1jjAvpRIPjlXNMl0TsnYmLu+g4XYlg+L75isNOdihQaT7UjyxH3pKNuoYWmzEu6ofTTmZd/3sPmdhFBMKYfPWCLHfyBayPh+e2bhWM7Sj2RGTfbuG3bXr5fB+E8rTKH7dXf2urCt22rQKxnXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FC3sU3dv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FC3sU3dv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A229D1F000C6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057551;
	bh=iylgp2BXr6VBsamWkgBFHhiY7im1bWdJuQM7qpur38w=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=FC3sU3dvP/MwaaIMC8rkbDaEMTD60n7Xhme0u7Kc5eTBCR2++BftO10xGrTGnQ46/
	 pmEmpKJXPgsFV+V7WUdGjt82t3yUjoCUlURKDzVZ114bEpt41Bwzh3iRD7ulLbuEA3
	 wLPVJUR+/av3RPPqNlLmqI/9YsxVCFW4fWZSm2C1LDgV0nsuACcYLJxW7iz6fs6429
	 Q87DoM9Hm3Hm5z3XTMO4+cmV1r+815E06jMsFK0ZojwSR5C+zVYhxHScK0cxmW/PhF
	 lJIMKOi7HWLR99cQFp6ZsVNeoY+zS/t+RsDJI/Z7lsBCKQ3mdYomdPyZ7f4+rk80x8
	 MQ54/RTqYiiqQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso4569218e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:45:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwi1e5jo+hSBkHjUEimrUepKnR+SaF3f+w4LjR8++pyE3yf3iouLMcLZMNnQ7td7R1L6Zhc875q/N4MKTA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBGfnnmuz7aF46jqXbA6PQvVVWFBhSRnNSPhqN4EJdeiVaf7LU
	JNy2jzSjfleKsaj5vjNhIlx//BdLxvrIHvly7QFIhdScxahlFdfYQ1m+ob9wGfNmnGvZ2RJP9PW
	XDQcJ6/W6qtkIg94XETAoFujAa74an9yAxTsZ/+cPAw==
X-Received: by 2002:a05:6512:110a:b0:5ba:4400:6316 with SMTP id
 2adb3069b0e04-5bcde6b3f84mr6589387e87.20.1792057550392; Thu, 15 Oct 2026
 02:45:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 05:45:48 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 05:45:48 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261009165710.1320233-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261009165710.1320233-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Thu, 15 Oct 2026 05:45:48 -0400
X-Gmail-Original-Message-ID: <CAMRc=Met2DuvMz4fZjSn4as56uaKaN4K3Nt_ub=4BjaLQe5nmw@mail.gmail.com>
X-Gm-Features: AclHuK_DRoTvQqNGSxxO90EJCwyosChwhDZVil4bDqYqpp-rSmgf6B3X4m6KzF0
Message-ID: <CAMRc=Met2DuvMz4fZjSn4as56uaKaN4K3Nt_ub=4BjaLQe5nmw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY
 for RZ/V2H and RZ/V2N
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Oct 2026 18:57:10 +0200, Prabhakar <prabhakar.csengg@gmail.com> said:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/V2H and RZ/V2N SYSC drivers register auxiliary devices for
> power sequencing, which require the pwrseq-renesas-pwrrdy driver to bind
> to them.
>
> Select POWER_SEQUENCING and POWER_SEQUENCING_RENESAS_PWRRDY from the
> RZ/V2H and RZ/V2N SYSC configurations so the power sequencer driver is
> built whenever SYSC support for these SoCs is enabled.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - No change
> ---
>  drivers/soc/renesas/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index b7abca4559df..32cd0d9c8758 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -517,9 +517,13 @@ config SYS_R9A09G047
>  config SYS_R9A09G056
>  	bool "Renesas System controller support for R9A09G056 (RZ/V2N)" if COMPILE_TEST
>  	select SYSC_RZ
> +	select POWER_SEQUENCING

That's implied by the symbol below though?

Bart

> +	select POWER_SEQUENCING_RENESAS_PWRRDY
>
>  config SYS_R9A09G057
>  	bool "Renesas System controller support for R9A09G057 (RZ/V2H)" if COMPILE_TEST
>  	select SYSC_RZ
> +	select POWER_SEQUENCING
> +	select POWER_SEQUENCING_RENESAS_PWRRDY
>
>  endif # SOC_RENESAS
> --
> 2.55.0
>
>
