Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E8519E7F7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822334; cv=none; b=A8DNWpVE8fOYuQ6hqUsFIXKCAhmOKPvyJtHI3OKmBn+qKEBYPvQaP6/oz8rsORHUpsBTZvMMt5jEba6jwERiiprmxnuikDMmODR0Y4nBiZQLYUIh4h+nPIeKjsNsQMuDThilpwDIHHFz9XPfJJSvkTgh9KmkkRWCST64vbJi7Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822334; c=relaxed/simple;
	bh=pOL139YSGSBhxrg6OYdc84Mp53cxmG4PuuXyHGtCwLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u5ItuCZ7GH9kFXbAaekJPRf36oUrZJcZ3FJ2SVwCt58WrkONCXunHerG6jDRxduNR485WNMJoAjl09/Ue2YxH0GQfiRSXJJ9dqrPxJ4YWDzUHdh82R/BeNPm78Lchf3/3JhOV9ZvcvxOzePMl/AiSW5em6iXwEvq7Q8LGiM3t00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=w5Y6fXaa; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="w5Y6fXaa"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917aca1aee5so28956796d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791822332; x=1792427132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pOL139YSGSBhxrg6OYdc84Mp53cxmG4PuuXyHGtCwLc=;
        b=w5Y6fXaa0UzM5PJUoxjjNU58kOaOSh7lfM6lGAXrDCliWuctBRyj9GTflFiSqvMhCv
         tpx3ho7BrdG6qdLEU+QNloaOYPMuFfojWURAXqN7ecfO2ZOdQpg+BH/ZTQQZ+jBA0jAM
         ACz1rKkiepVTZBUuc+N+OZLTQjRzO8xq8Ht+7dPaaGGQDPTDwJEF+AL0Rnc0Z8rfs+UE
         ijouBvavCWeQ8GgZk+pbx9S/oKd4v3NSvmLE3piiHhAqIbAB57SXEIP7sUryISl12L2S
         zdL5mwnJ1QRkqUCpQwMZu6AdRVA1xMFiLHoYulaVAZv5w9thabb2YDPb4Uku+PMEM8TO
         mgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822332; x=1792427132;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOL139YSGSBhxrg6OYdc84Mp53cxmG4PuuXyHGtCwLc=;
        b=OYRX3MUP7vUihecaq8NR1VmVr92leat8wdUI8+w14IslNa5FwJJ3tcPUAx+vkkh6cF
         wQxWcI5IIHGeTOBlr6NHzEdpF8U+Z21YfqUFaMQYMSrQ6sk2mECkerxGBw6UJ7V3phui
         0PHDOpdHTNnrdkKFfQQNrtLhJaFJwgYDJuwBFCuW28r1b07sFURDVSsqn1NNBoI2+RKU
         A4lO6WRuJy6mPCpNi6Q6+xfoZplA23GPbKvW74cllr+JRUjkVuw2Jzc5ys22kxJkx6ux
         z4Jmr8ZOhk3ibd8gnMp1InfkJj7F3lIIYhxnbbvBjCW9LZL1/++dlHORVRZFB/OdNf6I
         ieEQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7TGaUOjrc/47eo/PJ9IkAOKccZCjgYcRSsDEGPnIa4YLO1ESkhzNUHqxuU+795nB6vrBUsqm59VjloVk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJg7VaTPxcFBy7kYvGRVmTf7TIWWmODcVm4WUYwedaMc6W7ntj9
	ozmrQcAi9GI4BelI4aTU3OoRw8XARJjvGVNX5ERHHLiFfT8VoHmflQm2rbwPB/x8Wcg=
X-Gm-Gg: AYBFou3Il4smcNcarG9BfUnHrObQ+Szs9xpDHSCHhdDFt4NO9al6FWQugITxLsZWx0A
	CvzaVgXWHJuoUT2sZgJbanjCwTyef2Mvh/0ZfNQJSr9SP/MRsuU/8BJz4tWc4O0LlWuIuSo4vzQ
	KHiqC4OBfy96Swq9w0EAMTmYlA+C6dMi5jPLYm0qJd3YiLsfJ9AapLYgjqIDu46BDY6Bc275USO
	E09VQmon6B992i6ngRUm0jbXG3flB1wlC9mgjdGFv2zvYK6u9rHsvYqG+JxrhujgQLyXbW1DLwb
	v35E6Eq0heBSNUbdMqRCvh2HttkLWvVeU4Ir4EbNSuYnrbOEdXpQTsEDs8fnRZ55P3t+fWwB/bN
	DaAZSZYKNL9MFHoEbk9qj1ZG8JhSnaKADaPOqMNxG9dvEm6MeFHY2HlVk642bmKRA0ir/5Bm3Nd
	FJUtnZdKTGG2RmXBukVlfEK1L9mGMlWrD4o167jnb2eCRs3Y8CNCyh8bdoI27z5kdwJN+G9II6L
	jQsDDwgUS9MENsP78/r8VU8gfU6LykjCQFPRuxnKbm4BEepLM/bUp59NjdWEDhuvBBcYfk01sYh
	G2hg+vEGyNNrBlG0kQw8xW2P5DuSvBzjCBBLlTugvkOWprcRrfsx9jiDdZ1BdRSdYYlbIg==
X-Received: by 2002:ad4:594b:0:b0:914:4464:41ac with SMTP id 6a1803df08f44-91b552fabcemr186665366d6.2.1791822331996;
        Mon, 12 Oct 2026 09:25:31 -0700 (PDT)
Received: from jake-laptop ([153.67.39.44])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c4044dsm1329536d6.46.2026.10.12.09.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:25:29 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Ramshouriesh R <rshouriesh@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Eduard Kulyk <kulikeduard89@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: hm1092: Add ACPI enumeration and the 19.2 MHz configuration
Date: Mon, 12 Oct 2026 12:25:26 -0400
Message-ID: <20261012162526.2691144-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <asy-3JrGjoZCseXU@monoceros>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com> <cover.1791608336.git.j@metarealtyinc.ca> <b0d32a3b82eca233652f878b7ca91e4dc2d8e863.1791608336.git.j@metarealtyinc.ca> <asy-3JrGjoZCseXU@monoceros>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Uwe,

On Mon, Oct 12, 2026, Uwe Kleine-König wrote:
> Please don't add new usages of <linux/mod_devicetable.h>. The subsystem
> headers provide their respective *_device_id structures already.

Thanks. I will drop the include in v2, <linux/i2c.h> is enough here.

Jake
