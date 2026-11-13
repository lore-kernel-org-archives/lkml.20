Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794572865;
	b=Ed9zTBmnaFLQjtelmNahQuI8Kw6AC00836Kt+5Cx+sPSg9QGV5KF2+A8X+RT2M+F34ud
	 nW5CtM85ZfoedMudpivaIn5rA3gV2GuvuksioO5of/jvny9KzeTfKRBPz01DQT5hLXLfu
	 bCBxwEH7FH7iQURWuDVzslZRqgV0EoD2iwWaiA2vbEc+bp/dySfGUXXQJrkTgqQXSsfGe
	 Xq32jvWWOCmQh+8Nmuh+kwoLqE4EE17JlI2qYJKL6wv4ltXr6ffP+/h7h9XEIssHr4pUM
	 WzwGMhEolKYC70/iLqsKbVpd9cIh17T85ySJvWSxjFbSpH6LejMmxL3o3P063+wZ7vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
	b=ENKFveJ1QqMHOolKblrcmVO8w24C0ha7LNSYo5cn2gv7k3qqFeq4NGbg2wZkxq2Di8F/
	 7MkmtxzQo0TFJTd4512c6cVIMAl3JY3njqOqOnhw4ufDjZYXfJh2wpD0ztDLuoGaV64N8
	 rspREeCKoBhvn5yEXpEcK7KslIDIUfLZLgYmAMNfoFEomaV9p33YlpXBuEdG87YoSYQ1l
	 0VmM0ZXGrzSE6IFfNB8QswlKJsAv0HE8MOOPOQbdlnMQV59+XXNXEH9OH0CqPHeRLOt5q
	 JjxPBa4pXLQ22WX21QOjY49i6yX1AIEd59yqw6rcEmYYRuzHxJypBDy/3KOUPDQVhPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fpPSGCQh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224B9606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 224B9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fpPSGCQh
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c40e30c26a4so212176466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794572862; cv=none;
        d=google.com; s=arc-20260327;
        b=iwkCMxjDk02HQN6h8mIiviWz2Wzd0yYRqbXoQuOK8JUWl2xNuoAZUilXdh99uPLKFj
         eaS0eclBV4PocbUNrvR40MuhKbNgi8y/Rw/MNKK3dy9lot+tUHSVX1wZkkXqoDeG0735
         Q0ooHZcuLys3oSF7jE3jnK59SC6nPz9CPjsGbsUTFTGxV6dUDSoeb9M3dGlDAejEM2k9
         IvthsxFNSS2EWt0xyjhWbLzfCU/9Fgo5N7TC3IG1aN51tsceTswvJhTmtwlpu0GuXFXJ
         u0ma9668lTDMVqUyAyNO+UbInpMY8hCeh1Rg0bT4GBYgDWtA0BwTsDEDZEfI5UV3KA1a
         vmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
        fh=N6y8R1rLb5Nw8D4zVxHUxA/OMS6o+Pz9taOemeqQT68=;
        b=WJo5S3gFFS88t8J1maQIq+5CbL3eEmJcRFSNFrbPEaeosDHjKnf4u+x9lbFRdpc7+c
         yD8Mlw110xMdax6zc6DOTrAonkff4WBQ/uSIyj8b7tmiG1RJc9o97/ebb9bWmb9e4f3y
         THMT1Lcl6D70hW3wABhnPwCmkLOkaMrtNqnpqrtXyDf7mCiteaW+4kGzlf80y2z98VTa
         Y758vErBn6jkTsJRX/OUbPZactISJIPcI1h0t8L22NKlFfv61DOtqiPYdKN8ZRITbiMz
         whPXK+TlitygRFu0RHK81v6269qiKjBw4oaJ+DToKKCgSPXxHvgYvoDISaU3gP7r3jVK
         w8Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794572862; x=1795177662; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
        b=fpPSGCQh019xgnP4jNvjti8I/0AyxGyalkypQFm2kRkMTu7+kWMkCSqT3vZEEI+z2e
         U+eSA00vDHTlcZgqCYQn+e5R7A9Cru19JflQDbfR8SUD1CQPtQ4e54v1VUTgSYsXnVF1
         YQyfHaPezpOgrJhYnKhv2Jp/IULw+bNkPw8Uqnz8g+ucj5EgaXhanvyRmGLI+QfgQNn2
         XdwYa0+NVc770n44qHjYIhgH6QidViDyNfITPg7ELnVGfQJaP+k8TkWoln0Xu3dJEW/E
         VFzbwfAG8pdVpleuiQIzGZ1XdmSpiCQv0Qg+qUHvsBNtBIK5ZwWpvkItqUdiPXv+8A1h
         d9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572862; x=1795177662;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
        b=HhVrbvf49r5TCbmKoUSkr2K+KlWhErpdWSu2OXMf1TDX9nbnyStNNj+wq5OEMD3Q+0
         XGqk7uTxaO7GgYj/67On2e/HvE+g6VHkuI6XM3HzpG2GQ3GHcTSovzGs7qroNUQ92gtS
         IXCMN0pbFBD6rbFR6R6/NoEkVlSJKgRkPvRNaWMK4fcpOYuPgQYKLZ4Pjo1HTN24u77f
         DWiITQ+hNpT4pRLlUpkSqiHdx7ax8B0FBXPv2m6meZd/F6XBguQo7wWhkLufUss5TQez
         83U2t1Gy3kn7iubxvv5lrW3AlDGRRzqjklP2x3cZF+CqHQVUbrssQT8Zuyvnh7KGDtun
         +XIA==
