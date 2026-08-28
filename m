Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB353B5306
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950255; cv=pass; b=RxMhCrXu5MXXbccwkXyZOgYTAEL4PEkmX0czrDnn8QyjZIgdhxDF8S2M7734FjpA9y6pk9L3iLJdkfU9Ucac49KGjlVvGMXB9QyIwmj94aF2+pJEPD2alnAYDMfAP+/F29SJwJusuvX56BNX4Df1sbWgkStrwaJ5X1qbRrhxptk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950255; c=relaxed/simple;
	bh=DZ/xG6lf3TV658IbkqgJtug/TnD1W4FxX/TVgttLamo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f9tirmlN4JOTOr1c8r1EVghyXxWb+nO6yj9doJUt2EIvKlG0nR1ARxwQAtqWDS295qI/VC/xmFoMoi+dQrIzj7JHp7NV8pnBlyMmc1lVOr6pdpUEjHja3hdeygDLWIdXuXSzldtwW63YIC5JlJL8OR+Wlm6U6n7SJwxSnLrw6oA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K5FgN2ZF; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K5FgN2ZF"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499add6348fso3445e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787950252; cv=none;
        d=google.com; s=arc-20260327;
        b=pN9k1WcbsdmJ3QA9QO4l0eFTNtg2LkQo+Han4VL3nRyg4be9iCaR/Im17rIk75XVtz
         CEl6SmRh010WIv/VtR+aTLCFm4fBDmMzAyh+Zfuqz7xX4poodhI1T6n8jNmG3Bs7iYOi
         j1RDD+sBvlDpsDrYtTyHG1EG9pWbjcsGfLL8/NXqRAlxpySfNb3Dq/1U+zrdnSuww541
         PVL7Uv6iP/dqgoJtcnHNNYH74tVLaLmm1JOhp8P0jW1kBlT2oLtEVEbbShgDjxifrnz+
         vh67Ht4oOU3x5Tuf25Whun5V0MyRMxbEjwZ4F8uKE8YZsSCwtiWGtbeeWm3IMLNT7+Pl
         ixyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jz/R80xhYUJ0EJWe3D+HLAqSfz1N+6Poi2/4tJO2Abk=;
        fh=sw1wL/OLvypTQ/zXPJbmYqnJ23Ylvb8C/36nr1MAz6M=;
        b=gkdPz/gM0S8kQnfew4SorTrrD5VdhhKbkQFSYx6fAfpfoemTDnaQ1sk+Z1RTBSUIe9
         OR1UEFMQ1AUH0k2ivCsohtR7Qra/9BU2weFlICITAr+w7EmQyuQ+RB2jD0ui/dTYNg00
         /8h8gGW9GrVkQC9uKqtS9Q0vB4tLmpTjYkGaRk0cLMdveB/aTXlhjyhPyRxzaPnlKZNe
         3tl3IekJn+GArbIKjiQs838TaOSPLhJvnOaNfXXOX/0dXbyi+kP+swtUjQTQFVAJCzOZ
         7K4SRkOZ2AXcVXxSHrdsFrZI2J1L9V+QyU3ijwTuvIQGYfeBIKQDf8sqrhIN7E/KT7TV
         j0Kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787950252; x=1788555052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jz/R80xhYUJ0EJWe3D+HLAqSfz1N+6Poi2/4tJO2Abk=;
        b=K5FgN2ZF2IpARdAysxe01Wtyir8mjqtk24I6HqJ7qVdzCjGbSZ7D7td6OyqOEbjNh+
         K57J23FYqYzbmMdXabhUIlk7KqHvAk7Adev+dazBNLHaOjkuFRnKZVVquc2GvvUhTS2G
         DyehNFWg/m58HvTFQIbkwpJxm96M6MaJwLw+YOfBkpY4NPgWhtzHHUiuNgEqDmP67TDA
         1n58PpHF7wd9/Du3js2arWicSeGrH7r2Wo88nr6lKMnWw44sXPAslip+zR2hCPEYK9HP
         LZ/RNnt1MQW9orFKodVP8g/YnJH1yuZoIUYCeF8DLjVaB9mY+xOVG1pbrY6QKuZHhZQr
         a/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787950252; x=1788555052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jz/R80xhYUJ0EJWe3D+HLAqSfz1N+6Poi2/4tJO2Abk=;
        b=C8zJhPkXFsFmVlibRVwtgdwZeEFrYe04gqHH5gubj8Nv+6TURWgQqO8zarsLA38g+y
         pnq+KhLP6eYLqvM7Re9WfBPu9h4P1XO+/xV7RtccFAA09IUKFj2Zs+kH1i/y3NcwfVZj
         /eEFENTVhgGyt6Zk06lfc4cxoBvDAk15pWRRGGSvSiTIJjuk+CB7XGqJOV6K0+Ra69aB
         /PNVGP2RfHa4VkWgywKjpuhEU6GWPA9LbCDK4P250nAmZIkbBak8PSep9A3tdaVGwSvG
         p+PfagYxJqZsdEm0607c7li3tjDzsvCgmHErqZDtn/e4Zar8TdcN7IaICvJ1XXFs1V9s
         DLGw==
