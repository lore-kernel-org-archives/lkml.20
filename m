Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E5C3E7BB2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787905820; cv=none; b=VhaPtzR1VZ+BssGMB7mZ18NC45HiLpFbYG0iuYto6pWWJMJ/Euc2cZYBotEAKIRzXA842WzmUV9NQOxauOQr7xvhl7Qfe1VTnBAZjqc189rmzWfWfIc8LP2ej0eR2ALiVSmjXWgkqpVKgoLl+FrcCAIkiVHNiVacZfBWFtVLG2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787905820; c=relaxed/simple;
	bh=GLA5oKT4l4TtK6WJBIZEYUg8utU5djMOzvUMR1WxBoE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PoNete+bAA3ustkxwL3Cvkc7JZmEfEZI0supGWVGwrrJMwuELG5p9ggieeJBmkCmG84Edh5WCsV8Z0jPeBExAAakSqLi93hRu+NfnxM7+d7FNegoUlPxE6oAhpKsD+4hAEI9UzJ7bBxkX+355sZGqoktp+w9Nb375+Yinh5TLNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sws5ycGY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sws5ycGY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so4736125e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787905817; x=1788510617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdOFtk2wc0usZRCfuezTXZZjP4O5N5A5OTF6t81pXEo=;
        b=sws5ycGY5UZuXS9+GvUZgGpKGfn6VJ2OXjHQiYaKWfOghCIopyO2eBfuiIyeHO8Xv9
         P3eJdUAKymHGLwj5PLFMqHQvggHcACdBTWNU8k7vKazKqUos5IDKRzLMrtzLv7Q2TQ8P
         rpjgQqdPnztte+WwuAu7oiImByEKF8bCx0ytcYo4T2L94jVebieMPeMaRufNwUYjbIfA
         w1p4EmNsdnt8G/n53LT/OVIvMEtEXwlPM+vzVne+vLU0+Mxe9fyvh6Oitln9FEi7eKpF
         zRqvusBjzw1xPR9bAlNScYNW7OgcCOM3w0gasCzNzLL/LfGmiZLVv9uuKztU+K6TqKrH
         XQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787905817; x=1788510617;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdOFtk2wc0usZRCfuezTXZZjP4O5N5A5OTF6t81pXEo=;
        b=Gw2IDV02edr7e34Bch8bwefjPNX2Zw1xNQDBV2MGPzaCyVHEtHuu/VOeXPk8jsJvWI
         dV80YO1nKRNVxcKCIO7wUdEzKoSITKuS29+CIh+glz6Z4nMAtMUMXCmHVWsuV+bce0Dd
         sicRMePnjQLxSSYPW6LGkup3fibHr+tphwVityA0F6CeuVYIxffwkudQeXAwlwue0xdW
         pDUGgdyvEaZthntqFvLebxbO3dG2L3QYJMb89r7JXWRtoZhOJ5i/RXVbYXFF26gR2zMU
         xHOCRRJBPvmRdn7OyUnb50TLLR7A6AtT10z6Vkx5mmy7QS0nP9JCdL+gzJa130a21XJL
         BgcA==
X-Forwarded-Encrypted: i=1; AHgh+RoqiSFItK7MtD8V0ys1FUQ/xBPwEjHnbTb66RaGf6JBxUrh50psB6/QTiR5EtWfqJ0r1NHjqP7quAY/9fo=@vger.kernel.org
X-Gm-Message-State: AFuF++mHzKrxUN8z9eX4FvzvgblZpgw+P5XWw4EITkARKh0Zb5skbBqW
	2zI/ud016Z1cMa2F1zJ4aL67d3+9yNg9xHTrxfknZXsK+a5NzzrCzADt
X-Gm-Gg: AR+sD10aJlRzMiENUb8LbNO90Ra8NwQyu0UL3xt1aBcu021kZ5Tgr553Mhzb8HvpvX8
	g8vv8U8QDCINuKI/KacQ4xPNqZ685aZTgnJHG+6GOQNvCQnnCT3mG3i8NgDsjLD+N3+I/FScgYq
	uiTwwkk3J/DZ2Knn2tLLMVesshBDVMZhMpuG7uoa5va18ZFj67Avym+AlCQCvC0YanBsAaP1A4E
	ragzi1TLP/vJsNczKfWLAHD4YlkCQaky4zyLMR2BWKER89QJoF+uMW6/ZRUe+YM1BqNQ00cjvqL
	ZiAXKPqpEth5cO3i3XlMHuwP4HRats/LlKfaWwlR4fKK38np/lxaNkcXiVqDsUdbr+MsKh/brhR
	4DQC7cbfZxQADcIL3g1TdsMpXvitTi/GoU3wa14ZgZC7Uy3zaM8INRPoxHzC90d4PJ+L+YVZt0F
	meQQHdSa/qWibaiYf7cR8DXRiCkcGjYlLF0OXk+rmc4y0qoOXabx9UoEETfiqhhAiczXom0+ktq
	/D/UVKKU03qnODZKiY+1BYsFDQ8MyGRQAL4TxWrmf3dGhCDfkNrj8TJIvHSxvn6Lk+7aYs+iXAt
	e56m3XqjAPeuqk67TGp9+eHzvIQFjhBwsufh5EYDlvgPVcrJfufYFPKjhyFEfqoQwFjylRbKeKP
	XSmtVsR7lDWb9jMVgEFNc19AXnV01XRNZxKl+6UwumXqjrSQPr4vfGZgDP4I35/Us8NazOg==
X-Received: by 2002:a05:600c:3f0b:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49b91c30753mr76811845e9.8.1787905815458;
        Fri, 28 Aug 2026 01:30:15 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm41136805e9.8.2026.08.28.01.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:30:15 -0700 (PDT)
Date: Fri, 28 Aug 2026 10:30:13 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Chang Yu <marcus.yu.56@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Anshul Dalal <anshulusr@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: light: ltr390: Remove stale TODOs
Message-ID: <20260828103013.0000315a@gmail.com>
In-Reply-To: <apFDQhk9TUoLnEZt@gmail.com>
References: <apFDQhk9TUoLnEZt@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 01:13:54 -0700
Chang Yu <marcus.yu.56@gmail.com> wrote:

> Remove stale TODOs from ltr390.c. All features have already been
> implemented by Abhash Jha<abhashkumarjha123@gmail.com>'s patches:
> 
> [1] Configurable gain and resolution
> [2] Suspend/resume support
> [3] Support for reading the ALS
> [4] Interrupt support
> 
> Link: https://git.kernel.org/torvalds/c/13fad2607dad [1]
> Link: https://git.kernel.org/torvalds/c/288ce72fb5fc [2]
> Link: https://git.kernel.org/torvalds/c/14e0d914a855 [3]
> Link: https://git.kernel.org/torvalds/c/7ca4b8957066 [4]
> 
> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> ---

Next time, please wait at least 24 hours before sending a new
version.

-- 
Kind regards,
Joshua Crofts
