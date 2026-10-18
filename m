Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE427421254
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792358690; cv=none; b=J06HAFh5CQoODTiwEuXA1yJgg2UQddACi1biuoJyznGqYdhTSrgvZsM3pr7j/M7SzUSZHSNJNw3O/gPSi4bOAsfken9Uy5vnZl8/C13vQ/QproQlIdTUpZEivz3yzqVV8ImImcQ3rQGV84eUBm/jZDHmPioNPfkFLLT14IXxp/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792358690; c=relaxed/simple;
	bh=3XmYZ70FjHnGHrfOAWnQ7gzII7n7IuFAxA/U8VAcIDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cx2V6TOdw9SlrZ7H3wSq4aDUriCJiG6okBn2vBHkEP+ITQtZWH/9TweG/sNsrYo35Ns6K0F6tmKQD4qrN62VcKxajR+Bxbl2CF511YlDdoaLvDpOuQ5cLnwwWmoopyQHjME8k9xXqElBuKSlWu+e5DHagsgTzbuErAYl/AlrQ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=siNqOvmr; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="siNqOvmr"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab3dd9670bso3286351fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792358688; x=1792963488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XmYZ70FjHnGHrfOAWnQ7gzII7n7IuFAxA/U8VAcIDQ=;
        b=siNqOvmrl13JvTWVucQZ1d1gBww7+u+KoRAEIFGxS3plKkREW0pbq/NT/J4kPdZG1Z
         uyt6/CFsFzPYJVxRj+pG7TDuOybp4nRtg0QPgk+VgYSloA6UtabsD8HxPD27y2NZyLXe
         pvAvRXk9fPPZlijd+B/Tbw0e4UfNl/TXdV9U91WixYz0VLGJt/zHuprexH2PDS1fVGnQ
         aksH4Xu/tkQKqAzttpG7IwQAuwISX5GJ7U1BqaUotV2moJOppppbooA781R770YmDftk
         qgyrExXT1YOQ1tiYjp37ZauJhLsgkTimCWK7Ey+Jtf5XAmulKC1g/I+31qyHjJ3FrXWg
         5QVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792358688; x=1792963488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3XmYZ70FjHnGHrfOAWnQ7gzII7n7IuFAxA/U8VAcIDQ=;
        b=pdRB4kVjlJU9RbcOfeIK2D24+I2qY/OzR6zMwPqi2W/ROp/gxNy+bYZ8plzJFnwROV
         EaOFNxiruS/zBo6h/lqGJ46jzpgEFHVmvG7z85nyVkhvjcDj+ogK+1CiqDXMl5t4ol3Z
         7FUUX9exJitgRMI+0NmWfpBO73Rygo9q+srJ8keWJdD51fSqwJtA1WXDV+mAVpTFQB6B
         r05PGEWuxpyAph0AtkUl1MNLN7QPtz37qCEVuaLOpVuegYOqoUyJYdx6kgTFfV9+s/BF
         dxLeHk8b+CokuWCqn9ia813QdXoYHjuP/P/8kWOvQaohfGdeKqPd4deTpNQwkFn/wrw3
         0ghg==
X-Forwarded-Encrypted: i=1; AKwUvBwIlwYg4Lxs3hfVKxTDx/5/pwcYnh9CVPI8G57DWOf42fmtu1BLKZqwauiISh0VhO+7QcKrgAWBojHm5d4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1t5ZygfDf0SxrWiwoJJCD41mghd+sHQhq4RWRTmsNkjIenbuc
	J00Z0W+V/yQd+VFAPpcQ1YmcGKQzMnaDmzQpq/tRh6dKuY4a9EJLiij8
X-Gm-Gg: AYBFou2EWe1NEfeUxlO9RAlAzn6ZtVIRRyvMdlq6atM2dNx1T9aPvItP2dR0LkPioid
	6KRAUB5iJK//6fAJSwIpO4OPx8r03d0vuysh4+EoDQF1UrckhfazHL0gr/UrYPNxE8YZ6s97ML2
	d5NmcNjByT0k1uJKqRTxUO5+5DD/d+BcqMXOAULezzv1CKz6i4jcJtQGIBGthjh9t3WK6Sfnt8X
	dIb7slB8SKYHZOK8hZB5X3Lbr8xWjci0acLaCwnn8ugtS8THLSrDzm2sQS0AwYJHfXvFDQHd7BA
	HwtuvVtBuIqiJAxnXJf02UkWSd+CJFHfTi7zNbtXEK+f0BZwuYMJLvCpCp1hqAUnpyCOAAxtoHQ
	Fbo1hABVR/DppaqiMEBPnnsHlO0leqX9zjnT1UGSFTBYY+A3D/C3tdE0TSQoqiWOsL2+Axvzf+R
	Q1J+1dlcSCjbqIbtTt+sYQHjB2EJJnzHwVBGivIhgMjPfoBEOo/sBIF1CuXCA6OpdyDgcTL4w2n
	VlTST9kZNaUHkd0617behZJyqu2e7r83vHQruVL2WJmz5Rm9n5MsghawNTpkN48tgVkfeoZaBe6
	8CyjXrA=
X-Received: by 2002:a05:651c:31da:b0:3aa:ee7a:546a with SMTP id 38308e7fff4ca-3ab29401f65mr12085821fa.25.1792358687613;
        Sun, 18 Oct 2026 14:24:47 -0700 (PDT)
Received: from yantra.. (nekmmqtaaozvmkd1587-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:5185:c9b3:741a:edb7])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab28023977sm17218041fa.0.2026.10.18.14.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:24:46 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: paulius.zaleckas@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] iio: pressure: dps310: add Zilltek ZTS8032
Date: Mon, 19 Oct 2026 00:24:45 +0300
Message-ID: <20261018212445.43544-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
References: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 16, 2026 at 06:35:28PM +0300, Paulius Zaleckas wrote:
> Based on iio/testing, on top of a22dc7ebb21a ("iio: pressure: dps310:
> fix overflow in pressure compensation").

testing now has the FIFO series on top of that. 5/5 conflicts with it in
the header comment and the defines.

Buffered capture without a trigger now reads from the hardware FIFO
(FIFO_EN, 32 entries, flush through RESET bit 7). Does the ZTS8032 have
the same FIFO? If not, it needs a flag in the chip data.

> dt_binding_check passes. I have no DPS310, so patches 3-4 are untested
> on one.

I have one on a BeagleBone Black, can test v5 there.
