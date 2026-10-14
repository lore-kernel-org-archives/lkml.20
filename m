Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F75E5208CD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987430; cv=none; b=pZ/QaRidUPzWvrhq/upQKp+Mq+v03UvXMFS0A53fYFdliwh3KPAEtDW0zsCPeq1nQxr8SxqXOBRXZXu9IGey3tA8eXjZV5HXJdI/HPG4rKNQu4oFiLyd1/4RIq4LjAi1hva4x2cdZs6rsZE8FxWSfzscnR3+DPAeqqr/1K2Ed2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987430; c=relaxed/simple;
	bh=qZvHyApaLSyIV/u8hAf+LBvoGKwMloq5Pf6iUipRYLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f8136392+6xa766lAKjiG8RssYHTSf5KEbad+bRLQS1JeqA4u5kR26Fi/BVCirACPldcvmas5uL3Rnp5+3yniYo8Zc+el8ogXxE3S1R8g3eHpDJZjn2f/kOK10seaWBUP7EUINBdbYdQ3DJfHPXsrScYrgAsfvuqe2HJsxQDhzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pxNQNDoq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pxNQNDoq"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so2693676f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791987426; x=1792592226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LE5QCyk/kuk4y0k9VpD3QxwfCrYmBzMze00/pe2mg5M=;
        b=pxNQNDoqcict5o9gxIZUc74J+AGfTP9r+kvXgu85B+rX5mR89CqgayPWjeB7VT9vgn
         QkWyd1plEvI1TnDi5co43uX7tm9bcFCIiDD2IxGldJ9rih4zQbHcONzBme3Ur4Ikpfgs
         pV+ASILVgZIX5HkVAIstePXtSWeEmKN3MsyG9I+Rddxa3sfSP/yyi+3CeyN7UO8KaKjr
         z1Dj+J7ngsR6eu1GlSQ3S9Ez4Xd0Ey9plE5RYN+eb7ZC3akbmb6ytkF0q29HI2xG/Rvw
         SkRIio/a2Ea9zJkyeICXydjZT0nqcXhEHV5jdMxslcm01kFBJHU8iip2b4PgREWaGo+V
         uQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987426; x=1792592226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LE5QCyk/kuk4y0k9VpD3QxwfCrYmBzMze00/pe2mg5M=;
        b=WO7IuAIDTH3RGoCD25WxJiboOB3fEy0SN9fyI4o806zOgmvx480CX+KThD3mewOIig
         Aaq2U4B+h5h/sHCXoEfJSTKKPwyaMwitA+Z3Jr6Rfpx4L/cta6r0fm7X6nej48/T1SDg
         iWNvyGVMXPSRyCeBiwXARYf19yI7PKU2Bs4qv2PvntkR9QLVVZIg3H5fwvgHpG8c6qkk
         sq2sJZ7NiZY0d60+YF0uCdNKfjJM/6J3w5w5srJv2dHSThvzaZTdULfli8xvN3nn/2LE
         PyzwwxJdKI395HYzb8MRu06vsG4NNiE5oLWjmxQFXeN9phR7IF73CKOjvFJjLbmp8Kdw
         zLtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBsN38rsH4gElAINR6O3OJhRbODJLUIFOxQ+zEmfOvC/CiC10umzKYvptfI2YvTCaY5Z3aMNR/xk9onxQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWQF5Hf2/zn1lePiaFNlJ/W1NIcAC//+A5G5oJJwjdzHKMuPgT
	rlX2QWLMHCmgGgZxjrfh5NWGmpqqjm+tFO+9Jy6TQ5+bV2KdswOwjSkJ
X-Gm-Gg: AYBFou3fS9nzz3dMk17ve+gk7xGQJ+fpjzLTHhT4V5Pw6FTrl9KUYZpq8OCYxM4rjmt
	UEPq4X+Jc43Vnd1etN4BDhRHYvaiUF1S4PrY93mjUv48yHeaJSm0KeK9P9c0iMvGufe+91xLKp3
	jBqroISmlcCtseMICguaYkxXDRnZe2wGHqqV2wcZO+LmcLY6nP7OJZx85NsK2M52SckY56OBlnF
	br8BVf2EoRO6dDDlBO/OkYcnEKO2t9j0+wNUsBMQrPaIOq6HN8aR+HJSwHIZd3rMk/DXmQRXuvb
	mSVlPHbJP2589QU43q3N1s3axyps9un7jWzpfM3LkniYwsW9UaAdSBmOSwS0l1D4w12LWT6P1Di
	k9IHbgeFXQgyr1JVYQezkb6krdjtxEw2RdyoErg+mPJPfXD6wFe+S41v5WxBfpi+UZggSnRlejm
	7VyS0D/+JZ640pW2f7rsNF8HQt0ErPLBlohbduJ1jr5kfi4Ll9y0kEa7mpmr9Qdg/b2jk=
X-Received: by 2002:a5d:6f09:0:b0:48c:5304:5e4f with SMTP id ffacd0b85a97d-48dbaade750mr28722326f8f.15.1791987426244;
        Wed, 14 Oct 2026 07:17:06 -0700 (PDT)
Received: from localhost ([2a02:8308:b092:fd00:d20:6232:49ca:4be9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaabc3sm12364370f8f.16.2026.10.14.07.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:17:05 -0700 (PDT)
From: Jan Remes <ciakval@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joe Sandom <joe.g.sandom@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	martin.triska@mycroftmind.com,
	Jan Remes <jan.remes@mycroftmind.com>
Subject: [PATCH v2 0/4] iio: light: tsl2591: fix lux calculation and precision, add I2C ID table, report saturation
Date: Wed, 14 Oct 2026 16:16:46 +0200
Message-ID: <20261014141650.259929-1-ciakval@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jan Remes <jan.remes@mycroftmind.com>

This series fixes several issues found while using the TSL2591 in
company products (Raspberry Pi CM5) and when testing (x86_64 laptops
with MCP2221 USB-I2C bridge).

The original field report found that the illumination value has always
been 0.0 (caused by division by zero on ARM).

Patch 1 fixes divisions by zero in the lux calculation, which occur with
LOW gain and short integration times, or in darkness when CH0 = 0.

Patch 2 adds an i2c_device_id table so the driver can be probed on systems
without CONFIG_OF.

Patch 3 makes the driver return an error instead of a bogus value when the
sensor is saturated.

Patch 4 improves the formula for calculating lux values to make the
returned value more accurate.

Patches 3 and 4 change existing behavior, I am OK with splitting the
series into two, if that makes things better.

AI assistance: Claude Code (Claude Opus 5.5) was used for research on
sensor behavior, datasheets and Adafruit library, to compare results
produced by old and new formula, to draft some code for patches 1 and 4.
I reviewed all of it and tested it on x86_64.

Changes in v2 (thanks to Andy Shevchenko for review):
- Patch 2: Use C99 initializers
- Patch 4: Keep variables in reversed xmas tree order
- Link to v1: https://lore.kernel.org/r/20261013143943.436816-1-ciakval@gmail.com/

Jan Remes (4):
  iio: light: tsl2591: don't divide by zero
  iio: light: tsl2591: add I2C device ID table
  iio: light: tsl2591: report saturation
  iio: light: tsl2591: improve lux calculation precision

 drivers/iio/light/tsl2591.c | 58 +++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 16 deletions(-)


base-commit: a22dc7ebb21a6bd4c8b63bc2c1dd46a24945aae7
-- 
2.53.0

