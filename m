Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637124;
	b=ehBVN6QSnX6bbxLkK7PeCZouqjIo/sU5qKF3iGkzs33CvPgzTlWhJ5MF0Uw1Jsn1+Ogt
	 mOQuggTULisFLBJzTHAT/B+zE0TfN5HBsm2IzlRdWBriO7HoNwFxoL7BANa8JlaFzp0JY
	 gNHrtcagKef6uNyUvdASjJSe2TxPngGgOjlZxZhKY03uBgelkXGaoa9kkToend46/9orA
	 f3eYzBEhrvABG70xt7rOUPUGSfbg+sAV3sfY4XsCsao68tlCelsvtcXeBgePGTEcGrody
	 cFfdefas+Gi5PgwK55y7te3AM5EHbXmeAoSWBDhtzh3HbJHFBSSa4ErrtBIgMX+awnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gR6R2AHc7gBb5wkqmemqR+xmiUCYbQP36zxK6dFbSqw=;
	b=b/Dus4xDrwVahPE12VNn0BcpmhkEQYOTpnhdapT7id75YCbzWzgcWo1K6dEyZ0U7cT74
	 KEOBR89uhI2/MK/SvxONphmkzrwnSGuTiqXs2n76bvjJz9/rtnqMBh34QY9TGWRF7nH7e
	 toX+akESyRJ17VcKc1VQpnlP+IEI1KihSR8QKKUZfhnOcTKjzght8dPdZGIBX0D6opmHS
	 T2AtxNEXFaN1LZoXVsH9XgYwB1uHylkoik7fI9nOY2E89KpodXgTatEtYeczXA3uSyJcC
	 E4jqTowH1wVt2hAGQqzU1js7tx+vZJAzqzxgJ1A14nOVTIr3cNTEUQ/hXKs57u+nY4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CFouMtM2;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB326606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB326606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CFouMtM2
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35b2c599f43so3028052eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792637118; x=1793241918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gR6R2AHc7gBb5wkqmemqR+xmiUCYbQP36zxK6dFbSqw=;
        b=CFouMtM2xSUV0b2ozmgO28jJ6DsuuN+jq6w7L0pKXhtW0VeifZcL+VwC1/Cx9Z8y5P
         FOSFY6L26wy6hw+t9jxpVzagxEkWAsYNbHKSHPC87npK4/uVy2gbEEijD9OREpPVv5i9
         /W/GVKcj1wZDN6G1wmPPnAwWagsviDXNiDrjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637118; x=1793241918;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gR6R2AHc7gBb5wkqmemqR+xmiUCYbQP36zxK6dFbSqw=;
        b=srWMZKd8+1OWcq64JYN5P7PEoPsSN1B23sMaL302wf8F/BBwkCkH/b+43n1ZNQlCn1
         8j1BHP1XOsOY+kvVRQc71M3QX1Qaq0V/drm1G+/z1LJPQ8bqaBd7NYl1vehHkgKWFxPw
         GhS7VZWHtwnnSm9mAbtHEZCJxL7MEaEpmMzgari1yj8nD5NYKlBLq7CNWo5Ic6ve8XdF
         OfgrYBil4gClPzcl0FQbiQ25JosbIP8suZMZj5ahVICzwihhuCR7W0asZ0UBXCnVXms2
         j80zKB6ZanzjqIiuNJoJ6/dhpVDKQlV1R5SNEAHe6jO1wmS3HD0uaSdD8C482iKQXzHm
         BE1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxM1HfDmrWjc8VUT0nCwGFiB8duDD3gK4+vhbrQGc1j8G5iZjdV/J5EJ0bdOZsj4XBasscIvKthkG8hatY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLybIydKpJjYO2Vke00JbYxxWYb2MaUmcRu7J6k4Igfw6H9lwuB
	ZqW97NXgTxAI/7sHfrXJDt32JPTGFmXr4AxS8DOwfYYkL+bgBV9/ieK1nIfcR3Ns2g==
X-Gm-Gg: AYBFou3ZEl0ccy402Nqtm36WdXM+hSR4oBQ5nWYCYyqITCrI5owdhPpLelg1HURpY9r
	395lvE6zpkF+Z7wXLBNDTVf44Eao1BEmmIJixddGeFENsQrrAq2oLkUoSN8XWMlokyfkJX0VB3s
	/nTsl4bjvFNcHIGBy7RrkGnqanfIUAQ/sDsoTrPL8REGEpyVvVnmjdtG5FvhYUONZwq9wOTQk2/
	QTPlBCZh/FTqc52izgvwj2TYJVXdgp+7GWPX3KTxy+3ar/ULfHOyUTPlvPrn8GVcuM0vHBcSKMR
	jYfEVP9v2Mxc4Ti8sdU6SkMjYkhX+lZOs32JWysEdMRLV65Gtx+slQrK2TQePCwftDmjB49aUJt
	FYFj/SF1Qth7ZBGIHD5okzPrVo4l3qUJjxoOmuMCDp/ZObnq1sRMyUB9WZw+G9EFaIG9a+v7iUc
	s5EDlswX4HkAr4vrUfgeP7P9aKlYkzlO5/oEOgH3qSVpBooqMiPSnnj3zHRGW3sgRzPNC4bXypP
	H8jzY13Eot6AUeEQwgDnL4CF9YbHqSUtjDszPF3OAXAjVvV5DfV7ZFsDMDR9DS7t2OF816fZcBL
	NWexdXHzQ3xAm42czO+F
X-Received: by 2002:a05:7300:d0a:b0:361:7ab9:479d with SMTP id 5a478bee46e88-3674e8400femr7484266eec.27.1792637118082;
        Wed, 21 Oct 2026 19:45:18 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:5145:5add:2df6:4671])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367412b24e3sm10388672eec.19.2026.10.21.19.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:45:16 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:45:12 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] seqlz: a compressor for zram, between lz4 and zstd
Message-ID: <atl35k5lvs34BIej@google.com>
References: <CAAFOosa2WLf--T17cujJu5CUsN12NNjgTitOvno2LY7jAr1gfw@mail.gmail.com>
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
In-Reply-To: <CAAFOosa2WLf--T17cujJu5CUsN12NNjgTitOvno2LY7jAr1gfw@mail.gmail.com>

Hi, sorry for the delay.

On (26/10/09 16:21), Martin Leitner-Ankerl wrote:
> Hi Sergey, Minchan,
> 
> I wrote a compressor only for zram's pages, as a personal project of
> mine. Before I send patches I'd like to know if you would consider a new
> algorithm for zram at all. Much of the code was written with an AI
> coding assistant, with me deciding the design and checking the results.

If this lands in lib/ (like the rest of compression libraries) then
sure we can use it in zram (we are currently not on a path to acomp).
But if the plan is to have it as zram's "private" comrpessor, then
I'm afraid I'm not equipped to make a decision on that.
