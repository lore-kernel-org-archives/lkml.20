Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794397862;
	b=SnDJxwDghS+bhEWDmYwzd5VFlg4yoGOiaerFNvyPnhJMJDqY3V0/0E7B01o8fqMXG1bn
	 BmauQ/n1sETXzK/WaJweoGd5+ItMQVnkjkUKe77qBelX5q4v/lz4rkphp0LfBb9Nfy0dk
	 x3sNoFAxlRHPqT/yLOv7kk1tzn/Lgez7qyqxbxxR01rxz9Abba15Aiww92yhI4RIymXuG
	 ksaFxdIjv7dTeeFlZPIjJYwPcweER/IUlZIoRaJTEb7IXBMsk9LGpRTpUbFpGTjeBIo9m
	 3/1dybzuLsGYkjO7WM2QXWWcp7WGddojRVWLkFUfuiKUQvlA/v0p88fNiuPoinjchaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SvJ/yakFDduNn4r/1BAeP9p8qTqGeWwQTRNwHFqESl4=;
	b=3LgdRzueSIwwAeF8a0wrsDN2T/WrcEn+F+A/PQeaLQpYbBTfYyVrCOUIlOetzdRyrB7X
	 hhrCZb7Tzst63DxNf2zS0gmmCAdVQc3skiH/ivMhnOj5sXrKBqZhqVlnFzPN5OOQeh1m0
	 1kIIIPq3j9QHbeVWmk+7B6O3DqmbdncorLjJy10V+kYzy94KRdXN6Uj190z/raDXWXLwt
	 pwxTYPheEKMOlu9KurhlFZHPwpuJVuyth6YkQ6ZuEr09TwRK7OSmX37Em0njhMF2imC/o
	 xKh6gCtDWMVM0T090c5Shj3GV94XJbsVYfTMwagXGLGrujUB9OL6ck/GXTfFHxVUTEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=V5b2CttP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1689606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1689606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=V5b2CttP
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93efc0452b5so203816785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:51:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794397861; cv=none;
        d=google.com; s=arc-20260327;
        b=VC9Yvv+GCqGd8OKgsgsJ/+eI7ouVkhxNpJbquarXWhsCL8XmYcLhyYyighzQeS4eP0
         FMGUDGJzfF1WJv8a/B4HNRKFlEMfq5nBjVDuZzCatOO/inZ9gVaRUagmaazBx0pb1l1Y
         6IrbrtnUCuULCm8tJ/MU5X4LCDcjLAjuFNiM7Q+JB6AW0j9fu7sZAuYEB+pVPO1+ZVUo
         FmeGbiazpotAlwKXxD7TIlTmsYYt1JH0VMmsyRAUG1DLIL767DzjuahvUi/CU2f1wWFp
         4lQRFt2UOh7DdYjRpHLG3giuCHeQ2c3/G2qOUXWkcIfg3jDYzomAvGOS5mz9/EkVjHJo
         RW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SvJ/yakFDduNn4r/1BAeP9p8qTqGeWwQTRNwHFqESl4=;
        fh=lqhTYq6KIdkCtJgl2RITEi1SFO6e3LFkIn0xfJQCJLg=;
        b=c1BCeh/hJPK2HwJ4wd9imsg4lW2y8SSEIqKwB0aL9hB9wke5gwN8r8eAMZHSUuJZKI
         w+LFh5BaOEQp3tB3YCGKekA7oeo0iC5jfx9yeahobMx7HsksznWDdbY7C1GfSRBS7Ymf
         yshJrSQktOgm57aL3S94sJQ1uyBEtP33I7DJRwQpfZiElShHjFjLzfw5UhH0n5I1HNUm
         rafzjfb+SnEjQYcRVtqwLqcwM/WbSjzSHL+jqFJxRBLVUu/i8xVgnsGFUwzrmAwvBBdd
         6CdA+CaGcZ3YnNW3qhRbSA7rnpoI6VLyEGXZxVrNAbB8VrCCKS/uII7hIZkrtMjCubgZ
         xrqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1794397861; x=1795002661; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvJ/yakFDduNn4r/1BAeP9p8qTqGeWwQTRNwHFqESl4=;
        b=V5b2CttPgbaVLOVj6ShAbHXi4p9RJT87mHYSQ2huFLF0TIid3B0OYYsH+S43C8BZV9
         9D+7K5VTtq4qrX6bb+aRmpJWX4OF3zJh324PqWGT1mn5sCmaEY/mlYE8QO/HSeLnzz+S
         Lp5LcjvplpXXuqRUqb9o/5LhjixxkPgMhPUxWDdl19PZhejlNgF6B0vLWL7IRsNblZRL
         BQF+ayRBoIUIE0r+npXYv2+V5xhmi6ou+bwi8JU7E72bKUJFC8OLdfnbRUYt/bpm8v/P
         EDD6hi9UaGnRnghqrhZhKUn1jl9/ZIH1mZCsmv3gyaT7BSi3sRQsQ+sbLT+M9LY+qzqb
         qpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397861; x=1795002661;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SvJ/yakFDduNn4r/1BAeP9p8qTqGeWwQTRNwHFqESl4=;
        b=KDPt6RTEu8ZBf+IWEKNg8oOKmrUoMldQiy6BKtyYlYNnxOO7rkBU7VnVn16fq7mUsS
         /kBvuYDxIanVmHBuTWix38yNnS8dVIR3a4CyuHaxPBViMM6bxupGMYIKvt1Ar6OVyzGp
         Cl12Wr4bbb3Wtn/oM591NUDakBnOvU+jp+oUqd3ylAZMhY/Cm2YyNohKPbhAu5YeEYKH
         QLWkMOL3w/H7BrRm2EG0Psu18hiRUm9WzQXT1aeonJGuSf6jjiO2uJmPxKikVMoRrPPC
         PRWSRvaQbMHgIs3hX/UanYAN8kYeVFtG55+1fhx7tfGXfvlPIfX/79voh+zK2JZRCfuF
         3Mmg==
