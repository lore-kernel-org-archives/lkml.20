Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233624503EF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922413; cv=none; b=T1IjnQpyB7qyhBQzPmKveK4ACcXkMJKXXlXdzI6AS0uSsymEArWJhUTUeg9VtsQIeMPNvTridmj1MlPUERNEYQwTQTocwOol0ERHVg+11Pa5q5hYHqdZdpZ66KuUKPdcU1Fzj+x6p+rAkQpZKPFhaED349mivzDkpuqpybAKess=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922413; c=relaxed/simple;
	bh=9HEjywerj9dI1DMv8TmODXVCvgIjH29ELxBcAtzoHqM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tjJZHwgKUSe2XkOvyFGziDVGs8YBdj+gYpgdLrprexCGHZ4DfNvgqRrLBMtl1KmcQx9CDi5IwpwdsQeGNpUhDjP8ESRHHautjP9s4d1fsKgq+sSnv1Cbkk3gMKK3sQxKl0pXnBsEZsbUe+6lJmRXeToDNPgOK1AX4VMtoduucHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nv+FsJm2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nv+FsJm2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so6889035e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787922409; x=1788527209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OSe5hUo+anN+B3supDKWk8oyF7C/bYQ978Bx8sQdufY=;
        b=nv+FsJm2Xny0Kz2h5URMPSe+TQtqERGUG3F/y2he0ggZJClP1DOkIb20WnsmG9lxl6
         UZ0kCMBQmk88yz/ijX/7GYgZIEOCXisRbpWGCDF/TT8c+ksWVzz0iqbjRGbkjdg5PQ3l
         AfjSSO88PRIr7dPa9flydD5M0JF+5c+lTpx63DC3eW411nscK3BcpFp9fa0t6AWpfOqQ
         AkcXACFHLTCiEcWq0Tc6eUtaA+8DgpENaiQKUBsKSPY9EVEnVqAtjtlUpWgxAnKxq6ER
         9VzwcoJqkVlXOfSMwW+5ZnOwLd5DoHKzIowr5U6sTC/xVzWZmes9EfJBUv3xG1pEDMuQ
         pIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922409; x=1788527209;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSe5hUo+anN+B3supDKWk8oyF7C/bYQ978Bx8sQdufY=;
        b=MCYFirjkEDdKUMmruOGpLjds2/HSDHOVQobQhqFv+XM0Ln8K1h7oK5crtcoDH6rNRy
         Cm01UXuo+nUBsawloDquUUwfO/itIoKn++PPIfTHhmUWL+ZC0bovOr8EQpMAOtBiNbpo
         nnVZ86Z5HVO1Jp8Oarqtdv18+6PDIyB+tkjFk0h+ZcNR7ZXF76fDt6ndxdDClPrpxcWK
         lO/Co4dYO9nGsvKQEguq+1HXm0jiRU93nsJ7qdul5S5+wy2vBu8afgjR/5UXtHTW/jS0
         Up1f2gf1mALUgyKuwulkKu9e6Dlb0FMBvYLKQyiLOTHiU4mM8GkcauNaqesRphMU1WLu
         KavQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdjjbtSwYO/Y0imr28nftwK8vOvzo4g+RzGZGQ3sgZ1T0xm1g2LJbveavnbnH/4zw8zzWbEau5tWvdWS0=@vger.kernel.org
X-Gm-Message-State: AFuF++nSjUwiZEs7uD/Pzxeyhb9DgY2YG1wwcN0tNBerbd0WC/JLeH7b
	hM/v65ulAsklIzERQSxY32wwDHsVreHx601h/7xUjHIfQ6hAPjmGNpmL
X-Gm-Gg: AR+sD11osuwqtSZVUhjTopkD6+aApz1+Owc5D77IEZlOqo6ntkoeSxX96fEU4/I7WSR
	zsRWAecx5X+9rxMLs1Z/EBxfAAHJRUe3QRCW1K+def9WrfDiHHWGxepCD9fhEDbGZlCRxjUbjKo
	rurPibj85rzP2J1qyKKvmFJctxI3xBcOlGPYuW0UcLzVtVgmkgwF9yrhclZxaHL7pUUinzgkOd5
	XBfGER7kuYTUIZKbL3XJY6f4UbyINhbcmMcU5Onjxl9E6ScBuA6wZYiAbkJ9/uwF2ArwBVRIZUp
	e4Whz8WNFSuCGL1TjWwkZIYUfCa0Fs8yNOQEKALh5/UGzP713Ma1C1Bb/HNh4e1qaaxFjeqjZzf
	XNSf+I6IV4KVW24YRcihQ3QvyGoEaF5HqL005qHD+MJakE+MxhhULIxrOtExxfE2OdOALptpUJP
	8cMtwfRhbLibE0BreJmCOTNKAEen5knCAE/BltNdYdop3Mu5ruC/bwWNGtdMw4T9qQ0XSQqRpy5
	ijcgtelqHeRxZW3crknctQh1/temiLToKCWXcssFy4h72WgfCijW6wnwq9A/IzyeEcvWVGGwMdg
	z90o3P/vRHz1TV6kIl4rNROUCaQOYNSJZAix8yjiaQeNQ3NcQbEc46VNeADhdV5Ix+xA6beyv/6
	cEmNWtJexQXBbg7cOD/+gpuzJ6ptwCzvQ0b6McSczRp+CpNIS8/zF6Tot0iFcg43Plebai+s=
X-Received: by 2002:a05:600c:4715:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-49b91c26a01mr97741555e9.5.1787922408578;
        Fri, 28 Aug 2026 06:06:48 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c7cfsm53999285e9.11.2026.08.28.06.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:06:47 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:06:44 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Harshit
 Shah <hshah@axiado.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 0/2] iio: adc: Add Axiado SARADC driver
Message-ID: <20260828150644.00005d5c@gmail.com>
In-Reply-To: <20260828-axiado-ax3000-ax3005-saradc-v6-0-4cea467e4167@axiado.com>
References: <20260828-axiado-ax3000-ax3005-saradc-v6-0-4cea467e4167@axiado.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 05:28:27 -0700
Petar Stepanovic <pstepanovic@axiado.com> wrote:

> This series adds support for the SAR ADC controller found on Axiado
> AX3000 and AX3005 SoCs.
> 
> A new driver is needed because this SAR ADC controller is a SoC-specific
> hardware block used on Axiado SoCs. It has its own register layout,
> channel enable handling, conversion control, and data readout sequence,
> and it does not match any existing upstream IIO ADC driver.
> 
> AX3000 provides sixteen input channels, while AX3005 provides eight
> input channels. The driver uses SoC match data to select the number of
> available channels for each compatible.
> 
> The driver supports single-shot voltage reads through the IIO subsystem
> and uses the reference voltage regulator for scale calculation.
> 
> The datasheet is not publicly available. Public high-level product
> information is available at:
> 
>   https://axiado.com/products/#AX3080
> 
> The register definitions and programming sequence used by this driver
> are based on Axiado internal SoC documentation.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---

You didn't have to send a new version, Jonathan tweaked the commit and
applied it:

https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?h=testing&id=839dc31a0c6508354b18d09a9e5aa5d8f4c05860
https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?h=testing&id=205f4aeaae3148848c153a0d98a6f604b39aba7c

-- 
Kind regards,
Joshua Crofts
