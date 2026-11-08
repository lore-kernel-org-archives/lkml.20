Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150461;
	b=yanuTds93UxUiFiLaceTYDCt79MebGINznqF1cL4lkF0QdHGoIev+oWti9f4TqKt3T79
	 mS3KDiDmUs862At7fSv+Fd+sjc4xbrIiwlyDTSXDnKGG0DCO2SuEzFph6j8CLJLxpAhQ3
	 9gkDwsGjFxVDjCPhUiL9RmzLEb8j8A4GltWIHBwEGHdE/upNj1g7w5IYb6G5vyQTlMrEg
	 SHpGtZlt9PLlBGYEAwQj/kMqsxXxMSJWyeapmQ09+s0SwntvnA75h98YxrriiGAl5IUwh
	 MTNFnZUzg1cxvRFEEaP8DGl6N0RDLmkcXGVjJvBt7WI8ltdErJxVArq5syJhY2lSynA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150461;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rBHrMEhi6xxvoRTT2czlxljVcAmDyHII2xQE70QmPwc=;
	b=fbqR3+DtFp6MrZG7enCEjK6uAfTJv05GU2mqELjsHoAiJwEB6NodZpZ+d3mIKyRdkHmt
	 zk4182yEZe+h9PrZTe28Bj03/TD6VdIjTcZfhGChhI2baJXaPnOAO8GPCmqBhttN8Ve7T
	 N89bjaCWnlDRMhiVaYP/t192aOmxI+pEY2C0toS/Dv+7qKthkgquC1jEiZG9cI4SsTWcc
	 YQWYChU9EPZySEriTWwjEVbd07CtBYHRlnXs/K6yhWzBRga9jOSFYv4w/GHrpuqgbQO9i
	 0sORyGyvO8gZAw0/7ayAKa4Ri3wVIQ//h8po5LOCgFvEPXOHJZr5/HlrTVa6ppRGHqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvDIO0i8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09703606A31C;
	Sun,  8 Nov 2026 15:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvDIO0i8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB85F1F0089F;
	Sun,  8 Nov 2026 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794150460;
	bh=rBHrMEhi6xxvoRTT2czlxljVcAmDyHII2xQE70QmPwc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kvDIO0i8t+ikkjV+8fasMd+zwlCW0OZ4kIAekjecHHWYU11C/PPBUvG+6Sgo7py+6
	 33Jm1+473qaMMU0uk6YDFjvhIC16ta4jqd2B9uZGO4V64J0xW8hCR6Mwu0fgecP3kk
	 VGxEZIZJUlvd3kDgtdRsDZPvfg8yWyivxmw0Os+KuKw7mbVezhVmFZPrgDlbDjmiQ1
	 qYTOPXp7mExtvGgWaXAitDAbqXShH84TFBYFdIBRwvT0OZLSl+VfmBS82qWcgoJKf7
	 fdbESbDXpW0wWs8uw5uxD88hL5LewEGl/8tf/RC3CX2mNDVYBgA+sVqv8HoeUSHI4i
	 b3+lsAnbPMtLQ==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: apple: Fix swapped paddr and size shift
Date: Sun,  8 Nov 2026 16:07:26 +0100
Message-ID: <179415043385.189632.1773761622821260875.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261108-b4-sart-fix-v1-1-dab7dc1e9adb@kernel.org>
References: <20261108-b4-sart-fix-v1-1-dab7dc1e9adb@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 08 Nov 2026 15:35:11 +0100, Sven Peter wrote:
> Right now we assign the paddr shift to the size shift and vice-versa.
> Luckily, this doesn't matter because they are the same for all SART
> versions but fixing this doesn't hurt.

Applied to local tree (apple-soc/drivers-7.5), thanks!

[1/1] soc: apple: Fix swapped paddr and size shift
      https://github.com/AsahiLinux/linux/commit/7f8656f4f83a

Best regards,
-- 
Sven Peter <sven@kernel.org>

