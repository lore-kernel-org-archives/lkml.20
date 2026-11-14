Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641248;
	b=DPi4mtEbuVHoM8xUxrBrWlByROVn78wsmgjpQFIWvxbqCw3w9HlhgCcoYVHUKlMnN9tm
	 axt+8i8VdG/XuLdMzwc7sQSy1P5FuOLaqzIr0V0ecWLb9eGJTtW8tun4KqwUd0yLBVhtg
	 x7YwXxjKpsRO2QTDeReSQIE8EwPZqkC5E4cm4eSztW84bLFW7Zk2okoe47ethR4olMHbT
	 k+7JykA5ONyl6J/QNtHWMDz1NhIwW3lNppceoC4WltqAX7aY9tniYnhaSUNt6sZ4lUEtt
	 aV9+wjNmpY2N4/vOYCCXZjxDAMaXnRfj5BtNxXLdP0tiYtXr9u0H64ZsCDGBoE7DjJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HRL6vIGNzmBBlS3DC/VjwZ6m9MHEtJ+5vgV+r63OYc0=;
	b=Nj0haBpyLwrywZScVmrUC5F4binBmR8YFOxrMvevF4J00lqm0/NOjS0FU5QSleU9wxzN
	 yJM7EbBQuPt/rjm/3KOHc2eg7TnM2TWbQB9i6A2ykAuG/a0IHINUcuDA4jHtSO+G4lOjg
	 hP0GmkfMQM6lczbtVDtlEQJmqx9pDffg7V8W/HHN3EomynxcSebhwlBG25J9TVguipmGN
	 UTILwXT0LWUG6l8h6PQev0Qj2k75wjrwcYqP7Z9wZp/hXZ/As+NB2cYHFQXoPlWYAxkW0
	 V8fYanlOlWBhT+l0lTAkcpL9Rhl14u2lmcZxhAaRtnrFMLvwiJF8xS2IChLlaRu/zug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qIGXU3Z4;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B664606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B664606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qIGXU3Z4
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3417611eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794641247; x=1795246047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HRL6vIGNzmBBlS3DC/VjwZ6m9MHEtJ+5vgV+r63OYc0=;
        b=qIGXU3Z4jXmEM9CVu3DsWA2oTW/VefTlhNjJk5xexnyCRaPHMVrOEt5ZHF5tpSeo+S
         yVZjdIsrjqqTw0QN9xKxIyPoJYejmZse+YJsc9al/rsEAO7qJnWxUmKiVQ7N3EJFgxdD
         qUcoGD9oWOj/Pw5ehg3zurOY0GjHiwsBmRPflt45AiWZg/HKY2q4somD2ncVeKUaDyup
         hjeZPNdhak+QPasVFlUhs0gc5smXGuAeOi5X0GBJMLo4Nz87M/M0R+palV/EEOerBI1t
         /0yhaOszCGlK5tKDfLfRz3brBtBUEAJ6v3WJLcW17cbyRQpFC9Y0M3wSY0PQPbVDCrXz
         f6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641247; x=1795246047;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRL6vIGNzmBBlS3DC/VjwZ6m9MHEtJ+5vgV+r63OYc0=;
        b=nR5Q9bItBk0bZFWfLtlMXViriXRP46m6moRzem+APo5LT1cKjCMJnRY6UL8GIYc0JE
         O9pFPh+Is4kc8/ew8+MaHWhVqiAWfNrOEDc1WhLZ3fTmZFJ8FL7Mahp6eExSfsof+iEx
         L0W1bxVkhMNgwJDgKr1sycwFsey9W78/PKIf6K+/8+W73AFxgzc9+0c5k6SqkXTwCaj0
         e4YivanAbaAQ/xYwqr9CVqJAidG4oKlfURAZ5SEzFL8PT0v5TQueWPcbVRbM5I7lfC8P
         szDStEIzvWW010gx+9bHAjNx+/bvq+n0FMB3B7qIQ/fF0I2FletjVGRFwYQj4E/N9xZZ
         T21A==
X-Forwarded-Encrypted: i=1; AL+hErE3hB+ribPE+jsyO/Cxx6HorAGSTz+w4fFWhG3iVpc8GPr2alOmf0DUN/e+DZujpKG9PfOO2+1VRtCE4oQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uDllhuPmpNS1VPFOU7IIvoaHuQtVoT9zPsKa5Bf9++xQPPHYK
	YdqmKS7c0DmFsCh5V3HxiTx2IAWTTtFmDUcRboh9w/hFD+aH5DXJtdNf
X-Gm-Gg: AYBFou0xe+CDUNPaP+ZxqofqIxtM6ZoiM+4ZNwCHgEH7n+BKHQsAZ8wVXiU/6ZmEm79
	qz/w7pKVqyzVxl0/idGmgwDZZ/MVnheOPOfdjlT9BTgG4ah+4aqRixcI73AjTTKRB5bCYx/7xmZ
	o54iViqpui8YMZx+9tZjLG9Hnhm4ZpYa9eIb+JqkJEjVPiRKCMii+uXQNXrbmLnpLVs9Jof28oS
	EahH7YQAhgPyzrHsBQYXn8IANZtam6xI3McVprwtD48kDeEuPrI8H0sp2QNIWNwd2mw1zwtBdjU
	NOMtihCgls+Hm4eGGU/z0pcwP8ir+Rm4/zLKypnWbSQYStLbMm2jx9KWZVcNR2may0L1PkJb4dR
	dw50PYBlZI7dUXRklFvPh4mmAuZl6bavESqW+HfxiSFx2fuXoKvuDK0NBfpDDW3fD4KYoxML1au
	ShEYVo+03lEzTOcVaY1FW+4cMr/tTzwjZTeCagKymSutxNqs6HBKRIuJg9NBOBEuldFuyTTt9mG
	zKzygqgjYns8p5oqdJulqgpEoGSkPsezByfOP8HiDE84Fa0yZi4LNJsnqh3Ijdtt5XF+/Tszy2V
	MnTjUW7zaPu4bYYhcOWFmoUQiJC/KQrkNKHWPBYFP535Q12fRpsYAyQspoG7j9QzjiKABsN7GaK
	IkJS9vbahGTlu1DGDHCwLoWKk39Wi3kcZINGSEDlE5YsZ9pQe6hZcvGv20nm1AHXxEsjylZQUJ4
	d8t/fI017HzzMiqns5PZBD5ev7pNKP2owUF8Fk2CrOEA==
X-Received: by 2002:a05:7300:828e:b0:375:dbeb:b363 with SMTP id 5a478bee46e88-37966a575camr4240798eec.28.1794641246996;
        Fri, 13 Nov 2026 23:27:26 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm25914706eec.20.2026.11.13.23.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:27:26 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Niloy Meharchandani <niloymeharchandani@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: frequency: ad9834: use devm_mutex_init()
Date: Sat, 14 Nov 2026 12:57:19 +0530
Message-ID: <20261114072719.21558-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114062021.142296-1-niloymeharchandani@gmail.com>
References: <20261114062021.142296-1-niloymeharchandani@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Nov 13, 2026 at 10:20:21PM -0800, Niloy Meharchandani wrote:
> Initialize st->lock via devm_mutex_init() instead of mutex_init() in
> ad9834_probe() and propagate any initialization error. Since ad9834
> already manages its remaining resources with devm_* helpers and defines
> no remove() callback, using devm_mutex_init() ensures proper mutex
> cleanup on probe failure or device removal when CONFIG_DEBUG_MUTEXES is
> enabled.

Reviewed-by: Arnav Kapoor <kapoorarnav43@gmail.com>
