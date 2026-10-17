Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4E536402D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792245943; cv=none; b=KQ2twXT0f3Rt0JZ8XJq5irszP8ioYCS0nttpVZTa7brMikxMQWikF/zaIrLYQ7zFGLwvW/8Q9b4KVcGZmsGs7ZvnEWDim4+q9PlATmq4wxsoMwFmaxHC2mI80mCrd0CbZnTB6T8l5p2tH5LMXW05TsL9W5nCP5JtshvvHu9Q4+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792245943; c=relaxed/simple;
	bh=8mm1SkJAd0ZzUVZM2VvxblTUHLtQ02hFHKTpaC6z+4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QeENgHieHCEh3YXDvZXAmYX9w1mtVe5DWlcM63MxRyhCOaott8UAofszO3kKiXlRn0U/LtOfIoYH63bg7NSlHKKrylIhdG9h4xD3ZzBynvMfhzmkavxgzgQxKKE1EYYcCsCd2/Z1eDeMlxXrGUaai+lZUpls5/HuPkPsAwplzLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeYyaPt8; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeYyaPt8"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e940d5d2beso2596125ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792245939; x=1792850739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mm1SkJAd0ZzUVZM2VvxblTUHLtQ02hFHKTpaC6z+4w=;
        b=VeYyaPt8PREiPtLtJRVPa+RVPr0ExIzP5PD6qgJsRqyFK1B/EzDn1J7ZO18eS2rFii
         8uY4pyLPBgIVwcQiAo90QR1ICYG466+W31sUAop4YbX5mWaLiY5QgTBme2IT2KoIJquc
         7ZBwBuxd5+oUBVIZm+dZBJFTKi7QqNZFeXU5f+q4fZX8pFDEfT2dEFxI7N2413QYtLU1
         UJdKzr5KSDdHgxmPeu9AMC3YblKbC9I1txxJZzQG4SfTndNV1zCqyi2kjmu4Zky0LPr2
         LZw9opU29Xa3oV+5J4aJnkzgFPOdmNI0ZWfVzmj8jcOSLdTBbIrd2qYAogj3zRCq2W5Z
         Im0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792245939; x=1792850739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8mm1SkJAd0ZzUVZM2VvxblTUHLtQ02hFHKTpaC6z+4w=;
        b=2HWtosbKzs2wShjE3sLbw3pXOvCHFU+h2zNzxf/jANqzqaSnSZHtOE0HS9G7Yik1QI
         GdrwYlj/8hNhGh3R+Ry4BlxOYQxgflQp4AwvND1HfTe8mlps7zRNcP/xK1pMw5+JxLpq
         vN2yVVCiKM1gYOziuG6vlkFkqZ+Mwxy7TCcJQCxPHlGR3RLUr+khv7m8RSBa5GPWU0tR
         i+VC8+tK4YUs0HRxltORPZhed4ME7RzsfwFWPTVXV7RxzdgYDkiL1j6nQvWYvDZx/ueU
         EqZKy3C4ObsI/VXVBXPTZMymrvW8PfNoLwzutMYvzm+6InxeUpt/VhxqQN5UFlL1tT5Q
         hXmw==
X-Forwarded-Encrypted: i=1; AKwUvBzoFqhTJHg0NAJJvNkbJ3kN4yFdfs0kLJe8SVR8FxK2vOY5LP/yK3eqRZhnvw8RGTtHsbrtLO8mqFYhVFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh1v26eii+MDyTI1CTcoGPDwQLw33I9/CxZ67JG1onK7NABpIE
	+9jNy7rZoKo4oklMve9widYMftpdOZGdn/XcWOTOzyX5y3DQD2o46tDR
X-Gm-Gg: AYBFou2AUx0bmJ/s/fvvNFu0UKRMGSH2ySHsMOtLKk4q9D1DR6l0jAySEM7gup3KNPv
	eyszWyQq54pRxw3SnDbIMJQ7k84/4egU1QzzQRCva64IpDHZcTt+0R8rMpuNLHdbhuh5EdPw7rE
	yZV1roJKP0VMbcpIimhQ0IzY7HI4/JGFaDZdHUWG9mNQaHduMmLN4+dEFPGfSGq2wu/NrskQfHN
	Yrthfc4w5sywz11mHbgy+vdoKwSpbM623hOaKX+Rz61xebIdcCzWhOYFmw1DpjsKXspr2Bxw3/G
	1svmxyciUfRvKXNkvrBBQHmYh7E7qDVpit3xJzFV6eoDLMZaZfNZw3JD3iVso5MU+V9cxZn/ixW
	/KrMgJN6O+RCaHAPe54PaznkP8/qvEu6AxMih71VTL26a3ipS/UAk+/OZENcQlhqapj1vtKZCtT
	ZI1l7WNoRfK3EjsCdU/+a8Eo7bcdAFlbCjJlUL7DWan0T6jl+VYMmqmEQcSc3fuBwlZoRtPVAph
	KloQbbu71IvYj9SdFn/DaUgAi8EgPfre7HM9SicH79OAenClQX1W0k0DD02tvPyiQhvSOUcMhsy
	DYsxAi73g32sdh3UkD3o87OgUW9rf7CbAiIH4Ql5i7WVI8WDxa+q84c=
X-Received: by 2002:a17:902:c943:b0:2e9:5eee:e085 with SMTP id d9443c01a7336-2e9a68da44emr20543265ad.19.1792245938535;
        Sat, 17 Oct 2026 07:05:38 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804eb4sm21848265ad.20.2026.10.17.07.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:05:38 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dma-buf: fix stale return value documentation for dma_buf_set_name()
Date: Sat, 17 Oct 2026 22:05:34 +0800
Message-ID: <20261017140534.3264870-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902135923.3599022-1-alan.tseng.cs@gmail.com>
References: <20260902135923.3599022-1-alan.tseng.cs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sumit, Christian,

Gentle ping on this one. It still applies cleanly to next-20261016, where
the comment still documents the -EBUSY return that commit e73c317efbf9
("dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME") removed.

Sorry for the noise around v2: it went out three times (2026-07-30,
2026-09-01 and 2026-09-02) while I was sorting out the recipients. This
posting from 2026-09-02 is the one to look at; the others can be dropped.

Thanks,
Hung-Chun
