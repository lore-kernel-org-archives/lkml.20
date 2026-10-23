Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746173;
	b=JBLOU7eLl+ho0oJfzNVn5d1/G9+IR900rppdwCW8hA2m9SQg+ZAQq71ME980kVZGnOsb
	 nFz9jVLqJZ7zY2fEj3X7O7X4fTvwCsfnVMnakRkiRxi1d9DK7U5D1wY90rm2+FbKEH5sF
	 aL1NhQAGrlkfxS/wBHLfT43W44X9NCEGFWjzybWTZmOjeme5o7lsm+z4fSAzQn76wF8Hw
	 p1q9jaIC7svMz+mReC1qkwnMUwnUtUqSkz4Bik/gmLvXTt2xGcnIgsuD9Hpl983EQv9Sw
	 6ji7zroUqN+kkHzjd/YrHEyTUUDgEGyxnBxiTfeJ4ocmqfRFWwP19W6uK/4Vkgvl4kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=W2u0GsLQA3bk5U1E5MxaT9meY+C2dBQS97y2j73TftY=;
	b=aTil8BraR5BjCR0W0xoiDoKFP7p2zsMcUM9SabhgtMEUMsEMVt8vRInGb5wmfuQhKEfb
	 +EyYAyedPQOW2dGYNdHMW3+pfuTtXapEQEYWksN9vF+lUgbkw5Ta4j1UTsWtuNKpT0CuL
	 +AgHNdRMCyQfA6hnJihGu0l1TL6ok2sZ8dmgg/o+/RU+LDXuaxBN3faWS1oylkjTUtr+9
	 igtduIf0kCuWxHfUtr0OzMHQ5mmv4c1uu/lmCh06lQqDQXFZTZO2BiitAYsBbCiDkt8uP
	 ZzMFpp8RjmAnWH4pRjpiCotJwzOlt8n0a4CgtDZfhSmZml6Q2Cqhq4vJVkilHLAkr6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jDYO3Gx5;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5960606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5960606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jDYO3Gx5
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso5767685e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792746171; x=1793350971; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W2u0GsLQA3bk5U1E5MxaT9meY+C2dBQS97y2j73TftY=;
        b=jDYO3Gx5vxCUFLI+EDpLCE0w+3pmENNpnDt5qAcEOnXTiU9yX0pZkVpC67JNc499E7
         KfjRzQvN19uJ9SpCZtXd+i6smfrSnWVNy+eXliCkOQZZ04yDLeeqacr7CRamTmxucr55
         7DC37bGnRav19FcH4+bouAuvIwtx7eUSK10yXu6CUVpsdZrVX9/oAx3CjMfaLPwKfww7
         9BBxXZ38DuNW04nlyOzqLmz7Xgwu4I77qS1MQtWsssMx5VsuHsViKTJH6X5sEZT6ogUe
         OdVPPaeirj7Zx6zLB0SONPOHP2HHa8tvKaO4okwwlUt6eKqsfUNP8kOZpA+5Moi9tnAO
         R61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746171; x=1793350971;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W2u0GsLQA3bk5U1E5MxaT9meY+C2dBQS97y2j73TftY=;
        b=0Ytco/VlFTUafcAdq/azd+7ppfs/aoXYNHO11AT2d4gmongHqE08LgiQnQUTsU30y9
         XMmSXdb7nuHjhRYoHOWQy1MQ5TCiIAy8C3FGHYCfZCkpoUYbkoiEsPZlELOCHUakKHkw
         XMC5omnuPhDD+jYa2+Yi4JxK3C89pky+GATS1udBKrQtNdLmcY6B/bqi310/ubPhJGRx
         qmFvok+a+Bw8lzp23fkmjxzXGv3M8L8DCbEwpPO2UPARnbGfCPWO9x+XPaoCmnOqhmL3
         0j72FTnPV+XN+5FAD2y/uUSkSaLlVclRjJMk8qw/R1mFt+qUkJ0P9Zy809L8wL6IGw3P
         +IRw==
