Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574469;
	b=fM/DgYs4y/5xeCRPhQ2OB+Nn5It715wlIRYWr8U2WO9hp6FUFDieLSPqQPR6jNUlhnvy
	 lt29kzGO+dTr2SdQPJYiPxHLn1jLZ/phjK3j+4/Xvi7k3J9g0k7C2kCXEbBh2PMHqC2aC
	 gG+diCzpDc1uoqt1Q0o1VRws50Rs6IHHyoX+6tbQtXkM7E+ct65eMNlnOnmdZmf2DSFDc
	 HtwFix4iYGLpJY0KpqimF4jxUF4TYruaMvmDcxQtWNxoundcErz/rx7H8lKqdWry1e58G
	 86fCT9Y29FAYc234aQ+elivPkwHuPIPuWazdy9incHd0g1S87W095EKoVa5zP6zSuGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
	b=OarNWbQWzK8t8OGGJjJjhzn7+SqVmQbAwLmnyrmhtLLJ0YEAAGdBJIv33ThuLBEXIzFs
	 rfMXAtwmKYno9rMD9PqdLq38smvsKi87d0rBvfbXLFOGyZYDdFWU6DTH72JHWKnM3K6H2
	 H1FsQFR5c4KIKTu7ki4RKztExf1krA6XwIJnkBwevSywTqgAgjNNOB4RkbP1oe6wWnGdj
	 NR8wzDVuBRimrSAXWWjMUYj8Ph3+tVvN8XpcycRVBCyDvIIx/W/0gOFDUyGrAw8tlL9mH
	 TF9t9YqvjJ7R7gqv1c75+TIBXiHB13sY1Pcnljgnh/WJhZOmJPp2xccU9PbRJivVtRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WKaeb2l4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ED9606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12ED9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WKaeb2l4
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b704171bc9so1519119a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574467; cv=none;
        d=google.com; s=arc-20260327;
        b=lywXBj58gaNczt3ZbIarcnr78Lue+Nt4jhuTDKHbSGDs+GM1h2FVBYEtuGgoevADwK
         mzqzNmZZL9rWYucsiTlO543vWibcSTSYUa2ZTtlFXRK5XQyrUiUDvOhwnLuKVDhCHebJ
         b+j7U/1a6XqIAaqNQWvCapx34KCMP7aaQrmJIVJm9pM3yparCFxBastSIeoJg3dynoe1
         qF/2+KCwUXs9esHpQVRgvBspBwJvp5IQYmAfviha3WspnL5Sq/EBcD0UnI2C9xPKu60Z
         rmqEZUZmB7YANlybwVeVB3rVwFkWeCKQbN/Uwovzr44DobI9f+R4xckwJe5AdqD36qsU
         tiAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
        fh=VGiQoCQ4QYhmk07mglcTo4oHHloft1C5TEYHrZaYb3k=;
        b=Gr8s1JUvzNfg7LWWF5L/ZhPJnUfdVZ/RJ/5DFNkGsblgUJubEQaqvNIXbf4uRqjFvU
         olZC2c0kBPl7IbNc04PEt6khzBxZrNeJvTb7z4E93JwzETTmwhkaKjusvvRFmnGzpQ8a
         Cl8W2KL07DqOGjzeRg1GhKv6bqWZm5djXCOfZgHwjEI0WgSThXh1bHFhz3YtCIm+7RYm
         PZt/fggTXnhHftle8vBq5WM9bEIjKqJ6oE7LSfaPB5IQMxtitP3dx2YsJojFdHBjgrNg
         MhU9AlSBa6dFtxYJEE5LGq0th2fCq7XNCO0YTTgJGzReC2t+W5dkymDo9TBWrgO8EThA
         k1tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574467; x=1795179267; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
        b=WKaeb2l4pVzBS87XlMfPO1VmDqptC/3pLusWhgieqeXXXbpQOD/MIp0MA41pPGaSFE
         UGPcR7i6V3UxRV/TUJfwrRDVWP1rRhkfW2bv5f3NKIh7u65gSoBnWc3Smn0ZYEC1mG59
         9c6J0EwwIbANh6fVCNqaE+Sh+OrShJvWjxXx6MXf+bORf3/36vfNUdBbbOHoGqqHfsEC
         sjhXCaXM03ov3jzCLS+fNlnP85J/nu4r9Jy4UZgLRRt4sSmQTCKs9VTP14lzhYH0OT5X
         XIqDjGH1/R319J2ZswfccQWGwNAO+p9bfzHnzjuzlF/O/NaF7SFfrUot6bmtetdPzbED
         pgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574467; x=1795179267;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
        b=PQ2406K7DsBQdjWbv3lz8OteI2PvUUYFC7Ts+nFCpy1CTSkF/S4SWyaZ5sokfuXfpG
         3MZClezo6u0CC2AYxGaprg2wz0Tn03mdlJ+WxBiCEeOUeqej9vl4d0Xm/jCJBSeRUlAQ
         id4uiGNVse3XDWzpz+nJpfiMMiKs/wDZYUn+TWdCrhxbwWbUH/ZZqLVgvS2KA28+hyTW
         JHDzUGcyo4vkRGaK3lomspyMG2ug+AtphEEwhORAdf4b5mBSkUB7vXw3afCr64TWU3uP
         fJjKkeS23eqL9RR8NMES07wuCWkU80xwBmCOyhEgV8ZFLOpikjGH1CASCOR6VGzKcySY
         MJ8w==
