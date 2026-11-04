Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798300;
	b=o0Wb4xvYFppoZb21z3EYAEslbG3/cxYYIVE4TdXBDw+XmJ0SiMqYCbOEmZWzRxhEMRU6
	 SkceOfcxDWJt81OlZ447ig/CUDGQZl+lX9MGNIl2WjHJAWLTybUqdDdyfstcSuFpVIFue
	 07EYor+pLxapInEY7IE3ohApBq6Pf00lgA1gIzhobV9wL4jGMCZRD2Fu2a4cWInacO3yt
	 lpFtkL29g239miOhZnO7TlsEcW7SwvA69kKQYefj3bjyhjTESF9FAKEcOlAM+3Mvr0JBW
	 ahd6+vH/DptiVE6KFoqLASiI+iqiAx8e7g0WVw88WicraaeAkzUpcwxNzoSVIBlvNDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798300;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NPXU/obMUBqP0IqkPu7BFvn6MXqdIXuThZBQod4m2fs=;
	b=GRtSAgDEZP2Mwv5rajjfvmdK3mqvaVcBqx0jdO2kXhKvVz5JehVbkznzDOCCBJN6Jn1v
	 0o8j9wK7qtTQ2RD4AN++zzBQKX/oUqLWqnskmYQ2frPJ5iqXs2Gf1+cEHvnn3YAmO8yLD
	 mJlVqmllvB/cBpJMmgKIcBuJm2J0KKTkioporjpYMg/jcX1D0ABLnMdyVqyXdn5vlZ7NA
	 qV5WD8v8WrZBxz2uXvTNmi95cyDJ9G7DnI0Tm5Cftfa+io3AjklbCMkoyfazic7efZuOB
	 jkEC2WlK/FVDGqMzjPXGsF61vPyuAm4DBLkFrgxW44qWXA1Q+V3LshpHjVfb5r1fS5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M89QJ0U3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30119606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M89QJ0U3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2A11F0093A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798300;
	bh=NPXU/obMUBqP0IqkPu7BFvn6MXqdIXuThZBQod4m2fs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M89QJ0U3H9lg4HLLcIlNvpm2przatOINe1OpZoTn9qaN/dTB780kKx6Png9tISysM
	 rYaa98oxNgVHAfEKhh8o/TBjlNE8KWIwNrOicJT3PJ1ChvqiTh5Uj36xVGG/hYOFgm
	 h5Z2otqQGhfjz0K0sZHxGUvRc3bNAIyCOXm38AwCvsTwvvZt4QtPgUxVru9ExhyFtb
	 FRZ2kXRD/+Iab/AAQRIT8k0aS6KVMh+vG9Psk6h1+bM8B8RbPt8HEk9ZoSAdv8uYby
	 rsUuL6RVgOgm0lDUgjkOqlVOsE1DSJMq6PmCnKJxyyU9fwE/zNAMl6cQv0hf9O0v9Q
	 0XkWL/UYRPhOQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso618240e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:18:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxu/ObNpX4gQS5E3/UICGy9l6bbUKW5TwR2GRhGzPz6zz973ECpktta+JprAjm/yel2h5/GECEkHv6qcbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5+oMLVpybeayYqM+uUGs6SGgQzoTVudBXGjmOxuRLA3SqLigm
	8Dg3Ziijt9t46IKVNTivK5eoSzm1SVlq/wRaqsEAcouUQbDpJjI3GC7yXzWB0ZVgiBSaCtnFt/F
	wIlRFvv0LV51Sf4XjkKqkfTHvosGJtkI=
X-Received: by 2002:a05:6512:6cd:b0:5bf:c5f6:cc03 with SMTP id
 2adb3069b0e04-5bfd9593dd2mr5361279e87.44.1793798298850; Wed, 04 Nov 2026
 05:18:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021145543.567959-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20261021145543.567959-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:18:05 +0100
X-Gmail-Original-Message-ID: <CAD++jLkNAiGgqhAe50Vk3RiMT6=QvrHKpQ65VLPb8wzecYHHBg@mail.gmail.com>
X-Gm-Features: AclHuK8SoP59qstHlAk4pb65hAMtLi9R0aTy844OqEZyfGGyvyHB6TDdbxN4CEQ
Message-ID: <CAD++jLkNAiGgqhAe50Vk3RiMT6=QvrHKpQ65VLPb8wzecYHHBg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Put stubs in order in linux/gpio/driver.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 4:55=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The stubs in linux/gpio/driver.h go in a slightly different order
> than declarations. Put stubs in the same order.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Why not.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
