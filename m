Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25598456291
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115981; cv=none; b=UBBK4/+ePQPbckClkzJx2zCn2kervdrGvlDX5uPHw/FjjFd6ybh1sp6F9t1SruNwN+lIY+UxNadZC/o1/YW1w9Efe6mlcIvSfWO7stmjyaMOXEY9ARHgNBBjp6oF7XcHFF+GGwXbF2tjehfXyBBI48g9tlU1LVgkJlituCZi9pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115981; c=relaxed/simple;
	bh=WEAeP2UMgOD8Ite+TGXGssS8xCwNiAFZIJmjrN+ig68=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a56sxgr1rw6lYUkkuuojybvXKn+8dcHwYWfijbqc2pnS3h4dpSGQ6Tu9HU2wcjQQ3x7X0rL/YP65IKDuyYZ1Wxt6DR+9ysy8qSDePET4NmJZjjI7UPh3RZSnIsstVRhg2JgWKN09C2U7bt+NRnn+H9azW+53QJlPFSH2+M5EZ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rxGzTtQL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rxGzTtQL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso6421055e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789115977; x=1789720777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fn2vvXPnXQ+/LUT2u/qcNazd0SkBSSNlBmM1Wguvo/U=;
        b=rxGzTtQLo/VTxIz2uKFq/nwYf9zHowFOpqXDEgrXHfP7KQmpeplyLLW8DkWjIMnJ3N
         UbFShq/dK/E5lHNF+5VDih5sy7iMHrbgYAfZHTVflxJ3y6XD5PgqDFoS2t395UPeclBL
         wQpsZN1eNoQ0tiMPIAtDSXajr9sa3t4xusUzU4T9B8qloHWnNeH/SN47/HYE6myEVa9f
         kZRhaUp7jPcHtRFx/rCHbNJP9xYcYiMCwwTSWEu0oxvhXorUWfdGtZJr8bjAjBESiYQ+
         35uT/6gY2QRWDnbu6eWyKi3V+7F/Rt9wtVAdwR+gJSN/kpGpHDnwFg+hWk/wbg8cq+aV
         RkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789115977; x=1789720777;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fn2vvXPnXQ+/LUT2u/qcNazd0SkBSSNlBmM1Wguvo/U=;
        b=OktwBFj5cHF312hXmY5xgDgfnbCVYzcL5FgcHPZBIR3JCe5sN/5Rz6LLYejT+fuMdx
         QCbuPI3katNdOiqSoHuUmqLPjCPG5Ddqd2xtC4xaqMb89u1z209zft9BzIriY/WmwHYV
         ONMhd4IbYM6UNo5zBbyTE6X+826P/LI2ON34ErE7d7sCH8d9qtVR2RQ8McJFXessyOrK
         FDv+6MKtRk5hCesunOdb9ds3/mH9356pPxLSJm0dRWDe+NNN/8xz8GR19jlW/U4N5ue5
         IGbRMziq0X4CFuS+cIthq8G1OOE9f2ec9eV0Qo3AkawsLkrl8xCjWfQV55G+GARCBwBg
         8zyA==
X-Forwarded-Encrypted: i=1; AKwUvBz7oH4iDB+4UYih4uVeYwECcs1jgFczwvsyR0tIIZC8QH/xk0gh954xUjG6QvnlCA2B6FXoWN7jr2PNm+0=@vger.kernel.org
X-Gm-Message-State: AFuF++k7uR0n+IGjPLQrsUFAwiWvO9VvUWhTzLWdeVgwW7nZIPIxPOIg
	Q7c2Blwzf3OMhcbjhywJ9Cm3UIma3K87vdMopf7TQTssxchiQRcODtfi
