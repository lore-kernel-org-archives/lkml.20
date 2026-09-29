Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2069A3B2D06
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675746; cv=none; b=qBNPQku80+TKDQ4of3KnmGwm+AS9YRHTz1uy24OUQsBnQIfyY6Uh7/aKYJORXYFbdTzauzoXH0vtN2RDINW25brhotJ0snIl0lAI3oamun+Y1LuGPnO3CQOOCHVAalrajFuooZPCvNPvIaSpFuSqXbmN5x7eWyyFwh3rawOpoNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675746; c=relaxed/simple;
	bh=07se/JviETlMYDRCO0tPeNRK6E3kx+s1WEeNG38MRU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mg7W3YDQFf+waO/d+U+0m6og26Fp+ZEoJdk7lV6Dp3d3v1lcu395bfXxozzYOhsEmNU3e30BcnoPVu2ptqndiE89G9MaMGsOh/s6o5H2aIROSeDRT3S2TGTle0MX5+R2exHrdOTxE03jdz1eoi3ADmK7Phz89aUB9Np1ioHvWJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ouCN2Gqs; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ouCN2Gqs"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afe9fa8e0so416589566b.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790675743; x=1791280543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07se/JviETlMYDRCO0tPeNRK6E3kx+s1WEeNG38MRU4=;
        b=ouCN2GqsTA7bAtO/V/w8geFI9GhJJ8LPSpsPkiKmWpCVYPSn0lHisUJrocuRTN2Ky4
         X+CD/k7qB7CZYVci82VyOomR8H9Xv5AESATOMuU0hq8x0HF28nBHPbnKFF7R2nzMFxUY
         j7oy3+wgvxPeKxNjJcniLjLT64Y8qy7d6KeuAKPwr5OvWh47Wmr+NSTooRvL5hGF2VFG
         qC7fuO6A2RnVZtX4/woJiOwF6wog3NRsPSA4cfCECDam6kPSFKux/LwIZMoKuqIbQoAI
         BB80lT541nYHE6eQKvWprNB6V0z27ONvGtwMrqtRMAK5HTG8FharwBpkkYjcQUlbZ5l7
         ZvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675743; x=1791280543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=07se/JviETlMYDRCO0tPeNRK6E3kx+s1WEeNG38MRU4=;
        b=D8eWYvqsYG5BvWOAArnkyp1HnHrHEN3wRis16hVrQWXH4VCsAr8IipQjfC249U1pgV
         R8HxEKe//SYhex/XbxRhrUr7yL6xClbOzt9/mEoloH++7XuoOluRdNA2Bc6Y0GfW89tU
         beQSqzlNLnNypoEQPZXio4gm44bxKPIU/TwRpmKGl3r2X6EIVqb0Vh/91OHtcLRhfWTY
         96/YyYnnsXJUhCmwwdA/DaeQwb8covU3aB2n3IljOd9I/rbOz0OVnJP/p6OVxTiYD3OD
         s7J6BlZfK0y40E7ruCwa1PXCRQ0TR2e2gJ5gAe5rvIF/u1iCGVn9uWlGacvUhOvhLjJC
         orHg==
X-Forwarded-Encrypted: i=1; AKwUvBxNP0ouDXHGuVtjqrLxPYF+nJefSPemGRB1lCdDwfYkXn4sDq8BfuUQsaotM3Lty9dF8KYQVCl+PHRxWYs=@vger.kernel.org
X-Gm-Message-State: AFuF++nZ1mH6vpg6LbjLq7Vdrm4BSLDL6WrZvPeFttz2Js7pPND/XWXh
	o8ZurhUQT91x5Y9aiiVMh5XIPs9x5/OzENfh8JmEWjV42wuaqAkDe2/D
X-Gm-Gg: AYBFou3d0DoWjbpOBoMu79toRsnNoeGjOWtPLneFc1Jq5vDUnwB/OZiiHe8ziUJ0+gx
	dKcoEOe0BjZ19k8M1c9oxYDawHVtypJ+Snn6fSpIvrxRocRzqNTC5gNK0MKvIuVildrnsXBpUGn
	CZlSS6jro78kdomhQaY0FdbB+ZXTX01BLoLPIRowbqJ2EaHR6nVNPboQbsvYPLuSq1z/n4zzm4u
	9FHaEOp4BE0qUymAC2mtk3nocOBRVZwXiVRRgd3irWz1AwdE8ZlRz+4Qe5EVf8LVy0Eo492w2ZQ
	rICIYgREogmciIj0GdTRM4kl1lcwPOYjWwMfGSqMhDIoAqZDtr5dy2aE7qnkuhPACzDG3fRkbaH
	mj9dQ8AEyxnsPn5FqlFLB7W4el3+HY3qdHTfI9OyHwtny3h8PjQP3NMASjVepvd3Mbc84sVyzD0
	y0gRB2kZ5kqpN3nKV0YvVS2uhGu/YhmOzFRrbSePfHHTWPH6oxKjldCFKGq0vT9BZcQq+B6+1mZ
	WQZC6MPSqlagyp0/rc2lHfcVSDnyiqVPOod0ZhEEYHqu9JjPA4=
X-Received: by 2002:a17:907:1c89:b0:c29:65ef:b907 with SMTP id a640c23a62f3a-c2ac24bcbe6mr1252123466b.26.1790675743155;
        Tue, 29 Sep 2026 02:55:43 -0700 (PDT)
Received: from sp1der-OptiPlex-7080.epfl.ch (dhcp-122-dist-b-107.epfl.ch. [128.178.122.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dd1153f09sm323000566b.15.2026.09.29.02.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:55:41 -0700 (PDT)
From: spidermana <xuyiwen14@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lossin@kernel.org,
	mehmet.mkoseoglu@gmail.com,
	ojeda@kernel.org,
	rafael@kernel.org,
	rust-for-linux@vger.kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	viresh.kumar@linaro.org,
	work@onurozkan.dev,
	xuyiwen14@gmail.com
Subject: Re: [PATCH v3] rust: cpufreq: reject NULL from cpufreq_cpu_get()
Date: Tue, 29 Sep 2026 11:55:39 +0200
Message-ID: <20260929095539.1398671-1-xuyiwen14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiq72ki8M1KmxhO4vSkMUfLcuqOMvZtuTNdDpS-UcJy8rqWpA@mail.gmail.com>
References: <CANiq72ki8M1KmxhO4vSkMUfLcuqOMvZtuTNdDpS-UcJy8rqWpA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 28 Sep 2026 19:17:08 +0200, Miguel Ojeda wrote:
> The From: doesn't seem to match the email of the tag, is that intended?

Oops, no, thanks for noticing! Please disregard the tag in my
previous reply. the correct one is:

Reviewed-by: spidermana <xuyiwen14@gmail.com>
