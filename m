Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB7E2E5B2A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618416; cv=pass; b=WnoWY0cneTJVfJVg/ZcemBDJL6QKKTAQP///Aq2KZIENvdPH9OLzwD/susOGXbEeiaHFzqLow/RExJHJSUitwv2kidCZV+cGyJ5O0lnQB8VCUkUkfD4b+sjbKEMTvE3RAYrhBZ9pMc8VXXQkNMh3kdVKfYV1QTlIIcXpl1+HnZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618416; c=relaxed/simple;
	bh=0I91rrcpRDBpQavI0QACCEFr7s3xG2ezpO5mspv/Nxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AsFmBaoigQCgyI7pegpCPzk0pxh2h1wlXoM2QKqcZ4MuuKE/inGy0rSlwWEbTfHSlJL+T1s2QfVOE3bNRqGoSGPFq2M7lgEUYiH6Vp/DoqvZe1DUznO8V9XUi4YJis5my0gi4gV1E0KNdXv5T/iaO2MxrrqvqGt4f0p3mMTFLWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U21pzqh0; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U21pzqh0"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so519863166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790618413; cv=none;
        d=google.com; s=arc-20260327;
        b=IS5nhSlAYpFvL6YiAj6OIKtgCdhJcQQpO/hpQ/2SFq0CUBbUeT+xgqXS3peDvN1xfX
         qNUfv1Jx1FgomppRDpvYnix7RRhHIGtvcePwl15su3XjcyXgXFNrx+Tr1Pv9KXkIb1D0
         YcYpsNsqLMhwZt7BK9tb38aZRN+We+sF1McFT1jwPuUGRb1ZCaGYyGXdwKXUgr6g7yVb
         TItCqNEOljZGl5+yAjKS10vktne7exzqh8vRfX5e+YyNrb9X9m4nlprdmakjxbxsJWJF
         yEGA2flVSfMaENL8BCV01xAG+VeyOs8WZ5tmKf78cE4IsYONJRA4wGmjssbzeMpciMP/
         RZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0I91rrcpRDBpQavI0QACCEFr7s3xG2ezpO5mspv/Nxg=;
        fh=+TFEx86qCWQk5nczksFcaXiAoRYNGs56SWhdaP/JIp8=;
        b=d8x/d0gHt13REHhWM8QjYTpF0dvuPl5OWTnI5fbR0KvRgDd0WWMA2h3l5b2Ln+IB3i
         brIw1poCynhzWRHpZZkADcIaP+QG9lHk+lSaCdWRsjHW8OXBTx2DLqIAJOppbw/S8Q4D
         B7r9iPREIdtksP3BDpOQzHJAR8BbFXKteZ3Js2VgAB3D/V28imXCxDteJRzU6/ApS5FE
         OCMoQpzfiLg27vu5V0d8ZjCuRbxQB+bLkN/8A7R90/XNS6mVznZOAO+fevsUPP2LQzT8
         mMjzkJWwI1Y2G/+s/HN8+tJpsbzI8d3Kg8CQlKOovuErP6xAYSmB7m3sS3boJ0Vsnz1K
         Ghjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618413; x=1791223213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0I91rrcpRDBpQavI0QACCEFr7s3xG2ezpO5mspv/Nxg=;
        b=U21pzqh0G+cG6Rjf9vpVHgRMS9c4h61p6EdkOkzXqcFp4HEZ34aKN51eDof9C+m/sy
         N+b/8FkJrjf4V/d08YLgrtboZgDtYCwVyZLQIg7VGu8OH+TV3Do//RVIh5JepwHQu8zT
         ITyUwhYeyibKbeE0jPcP7tXSTtKblVY1HDq9xW76YbE992OgvSlLiiwjX+Bnc5wQRq7n
         vqeZhghlPR9bEYlfOL93WkzESH0KdFS/+XkqHTI2/QlL5bt+RDIMvJXTbm4JFOnPHETR
         RNAQTF1hJJTTfhTcOAeJogPLoLLVHkmtsyrOyGntBN/QHp4q0WTwTzAdysTK5FYCU6k1
         vTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618413; x=1791223213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0I91rrcpRDBpQavI0QACCEFr7s3xG2ezpO5mspv/Nxg=;
        b=WcwuaiiPDfpzvfehvnRb0PUvIk4BDFlMcqRycMO9T8pliBrFqcGQOW8fUuhT/mCMk8
         T32TMEG4bmtP7DQfoqAGZyNaiCOIKy11PNsczYjxTyEBiQJmx1WV7u6FH6vpih9GDgZS
         /4TZdIxlAlPPX5MHdcdFVUvGUQYymnEYTU8cUhwd7jRoZr+JCn0qi3UY3Q1Ajifi9WWi
         LBzrHvxLkxGrj9o0PC2FTPdluAGwm9EXKC+WVRKUcSRVSWCG3x1Oap2RKn/pkAQ9Qboe
         sN9R9UMDXx3UocknQYUAYGKeE8pxbqx01PkndeNaTwgbtFs8yuu8DzQYiDHLIdH5USVu
         goTA==
