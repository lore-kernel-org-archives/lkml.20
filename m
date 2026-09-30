Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA2B31E830
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757026; cv=none; b=goZHYYwwn++uH64h6k4vbO0Psp13/XGyIXq+l+E60XTAFVtRsqRq/3HUx3P9LRXjkegJz+CHzGtzRxJi3Ng62b5qlAZPlBAz870xpiN5Vs3VjtWAeAciPMM77q6clk/5f0XsTuQmq7/+/4b9ONw4kaT+iEv+rJHn8adN6cGLKlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757026; c=relaxed/simple;
	bh=ZTLy2b/aZ6jnk96E49OmqQA6r9eoSOmIhpd2yxFKaIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bVLSR95nFE6d8zdQl0q2h41SUWpcFxYgRded+YXnJWWC5W1oSiMLlL5HwKUS7MJYcJJE8CW/Hf86zBl5VxGfHlmjf+uZ6eikrSwzzKd5Y6QYiJHNZgNycRBTj0HKFtx+3Fo7CuiPrNnfB70ZghcXFMOeVzWdGZFWDwSYN+RE1JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1w6eAP/; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1w6eAP/"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a76b373063so10820071fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790757022; x=1791361822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsFzur6ZDixhPdht293SKHwUgftZBx+zn+PzskiFAnU=;
        b=S1w6eAP/aW4ZcEK9/xRzb9Jj81Ff9uLqlMuzPoaDd3U0qd3nmEx+Hv2qJt982bMZwR
         vR7YGrciwrIUW4+rMlDc0cvWcS5xpOphkmEKgld5qO6jbSvFc6+guuPgrnoev799iXT+
         xA2awM0DZ1oZnokupBBpnj4uJzfujVfrXYsechEQwbeI1BJLFYq+o5D84ERfIBomyO8w
         EagQLq+lYi8cHnKUtQwOH1fO/GlqnCSWLC43cOB4vYU8gnbA7pqUanTgT1M14541g1R6
         h5JV65uNHAwTI+NNU+8Al5RAjF8wUk5sqVWah5jN9zfS366xDOrEoCuAr+sayxVq7lMp
         DS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757022; x=1791361822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsFzur6ZDixhPdht293SKHwUgftZBx+zn+PzskiFAnU=;
        b=PSex/lis5aH19QqXiJMzQR2M7p7zZXpfa+u88frk1vrkURLMhKKZz+9DEHIFDSeNU4
         0O3FRJU/qhBnMnV7zvHTuwsS9c7DYB0KoYXSMJ39Fiq5m/YJokHawKXx2OdNU3zqplue
         6wcUF2IOrItk1XbSa7teTTBPh2LiwCo0SoHvBDeeIy/XDAmH0HFn7VHCVNz0kwjBQEva
         zBEXVL5LLlHm7tMs27AoBoN/+83Yw/PHkyFxZucTPAr6FivnfYR1374/nY2/kNyRQO/C
         KV1MIQY5QVwJov+cTLH26khwnWdII2lskNtHbGQBvC+drcdDyLvp24NkQzVMqCg2tglF
         DpSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIcu8uMjyNkx+thG4bN5mN8o8wVNMwerTnngKN3wOVxO5P8mcgLtbkZLzmxpMnIQqvawV1k0XjszA1WNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9EmGqv0/Q9/Z8LCI3H9aCT1+puK0Bi1fNvpY8C5YDYx3H70DI
	xfvE2M90yxNcaQ78TQTp3rU81YnEYcnact2oWLV4mU2gIJqa0tIe2Ekx
X-Gm-Gg: AYBFou0AjeS0NqZtlW41NWyMq5EGSzCZxg35fBkaYac0IQgtICvBPEhNcr7lg6KxXFL
	G9y16hwOvBce1GRhvuMNgDU3EYxWvrv5IFDUgNBHep/uhwc7ZtAFaMjYjeKH9qSVO6CWVXQrLXu
	q5Y/4ghSVfzHz1PHm6zfYUZ3gr0o7K4fwQApkv+8RyDJ04GZu02FSQdeXrBnE3c/Bb7awkw1BEb
	aOc4iak04h6sn2EQXQv676hXcsg4m7e+uGglXAMST/SduuNr+7n64uRo0L4u5pWjFXxaimeVUhr
	hcIbyXAsbRtRbifDp1ZiXePkWammkmUvXqypvNab+o0Jtn3yzgLbJ9+dcSMLabTn07+ZUfxReLN
	wjt01hLzspVUtUfwYzzSYXV6qLv/yJta53T8Lgwz+uaG1ODWHTwy3SxzGsZuv6jy2dBbOLkokez
	MyB80NE5hSe+oFz5bhkaaDnraDkgnV0KuwpkdRincrbS2T1oEDd0LFiGzQW/68pGVNY1KpZv9vU
	7Auy5s3wcRWu9XaOiFjsIYjgQua3OxV8pJHfDn7bfOFr+McJmC6aMotxcZlyqZJK7RyneA=
X-Received: by 2002:a05:6512:b95:b0:5b6:183c:5ca2 with SMTP id 2adb3069b0e04-5ba406177f4mr276043e87.64.1790757022218;
        Wed, 30 Sep 2026 01:30:22 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fc08d3asm187309e87.80.2026.09.30.01.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:30:21 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: andriy.shevchenko@intel.com
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/3] iio: pressure: dps310: read buffered samples from the hardware FIFO
Date: Wed, 30 Sep 2026 11:29:52 +0300
Message-ID: <20260930082952.878967-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <arriSm8L567yqOjV@ashevche-desk.local>
References: <20260928211127.641828-1-zoone.rupert@gmail.com> <20260928211127.641828-2-zoone.rupert@gmail.com> <arriSm8L567yqOjV@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 29, 2026 at 12:55:22AM +0300, Andy Shevchenko wrote:
> On Tue, Sep 29, 2026 at 12:11:25AM +0300, Rupesh Majhi wrote:
> > +/* Returns which measurement the entry came from, or a negative error */
> > +static int dps310_fifo_read_entry(struct dps310_data *data, s32 *value)
> > +	__must_hold(&data->lock)
>
> Hmm... Don't you want to also add lockdep annotations?

All __must_hold() functions here are static and called only from
dps310.c, which is opted into context analysis since patch 10 of v8, so
clang checks every caller. If you still want lockdep_assert_held() I
would add it to all 20 in a separate patch, as 12 are already applied.

Rupesh
