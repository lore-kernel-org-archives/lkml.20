Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DA13B14AD
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 22:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788732581; cv=none; b=l5HGj1I1wk/EXOjbuYRkoNK/kZjmNMlc1gMeKTRwR5YNZig+cCRw8UpBdto2r0zPjaUqFMCdlnH6vdonzm8C3pWuCIyAgpQeRkfQ3nVqEPBQLLSmsebfgvS3YTI8ihsVSx+lsGb8PRffwW0OXCpKznM/aDqhzNwWp4b0YnUQtJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788732581; c=relaxed/simple;
	bh=VAWOGk/0GFUVoIF2l3w9U1hKC/qIIbW1Czqt7uY37fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RMaYVKqNjH+N3J//2Ux6vSJiGEU79TD/mD9zSLAtM5Kx9On9YZ0FkWXyc78g6TZhuHpADSQJBtKMJSkp2BMaqoOQDtnyu2E8+YQpJzhoioJF7vweTmbKj5pRxQpIotcin/g9LRx/l/TQTxh8ulwlgEd4woGWgWN1DxVpRbTJECU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e49MIYUS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e49MIYUS"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b9320423cso31921895e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788732578; x=1789337378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAWOGk/0GFUVoIF2l3w9U1hKC/qIIbW1Czqt7uY37fg=;
        b=e49MIYUSu413qj0K37Vb4cNE/5tX9ju9PRwmrpQT9p+cRsrY8whGajllC+ygKAISHX
         ii15P3YlJn4mQuXVefIp/Jnq4y66G1FjEUuYHbPQmFudAQgaN18W9e2ozLNOiv3ctzWP
         oU5eblvn/FsV+A7dKBDUpFWzDXAZhD9vAF27VWirCsoTUrYd8XAzcGcyg/u7/1RbXQ0e
         An6J1AOIafqWaA3ZxWSus1nfaKlrV/0zPBeqXf+EY4BMtvXgrdwtHyy5/iW/IwYiH7AK
         BRTBi5Zhn8FJy6k67oG8wLqN/19zL2Om4T5qBdjc8R9Ht8zDu6nAFD++bqCuA3KVLU7n
         8Zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788732578; x=1789337378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAWOGk/0GFUVoIF2l3w9U1hKC/qIIbW1Czqt7uY37fg=;
        b=q5zPYcMSjCVTDzw7Jxc6o2PkhuKdNSEZ3/hswBw0jmlbaNuQAbt5VmR3ea6doFMUTp
         LAXd5TS4eteXG9zo1e8BoknF3+fupmAZPeX9rD/EOM8bI9whk/t/GBJ8Ofu/SgFkPGjP
         FjDYcGVzVJJC7M83L+nRWEVLh4MmMJdjH19atz4JxFErShEUKXi78TLAUB8DwCHRMiRZ
         BGt4oledDg0+72yw4B0paFZp6IzKL/v4ecVk83QjGQl3elJQmHnibmI+86nNcyFRDGDV
         7TfsXoHfC8TdkXobzc/ikQPy51ZJRk5dvyQxMoGloLUbDRZ87PiRxgXsjfozE41bLgiD
         8Htw==
X-Forwarded-Encrypted: i=1; AKwUvBxMHhNGb/kRPb6A09InCdxrTN1OXPRA0Adco/Shq6Ev7tUKVqcNe+g5Vx3EBeOu6aLDE7b07RzI5o+Z0uY=@vger.kernel.org
X-Gm-Message-State: AFuF++k2IkNbTmCNL3J4Cj4n9rNLUtnOJiF5EqYcI5SsK2euc+pj1/Mt
	Lh+zqC9hP/c0GWmXNHSTFWhDtEW9Of8evzwadMbAd9uw5pkRs2DO9Czd
X-Gm-Gg: AYBFou27ta7348WLgdCrN5nV6bfuUPjpiSxeaMPj+OJYWzchdz/WLppbW4lMHuC+yqf
	KFhb3Y0KhwVvqynCShhQSmGQgmESa6ifqeW6KcN9MXHXwur4ZDquTHyn2RsMrM76Qp8iGlsRbg7
	XPlb3bQcDOwUlYv7MK3/f37dYYWih+R+Y+DWivE9+X9SJEMmq6PKdy6KFKDWxxNBi6T+qIGqoI2
	QSFeR5jsSmfM4KV95vNNuye2wJ869WIuFxJIx6GZu3yXw8enlHtPmJ7JoROeC0RDq1BGCvIil8C
	KU5AwJPcC0bI1o67LTznCLPIGewhuo0jGZO6DjXnPscvGfXFwCCWe4fljjI1rDb5Z6YDc21D81x
	aHaOj+0Myf0XY+idKRqMe+GlkLe9O80Kqab2X2fBQGsxjAgDmy3bvUmCJ9+GGgIQ4ihm0zHSwrE
	vBZhTeGRsoC83v9dgNBwMs970HJAQ5xBdIYtq0+zshbV/90AsD3+ifyjTTycxtK4SmDZKFcbQWq
	Mnw4chlPpdjz/wIqyY6wDlDaO65PnK5KDW/3nAeQPSq4vIObaJ9sml/MicePEm+D0+xAWkwOZzr
	jmN3QH+CsLY=
X-Received: by 2002:a05:600d:6450:10b0:49c:ffaf:95a1 with SMTP id 5b1f17b1804b1-49cffaf95c3mr201041045e9.1.1788732578466;
        Sun, 06 Sep 2026 15:09:38 -0700 (PDT)
Received: from kdev ([81.56.8.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm454000375e9.1.2026.09.06.15.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:09:38 -0700 (PDT)
From: Fabio Cesari <fabio.cesari@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: light: isl29028: fix runtime PM reference leak on error paths
Date: Mon,  7 Sep 2026 00:09:24 +0200
Message-ID: <20260906220924.198829-1-fabio.cesari@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906155532.35326455@systembl0wer>
References: <20260906131203.125407-1-fabio.cesari@gmail.com> <20260906155532.35326455@systembl0wer>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Joshua,

On Sun, 6 Sep 2026 15:55:32 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> I'd put this paragraph under the --- as the Assisted-by tag already mentions
> coccinelle.

Agreed.

> The standard is to use "Assisted-by: LLM coccinelle" to prevent free
> advertising of models.

You're right, that is the form coding-assistants.rst asks for. Fixed.

> I'd suggest rewriting the driver to use the
> PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND macro, as it automatically
> increments the refcount on use and decrements the refcount on scope exit,
> eliminating the need for multiple _put_autosuspend() calls and manual
> checking of the return value of these calls.

Agreed: the leak cannot be reintroduced by a future error path, and the
return value stops reaching userspace. Both functions use it in v2.

Thanks for the review and the suggestion.
v2 follows shortly; I'll add a Suggested-by.

Fabio
