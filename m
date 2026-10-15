Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA7922A4EE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043654; cv=none; b=HYsidfoetdo/Lfc6E7FM74gbGMeXfnSNZcjrKLq7ZI0cr+flbTm8GVVu8fYtUCPgYMphiXT7oAmadGn9e0TB/zIsrbJnoIpaeXluUb4LcGsUZX4pXtSHjvFSXWYy6CvXNmHU0EujGMslo+FZvV4VAWziVISOnRx4Gssf1nYCBXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043654; c=relaxed/simple;
	bh=iY78gQe/hJ1zCYu2GUq56OaNdxTEFTdbEKCJ8jaThN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6djSEQV87RHxYglqKtcx07iYiOHAiygq8+IV3VSGY/KqAAQB/LUsDLH4ytuQeg+Uc3yJ/TSHME+9KR9wKFx4akiacwnwEjpJ8RVFaGEj1WjmWg74bTOBRSEe8vHitMxVHI/yNfion5CVnzSxu2y9SwDWiz2dlp8gzOPIBAR/TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2QJ0fbd; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2QJ0fbd"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c02782159so2933151f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043652; x=1792648452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Il+t7MgUiySLD6n5CBEL87m/q4WNqKXIxhwghq5gpI=;
        b=H2QJ0fbd4sOrKvIKRlnO/J2ACoqug/yQvf7VKqmx0Qz/wH3nnqb2F9TplAcS4MCPeV
         yCStA4CovNJyCFBxF61KNUupgOB0lSgvoEIGkcxgwL1o+/DecP+drxQqXTfDsmNBxs8t
         IOyOe8jjgWa9LWH/HAA6YKc0zYZCKJrTNQZhmUl53mrXF5C9tlMnALqqqCmK9s8n6ddA
         DRM5IOGIiONe7mKuplKtfN3u7yjt21Ykmza3b5Ksb3teYHE90XqCJ+T10HQ78psy1goM
         XJnQNq2V9bB+4BhOFB1vPoxToadj7ZZfIhyrXpfOAHd1V/JAuFY1LII5EFEyLp5n4Mx+
         3fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043652; x=1792648452;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Il+t7MgUiySLD6n5CBEL87m/q4WNqKXIxhwghq5gpI=;
        b=ggaqSW01dpndlgE3uhfg+elNmsIOAQUsXhWd5FgB2rE97nkDTAwuYl6xswCawbNIFd
         q8AWY0frRo18YY7Zek5ee06wkxo8iO7xTjy7octH9qPa22/kggDoQOFRg/1Aky3IfpYs
         lqoAL+D8gysW6jXvQpqPPM+t6WY2KgixPLratK5XBCGGObeZTmKa7OfYomWt+RYfTbM9
         6vJq07fp8AUuz+IQbDoeA9iFbb+DtcvTyZb7yYYfYrC2XWW8PDae3tugRH8pEs1VrqWo
         6S3DZ6n9fFfU9REvKOkjVYJkKPKnUSdIv/JxQXHz1HXu/jT5XF82G6z8i59iSboSU37W
         FNuw==
X-Forwarded-Encrypted: i=1; AKwUvBzAHI+KSVWCuIjq3vZUFJ6W47B5BmyWbABoeSf1HuxaIDSp+eRBCa3MybsQWTwnaPGIZlEK2NTZDG81vhU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBKpqKds3OVrSIwvnRqDLyaFI3S255Wxko7c57uEhB6MuP4M6c
	lkNZS/ShUau1SMTz9pIJem3O7uqbjH3XoQ7BRAFWhs6fSmz3I3ICBO6c
X-Gm-Gg: AYBFou1196Gm5/OyZkqp/FQ6QGB7cSIvPiKd5yfyYDxYln4xzBTnDyHy6Qim95GSbuD
	sKBLOwj26AWul6j1W8MK9tQkBauLv+/tFvdinBbo7KQT90Fe6PMC7NP3ErttrTAsBsDfXVdEC0K
	ZGvIjW34dap096MaF4ue2h/kplQiX7IzHLMK3vGZUcpoZEGXuZd/n4rn//yMYQec5SyktLYoCCQ
	EMB5VWeLh/TODRqn3ae6Tvbp89N1GrPgjVdDv9k03H2oef/qkuTX17CxLZkDHKCL/XDIcG2/B7W
	0+Xg7jo5hUuCXwtjwVgXZ+dvpNQmMcq171OGZOm6oKIXNgwYyPSt3AqcNf7HpqsZnixg3xC5KGa
	V2uO6ZPVC10Ya8cMgm0JjN0kZoC3SLKceYGonEFALpTiwiVcIcoOkPdkn0/QAZGaECCtyj50VzK
	nY/G/UqdPx2dtobZ6vDH1HZvruYMC++HsqKAvPr2c4XG8r69A9NH8EAAe6nQi2Hgrf9Zchc05AT
	y1S8A4CcY5J4J9NrF3NPmG0SOmpKvqny044NpqEYQeWsFHK2rmmpwB45QVDRux3sgMkefISKyZE
	YSDL0bp+m9ouoSqKimLj2sZQXzLqk6ZtgGRrBF3WQe0X0dfUnwJuYWWahLyuFgBYYpcjmyz5EUy
	dOX85
X-Received: by 2002:a05:6000:2902:b0:48d:cda6:4dd7 with SMTP id ffacd0b85a97d-48dcda64f3cmr30597288f8f.44.1792043651566;
        Wed, 14 Oct 2026 22:54:11 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-aeb3-cd01-f139-812c-65df-b930.310.pool.telefonica.de. [2a02:3100:aeb3:cd01:f139:812c:65df:b930])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc50e0sm21915636f8f.49.2026.10.14.22.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:54:11 -0700 (PDT)
Date: Thu, 15 Oct 2026 07:54:09 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	linux-fsi@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fsi: i2cr-scom: Return -EFAULT on usercopy failures
Message-ID: <atBnlxyXloAAGK88@gmail.com>
References: <20260914062426.14140-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914062426.14140-1-kmehltretter@gmail.com>

On Mon, Sep 14, 2026 at 08:24:26AM +0100, Karl Mehltretter wrote:
> copy_to_user() and copy_from_user() return the number of bytes that were
> not copied. i2cr_scom_read() and i2cr_scom_write() return that value
> directly, so a usercopy fault is reported as a successful short I/O.
> 
> Return -EFAULT when either copy fails.
> 
> A temporary KUnit test called i2cr_scom_write() with an invalid user
> pointer. The unmodified kernel returned 8. With this change it returned
> -EFAULT. Both versions were booted under QEMU.
> 
> Fixes: c0b34bed0bbf ("fsi: Add I2C Responder SCOM driver")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

A friendly ping on this usercopy error-handling fix.

Thanks,
Karl
