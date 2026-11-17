Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924285;
	b=KchfLYlyQtdJLTmB5yQ9Vr3WyM4+hWxIDrcS9eWsU44c1x1WgPwlohBUdsCajAFiQGbB
	 GKg13cMG+aJteyKeSZbCEioIh+Hmk46EeLdl6lRDlXS8OSSsEXw/VaocGb9iwGc1k+9r+
	 UYW+46xL0NYNRfUyKN5LDdHymStEQTjM68BxcZ6qyWdL/Fa+S4ZOcG+eLbkQHuy6Jryy3
	 q5gtOY0YluDCDIEbNjR7CqYJb+DcFj/zjCGicSm4+oD8wlJUTfVLzHrTpImmhVbKB7iMr
	 vjOJt7JaXTERkZ/jefrbD/6ONij8yGfbk4X21+XxtRafdRbBUJEgyXuOrgVjbnGRQzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924285;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Di6JFSgONXMtekzeBFRp4JLMTgABYf/4Sm0sPnWs7is=;
	b=0CTW8rZvcd9DZzmNk9N23dFEqyzpoNbTJ7e3dREVSkT0Ntl0ObKAwRX/7lYGZ9RFQW1c
	 QnPZbizIsAAeHntFVXHhPzO/ymo8ENCOrt4ClpD72nrHukQ4rA7bVK+vHX8HhH+e9fPoJ
	 oQBjVPkWOPgspMVtMBrMlloWUcTHWL7lTBVyWhwCAGr5Abd57YuXUi+AOvU9UNCDIufiv
	 hBjupZoY3sOF03HmSH7b7zRZNpYmWFqtq7ysfpRY8TgOhBz6yuIlMIStGwh9XRgAr/XWO
	 lXzaAPQBknd8hF+Acvq+v6CIBm0AFwukqCSMmQC5WnvNoa2T/ZRwG1PZdg2UGQA9xOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BVXWlR/A";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2241606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BVXWlR/A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792D91F000D0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924285;
	bh=Di6JFSgONXMtekzeBFRp4JLMTgABYf/4Sm0sPnWs7is=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BVXWlR/ABsnEeX0s/yKg5eSrHIUdZAwwuGEzZz0aF9nu1fwizuE5okDC1t0bG9W9X
	 o82WfE82VfVmYOr5g6tkEabL8iwVpsp3aaVFMCp4QU17B7nvrrIPJiwsFsuCyMMS0l
	 07A9TdwNvIWcgQcGzvVmjtYDCbQbY4btRxfwsF/D97tLU9cfRozPbBHm8de9VnZ6Eg
	 YJ9UFGeB3fDCq6fPsdmYlCHaxHrx6oi+ePFLOk8N8W3ay+wHYOv2fQFZ9gdddKHMQa
	 JUasTs0XH5I6VzXJWF+fjpkZ0YpfWUCS7kXnjmR2avG2u8u7rOzcGnvQqdkpSwXuil
	 l4y7FhzF+zzFA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c08539c827so3660624e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:04:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEW1MGgM8Cdmu2Y5/21eZx1Mv48NBjLD/28ioNcl4Cmtw1p1csijV6QeRFBl11xN4NQ23mdKV+jTlby9r0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XDHkZnrA9CFj7gDDnagmzQeiDHgCK25yPMjXV806MbuNio4Oq
	p2TN5ewfejNufo1bIBGSDJBD0I3UwljAaEMKV2mt5GgW/fAxNAVe+8P5jHt9woGQbBziwP+pLnQ
	hoGtenr3utgvN5YdoKLh8WMsN4evoncc=
X-Received: by 2002:a05:6512:3187:b0:5bf:f2ec:452a with SMTP id
 2adb3069b0e04-5c170774d54mr5047945e87.33.1794924284193; Tue, 17 Nov 2026
 06:04:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <tencent_B4F504456790E8BA3C4EAB80F4BFB6954E08@qq.com> <tencent_D8A4B6EE90931660EB6F586543FD58110E06@qq.com>
In-Reply-To: <tencent_D8A4B6EE90931660EB6F586543FD58110E06@qq.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 15:04:31 +0100
X-Gmail-Original-Message-ID: <CAD++jL=MDR1tHkKN18pN0cedDMjAyDExr0PHxa6rv_hR0-qbhA@mail.gmail.com>
X-Gm-Features: Aa3M54r6pEigKZfzJX1-qA9TZdTOYvDiX-BZ5dtOgDgC-_AJ1Iuv-Wjm-gRz0_Q
Message-ID: <CAD++jL=MDR1tHkKN18pN0cedDMjAyDExr0PHxa6rv_hR0-qbhA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: omap: handle debounce clock preparation failure
To: Jiawen Liu <1298662399@qq.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andreas Kemnade <andreas@kemnade.info>, Dan Carpenter <error27@gmail.com>, 
	Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, Matti Vaittinen <mazziesaccount@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 2:42=E2=80=AFPM Jiawen Liu <1298662399@qq.com> wrote=
:

> omap_gpio_probe() ignores the return value of clk_prepare() for the
> debounce clock. If preparation fails, the driver still treats debounce as
> available and may use or unprepare a clock that was not prepared.
>
> Use devm_clk_get_prepared() and disable debounce if the clock cannot be
> obtained or prepared. This keeps the existing behavior for clock lookup
> failures. Remove both manual clk_unprepare() calls because the managed
> clock is released on probe failure and device removal.
>
> An earlier managed-clock conversion was dropped after a reported boot
> failure. A follow-up removing the two manual unprepare calls was reported
> to restore boot. This change also removes those calls.
> Built gpio-omap.o with ARM multi_v7_defconfig and Clang 19; the current
> patch has not been tested on OMAP hardware.
>
> The original report was generated using BMC-Agent; source review and
> maintainer feedback informed this revision.
>
> Fixes: 5d9452e7c52a ("gpio: omap: fix clk_prepare/unprepare usage")
> Suggested-by: Andreas Kemnade <andreas@kemnade.info>
> Link: https://lore.kernel.org/r/tencent_B4F504456790E8BA3C4EAB80F4BFB6954=
E08@qq.com
> Link: https://lkml.rescloud.iu.edu/hypermail/linux/kernel/2412.2/00414.ht=
ml
> Signed-off-by: Jiawen Liu <1298662399@qq.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
