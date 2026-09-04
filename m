Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5544EC661
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535601; cv=none; b=UQGoDTZLtsheMlcIEMhtXHdIxQn8c7V3rqwh74C3a08SmIY9cllSDTiW/tYJnCIZ0GEtp10h6e9TJo9Y+nKkukQfq5LXfnsQRbLQaeGMwpF5p4zHC6in1O8GL568V9edigUwKPfVqL7kQ+HWTUBKMFXck/gLTUo0YyRYWZ7jBZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535601; c=relaxed/simple;
	bh=qNnNX/36mqoUdlV2+0R6ltbvZcLwzDeDWBL5FNc5Cio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qh+h5efAxbRI23gwMKibs/IEgTmnY0Eu1MQw8nQQ7LuoBXg31aYmpIpUZxd3SspQ2XVHW12WShQmYanBIRfJbyt/crBK9hQBLV/2aJIe97ce0mDDAlX/kY1Xmtk0NRkhEWPtmBsLFSfuEZaESW3gWqllNcbDDeF+J05h4u7O9WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lUnilH8f; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lUnilH8f"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so141390366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788535598; x=1789140398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kxdc8UCOdo2zUrsNltwRqDpZNcgqltscYU0aNpNuXNI=;
        b=lUnilH8fqeWbVr7AFMcLyIhPLXGkTAPlq9XwM4lf/866veiBRfmZX4jmhzoYnlCN6+
         ljnCACraQE+5WnA3O3xVRRp0caU3ZuS4TABQrCACMtQ/l4RzXncxe8qY1MAZ6I/Yfufl
         F5v1xXLKbOswllszSYfXfjIpIPv/hrUssOfcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535598; x=1789140398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kxdc8UCOdo2zUrsNltwRqDpZNcgqltscYU0aNpNuXNI=;
        b=AfpSUaqKZbclMdBsByhnVGObYKSBlgbnap3RrTKZUXz2I+LSk6jLTKcJbzscI+Z1k5
         5kAVt4GMaNaW5nNFs1KNCfIs4BHZasyv/8SbHIh6VrteINq5vLRPbaevcGzi1YnflXES
         iyfRaXlZUpYZryn5raOx/8gmfWC7Ug3BLcNzGZkRAVW6yTsQ8hlA/Z+VfnRm0QHo+do0
         cxbSd9pXPSJNB4behdgC7ZH+F5BmelkclR3sfPAH7vXYosIiPUri0Y+zMYT9FRzQ55lx
         hN4s/wuYFqW6sRA/tsAmd+Uv4+xzq/lOdggmSo+RU/JmvNG+TjJO8/5CUU6/214JTnSU
         Fh5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxqx45jzPQsj6BNp6ReB6yJHvEamQ1u/2DoFt5Weix3myPfyGKRuJRbPo7uO3mZIgoO7IkVaFijxiEbAAU=@vger.kernel.org
X-Gm-Message-State: AFuF++lHQdrS+lpIa9bKsXgqrg5AsNZgPm4v5nYa0Ap1B9EjOGYI5y8+
	ztKhWo7UExCMYIyCjeyzVusAmnwu9V/HvvC8akz3tDn5mcauWr1ggTyCBYwSHkzjA+mXhuEauDG
	MfF8=
X-Gm-Gg: AYBFou1vb6D7vMB9UC8X7OikYPb1AO+iJJo5ONrAmkZWfoyyLEzu7yBBsPP/5ZDLLUr
	hw9bnzDoeAe30SZcoYXX76KEonMzs9/iZbV4/akEVwWdOM5aJwwagWWwURltrpDjQ5RP3wOrvMx
	04KMvdYBCJQ6DbNtwck2ElOVODPfVi7/haKRpjwPb/OoD1CE/xExDlQJ2dYHf+amQ0XsdyKFD7u
	ooGaiMhRUxV6mc4QnT+OvJPEtEdUBPImPANt2/3YXE1195RoIi+acjEEpktzPg7ZNSYCA6p20S6
	ThBM5sVehrBSjUnmyLU17O2yV0Ev6c8vYld8XHSbS78QDvWQN1YGJUaySTxvU9m58akxl3K7eVR
	Bt/35hdm+yXx3KlwwDnwbouj9ZsMi9rfNAvXfbnRoxLKdSFj0eggBXZlZplgGTNBJq1+ao5hWm6
	fnumz0RsQHeIwTsJT+0Qjt0jKrWxvTgKFC+Aot8Qv2JWI13rMn+U5/6ZmmLEnad/n1itVkQ1O5A
	O1Syl+ZUOnPI+NjKpAR79aoyrM=
