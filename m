Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574883;
	b=1HbxSFm0UDX1SZi70YFvsTUn3rvj9mCde0DAcEtQZams5yVk0eJIjFoNyp+BsCHGGKYC
	 oA3mPVE8O7clQnxuPJz0V4VNTJPdrAzm0eu3vsvSe1IGh9DqOTxXT/8j6oqDqkFkJDwU1
	 FadoxOKSyk7qOXO2e46izII8xSb0qK5SVehipIW2tYpCHBCva+WevyQBnxQw0g5dXDkIT
	 OQrpbt72J3tDPoJ2rdAOURr06boof8tejJrzFnyRetMf2ONL0+SNJbemIQ46Gyw1wkhzN
	 qqbqIfAIeIs2ZdQLtpyG0iSCzkzNbFM+BAsmikkoSCqa3qZcmn2WuP4ge16e0q7GCXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
	b=VZCdp4xsehyocIwtnhAkMZwtcJ/MYoqFRqVK7wa9K8j/rRc3rsCSlXVecY5DVl6ng8GM
	 1UpJ4CqPRuO402gnnF3dDe475cJbBKEkRLSrFjoyZ638aHrKUBDYt2UcLM4XXgwPQPdKH
	 tnYvzPdyhk4p/8iHUpnuUJvJknKDajT1LH6zLeODISl00xi2duH7URiJSraCfs4oS0YS3
	 hH8H+8QkouT+cC+uEgMs19nsfmlWjFC/BFrQU/X2+/8UU8/EMyY807ooS4o54KHvfrUWD
	 jXoD4fUHsP+mfz9lnlH9BKZ0v8vf41r/8zRn4giVj8XpTDBeMh8S5hamBsJYf6JdJWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MQJaXd6Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED71606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED71606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MQJaXd6Y
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1914286a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:01:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574881; cv=none;
        d=google.com; s=arc-20260327;
        b=K0UhjBKWq0ybdKtkRLyMwKtNszCXhpIWVrHj5FanNr2JaJNp8Ak7nOY0lAgeFNFsy1
         5iF0MWH8AirYur1g7YTHO+GyFuukRS8AA6aIn5s7ftRnwLwoZ7ALiAe8aUaL7EIhh9vg
         zh+n44z7rtxnEwqZlZvfth89HapdC2WQR+Rks3dWqxhM32ay+39P9T4xv9HDSlSQwCrz
         8iE4RDBsn0Uvxkezb+hno2fbXswzk7Ak3thhIaPCfFXqqw6TtdP9juTCzVfGECh5SSdz
         TZAuUaZ0JEL+3hf20Yk2eOvfZouq+zzDEtM2rXfYv1+OG3vFqr7qPGqD/CA25+alcWOC
         yz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
        fh=DE4LOL0gS+WZNz38fZ6dgZDDDXMNvWnTm6l9jEfOhU0=;
        b=JR85rXbTQnVliv0Vq/1JA0Wpsf/Gf1xSO7OJ9vPLtGXL6FsO8iRdfNB8fpYpsv/9WC
         0o6RJuqRNDEXg1T71DLpieEk2mP6az/rnnCng5Gs72MAUmIIl+naoOv6Sk7Z3u7rKj6e
         S/8qn46/9ofOJqaNDQQVJ01KJpJp3OK4ZXsqF69Pvkd0m1J10S2CtnfAMtRgv+c4lc3o
         C1qzDbiSF+rujb5HRKIgGBfF5FzUi8Qs8sEdswJdIc5Hz8LJjJ7Nd0xYi9xEmMLQ108t
         43STByayUefAmIbjCs6tPlumo9MbVIo27jdQLz6MtLdiXdNPu36qi+dsoN0s8uYNITgz
         Wu9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574881; x=1795179681; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
        b=MQJaXd6YKRL3+jL6Uj5NN96CNwxl3sZHlJScFPSK0J7BOSDoGA2vh5ElOAO11rI60h
         onBUy6vf2FZk/6Q2PYow/u/817Ui+QGZ+BVMKfxJ9Aw1j6o5mxRxw226PKd3ySoN5W4E
         A4tQHaCY8lJjN1NdLW/Qrv+Ux+kT11fIJ8x9QXwkiFgL1rxDC0fcevS/gtg++L6Bbgbi
         qaei+0mh8tnJCVQA5JS1OpYyKpgRTVsOSzaYIrLq9VgooIS5bpweBl/95jlN65c6qXdI
         RyJQ+nZLlXFFY5bqK/iytO+V2G8O52BAsQrRO/YqwvIg4lfU+ud3S0iLEzM7Tx0o+iVz
         AUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574881; x=1795179681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
        b=h1cTtgraBjTGmy7WLMnHKUwjLq3FPJH6qdJNxdfjE/9iD2I+NODpKMAUGg0tBfDrHY
         b/EdVyRLiYCnXiyMU5+FZyYdqMdrPbWHPLqr0IM2otCrX8oJhTcIGHqSlkImsMJB63IR
         eZkYryyiHjkp8ReeqC2MV+EMxvELKyAQcd67giy/P4pyUNBk+BVKN6cVKePnCeUBjKVn
         ghqRDprSaJpD8RNlnEBi5tRtnqtJCnJ59EyxZhQse5wbWygRDdbL6HLYzvS3nhaTRSMj
         HUpW4CBEL6NkLnUS6dbw80b6wObgRnrYtd6H8Q8TYinrS2pjzJfPbST5mfa/FNhUz6Gc
         wiIg==