X-Forwarded-Encrypted: i=1; AL+hErFxf7MafuNLBk8ihPWhBdIdb25xtQ85su61LKVvLFprG+maiea2Df+LEdzM3t/tx2q3nT29fxbLjlCLEOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SZbaZduDwtvsKyQ1NHUtRlif0WkmhtCBdeqDGfeBd58IomFnM
	pk8GXJc8pAZ6BXlSreRcFawF+9YvnUoVWhFZQa/dLcWoI67slqMIChcknhTbQ1gc4lsXNW2yKyp
	/oU9FjdXJobO4W1cbYnDP9mto/T1ESrr84qvmtaZV7Q==
X-Gm-Gg: AYBFou0qVuRT626z0cQjmshZFM+Q8Aoc2+dpMqtsPKT+JSq2vVt3lXRpQsZeXjFZlVs
	kWjHVkT1BGhff/qmxyxdxORvrPDuO97pGRngTKea01aZW94UIwNExHyWGynM1Ii2A/jU/nGq0gB
	6cYRQ+D3h0QMGL9gZ6aYLYS9zCBXesdImmvpTJE5cjbq0rnGbPR5hgkcCiEUt6sBaQVf+9KxQSN
	FdDilZXIGjZsLr8HhU3hFZ6inzIWg92M6vxOT8yJYOhT1nEUNoozmznZL3j1v+6RgSPzoJHSc3t
	QGCfoTlFr9mIpE5XSYB3gppACS7a2gm+01cCKTmb8q+t58gtzWGkPGppJro+xIHwR51Ga6VwTv0
	j6BFrnlJEOCS1ZeiurjBookkbBzY1YKJVgRvAJcBbLVI62JmxS3894SER3uZk2rI3Y6JdMQ==
X-Received: by 2002:a05:6402:2804:b0:6b7:245a:a509 with SMTP id
 4fb4d7f45d1cf-6b7c0d166cfmr1777902a12.40.1794574467313; Fri, 13 Nov 2026
 04:54:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104853epcas5p175c566a1ced2547e533c21b21e60e993@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-9-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-9-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:54:14 +0000
