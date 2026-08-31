Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9A73A9871
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200258; cv=none; b=Rqsj+Upro1UiHBfLL9gHvFkZA0GHtcyD2wVEImyQEATn9BjzsxMPdWNhcrMH34TbarhrY2pP6cGhsAEIz0aArJkn63V4WJ4c5qQNfxuFR2XR/9IRqw9lmznPSVHC/FXeElRX9nrV0oofBHfhL++KRWafAh0B3vlQiDDYB3L9zuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200258; c=relaxed/simple;
	bh=PEP7TQkxkQfuISukWgXVA7v768GBhFcwG9ByxxIj2Tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JvX8uPrprwgxxQdk5Tzo1wYHRQv+z47Veb3dn7vRgEHSX4Ir8VIDanl3aun1nWY6qADwtSga59vg8zp3k0yVhEjhVCwPxH85/2ZmEv5Ng5UowEWapZ2KP5CQbXDTMKRxke7gWzzZ6revqhszyX7Nn349bpumuV8S1JrpDSzpKAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Sl4wGx0/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Sl4wGx0/"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a63667b78aso3386429a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788200255; x=1788805055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yxans2cK+wuOhbWrIk6+cKJw70uQ8kduizE4DCZb2gc=;
        b=Sl4wGx0/lbZy3L+7soMEZjN8FsxeKbgQuIJ7KWnM99uiXCB2PYwo7xCX+BbHQfI9R5
         nj+TVZA8zP02afo2fWX+YQtyBJJvr1c+lOuOqB+Q20xfw3ozlahSOSl0bvRy4CqUwPpm
         lqrVppHzRxHpztX8RMZLhqrIxpzNVPREH2khc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200255; x=1788805055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yxans2cK+wuOhbWrIk6+cKJw70uQ8kduizE4DCZb2gc=;
        b=GNTF0JoJlXJblRAeRViyGOKtF7Frq8vbJMU4gpAvG8bfLsfCrwMv/G0fEbkZcDb3cM
         07sQnkw6BBO28H1keYvpEVfjLdU+drkweQYHINi/NlAnx+7zfq5sCXkx3XG7wfFcxQiN
         bVASi+gLk4DqEXG1toOgNwLGnBtSE7I90FYWJ3fo3Zl+yKPfb9Cnl/99uozx4cwSewV5
         TP6oEKcT56PgVcXB/ae75XhkkbrI0Rqi967UBxfe+ypb6QZIKI7Ot7PgysKtfMVj+sZo
         i8K8EOXUBTJWBhPsC+Z/hlFrzvXA464cVdGpYjUgYR898ugkvGi4i5hkNR0Lx7y4Xv6v
         c9cA==
X-Forwarded-Encrypted: i=1; AKwUvByvaUH2bfGZ9VBCX3Amtc5fLrLGXtcOL0Jdw4N+2oIKtG/EzVFQ77LDtx1gQ7/kWPYVhxTltn0uZenoIDA=@vger.kernel.org
X-Gm-Message-State: AFuF++keg37NRDWExYc7UghNGGmu77iYA6bINHthhkjtTWuAxBAmlxo6
	v+N429157gamT0ki1TSTjdqgnkMGRWRJFBJwHKiBRWSBzO+n90LakJnd3c7lTHd6VJVYE56y42P
	z1S4cxs7D
