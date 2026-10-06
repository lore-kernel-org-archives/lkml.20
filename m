Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B37237FF46
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791299449; cv=none; b=FNvmAjrUgscgJsolxpzoQg4nnBxNRz0Tk5vQ5CO2gkRckzPt7j8yfo8vblX14QTPSzLXrI4SeRcceoehHHvjFNVQPZm6v3uJzeBV6VjSmKiantD6oApd+57eQ3zJrB8Zu5xgS2a21/tFhcyr0IK1X7r7MrNdJ0JAZc1w8eBps+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791299449; c=relaxed/simple;
	bh=CZzQYMQ0CaouLEUN3WcNvt6IGP+hlIKiFum7Ja+K3MM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DLzm0mfK3jx4EYjZrz1Ey2Hwv08axjfbRHM96wsAyjxCRGwR4DVvDZORfDkmvPtKM1I+7yZMEvJtldUGFH+PaefanT8/TkSA0KREOTgdV+1aY5eZr4OlolJhRHgsD6/y9SJdrbcpZgSZv7mBsPKLuNtu4Qo4rIpY3T5Fapm75k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8A09YOU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8A09YOU"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a17b4c6133so8153625e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791299446; x=1791904246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nmOy8UDU42FfjcKIpdai+HCHqrBu8cVwJxEwsCYIUb8=;
        b=F8A09YOUdJS3+xdCV4vMlZ1womBpEg4R8hGmqtE0R0cfop78coMnxfdtbtSA6xpqPq
         /Gw/yWqliMFDMnjPqKBGSUyyYpsWZd60PoQRKriIg4PZcZBef+Dr+COx9+OwgYr6PtVg
         I8W2PTe6ZDfR+WTFqa++BRjmR/rXTMtDP3mBd0NUOOUfBOCFCQyZtA7qITLmQVEhVJwZ
         k1PNXFBBEKPb2PptrGAeWMntInGNVq+02e67hSfMlXEtwHSJUn6mP7dNyQmdokbDQ82z
         98wNOHTneS2TM/v1N27aZP1pS0l+cxy1FSV6ivFkIkcMgL+rPh9dVxOUcAlMfU062yJq
         QLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299446; x=1791904246;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmOy8UDU42FfjcKIpdai+HCHqrBu8cVwJxEwsCYIUb8=;
        b=zVuxWfiIn1EjvafVo89bCLrI1GwzyCL5sw2x+Qa2zuVEF2OvK5BzHA6diHceio+OXe
         UWDyljCjZjQyOplCcjo9ILcXXDFGnIG0cbUangR3itUd8yIPRvhdg+aXH5hjq5HOHEZ8
         M7a/hw5EU3ILdoR1EIPJQPPhr5YIbU1l/5w5XKhOMWT7tteg3BRjmj0IQlSLFvUIfD+5
         UGVUlFsl5pZ169pmPzhBZtfCxhEbWORMk5c6J9/RWWn1cPVN6FHD2siz3NRerFLTLkyu
         spvVU9bvRj7R2Dy4/XI3U+tnq630t+Lh/XX0C3Bisoswz5UyElKREjWdk4+5uY3ZB8Dp
         7qbg==
X-Forwarded-Encrypted: i=1; AKwUvBw2F0ny9TkXXFw129VAZAmIvOksH/oEbr/lrE9lCh+LVyQkkDFkzWWPaExA9Qywa/O/3QCcVf44nwTkZX4=@vger.kernel.org
X-Gm-Message-State: AFuF++lc06nl11EAZAi5MsRosBxmNSsDvds//iqnhKt0y6oLacd6/5p4
	hakfVe5Q70BhyC3kGt1h5mwIwLc1ZCf5q6jU5hdlUOQa8RuzsPBs9B78
