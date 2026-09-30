Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733132CCC5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751871; cv=none; b=Mt/LWti+rFndqJJa9m1yiSqfrJg1obvOg2GsfXvNDbo1lLXkCzs0sKeUU9MvGOfeTNSci7edmFRRwZOq7wb4b1mv0WdEm97XcbPxxai774K7E1r/PMTXG4huJ6ipgB6uBN5CmC9bffsI0NCsomIMXvcu9+hpZtOQ4psA9M8mi7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751871; c=relaxed/simple;
	bh=yFAS9/v1M5fbag8LFxiryNj/dstnuUqvUFxvrR3AwQU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsycTNHFQzhSV1PCoKYwIZ0o6/e06gl/NXRdfedlMbvLvZM8V1yvwan7/2aFvnkSRgFHXpm7hbD3R2zflBqo0B4C1sbxtfMEtZnXGBpWtd3bdk+Rl90oqj6Ndv9YYE15XmMEBQ/z4I8f0QsBdkj8moSUxWGBfAmsyd5jA5FVTIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnTTUOBU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnTTUOBU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso20410585e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751861; x=1791356661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fnSRLEDUbCFQeuJzEmlR0hd67GUctSzHNjgJH5Lw/K8=;
        b=lnTTUOBU+jsn8hrSkkt4kxTHigXzJm9Q8hDlQrLdEHPwgcugKEqSCxDSEEsVM6Intq
         GmnqHW/qF+w0zG4L3l7aXznXGXfsiirAt+AaveCPAP2RndVi2aYwV2o7BwhKOlXz8AUv
         pTksh/g+nWUXwwvaBbD1bJ/YmPIxoOGY7wZbKP4v2XrPG2wtPLigtUiCizmR9SKFQTqZ
         WxSvDAPmKrevkRJuV6FN7725pTXIiPRdZqdThYv3T5p5kmz+v023Iex64mGZKZIBANIW
         uzetawdKfW+lvq53W11iHQEnq88CDlEMSuvRQ4mat0HSPINims5PD0tr2FEJfHKESWDP
         qO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751861; x=1791356661;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnSRLEDUbCFQeuJzEmlR0hd67GUctSzHNjgJH5Lw/K8=;
        b=mi968eIwcNWwqd8ox7XTjCGdiJy71bFvE5dTflCKYu5HpturkZkUoLeGlybn2Wj8BL
         1OfCiwc+oY4EqulYh3a2StpSBnjdEj9/FBaqKigHyaTBJK5wpYGVm3cob1S9aewZOyzL
         nNzI60HGuSYr+urFfdUnaggcsakwRAA3m9rqf8zFwk0FhPXSyW9/uAduIrCqBoGPV6M9
         QGgoPLiSdzq8TEUTLSFcrPdZk4AbQl8LeQy+kGG0cSTRpBU/Rqi9bf04KgpQOCWTesP/
         aXgLeLRpUV9tigt7f2xfU1LHtr4BdWbN1zZl6FM5o0hvY9niNiGFLvhqf4Hkfq/d8T+/
         fXQQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5fRn8nIvTaI7DDGk3x5Dp+pAd9KRLYNMuvfVeb5y+S/7QwAD25RCZghrppXYtdrZ95ICzfhOUdJkv1rY=@vger.kernel.org
X-Gm-Message-State: AFuF++kr4v3WEzsmfhgc95du14j9tqS/vaoW22sz2uP6fSElGyAv47uN
	gdtsiT+2nzHjVF5M52mC/LOMnq83+0nHRSSmxY2rsbGaD9TGcB//MCq9
X-Gm-Gg: AYBFou09xRS4yeeCdQcCDpQ3jSDM4InETjchvCSDQUiy3n0gLck9sdjLEXplL8rJ7mB
	PpIjVolanvyXypELwZODkBZ2+ex46S0oSOeM9NLZICd8h8J5UbF1c5IIroYpsu8ekjg9EcYNz19
	+eH07l0kylDBnVboiyKgkmhKBR/NNX8hVlaFY4gAfbpyHgY/1emSapKvQYJmfX224QQRNChvQ29
	OcKATt9AfiQSaB8WDMOkF4omh4HVwLF/sL5mUhEmKC10EBH5MFiqnSKbm0Az1pwXxYGPWfd6CFl
	T9/2QEOSx59fYrKplwVgnhRWOj8qyljdRDb3Miu9ZW3bYDq7LF/36fLEnai1kJiBV/MaGzjKX5b
	JdN4fDxQ/NAKgPhw9Nw8ppW6h60ARN60MqQWoAYCZI7WNytaEenDH4e1T4ekyw6r/Zk8whebPiJ
	tE88qgvz3z6xAdqk/mYixBXUj5J+EL5G1MzGBmiukZi+3oZW3SC9gMFjQhf0fu72rKt7KRrKdWw
	s8TpRO4P88wL6joBNO4hYOoRiV6NcswFD4mZkYuN2aprm0ah2ArNJgqSJ0bdKgt+g94b+zqugcr
	qc+OegfdnBnPUXu/RE6zdqDlsF7Ak/x31qc1Nf8DqC1y6WDPjknnDn5yW5935q6uYQk15SDdqUz
	o8a1cNa2Bcyy9nOzNJ089i9iKNhEOmccZ4fFfEmYcAr9pUY6FGObnyXEoqjmVtqaW/U1SI4nqNv
	XksuxQ
X-Received: by 2002:a05:600c:5391:b0:4a0:1559:bafd with SMTP id 5b1f17b1804b1-4a01aff068emr5650595e9.8.1790751860600;
        Wed, 30 Sep 2026 00:04:20 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02949a5esm1515980f8f.4.2026.09.30.00.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:04:20 -0700 (PDT)
Date: Wed, 30 Sep 2026 09:04:19 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, error27@gmail.com,
 narcisaanamaria12@gmail.com
Subject: Re: [PATCH 3/3] staging: iio: accel: adis16203: clean up register
 definitions and drop redundant comments
Message-ID: <20260930090419.000073f9@gmail.com>
In-Reply-To: <20260929184900.39515-4-abdelnasserhussein11@gmail.com>
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
	<20260929184900.39515-4-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 21:49:00 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> Drop redundant, single-line comments above register macros that provide
> no additional value.
> 
> Vertically align the macro values with tabs to improve readability and
> conform to standard kernel coding style.
> 
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---

This seems okay, at least the macros are named exactly like the registers
in the datasheet... but I wonder what the others think about this.

-- 
Kind regards,
Joshua Crofts
