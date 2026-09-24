Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4D149F134
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262747; cv=none; b=rW9m/CIuRgQQuXNafOOMaaWvS1uZRtYXFIBkoFhDTxA2L/1LpYm5JnitxpFDsDe8PO5/iMS60QFGOcM71am3jJuRFU58C3EIcOz0U3EQI7pIbkrsGpSXX0/UZe7nocB+XQf0VDCIZbYwkbpW27J8VB2b+2KzxvOgYlLJ9hDyuWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262747; c=relaxed/simple;
	bh=Vt+c/g5xxiGmzWWCamOWYCXzu3vd6GOa/3OwsjwojAs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tZxPqbwJWgqPx8ntF5PnCsWLPLiSpidT/Nx85f2bn+yhuVCCuHEVKQSvefoAyUOYYen0i3QkaQReD9ohGmO+h4oxIImkGf5NDHp7eRU46/KAIp83Ena5+sEgessN7CrWAApi3K/j2wuON9ihB94D9wJlEANLJdXCfAUZCAHjXps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGULTHjJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGULTHjJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so15299135e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790262741; x=1790867541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1GVltwZjugbFU6GZvacC8y2lCpU5V1LZLUebStEzuzI=;
        b=cGULTHjJyKkXrWL3YnMZuoMYFBC1kS+qXKALn74YogQCL8gxlOseB9GoxhcbzntF+e
         Ftdydv+hmxiXPLt5OxV6sCndCvqWVkhyDqFOplxe/2ibM9VIYCdix+hI2yEMmqZIGRba
         FWqrF1CJcpzlzUh9F4JixaulwxvbjT7BI9LrmOK5njUie/zf4+1WtYmSmojmDnqWK3WQ
         T/g8v7vPJ0YsqiCx95/ZlKEuPJYlGa7K4i7g/r7rpS7edaDkOopgOJMXjdLleX/5ZAPK
         P7Xg2Mz6nb+gtJXq7EXfOIrl4xR+JIdpqcQF0fIwT8DULRz1QBuEuiL6G1rP4z7Dk+ab
         t+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262741; x=1790867541;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1GVltwZjugbFU6GZvacC8y2lCpU5V1LZLUebStEzuzI=;
        b=jfbo0WNloBpaxhZkDM5k/DIEhVjd4Q5//oq5Ds5qVD6BTUVuJPr1bc6kXpAV+k18qm
         z7OTrJfxwtOUJMS09U7YSkey5F2Fg39GDEJDWNtYWBfVgC0pFCDhvqCkGANA89Rythlb
         YnX9xXg7aMtJQCksFbH5Ru+vlGSJopG3XHUPMy/5gpXGQO8dS+KrMer+PaPgLOwPeS1K
         LpZnlgd1JGwVtsKEFNeWcK9h2uRHvaTg0jkXCqri7NO5DlXxFV/sb8VDmBQAXXZOyvTd
         0tJGNRVPLG88rmWfFpYri0F140dJAF4H/K3TYnsIT5nHaz0Qf4X4UTsZYYlEff2Nx19z
         U0Dg==
X-Forwarded-Encrypted: i=1; AKwUvBzDF/p7l3MXyf/SK6tSHQqiWhdFbKzTvl/DS6BOXeq0f48BI5GcXYjyFZcGo04a2uhIonJwIAT/Wy/QJzI=@vger.kernel.org
X-Gm-Message-State: AFuF++kBIbYjz7FbPjISad/sUdnK5mFjBAVcjv+EI/bHl+s8YEXARdES
	GmzpfzYvpbmV2r3X232HXdqasoFgdtzM36vq05DkXdGz99EF5si5dWxO
X-Gm-Gg: AYBFou38tZErYviiTS2sEnkOiU+pc3neRKmvBZ5j4ZRat/eQvuFC1dz8fGfh5TNwlkc
	0+ijqjfWZaUQ1pyJobNeX0fOPvudFBqdOguoexoCqvNnTyjlgW00gwWbPF2LCKfnIrwdxEbgTQs
	c0wIxaMb6rxt4rHARPUHvwKas973+EhWGPxUPQpE1Y9E1rMDyYs7yg9IL4AkfQNgx6vUiVn+vVM
	T1zI1CX0FKHiYNMihs0hC7gXNRS8KmZmGn1JOMVU156reyC6IdE/lQIcbZf1B+LOzLAAo68vxMn
	hyX6U+a/AXKvr0d74oMnk+JnCr3uFbTfsfl+KEEJmFQoJVbgMXfB7JYt4XXB+qsNhtaUlEpPjkV
	eYJXp+2Zmgq52W7pYswVug3M68+C2I5UAL4d53LFZgKO6+IvN9alu715ZtiMvui4JOUbvLp3tZn
	5lDpXsiRXGs9pJQj7Y3kPkAB63Myd0YgvcubrEZddDONW5CfmxaaJEYNT3VtbOhG5/X6uzLojMX
	c06TFfORZ7BBooz2h7Q5uIDB+VybL1z1ehPpH/OyOav38+iqKqTS48udBpIfHJ6zr0vfHGf6Qdm
	x90d7gseUJLINEC0UUPz+osukQlj4ARQJ0BN/nJ6uYAUrBnpGL7+PAzyxMZBd0aOIkMv1TphvrW
	aTBvos1EdKdjwHGSYM8Y/WGAALkhRuloaiDHiRVDZ1U9OPSA6kDSZEODmfNJlBpHknwfVP8SC19
	0Fykif
X-Received: by 2002:a05:600c:c48e:b0:49f:ce72:dfe7 with SMTP id 5b1f17b1804b1-49fe6710a41mr44375865e9.35.1790262741344;
        Thu, 24 Sep 2026 08:12:21 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd3d5csm72255225e9.14.2026.09.24.08.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:12:21 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:12:20 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
Message-ID: <20260924171220.00002cbc@gmail.com>
In-Reply-To: <arUxl7QeiEzFlI7O@ashevche-desk.local>
References: <20260923-topic-sm8x50-iio-max34417-adc-v1-0-41d4ba1bfc41@linaro.org>
	<20260923-topic-sm8x50-iio-max34417-adc-v1-2-41d4ba1bfc41@linaro.org>
	<20260924095457.00006ed6@gmail.com>
	<arUxl7QeiEzFlI7O@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Sep 2026 17:20:07 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Thu, Sep 24, 2026 at 09:54:57AM +0200, Joshua Crofts wrote:
> > On Wed, 23 Sep 2026 21:10:23 +0200
> > Neil Armstrong <neil.armstrong@linaro.org> wrote:  
> 
> Joshua, below also something to you to pay attention to on top of the good
> parts you covered already.

Thanks! Unfortunately a v2 already popped up on the list today...

-- 
Kind regards,
Joshua Crofts
