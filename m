Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898764;
	b=D0q6ToM8cmw1MvrTnvdy21uNtdbYAndgh8hMIBCq6GiSHZ1urTfL7OenRNAoE3B3q5xw
	 Z639WHMC76Lw9Tvi7jefmlsD+3dXkwEkcmV/CgVdTaceGbXrgPlXG8Lei1P11WodGEYf6
	 N5EJfwibbRs5aqqFSqskyXy/TCIroomnHFDH5kbnfiTn8CeAYYbD9tb9fGkHGyDkek4Kh
	 4cuEwV5o4yqrkF6iyTv/EhITnUU/4W71SkWrzN6yPOZThv9rh6W0Gc3SQK//p8tT5pYgo
	 fOItdGCm/kYAhKdciLt7xdN9w7QLExNPFOKl4MxHI0ndtwJ6nCgICKR+6iLP4sAaIRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6amY5D6rlAH4aaMfXl9jZY5MGkhAr21ewvoOis6OcXc=;
	b=vx56ZoiUimZ1RIk7nlBJf7k+7ajUfUc8LCi6Wfz07BsgUVRyOYoW93mALj1cMasP0dkS
	 mqV4TW5WVFy1ep2yEjXS/4ghnW0gNV5fTQPofv2ttKR+nlsWkJzen9dUsZnltdsq+2ytQ
	 9s6jAi+RTWaHdgWI/o0KqN5EulY+FsxjH7G/CA9N/I5DEhEO9NwgoJCcydprr1M82sQWi
	 dF1BhYY2Tj5hMlHXPw/XtG/Mqpmx+dfaPU7/TtQ2aTYfWdKLwkt76xmYbebLsDsie03mW
	 9wdXDCaSj9PtvRVMo6DHvaSLdnRhUTFHea9A+zMkhOFoVesEe4NNam5WQzUyrgzAiQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o706bnXK;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F3606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B36F3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o706bnXK
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso956089eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898762; x=1794503562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6amY5D6rlAH4aaMfXl9jZY5MGkhAr21ewvoOis6OcXc=;
        b=o706bnXKVTjxwXt+X/Dlzu3lDDS/oYhIZ6oVx9YrgmwSzJYHY/cbyJoukKQFRrlzbn
         javz2xmduw3YbLj6xsPJCdhW1HhtpFr3fLgGkUqDNXIRhH413Xjt3ATblslMssJ1LRii
         ktAv0yeN+zlwz7bjIGZDtR/fGkCmZPk2m6j+AHqmpXXltDVVfHhpa0C3NRWYJq28S7SJ
         wj9wBd1we6ozZuGTsWK4Xpsoj55ENN7gbXk6SHjyGSFyWWLTutoKtWnIncA9F5bQXo86
         ofOMXrpx3t20ydF1cGB9cuEmn6tMm6w768qQsfEMyLKKzGb7ZZt6SH7aLpM/XM/mRuFg
         ON9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898762; x=1794503562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6amY5D6rlAH4aaMfXl9jZY5MGkhAr21ewvoOis6OcXc=;
        b=1LJR3E+htY/dreipFrqceDUMJZIOlzaltpLxxCftJSmhOZc7R5Ncp40vo3/MCdkkc/
         3IH9Gy42kwlsO6e9ylULal8wc0Qxjvgr/yW8ivJ9kCehbJcfBGPhjyfR3azp00piM+Rk
         Dyrw72t2pDv8/bhRLMTIe27z8g9pRZngIAkBm21unKouZG4VDBlbX3EJzDZgtUVh8Ihy
         FXeyLwSug8B+zxj4qy48/fAnAB7M0xeT0DViWja6StEafdrbF5rntb64e12Rdo87u7ED
         U0tbXji6hBNNwbDpct/sv9+5hRTlNe7BGm7oK1TlobC8Z6McKti2Bjns/CZemm2w36yK
         zN5A==
X-Forwarded-Encrypted: i=1; AKwUvBwmEltA8Ui0m/lJaqgo1WLG9kicHkiSkZXIBgc+gHhw47mR6cQLrFgtUraCd7d+kRndM4mzNgNLNlYxBkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2+IFY4vyVywAIbFMsh3Fp8EhKOT3T5WPN8ar4+NvZ+7JxLF21
	cEK3lDPpJRfEmoYtgGok5RDtFC1/6+Fz4KVJAf1atUk4n9aSlW424Q/Q
X-Gm-Gg: AYBFou3x1DhWr0cbg0+Z7hHG9Ilz48+OPF/4pfWShihNJxDAogy3KoEe6tozU1kVZQE
	abJJNxyezH7FGr7loNFFAcZ4qw6EMmO/WyzvFLQ521eWIoCiE1gFresq9C0BcF7Thz1ZK370AT9
	hDK3+Za91ity4Z16MYBfydgT+4oMjiyW8gsxD7spacK1LcyY5wh++8zXTbH00AnmvpK5QK4QYe3
	LLy9WFl3Lwtd11bEUxl9wGZef8SrHcnmZxCwkMxCAH0wlXZpA4AxRhUY3oKwydMMTxrt2Nt7bMG
	ZebxjHEyToJOG+rSQwUYUlW6xHVE27YK8J/gAEm+50lDI72Zz0d5oHJBhzhCNe799ZWVUhCHoeQ
	pLP14fSSD3H43ZqG5gk4SHyIOWsaodv7vhnXrCSJh/CV4ml7s85GD7DlnU6YbJJ43uIAC/US7qo
	ABtFkTig+6PmgMk8n5/z0gXCowIk2wnXv9U/nRy+7lnFiSqDw33/0FgdWT44FV6S4k/GCMCC3ha
	if8bNA9Fqklbeji2s6q+O3Q86ZV+TI+a9f5AD4/Z8Gyg8nd+tbZmRwKl5vh+3TKFL4dEu59t7dW
	nN4eTv7D6yEaeZLIDCFz3lhBw5dYcxiDiLAsryzGdxoXAPa8lUM0mw7ajqtEN5T1Uq6apg==
X-Received: by 2002:a05:7300:dd09:b0:36e:370d:2127 with SMTP id 5a478bee46e88-36e370d264amr3168344eec.32.1793898762203;
        Thu, 05 Nov 2026 09:12:42 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm22255325eec.7.2026.11.05.09.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:12:41 -0800 (PST)
Date: Thu, 5 Nov 2026 09:12:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <auy4Qbxg-pW_X37E@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
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
In-Reply-To: <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>

On Thu, Nov 05, 2026 at 02:43:17PM +0100, Arnd Bergmann wrote:
> 
> As far as I understand the situation, wm831x was used on the
> reference board (Samsung smdk6410, removed in 2019) in addition
> to crag6410 but never anywhere else upstream. The question
> then is whether we'll ever see a DT conversion of crag6410.
> This would require finding someone willing to actually do
> the work, and coming up with a way to handle the autodetection
> in mach-crag6410-module.c so the correct spi/i2c codec
> child devices are probed.

So I guess the question then: do we need to keep this board at all? Or
it is time for it to go the way of the dodo? And then we could drop some
more drivers as well.

My goal for the series was to move along legacy gpio API conversions, as
well as move away from the GPIO lookup tables (ideally I want them gone
now that we have software nodes supporting describing GPIOs).

Thanks.

-- 
Dmitry