X-Forwarded-Encrypted: i=1; AL+hErFJ0EQ9cnz86W9oUV0S5Cti28mCENLaofalLObrcQyUX1z5kXOi3BGj4T4NrfhyfiLrcqB40DbgqKjCxT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VhoGkZd0+K+blHH9EB6jpeyiDTde1Xq16zoTsD3fLwLB+bedT
	o1rDGRAkqSaS0gX4T9Duz9EnjkESKDPnzWAyqUaBtwmf4LX06gWqK0S6L4v+uxJZ5r4P7nDOPTb
	Ce5g93TSks3H0i1JMdAzWGW56u2Yy54a+KnUypstq3g==
X-Gm-Gg: AYBFou1COqFZeC5gb+yLz0KVyJ+auYSCQTCzd5Bw976yk/VNmuE/4r7lB5LxPyGj5vC
	0ZCaP6f8dvUtTwmmvgydhwrP22VRIMLsCYuiiK8Pn2/lH0UT3qz77ZudekXt0uUlUwsaE7SNvWg
	RI/5gxAICHNT7q6UDavISe7u1NKmszy2Uw2J26ArLPqKtl0tBS0ys6fYbas8QUhwfn4Iywu6h+k
	Gw8GD1Qr8dMmliywCboi6Gdjo3rr4jXvGlrJYDYoQB+a8K6QPkNzOjkSmaZSvBlugiMow3fZYvY
	BSyz+QO3+487eGKmkCXuoR0+BCnuurC90xtl18a4WfpZyytqlhBDLh//JvfuGxqVk3pqM7/wk1T
	wxHAvpbK9hl+8+q1Wb9DGTsj2QhvOsRE8Z2gephLtH0137flAaty9muTpFk47+lzhw9zYrg==
X-Received: by 2002:a17:907:3d8d:b0:c36:777f:824c with SMTP id
 a640c23a62f3a-c507b3944a2mr522415966b.4.1794572862414; Fri, 13 Nov 2026
 04:27:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104847epcas5p1d970255218f1ca78b19690bfd097f303@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-7-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-7-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:27:30 +0000
X-Gm-Features: AclHuK-p51p0Vx5xI8MvGi-0HN81TalHpuLQqDi6SVVgi93XmBwCD0wdDg3iAr0
Message-ID: <CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com>
Subject: Re: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for pll_4313
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Raghav,

On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> From: Alim Akhtar <alim.akhtar@samsung.com>
>
> PLLs 4313 are found in the Exynos8855 SoC and it is similar
> to pll_531x except for CON8 offset, so re-using code for
> pll_4313
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  drivers/clk/samsung/clk-pll.c | 11 ++++++++++-
>  drivers/clk/samsung/clk-pll.h |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 3d837bd74355..7b0756127306 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -1306,7 +1306,15 @@ static unsigned long samsung_pll531x_recalc_rate(struct clk_hw *hw,
>         u64 mdiv, fout = parent_rate;
>
>         pll_con0 = readl_relaxed(pll->con_reg);
> -       pll_con8 = readl_relaxed(pll->con_reg + 20);
> +       if (pll->type == pll_4313) {
> +               /* Offset for PLL_CON8 which hold FDIV different for PLL_4313
> +                * which is PLL_LOCKTIME_OFFSET - 0x4
> +                */
> +               pll_con8 = readl_relaxed(pll->lock_reg - 4);
> +       } else {
> +               pll_con8 = readl_relaxed(pll->con_reg + 20);
> +       }
> +

This starts to feel a bit hacky (pll_con8 register being referenced as
an offset from lock_reg). Is the register really called pll_con8 on
8855? Or is it called something else, but happens to contain fdiv?

I think something like this would look cleaner:

u32 fdiv_reg;

       if (pll->type == pll_4313) {
               /* fdiv in <insert name> register
               fdiv_reg = readl_relaxed(pll->lock_reg - 4);
       } else {
               /* fdiv in pll_con8 register */
               fdiv_reg = readl_relaxed(pll->con_reg + 20);
       }

regards,

Peter
