Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A1B469855
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200244; cv=none; b=gP4lfOxB/WbywShyOD/A/A309IyfvbezG+DRmgqWHDDHf9ci5DYVFbTASzGfN+G7ohRzxO0Ag3c6gQ9KusxWeOfy3h7MnIFUvaPzgXeGd8EbA6/n5l2sPsNz700gzONXXdorEddMIBxjYfXD8gHupGVp6sxjdtJl3p0b0/AC/6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200244; c=relaxed/simple;
	bh=3mzJyxDJT2mp+IdJIQ9y9rYao24CZqxfqF2rh8sEaCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fI3BZtxAeiTQsAA36w0o200qpP5Dg2xuPk8e5JtOxRSvtFvXwVZCLeNBBNh1VW9L916NrVLguTyuhRzWtlLl+wVtb2vzb/reBKS5Tpvh+G4gUEtMy6554NcNERirEgS3Rzj4gZy3AxsxIrU7awvjL6Lu4EikzmmnPcEcY7s9YWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hbh7I7Sh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hbh7I7Sh"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a61910369bso3687438a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788200241; x=1788805041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UH4ANZUDTinUoNy1nGt6KAwdPIsDwQv9pXQSAcw0TmU=;
        b=Hbh7I7Shb4wZfl5CNvVdmJE1GjNc61Hi8iLFII1ptxCY1ncRc1HSGPLKWrR3+NAvy8
         c7toteMk8infpn90oZsiJfCh3YG1i0wPMi5uPMEuZgP7zNRLDAhM1TobKISpeTPyNFhY
         k39w2AdZkWKfaKjMKYyceS11LDAnB4H7jDtlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200241; x=1788805041;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UH4ANZUDTinUoNy1nGt6KAwdPIsDwQv9pXQSAcw0TmU=;
        b=jmGTjQzNRo0JwOXqAWU1ni7+gxn4Fa5IGFXquqrTRzif+sFidgT3jYL5FeHj4hsuaf
         pvd+jXGn/BHKm9YKxhEzBdeKiInTP8pobCiNjgrsHwvHH+ubF8nfEHN+VI1wfcNmA8ib
         BraMyEDfGGkkDaMmo8ZOsjdqGh712RTKcqr13zZtpmP6OUcO2Zu/pzOqblZP8yu8ysql
         VcELXHReq9rrJQ9+LLRLuz6WXyVL5+MrQtxrYxAfCOoyfZI4Q9DS5TbhP02boGXqC06n
         9ATSTVqUNpFVd6uFqybk6ywKNkosuGACYBniy8L0LFcewmGF1Oowe+crUG8tG7HgETjb
         9uqw==
X-Forwarded-Encrypted: i=1; AKwUvBw1M280kZBtYZqImTAg8GCcwMNLNXqqdhCX5bRmP9hsemZEtc4bbkWTkqcjn5Xlz2HQcPUOp6eKwa/eg4s=@vger.kernel.org
X-Gm-Message-State: AFuF++kl0lSO/bX9TKPP6qBgPdSQv9cU0nPSdwqePJjoWpyZ3BfIr8xb
	Y1Sr9+FmQV0HYDBPa81gdZeTthckDKbdoluGmTcSVtOc9X0jAzwA0VRIHQOJH7KX9Tk+06xzQo4
	ELR9prglZ
X-Gm-Gg: AYBFou1rOpaDRzjSH7DAcfd6DUzg17O8TSLIf4jGcvz88hcI0AflxmyJLc7GwX5U6qq
	Sxi9qixVQTusxMY6dt4jK4u7B8sEKWI/vC5PT6sZf27LGFPocfr186dfWGS51nTWCcen3icWSnb
	ZPFxmVUMtZ+mwAEM92pF8aXI3Nc6sJ2/zZeHldc80Q7hKXSaAprs1KNoK40xzThINRhkP1CwBFR
	GBvSZcf32LtSijmdRNx2UND/EbvFfwOxa2e86OjYe0hiR0z3DJTSW91uxQ2H6j83yZ/RwQdHP3h
	d46pChu4Y/PL5e145pykLdN8ZMlLJBrClPNZ2tPsRsrW2C1vt0eTQSvbIfru2SHodhocF3zIcQq
	Lg+lvTK3O8atdrU5rLj2TDwsOmmj77Tft2MzWkTu2V/iLbvQiJgSvB3ResHqogTOJL2MEXcGB9T
	E43P9QrJiIkplp1NwR/7UQW/RFi0OB0wxr5KOSy6nsVPNzvCuNcMMP86lGwy0I59X6HufVzsK1s
	gdYpP7+zkxMigUvGHtbbEB8fBU=
X-Received: by 2002:a05:6402:505b:b0:6a3:e813:8457 with SMTP id 4fb4d7f45d1cf-6a663aa71c8mr1866779a12.12.1788200241146;
        Mon, 31 Aug 2026 11:17:21 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a64fba5c16sm1329001a12.22.2026.08.31.11.17.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:17:20 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48436251906so1850321f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:17:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwTx0ubhcthftG5Ck1lfVHe1HmL73RADKO/VxfMcRNrDe8dN+gybLXIlEs7RYyQYsnpyWXVZiYeAFcWMDE=@vger.kernel.org
X-Received: by 2002:a5d:4d09:0:b0:482:a9d7:7ced with SMTP id
 ffacd0b85a97d-48441011572mr4215421f8f.14.1788200238138; Mon, 31 Aug 2026
 11:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com> <20260828-qcom-wdt-nmi-series-v2-3-363979fe6b6b@google.com>
In-Reply-To: <20260828-qcom-wdt-nmi-series-v2-3-363979fe6b6b@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 11:17:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4NB7nBqtfVQeoubc7wjS0n2nkfez+Yyby53yO39Kz-Q@mail.gmail.com>
X-Gm-Features: AcwNN1U3FPvHmoemFs05LjwC8xqc8xl7PGyosbmesgJCRaLsNeUN_OaM3dBYevE
Message-ID: <CAD=FV=X4NB7nBqtfVQeoubc7wjS0n2nkfez+Yyby53yO39Kz-Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] genirq: Export NMI APIs
To: Mayank Rungta <mrungta@google.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 28, 2026 at 6:00=E2=80=AFPM Mayank Rungta <mrungta@google.com> =
wrote:
>
> Currently, request_nmi(), free_nmi(), enable_nmi(), disable_nmi_nosync(),
> and disable_nmi() are restricted to built-in kernel code because they are
> not exported.
>
> Export these symbols with EXPORT_SYMBOL_GPL so loadable kernel modules ca=
n
> register and manage NMIs.
>
> Assisted-by: Antigravity:gemini
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  kernel/irq/manage.c | 5 +++++
>  1 file changed, 5 insertions(+)

This is no different than v1, so you probably should have carried my
Reviewed-by tag:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Sashiko has feedback [1], but it seems to be mostly regugitating the
same feedback it had on patch #1. It also mentions that "`free_nmi()`
ignores the provided `dev_id` parameter", but (to me) that doesn't
seem like a big deal and is certainly not new.

[1] https://lore.kernel.org/all/20260829011550.ECF091F000E9@smtp.kernel.org=
/
