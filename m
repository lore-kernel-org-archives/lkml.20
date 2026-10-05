Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10477418365
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194321; cv=none; b=XPJV9cPY5zQeXPvUTLRe0fe0Bdo7tUbDuIWT0IBB+2O2kN3mV2D0P6WjYJq2Axj/MaVCsvsNmia7wyG89olXFUOe9EKYqVnz280WLatsdXAbvjIjeEbh6NYVyCpIcg3jVCUoSpvyWuwCT7brxNAzclmoZ/AbtojeymPDqzDwEAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194321; c=relaxed/simple;
	bh=PVy4XiZVvVGnrrqLHJ++eKCppwJjFZExwQYU2xEaRTs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QkGLPBlwvV3sXbT1szQ2HSXqzN4Bcsq4AgrmzZZ73RgMSvEbHcaRIngbm1XqXD/a3YP9X20VPRMNfxp8p2vDz83e+/D8L2lAEY2Gfk0nKfg4kHALsMOTVfg36mHD2lhoZyQBKhT7OdXXfGNq0ONFgEMLiBZwfzSEJ+IGPEdv2bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDreTxVp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDreTxVp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10809235e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791194318; x=1791799118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fmRC4hX1HkUO2ejwd5/7P2ssChMP4j4+YtVG78yP6GQ=;
        b=EDreTxVpRP2aJV996ZrMjZ+6oyjfp6JJ+iDEonHwWnwA+hxDXVNwajt6p6Q2hVwj9z
         8UbkWGMM8yhn6B/FRbzG4BloQtfIHC4sqDWX2J5fkWQrLF/Nop56RiNeTPpLH/Zkk4gq
         EK2ti7SC8TVO6igj8TaQ+Zt0QGg+8iwWZUkIJfOG2vgJS9Akl3YpVkdByStBOJFSYnof
         H2IaJKSiTTiPr7Rj+mLdCUqnkk7Hl27Y7uJ7WpWmssQEqica5iKHwTto03bqzeTO2Ig0
         352N07/YV4O1d3d4yAbGIuhPbkdktHRimcizusYwV/N3Y5A+hsUliMejYB2WGzTKIjcj
         4mJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194318; x=1791799118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmRC4hX1HkUO2ejwd5/7P2ssChMP4j4+YtVG78yP6GQ=;
        b=Y/HrmhCPk3XKGvPBDJNLsOhqJ44UKIFsG3GFDojetEqpwlotPhCh6MfbgJX8A7mF/U
         bfIs2lSRq8tM9XPY06Rukx3MZGct3WUBluUFs81a2x4oTT3xgBc4GJu3SnpgaLjtESyi
         1kXAeKXpzMpbOcsldONKguqCvaTPGgffZKcBlsHq9YEsKc8lcygWmaT9Boqlta8cjKDO
         oS+m+2fba/Q2nEhLPSLKwWEAfc+EWfJnA0Tx1kmiA404WR0FpXS7NbADi0lfKgOhsVfY
         5k/T3zSm4mASc0X2wrGzu/YcnKOAC1cFEyO0CRal2co6+ezgiJGRVcXagU1sfuemz2r5
         oJww==
X-Forwarded-Encrypted: i=1; AKwUvBwFjAwsBvGKRteMdaWZCHqJzKEBXPuRzWRT33Kj+HZ5YNgntvP9McnHRtiBkmwRMI7ubw2zJSYzQLGoIOo=@vger.kernel.org
X-Gm-Message-State: AFuF++lp66H2ZLHjKQqjkK25Q2VeZVmnlvGEFJne9FKLQzqCw4InR30T
	DPNvbRSSn7VNGDAPo1RgLc4pVEgY2VTmhCX3GYSYOHVEtRtaUmQO5c6o
X-Gm-Gg: AYBFou13u64H2lSx3BNK+xRmzFxd3x7ucAwgBsaNbajwIOyt7rSFQWjub9QeAGKtfVC
	pKAsgEiYniIdllUd/zG/bx6pRRJ+T4r+CtVL+xUgsPP5vnJ/KfOxC0lilSqR3e2WXQGC8ew7Xam
	G6825JmIWlin1kJPQn941INE3liEdphFeX/l5HQ9bkliUTIbJ12Mt+NKcelEXEL/KZ/vvp2+Ry/
	nSQJHyH+uCuJHocBD0E2h6LYW6TGHE8lMW/09IEFbsoSfx6dsnnxW15t+uZJYQP+7xaDz7FPuvs
	/JdLLGkg9ld/QRYrH3S7XktoU92gL0QH4YnXoCkTOTb257vPu9N42VNXGE2Kcsry95jiV/9iG6S
	/+vLIqtoQSMPFf3f6VC4DagHQX+rC7NVJ/FTm1UfA2aSmKlQufgKyrLYAoDM4AemIS4rxUEbMf4
	KMF6YwyrD6c1tQZIn1YkwYFoxpZhE5o7T7NfUyfIBTGgjUmqdL/1+HBbO4GV8NfE6ct10R5w5Fy
	u1jeqcfToOOnLYtPS2GyaB/tsxg0BxPlolOJSL+knYBj2jDz8f0FTjzEnXQE0/xBg02BpgtvTqW
	+m/KMgrOLCsH3Q6T6AQIAP1qzafqd5Zi8AP2RQRGPhsNfkzgOcBwQjsFz7dA7doJ38O6bR+X+zK
	aFLov167e6iyc6p0qn7pk51qOGbxAfBv0ThIdsRin5IoVvmsWNj+htR50CXMfjS3FC0WDmcNU0i
	R1YvST
X-Received: by 2002:a05:600c:6212:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-4a1680e9466mr102508015e9.10.1791194317881;
        Mon, 05 Oct 2026 02:58:37 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c621e4966sm2518880f8f.6.2026.10.05.02.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:58:37 -0700 (PDT)
Date: Mon, 5 Oct 2026 11:58:33 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@amd.com>
Subject: Re: [PATCH v4 00/15] iio: adc: xilinx-xadc: Add I2C interface
 support for System Management Wizard
Message-ID: <20261005115833.00007cd3@gmail.com>
In-Reply-To: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
References: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Oct 2026 15:11:50 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

> The existing driver only supported AXI memory-mapped access to the System
> Management Wizard IP. This series extends the driver to support I2C-based
> access, which is particularly useful for System Controller usecases.
> 
> Key Changes:
> - Split the xilinx-xadc-core.c file into two files(xilinx-xadc-core.c and
>   xilinx-xadc-platform.c)
> - Add required helper functions and callbacks
> - Add channel configuration via callback mechanism
> - New I2C driver for UltraScale+ System Management Wizard for basic
>   voltage and temperature monitoring
> 
> Note: We are working on x86 platform support where fixed channel
> configuration is used(no DT support). The .setup_channels() function
> pointer introduced in patch 2/4 enables different channel configuration
> approaches for various platforms.
> 
> This series was originally posted by Sai Krishna Potthuri.
> 
> Link:https://lore.kernel.org/all/20260323074505.3853353-1-sai.krishna.potthuri@amd.com/
> 
> I will be maintaining the series going forward and posting updated
> revisions.
> 

Unfortunately you didn't specify a base commit, so Sashiko won't be able
to review this series.

-- 
Kind regards,
Joshua Crofts
