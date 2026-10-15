Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240C958E2D8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096569; cv=none; b=ADUanAl6W4RowxfbmofYQzhGleM7bU3pYyCqRc6ZNaq6JfZX88HKAGxxTqRIB70ps+923qK10jJGBePoRpgtZixn4mOs5A6Szf6kBwEw16mGi+LcgB79hP9sea+ENI1SPV43wJKe6NsoXQB9jSfGtUwgJuj+gqwXcgFak8LSySs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096569; c=relaxed/simple;
	bh=fJAIJMuzJlXMp+GWBJ+Z6kDPcsHz8ZNmrf0ByY3/yBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W9L3zUuXH3UlwEfKojp7EsJhnNX/T3J80RBNZVZOSTLXdo2I9ol6WTC4+llgZsziZaIX2KRxcj40jAUbx5HxbFykFQBQusJH0qp0dqYrsbK7c7Yyco8xAknjdQR2BVMp/Wr/4Q2y/phY6625qNEDXCuK3AmZbCMdcBH3ZVRvR2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXpOkEa+; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXpOkEa+"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-917c04630c2so69709996d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792096565; x=1792701365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJAIJMuzJlXMp+GWBJ+Z6kDPcsHz8ZNmrf0ByY3/yBI=;
        b=aXpOkEa+7eALWEOGtn/4O5gxOpgTm6Qw8lZCnJmtS1Ni/b7aCczEXDbWstV79+gBu8
         zXv6hN09g6wmu6boIgPgusPScdKu5cZHB53ZSn1vKfF8ZU00Bz4rczA6ngf5bmEQkO/O
         f6iQN6sJTY7L03gY7V+zTN3wJ//k/Ct/Uxnl8KirNR5JiSKzqyAdsVMP4kvhzk46MAYT
         JtMZFlPfHCk/nYQdt7QljpyFz+ovK9oYL4BMTTeXCcgrIYaQj84O1DuqfKyi0uHdTuQX
         BVY7XVCENP+P3faOU7Wm5eaxI+Hj4KbYuaT6mAIDYu9PaCoiLpYY74KVjcIMN+6Nssd0
         DzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792096565; x=1792701365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJAIJMuzJlXMp+GWBJ+Z6kDPcsHz8ZNmrf0ByY3/yBI=;
        b=Kk41I4qqWEuxoCleY7uavgpMcxqhpL/cASsrWln8GHHaTpJct/vjM2wjHXZk6x7p5w
         jFjOKxmmKKoVvaNKKUQ3f3MD+KxslxlHi0skZgltO+Ogo7x3y01oVHF8uk+1fr7+bITS
         miE9eRqY9xaEys0pcQx+bQB6CjX6TJMnHLN0+0OyjVrAQ+3zV4FQpFuePgeTBMboyANP
         ModI8wRKZjrxXgj9J+r391ciAuFLxULsEBxFHisUrY18CvHytgGdozIa2VhYs3gW5NBa
         kS652R0EvRsCbbuVE3eSnizsS6uf/0rbNx7jrV0a5aPIv1RoNXSxfWaUA6KWodxYqEXD
         ye7w==
X-Forwarded-Encrypted: i=1; AKwUvBwgWKhfQf/JsJJki9+N6N1hpJwHkJczf6MjrywdISVfzsizycNOypemS5QSaB3f6SfMkAbKC2Z+ey3/Log=@vger.kernel.org
X-Gm-Message-State: AFq9FYJm4pGqiywRKT0BHYdLTFoZK02mmVPplCLRg3m9pd8SFKFHS3Up
	g7hs8nutufLb1BVNw+OVgQUmKFT1EeFMO8rhnurqmBIwehJ1KZ/5dNNU
X-Gm-Gg: AYBFou21a7rwxnnIfqjy5Bo7ID87D7MRFvSl6npxafXqYAoaEZPrYIMoLkY8PpVzoi3
	IYBZV2ddHirShLKdU6Ql51HOc0cvNM0UkcxIuiA1rtEEK+qLfWMfR/Nr9cEf5QHjeWPiD3mFYu1
	oB45c11JWI5w1IXEQUDEJYI8wbti3ExZ48pBWC//sNwroaqaIGl98l47h4FULQ1uSB2GWSi/L4J
	Wz5KF7ltrsR479iFMdqkQz4WWyTchfYQQgB/b81tVGGGl95z7aGmHaHktJsDhhmag6VEkYYOQ1L
	CucqNL9f68o5AuwjqZgk/rJ/a9QWGoUPP/rZ4+X26bltAGYKAmHHVugXjyFyEBl/TjALH6OBMA7
	HAjup9al5N67R+i9KfA8lHRxYX4FjEYktwRL0oppvBFv5uids1WZc7NaF7gB5Px8KYCL2iKKxqI
	Y5KU0/itEt6JfwTQw3BVC0d7jeyFg39nH6on+pDImfqPHIMd1C1O4l/KTvWqJR+vqJclZMo/pjR
	9pdmVCt/Wz1Ttrd1/trmTj5UA==
X-Received: by 2002:ad4:5ca3:0:b0:91b:8afd:84e2 with SMTP id 6a1803df08f44-91b8afd8f30mr210166596d6.39.1792096564806;
        Thu, 15 Oct 2026 13:36:04 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba4b9f0sm4844456d6.10.2026.10.15.13.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:36:04 -0700 (PDT)
From: Dingisoul <dingiso.kernel@gmail.com>
To: joshua.crofts1@gmail.com
Cc: andy@kernel.org,
	dingiso.kernel@gmail.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	linusw@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nuno.sa@analog.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] iio: gyro: mpu3050: add missing trigger cleanup on remove
Date: Thu, 15 Oct 2026 16:35:59 -0400
Message-Id: <20261015203559.2125485-1-dingiso.kernel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015221818.09527ff6@systembl0wer>
References: <20261015221818.09527ff6@systembl0wer>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Joshua,

v2 looks correct -- mpu3050->trig/mpu3050->irq are now only ever set
together after iio_trigger_register() succeeds, so the unregister/
free_irq guards in the error path and mpu3050_common_remove() can
never fire on a trigger or IRQ that was never actually acquired.

Applied it, rebuilt, and reran my reproducer: the trigger now gets
properly unregistered on unbind, so the attack just gets -EINVAL
instead of a UAF. No KASAN report, no warnings.

Tested-by: Dingisoul <dingiso.kernel@gmail.com>

Best,
Dingisoul
