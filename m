Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC8634EF04
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469116; cv=pass; b=VaYgs5Xgn5kgyq94PkENO9TkDeO3UfW40wdiukR1Jn+R+W7qqXRrzV4PBxSTIlRb4yCaNbDNcaYwQUFHFGKZgPQHA/NYL3dSRiHhUsduq29fG6IWOWDG5VWbzkDTVLUMHCv4nggQQiNf+vzWqmBRNowJCRQ93WGLxWAPYDhyQ7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469116; c=relaxed/simple;
	bh=IzJt2StCxj6QlvTFqzNu7kT6yZRtUyvQ+pq8S6TGhxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=retg/b9Zaf4hXFDRDFfTs4pCpia/PU+/e+/j365hX7GR644pzDLoNJg02ndaxKKI4r1PMCW+9l6jJOzJlpGPBHOXLKDIa0e4wsg8TrK8MJfhGq78EHykOeNrDLegs/KQ/yD1eu0AZiUr8voeKfPvo4pVuEitYCZmqs8c0kkeYX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QEzjo7Q0; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QEzjo7Q0"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4b5b727be96so231183b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788469103; cv=none;
        d=google.com; s=arc-20260327;
        b=sVYTp+C4dUYhNMEBivaEdcxuhl4SpUKfxdpB+KDVUcAjNvmcK32CGZOTL0/hJA4viW
         1/tQ+r2xIcarT7xEBOX9w1TX48yPytMmsMcMo9cVIYZKsxUYHOvpRNchAlYejJoFndLd
         vv69XTO00W4pkSkQEhosP+SQEjFt3de5XaZWY1gEbtYyCHRHGkLD3jijC691nNAAKWgK
         oGaQeIdJZ8DHOcSC1Yq+FJIvGAKmF5J7V4U0gjlAfvhgN2JvdbqRHH72zBNnXYiOelKH
         L87KE92RI3mmuJtGcbwaZ+xSKhLcvX44kQN9mf+Z7MamEOTx1JdfkgeoU9xO1+XnxFLL
         uhHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Kbk7DKrDKm1y0joI7y1zmZ6F6FvHdjLhRqiyG6EvJgI=;
        fh=czMWtBBUwZAiV/GNq0tbG+jj0PnosA91Chf/36gOXhg=;
        b=ChgXb1V+Y9dvcp5yoLaxCy/bwz3zkCbfM44osNWBy0QYBPPVRRGBhe2bUS+kbHXhNS
         FkKfb/HEwVIs2SBK4L7H7ZvdzFiHp9t0RP2RBmfq8koqF/NmLtqXdHRP3od6LhZF/SPV
         PRTVaQVugjg2wHFiUMBwLLwtOJ2XAHVUsYHJpjLTwWaoCUYPkvtJTeIx8fwxcjLHhZHm
         8n9ck9XuDc8elqN5jbSxieI1F6Ulyyqj4mGCTWFejOcq5ZQ1NEsK+1H4ABt1ek4vH3dL
         4gvu5Hk3k99FHh6eXcbb+EpB97CmGP1eUjk77kbHumCY2PCBEC3/g9LVymSOY601UuqH
         ANUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788469103; x=1789073903; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kbk7DKrDKm1y0joI7y1zmZ6F6FvHdjLhRqiyG6EvJgI=;
        b=QEzjo7Q0AhP7JYdhrIHgLrTvkel/W7Q0FBtz6OzDPQmwAPESyHY30UdT1y2jgVAlie
         onwxoJk35kL66Vd0Y8kMDhomV3FzC9Tg2WinCImkIlznjnv6LicaqJulA1B1nlfdZDsM
         3W+bGK8DFZdx3LayCmhHGUA3G88l+rC6SYuG4sVRb57rE8jFR8H4IiOvLDbzliJs499Q
         eHp8LOqjaeQl3WLGpZI6waJQlkecu4mI33BtLTdXs1zLALXD1TGXGvlQhEIKRk2sdIAb
         aOA+7tkePxRuQEmeiex1iCaLwgmrhfq8zel2qtFpf7WCk5al1yEFyBpi8IKnkxkWqHlF
         EGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788469103; x=1789073903;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kbk7DKrDKm1y0joI7y1zmZ6F6FvHdjLhRqiyG6EvJgI=;
        b=OP3j+DVAr98ysEEPeSzxSLe930cJzTIqnOicLZb/fuSaez1/5tHe8w18deN4sU1L/z
         VHPDrKgsrP1JZx3nMyhrTO3uIbNLStSQ0pW2e+DqPHajoPx7Hj9OugGdzCMf4UCdkIUI
         tx7mPSv6snFtVkmyUZU+RFxDbV9PlclOunyT/s1b/3HRv658vGxmMODWZDLtNhpp48gk
         xQME1KZdo85Hc2bZ/IsS2wm1hq1ltCkLZRniXH5UQywy1z47qhms7fcgjZz0EAB8TmlM
         L5QVOmn2QK4uSeEoHO6Xcl+jVTu2XEPWSel6zfi+c0Bs8k2XXW7J2GE6wHucvDsHXmfe
         SHbg==