X-Gm-Gg: AYBFou3bDfFci4QDpWR19gKDfsgixOIGuY1S5IKCrxsZx/2V65jWrxjngtUAVgvv1Oj
	AZuvuzzOjt1tou46kgeJEAdwva38Qq1RkUFp9v58MjzdC5Ni3Y/xODPgWOY6Q1d9QNUPFvUz5t4
	T5UT6XVNfuQJomR/TgQDumO7MykCKYIwutw8PvQF1iLVaiBZFfQLrMmZIhVKIqhCeSpXsEIL8FG
	2BP0QWs/wPXQxMxA4GtkjGqlK0GDhSzFbdzhke+tg+j8inPmecB6k3ypSxXtZ4gPMpR3Mi37at6
	/umlBbgwqUoK2gWvyZEOz6jO/bOxewyes4QiIGFc/0bdzX+BxVNRUyYhUh9bwDstX2P7+YsdNgY
	PHBttza3+xtAZyAi3qIyVRU71agkKRPR7bz2qkq1zOkB9AQ2sFeZO013zckS0PLdm6WOfs4DqNk
	ior6xGMq3P+UpPAXCIJUk2jOGxL96EbQXwZoObys9ZXoVShGrEqFNfdt3ZOvhj0Gv7aFk1U5e23
	igBo6o9ArejqRNCZICNlf6YtJsCOywBNf8y55Oq2pJ7oJVm4azxeLZ64Mr1S23W0ITFY/e6HsXS
	FOi1uvGzwQBCWLLJtMDIcQXMIr5pQdch/Ou+Q9J1Zb5+4Gz6uaZqlQJS8u10RbpWzssRl3SEIaH
	X9BJiCseARyizd9eb0bbrJ7h2nZaYch/Y/7xmYTqp2+Njm5cx+PAHHeNIhkiYDZQTyVS78fivhy
	I69DdYTRam8njh3Vw=
X-Received: by 2002:a05:600c:b96:b0:49d:1916:59c7 with SMTP id 5b1f17b1804b1-49e619831a9mr33840005e9.7.1789115977200;
        Fri, 11 Sep 2026 01:39:37 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm4505226f8f.9.2026.09.11.01.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:39:37 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:38:27 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "David Lechner (TI)" <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Chris Hall
 <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, Kurt Borja
 <kuurtb@gmail.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/10] iio: adc: ti-ads112c14: support external clock
Message-ID: <20260911103827.00003bde@gmail.com>
In-Reply-To: <20260910-iio-adc-ti-ads112c14-filter-support-v3-6-e5a9b27ddb1a@baylibre.com>
References: <20260910-iio-adc-ti-ads112c14-filter-support-v3-0-e5a9b27ddb1a@baylibre.com>
	<20260910-iio-adc-ti-ads112c14-filter-support-v3-6-e5a9b27ddb1a@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 16:13:05 -0500
"David Lechner (TI)" <dlechner@baylibre.com> wrote:

> Add support for an external clock source to the TI ADS112C14 ADC driver.
> The unused fclk_Hz field is added in preparation for filter support.
> 
> Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
> ---
>  drivers/iio/adc/ti-ads112c14.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
> index efea1e22d067..0e4584b4675e 100644
> --- a/drivers/iio/adc/ti-ads112c14.c
> +++ b/drivers/iio/adc/ti-ads112c14.c
> @@ -11,6 +11,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/bitmap.h>
>  #include <linux/cleanup.h>
> +#include <linux/clk.h>
>  #include <linux/completion.h>
>  #include <linux/crc8.h>
>  #include <linux/delay.h>
> @@ -82,6 +83,8 @@
>  #define     ADS112C14_DEVICE_CFG_BOCS_10_uA		  3
>  
>  #define   ADS112C14_DEVICE_CFG_CLK_SEL			BIT(3)
> +#define     ADS112C14_DEVICE_CFG_CLK_SEL_INTERNAL	  0
> +#define     ADS112C14_DEVICE_CFG_CLK_SEL_EXTERNAL	  1
>  #define   ADS112C14_DEVICE_CFG_CONV_MODE		BIT(2)
>  #define     ADS112C14_DEVICE_CFG_CONV_MODE_CONTINUOUS	  0
>  #define     ADS112C14_DEVICE_CFG_CONV_MODE_SINGLE_SHOT	  1
> @@ -178,6 +181,8 @@ static const u32 ads112c14_pga_gains_x10[] = {
>  	200, 320, 500, 640, 1000, 1280, 2000, 2560,	/* 8 - 15 */
>  };
>  
> +#define ADS112C14_INTERNAL_CLK_Hz 4096000

4096 * KILO?

Otherwise LGTM.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
