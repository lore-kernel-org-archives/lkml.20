Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B09472536
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793465; cv=none; b=n0NVD2yHPPj7ApU2LEBFiWr26SCsdEHKVxpwsYE4ne5daf/PxdH7EeEC61I5KpHT+7yA6evF5RvzCVpf635lkLyf4siyhyT/Y9yGXyuy7dt4WIvWAjAs/IGecNeFkNmVNzqJoo/WATYFbgneNARhHEQM4PuiKRA1piNCf5rFi1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793465; c=relaxed/simple;
	bh=KNMVQC+0iDccEpQ+h2CPp+7RsmXBgouseN3dW7gRxc4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gJleIRZHequJQABFPHlYx1C/QpMnpQP+ewL7CZ0tFGW0BA0Vk36SqojV+bOha1P62FWT7Nz7vkBIp0C5r6MfSexrf6knL6l0WNeJrCa8/l0lp88ae21FiMJnAEHUvEOghvBYh3iR/Cu/YEylmHkRxMnBPUqeIvQ0q7ytRtRDyeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFkNTvvL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFkNTvvL"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495590dde14so52722585e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788793462; x=1789398262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rHozVKxaETh27XlRQJCL5N6I2hRb8EdRmazGxj/Cnp0=;
        b=DFkNTvvLtBQOQ4BuvIB68rPMSCDqbcSlk/ROkIIC8cfY719oZ0LINbejNN+Ro/3Prv
         RYmOxJGWRosXpL+aFsIaDOoTdhuy+LJBibJ37ZIP1gyM10FsrL2czULj+LLrOEvCRE+T
         iEzKb0mPiMPlH4p9q+tqOVPXXZ5dXSHXEKTapYlvLxBWsJdiRU49TIQ3D3JwXcwkTaog
         rCXIBDyip6mNdcUvNFyOLdiZOAhZmhg2ONcLPP5xK5pmmCwZXVMx/w0+yoKvwEDnSOT0
         F5ag0BHA3TcOEOdAJNUkhsuw8qmzVSujivXip5C75s8CUD5R28yJx8jEm1fqFCnPsljG
         uoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793462; x=1789398262;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHozVKxaETh27XlRQJCL5N6I2hRb8EdRmazGxj/Cnp0=;
        b=c94XExcHWYNNn4Ki3oQQDzHwpjXJt07nf7TXmqcJdvSAzF8MbFIetvwxpsdAS9h8Fq
         Ew3FYOf30yFsVCUoNhaXbEWhjXVHhv25WeQGVDJHbn3YRtsaHuewSmvd45PiKwJaoqN/
         FpXLwmLE/J3mmJBEGKnMoE9BsZiQN5NlLGPo34/hR3D5dKORPEhY+T8QVl4aV5zQlkTR
         cSTjfgvJ78iZ9DI1lDNSg2Ei53H1JHAJtx9QJAkdO7F4wD6NfI8hXEso9NNARHyDhCBx
         fU+KQdjuR1sP+hi2l9U9yFI8uGzbV1ziPgYL9Cxuq43v5PMG9Xl0jpGbWbzq5Vwecwff
         aFjw==
X-Forwarded-Encrypted: i=1; AKwUvBx3/Dq4BJ/AvDGpZ3rackoCqTgsjKcUZZGOBxVkFVETun9wCbYUkLmYIjNlb2MHsNIbJvfDmZ3MhSavk10=@vger.kernel.org
X-Gm-Message-State: AFuF++mG6PtGv9iRs1O9rZy6GhGpkqgtWLlUv9+mYON7QbjcphCBBVZ9
	BUc9f8bdqTHLSOHMDwtum7mGDrn9242yKvWcCqS77OS65WlyNGT9WZmQ
X-Gm-Gg: AYBFou1CdalT7zSTa6JIBUjJxQpR8nnBGwfCnhGLEb/NbD6lkMjU3RPwGe0FhdqmCGk
	SX/8/FtxBrqGhOVWqwrFC0ZuF+IiMWvEXxkk0yBpnrBT3cY1kprD98vCSl8m2CzgkdyVn+wQvR9
	8hMTW6SwLdZh1cqlSaWHPu6o++WZsN4sMXFgCl3HKbUZDZY7MLss3Do/GQXzFovQQGtSc3kskCu
	mFpP91bD1OpwS6oTVWaGO7ykbn9Hz92ymVN/zBv1oAyev4lbsDZ51wfXmeAFoSg09IlzaN8KAYC
	XwuQCcMz/CBkgoOcY1jz/Xb0QY3f+tBaz3XL+0P5TiDIhgCyxUR4hx6bm57dTUu4BnXI1zSnUc0
	o6NCUEvborLOd9LugtE26HxyAFv5yMuTyLQnsaJdWiokFUk7VADidOvGOrD4zAAkPO8UDXmaNhB
	pwSUNXcRbQe1hhW5ZvfEIS+UoSu3a9nAX5+1q9RX4cYYxy51//S+Q4sngq2RbqPjt5kWVgIzOuw
	Ld43LObarLapMB6rJZbOm24jO2C00HzJxyDnLM0W5J4hL4T0NjgTmiqJlkMkW+3D6u3ZSmJdXmu
	r7CUezmwtZFMuaE3i69DBm0EciM7666Uh/Hoje//NtPOHQujricWrUKHqmIBQuzUtxZHxix37oL
	p/JXuMxv6tGVVyPQpCeDoFr44GASRJoOoOaBBmBS5jVWuajVCyTdovR4CyRo0MQ/R3+9e8w==
X-Received: by 2002:a05:600c:3d92:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49d0726cd2emr281885525e9.5.1788793461845;
        Mon, 07 Sep 2026 08:04:21 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm310592495e9.12.2026.09.07.08.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:04:21 -0700 (PDT)
Date: Mon, 7 Sep 2026 17:04:20 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger
 <martink@posteo.de>, Sean Nyekjaer <sean@geanix.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Martin Kepplinger
 <martin.kepplinger@theobroma-systems.com>, Christoph Muellner
 <christoph.muellner@theobroma-systems.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/9] iio: accel: mma8452: Fix unintended comment
 indent
Message-ID: <20260907170420.00006312@gmail.com>
In-Reply-To: <20260907-mma8452-open-drain-v8-5-c17407e22118@geanix.com>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
	<20260907-mma8452-open-drain-v8-5-c17407e22118@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 07 Sep 2026 16:51:00 +0200
Esben Haabendal <esben@geanix.com> wrote:

> The extra space this block was indented with looks quite untraditional, and
> does not align with the common style used in the kernel.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
