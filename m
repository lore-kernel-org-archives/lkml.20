Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7490C514774
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549879; cv=none; b=i/bvxAsb/rv6fZvau1oogn2OmemZamvJD/mfkUfS5oD8rvEEtQqQG53aDJ2KphFZes+lGvDsiUlTDsbzHVcWidAZF7WnUYkkWjQXod3ZHAhSF3TIB1t1g20E+jJcVQDHqjX4GOiL/cPJvQWS/hw32iXwlvFYuqqooyFOWXh1GOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549879; c=relaxed/simple;
	bh=1TLp0mcpPztPjUtMwMwh25MNgjqQzYvogl/T02HTuZo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TitGc175n5pWK6xNFFB2NeF5+Gglg1DIvAKmY0WbAcQvTlJDrcMeWVfCDOD7KahwCglbRqFNY9OQnVrs6xhZKoHC2Zc+k0Qjtm+2YuWjabmZpRPWgKKnlv822g4aSAbKF3dWJ2rKPKVACFg+ldmZzmeRDWYLUMazAupOmebhMhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFBf0gMs; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFBf0gMs"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2529b3139fso170347666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788549875; x=1789154675; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x6+3E6XdBlMMWEsp4l0QEjnTRS+wXP5LKYWHqQew038=;
        b=cFBf0gMshOXE5g2gwE3/Mej9hTYqE9sjQIMtcy92CvVZxak4tmPey9EUBEf5jFUsxo
         kGdazRo5qaErqx/YIFn/g/kvPKHYEA1GSc3QZGP3vGyU1iLZYpJ/wyO+pBidmRBgbUK8
         HU1RAUy1NkVBcIt0Wf4q0hWD2ffVtUz7BLVP8asCZrZ+cB4gyn39R+aZGOh/+DXWGbkM
         U0JqP3plXnXU3xCywyE6sIWYr+R3AgehC6U0+S1DjV7rHk9pz/ZtCOyF6qPEd5fVreo7
         OoCzLqAtl8gPrXhLD5JoMf831KiJllQIadEQCzFuKTXlkz6ODZwPISuSQIG+u3TElHFe
         5OZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788549875; x=1789154675;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x6+3E6XdBlMMWEsp4l0QEjnTRS+wXP5LKYWHqQew038=;
        b=MmAc7qbLR012YOgRoRYsuN2eOthjY8pm6RKq08nzLDg+rtB4Rk8AJozB41x0dvGOGj
         BIlPaBRm7FTw9t7rl4Hb6F3+uojFc9iH4DgO1BQDALHgZZZ4a8YnFRQLnXl+NK7RDKrP
         UIPL3C/JOOmSG9nnu+HAdQOc+fICdC78+OD69qO8YvT9kVsg3Kt9WCCLza4PsS96Euer
         hl4piNmCeoV2HxIQqwb6BD57HNo+DxiPxgnH0VfvV1S1FsJE5sNS1ot0Vm66p+EqF7F8
         Ou1fKh4Ircx/HXw0e1MPUbp0hL5wm9zDbHGWf+tdORYuLM8jmISHI5NoKcU/llCxVWrC
         zYZg==
X-Forwarded-Encrypted: i=1; AKwUvByL9dS3B4liXMccwvAYa7mF8fDtSE8KbVl2eQB3IKB7qU9nK4Y5sJpHnzYpjcNb6VkPhxljJ8DAQ38kwqo=@vger.kernel.org
X-Gm-Message-State: AFuF++lzjNM5OfCD36KbKMLOHiQAqpP3I4N56kBfVKiexQISOU+Nk8eA
	w/fVPUBfnVWJO+oBr7vfTb+VzN2nGTMVJrn7q8aSt/uLq66edUC/BvgO
