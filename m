Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793292770;
	b=ZdxbQSF6ObbZxNkeGcXmaXES/IsMPidl8jZfa5itj7qfGO8++/sVxche0FPJjTgcQI/G
	 NVg1zX8YINgDm2PkZRv25DZRf4Z52Fa30dMlPJO4zUPaX7+xSdHS8lbiW7QWsWuTJ7aRs
	 wEf6FjdYFwL7GeDIb3Htgd1MEWamhdb19K+yjJFl3KwNaEQH7jfrpOFmtYrRvCb1zKGzU
	 HKYTE8cjngzbVOLTMdYAksXb0KrvmbBkDWrcXpd8sxcgrl1OyfnnvpRHkH6VYjnOiSrJl
	 PciV61opkfq1g7KFWrYXfNaiBebsdjsxu+qGobQU0/m4RPPREDptKrJpjRpzsVVTQEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=J3eBP1FSZq6Mi86jA3nq1zI2uuyjuit66TFokw0sSgU=;
	b=s4DpxyxH3CgkJ3y5kU4eT45rc8uzBAHij0sbnaxRVgle94A2/YawMJMuBh9et3b6NfPi
	 bkMb2zbzLu+sjwMRSFU3edCX9emky6uE0gK7bzMEaQeZFC9l/OOFGfozUOVZLmXENr+g/
	 mhU/TrcpMrJsIHR9Y61Xcw99cbn414gd1iuwq65rOC2mSyFmgvxEbyYbZnmeQyDbxIJKb
	 flnEDVmTR9qMow8+GUTcRrkSa4Yl9N0l5fbAx96QCfVuog/eF3fRYMZyP4tVnWBpUdiZa
	 bIHNUoqvNWdyCVOJNoIZXL5qgWBYBfwbPOCUJp+eoYHpiiWKpwUgD2i8d4de0Dqy7FA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P5oO0kw8;
	arc=fail smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7E0606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD7E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P5oO0kw8
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso373365066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793292768; cv=none;
        d=google.com; s=arc-20260327;
        b=bkQ4P7xrtjUjJmBqTohiyvEOyKBj+mWL0ONEdmGK1a0BNpWn3QLMDbHMhEvuN/QsBh
         mnKvQiQblFdt/dH4BeGUx/VioqpAijxHDcFM68gHTLHkeyPhvWcQe1Q2NnI6TlzjecbD
         ISXYJC5XRJjE4OjVYPCcqul4B0JU+9bS3xQYWUtMujdvRsC5uO1d+I3yh49nFbfIeeeY
         Z5MyTnkt8bVQ+sX/SkWqCbRu1VU/Oy4DgG3tPAPrpdRwNg90K8jhgCSwm0YEv5MkYi7e
         s5BJ6occ7BzxvoTIb7zLsMbj6fCivUuYDxM4sl0B1fswveQiHzLjbjBsBHzDekJGBvHa
         X8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J3eBP1FSZq6Mi86jA3nq1zI2uuyjuit66TFokw0sSgU=;
        fh=3mO8VnCMKG+Vzi1DTQIJkGhkOnClJQ4TRVKAFmn2Rts=;
        b=aU1sh7H17RVL7JS+zUL/4oDCIR7Tr1bZSJ6YnCBCjk3+smeb97yT9xplFWR1nqP+EI
         wD3s/jtl+Ql2+kBzthN2jLNLMH6thk25gEADwToEnU/P1DTWqUI43oLpFCa4A6/xg0k0
         BntD1pXeFqA4DAjBvWVAwLVSPnF4rcVBqesmKpwzoXIYNHtFGQZhvTXu6VqTwSSnMPtv
         dFYYK3rjsvRXgrvCxWCOdS8UTOnbyhyRpL3rbrcBcYasVoUk+8tavdpDGUf1bgsJ7f8q
         JJXq38gbT+U5w+rBxA1c5JtoR4JryiDxmI0UL327qymEdYs7BjhR2rW96cwxd34CdkPx
         XMgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793292768; x=1793897568; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3eBP1FSZq6Mi86jA3nq1zI2uuyjuit66TFokw0sSgU=;
        b=P5oO0kw8dmFfrErB6UXJxwaH/5rKe0IGwxP8JMcShJKUNiRynZmPmO9wodLtW+GgEn
         4qYC8+ytkp0IuTFDrBQS/Z25E8pmNiQpsVH1N3nh0RZYGStKF5qu8r9LESprQ26PHS6f
         G9mTFL6eNdxnjEyuBJP3leMyKAA/eI4S+0RiRBbLHp5601JqKn3GQYC81k8v8ud9FmTe
         +fE2I/YfbuPHqVBIVjBiwt7iX0AVQRCsWyW4g9iDu0b5pzd/rta79EoS7TcoVuff6mNf
         8KEsK2LLNKLveJ6mObhPJOgtMF2tI2aYN2ubLHhA8DXBBlfyaGVogRp+ixCrcg/Fkg7j
         oEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292768; x=1793897568;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J3eBP1FSZq6Mi86jA3nq1zI2uuyjuit66TFokw0sSgU=;
        b=mvI71XYFaOnMXD5n6+vX4jcXBPuUbVxjO2HPs32Q2wU915QhMZDYDQlQRUeRkAANfb
         X58b/jp3i7e2Mi6FAVc5U0X1GF++FIcDb752Aa5id9BX3AjLdh1X07JDUpoNMPNv14Qu
         8KRLdwPP4h84bwtHIw2txKHRjKbFTFQLs0EA+CY3YoisJgTJv0nPtoO0v/IDx7mJyLYu
         n6t6bgrHMKomaU8bfZLNZYv4nhSP8SzeieeCbi567QKa7iZn/VS6r3HdYMifuce7anIr
         tQZVkfQr2zMSBuFpvSRrLL86aImdc+uxWzMDLTsZ2/dqVQAe4uur+rQX2u5+Q+HGJn31
         vKKw==
