Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0923833DEF7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333449; cv=none; b=fLIFzgWA1GiPcTyFAbMjLWfQ+zyAiw18wb2fEcT0Q37r+lUqQch9lblIlkwOaEuyqKv0bvKOcbypruHTcYwABJR11F8pzLwlp4CxF6ohzJNJg7UcY6XlU5RmOcIdi3i+taNfDZVCqVTH7riLcw9axp6ombtH+clkzYh4l5/yF6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333449; c=relaxed/simple;
	bh=FcEGZKdbboa4FlcgyJibjyTx/ihhZ165/+Bkm0EaDJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsjqSeU6Etw44lPPQzEAznoFefW9yoheKdUhQSchqvqv3D/WR/YNfyZuZHrRhl5YE+kiLtp2m4PH850tWwBWi5ZKvDvNJXbkXafokl8vWNsihzZ3Ce9MzXUdNv56pkAc9Tl1nErr/vJx/vZlGRjSi+to/F7dMr0abFIAfAdSlII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c5f23666d0so643255e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788333447; x=1788938247;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t2ScekBF+Nh8awtyScLAZusIOUSKJItl3YygmIsOaTM=;
        b=GHosHtkenFNwXSYqQPAQc/UwfWpoCBqDKbGuMhBAnGpbVo8R1n9h7gjuLafXsMBBDN
         6GTa66OIaVq3IfRiVvBsaIgx5djcXUAfTp5N8ZZLRmUpdJw8PLj8mNOmQM/qIgsqxImF
         ZOqyGMeCs1TysHIZW4gKFMv7D997mS9fBnBfRuAIVVuF8wCZezSZgSSM9ObKC2ECDfHb
         DEQ2H5I3vEJCXDuqKMOzqhQ1iV3M17kqD0nqVa2YMn5OpDf8Ey1zMqgQL/eS5EdWsDE4
         1/PO4F5D9k3gkpx+HB9zZJkj/vPPlxl5orKQS8coOST9WTY5SMiY9FARBNe01qFXZu6C
         Vbjg==
X-Forwarded-Encrypted: i=1; AKwUvBysjHYWYdwtAxEEmC9BTefLkINWdUCleHstwd4hM0Hn4fwxVMTP2jX8MO6WiakfSa3FcAVd9IcfmY0c5k4=@vger.kernel.org
X-Gm-Message-State: AFuF++mo6PRnPSTWdDefsu5NQVy3YCxGWmS9KSEOEB1PnlG7TAeK7ULB
	QgflkIK5AVEmq9M2TCpUvN1uXDeZySvNWmMTwyvWYD9lhq8Bno3x8II1JUAjwJVL
X-Gm-Gg: AYBFou1vgWF3TRNshhs3U91FxQVlujMfhv319Sy0HKUQpMRjuPWsoY0rv3QnlmrN58y
	Ldl4m24p4xfflN4i89NE2RAw+QHIClaZ/wS6G4cfvsjF1vWZTSYRp/G/ryJb/VzX9LAdQz9mw6T
	5oaGVdEwWotLoW+2hS9z4+FianMMZSni7yxQ10mr1gJjObTi+OAMOMsmg9ZQoKf06mYmRkSWtH1
	ZmSR040SH9Iiok6e8Wb5rR7ldcWbK6MET1+Ip/q60nz8jw/jg8wR1v5Cder54i89SL6cscqH0++
	WwVpEbxEHQS9buR/cRJwjxpYS/xnL81M8+GAxFzbbsXamteToFS3YjtgOrSADGRju2p7ZSZKP9A
	AXgNAvUUZuKOLFJgusmiHoneguZqAKUkbYk5XFJ/vL1+VZjGO44ik8z7JbclyhqYMVZB1ojEKLZ
	SxHDwy3ZSx+o3HhGyRXP0dzmt/j1qEPy+svdlRtwZ14387fN2mivwJ2Zkx9H6L3O9uPajgQk/Jr
	EsSyT9ZyMm5p1Qxcoqn4iT1ACSNSqAQ/r74
X-Received: by 2002:a05:6122:4fa8:b0:5c5:dacb:6ae0 with SMTP id 71dfb90a1353d-5c7d2791c37mr1178959e0c.4.1788333446965;
        Wed, 02 Sep 2026 00:17:26 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd73a328sm1460546e0c.3.2026.09.02.00.17.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 00:17:26 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so441652241.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:17:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxlJLK00MLYP5gbiTDXvxL2JPglC0CJj3nxB3izT93yb867YYtRm2NpkX2VqjBCdaMk+Y0z4Pv6C3G7MOc=@vger.kernel.org
X-Received: by 2002:a05:6102:f10:b0:781:3b9e:2f06 with SMTP id
 ada2fe7eead31-78a1f3e5445mr1064326137.12.1788333446299; Wed, 02 Sep 2026
 00:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830140133.24156-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260830140133.24156-1-pengpeng@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 09:17:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWaf7hYoQPCUBJmyErujLMth-_FAwPqZ=2dF9wkN5kc4w@mail.gmail.com>
X-Gm-Features: AcwNN1V1xFGksx0Kl8r6LOPHuVvW3tElc1K5c66IrPHXI-t7NJDIFpshnL03c4E
Message-ID: <CAMuHMdWaf7hYoQPCUBJmyErujLMth-_FAwPqZ=2dF9wkN5kc4w@mail.gmail.com>
Subject: Re: [PATCH] spi: sh-msiof: propagate setup runtime-PM errors
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 30 Aug 2026 at 16:10, Pengpeng Hou <pengpeng@iscas.ac.cn> wrote:
> sh_msiof_spi_setup() ignores pm_runtime_get_sync() before programming
> native chip-select registers and marking the configuration initialized.
>
> Use the checked runtime-PM helper and return failure before register
> access.
>
> Fixes: 7ff0b53c4051 ("spi: sh-msiof: Avoid writing to registers from spi_master.setup()")

FTR, this is the wrong commit, please follow moved code.

> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
