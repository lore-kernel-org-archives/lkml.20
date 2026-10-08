Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524734156FB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444726; cv=none; b=rmjeGSb7tG0d1EbJrpg4dDBjKOuSG/6LRcBV72DYBs7NDCblxQxYWqv+yMqV1W28wLVj77hnEZlL/ircOUvNbAtF4hRaUCSuMKqzMbG6se6zbLkZZT9apGh+XsnuXG6ssyKmZgmUjB9JEx+I8vJrWNlSijM670UoaA8GP3SE7wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444726; c=relaxed/simple;
	bh=R1OauTk58FGLCJ/MOr79hoSoxQboPp2ENsJOfzmEyCY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RbskrEPYNspGqjGlUubAm4UIvzLdWVxsjEboDy+KP3w1xyOMQkzyEctwAKdgbVeDD7rpi2WSBDO7AHThXaJakCbwSXNf907kHmB0xvcIRinBookH6FCeVox7VJY7AFAViEAfVNmiYN9ULQwZpjbInoN6nE6bWORqHCict8NMrsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWSzOQfM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWSzOQfM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so22500045e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791444707; x=1792049507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TBYqwnAjN95MxzXbUBiz1fIAS5G9TFt/mqAU6tkwBvk=;
        b=HWSzOQfMqXVe/4HDYaEpM+NCxCYL45MrZw9PDtZr85zDEPSsbkPeXb6rPcPfj4v98q
         oA9J1k+JDPHi5Cp/OWqBkwxaGZUiVActhpBCz+1ywWqm6SykFTzGMJdan58uIWLdMjIk
         MrN4/Rtg7MwbMvJeGpwFMZDiqE3Sn+UVhPvTyFgeS+9GUwxsBXzuRLHxO83hbQlYP2l1
         oYbW83KXWUcQ4oFSe1QI12+3HU63lACniHlbYFkO/dR6XCf+f8JEcKq5CZ63zzyi70J5
         m8eK/0lyYFYSlj+pDwPoN9+NSg7+dpN5UtfS+10kdSoLD1rDO6wm5ouHNTsliYXA0Glw
         5Xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444707; x=1792049507;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBYqwnAjN95MxzXbUBiz1fIAS5G9TFt/mqAU6tkwBvk=;
        b=h7oQEwG/7CJl2iXxEqOWtAJeYf5rpq6ZmrSkS10UMqh6znnAnB8xdvsh7DCJ43S5UO
         xMJLKvu/bduRJKY9E/g/FniLwT7Bodhyh2z64dOXSuwI7swfns9Za6GcB/OyHYJkuPJC
         RV0vpnzEWkdybhmOLF/fRCrIJnUjWNIgs0m0nQcu1GaRY1JLqpLowrrhll8NIlV6H0BA
         DGj+9gOvdNVMau23Zlzp11H77n9O/oHGf5M2MEgec8a4q7+iP0FF/jfhX3rcg0q2RS5g
         FtFQQh6NlNOAcxZJQBg09YItur4P5tiWJWxJu8XGEu7nhH9z76CAWwTskzAucHc5PRsn
         fucg==
X-Forwarded-Encrypted: i=1; AKwUvBzvGts/Rzx3byXYIits8lmrX4z6Tpmi9TLy8y/StHYtd+rygUfBMD4ImRy9GfJTgNLJGvM8YN3w1HbbHtQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mJfPW6XWz/JqYqLEV5XzWaU4ChFoA11Aqcu7Zyw98nI6invJO7
	D/xqNnovxiPxk13TsjG8vyJIsZFJq+mWNoWEIYEFoOWPR4hFJFVkWjqm