X-Forwarded-Encrypted: i=1; AKwUvBwCbkrW5X6YArb9/5eARAZdOYOrfWAY48ss+pQhSqonzfO8euhEucET10r+yhn0ZaA7VN1myo3C/wKDb2o=@vger.kernel.org
X-Gm-Message-State: AFuF++nTZGAlpXZaWRAeeeP0xn1Q7ZhEtjE5z9VLqys17+wQJRaNO2pZ
	Hbz5ABO8h/GgkKak5SRFgvvBPpjewGKyDfl1Evm5PFp4ZwAk4+M7Z7i61O8aF1LwRR0hhme8gx/
	Mrxrf1dvLf6/LZ5gYq+/HA7qSWB5qRxI=
X-Gm-Gg: AYBFou1US0gH1cTwtd3vg/T2zMBxN5eUvqozZ535nrXDAWnZ1G3OyI+Mt3DVilwSwfo
	nQyXk89bSOh8yKrecqQESz/qQDq0bB6vp3sHXQWVZbdEi7T0l2k0eZxeb3EsESWue6wIwAVVL2r
	Z9rAuoN44wmpXHUtYFgUoygaMjdugF0eGQSyX+qTm9mF+jrwgu2eQ51Iotxp8IgKzoH4nVSY9I5
	laldlsLxT1eqDaIl5qHRICLODpB9ZU9Kh+8t952fboMfVe+FGIxCka3uUic9nkkblXOhaL53rSM
	612u9CfnNImCkenPkMwZ3v2B8hgq8q1B/X9nijUqDow0gVN/B7zCDBCXZhqfJiok7/tSLlnsEmy
	w6kxkG5KZkS8bXPgQdBqzMRu7/Ec0KA0thAyDIRh/sAw4DVDeUNuqmcjE+N9TEx2qofNIUEmHN4
	puSUrWx+UxYUMVRQNjb341XToWjNrpkwQ7fVp4ivTR
X-Received: by 2002:a17:907:e155:b0:c2a:c799:d068 with SMTP id
 a640c23a62f3a-c2ac799d409mr775442666b.28.1790618413239; Mon, 28 Sep 2026
 11:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928175049.86941-1-jwuerz@gmail.com> <20260928175049.86941-2-jwuerz@gmail.com>
In-Reply-To: <20260928175049.86941-2-jwuerz@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 20:59:36 +0300
X-Gm-Features: AclHuK_XhOB9oxmJMY3hrhIvGwqZTaiueHFkjkBAMtGU0VsTwDCtlnHkWSnBtVw
Message-ID: <CAHp75VditdLK=ehv2f_9Yo5m=6zVg86u==sk5sY4ACjJ+hWr7A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] iio: imu: st_lsm6dsx: Use C99 initializers in ACPI
 match table
To: Jared Wuerzburger <jwuerz@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Samuel Dionne-Riel <samuel@dionne-riel.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 8:52=E2=80=AFPM Jared Wuerzburger <jwuerz@gmail.com=
> wrote:
>
> Convert the ACPI match table to designated initializers, in line with
> the ongoing effort to do so for all ID tables. This also drops the
> trailing comma after the last member of each entry, which is only
> useful when more members may follow.

> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>

> Link: https://lore.kernel.org/linux-iio/aroutl04Q99mqJor@ashevche-desk.lo=
cal/

No Link for the suggestion.

> Assisted-by: LLM
> Signed-off-by: Jared Wuerzburger <jwuerz@gmail.com>
> ---

With that tag being dropped,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

--=20
With Best Regards,
Andy Shevchenko
