Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827FD44A3F3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797958; cv=pass; b=Cjo/UMMpZbq3IfenYevTolhrdxiEGbtVT26vjO/CFBBMS9lEv1fnnGHS7TTlAm5n37hrva5veOC9Q7cXuM81HUADEDwpRRFBjmsf4gOkT+ULV00d07Wa/y07ER8S5HbEb/vQ1vP6H3Jk1lr2jw3swX2gJD/W/T3+FeI7oSBib5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797958; c=relaxed/simple;
	bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMl/C33kKyFCK8qhXu7f+3/K0obn+BtBjbWDrpSWN6C/LC1sTa6wlyq3uhrv13zQF4Ophyf5nabGC41maNPbxyxdWo7O6HraPwMLAol0g1RZNUGsUv3H1SeH/rX25uJrg2m0VBSsLVw3SrLj7bTYoosRxoc3VGguc6P9mG692Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pz18freL; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pz18freL"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a9787a14ecso12108381fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797955; cv=none;
        d=google.com; s=arc-20260327;
        b=gRmL8PMTgr0HPT+dAlgIFrB+uC1nf1ULH3cTOsAz5Qm6hpPtnVvNO9Ufeft9jWinto
         6At4y8GlUOUrAeYy3glt6shz/rJlaII/L98fa7D84QEqZqRiKCMqAQjkMh/BnTHw8u3f
         byh8tzYUyTC0sysCtE1jRmAf5Tk+qbWI6rvsZ2Z1wTSqkdtyptGEAstEq1KkXxUXyFcj
         aTyhURTOS5WTR48O92RgA+Xo/kbdHsOglZ+VfMcVdGJNtfQKoMkq+JtsrWufF5sLlNMT
         A4j6z/Bm0u3vZYNqmokHUMFOHABAXNwX6E0OUTfGBtL794FpFC4eHdOFU/jSwtYCyr5E
         iKuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=;
        fh=qq5rR14vlSeh3CjKtDvrzEtuiukyuWAK5/hYghOJJkU=;
        b=IGDwmgyRiMjxp7U0cc1g8H2Nc4nVgY4p1G6Nls42PfMxWVlOGviWkUNSJoXMuLlztW
         6rcz2fQHw5M8DCWxaxSme+gh8H3VZNtA+UKWm9BcS6LS0qE0W21phkg5oCWc+NsChZWt
         I4czwqz7wJG3D8WMj0MyVIrDzmvdcR+YHNh/JCQ78hkLBoGcGZX9uGVdMFhlvRz49pjd
         ZldigIZvqWkgHxBi6CjXKuwAQ/lSCtavLdv76RVusFkJ3pb9bxoMDYF4Xv28t2GhAHIL
         f2ikLH3pnjVbsTPmPOk1hZoU86LXQ3YS/0fHgxXmEA/m+PJF4j+ljDongOHeP0CPp645
         0g6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797955; x=1792402755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=;
        b=pz18freL+kSPEzmf4DQj1W3Y2DUqnU2mXJF+ojEA+1HCSk8vFtxTgLn02thzBCiQxF
         e5I6RHea6UEr04K8HhGMQkIGvMpE7OH12vB00uAJomRSNkQN2EJbFNq5R4rF6dDf/TrF
         HMqDCVQabtzqtJgFpEVczwWXW9HRQTq0cgwTilBcWLP0zKeteI/2WOelojZM0DCeD1ml
         zkWeaGYuqsZW+3e7alAY2v+HrJ9rR1TL/e9ZE9SfZ3IlnL71Q5D6sgh1+sMIzUgLFrtY
         insx+OCYATs9SekXgqgi2Dle2HAE2Cy8HNGtJgQUmRAPOLTC8iIuBw5cArUTofHNyuh0
         RDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797955; x=1792402755;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=;
        b=E2dccN4gVEdXcFm+JnuaAX44m/qS9qba0Q7jDrUzgnukq3Uw6vKvBZGNUdmXmGiQBj
         W7CoSqI0FprwZeZPTKn/pXn1aE8j6U5clzTHlPT6kf5CRkzlqvNDH6C2dOCk6rwuh8Ox
         BYqg9JXD8AxlOuqxmLNuIY2rbc9Pm4gRYdbltib2GbEwcm0LSTTepflvILnua65S2+9M
         DthSeKrExfTgVIfbnpuWRQJstZNA3ZslOwgI0txOJmd6BMxtT0jffOQvJZ8oEF71M/h+
         p091TuBUGtWw394rjq1BS6SmfCvvRSFYcNjw94LwLplcYHAdvWsp2DVP6zcSFwaVvD2V
         bsPw==