X-Forwarded-Encrypted: i=1; AL+hErEbDIq8lxGhX9z3zcrk46OHyobdrAQ4+UipCN9fcsTfRnanVbTspglAqpBm2co5Db0lBGyVCf+hNIDuDB4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KUGj6kFMitTsnvKj8GTcEBSsAVrMR88kQpkB/9tP80bd76bot
	oI36EmlVOtb8qS3gpsfy1FG2JxzFBxGKkqyfLdELeS9xP7GyluCcgWc6F8wtvwWIfPcG7odPY67
	XWyaN8ISAgloOFShLjImDlxRNyE+XxkEnv+wSEoxqyQ==
X-Gm-Gg: AYBFou0sWwtb6XYR7oqomQGKPo1QcLjTYCoQc4FTVFlf0Ps/n1ApKRc/sTCEO+Y+sRp
	V0Mols26923rB/uy9ajcLgh/JA/svIDgsRX9d2uaTyVqLYUulHacCINZoTuLi6p123nUrtO8t3n
	ufDk94MGfGExhu8kMf/zLLD6937snieugqd5dcYbOOKtqiaLnKidSmR3evSJeuBk7u4Ip2jpiEb
	BWe3F+4Wf7CRoMYEflNgTzF09cUUjRS7LXTY7A8Jl9PWh/WoEJPVxr1mOSZghWQHqjHq02vcPvn
	4muc28wGh6nFimcqzzPzRJVieu7+4h+Yz8ubvVyD6H9leRq394Y3GNCtJARVRXWrIlBV405bUo3
	416+0RzxwC/RXDmBlxfYjvsVOOtXVlXaeGQFXNcLP7Y5F//OiVHy/fwPNtByy7TJgVqsSOA==
X-Received: by 2002:a05:6402:4413:b0:6b5:9150:edf3 with SMTP id
 4fb4d7f45d1cf-6b7c0d144a7mr2186142a12.43.1794574880970; Fri, 13 Nov 2026
 05:01:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104906epcas5p462308ef9eec80f8b7a5f81b64e72b24d@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-14-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-14-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:01:09 +0000
X-Gm-Features: AclHuK-DofCQ80IZzIK-whDWDx-7N4O3mu6ydJD4FcVZrdGUzptZd5Yy1pZ4bbc
Message-ID: <CADrjBPqormg=jcKYZh5q61MiwZaRB-ZqtV+R2CFNP7o6Jd-SKQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/14 RESEND] arm64: dts: exynos8855: add cmu_hsi clock
 DT nodes
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add required dt node for cmu_hsi block, while at it add
> sysreg_hsi node which contians bits for DRCG and MEMCLK
> which are used by clock driver
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index b461de6a7548..3dd7a4c4c609 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -241,6 +241,27 @@ pinctrl_pericmmc: pinctrl@154f0000 {
>                         interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_hsi: clock-controller@17000000 {
> +                       compatible = "samsung,exynos8855-cmu-hsi";
> +                       reg = <0x17000000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_HSI_NOC>,
> +                                <&cmu_top CLKCMU_DOUT_HSI_UFS_EMBD>;
> +                       clock-names = "oscclk",
> +                                     "bus",
> +                                     "ufs_embd";
> +                       samsung,sysreg = <&sysreg_hsi>;
> +               };
> +
> +               sysreg_hsi: syscon@17020000 {
> +                       compatible = "samsung,exynos8855-hsi-sysreg",
> +                                     "syscon";
> +                       reg = <0x17020000 0x10000>;
> +                       clocks = <&cmu_hsi CLK_GOUT_SYSREG_HSI>;
> +               };
> +
>                 pinctrl_hsi_ufs: pinctrl@17040000 {
>                         compatible = "samsung,exynos8855-pinctrl";
>                         reg = <0x17040000 0x1000>;
> --
> 2.34.1
>