X-Gm-Gg: AYBFou2FLbftgCypclGY+zI3uJ2G94NPnJyjOT+dwiet7iBxIFPgaO1W8+4lkCNYZyB
	9Fd19Kka3wIeeVFDCwtSBsxoOC3PzUS+cKxIXlcUpc4NuIoJpT6HAnKVuWMBY7AiJYNyNiuOJrK
	jMxpZeI9ibh3mJpoYvWbvtRU88XUAP+tJJttCAsTM/O6dXvsTWFqIhEPZJtSxyV6f1MjiQHUfWj
	+IA4IY5Y385NXZY1HQDet1ih4SbkCPSmjMpiPYaZK58CJFrSIgBCQxi6aMc2Nvuwd80isP9bgbh
	Y8uJSqw8Qvx+k/EaF9WbLUe8KnGdoiRkBRpKIiBqBXD34umA4J0Bai1LRRaHRk0loYEHuJX08Wx
	2EzFF7a10T/MZ/PfvR1zs0pigdlyKTaqv+J0ce3Iz70gAcj6Zh9s5Ui/tiAFxWYQ44xlI1X23t3
	Zs0XZtPGclsUPB+uxBODbDl0TxQxKkzVq5BctU2Pyq9uDdr31wHqFKEHat0T6f5ARYcx6St9oZi
	RQiLFxeLb8iPTdQmfbYFgiyXd8=
X-Received: by 2002:a05:6402:5111:b0:6a6:32f5:ff3e with SMTP id 4fb4d7f45d1cf-6a632f6015dmr9100295a12.18.1788200255100;
        Mon, 31 Aug 2026 11:17:35 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1facbcsm466356566b.44.2026.08.31.11.17.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:17:34 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so45034865e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:17:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqz0BTaRUl4yoM2U1ieXNFAM7bxQMYk7bnRfYzDQjMDZW1tPQ/toXOoU3+mmxB1ZkFzR+MJTRx92I8Hgro=@vger.kernel.org
X-Received: by 2002:a05:600c:a03:b0:499:a8bd:1930 with SMTP id
 5b1f17b1804b1-49b91c20ba0mr403578475e9.5.1788200252252; Mon, 31 Aug 2026
 11:17:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com> <20260828-qcom-wdt-nmi-series-v2-5-363979fe6b6b@google.com>
In-Reply-To: <20260828-qcom-wdt-nmi-series-v2-5-363979fe6b6b@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 11:17:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UkprU5wLANHrRYmHLmX4UVg-1UW6VRzswv-imF2GeEpQ@mail.gmail.com>
X-Gm-Features: AcwNN1WgqYHz9yO5Zn6x_Khshnq2JOY9-1BnUBhOPILjjyGKtsa4_xEbIIkQ6bw
Message-ID: <CAD=FV=UkprU5wLANHrRYmHLmX4UVg-1UW6VRzswv-imF2GeEpQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] watchdog: qcom: Register pretimeout interrupt as NMI
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
> When a system is completely unresponsive due to an interrupt storm or
> deadlocked CPU cores with standard interrupts disabled, a standard
> watchdog pretimeout bark interrupt will fail to execute, preventing the
> pretimeout governor from capturing CPU backtraces before the hardware
> reset bite.
>
> Attempt to request the Qualcomm watchdog pretimeout bark interrupt as an
> NMI (or pseudo-NMI) using request_nmi(). If NMI registration is not
> supported on the platform (e.g. pseudo-NMIs are disabled), gracefully
> fall back to a standard interrupt via devm_request_irq().
>
> When NMI is used, register a devres cleanup action to free the NMI upon
> driver unbind, and use enable_nmi() and disable_nmi() during start and
> stop.
>
> Assisted-by: Antigravity:gemini
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  drivers/watchdog/qcom-wdt.c | 52 +++++++++++++++++++++++++++++++++++++++=
++----
>  1 file changed, 48 insertions(+), 4 deletions(-)

Sashiko had some feedback here [1]. I think the right resolution is to
not try to enable/disable the NMI when the watchdog is
enabled/disabled, just like we do for normal IRQs.

For NMIs:
* We're forced to start out in "disabled" state (NOAUTOEN).
* We're forced to disable before we free or we get a WARN_ON.

None of those are really problems, though. After we request the NMI,
there's no problem enabling it right away, is there? Then, if we do
that, we can make qcom_wdt_free_nmi() unconditionally call
disable_nmi() before calling free_nmi(). Now everything is nice and
symmetric and simpler.

[1] https://lore.kernel.org/all/20260829011545.3873A1F000E9@smtp.kernel.org=
/


-Doug