X-Forwarded-Encrypted: i=1; AKwUvBybthYb6YnStAufKuFW7HcUlINBYzCrmzGiXvqHgR1/9A5PFOWoA4kBBEbQDjHEW4l/hS1vv3adBKPVDWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAWoNeobScAeBpL8fPBsx7YCyD/lw8JbeybGmsDd7vp7NpHV9L
	4y2j+p4h1q0iIov6p/kcIc4HnGESpoxyBoIZ3Yw5rRvgLOyWMo+I+gi0lEcG5QPs2pQENh+ljXL
	lpkC1Ah18kyUs1Pa6eF9ZG+yQPXLo6cIYlpc1
X-Gm-Gg: AYBFou2n1jg7ZeGOHyCvO9pLGYVVvn8KObaGFPuDtYLLTmMzEAYFPE2fxFaFiuv6f47
	9aEaOC9YWhar0J2jCMJN4Vy5psw4m/NIv4kqrv78MXFfxcXV4TtQbIy2XW4XdOveJnuaLJaAz9g
	f/cd1ryt4KuHYtHef4zfh6dsca7rClejnDJrYjCU4eZydWPQaNNgUDAz73j5xKdxdEIfMqzrt34
	Qlx0YcxaVPyvEriWnR60um72PGGFzdFYaFoSvDhqqWGll+GshXDDSWHTjPHQTHKufeZSrU8WJuv
	KB4KknmugdisD9HbZH7LkBj8p+DRx43pkxWIgJmicnRH2bKJhhWmiRUOZAeRvy0rtfbNfx9rGt7
	zR+0JTpt+DYwKlbFDsN3oJTOSFKuQlWRq4RLMd87bOakORRZ+pTq0KotZzTnQ9J43V/XxhHpZVv
	SuIedzb3htjzaVNld3sOkCFm+4Tp1uAeC/+USkcidf
X-Received: by 2002:a2e:a58b:0:b0:3a3:7681:6d5b with SMTP id
 38308e7fff4ca-3a9c53852a5mr24148381fa.19.1791797955285; Mon, 12 Oct 2026
 02:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-9-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-9-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:38:37 +0300
X-Gm-Features: AclHuK-Z5wvwMJRFMQw1kYvrinOCHaZjgXVZjShRyJvcSKeeEwPjXo7VOTJgmQg
Message-ID: <CAHp75VcktnQVpqLADs5AccUj6U7KLjAatPaSzMX8SXDrbbs6Ng@mail.gmail.com>
Subject: Re: [PATCH v6 09/13] gpio: mxc: use cleanup guard for
 pm_runtime_get_noresume() balance
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> pm_runtime_get_noresume() in probe must be balanced by
> pm_runtime_put_noidle() on error paths, or pm_runtime_put_autosuspend()
> on success. devm_pm_runtime_get_noresume() cannot be used here because
> its devres action (pm_runtime_put_noidle()) would fire on unbind in
> addition to the success-path pm_runtime_put_autosuspend(), causing a
> usage counter underflow.
>
> Use a __free guard to automatically call pm_runtime_put_noidle() on
> error paths, and disarm it with no_free_ptr() before the success-path
> pm_runtime_put_autosuspend().

...

> +DEFINE_FREE(pm_runtime_put_noidle, struct device *, if (_T) pm_runtime_p=
ut_noidle(_T))

Please, split this to a separate patch and move it directly to pm_runtime.h=
.

--=20
With Best Regards,
Andy Shevchenko