X-Forwarded-Encrypted: i=1; AKwUvBxSgaizUSl+O1kprd5eUFo6pAuNNYmGFFrhndAfA6kO2NyLj78JsLbhR7bvvlHYmKm2g4XU89P9jIrvWZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0GxTiQG5n4RjCaeIZodB5BOxQceLeGjr+Ph15E/nB5wFL/IXo
	c2J1R9ZojuMdxFvxuIUx95se75xe91FqAzEyiubRfRSaLQozkeJUEi9AifWm2qdZ4PoY1UUfp+H
	5xOU8uw5PWvnt9Gp5nKZ8/y3j/IoIHt0qrONc0RJNCw==
X-Gm-Gg: AYBFou30kda7TSRQt0/XCvUUIixTMJ8XsMjWvScKJcP3lv1NeKhz7dQBlE9manM+PkA
	voDDBExNb9UoA5LwgbNVW/+mVmASZlopHs5wtiXrKhtpqVWdQ0c/sgLiqh+ksofjBgad5q5cPTX
	LEkpfgCbkTnSAoLt2vTkzIGpF25/35zS1mh0lA7i/7JANnTS687RSzpOqQRmulCDYsM7IZbs+VU
	3wRwcbtf1bWSv8vJD6HHu5NkBNdXcUCUQ+xylkdPKoMvOB4fEiR+MuO7ryyaIzXs4f4uJGP4HcY
	3jH/tqITxfy0sy0A2eQkx2EnIOKjG7y5r2wxXPIS7egqayPEsmrQQ0V8mkFy06zYM9jSWUJ1WAt
	9Ac+W0snCzETwadzdgbH7ktpSdJEpQo2faZv+4xIA3vT7Y5ObY4//Wa+wP43crMFvBmVztmA=
X-Received: by 2002:a17:906:ef03:b0:c40:9b75:84af with SMTP id
 a640c23a62f3a-c49bdec825emr498179366b.8.1793292767994; Thu, 29 Oct 2026
 09:52:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260831151235.64076-1-notmissinge@gmail.com> <20260831232157.27037a5e@systembl0wer>
 <20260904042215.0e21cf29@jic23-huawei> <0d584595-4479-4116-a52b-710e01f20bb3@gmail.com>
In-Reply-To: <0d584595-4479-4116-a52b-710e01f20bb3@gmail.com>
From: Not More <notmissinge@gmail.com>
Date: Thu, 29 Oct 2026 22:22:36 +0530
X-Gm-Features: AclHuK8tyP171zmJPVN2na5ixJzhMFpz0rZQDV0kr5elFfSLJ5pzv9c0LxVy1pY
Message-ID: <CANU2TT4Ycx9Qjc0pY0s6xmENkdZSRhkOofs0sonWzPxnJCnpPg@mail.gmail.com>
Subject: Re: [PATCH] iio: chemical: add SGP41 driver
To: Lukasz Kulga <lukasz.kulga@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Joshua Crofts <joshua.crofts1@gmail.com>, 
	linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, 
	Andreas Klinger <ak@it-klinger.de>
Content-Type: text/plain; charset="UTF-8"

Re: SGP41 support
Reply to:
>Hi Akshat,
>
>I'd like to pick up SGP41 support, taking the approach Jonathan
>suggested above and extending the sgp40 driver rather than adding
>a separate one. I have SGP40 and SGP41 boards on the way for
>testing.
>
>Unless you already have a v2 close to ready, I plan to post a
>series in the next few weeks and will Cc you on it. Your review
>and testing would be very welcome.
>
>Thanks,
>Lukasz Kulga

Hi Lukasz,

Thanks for reaching out.
I have a v2 nearly ready (binding as a trivial-devices entry with
vdd-supply, plus a separate driver). Hardware testing on my SGP41
board is still remaining, so I expect to post it within the next 2
weeks.

I kept it separate because SGP41 has different commands, CRC-protected
two-word results, a NOx channel and a 10 s conditioning phase that
sgp40 lacks. I'll explain this in the cover letter as Jonathan asked,
and I'm happy to rework it as an sgp40 extension if he prefers.

I'll Cc you on v2. Testing on your boards would be very welcome.

Thanks,
Akshat

On Wed, 28 Oct 2026 at 18:43, Lukasz Kulga <lukasz.kulga@gmail.com> wrote:
>
> On 9/4/26 05:22, Jonathan Cameron wrote:
> > Whilst it should be a separate patch, the route here to use
> > trivial-devices might make sense.  Only thing that might be
> > worth documenting would be vdd-supply.
> >
> > I'm would be looking for description in the cover letter of how this
> > is different from, and not suited to extension of another drive
> > such as the sgp40 (obviously there are more channels on one than
> > the other so it isn't trivial!)
> >
> > Jonathan
>
> Hi Akshat,
>
> I'd like to pick up SGP41 support, taking the approach Jonathan
> suggested above and extending the sgp40 driver rather than adding
> a separate one. I have SGP40 and SGP41 boards on the way for
> testing.
>
> Unless you already have a v2 close to ready, I plan to post a
> series in the next few weeks and will Cc you on it. Your review
> and testing would be very welcome.
>
> Thanks,
> Lukasz Kulga
