Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B267438AC6A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714449; cv=none; b=hKCyeEksm8EkWDkF/6OaVudQZC77YXUcTbaZba+xRQ1yIP6FnGQbuxuCbOGdWnGsd7L/dq+bE3f0YrGAi2kyzmnIHWMLz3S2BxfIIyy2mgliiK2/PzKWy6VshNrd3rJna6xVVmt0doRIyG5eAv0hbc9ii3DfoPRF1AS9jNxVbHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714449; c=relaxed/simple;
	bh=HO0Fx3ax0UU2Z5oRjHrUjN4W80yZT0eIY4Z95uTICaw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DOQ7aMO9Yoh+/xA1i43nQlXqOO5Mdsmi+ZljrB7pmxehAtpOrURSVFcdCkGXusa6VlA4IDR0c4Hr/ELvpTHOs38nvVSW3DoWfio/d+EfSS6ilSyIlNC5Jy9w3wthp9kTOqAj6ARLdfnlC9t6KKypScKG0zZy4sL259ItfyW2924=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsbaxTwJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsbaxTwJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so5020465e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789714446; x=1790319246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m2zR6Ef6QPEvOrDpgn+jYsLydgVh7EKGMvYSRpLIAZQ=;
        b=NsbaxTwJde5eKu3AZ5hEc9cftRx1XUZ36TLoKn5BpgfTq3HHljGT2k5Zt3kQTCfPrv
         99AQEaIwa/Ii8zyJi/BDICbjhTbu7ug3MmtMieUx8oAF+LiF9ey4gG8u7F1vL0BhiwC4
         9hWrxsuruvyzqT8rqIdhk8hCU0vuDueJEGjP99GZlLOGNe59JZFDjT/JiVV7k0P/iU84
         GmLWefvi08K+MSLkDk5AFVTs2L4K158GaZKzshrfaxJ8t5d4xL2SfqQSZMX6bhSYN3xg
         TInUVviuvcHKRQ06a/7OZQsCDnYul+R8LR7doh1/4n9iK6T6pKWrzLaiSLmbCzp44+s/
         EL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789714446; x=1790319246;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2zR6Ef6QPEvOrDpgn+jYsLydgVh7EKGMvYSRpLIAZQ=;
        b=mUD9DWdObqSdlToqKhGXgFWUFp7m156xes5+cqy8IbYqFhczRWJOBRSRR79VKiaW0N
         0ILt4QjF7uuCWGz1rG0SYaYGoftj+tZhw0DanxINspjuMq30xklMUr2NJFbN6V+sU4sW
         xeNwBeUS7Gt65fDGw6PVVn6YP6S7IY/c+yaGW/NKVGvJol2RwKH0bLT6ukzMBgUNGdrk
         4AxaA9aiDJQn+pzdegVD2ej9HD7ckCfohXwvLi/AavukfMLY8i0a6jLcMaxEhXYCej6y
         RDeLqxeDsisTlvWS5OHugF0+r3dxnpaUeMMAGSLgEKNzxLBCClk3be0i67RFis1uV1y3
         EaLQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+46XUn3OQUiNP3mCKihGxyIbE5Ik1sPjz3d2aXNHJjQcRyLBPUZudkvN4MAlEi3+X2UVQlkE/TA1bZHg=@vger.kernel.org
X-Gm-Message-State: AFuF++nrShkRdvNw2G0VqN5SfbuwbF5a30bNwwK2FXOPXlOK4mswnS4J
	4rzDrzWnyQYFdIwHA634Usdc4W5J/1LIrGlw+mXh/kJHq45cKtLQMXDj
X-Gm-Gg: AYBFou0Yk1D90zLLrGk717cQGTB2BCq9utaveTPdj53iuJSVhfGLxHy0U5uunGLCVxH
	muPvmDr+KTOgdEyeFKCi2Q14xcVLqQ4P4OmE+MEASTMNcCk8cIaISerWtnJJYSYJsocnDuClpG2
	CVe7/ls3yHqe0eYiX0SME1P9kYPnLj75kBrex3TMCHUsxGFfDkSxcwyd+fjoRRZ/N2qVtFNckHL
	/O9BnpDic9M9aTrPwJUIRT3aghu83P5m6RULuh0buqWgAbt2lpDqxExjE5WzDFiiVfvoWRYNL6T
	0KryEngVls0UiczFMQh7Kqu8W0kS4eAKLxiCu2flVKsAqrkLuGIrskXLNysOyjxXiuq3r1ip5rw
	om3c0DmhuaocV64mAJktGOn00WmujTKm8Aw3JpAQjYQZKGSnRQWch+nJXHBG9TeQs1P115Xppfz
	AJf7YZ9nrXVelchpkmaj+7+BA5mKO/y6zXU8+A65FuTnrWmwRy9rO8mnVGUehxSdXX+DBgBM87H
	ZuGVbre2lLfk3DUpytNdqJ9AZWL6GA47/gfupckVLL71r+7xyQGLlbxJAH+R5J4Kb8dxzQiXoie
	oDeTGMcM+qhGe4x1+LGzCiidEqJx07R255exkL7rBwnlLq5gHoqcF0ijYYUGrem1oIpxULa73KG
	AHnqnqsR3lufkR9/ugySCHKeEVka4Kzffs8Y8FPVL8SkXhv94/82fPzSekS7fSA1ZusgAHj+Vtl
	UdwOIn
X-Received: by 2002:a05:600c:6296:b0:49e:6fd2:a45 with SMTP id 5b1f17b1804b1-49fc5737c43mr14719955e9.16.1789714445781;
        Thu, 17 Sep 2026 23:54:05 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5d63sm1906966f8f.3.2026.09.17.23.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 23:54:05 -0700 (PDT)
Date: Fri, 18 Sep 2026 08:54:04 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Kees Cook
 <kees+treewide@kernel.org>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 linux@analog.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] iio: adc: ad7173: Remove const from chan_arr allocation
 type
Message-ID: <20260918085404.00005583@gmail.com>
In-Reply-To: <20260917211436.i.689-kees@kernel.org>
References: <20260917211436.i.689-kees@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 14:14:37 -0700
Kees Cook <kees@kernel.org> wrote:

> From: Kees Cook <kees+treewide@kernel.org>
> 
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
> 
> The assigned type is "struct iio_chan_spec *", but the converted
> allocation type would be "const struct iio_chan_spec *", as the size was
> taken from "*indio_dev->channels", and "indio_dev->channels" points to
> const. As there is no general way to remove const qualifiers, take the
> size from the assignment target instead. No change in allocation size
> results.
> 
> Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
> drivers/iio/adc/ad7173.o
> 
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>
> ---

Makes sense.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