X-Gm-Gg: AYBFou0UpEr9Og/Z/wGLTiLTD1j9EjGTZl5767KIZhX2aKKTF7LbjX4sxyz6A3RGssV
	v44EMpkWjdgMiORgGobps9ZQA7Qw7I9n/vU05mgRJgvPJZRjtY4OvvHFN4J74H21jtpb/H0K3NT
	tSfL/9F15QYGUBWtLrDek/d5nahcf3d4nnLCSgiXxXBnFAcQ6Jb09IMNzWnAVKAXoEohua8EXJB
	LvBHFWScVmK1wm6a/yImplT5gsVwBGEgxqYbBCpdA3uHo1OUgUXe4fsgxITrcuXI8r2uaKzmBQg
	LpMSqwzly+ykBWBiHjW+NR62zWuDw+Kl+N8BZXhUNilcpWu/lnJzypOXZvbhI2SMRGFj8laBa84
	JFLn9rSPO9q53pWjgdTw7m5kFiDCevkqK3aUILFlu/iDS11I4e50+/3jgyp7mHf2zOgtm1cqbC+
	Zo87I+r+dvengkmGjo3VTa7WNk3rX1CR5lbfOdb1D4JEHc+RiFxcMiny3tXN2bEgQk3mlQ/kDze
	RlpINJQwp6pnz9dIauEC781BiRIucTzEBHlh6EVA2PZE4wgS/gZGDXdTp84ME+U9fSoHKRoiMQj
	YlFZ9KW9Onry0K0Ig9RxatkPjXQJ2GZvpZIRXmTe/k6Ohb4MT4ysxW5M9C+vkOn5JRXtVkcgekI
	YUuwX7Oa2nOjRPb2BCKbf5T+VfXoU1D8Ay/XigOGrfBuL/mOuwSXd7mUb+DyqN+B7xz7m7kwykh
	Kx0W/KYv92po4zGD3i
X-Received: by 2002:a05:600c:3b9f:b0:4a0:2644:80db with SMTP id 5b1f17b1804b1-4a180664e4fmr81750295e9.35.1791444707089;
        Thu, 08 Oct 2026 00:31:47 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842abdb9sm47993535e9.6.2026.10.08.00.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:31:46 -0700 (PDT)
Date: Thu, 8 Oct 2026 09:31:16 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Alexis Bouzigues via B4 Relay
 <devnull+BouziguesAlexis.JohnDeere.com@kernel.org>
Cc: BouziguesAlexis@JohnDeere.com, Jonathan Cameron <jic23@kernel.org>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Lothar Rubusch <l.rubusch@gmail.com>,
 linux@analog.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] iio: accel: adxl345: select IIO_BUFFER and
 IIO_KFIFO_BUF
Message-ID: <20261008093116.000077e1@gmail.com>
In-Reply-To: <20261007-fix-adxl345-buffer-deps-review-v1-1-0c94c8d0443a@JohnDeere.com>
References: <20261007-fix-adxl345-buffer-deps-review-v1-1-0c94c8d0443a@JohnDeere.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 07 Oct 2026 09:34:16 -0500
Alexis Bouzigues via B4 Relay <devnull+BouziguesAlexis.JohnDeere.com@kernel.org> wrote:

> From: Alexis Bouzigues <BouziguesAlexis@JohnDeere.com>
> 
> Since the addition of FIFO watermark support, adxl345_core.c calls
> devm_iio_kfifo_buffer_setup() and iio_push_to_buffers(), but the
> ADXL345 Kconfig entry does not select IIO_BUFFER and IIO_KFIFO_BUF.
> Building with CONFIG_ADXL345_I2C=y and CONFIG_IIO_BUFFER=n fails to
> link:
> 
>   ld: drivers/iio/accel/adxl345_core.o: in function `adxl345_irq_handler':
>   adxl345_core.c:(.text+0x145c): undefined reference to `iio_push_to_buffers'
>   ld: drivers/iio/accel/adxl345_core.o: in function `adxl345_core_probe':
>   adxl345_core.c:(.text+0x1db6): undefined reference to `devm_iio_kfifo_buffer_setup_ext'
> 
> Add the missing selects on the hidden ADXL345 core symbol, as done for
> ADXL367, ADXL372 and ADXL380, so both the I2C and SPI front-ends are
> covered.
> 
> Fixes: cf04212d1fe7 ("iio: accel: adxl345: add FIFO with watermark events")
> Assisted-by: LLM
> Signed-off-by: Alexis Bouzigues <BouziguesAlexis@JohnDeere.com>
> ---

Tested-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
