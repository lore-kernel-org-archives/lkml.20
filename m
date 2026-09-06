Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E761D3375C3
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 22:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788732939; cv=none; b=ejTDjIUUJ4WtT74/wv+1mE31CnLtrBmDODXkPg4ryWxQQbKGPzyvaioCB2MLY4vMAsv9NxDBnKb7ELGgIoUa0UegsfwxbBvuh0N7tfo2A1yXZg68l2e3fJKmqXA2i993J3dLfXsBsqzQxrI3iPz17VNM3j+4L3rV0z+YVY1xPhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788732939; c=relaxed/simple;
	bh=zdu8MAVqmcOr+XoknERUafm3+3CbOKJ8mESo6skZT2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFCtZG1OPLMAYW4hUfxGYdUx7H1OkLm6DZj1WxRVCx0mEVVV99hCFppYkk0O/tPmc/XPog2xaM41wy3hU4e1fBafpE6PDnvQnrw60uzinVW1NJSwgmGwbfyXHaFH0ITjjEdcT7KNqesmhf0/SFXvlg/UpYV8IGXsP7GeWQLI+BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sE1pN+iO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sE1pN+iO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b8687630fso24117905e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788732936; x=1789337736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgXheOJxpTCFTUmGEEIzpEQ1QJwXxoH465RbAA8N87E=;
        b=sE1pN+iO4wiONWG9N58JE1p/vhrLM8M56Mfj4sdBwfzfzkajAYcwCLemqcchvdfEhl
         zvFxC7ycAqjUrquuNNLQopvd6+iBqsvMfwbc/E2DQdIXymM3bu4sOsArMzV99BTw1IG8
         Ldg1oMQp0uxWatxejYsUaoNO3Miv1Wss+00t8tPyVBB9RQgC7DYvbryxaQrRKfdc0+06
         DxlMObcXDeQAJno0sZ2mf8RUUMNdM5hqs36b+iCjRcagP7+nCKikHca1g9rwTAQhDtR+
         /8lGHZSz/GQbq9ylps2aIwAEGPqp9PaLEQze2AtL88gEP4y/Qgm6Ygwna1/uPJhbyPgG
         v6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788732936; x=1789337736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YgXheOJxpTCFTUmGEEIzpEQ1QJwXxoH465RbAA8N87E=;
        b=sYMpl+OhBEcaqS1WQyFTQ9s8dAmUcZei+RArmDI/o4+K/obQAQRbfZMEloiTnRwQq8
         ZD4IFn0Q/C5XhIvY8oiHzaexeBfngz5JMmzWBNpyQQScuuVX0pMjKJJm2e7W6UgzJfK4
         ezdDM+rMzU4x/1C9vTE+RJ6OajDfe0Gy3pzFq7xPzcuS4rpIpUKzsYPrhqfwJqmM79lh
         QR4KsGmJT3YE7FBk+WqZabZXYVN1zXMaKPKxCq/EQj0Nve6eonCDeptBOs3b29S4OIeF
         bWdbG4qmyNPvJoWmjBT2dML4jqpX9QUwqRSwWlJmvnTj1HFixTC4bNri78BiMH11XqZo
         8w8g==
X-Forwarded-Encrypted: i=1; AKwUvBxrP/+dQvHTq6MFbpk/UtDxdZqmnp34bY6fBZ3xi/wliWBo69kCGsU1hWtXJpcmxUYDAEF6vTcUuZBrzUc=@vger.kernel.org
X-Gm-Message-State: AFuF++l7yTV04xYwnPJWSZlgG57kXfkDqRbtEcu3soE5cFull6ucL+Np
	XZ3cA0Q5iAfI+b5H1a9lCTiI0S+epENuCOhY2mSuiGB+YU3rwWwCqKCY
X-Gm-Gg: AYBFou3J+7rJHRauiOpXauNPh/p6hgh/+VCeOV7vw1BEETtb7QHcoenN+lCpT1C5+ci
	6OKX4TkaWxNmcE1eovnFTCw8tPWdcv/tTD8RpKPM2XPACUVxvumCJ6fN/JxsPj82X9hy4z1SrC8
	hcwK59q7yLfss1uQ/Je0hzUOheXrnCWmb8ICn4h+PGQPi3QzGT1tWdu+Nsy27+kPrIVmbRa/m4P
	Df9H7yrsdsQVYETPz4nVowk7dcTm7Fj7diCnx/9HCKBMQ/nu6ScY/EcdKCZE4OiTPa24g0Kx9SM
	Hv0Gjg7OdRrvdlyPE5+hvt8+ORurqzvV8CdmbTfaFtbqRkuQW0iM5+dyjln4kB/OHM/8iXsDpy8
	T9XF1yxe9wYOn5WliaDk06eTg2Wsd29X/Y1IcEjL+PtUC9eGDt2AuYarNh6420dN3uA++Y+RRft
	IC3Ma+OET8v5NFmrH69Eu1skfVhPsbmR4UU/MBxXsfkTRwNzNH6YgdNdqZv2JzA2QhfGZX8xU0O
	yFXnNcYC6un/n5lrLFL4Pq+3l51gphB3oZGG8CnxTSI+xbZpwvrI3AdR4KLY2nd4MpWu99/2FCt
	NRJyeaVolD9qkvorbljM
X-Received: by 2002:a05:600c:3b1f:b0:49c:ee06:9c58 with SMTP id 5b1f17b1804b1-49cf821eff7mr190069715e9.4.1788732936168;
        Sun, 06 Sep 2026 15:15:36 -0700 (PDT)
Received: from kdev ([81.56.8.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm377754835e9.1.2026.09.06.15.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:15:35 -0700 (PDT)
From: Fabio Cesari <fabio.cesari@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: light: isl29028: fix runtime PM reference leak on error paths
Date: Mon,  7 Sep 2026 00:15:17 +0200
Message-ID: <20260906221517.201877-1-fabio.cesari@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906184358.398f3f1d@jic23-huawei>
References: <20260906131203.125407-1-fabio.cesari@gmail.com> <20260906184358.398f3f1d@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jonathan,

On Sun, 6 Sep 2026 18:43:58 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> Whilst perhaps not best practice as such, it is pretty
> common to just not bother checking the return of pm_runtime_put_autosuspend()
> at least partly because of that annoying -ENOSYS result if runtime pm isn't
> enabled.  That is what happens with the ACQUIRE macros for instance.
>
> Do we have any particular reason to thing it is more likely to fail i this
> case than any other?

No reason: both functions already returned that value to userspace before the
patch, and I left that unchanged only because the patch was aimed at the leak.
It makes sense to fix it as well.

v2 will take the reference with PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND() in
both functions, as Joshua Crofts suggested, so the value goes away along with
the manual put.

Thanks for the review. v2 follows shortly.

Fabio
