Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71FD490BE2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854595; cv=none; b=pYVHc6m3hQaXXIan7nj4jUpf6tIZQfdBidQnXeQGrNoQ/Gd9jYSOT6ORqyeLaTenn+SWGCgpDffvzwjXQHIEu5m1MnqLj2wU3EBcSyCdKBUB9Vs5+Y8KzpFBFGbmWLQwvXR7Vi0N7D+AB5VXK6GWWDm5xCGn9V3GdtkmoUQ8xp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854595; c=relaxed/simple;
	bh=PHLMa4XZVjmPRjtdmBXR+zEWA0beFIl9FbfG/7boLNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBliOH5JT+iIQ6yepra2Row1Eb2/uHXgPNJVpyY6oxLvhYD6ut5YOcyohaMqTaUXHQqhNNn6znjNCUMS/eIAPHv2YJr8oRsD1z8swsRYHf2St/r0qoJeTWVsrmxpOwJurt+dVP17UzdsZJ8MZ5aHUfY4H4l825qY9kJMwujXc8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNmtb0nA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNmtb0nA"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-495437bb891so925895e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854591; x=1788459391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xVBS6M97uJu4LLSv9OF5qRTcgC+W4QPIoPufud/sHo=;
        b=BNmtb0nARwSai0CU1zbYHFYaJxXpMppmYBImePevuzzMchU1S1kiHEkF/AmFx4+gnK
         gYOjDsPOUX3km6EHD1fqMqc+VHgPKdnU1tEXH1czuB9eqNQyq7nPpcz4iJe/FN4EabM1
         wAEilHA2ZJWa9nSwlzt5EeX9XrOWrMtVeofJhoikkWMiCMXRvgDz0NAslX2132kPh4v+
         RUvKQb11tl22RE5HJBuL5llAP/aPQIIelzLXodrWgfdlNsAzOvzSRFwt3NSkbBPKFREo
         1LV2AdBFN5g3hbu5I8y9cJ+AdTaE9O8HesBD+VRLuPVkg+PvAZLQo//WGRoKABKWjntC
         4ZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854591; x=1788459391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9xVBS6M97uJu4LLSv9OF5qRTcgC+W4QPIoPufud/sHo=;
        b=gLIA/A/vxqRilsM+0o9lhKDmJ83ZaaJyLitl22PSgIezBAa7/tsSE8vqlNhg9Jfd/X
         Uhb+xLUHypINuZiar0XGqzCvlQ3RTUrgSkbiKUroF+NqEeJ/z+7EpsZe2HyAwAGtiYn8
         jRDKFvwImFbAKCIeK9JeUkHC0eJEOR7PEiiRy5ZEKvwJmNUYP3g4wuZsTpnEhCiPgzlH
         8J5BnLCrhipPkm7vCdsoJHqPJ8kye8gMLr680mSNFZXd21xKXcc065KuMUFwHy1ZH9qM
         rYAgqHiK4gYbeiDWz/1QqeuKdkRaaDiSsMzLR9Vc8eCZCUZHnz9Rkd/Oc3YIf/4m7JFf
         xJ3g==
X-Gm-Message-State: AFuF++kEkfh5dU1k/A2/3AbndSetmc1aUaL+dKKTDc5fgJmbq6E/h/YP
	4XdUUgPCoHPxsJniSyt2IoUNy0O6VQWCKU1wylmdFVfpnReYhN9o3kBb
X-Gm-Gg: AR+sD13jepkoX59QsBPnNfqw2cXFI3RgZqifaBqmR84nYuMScpty/xvJG7bPSyvJ/rq
	GNSeVxTaa9sxW8Zt5e6eWnT6O+XjOiL1urWJCftJrdU3BIFxwjj8LcOIcyqIpdUHpAekIJNgxq5
	e1WZ4LBcWDh9tEIseHoAQxva+PJhr8hLDiHsUb7RT7MVIPfVsFqaOIJzpHXTFLlO8MDlfDXhal2
	F6XsOOMVxKxlPeUqh9FZ87db5kkfMhPSmAzVSIsmcZHkvDufttFkLDjMuOKeW1CUsYChOfZs7JT
	YZ0EI6iGXv9dVj8UNKk+7gxuVDGuUznFQzF5/WyEAUlgesXgy5Cqq7nP2EUEfaGRW//UjALLSwL
	twouw+1YbLaoALE8jr5WU73lDlc2XmgDRRVkP9maeVsX5bvQ+1BFX/2ECzuUUp7i5mLzhbXWMUr
	1sqvuc3S4ataTvAy27TExSg7FLaK365zpgmSxrmycHRR+rwBU11r3egrg5rIA9uDpChqwmwrwAO
	uE4qo0hytIQCD/TkLNZ5ZB9KZ+NSnVZGo+QXPSnOP/r
X-Received: by 2002:a05:600c:55d6:b0:49b:914a:94a2 with SMTP id 5b1f17b1804b1-49b914a960emr24543115e9.1.1787854590678;
        Thu, 27 Aug 2026 11:16:30 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbf33sm11328702f8f.23.2026.08.27.11.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:16:30 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 0/4] platform/x86: Describe Yoga Book haptics and audio resources
Date: Thu, 27 Aug 2026 20:16:23 +0200
Message-ID: <20260827181627.2427880-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
References: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91F/L firmware omits software properties for
its two DRV2604 haptic controllers and does not instantiate or map all
resources used by the RT5677 audio design.

Attach board software nodes containing the DRV2604 mode, waveform
library and enable-GPIO mappings, instantiate the TS3A227E headset
detector, and add lookup entries for the codec GPIOs which control the
second speaker amplifier and headphone path.

Changes since v1:

- keep the missing enable-GPIO mapping out of the generic drv260x driver
  and provide it from the Yoga Book board software nodes, as requested by
  Dmitry;
- fix x86-android-tablets GPIO-provider software-node matching by
  attaching the secondary node to the matching gpio_device;
- hold references to the existing DRV2604 devices, reprobe after adding
  their properties, and detach the nodes in reverse order; and
- remove the dependency on the withdrawn optional-vbat Input patch.

The series is based on platform-drivers-x86 for-next at 5b05bb3f6c57.
Strict checkpatch reports no errors, warnings or checks.

Runtime testing used the integrated series on a Lenovo Yoga Book
YB1-X91L. Both DRV2604 devices bound and accepted separate fftest sine
effects, with physical vibration confirmed for each side. The TS3A227E
and both codec GPIO lookups also bound in the validated audio stack;
speaker, microphone and headset routing tests passed.

Maurizio Casciano (4):
  platform/x86: x86-android-tablets: Fix GPIO software node matching
  platform/x86: x86-android-tablets: Describe Yoga Book haptics
  platform/x86: x86-android-tablets: Add Yoga Book TS3A227E
  platform/x86: x86-android-tablets: Add Yoga Book audio GPIOs

 .../platform/x86/x86-android-tablets/core.c   |  21 ++-
 .../platform/x86/x86-android-tablets/lenovo.c | 140 +++++++++++++++++-
 2 files changed, 152 insertions(+), 9 deletions(-)


base-commit: 5b05bb3f6c5716fab6911e12d60dd1f43ad9806a
-- 
2.53.0