X-Gm-Gg: AYBFou3mI2sx0VW+yrx8B8GkHhzRckGDRU0uFUzWI2B4K0m5a2JCUA5jW6+Oii1DkQV
	XmfYzV3hdg6UzzdQ8kbIl6OADXq21ei9IFYBVpVpmz4CdVP22xcUkm/sUwjqp472V7xIQkLJJaA
	95LC6ZlG1SMfmumFU5K26Y9zr0PAGe4FkwWgmUfd+c+sROGPpPMxmnVSdNqVBlgRK/tY0ny7Yzq
	q7rbHyt+WSVrifMWM65n4xawdd9xFjHMcfggGv0ProwZfBiawGwhzgx77nJXE7b1YaQSMurICf9
	j8epKISPZJc9cci4AESw1a3OHFQcIu5qtHB9/DZIKTByWTbIyMLTtOvriZSFahEG6ouEnQUX+iP
	n8yOIb6CWzD0IB+GX54OtiaVPLKTwyFsLCR1WxFduyCjY00SyULV7BgH0nYLizpduuRwgO9QygG
	6QonSUda9bsM3Qk1qNn+d5y1y5ElKggUHzyhbJDlXSoq/wJjaKp/HnXuLBrGwhbkFHNIeCG0L25
	jS1C75XnKWCrkcYGur/e0mF+T0xGDYZXwb37vEOeBcO5VW0j9nt4H7XDOEeDGLLIfLzp8NFkZWX
	bUIxOPRmaPsfoHq6LC2MvFXqshaUs0XKzi5oiN2ZeWsUexhW5m069x7vQvX+MM5NGT9RES+pf8+
	OJOixdwJV2COwLIRhk4wjRh+v3DU8XsydIm0zy2R2O1MLtFXin++LBjIuauENOZXy3yL221W7+G
	Bn3o4ddROnO6zY2II=
X-Received: by 2002:a05:600c:4e11:b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-4a17b554d8dmr27260815e9.31.1791299445565;
        Tue, 06 Oct 2026 08:10:45 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17a0fc2e4sm73243025e9.3.2026.10.06.08.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:10:40 -0700 (PDT)
Date: Tue, 6 Oct 2026 17:10:35 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, David Lechner
 <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: adt7316: use kstrtobool() for sysfs
 boolean parsing
Message-ID: <20261006171035.00001ce2@gmail.com>
In-Reply-To: <20261006103350.32853-1-abdelnasserhussein11@gmail.com>
References: <20261006103350.32853-1-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  6 Oct 2026 13:33:50 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> Replace manual and unsafe character checks (e.g., buf[0] == '1') with the
> standard kstrtobool() API in sysfs store functions. This ensures proper
> handling of standard boolean inputs, fixes potential safety issues, and
> adheres to the Linux kernel coding style.
> 
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/staging/iio/addac/adt7316.c | 94 +++++++++++++++++++++++------
>  1 file changed, 77 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
> index 20f6052cc7fb..21a1b811a142 100644
> --- a/drivers/staging/iio/addac/adt7316.c
> +++ b/drivers/staging/iio/addac/adt7316.c
> @@ -246,12 +246,12 @@ static ssize_t adt7316_store_enabled(struct device *dev,
>  {

Please also include linux/kstrtox.h.

>  	struct iio_dev *dev_info = dev_to_iio_dev(dev);
>  	struct adt7316_chip_info *chip = iio_priv(dev_info);
> -	int enable;
> +	bool enable;
> +	int ret;
>  
> -	if (buf[0] == '1')
> -		enable = 1;
> -	else
> -		enable = 0;
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
>  
>  	if (_adt7316_store_enabled(chip, enable) < 0)
>  		return -EIO;
> @@ -285,13 +285,18 @@ static ssize_t adt7316_store_select_ex_temp(struct device *dev,
>  	struct iio_dev *dev_info = dev_to_iio_dev(dev);
>  	struct adt7316_chip_info *chip = iio_priv(dev_info);
>  	u8 config1;
> +	bool req;

Hmmm, req is a pretty vague name in my opinion. Ideally you shouldn't
use super short variable names unless they are self explanatory/common
(like ret or inx). What does req mean? Could be request or required...

(Perhaps I'm just nitpicking).

Otherwise LGTM.

-- 
Kind regards,
Joshua Crofts