X-Forwarded-Encrypted: i=1; AHgh+RoMotRMT4DJbfimj0qnDUUhbkNXOXgFh3rGpAf4N8XHVc1bBwojVz8xhhnOUI5Nwi26RPjydPSqjKEr2Yg=@vger.kernel.org
X-Gm-Message-State: AFuF++l95/uNjPLls89bZotEeqy5PfVQ5yPcshAqWZPKnay56RdL51RD
	Zt4ToBv4QQBnICyYPsO8CJsFPyuWT6jDkIekFRVKOB4R4Gc7df7uSVwTzv0Ap9FAzGNrzInNVlt
	nBVK29KP8IXjXk/lQn0kUREtqai6tstGdUwesaveE
X-Gm-Gg: AR+sD10NxHl0ZIvW9JveQxAObCM9rk7EvWxWA5W3Q5lmHZBjIQ4GjRJ0U8d0YV7QT4t
	++dNExSG+X8DopYd7JhXipN91m0lmw8vo1w5TA892ERU6qciIS9X7Gh5mtZgzKsKDSMHbJE7dOO
	X2Q5G04FRz+Gfw9iNgInMA0vRLCX3JpRy6gHGycAfOZzUW5uCj71VuDmWWNf7AqS+dgVQ1SlSCu
	jPE0uII1A9dS+2p5GGXOWoHPKbXQqJYRzS9KTP2mDwBHws04NpRPuXgRuS+Vqxu+tuKjlgYpIex
	xsjub5y5rlNVRbZiANHAGQkaHur1D9v5t8yQnYrY3Q==
X-Received: by 2002:a05:600c:21ce:b0:499:c3da:6f40 with SMTP id
 5b1f17b1804b1-49ccbb10d13mr260135e9.4.1787950251892; Fri, 28 Aug 2026
 13:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com> <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
In-Reply-To: <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 28 Aug 2026 13:50:14 -0700
X-Gm-Features: AcwNN1VOtvX9Y95_BvBjuOVh8z76AnKrtJFeJUv6jycw2oA0qmipRhZ22a1HmKs
Message-ID: <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "Yo'av Moshe" <linux@yoavmoshe.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 1:19=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> The 8B alignment seems to be a requirement of fncopy() for 32b ARM.
> But functions in ARM can have 4B or even 2B alignment w/ Thumb, I
> think.
>
> Doing such an override would add unnecessary padding for each use of
> SYM_TYPED_FUNC_START where probably none of them have this fncopy()
> constraint.
>
> ```
>     #ifdef CONFIG_CFI
>
>     #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
>         linkage(name) ASM_NL                    \
>         .balign align ASM_NL                    \
>         .fill (align) - 4, 1, 0 ASM_NL                \
>         __CFI_TYPE(name) ASM_NL                    \
>         name:
>
>     #else /* CONFIG_CFI */
>
>     #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
>         SYM_START(name, linkage, .balign align)
>
>     #endif /* CONFIG_CFI */
>     #define SYM_TYPED_FUNC_START_ALIGNED(name, align)        \
>         SYM_TYPED_START_ALIGNED(name, SYM_L_GLOBAL, align)
> ```
> then this driver could do
> ```
> // fncopy needs 8B alignment; see arch/arm/include/asm/fncpy.h.
> SYM_TYPED_FUNC_START_ALIGNED(imx6_suspend, 8)

Looks reasonable, but this still feels ARM-specific to me. How about
adding the macro to arch/arm/include/asm/linkage.h unless you have
other users in mind?

Sami
