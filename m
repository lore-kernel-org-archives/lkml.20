Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4314E1C80
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717369; cv=none; b=RCGdPSiP896s/V3bd1eVN0VudKSF2IIoAml9GWQk2GRWLxvaGj1gYYCjE5xiQm/JzlnuRjVqFqfw4V+nluwj1wXO3lvyfoIa86vSUM6LWK32WT2MxbHQykMfaHPoDy+lt6pE3xDFBH5A0xDXg2U+ThOecp3BIWCcik7fbFUQ+MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717369; c=relaxed/simple;
	bh=ySN2jKS9dHhRYoH81doQjhzbQkfdJK+9O/ToilcRwv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WL1Qt5Pyh6vWugoSOpR3kmS9lN+UMs6SQ9INTDV/vncwYlmnyk5RGpGBbVRcNYz7MeK1ohZ4Gtd0tf6kzmy7GaDltZR6eIeS7NOSU79Lax3ve4zazvgJHMEoLBHsRARW4aNY6NBz3mgfraYZPx45HefH8w6Ngoy8g/pHluSz/Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=qGfmpJKz; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="qGfmpJKz"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-88103e47f72so3238460b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790717367; x=1791322167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EyT+xHf5qLUoWCtLPqQerMtkJAwK/AAEHgHwEUT5UR4=;
        b=qGfmpJKz22igcyl9HcOLCLgvlRDeS/1M3cjnnD4BXcDLJflIYjqgJs3Ut7SfZCklSJ
         km1knV6Gi+pPUH2b1/jCh2b/Da3tCx4bOtQkQfS6E/EQSce2+MrvaQhMz1PeXhQ5cUU6
         wRpKipD7qRJFrGzliGOQbzw88Jkc7tO9uSuMTQN0TQLkQs8txBZppFw2/u9LMNN0h6oj
         htqKYumDqoTygRGUiQKONS44Bo+pTDkTV0YbKTOcSHXBONRtzjW6D+rAgl/CcFIhxG6D
         WDzJpHB/1Ec04i1nC7KXTCxJ/Qs5aHNYmfqtLVacUBb+mcF2iVCeP9yJHj8gmJVpq37p
         OEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717367; x=1791322167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EyT+xHf5qLUoWCtLPqQerMtkJAwK/AAEHgHwEUT5UR4=;
        b=zN7o7am2IFH30sFpNfgItzIJiDU+rYG/E1CPaGmE3tGVI26bgIMfAmKJWkQd6ErwwP
         s4N5dw1JdiMAjvygp7Su5pOtkHbg1SGSW594+psqnj2KXdCyI902EqsrADP7SapI9/Hk
         Qu+gEINIxevMoUoXK0hYQ43m8lEusalOX2+PtgaLld3SxEhO/7nu4PHdZfBETD8dbziE
         SpRmi8gqxUy6ASO1aTxq9DbtjCiiqJRbHKub1aWoUAUyHmEndA3EdWk00NauQNy9QKAv
         YGxV2aSOkqEdTSXR0hrI5T4jeFUUmte2vURzah5neLA0qpAd0E+Uj27dbbPc4NXSlicU
         ODeg==
X-Forwarded-Encrypted: i=1; AKwUvBwXhI/rDg/dhxX60Akw6IIMlVsl+I9fPKSknNysrMDJZyPm5FKZwfMGH7dyc+8UF53J10pwhUBKDRPCp0o=@vger.kernel.org
X-Gm-Message-State: AFuF++nuZhOdtP4b+MJU2UreL8ii8oLt4UTq7IQPqyyxUZx79qHnqeZz
	ijxRpDIUv4mz6vRzP/AZt46HR+GaACt92/uBSXkdHEZ0LjFE2l58W+ObY0jqo1JQU4Q=
X-Gm-Gg: AYBFou1/FhL3IKcm1sm4nv5M6j2sKLMVkUc0D6T3x1ZF58hcSWn7uOMOTG5P2nXfqvt
	oTdQDrThospveL72TRsuiQF8Yv99VJmWWaK2NNn93U8QceQYjEqb0y6pU8QuSd8nFXB+ouMB8fB
	rhBzRn6b2irVz5T847qdcM1Msg5iMUGcmeUx7Wq7mywMS7j8stZVL/ClWmFT+IBEuo/gKMLsE5h
	39otZnkoEI1ZW4dzKWs5R1slgaawamNI8RRr5AdaYIiikbx4kKKAv6SfDYKD0SaVbbFhooRaFw/
	+5zJxeN8LuIdLNsdbAiWsELHr24zfTK9YCnZ+a/uqK9b1Amjahgokm8o28MlXtW+W8Ims85Qgjo
	mG3Z4NZIWxjvUcdE3ktkFKy6d0D7m5Sv5mL2bRwEKZokSv+u5GfU6QhpixpqixnBODB/Gv0mm2i
	y3OpjvV2rq03Bewr00a4I3GRAJ/lpIewcf8x9l6jSyUOfzEWEyV33OSCcvgfGdcPBh3arHVeZnv
	5n38msOgYU3
X-Received: by 2002:a05:6a00:4186:b0:881:f5e1:6e7f with SMTP id d2e1a72fcca58-886c48b54bcmr338925b3a.31.1790717366754;
        Tue, 29 Sep 2026 14:29:26 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:57::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8868866150bsm495163b3a.3.2026.09.29.14.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:29:26 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:29:25 -0700
From: Joe Damato <joe@dama.to>
To: Frank.Li@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	bui duc phuc <phucduc.bui@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>, Li Youhong <liyouhong@kylinos.cn>,
	Frank Li <Frank.Li@nxp.com>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>, vkoul@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] net: allwinner: remove dmaengine_desc_free()
Message-ID: <arwttakXqJndFXGe@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Frank.Li@oss.nxp.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	bui duc phuc <phucduc.bui@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>, Li Youhong <liyouhong@kylinos.cn>,
	Frank Li <Frank.Li@nxp.com>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>, vkoul@kernel.org,
	imx@lists.linux.dev
References: <20260929190640.3516766-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929190640.3516766-1-Frank.Li@oss.nxp.com>

On Tue, Sep 29, 2026 at 03:06:36PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> dmaengine_desc_free() is designed for DMA_CTRL_REUSE. If DMA_CTRL_REUSE
> is not set, dmaengine_desc_free() will return -EPERM.
> 
> 	if (!dmaengine_desc_test_reuse(desc))
> 		return -EPERM;
> 
> So calling dmaengine_desc_free() does nothing.
> dmaengine_terminate_(a)sync() will free all already allocated descriptors.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/net/ethernet/allwinner/sun4i-emac.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