X-Gm-Features: AclHuK9WcGq9tEUmProC1B7yOVe2Lz9yBCRU5dHo1y04eEg6YkemqWw0onfqCbI
Message-ID: <CADrjBPrzHP_97OgAYacJKKqeCcp9FURoi6=Dmopk6nisTdEbdA@mail.gmail.com>
Subject: Re: [PATCH v3 08/14 RESEND] clk: samsung: exynos8855: add block peris
 clock support
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

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Register compatible and cmu_info data to support clocks.
> CMU_PERIS, this provides clocks for PERIS
>
> Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos8855.c | 97 ++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
> index dcf58f2459b0..12b5ae54b560 100644
> --- a/drivers/clk/samsung/clk-exynos8855.c
> +++ b/drivers/clk/samsung/clk-exynos8855.c
> @@ -18,7 +18,9 @@
>  /* NOTE: Must be equal to the last clock ID increased by one */
>  #define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
>  #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
> +#define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
>
> +#define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
>  #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
>  #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
>
> @@ -1092,6 +1094,98 @@ static const struct samsung_cmu_info peric_cmu_info __initconst = {
>         .memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
>  };
>
> +/* ---- CMU_PERIS --------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_PERIS (0x10030000) */
> +#define CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER           0x600
> +#define CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC                    0x1000
> +#define CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER              0x610
> +#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP                   0x1800
> +#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP                    0x1804
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK     0x201c
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK  0x2040
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK          0x2048
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK          0x204c
> +#define CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL                  0x800
> +
> +static const unsigned long peris_clk_regs[] __initconst = {
> +       CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER,
> +       CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC,
> +       CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER,
> +       CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
> +       CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
> +       CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL,
> +};

Same comment about preserving register state from the bootloader when
powering off/on PERIS block.

> +
> +/* List of parent clocks for Muxes in CMU_PERIS */
> +PNAME(mout_clkcmu_peris_noc_user_p) = { "oscclk", "dout_clkcmu_peris_noc" };
> +PNAME(mout_clk_peris_gic_p) = { "oscclk", "mout_clkcmu_peris_gic_user" };
> +PNAME(mout_clkcmu_peris_gic_user_p) = { "oscclk", "dout_clkcmu_peris_gic" };
> +
> +static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
> +       MUX(CLK_MOUT_PERIS_NOC_USER, "mout_clkcmu_peris_noc_user",
> +           mout_clkcmu_peris_noc_user_p, CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIS_GIC, "mout_clk_peris_gic",
> +           mout_clk_peris_gic_p, CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC, 0, 1),
> +       MUX(CLK_MOUT_PERIS_GIC_USER, "mout_clkcmu_peris_gic_user",
> +           mout_clkcmu_peris_gic_user_p, CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER, 4, 1),
> +};
> +
> +static const struct samsung_div_clock peris_div_clks[] __initconst = {
> +       DIV(CLK_DOUT_PERIS_NOCP, "dout_clkcmu_peris_nocp",
> +           "mout_clkcmu_peris_noc_user", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
> +           0, 4),
> +       DIV(CLK_DOUT_PERIS_OTP, "dout_clkcmu_peris_otp",
> +           "oscclk", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
> +           0, 4),
> +};
> +
> +static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
> +       GATE(CLK_GOUT_CMU_PERIS, "gout_cmu_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_SYSREG_PERIS, "gout_sysreg_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_WDT0_PERIS, "gout_wdt0_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_WDT1_PERIS, "gout_wdt1_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
> +            21, 0, 0),

The Linux clock name strings look wrong here. It looks like you've
generally followed the clk-gs101 clock name mangling in this series so
it should be "gout_<block-name>_<IP-clock-name>, but you have
"gout_IP-clock_name>-<block-name>". I know there is some "name
diversity" in-tree for various SoCs, but with new SoCs using auto
clocks I would like to keep the naming scheme following a similar
style to clk-gs101.

Also I guess with auto clocks now enabled from the start you may never
need to expose all the CMU bus clocks, but I worry a bit you may have
mangled the names here a bit too much. If you do need to expose extra
gates you might get name collisions. For example in clk-gs101 we have
both

gout_apm_apm_usi0_uart_ipclk
gout_apm_apm_usi0_uart_pclk

So we kept the _pclk suffix in the Linux name to avoid a name collision.

Thanks,

Peter
