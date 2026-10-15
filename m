Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C059A356747
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069965; cv=none; b=Dr3hMezhIZ/yKVgisLyGf2Y7yRvwJXFGQf6l0QBSU0kvjKy2IP1qk2OuwrGIKENwPs2hcMXcY6zgGgeFODfXfP8c8K3dSQefuCdddwJJX4C+uJyfS5oUhRnwpN9z5fpGKSNc+khO/ykknqEJId3dqAZ9MLE01jBCyepg3TD2zpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069965; c=relaxed/simple;
	bh=l9UNplYJIOv2bNql5t6OQ2PN0ybmSrQaq8gHkf+c+2A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ry5yR9jNWQQpShPUH3diuFdVQ9dQju0kSaWA1DFOhk1y3gSoQG/MW0U6iCYhilKNEPok6unSvTAdGs9Qn7Y4RMjSZmSicfoe4n+YgzrtchlPvK2pCUZdOD1NhULMWMAK8P9nhtOUMl9ec+wUL/6FuBRncMIMbcd07zsfzOr2p48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4k6Y2lU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4k6Y2lU"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so46148095e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792069963; x=1792674763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eYpTs37ebMsmt4FCok4Jg2bBzSQXMfDrajAj3p5BF9s=;
        b=o4k6Y2lULHW11jTQ5vb1Do7VNgkQyWsRiHzbRfwl1VMdDfta3bI0VS5XuGMtNcyp1f
         15l8VJ/IqU7LYnwqBwWIXaxYFz2n25CR4h3Ne1+Z7eYvJUCm2v/KfPWLC++09LfsFI+D
         EsBBul/+8WPnnP4+hwpnwY3EYyEoAcRL6EB4SeyiJI3pmgU6twtKJaCzXJBS/Tlr5Uzv
         Hxr9ebBruP3K1MzkQ4MqhAf9wsKGTEwnkMxKsi/qX5/nG8uj4OXxTUJyXxqlHxidxair
         rLN5WraVsA0jM1rgvntTpSFSpZvPgtroYMZ4m+Uu5mJX1GzGxlCo2PgJVUxp4XU7nXcL
         qd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069963; x=1792674763;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eYpTs37ebMsmt4FCok4Jg2bBzSQXMfDrajAj3p5BF9s=;
        b=beQsy54juLjPhqLDKPdN5TM/5rw5DBSvDd/KjiC6sHGUUMwSSmcYQlbBQ04LG7QXMU
         iq9e5Aj0+fjWOl5+hUQ1h86F0OCyEBJQcG7qwIncw3ugC5HEr8pMHelTOszA8Qd6fILT
         qwoCvcO7YkY/Ey0mv7pLTjRk4kpopkWKsODbjbZMvnYDwQDFxEYfusV59OUI0EDJEsxD
         l0s9GymLAEGT/OXm4Ab+Vo0j4h1fu5dzGa3iohA4ITcrekPhqzoFxNkjrx6FwNk8+M4p
         lnnh5f1SJDlPaDmX3xFbHji7KIiCjI9b+Thw45bpTJdrdlbSNXE4sC3bmyBZCDdHGbAf
         eCqQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2h7O8Yq64Gj5za7sz7+QQtjTrFW/04TBFSkLW6NFeXJ85XGbzLWrfECyWJLTEKreqQ/thKdbFsBVfK34=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjt1T6V6Pauqocw2OZ5P2M7GYt2koz8a2sQtFK425gICeriKVg
	sWa4dRVsXLfuVp/5jj9GKmJB1WCr3EuYYhlTJ1f3yarrLDG5AEJu+2Cv/fWWSg==
X-Gm-Gg: AYBFou0gx9cjVgbOdO/2Ysb9oLxa79lq+VjabilL06Fig1bmZVivlUg3XAhUL3Fg743
	EH+OqLLoCQP4fj6bbqnXCVC24Ox3ZJwqSx3c+yMBcG++4/nZjU0fHqW6erbS4HObuteiLepYWkt
	C8MGjcBAxvSEwD0A7qHqfSV5KSpunF/iXja3FSCOK7K3TlvQdOgI2gjhdDW2EtpMVzM8Yj5QiPk
	0KMYFaoxfVt7hCUGhh3VqyHUwyXYITOPsskgjz7mok5XhXwzgG86k1Vtxh9R6+9rZsUC6vlY7sh
	HcAvfFq3Csd9RB+tAcPdFBU8890Ky1lvHaUuttnKT7ni/EkruvQXAdiICyD39OA5fu77el8cDTT
	ZGCgbT0HmjH3viUZZZ+AcstnzSVjfE6NlOlkk/As4baOVzrLomSnQOj4APFhvWzkPlR5o1cr1Iy
	kmQoc1snr0Oq5P8zsUdnQ6tqYekK3iOOVqz71hH+dsn9gbaCDjXiOsP/bJL9XOy9gGbCmXsARXu
	cGqGd6NqxjkWtDoEPY6B6XEd2vDi3lDMpdAY/vhNV/JcI1TIDiMVuu/j0JjXaoJDh4bnrKvQ9S7
	dXyYUj/Ii+FSOyMJpn+2HMscQ8iagg+kMZmV5QEuDtIhhhQLnsQtAAXVYLjPCWpvCQTRnhc0gD4
	XCUYIEtAyqUDGEmd9ey25jH93ivttSYRXJPKE3hJVhtMzgQ9VyF8hqPmI0fzPULb1efbDu+SA0h
	V1eesu
X-Received: by 2002:a05:600c:e547:20b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4a1a2c07cb4mr166991725e9.30.1792069962853;
        Thu, 15 Oct 2026 06:12:42 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df0f99f0bsm6681901f8f.21.2026.10.15.06.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:12:42 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:12:39 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Eddie
 James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rupesh
 Majhi <zoone.rupert@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] iio: pressure: dps310: add per-chip data
Message-ID: <20261015151239.00000ace@gmail.com>
In-Reply-To: <20261015104945.2687162-4-paulius.zaleckas@gmail.com>
References: <20261015104945.2687162-1-paulius.zaleckas@gmail.com>
	<20261015104945.2687162-4-paulius.zaleckas@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 13:49:43 +0300
Paulius Zaleckas <paulius.zaleckas@gmail.com> wrote:

> Move the coefficient count, the TMP_CFG startup value and the IIO device
> name into a per-chip structure, passed through the I2C and ACPI match
> data. This prepares for the Zilltek ZTS8032, which has two more
> coefficients and a different TMP_CFG layout.
> 
> No functional change.
> 
> Assisted-by: LLM
> Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
> ---

LGTM.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
