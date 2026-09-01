Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246F3655C7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268000; cv=none; b=Gsn49nUZWq9hXVuJgBasTEtYQH4lHpo+oRCwn0lbRNbl+5CPmPgD/PSNn/AvNwsnjcoQF1kYicmdGIP6wUrE5WnJq5FIslAVHcQp1taj/Gp/Ihx/DiUK/d4qYutHeBFXAQl9GY9fD6MR0qvKViv7jETfOlW95LGFaa4ndLSLNAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268000; c=relaxed/simple;
	bh=+aSS3GsUC+5ykoHOso9YQs/0VWovAtIdiffXxIc9lCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uB6Is6qPeE4UFILeOQ8yUcstQ4X7JdfNmy4zuN2qc0kxom8aDMF8Mcx4xmFZC3Fhf/1iKnq90bc2c4IQcr8w2wyf4dqtVpmyXgBFPSLABvgELvaOPFL/SHEp/F2a36FmGEpAR/JPb0bmYoTNKhinYNIipYRHOWRGOjkedggyqv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGkzhZvt; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGkzhZvt"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8615bb9d857so7755897b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788267997; x=1788872797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/VKJC3MqZBrocLkf3UenbeidJdbk9BN7cs7RjfXB2Q=;
        b=QGkzhZvt++oc+UoFHb7pbpLuzzfIVZ248hyo+cvleuiMIq62eRvhoTU+RCFufMx7tJ
         MzFFSzDqOJUgQ0yO9BUBKlhj6tVgDjd69ThdZmGqM32ZkXjJJMGu0Zc2n7VVsGtT/4eO
         GdgQJuP5QlJHOKEo0Epq6zbpP7mIbjR5AozujAc9rpV8kjeYznH201bX5X71i5d02OLL
         GyINE7v8ldyKjnmK1qVoaDMGuLd33k1wmmUDAbKeOR31NzFjcPJHkHNvWKBBCq16rSiz
         wgIk6Sm1S2NRSBoG6L2yNX/49RUwVbtBER3mxV+7MI688FMNAu4gLerbBS65CSJDWkFw
         Hc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267997; x=1788872797;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3/VKJC3MqZBrocLkf3UenbeidJdbk9BN7cs7RjfXB2Q=;
        b=jSYLi/2MDYY0HrPKB/CnvfkCRyGnjnd3x4dJOi4eTyRsZ0jYGMbPxLMQ4lsYIknzVh
         m4e3QtMLhR+Vc6foDOlUyxoonzKKHPC1qJTA2ZsMQyT42I1cFzIeCsV3KcWpyLrz+Rm1
         anN3HgpRHvVuYT5LTZ7HKan7xcu2aM1zlXA3d821cr7EOBZ/nuLijg2v2fYJa4gPtxHZ
         pfzjwvWaPJrLdZ6v5uu+hjloUSevyVFF+sPpVFDAIOoDBTQC3W2SZN9BR7WC6PY0T3Wh
         5Jzpm1KFk9laaC4Ti0vaEmDF7mRw00bTu72X15Psy9mFAFC0HOeImH+A98iOZChJM1ij
         7GXg==
X-Forwarded-Encrypted: i=1; AKwUvBwZQiX4kxUhhatCBG1sPcdeTnsq8MOYXZooD6WaNcmdFBONXSM/cmrr1Z2G/vYAiK6Hn9qYwgcpMwGx40o=@vger.kernel.org
X-Gm-Message-State: AFuF++nnsg8iPMBFDW6lwdtcB9jSeN9QrzthcSVsPj5V/nLNnS1DAS6W
	E4pTqEjO/XOlYnQarT7OMNEMZhjszPE5Euq8TDdou2FlfEQOm7lOe1k/
X-Gm-Gg: AYBFou2Q9OtaaB+KQV1seIcD6Aa/uKY7pK+iSRl9PHHTrvAev7rQOw1LgMvIAnNdD0B
	Vbs7KX0RDizRjzLeDIU8QcgSR4bTYsOntTOQLpNucFyz3JNsoilmmRB0L1qqXRncgKSYg8DhK3D
	OF4KQmfnq/Sf9Hkl9d5QY93MLghPPAvP1HqzlE4UhjJJkJQKMAr5cvpcxwnqn18+oeycPIdPufo
	/PgpOJQ1jwyyRZKYrU01+2KSyPo7zsYcwc6h2nEDDkFO4gKr4NTm0eMP8yhRQ6y4nu5W2RYug8o
	aBZxyFZwGJjkCFu9T0zirx7mXA7Ec1skCAwSOCQMRgcaBDffbt2r8FFlgefcOTV2f6jJ5CVua58
	dtfdsSFNEBzylHzMZi2vLEjRalHN153oBaA9uJ04Uvf5qLj+6efvQepUKq0alxNM2rOEdimqp0k
	qdO64eYh11BYuVhXF2IiQVh7beKNNQollgGK4rZYVBqgJ+MZoBYGdCRgODlhqrovTQ
X-Received: by 2002:a05:690c:f:b0:866:4769:d60d with SMTP id 00721157ae682-86647793634mr55746487b3.22.1788267994609;
        Tue, 01 Sep 2026 06:06:34 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5ed1cd5bsm73290547b3.17.2026.09.01.06.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:06:34 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 0/2] Input: fix two kernel stack disclosures via ioctl
Date: Tue,  1 Sep 2026 10:06:26 -0300
Message-ID: <20260901130629.24078-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Two places in the input layer copy a user supplied, possibly short
buffer into an uninitialized on-stack structure and then keep the whole
structure, including the part that was never written. In both cases the
stale stack bytes can be read back from userspace.

Patch 1: EVIOCSABS copies min(_IOC_SIZE(cmd), sizeof(struct
input_absinfo)) bytes into an uninitialized struct and stores the result
in dev->absinfo[]. EVIOCGABS returns it. Only the resolution field is
currently cleared for short sizes.

Patch 2: the compat path of input_ff_effect_from_user() aliases the
native struct ff_effect with the smaller struct ff_effect_compat and
copies only the compat sized prefix, leaving the tail untouched.
input_ff_upload() stores the full structure, which a uinput based force
feedback daemon can read back via UI_BEGIN_FF_UPLOAD.

Both are fixed by zeroing the structure before the copy. The patches are
independent of each other.

Compile tested on x86_64 with CONFIG_INPUT_EVDEV, CONFIG_INPUT_UINPUT
and CONFIG_IA32_EMULATION enabled.

Iván Ezequiel Rodriguez (2):
  Input: evdev: zero absinfo before partial copy in EVIOCSABS
  Input: zero ff_effect before compat copy in input_ff_effect_from_user

 drivers/input/evdev.c        | 2 ++
 drivers/input/input-compat.c | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.43.0

