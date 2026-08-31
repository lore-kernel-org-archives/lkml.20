Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D57C3F4DE6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179412; cv=none; b=L09+HHz8X67dsj8bWVRVl7NgsY0DSgdwg5l9kSCkwtrdhJg/4+1hF4yAxmW4ehf3Ed9pMo8sLjOcq0VN8i1AFXkhjzMsMXINeRjQboPrsxQMOOvFcWWBTespUDM14rKUpJ9HxThl9ph8t3u+zut8o7J8DIFzCPonVBi1YO1Mbn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179412; c=relaxed/simple;
	bh=/E30nXNgrV4bahY3yg8DBgLw/qrOnID1ObDIyJ8RIms=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=exX5Fy386TZu3YeP2f5C/J0rfq43hULJEAIcvAUof4iRThrvYyIEdFyJJephngZoTyoOd7JsEp8Yp+eDpbmSp+jOv8LyIhkLhVt717Uj+v4L6ijoJEp472xO7losVK5WGd0DweJ7fiU6cMP24hNniqV0XTAgc11nP5rOgZT5AUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGdDASFF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGdDASFF"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so32370905e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788179409; x=1788784209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jMXUIGCQzdMm/zkOXZYp0poF59+bnF6+Vb52UOsX088=;
        b=HGdDASFF8HgRj6bEPFgmQTKzO4Gw1s/9r/WG1SUZvgJ3CQYAZ5Qt/r870vLMFFISRH
         TejfoxvrT7TrCnAstxp2ipe7Ql9dRamML/WSWuHTTer59b1iuHQOmVo9M3HmvWYXy3OH
         pazzydzZQ935bhHOzrxEOjSDO9qXUX6bu9eAAbMTA+8oz4mQnAlkKEGtuhmkS++Ntotp
         RYhg045wFm0AApfGQieILZ1bwZikVb4tddYgMuGL9A5f4F4JajAp/voZD5WI5hbSzxol
         raCH8l6y1yyDMp5Yr0sQHzr+VqYNBx4GGSaLcS7ilpR7D3ghX6CE81GoNJ+WPdJtbq4i
         KMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179409; x=1788784209;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMXUIGCQzdMm/zkOXZYp0poF59+bnF6+Vb52UOsX088=;
        b=HGb8HxVw3pTisoDnpOZth6xDl/GYzgaI0635v8dH8gM8Th9zBxSWzAZnBK5EittldY
         7ito+UhTHTubZUsUJErdw7jN8L/8CpRHraC/ifzMIAot/RoG4FDw/xCkgB4lun8AAlqi
         Ei9AQY0kGew4ygmFe7D5RKEVgd3fPu4+ZeiL7Mm0WxMyYEI/1RkpaX22/IwivKEFzC+a
         5iO1ymVQrBIuwwBLavp5ZDmYKBsckMbBGKkYCzyrZEQtBvJvjeNDAOxQaM4JFeQqPEdC
         eaHRzBAVntlKL/emrN32HvNF5OYmL/nORBto4nCz7oTXwDasUR9bcKBZ03+aHnBAga73
         1/uw==
X-Forwarded-Encrypted: i=1; AHgh+RpWuuNKigpr/BaWHnH1F35CJI+nU3ELiFlMWJJ3kROeSKkaXhbzlilBROYlXSrUU6Ztpl4AdBrjS25Y8qQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nONQGYT+evNRFvqiGpt0n/cnRuMpKfWGDIqQZQZbc9yI7eNC15
	0DFyLSZp6J/cCt8er5WFJj7sDq+j1EGcdotLBwszyrq75j7KMzEoTVKg
X-Gm-Gg: AR+sD13ANy5IzNZ+I4m2donGx/Jxd+ey2ROhyn8dtlOsan8eoYR38x7rz71XsF+ETtQ
	GG0skWl/e0JSMCFR87N4W6PU/+q17oHNGdEdg6o0qcVxGYnjri2N5QdGLVDfmAAO3OtkYg2S9cM
	6k3tdiva2tT7+Qsfqp98/CvTeRllbADGhXC2zPHk2pGeTv+fsEcsp13SJFZko/gVq9lsNKaaNIP
	zExrnzwY/bkP78IkMura+V4pFYDZFbKAZYb9G+a6PDXBcfWsdierRN4ZY8fEHm7MHIQn2+x1fmQ
	Z0PXZvqXELmBLQmu27kDjHkh6aKNv3TRoIE7Rr8a5vz9wmPz7UfyGGo9t0RxFK1YMHqGmwLM7dK
	yxYFqOF1kNAYuALMLtKpWXObdezp0TpE6Cllmyt8BUTsGyrkTF/YR3KAykPXXx2u18cXPxNc6gN
	Wfru6wF4MPl+YoPwlNY1I+9DxNd2GxERNdeVtjTk4c+1sFRwKfcZL4g2U/6ivBQy7IkzW+4pTTR
	Os0szHVgofc+df3ZnMto+oiHbQdNyW2748wwbcXm/B886eOcTwlE/fbqUpbaRiAuPBkzwu8cV/M
	ppP1Mc8VQCoRrYwDO6Gt7T9ijvdwuzZi3XOhyPjofzF9aM+b9L0m233fLnWEig4PhasM1C6w5JA
	bhaQIht/f7KOOQQjhrw6iNhBDFv7EGhHQIwrErLDoThY+Uo7E8VuzYMFyjdaypuX5vonZFA==
X-Received: by 2002:a05:600c:b85:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49cc96ad411mr305395965e9.12.1788179406393;
        Mon, 31 Aug 2026 05:30:06 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccae954f9sm216176755e9.13.2026.08.31.05.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:30:06 -0700 (PDT)
Date: Mon, 31 Aug 2026 14:30:04 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: rename stale IIO_DEV_ACQUIRE_ERR reference to
 IIO_DEV_ACQUIRE_FAILED
Message-ID: <20260831143004.00007913@gmail.com>
In-Reply-To: <apVp6vRQmyPi4EQH@ashevche-desk.local>
References: <20260831-doc_acquire_failed-v1-1-3c8e59c07d18@gmail.com>
	<apVp6vRQmyPi4EQH@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 14:47:54 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Mon, Aug 31, 2026 at 12:09:09PM +0200, Javier Carrasco wrote:
> > Update the kernel-doc reference left over from an earlier revision
> > of the series, before the macro was renamed to IIO_DEV_ACQUIRE_FAILED().  
> 
> I would argue that it might be good to be backported, but who reads documentation?

Only LLMs these days...

-- 
Kind regards,
Joshua Crofts
