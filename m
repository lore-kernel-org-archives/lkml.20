Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657D1483837
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524554; cv=none; b=ft8zwlSWf1bUZjiZmjJde7avOxEcJpP2cEl1Cec77mG0djoNX7GGjiTIUS9qWlQyoi/VIkI4j7oR19W2eFO2CFpm8ERNfBeT9MVitZ45++jyIqE1D517r6epo+q30XusS4ehjByS0jsq4ttIlMNstX6lH0OjDQbs+EFq21Y2hy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524554; c=relaxed/simple;
	bh=vjaQgjeSeDSWekFLIKX6/r8ecgd8zwyE1GwfTXL4Nb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/IPL/N+x+V8xR/vS3u5tgZt2eTY0Im0bY+sqVvvd7abcIb2/IG+agIL9GZCNDRyvLVyhcTUTb5PA6o+BRna6I11Z43o4Xj9PHW0xV0VxFNgkVtuvvIbj8t9Ra85fYv9RGM+DPl3p6QkoA6Fpi6/2yEQIcUFF+SBP7u7XNxdsXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso410927e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524552; x=1789129352;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1mDtuYgjcDY/xg58xIH9H2reGhfYioaWqgEAldYn7pM=;
        b=WIGxNNQPpvTzHbmPfAnKri1ALQwJJ7ZV2mO8Yh7Wf40raZy34LgKfXFrGV5QUbvDEW
         AHOLIgl+MxiJhBQbq1/QGDenQhBX5XcdELhJBciXa0lEYcJSQ8AEhAoy1vL5k8lLjipk
         j3h0N955FcZZsxkyGrGYIVZee48RCamFGcHmw2r6Z37JHfAva4KaUyiGVxBChlYksl0u
         ya5QKX0juE25jikBWk0T6zlvdl2qWtoHxbc85J9AQNqWfYe6U1RCaGH0PrRbRJLjBRif
         oB0uTlJxvITYa4qj/HlK8alktqgNoKKrriqIUqci+B5QpU/YoeaKVbqZKXjaDcgAdZ5h
         Plsw==
X-Forwarded-Encrypted: i=1; AKwUvBys/TKcy5+wO1ZFVhDjjXIdcngGDMplBTyk84ZysQakln2jOOJXyi/MguD4l8yTvCREor0ccdcBwj/+U9o=@vger.kernel.org
X-Gm-Message-State: AFuF++kPhAAoq1qW05GYxpF4Glxm3MDcI7RUIvlfm65+zOsEIHS7Ecbr
	tLx3mb5QSEFw4pO55/Sk58IwWoFhfDpw9Udu2V/yXwUTw7K/r70zUEFB7aes2uWce30=
X-Gm-Gg: AYBFou3Vc5bxOespXpySdj8temYSSBklI+SyK7buR+BZuIzIv27v90Q16KaObLfms/h
	2eOmM5WV3ugC5SCDAUaD1wDiTvbz3jQYxJ8x4wZ+o8xoP5J+gqG9+Dtr7i++iQwSn9mmyLQgg7x
	wxADei+oe44fK/hysVF9iGYlIi8bXksRZH7isiqgch1LyHXTinshEO/ZiCGoeAJUz3pRxiKF3Ym
	ZrD7fXfA5Aj/xXOJoelFloZbHJxV3KtPsSIvVZZnjfqvryRCOSFlWEuC8k+Gd7BpoYYk68QhrPY
	U7Yyy5qmf6uR9zja7BjETi6ZVvvF/ab/VGxzzhupjUNiGPV+DOi0c3WjoWeS5rEhgqZEpIE9lmw
	RJ7XjYbinBYbAqPqOKdqGf7WMJU4/49C2aQyxusmptf7VtGDDBfweDWt0MDDVMhFRTL0FMiVDYb
	PyRX13lRRQOzOAImaPPL8lxWGVLlhyOOjTgHIfnPkBltP03PPnyi6KE/cehsmwJzjr3jUhmdxGl
	mnQF6XOyfKG1dd2wV5arDgkVMC3HKrsKvYxwA==
X-Received: by 2002:a05:6122:179b:b0:5c7:b165:7057 with SMTP id 71dfb90a1353d-5c7ed3cf5eamr2254800e0c.5.1788524552032;
        Fri, 04 Sep 2026 05:22:32 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1eeaf3sm1940152e0c.6.2026.09.04.05.22.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 05:22:30 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97cc20c05d3so296924241.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:22:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxOAwoDcI/99Mn3/Xzd+F+Q/4w6R7WBC9ppVNLPyzui4w5g/VInoZSzrgvganxgdu07DBCpx1FjzMeJMf0=@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:785:d308:cc0a with SMTP id
 ada2fe7eead31-78a4a91077bmr1483195137.9.1788524549478; Fri, 04 Sep 2026
 05:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-2-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-2-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 14:22:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZ_X6rHoC5jjCRv1d5OT+YdCibKu_S3Ni++=Mow2_Efw@mail.gmail.com>
X-Gm-Features: AcwNN1VOyxrsSm03PmZn55Uovue1s6XEkpvSES0-J6cXzlUAe5_K8yXLbqCQsDU
Message-ID: <CAMuHMdVZ_X6rHoC5jjCRv1d5OT+YdCibKu_S3Ni++=Mow2_Efw@mail.gmail.com>
Subject: Re: [PATCH v8 02/11] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Allow input-/output-disable
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> The list of allowed pinconf properties already includes input-enable and
> output-enable, but omits their -disable counterparts.
>
> Each pair controls the same bit. Where enable (set) is supported so is
> disable (clear).
>
> Add input-disable and output-disable to the list.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
