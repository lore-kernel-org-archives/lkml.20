Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0723AB29B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911284; cv=none; b=WDpPV+WUWTj82MOvn6/qDJewWH6swHaJC1Ikg62kY3vCqZZV1FRT4SG3mvIgHbL1kSlPJ+Q9BEAj00VZJNDSuFnRZPqZbeSraaVyRXpI87xbU1lWTunAt2RK2DuTgFv1vQbejnwBTWd8PDh6CQb77m4yDyeX58mbRIQRJ4ZUM38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911284; c=relaxed/simple;
	bh=orsjozxBZeT+wGghT0EHb8YkNsbbJw9UBRcSf69LwFE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ELuXyKnZXw6xXL0vVnulXN5HMdF3NogMhj1mHosDbbO49+wF10Dt5iuWRznvy/m49io5FH+nMftUS4mmRNGY322mTJwH95BnCqjs/KSJRxDbtExnEYYcItTBgIiURQiXLrqTLb1DLJoOdj5xC5WpvoSH6GXoNh4GdKGZoMu6CcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndQWzNbl; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndQWzNbl"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso8749415e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787911281; x=1788516081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=THvdq2ntZwEYx4ps0NMR1RlHkdeyM/nQsNOsv9R8Y7Y=;
        b=ndQWzNbl8xDpxyqBUvFITfsnfre58IqnPrVQNDQf+VSqxkgPLwdltiwsHEeTu6w6By
         OAMulH/crQ0uOttcMz3kA96fYHJTECvj+nGZo4Enc/lpQzuwEP34GFFDlGsIQuyaJG0A
         kTsDMhBUUm8mhSY4l5sC4IWdi5PPU+kx2qgIFP65AMF4BgqsckjxqsLpGXeoFk8eN1pE
         Tz6FZFSyF1aFUCOcWG2eFUIKWksspWXIdO71W/S5ype73BS6u9Xj5Izju3EL7kbICjc4
         JtO2OJYNfF3cXE9MlZdy+HUCVTjYJfsHjAHE2xdO+kTVgfZfgwuLIzw320jac2oC1qIN
         vUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787911281; x=1788516081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THvdq2ntZwEYx4ps0NMR1RlHkdeyM/nQsNOsv9R8Y7Y=;
        b=S+7OzIfyd016mfLBZQVKGBrpBT1mc+lfg2kfvUs5SUuVPTjDB2zSKi11x9JMyMhBlW
         7TpUP9DA3LkeETTVQzf84GThQacS4Q/YEX5zAbOk/R6DokzXLQF2pNaTfOVPBvbFuuCD
         UJByOL3yWvAVfF98J8lflb1650IcaiAfHHgCGWMb/6fOYw+HoRb86HJtxjIh5IWyT7Ih
         uYKSqXiX7jf1o2yc/d0KoRy3dhJrJQS1hrilgSUJU33NR/h2QLOFkQ9XIh+LNlaLRqai
         /tjn0i02hMBXrRKVQRl+uQz9lKrGn31Q/qyzxwzLNQbqSbi0/JamI9VEaMOCfVYnt3Y5
         4+2w==
X-Forwarded-Encrypted: i=1; AHgh+RqNXl0XGmx95M1EDW7yzj6xOoGa2BAFsy895PDl1kG9NTVI3O9MDbyqZFX/5wCut+1yDLUGN0iy1B35cI4=@vger.kernel.org
X-Gm-Message-State: AFuF++lJPgZIR5+Ji8SR0BUPuIwBkvT9V/CDW5bjpNkkjl20aFPC36dW
	4M9t6WtuQQMQ72LkSPCGJF8EjTBTQR3Du95nePIknYBtTywOSmJVwiZ0
X-Gm-Gg: AR+sD11IZcsFQyXwgY/mW8xZr24Tw9ni3o8k9OIz9PS/MLLksrI3OWn0V67uJUdgnb7
	129BbHM5Xj54fvIxcZNen42hdNUwJ6ioSMc0QDGOX+WeoUqTEK629kfgQmBata1eMoT6YCvS8Vn
	acLpOosEBsO1v5AjXf+aqhYTWMUSkLim+bTb3zwSrj61dPgkNjWHAYAPva/w9okNhQ6wqSojpLN
	dcu2z4G4xVT8coIMnXfa/nSjbGEinj/0TYotTJxpWCxmBqfv700S/kPTSvshhpdGAFxwkNhhlwN
	o7vNjOCeTLgbLqtLVrgPg47N8OE9QUYHXNnjpVWiX0QMeGY4Sps3QkHR4Mp9P4J/89j6atrBSSq
	KVz+d2b9rx0uBSqUQuhqQ2zPU7Z9wo9pEjVKhn7vsy7j3hCMd83cQOlgnWK2XKFnYx0jT2Ld4ni
	KWFxWaPidTOXD/VHeDCxA/3SeYVT0iVFjdFQlxWG3nQTEVsnRtfwKN3uX6g52mJxlQQw2c4oe7k
	/FA1oseRDYoJRhSogfX0Kl1D4+aO1ZfH5OlfaCtlSAAd8SGmDsZ6NEDrDTf1TSMM19u/vUQAGv5
	xbZ6e4FBHW6irUh3/9suKcep6/l9AwL00b/yv6YvvL6HqCw/9Fazabts57W+WijnZ1MUzPNa8JR
	A3WkpLSDvRxaCleyv/i48adHdbwupaVn8OBB7fT3SRcMjdPV6Ra+/ha7yWkkm7ia7zQQlQg==
X-Received: by 2002:a05:600c:a106:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49b92df8833mr53912515e9.4.1787911280853;
        Fri, 28 Aug 2026 03:01:20 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc103dsm36740705e9.1.2026.08.28.03.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:01:20 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:01:11 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Cc: jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 gregkh@linuxfoundation.org, andy@kernel.org, dlechner@baylibre.com,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v6] staging: iio: adc: ad7816: Use modern IIO attribute
 macros
Message-ID: <20260828120111.00000aab@gmail.com>
In-Reply-To: <20260827214721.19395-1-mdmahmudulhasan1511@gmail.com>
References: <20260827214721.19395-1-mdmahmudulhasan1511@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 03:47:21 +0600
"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com> wrote:

> Replace the legacy IIO_DEVICE_ATTR() macros with the modern
> IIO_DEVICE_ATTR_RW() and IIO_DEVICE_ATTR_RO() macros.
> 
> This includes renaming driver-specific callback functions to
> standard <name>_show() and <name>_store() formats.
> 
> Signed-off-by: Md. Mahmudul Hasan Mabud <mdmahmudulhasan1511@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> ---

Also, as trivial as the requested change was, please wait at least
24 hours before resubmitting, let others review the code as well.

-- 
Kind regards,
Joshua Crofts