X-Forwarded-Encrypted: i=1; AKwUvBxMn7X7kkLymcZ3B9N+w2qOkX+QsM3fbl7OTU8KKOH9XlmKa2pxYezKVTU7DGsoXlmxMKKAenTNJUaa1wM=@vger.kernel.org
X-Gm-Message-State: AFuF++kNsI0RWEs9yoKlDPkFAjcUE8aW7424d2igdHSWR8FWCE87/1+w
	Zv4I+9+ev8peywiDA13hXknDoxHHs0np7bRzgTFzQBBODLTFT0yizkZNlxjc4QQN/Sf9kQ3mHKa
	6cSm8aQhQl/B8llH1YFzfHLDct9NjpL6tnPhNNyMo
X-Gm-Gg: AYBFou1OiAF7mwrenvzQvMZ3Wfzi/4tQOGLZIs6n5zwLLGa+ndWd/hd/ZoUIfnEZFBA
	9yD00q190lMrZDVsc9hHVSO9Q2lZvlQ4HeArjemuP1oc7PaltNabuRMTTchJQi/Drn5J/a4Y9rH
	/ief8a1/DYZhW7sD3xlCzSP0NC+jPEHFNybHnyfA+XImVlDClVozvGPBGgl8j9qyZk04y10ItJq
	eZEGs5BfzxD60IRgDoa66Jqto1n25YlUj0tBCHz2zMbY+F8oE+P/SLFykd60esnhQ4Ghazb7H/F
	tHpADQhPRqlatltmU03YtvflKLRcABaSsCBuUuuoE9NZTAPifwkORn9MyJN+lob8hfdQib2sv/Q
	=
X-Received: by 2002:a05:6820:179b:b0:6b3:5475:4930 with SMTP id
 006d021491bc7-6b6fc9d05e0mr1462817eaf.21.1788469102528; Thu, 03 Sep 2026
 13:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-5-f3999362a9ea@google.com> <3de593de-6851-4a53-8309-a6bf13e9a8f7@oss.qualcomm.com>
In-Reply-To: <3de593de-6851-4a53-8309-a6bf13e9a8f7@oss.qualcomm.com>
From: Mayank Rungta <mrungta@google.com>
Date: Thu, 3 Sep 2026 13:58:10 -0700
X-Gm-Features: AcwNN1Wh4m9a6562DkcKps1tteFgxiKlf9013OvI175-psCFacunCQ9tfiMPwL4
Message-ID: <CABz7rdBv74pZe6jDRifTKRAKzGZB6L08n81_0gCqF0g=s+FEcw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] watchdog: qcom: Register pretimeout interrupt as NMI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>, Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

> > When a system is completely unresponsive due to an interrupt storm or
> > deadlocked CPU cores with standard interrupts disabled, a standard
> > watchdog pretimeout bark interrupt will fail to execute, preventing the
> > pretimeout governor from capturing CPU backtraces before the hardware
> > reset bite.
>
> [...]
>
> > -                     ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
> > -                                            "wdt_bark", &wdt->wdd);
> > -                     if (ret)
> > -                             return ret;
> > +                     wdt->irq = irq;
> > +                     irq_flags = IRQF_PERCPU | IRQF_NOBALANCING |
> > +                                 IRQF_NO_AUTOEN | IRQF_NO_THREAD;
> > +
> > +                     ret = request_nmi(irq, qcom_wdt_isr, irq_flags,
> > +                                       "wdt_bark", &wdt->wdd);
> > +                     if (ret) {
> > +                             /* Fallback to normal interrupt if NMI not supported */
> > +                             ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
> > +                                                    "wdt_bark", &wdt->wdd);
>
> GPT noticed this IRQ is requested but never enabled (NO_AUTOEN)

For the NMI path: request_nmi() requires IRQF_NO_AUTOEN. To balance
this, enable_nmi(irq) is called immediately upon successful
registration in the probe function:

For the IRQ fallback: devm_request_irq() passes 0 (not irq_flags). In
__setup_irq(), when IRQF_NO_AUTOEN is absent, the core calls
irq_startup(), automatically enabling the interrupt line as it has
always done in mainline.

Both paths are therefore enabled upon probe.

Thanks,
Mayank