X-Gm-Gg: AYBFou2QqlL/tviCXEZX6GPwXk7u+O8gnxYWX9BAsLOZZcVwYwwL6HEYHWJXYag7x0o
	AaxlPycqUEY9L7f4fauo7e5tmZ+5s9P9UgwwH0Q953mZlQ/HvwUgvWi2B7y0j9sRFr0V9OQNR2y
	Ia5dFq18aVcxrVRYTtGbiVNUQD1yRn1I9KZ7iZR8gwA04iwNSLMEibZRRtxSg7ZIxx3uOZsZTyl
	nIMP5IqsxXb5J+seyvVTcaFfXcsesDoM/FF/1H1iQQNr3F6vAaeDO3jzN9G0547jEq3mYO0E/dl
	sbW+ZmuSwbT9tyjjE/gDr18/aUsxtG0F+763eolAZ12LzyNGDqgCKHojE2LUw2BBsp1LK4UvDMt
	iuj1mgIGz3j59K6u2mpBfNVuw378qCQaw9KqwytUGKpHgDr38DQ93Pwpx4R585RG4hSh8Ebd2/R
	XAbgld7/b0aKaF7bI5Fajse4k5UmvSvGQu8WD/XQI=
X-Received: by 2002:a17:907:3f98:b0:c26:19e3:e988 with SMTP id a640c23a62f3a-c2619e3ef32mr205513766b.40.1788549875549;
        Fri, 04 Sep 2026 12:24:35 -0700 (PDT)
Received: from localhost ([2a02:8071:50c5:5c0::48d4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5bb9a9sm141698766b.55.2026.09.04.12.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:24:35 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH 0/2] iio: flow: slf3s: fix and test the vdd supply balance
Date: Fri, 04 Sep 2026 21:24:24 +0200
Message-Id: <20260904-iio-slf3s-pm-regulator-kunit-v1-0-5ea61e6d6db2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDQAwAwK9Izg1EVxT7FenBalaDdlcSLYL4d
 xePc5kTjFXY4J2doPwXkxgS8lcG/dSFkVGGZCioqKihEkUi2uKd4fpD5XFfui0qznuQDUvHTHX
 zdZUnSMWq7OV4+vZzXTdLe+rKbgAAAA==
X-Change-ID: 20260904-iio-slf3s-pm-regulator-kunit-43ee079b36f0
To: Maxwell Doose <maxwell@maxwelld.cc>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Li Youhong <dayou5941@163.com>, Li Youhong <liyouhong@kylinos.cn>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Wadim Mueller <wafgo01@gmail.com>
X-Mailer: b4 0.14.3

Li Youhong reported that slf3s_resume() leaves vdd enabled when the
measurement restart fails [1].  The report is right, but the patch and
my own Reviewed-by on it were both too narrow.

Andy asked whether the regulator refcount can go sideways here.  It
cannot.  device_suspend() sets power.is_suspended only when the callback
returned 0, and device_resume() returns before the callback when the
flag is clear.  So the two alternate and the count stays in {0, 1}.
Please drop my Reviewed-by, the reasoning in it is wrong.

Three things do go wrong though:

 - resume enables vdd, start_meas() fails, the supply stays on.

 - the part is then powered but idle, so it NACKs the stop command.
   suspend() returns early on that error and never disables vdd, so the
   system cannot suspend any more until rebind.  This one hurts most.

 - if regulator_enable() fails in resume, the next suspend disables a
   supply that was never enabled: "unbalanced disables" in the regulator
   core, and -EIO.  Unbind hits the same case.

The original patch fixes the first one only.

Patch 1 tracks the supply state and drives enable/disable from it.
Patch 2 adds KUnit tests with a fake i2c adapter and a counting
regulator, so no hardware is needed:

  ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/iio/flow

Four of the eight tests fail without patch 1.

[1] https://lore.kernel.org/linux-iio/20260901025010.356735-1-dayou5941@163.com/

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
Wadim Mueller (2):
      iio: flow: slf3s: keep the vdd supply balanced across suspend/resume
      iio: flow: slf3s: add KUnit tests for the PM regulator balance

 MAINTAINERS                    |   2 +
 drivers/iio/flow/.kunitconfig  |   6 +
 drivers/iio/flow/Kconfig       |  15 +
 drivers/iio/flow/Makefile      |   1 +
 drivers/iio/flow/slf3s-kunit.c | 734 +++++++++++++++++++++++++++++++++++++++++
 drivers/iio/flow/slf3s.c       |  35 +-
 6 files changed, 787 insertions(+), 6 deletions(-)
---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
change-id: 20260904-iio-slf3s-pm-regulator-kunit-43ee079b36f0

Best regards,
-- 
Wadim Mueller <wafgo01@gmail.com>

