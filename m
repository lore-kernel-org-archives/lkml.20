Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203244;
	b=xXS2bRM/p4cEr2FqFsyEEkoywvZUzeEvjB4vYnyPImICx+QiqLcK4na3o9pECD+aGWBu
	 Pqc6SbkKNerg72NLTbOQ9hJdatZsQcnAkNjESsakIcVXx1OHONzg2TXPVXKtUEAQmcuBe
	 rwQgDVPZt/5NtcKmJNHN/G4Nt4qsMHujhSpri8VEu0ZpEF0bFbDpD+wz95M7AQA+6K3SG
	 JLUcuauj0OArlAG7mF2PARsagHTxZvoQbHI9TRiZWuOgKBhGPEOeoSnYhlkd6Y/wZYTwi
	 qA3Z2cZhMEHiPZBuOPuh2VNTGLysAmicPXkvns2TBRs4hay1OQSl3D2DTiOsA7TsBjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=byaI0cUQu2T0+QBNSGRsOncWnFfV4y3lh2H71TsBHYg=;
	b=IxsM/dwh66ectaGpCSXBdftNHVjcUmLOmzkQnv5sWr96GIft4Dr62SIWjcAy6e5W0Ni2
	 /udFabX6yZjMULNJFtLxhOwiniAorpfC95rZcQ2vqa6LJqqnU6Ay5k6xhaNdUI/dhKiOT
	 dTyyy5FcQvCnRJ+vgkUhXSWtqhy8Rg8bvtOkpQkC3f7t0Q6gCzOOsXI4m100T4l5KJvt1
	 aqOunVNHedhDvqjbeZXWtt7UmBRfLELb6c0Ci45FlfZ27qtRAZFis0NBxTrJ9Wsswc/W3
	 Ac8tSGpCCnRAZGUQAIFZszU3oXgVIuTzydi7U1FAosW4TeFwWwAqw/ACSFIIHgp97Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06dYORPp;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C16606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C16606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06dYORPp
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so7150005e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794203242; x=1794808042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=byaI0cUQu2T0+QBNSGRsOncWnFfV4y3lh2H71TsBHYg=;
        b=06dYORPpzojU2j2eWqVP4SeEMOaYCTvlFbcfvSI2ITWvvxv1I/yXkxZQXoZ4VWAZxj
         xkkiVGsuZiE3KkukRPUwYlYbmaSWqi9S0WH7ucuIMsRY42DNbFP+E/+uFpUSNHOertRC
         oDq/DdqmYyTDvpZk0nnlrk2u5wIPKiDJlcBm7CcF1wTPtXqJpef16AQpu9tMIXBUcO53
         TdN/QbM5CWzBaCSV/FMJWYYYxpVLbmvzcdL0hS94Ho8X0hLUNMGNl/31Rq1yWBqvuLcM
         Mq7llBlAclB0TuNmx+QE4BRFloNgcdoAARTfIZM05QBOZyDBJOUWZzCZ5j5FXKqkZ7Gl
         Wz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203242; x=1794808042;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=byaI0cUQu2T0+QBNSGRsOncWnFfV4y3lh2H71TsBHYg=;
        b=fQtoRzJGc4h3+hiR2116sfxDTCtcPQYIAKpe6bqkTM+DyDxcc3Xs2vjlysdVJpy+E1
         OeVTl0TlEbkNQ74GsGeKfkbvVTQGqZ1teSObKQ55JPN17hoqJWB3xJzdDbmhCoMaMGOu
         F0c7PXhYeKXF69EA74rVwYGrBkZ0fcCgbUzEIYYPKG7Td9nFUsd6O8v8M8+KH5kA5y5r
         bTxFibfQKWeRj8x5nlLaWQ/RB+72akcd6nAoQuhwu0gJpb5siZVYzA8l4WkreQBiL3Ls
         96khIjtylWqqE74UkLXSTpxgR0Ita1WTQg0vufl9XyuuOZAFlbId8FKHxOWjFZJuE0zo
         1srg==
X-Forwarded-Encrypted: i=1; AL+hErHFL57wge2YTCUROKWdOcWDFa/wQAmPuiS7AYAoKjpqRvj3yDv2wWw6ySaShjt1D3OJKDYo9Y7b3yybdKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kfxHanoaQTQ2XHRgyLFV7MDrTQBGnbSs4TZvXvXo6U01bJqyL
	p+mLU4ZRewRT+gNT/OasiM9D2KPBdR4NYr4e+l0S+OSiKatNIpXwDRFz
X-Gm-Gg: AYBFou0qWegiM/P1oWO52zSRv77t6s0fxRwE540GwCJI8Z0/WgZOxMcbGN53ifPhHGF
	DbOhY9NaA0UgDdOY+IvB8BNqu5jyUEzgpuWlm8cXWEWIPpj6aaHDdG1PODGLdZBCU90vVwoa7LU
	GVHXQSaLbkndsmwaqx+HRQik4HLfdSVUZ3+yQAckZQgpBoMf9NVtT4TlQIkx3d0kSMwKikWYHXW
	dUvzq/chx7eAtX/82ByEYxkvP0qTJcbd/U3Eg5Z/UqpZgJT+Tq/5kC9+WhGox0vhSqW79mtxb8F
	s4vpV4I9AbzBqOQQI8jIwXrRc+E0VTa1e9QGrYH+8sbetPOlrtNUgRPikfKkcOqWmOuw2uMqW3k
	OIwzduunR/0ASsjqwtLqQA9mp1xK2TYLgJkzwpwf0yp6TSeqLyDXJv8LNTvCjEzrtc85gZeLr6S
	WwRX75EoJV63vfLo0/fuVTHXqNlXImaF7DvoKDLCx4w7jlmD61DyosLMDoVdvsD8g2br6faooTd
	CkIhiP0i4fdrU6vpKhqN1FHL6ONPhC1Fs6SjnaUO/QNBk8lQCLwg/Z75LJjQHWflWKNmTuVoHhV
	sTWeOtMjyVQWEaQ6yUTxDp4B2hEecnK00I/V7+3SucOJ2zX+WZer4nT4pvv41I0X+YlIrSJryiR
	4PE9iTC1dpfFJcLEERMqvO8TG0e2MDl3ecVIAXALJAXLwb3kOesg1iasaav2DABj7B6QZ0sHqg0
	mcfuy5OUe+tlA=
X-Received: by 2002:a05:600c:83c4:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4b963c6a8ebmr57095265e9.19.1794203241970;
        Sun, 08 Nov 2026 21:47:21 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79501bdedsm130008445e9.3.2026.11.08.21.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:47:21 -0800 (PST)
Date: Mon, 9 Nov 2026 08:47:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jiawen Liu <1298662399@qq.com>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Markus Elfring <Markus.Elfring@web.de>,
	kernel-janitors@vger.kernel.org,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: omap: handle clk_prepare failure in probe
Message-ID: <avFeZWgJgID5XA43@stanley.mountain>
References: <tencent_B4F504456790E8BA3C4EAB80F4BFB6954E08@qq.com>
 <20260820154323.0a7c7929@kemnade.info>
 <tencent_A1BF4495D1F5E54524907BBA2A4ED480FC08@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A1BF4495D1F5E54524907BBA2A4ED480FC08@qq.com>

Andreas is the expert in this context, not Markus.  His suggestion to
use devm_clk_get_prepared() was a good idea.  Add a Fixes tag but a
CC to stable is not required.

regards,
dan carpenter

