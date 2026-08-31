Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60061DA62E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181632; cv=none; b=sp0fFagq7/tomrDuAMbgI+c3PNyLjTMeWPQ54xLVg7uW7w7jhvTIMxy2+p3pPQ7/Nv2HWu3NOT7bkJXnz4/iKeSyZyqxDTdrJjblOPODehoik3IsP2ZnyQAx5IyvaT79XIPknF9aCUNCPYnUZLrSI6+df3loKGXKdc2tRGq3Q8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181632; c=relaxed/simple;
	bh=2rPejXcedJKCMo8/yB/7E15DR/CbLvfiEl5cvaXdWWA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=D4OUZopQwWK+Ud0XYfn97WCNtiF0hJHmieb8J5lX6KB8dXgIrCtcGgdlBPaGLzInk7qPpVIyIEc6XzEUlSWl7EbhOnzuKLAYTtY3j2KBS+v1ZoJfRgWH8RYO+JwhhcsmYFkfB08vWg6yQ4jia/YO1o/Sga4LAq5cvGJUaRIRD1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGR3KZQD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGR3KZQD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so26723465e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788181629; x=1788786429; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2rPejXcedJKCMo8/yB/7E15DR/CbLvfiEl5cvaXdWWA=;
        b=eGR3KZQDHhZy+xEWHVvuPHnOapxuFIxX9oewskArZMr56KToVmqI6s67vg3yp4PXwO
         L3MdwSt7qtx0Ey7coZjOnaXxCASvNOMi3HZV60amCeIzUdgyhVUBbCMy8sKKHABfIDCo
         H954YMp1Y+myo/YQXyhjFWhPZbuUtbkjQbPKBATYRXGb53ust2qGONxO9ezqparBNl4c
         2aHWoHP8J87imRlEPzFX7Mf5qskCv2RszofqpA8DE84ailLqTTzZCOyAkdzBqmvT5y92
         BLyX5VqDIImmCrFl93D/iq3ePZ1bThL30mjNUQxpwkRMeh/G1yQIvstF8/eecnpIQ+/J
         UdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181629; x=1788786429;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2rPejXcedJKCMo8/yB/7E15DR/CbLvfiEl5cvaXdWWA=;
        b=nmfEwXLLb1Iwdew7ox3dYiqjKNeL48qY4jxylEWQup+UmKYUN+HGqjumpKVv41xPd6
         +aZbs2lT4+LI60ZsoKFb6Dd3V8BKj0yLG3F1NbujvCD6Ow2XpX486KxOSFtKDh0KTruf
         m28VjbedqHFANZV1mu9bZFnL9aQABwCoo4NbEymQofj2SbZpWRoXRnO88rAgrPZhXe+i
         bynI+zUpx1dBjcF1B4yuPd3kTjgEgFhPFGh4gCJSc37sTENz5xHg6zV2qn+/dJ7K3XRl
         UMBAc/0Rvr1Lg5JWk8ErmjjptfdtsRvo80l5hcgMclLXshwopFoPVKsP6IJxJd7RCBta
         oHew==
X-Forwarded-Encrypted: i=1; AHgh+Ro0gCGffXLt+Fqyy7yT1mCJftRUqEjPIJB0OOVz66K6sSXm4sqCt9LX3e/yZ5LJP0q3ypxh0qsse6/5450=@vger.kernel.org
X-Gm-Message-State: AFuF++khRFPRMQg1YjrM5TKLxEnnntUA3AojPU407p7OjiJVkiDMDft0
	JFt7WD/6kGkfMxQhQ36gz5GkXdx11Mo5m6HeuJ2JGMtLUmhZuu2CyHQ3
X-Gm-Gg: AR+sD13N3vjTOYlxum9DVcO1/Wf70ALMl84CgVFE50jzjzs9HmIAPYkmtOZvgKyWQZF
	hCpUVSWvUmUcQX842REA3ozeM3jqN5yyh+1syIGKC98lxSEy9CTzK/hbwCnly8u37PxqaPdnlbb
	03zOarxblzVMdaxjhlgUHLQ7ZA3OMSVwDyfXOOLDdfQJSweISkvBDNKvFem5+bMRBWUgTiYyz1N
	egsfbBvMDbGdl/ejxTMEvsWC2czsYQCsaEeOGsn6p7kl330u96rD9matmb8yQUJBMWDcWyl88Ar
	mwTUd753ZGfkNpfl4GyzUJqgMW4iR3P4TLcnI35947ZPjWIozppR0b8Zl2GIR8PtUceSFmxxjzS
	2ybXMAYHR3nfcLo1EZz43Z4CwI2rsw8mO1nWySg+jyuGynm6VVgfkcjogfTS+dQh6pbQRfWbD02
	XgVClC03FaqhMHy85tdbZVPG5fgv2NYSzawEFMuqIbpr8Zc+zWrwVKi69e05VnT3IiyQuKCvo1
X-Received: by 2002:a05:600c:4e44:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49cdca2ac80mr75225e9.2.1788181628351;
        Mon, 31 Aug 2026 06:07:08 -0700 (PDT)
Received: from localhost ([2001:4bb8:128:b749:8793:c76d:302:4caa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd775dae8sm128195985e9.9.2026.08.31.06.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 06:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 15:07:06 +0200
Message-Id: <DL35HECJMI8L.2J440RRGS0HNB@gmail.com>
Subject: Re: [PATCH] iio: rename stale IIO_DEV_ACQUIRE_ERR reference to
 IIO_DEV_ACQUIRE_FAILED
Cc: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Joshua Crofts" <joshua.crofts1@gmail.com>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260831-doc_acquire_failed-v1-1-3c8e59c07d18@gmail.com>
 <apVp6vRQmyPi4EQH@ashevche-desk.local> <20260831143004.00007913@gmail.com>
In-Reply-To: <20260831143004.00007913@gmail.com>

On Mon Aug 31, 2026 at 2:30 PM CEST, Joshua Crofts wrote:
> On Mon, 31 Aug 2026 14:47:54 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>
>> On Mon, Aug 31, 2026 at 12:09:09PM +0200, Javier Carrasco wrote:
>> > Update the kernel-doc reference left over from an earlier revision
>> > of the series, before the macro was renamed to IIO_DEV_ACQUIRE_FAILED(=
).
>>
>> I would argue that it might be good to be backported, but who reads docu=
mentation?
>
> Only LLMs these days...

And at least one human ;)