X-Forwarded-Encrypted: i=1; AL+hErEAb0cfPCnW7eTiqFBIbxGxoNLc4UR3BxWNptd0tt7s8N9bonOvgGYOVtwIeOySeJQi3WtAaPyz5JCzJV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8z/R5WyGbxQQo8YiSL5Cn84bGkQT9mEG32WfAotNzvgQoProwR
	JbHqj/XpZ5lm/sje+MjLNqHaf4xlMI1ulPOcqrY2F0R1h7+OhwKk5rxKQY7fN9Rx0yR+6Xszrc9
	p8DWiKGKi/xnK5u9Zq0/KImaAUghAzh3oTT2/NM+Uq2RzY1GHErIheQ1lWA==
X-Gm-Gg: AYBFou3nrLxTCfN6h0/720Mi3CFGnsBAU/b2PQOCSAP0H3hQsHnzidHQAoFlrb45L6F
	g56ATbHN7034LKCPeTrMWgjmX6fbjgecJhTdH+W2GzgEbCxFoJ8dWmS9A/iLsR80WbsLVqbAXkE
	AJTjqfku6xAFmZQ7Q7j/jBkY/qHDjs0FEdo0sGw7BRbaJNZ5nSajIfPa6RYRHA2GttZ+FQ5ifh/
	DpdWyBd/9ljL5mLeIBFQ57FpxbuF6a/xZAjNWuK/8/TaHSX/okoaMoTs81tF22F3yT4ToPMeY3a
	IfVdJQnhTzifwqcm3MxEPlL8zR7hRU9+HAds1zmcHdlj1/UP2qsxl7aFDsDkCswgTmEiWooC339
	sQzioHEHgfxk/JUCqJ2sgwZOOcFeXD3zMHw+QwcvhAWdNIWgWIb/4ekGPrGSA2JatnoJsdgAz2J
	x7BtnedMIMzTBb6def
X-Received: by 2002:a05:620a:8908:b0:93f:34c9:9259 with SMTP id
 af79cd13be357-947affef9aamr308328285a.50.1794397860820; Wed, 11 Nov 2026
 03:51:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <39fc883cf1c7077bce8f16719cca59060a395b02.1794347059.git.u.kleine-koenig@baylibre.com>
 <avQrO4etMgpOhvwF@ashevche-desk.local> <avQ19KBnQ2mnhZa-@monoceros>
In-Reply-To: <avQ19KBnQ2mnhZa-@monoceros>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 11 Nov 2026 11:50:48 +0000
X-Gm-Features: AclHuK9yXImPSOD4H34XxYmcqqFrOLj5GBNrtIWsMZD69B4vZ4xDk3_xNWS8s7s
Message-ID: <CAA6zWZJd7Leaytnf-BfHu5ujAnEhTwSB2007KXnV=eE=pvpz4g@mail.gmail.com>
Subject: Re: [PATCH v4 10/20] mfd: Use named initializers for acpi_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lee Jones <lee@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Zha Qipeng <qipeng.zha@intel.com>, 
	Qunqin Zhao <zhaoqunqin@loongson.cn>, Thomas Richard <thomas.richard@bootlin.com>, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Oh, I wasn't aware that Pawel is still on that. Initially we had a list
> where Pawel indeed was assigned for acpi_device_id. Since then I went on
> to do these changes per subsystem for several *_device_id at once
> (instead of per *_device_id and subsystem) and stopped looking after the
> initial list. I might have mentioned that in our internal chat, but I
> take the blame on the lack of coordination.

Hi Uwe! My bad as well! We just had a chat and now agreed to proceed
in a coordinated way and do all *device_id changes per subsystem in
one sweep to reduce the amount of churn.
