Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182073CAE7F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508598; cv=none; b=I5QlEqTzLREXJ6S24D7uOVJw4NKn48r0nvwHRbjwg8chkZGHxg0sgKK8fydurg40LlSh0OyFFPal4Sk6qT/r5+TocZcK/UIK5PGTIoowIDsrPdH45f7zFhjl/zr0h4V4KVjxChymPBSOxZjRI6LmDG3b0KMsE+iS0283ZE0aKTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508598; c=relaxed/simple;
	bh=OCuEAwsPo6LAGIuWYwcbqhhesjnLgIEo8HDpHcn3pe4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rHcUClBUjyrhkYDay2COt5HtSVGjqFba0eElNdRCAzD3BYl20Fvo8xXH72KXlqLYcyqo9aPCb9wS+m+K8GZP3dEV369wxfxCUMdPGs/JKPwJu/N/fJj3sngXHjQxQgZQXIiIAnRO6aYWp+2dIzByqxtwPceWm13PQ8N85JVc2gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=I46e16s/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="I46e16s/"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so6452775e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788508593; x=1789113393; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJ1UH6hAE4wf/eMnhUQvleFgKZgGdJ6vWxvyx+MhAOw=;
        b=I46e16s/lJPPo/AOimII5N/KE0XA6zmndbyha3mmX3GZhSRffL+Dbb5F+4i6Cp7qNz
         WE3x4L3zvCvbQK1pYH5OFJSrAVguAcZD5wT6F79+RFUpftFbhV1SxFflBrU+02tpv4Vi
         rW7XUGltMowYXAbYWn8EXSlp51PfFTrkwXvz7UsdNEgv94TJtTBKi4DjpbgUWTG27tBl
         4lLagagOBzD/weoh00ggTZ403in733n0WizzCe8vOFtUYGWlpQsdDSXDsoFQO30FHIaY
         JOEec6ww5767bXf8uyRG0hysUil0Oc/bHDP45qxcj9uEPrdB9TY5hc7vDdNK1HHn/Vc7
         DxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508593; x=1789113393;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XJ1UH6hAE4wf/eMnhUQvleFgKZgGdJ6vWxvyx+MhAOw=;
        b=W9jao677NIGlTRXozGDOnygKfSYeNJaT1SINFodfsAZXyCRfK8FTrCSOc8RB9a3lFr
         KFk1HqFJrtaaH57Y0kCH+rUH4CmYcZwkf6CWziTkBgjaOyYecTni4PVrqsE+j2pUFdT/
         ihXhCcgKCF3ETl8JO0oO/0hjhl1B1EKbofvL/syl104a4D6iJY9ylK8v+Ofh0RO/gQSU
         BoduXEQAD8mbkn+zYxax+/som5ZwTmYO9Allz7tondwtsb8SvyJ80IPKvYRS7JPgcIh1
         WJG2gcMH1tvD1oIGFOqhBPQ37APhd9+PQkThy0ib+qxBcmHZl2xdxTGkXG80f7qgKeqf
         69xQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTuuNibIhXceJC4ayvqWlNpF8ozY0hNIvY7O0l9Eqgg07Lw5rtTZeFxWcu8IBBTp2hmG3DcW++HZYhqFU=@vger.kernel.org
X-Gm-Message-State: AFuF++n4OC2zBdmEjwFWWnm6AfhhRECZN1Tg5AlruZKtVClEbpNcXNjh
	r84tRsRan4mLoNpDtg9eTx2DtLV0sfkJxjlxN1NY1Aw9vnf9/6D8so4ZyhK5m5ZFIZE=
X-Gm-Gg: AYBFou2k2Ba7KnyaGChKA+57p1uvdTFcH3TxXRwLrTEOkwKBw9KpnPZfxjTWN1ugpvo
	DUYF16JKp5eMs7n9kNihMToNHFEcHlMPnz7mLY2lnNJr+VC6eARubSvxDKBlXWhwcO8jaXDdlH2
	+XLF1UCMaMY21PmdbqLSiRv4QHv7r+jGnVkWrfA0MgzdiotwJ3rAtHDoU/6uvgZhqd3XiHtSZZb
	ti1x/FM+qkAxEa+6PaArGytAc0qi8fhym86koXYUsh6Xj8FSc/n75zN3Wo8gTOBHRy6pI5KtQV3
	6pe7Z0aS3diUfUUdTeXOpKXXIF3KUd9J/PyRDLikCMIqZ+eY9rVXqJJ+2Tjz8kQzK23FLIL3D6+
	n8uR6Zf7I34HCgUhQQ9OPmvGL3/A8TGCJXDne3EEywLRouJUSmeJr8blWw0i/GYOA5lvEuFU8Qo
	oEhTNIUi10OicuXYeg9xQ+viHyO/fBuHvKIHN0N8mEygRUVUBuZh73Oqz4P9zJQENQc6E6t3wWH
	akaV4NL0K0fCY9Sgw==
X-Received: by 2002:a05:600c:1c29:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49cfc6cc06cmr15228165e9.26.1788508593241;
        Fri, 04 Sep 2026 00:56:33 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm10480125e9.3.2026.09.04.00.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:56:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lucas Tanure <tanure@linux.com>, Ulf Hansson <ulfh@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Ronald Claveau
 <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
In-Reply-To: <20260903225921.2290441-5-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
 <20260903225921.2290441-5-tanure@linux.com>
Date: Fri, 04 Sep 2026 09:56:31 +0200
Message-ID: <1jpkytlaa8.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 03 sept. 2026 at 23:59, Lucas Tanure <tanure@linux.com> wrote:

> sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
> identifiable consumers - the three MMC controllers - so marking it
> critical was the wrong tool: the clock should be referenced from the
> consumer nodes and claimed by the mmc driver instead.
>
> Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
> have no single identifiable consumer.
>
> This depends on the MMC controllers actually referencing the clock:
> the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> clock must land before this one, otherwise the boot hangs and memory
> corruption this clock caused are reintroduced.

This information typically goes bellow the '---' because we will not
keep it for posterity. Please resend when your dependencies have been satisfied. 

>
> Fixes: 43e1705ecab9 ("clk: meson: t7: keep the memory fabric clocks running")

Thinking of it, we probably do not want stable to pick this up since
your other change are improvements that will no be backported. You can
drop the Fixes

> Assisted-by: Claude Fable 5 <noreply@anthropic.com>

The Assisted-by should not have an email, especially a no reply one.
check https://docs.kernel.org/process/coding-assistants.html

> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  drivers/clk/meson/t7-peripherals.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
> index 55d09e78593b..2f429ea86796 100644
> --- a/drivers/clk/meson/t7-peripherals.c
> +++ b/drivers/clk/meson/t7-peripherals.c
> @@ -945,13 +945,13 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
>  static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
>  static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
>  static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
> +static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
> +static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
>  /*
> - * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
> - * used for DMA between the peripherals and the DRAM. After the clocks are
> - * disabled, a device that starts a transfer cannot complete it.
> + * NOTE: sys_am2axi0..2 provide the clock to the AXI bus used for DMA between
> + * the peripherals and the DRAM. After the clocks are disabled, a device that
> + * starts a transfer cannot complete it.
>   */
> -static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
> -static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
>  static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
>  static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
>  static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);
> -- 
> 2.55.0
>

-- 
Jerome
