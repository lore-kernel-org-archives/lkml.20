Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2387143F8D7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291965; cv=pass; b=AP9oyAQVTrlYpqoUUHShir5h+CvNJT0376nJXrjUtFPtlFCnqUTaO3VRT4Y3awkfTCH0HluPmHNufyPtw9CnYgplBwCJ4zKF8uolYNLIBox+FDwgEc5HUehukEcagOxhp1I9WWYUpGHtwefvxjTey/OUnMn6cQTaF8dT7NLWgb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291965; c=relaxed/simple;
	bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvI/YGQqVEsEqIcGbFOvioJvGgAWufu8bBDHAWs6I8APejIggqDh7+1gYxhJ7Q3ZLNrFAGJsyUSJJWGqzCjmBACNDteNAWpqb0ElluCz0tlB+4+2KCeFckgGRhDrsQ/3oSI9ZxIEmtPeIkfZaDCz7p4Sye0nEK7iW0cImDXObpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sk3/037p; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sk3/037p"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499add6348fso545e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788291959; cv=none;
        d=google.com; s=arc-20260327;
        b=YxHUi37KhRn4VfjmqPxXQ0LGtLb8I9kENvOx0lFueVbftiKM7erBZ4U3xlS2daRxj8
         ud7nnHqxeOfP4O7M1KRSU2R9Y8pGAhWgTgaEt4weBo8IKP+VbIjFYMMbcILyiEOBfPmr
         wTtjkMAJHtyXtWsM28A3N9MdkuZAhjr1bmismf7mfEcGbtSJsME0lIfSMrbEHRYwdPSn
         FYeRDaUywncQ8a4h6ngD5aBAuOguvXQqlcMlkUx/rJVa1s05gthKZZ4ofRpZO0C8YIrL
         eOFikTqJDBTjQc5ad1514wAf740n4sxqxhWIwUSxUfhStC9IMrysgpxEsxF8YkznJuuO
         XBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=;
        fh=LTm1z3v2HuNiMOzGS4O2p1taUorMJL4lQYUkbXBiUww=;
        b=iyBP525zTxkDkb6xde2NH33ub6WJPvGOgE2ejpY2oZo72owCeZ8HaTWblVK6exK/dG
         Jnr01tJ/fI8PUGJge5rJmNSnrwVOezqwXY6UGj6N20A6HEcmnV37WFYmYRtIKk2jkwbX
         MK5Mc7RFEiC+RP799JM2EXj4/xjlpsuMGfcLQgeXSXENLZ0+xphclNcqRy5nqTyEEWuX
         UToZIuPVtcahFPU545aeqxcrEpTW7P7iPOGhSntl3WSnAR+h2rcN8g9gfSOieieAotHJ
         i7TdwpSCGdFyG0XnbiEUUUzfucpWkmiupXJuH9nkMsiAbjOvUsX9nIL0ls5p9zOjwpko
         j0WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788291959; x=1788896759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=;
        b=sk3/037p1xVFHg27ePnJ4nbrMaH5KBBjVZag9Z5bfDGOpqeqJNhP5JbdVeR7Ipd6mE
         2avpRWJkiDgixErhnZScLzS24YHGzW/cODShGFUVNYBrP4nP95VvOqF6XL+uCVGlMGVM
         Lw27jJr9Le3xEkys/pjileijhD/reyFRyA4uBJQrarrO803TicIh8uPc2plsEeOdiOd3
         FKLAqnlgjyW1+HKO9TZP1s7BuWgSdzwTbpwmHKZj69fhOkKKEWaK6tEl4sl/u9vwfiDR
         FDO/Wea8ff4mwHdQJzKwOsdtnDqmrj4QJAqzBOucMVE0BN0KXZFmN+liSaiMtVwDbpai
         qcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291959; x=1788896759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=;
        b=P9sQWuxw6fvgd3RMmy0FqXmGbgnwcoF4XjZtZ5xZ9eZV+r3L8WzXz01VWRlVcJYp07
         de1+Vzu4YiwVv/LH6DPJ0frDrx9gPRVYYs07Ft4IeE87J7/Cigtl91bLaR6qS8CtXZzf
         gQeDJcAjJcrKRPqqzyBj5umnuaMbJytYA7M2/EtVKzsR/wNlUe+23l2Nqnjak+uUjZVN
         4+3nFN43FPcjUxNAdG0P3hHBI4jIPN8ezO1+lTlaAvPA+VnBVtzxv4+C/+0+heGXCpKR
         ihlxskWQl6yWdsOkq3iaz80RVcWXJM7j+2sEsnsbsAcUknRaocVnaSNJrSsanBxNNTs9
         jCjg==
X-Forwarded-Encrypted: i=1; AHgh+RpydDZsx/5GcJClbL6RZ/VS3fGpWDPOPqsbbitW5CHvHrL3JPXuWH0VR6C7Aww2PYbRFpo3ZaikMZtvZbM=@vger.kernel.org
X-Gm-Message-State: AFuF++lWOjr83oZ8BQ7kVh55hv7TJdlJ3Lz4ugBz+q1jEPGXV3vZeWz2
	aKlE8JaUZ3qfqX5uih12Fe5Maqd6XKdRVJc1ZoGtvueZA/y4gFe3/CAtq7N6RZtPxiyonRq/RMF
	Iqi5Evi63Jp44oBx3Puu+2l3zTdT8dl252BwoUTEM
X-Gm-Gg: AR+sD13ysNJvd4Nom0XT+cRoczuoMKIJKoeDvpDRYyILFsYstcTdOGfThleGAgksn3I
	jrJb8psH2g7+aKy7S0w8DSB6yxuxBXk63VeqPgQx/eghn+DvKTe+FXtoHN3j+sZmCV3wXiUeUwP
	zkzSk6Y+N8dRJxXNhJUspy357trq377FdlQqkQcXDFqkPYfu897knHf3hGqmHqUWsB/I4D2gUJV
	AaG9V5OMGfi3UWXuoOw2Tku5RlBRHOhBnnFhSQHVx6V61Mfa3y0vCmuKMzxR+OV3WAlbC0Y3Ayx
	GbQNVlcmA2P2UIa0AR61MJGDmzI7RJucODYsiuf7X1jytPspWPWNDcVJa6gK6NKCETDEoDXFzQ1
	OdQCcH2sAmKw=
X-Received: by 2002:a05:600c:6050:b0:495:7a0b:3b4a with SMTP id
 5b1f17b1804b1-49ce47dbac0mr115925e9.7.1788291958768; Tue, 01 Sep 2026
 12:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com> <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com>
In-Reply-To: <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 1 Sep 2026 12:45:21 -0700
X-Gm-Features: AcwNN1Vx40LeKlkhxLn2rqkujAMnERf5APsKIrQ9ivuoQyg-T7s82dgNrM0lw9I
Message-ID: <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 9:24=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> The sashiko-bot's comment on v5 indeed pointed out that imx5, at91 and
> omap1 might suffer from the same bug: their suspend routines are also
> fncpy()'d into SRAM without a type hash and called indirectly. They're
> all ARM, so asm/linkage.h still seems like the right place for the
> macro.
>
> Do you think these need to be fixed as part of this patch, or as
> follow-ups? I only have my one imx6 device (a Kobo Clara HD), so I'm not
> sure how to test the fixes for the others.

I think separate patches for the others should be fine.

Sami