X-Forwarded-Encrypted: i=1; AKwUvByGz+r7BCi5OehNZFBHodk8MQN4e5msZMCC5TB18DmdAju8Nj/cIYeLgGoW7f8EeCL8qvwBDrBtagYsE9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5Xn0+h9DYCcOt+2rMAyLrBjFd7cltDaBRozunwkmusboyIu8Z
	pYUiVIfrMZ/8eBUquwoX8iWMAGgX04V33d3gWObLd7bp0H4UGsTnFP3FYtpOfXCZ6FM=
X-Gm-Gg: AYBFou1CzROmBH3SmWzJcW3L7BCjEdOZN35ZjU2yMvF+QbZzaFkArzIQoGtMA9bAW+h
	pJuG842AT1TZMnLVcgaCAZm5uJex7/RI4FholwSaQiLuYcgIM6bpBocxg8G9nBSQHXXfGmh1KlU
	W7cbbu8SbyB1WPcn+bl9gDz+mk0/t50XeKh80G3fwINCUiN57Z/gKC8T0beKg8IFLM+Nf65yLx2
	BMiEV6Z29Gq7EhpgoyqjqAzQfYJtx1/KAe+8A46v4IicIeSyUsS8yvbgUVRKnhMGW4c3lZUR9cI
	aC5IPNCFjY7gGQ19+jicGtMITKSolRJTzwEnzRiSSGT93iJhmoCYcAqiCunoarBIQtTXHKIv06U
	rVQhfjOThNFvnsOM0j2SPnGUCIkutkNsMsFsviTEfvnTqKR8QNXlv/GORx7OooayZ/ROvjlSVq8
	X9VLpenG9oCXbdz2Z1tjOrYBGnab7Te+G8dw8Nt5HF5MG7FRRqHiSmUuQiJMOUSyas2+wwme6ll
	vce5FKLRzT3yia5YW0S9qbJmqvYRqys6Sr+zjVfK1BYY74pGIKyRm8JAAs=
X-Received: by 2002:a05:600c:3b07:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4a211cbb062mr24588035e9.18.1792746169746;
        Fri, 23 Oct 2026 02:02:49 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210487d16sm60582535e9.15.2026.10.23.02.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:49 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/2] perf test: Add --skip-name to skip tests by name
Date: Fri, 23 Oct 2026 10:01:49 +0100
Message-Id: <20261023-james-perf-test-skip-v1-0-b6c11bdafd46@linaro.org>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH0i22oC/yXMQQrCMBBG4auUWTvQjKCtVxEXMf6x09IaMlGE0
 rsbdfkt3lvJkBVGp2aljJeaPpYKt2soDH65g/VWTdLKwbUiPPoZxgk5coEVtkkTh1728EfXdxF
 U05QR9f3bni9/2/M6IpTvi7btAzKWkSh4AAAA
X-Change-ID: 20261022-james-perf-test-skip-c923ea7198fe
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Alice Rogers <alice.mei.rogers@gmail.com>, Leo Yan <leo.yan@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

We've had to update skip list numbers a few times in our CI, so I think
it's useful to be able to skip tests by name as well.

There are some decisions to make like whether we could put test numbers
into the tests themselves, or re-use the --skip argument for names etc.
But I think the --skip-name in these patches is the simplest and easiest
to use compromise.

I'm sure test names will change sometimes, but it's much rarer than
adding a new test or compiling with a different config which can change
the numbers. No matches resulting in an error means that the same CI
command on different architectures could cause a fatal error, but I
can't see a real use case where this would be an issue because skip
lists are arch and device dependent.

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (2):
      perf test: Factor out the --skip check and its output
      perf test: Add --skip-name to skip tests by name

 tools/perf/Documentation/perf-test.txt |   4 +
 tools/perf/tests/builtin-test.c        | 146 ++++++++++++++++++++++++---------
 2 files changed, 110 insertions(+), 40 deletions(-)
---
base-commit: 1c90f0a3c8a1c4e38f9edd97af9e20848805a7fb
change-id: 20261022-james-perf-test-skip-c923ea7198fe

Best regards,
--  
James Clark <james.clark@linaro.org>

