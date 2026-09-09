Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A386556B9B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957297; cv=none; b=jZvMybk0c5Uu7d22RH/l6pxt0Ukl/YdzbaU35MZtLycNiu3fzks8ZDFtx/nAxeIsBMIyGsx8ckeMFN7v98TenFtbbOsXV7VbN1eyAhFnpL4MP0VZaZm7nMPnLlL4IlBz2GavJC+p5Vv7+wvFjfFT6YwYrqLKeXyhTqiwQMbYIE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957297; c=relaxed/simple;
	bh=7DWuOuroHipYpKibd34yx1PZTOxQnkcdEL0QadKuQI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kazaPVGNKAdoze2NKG/yVPtgohOqIQeppi35dK+C5Iak+12X4t9Vy9bZk/jHtToty9OxwHO+8kDxB5q0vCKCLo6Q4bTtbzQjfaz+elfUCh2VZMxDJUxr4W5D32IvOJO9Vt+t7SVL7LmePBgnY7TcR2/786JDoNw9zI6NKFQxyxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhneNsWQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhneNsWQ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so127272a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788957295; x=1789562095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DWuOuroHipYpKibd34yx1PZTOxQnkcdEL0QadKuQI4=;
        b=dhneNsWQhhGKSIDJS65uYXDlr/lahqV/DZYDiy6J8Vw/JiUzS/YhkCwM1R1v7If9KL
         8Y6NkoTHzRVl4b/SUnx64cw2O3s6cM/GdKZLhqW8S/sLolQ3D3k48mhpI+wAGD10pGuC
         TaAGZvE+CmHkMoUVOhAooUevx5vKyS6/W+DYnfQ/QySZuCNgWWb8cmPJMRKmUJN4fNN+
         Q0fZ1CCPlKxYiN59e68NHvFa/jGgsW4jYbbvgamCtL9SGLl7yJjb89cX278g0uhEX7DL
         575usE393kQea2y6csBy/py6tqApFUDAAr5M4+WDsKpNF8Dzingbn+NAUxLKH7fdruRC
         GZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957295; x=1789562095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7DWuOuroHipYpKibd34yx1PZTOxQnkcdEL0QadKuQI4=;
        b=KAT5bu+1kI6RkoSO/3EFLVwwoda0QbBrduvkxdNdAMsp47lC0RnFCLwnIQyV9Ae1q3
         63EGD7aDqC/NU9siJtFz8bIODaDRV6O0W8itAJj5qFf5CHzfmc2Q+kJl9+2Y4L4d3cVU
         uahfVPhF4HhWQMee6xGLtWBzVU9XjFgX5nwQTMm7JEU6GY5tz+BD0ho9jC4QwRBKFhVW
         UOd9t/9UcAvE9IjKUlaDvsdfB4Fnfcm1/dzq7T/XvAHEZnoHjvUxkwVL0nuQr/lYQvMW
         EIHj0VrrSen5YAtkkzGpdkXxKBjGW0Y3GhfEskmHvvXZUDO93bawhbLYB+a5SMSmW+8B
         w16A==
X-Forwarded-Encrypted: i=1; AKwUvBz8RfwPMvZKqtN0V31+HnpY3Wx42xTs9dSo0Q2osKc34oHjFKxBwSKXl8L/5heSTSHoThTHKrpIF96xif0=@vger.kernel.org
X-Gm-Message-State: AFuF++kOCp7SH1KamWzHS1vbNHjwCam54AbCZ/RYdKdhjJ0uoh3JkyPs
	H5w7zz3gv+WXtcJ1XP9QBV7LHycDOi5kymP78gSyFy5l9Bt/asGFQMWnzKS4Mw==
X-Gm-Gg: AYBFou3fBH6zj4a/dSMd/weHGJ6ZoDGfLQk6wsdl/ttdUk/Jiur7APmcvvS695RC8Mv
	ArdU4RpTe/dMBly9cET+xj6fLZaV1X4ViVX6YfDpqqk0lgpM6Eb6/ob1K+GeMRy8SV/0cQ9Hx3j
	YO2rqv/cV8IkDKI3HMbHo6w4ZKuGPrBE1bwSnUaoOPl+jUfqTxXbKcPnSSl+N0dFwTEdDhZf6+b
	jXBn8rc/ADCdOL+Db88Rfjik/xXKZrqUDK8A04IlREvl7QSkKSBlY8ghaXdxLl4v2RdS4mdvoJe
	cdjJBXOtvu+v3GHuldQPO6H51zKXoCITRTiQOHEvX5cnxVzjPC+fkTgq8ayekedTbjdUGyLrLae
	dS0MO7G6tStMcbvLLsxvBrgl9v/ZSJZ8PEBKtMqdh/rYRcMsNo7DOLRRmYjukZVw41BtDxl90iJ
	/h8VkGJR6yDprEF5OeFzGuBlgRuGufuXxV4clqVFt6tuuoDEfEqeYimjAW//VJIC43bC4HohusE
	wM7CC7npjimpr4jM2SKGBsu9g==
X-Received: by 2002:a17:90b:2b43:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39d709e5464mr892422a91.10.1788957295334;
        Wed, 09 Sep 2026 05:34:55 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm69561409eec.16.2026.09.09.05.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:34:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: robh@kernel.org
Cc: saravanak@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] of: fix typos in comments
Date: Wed,  9 Sep 2026 18:04:50 +0530
Message-ID: <20260909123450.215657-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CAL_Jsq+qAyYKDSFy1DiOMvdQu9ENK1gCa2tp2SMZiAE5yQpRQQ@mail.gmail.com>
References: <20260907062017.5881-1-hemanth.selam@gmail.com> <CAL_Jsq+qAyYKDSFy1DiOMvdQu9ENK1gCa2tp2SMZiAE5yQpRQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 08, 2026 at 08:12:19AM -0500, Rob Herring wrote:
> Still does not make sense.

You are right. "Iterate a node children" is no better than "Iterate a node
childs": I replaced the word checkpatch flagged without fixing the sentence,
which was the actual problem. Dropping this patch.

Thanks for the review.

Hemanth
