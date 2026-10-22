Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687506;
	b=lbRbeYhO4yqOP8aisJyigVHZ+xd/9YOCU0E0XLZIwOBDHDexFNeEbUK9l2z7uZ0NjNEZ
	 D20CNUkxKN4eutqLqH6345SZ2nxquKGrejOiT74UyKW3dzRLaZtC+WodgiFX8koJ92Fmh
	 43NN86c9pujLzQHmlc782M2RBMgSK51+hukENYTrDjEkWH6VpxtEO6a4P3kHpPJNa762B
	 qJqI4i5H4/pU/TAD2y/PMEt2WHNjGAoMfhCMJf+I9WIJJAYtFAaLkcidw8QUnV7NaPrrz
	 FQ03cmr+ffd9eGW1Yl6QdRqGAfo4hobfEZIpWP76Arvy8LWQ1TY+LJmrXZGpOpG3WEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hKpXE/OzLKeXgkSwQNasbBOeBOo7rgGr5W/yMloVsdQ=;
	b=zjOb8pfyacEFHzbkh99leeqZ9uFY40RbUrHu9LJrxEtDzkXyThY9HDl3EMqeQCbyJXgI
	 xsl0l1vxNzk1X+rBtD5HV4uog5TSfHd5YvrP7UKw/bThOVdDKUIeiE9lSUiaThjGLEJGy
	 JFRAEt4KmeacUWr0YdSSLyF+2SsZBwZdB6tnpv9NMA9IjObbDFGE9BqZ/C6bdgaQRAcVC
	 8rnbo2sEnKfqQmhwwHWkyQGeX1Bf8h3qRxbh523mUF8U1rynBDXGHQWcCf5NS3J0M5jWZ
	 c77kqLhsl4/yLyVw6vD44aTwbnhPnnvZZT/N8D9Y/4/j6bxtuqstY1VrxCdC/mGwCgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RuXUwd+v;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CBA606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78CBA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RuXUwd+v
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so3050849c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687505; x=1793292305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKpXE/OzLKeXgkSwQNasbBOeBOo7rgGr5W/yMloVsdQ=;
        b=RuXUwd+v+uqXrvYx828C8JPJmu6kb/oKhvDwhTlvsEXvMihC1Z7xpUgpNTsv21llfH
         pkQ3SMl7JEWd3hRk/fEdw8t+sw4hAmvDG0zGaO3KReu2b3pJSB4YS5uZCYT6Nc3edwdk
         QiDvLb1W6POs9THcqrTAsczmOeYwenrYbT73QmZwA9Pz5QM/RZwg0PGrsy+jKUa/+NYa
         eFeNwJjfDfgOV76uFDNb22n2NDOAbPbRBZ+vzOp8jEILMCxR8jNA1wtJnWaIXdndQhc4
         wixIEtzg5JiaihzBPrL+BkeXMYjSv1FD/cbg/pvhwHSUievBqP8Rh17sua8HT2YTy3Ft
         MXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687505; x=1793292305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hKpXE/OzLKeXgkSwQNasbBOeBOo7rgGr5W/yMloVsdQ=;
        b=D8UnyE31ExTX59mibR7Q7njM+O4PHHOlEP7HKQWKNhlqLpuB17GZveKyH8UjaiNklW
         KyHw3T0MHycB5v+qpCDpzJjmca36BTecD/ocTamLVnijVHmJUdhvHTbDNCBfuZlm6all
         QsSuulFyD3Ubc0Tn3Q5WceIE9LgrcYiKsbdXdqfbdcAC+UsI9yU9Kg7o721gKnHqvzKV
         /dXvwTF9vKQpLTamhFc6zc1or5DXTOCvuImHiZMEJ1Su0tyolof20hlWKfS5srT68fO0
         MoRdOOxDao3f9l60zzMnW0iPnOD215t4bewYK/ob/n8KJBKX4K0PfLQc7jkJpvnmeaKV
         LnjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfIlsa7WR8zPTbQ8Gf8bLoJ1jq5WibTLZrHLU9SFItkIyNnwN08MMo6OsVpFBdX+5EEg1DoD6janSrLAs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIec/yU3ctamzBNGNPUl+A7b8dt+ydtkTXKDpPxDL/pSiPqUHL4
	/vVdOzfW5qdX4P5meWlTdxhInxvZSOnJAeVLUSRIz8V9p1s8w+i0hf3o
X-Gm-Gg: AYBFou0XU83wG/35l9yQ+FY8aRle/LBspLMY4puaxGeSPYlhaZkOMgyih+OWgjInAoO
	B/jEYlV33iQg16jwS5coIWUyTe37jJP0fjNqMcSEizGSG4vnid1QHYh3vicI+C+BMHSM97x591W
	1J9Ju6yxkOWkjbbvqt0HV7wYkCw+Gr2hUeO1h958I7YzhCxr5grI6IFOR/arFC7i68Kx+LAWPCW
	dnD9U2X1nJInPWy8Rw3Q1txxasZXRH1crkqvBFzZ+4BXijCs1GJZmqyi7W23W0/NVm/Z5TrRQiF
	lvV+MXDpPEf4+1FAZoIQa/9f/9JspDFZuUNXRWNsr27tSIoqTY7R4T0HkJwbXSeG1+JqtR/3N26
	1noCPqaDL3jNdo4NuN9vB01wcvIwI7tFUZNGiIik3gpcTGzZ53UFGH/0gGNEGntG3DkeUE6O+sC
	TykJuvWmjQgb1i7cAa3Th8JgsryR7D38LQOInl9sJmcuSwh3tC4v7KD5lpXrNyUzAFtiyvkrnX5
	IbHZ/cS9FbGFbQ+rMzGEbPYPPtne3ul9yytESS3h7h3nG0bpu+UnZFUiixGM340d+PV491PFeal
	4AwueuQWZu51+DKV3Ku2qO85WaBqWVLoLtHYnRFHJ53bBlv4MFAbxvuSCDog1wu22RqTMzXyXIS
	9IBVud+fGR8Y=
X-Received: by 2002:a05:7023:c018:b0:144:fa57:c617 with SMTP id a92af1059eb24-190a756bfcdmr6428996c88.34.1792687505334;
        Thu, 22 Oct 2026 09:45:05 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180adasm15841782c88.8.2026.10.22.09.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:45:04 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Marius Cristea <marius.cristea@microchip.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: mcp3564: reject devices without match data
Date: Thu, 22 Oct 2026 22:14:51 +0530
Message-ID: <20261022164452.201416-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ato81kWiI4gnI5xK@ashevche-desk.local>
References: <20261021225431.627718-1-kapoorarnav43@gmail.com> <ato81kWiI4gnI5xK@ashevche-desk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 22, 2026 at 07:41:58PM +0300, Andy Shevchenko wrote:
> Fine, but I hope we will have something to land to actually do it differently
> for the drivers that don't want to use driver_override mechanism.

Agreed, a check in every driver is only a stopgap.

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Please, shrink the commit message to the point.

Thanks for the review! I'll send a v2 with a shorter commit message and
your tag.

Arnav