X-Received: by 2002:a17:907:c5c5:b0:c26:19e3:e983 with SMTP id a640c23a62f3a-c2619e3ef06mr171384266b.35.1788535597634;
        Fri, 04 Sep 2026 08:26:37 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a9cbbsm126657366b.13.2026.09.04.08.26.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:26:36 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482dd6ee390so1148134f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:26:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzz3QTXvPpYY3rU+6jv20+0uZDSW/UaFWokmJOMj9HoTjfhcW7QMu1VZXyUouf8Ob9W+G9Khl+nOPlHWLU=@vger.kernel.org
X-Received: by 2002:a05:6000:471a:b0:484:3311:3176 with SMTP id
 ffacd0b85a97d-485872899a7mr10104340f8f.23.1788535593276; Fri, 04 Sep 2026
 08:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-1-f3999362a9ea@google.com>
 <87fqzp8jex.ffs@fw13> <87wlt13zj1.wl-maz@kernel.org> <87v78l6oha.ffs@fw13>
In-Reply-To: <87v78l6oha.ffs@fw13>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Sep 2026 08:26:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wdqn7UiuRy1VY-qH+JYChLTEQgmj2q6Q=FBjCZ+5eo1A@mail.gmail.com>
X-Gm-Features: AcwNN1UDO0a-WZIN6LFn5huqxNCHPkaPn__17lQp2Fu-mhl0U14skIaSjsZ2sL0
Message-ID: <CAD=FV=Wdqn7UiuRy1VY-qH+JYChLTEQgmj2q6Q=FBjCZ+5eo1A@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] genirq: Synchronize in-flight handlers during NMI teardown
To: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Mayank Rungta <mrungta@google.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 4, 2026 at 8:11=E2=80=AFAM Thomas Gleixner <tglx@kernel.org> wr=
ote:
>
> The driver change is here:
>
>    [1] https://lore.kernel.org/all/20260902-qcom-wdt-nmi-series-v3-5-f399=
9362a9ea@google.com/
>
> >  @@ -311,10 +321,25 @@ static int qcom_wdt_probe(struct platform_device=
 *pdev)
> >                if (irq < 0 && irq !=3D -ENXIO)
> >                        return irq;
> >                if (irq > 0) {
> >  -                    ret =3D devm_request_irq(dev, irq, qcom_wdt_isr, =
0,
> >  -                                           "wdt_bark", &wdt->wdd);
> >  -                    if (ret)
> >  -                            return ret;
> >  +                    wdt->irq =3D irq;
> >  +                    irq_flags =3D IRQF_PERCPU | IRQF_NOBALANCING |
> >  +                                IRQF_NO_AUTOEN | IRQF_NO_THREAD;
> >  +
> >  +                    ret =3D request_nmi(irq, qcom_wdt_isr, irq_flags,
> >  +                                      "wdt_bark", &wdt->wdd);
>
> Of course this is a regular global interrupt otherwise it couldn't be
> requested normally. So this sets IRQF_PERCPU (it has to otherwise
> request_nmi() would fail), but that looks like a hack to me.

At least on GIC, promoting a regular global interrupt to NMI (or
pseudo-NMI) level is possible, and Mayank's use case here seems
legitimate. Any suggestions you have for making this look less like a
hack are appreciated! :-)

-Doug
