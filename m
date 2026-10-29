Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292021;
	b=tlsjU06hJ0rIHcJLTK1lHZhRiFZsbdkfGLzgdcBSPzWPRlFTnmtIkr36fUvICTnV01II
	 vmNA7O9hMUVkZUJHVckdE9yQIqfdDI1pP6QWHS2nVqL1EgZbogo7VEz0z/lJ6gzNPxSxn
	 +Lkmd2JGbMKBqahw+r7h6D2M7Q4tkBnhqWUyDCZMJrEy9usOe7sLSd8eY15P1cFw+jCnp
	 wgI3GRuTdE/cXDnj1rvhZI20KQrXhMMHL++WV0w9Ua9yoWjaUd3qWuydsUtvgs9frkPVm
	 vUXSy+xQySkYKau4Nsn6yH7E5sjcJW3fGk7x5gJuRfuKU/G691tbOi+s5H3DlJW1ANw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pjDdCQqNHPn33dj87Xo39AE3I9xvG8g94kQz8ZkP6kU=;
	b=QrkpCsumDKGTR5N2PaBrQSwzuPtRekKNOV/kfT/pohPtg12s2VBOojFy0LE3L2rmMw2n
	 q7ABo+eXcQIhj4KeibDuf3hBze4a6pjsl0ByklfmQWfM2YBeiS6o/+XGKsh3uVKo4UVJn
	 r+rLfYrGqRFixNysgmVsxxYxdlXvTGaNPdciV7tNpzhZLmuJXfO2p6f0UUfzqOqAMcB5s
	 GyQnEdlYbx6nfhIsik49zR171q3N92ipmiGtajaMhpXPo9oGg7LJ/SA3GPrlttkfMPw8P
	 CL4hrYELmuoe/dkO66ZX8UfiKf7C2xFpQeHZf8iKiy6OVNUlC6SsbpzClzqFn/k+XoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qe0b3MDi;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9C9606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA9C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qe0b3MDi
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2264508eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793292020; x=1793896820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjDdCQqNHPn33dj87Xo39AE3I9xvG8g94kQz8ZkP6kU=;
        b=Qe0b3MDi/tSizz83JbR5cmk6cK0VVvyeSbaH2mTXFgOLuyafjkPrEFaXaiGRVbe2ZR
         ihVBvA9MJczZfgbdo0UFMxXG639WywfEiGo257QllLLD5M2o09H7zGR1W28QuoVri9t/
         teSQ/fMrLvcHECTOzFbPu5cXvqx/W1XcOYPAb0sJsn+iGxdAhYUvWRnhVaKH++Q6zgaD
         NkhkMAta0I+R342hcFGz/ApHqu63OS6PBLFI+glCfUnuqIDQKkPgYPT0Zlf9sGdngGlV
         HeR0SGvnxONujIBHKzh9tfiuLwOgpdV+GpgabkAAYJX4x5yWFLWtt6XEqxb/6ysxsYeV
         WP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292020; x=1793896820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjDdCQqNHPn33dj87Xo39AE3I9xvG8g94kQz8ZkP6kU=;
        b=IFMk6QmYsrthz/9E/ofP29O0NT8DoakAwfDOLsSby8Vbk+l6rw4Z4KmNdCv/zdJmSs
         FPPSaPRYkI/ANvPiItTz+BMB1mm217Hipr0R5M4i3UbGjw2SkBu7p7+DJ/J6SFRNIc74
         bPv9k9n3IWUdYb6tF1G/fom59XHieg1Nwv/5lg+3YtOnCXd+d/fQHs+7gPvkh/nLyR6W
         IXs2Vroqh22ojzubYXTiGBh/SmV7WXN6MO+N3K4vFpDsgMiK0GEXtkoxLH7/+/h2R1Cl
         1nphmLmnRjl+8b/725RZF6Hv2UMszVJqMsqLzec8HsdK7DTYI9cWOUIH1CdSsQKKrlg0
         OS2g==
X-Forwarded-Encrypted: i=1; AKwUvBzXcXvD0+EsrB++WDmA/YIouVKRsGmALa5ecGrLdspDIawGkV/NUBD16JJFdAN38UXhKg77DT8BpEVjrNA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0tdXYhfwuCPyz5E2FL0r++NuwaLHG/4CLkfAUJFEA1qPC3+sJ
	rEZmOJHjbhF3zY6z5O9J0NLhsjF+Qoyaiu7CPqU2/2wCaqKBL1J05pCkhV7r+Pym
X-Gm-Gg: AYBFou1dbeoXhKOGqvn4Gzr45sBThWTbgoCOIdLg8oWnH0YUt0veyehf8hlcAvo8eSg
	XJi2H0wLzDXsDWDNr8wZNtlsxodrik5YE4vyzpFi2JIkMqLYXWdYVj6R29BkNxw/4aqdLftiOzW
	duIO6q3jpItoNYTophOhelnf3R8aHPA1cBz0xK8pu53yM9Hn5aeghc5KZddf+ntVb3SA0LQBTFc
	DXJwkzAO6joyoHBa0xNUsFKf6ZpzcYLjaItP/ecXDongRb2pWLwuPWvmlUCVuqR/S82b32HLTnx
	vQEp1GdueYgau9CI+GkcRAZVJwmV1FSOL7fcTIn/zo6ox2jr+SpOvnt/XGp19CzDhBkXtRd19B0
	IvF3oVfJtTFXR5eAkn7xwVLK3/vXuR8UiOjekElQtqzR6Pk2+rC0eVj/bmAyUej2Etj7lzETIww
	QPzVI4W7ormtDybrX8eWdtFzOiZpj7YYLmk9B1ZTBzxzCImxyuDXiGPwNwutrVViL/f5xvd899+
	A/pX1q4/4eAcC5WfaEbIf0vkrXqfNJMHNH+HpJd5lfVEWfj97ukHF/ELrOBAxIPSyeXEMboMyWL
	YhsjsHxMml4GUbmDaZcbOhpccB+O5IxchnATc5+GuzkiY34=
X-Received: by 2002:a05:7301:b95:b0:36a:22df:412d with SMTP id 5a478bee46e88-36a22df43e1mr7578245eec.39.1793292019481;
        Thu, 29 Oct 2026 09:40:19 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a410faa87sm264319eec.26.2026.10.29.09.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:40:19 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] hwmon: (lm87) Handle I2C read and write errors
Date: Fri, 30 Oct 2026 01:40:13 +0900
Message-ID: <20261029164016.338450-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <74e00272-306d-4d83-b6f6-10059ad3a91f@roeck-us.net>
References: <74e00272-306d-4d83-b6f6-10059ad3a91f@roeck-us.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LM87 driver does not check I2C transfer results in its sysfs stores,
sensor cache refresh, and device setup. As a result, failed writes can
be reported as successful and failed reads can be used as sensor data.

This series propagates transfer errors to sysfs and probe callers.
Cached settings change only after successful writes; a failed cache
refresh is retried, with alarms already read retained for the retry.

Under ARM64 QEMU/KVM, 46 emulated SMBus scenarios passed for LM87 and
ADM1024. The earlier aout_output regression suite passed all 118 checks.

Baek Kyu, Kim (3):
  hwmon: (lm87) Propagate sysfs write errors
  hwmon: (lm87) Propagate cached sensor read errors
  hwmon: (lm87) Check I2C errors during detection and setup

 drivers/hwmon/lm87.c | 384 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 284 insertions(+), 100 deletions(-)

---
Changes in v2:
  - Address the other unchecked I2C writes and reads noted in the v1
    review, beyond the original aout_output store.
  - Group the changes into sysfs writes, cache refresh, and device
    setup instead of fixing one call site per patch.
  - Preserve alarms if a cache refresh fails after an alarm read.

Link to v1: https://lore.kernel.org/linux-hwmon/20261025150800.49041-1-pocj8ur4in@gmail.com/

-- 
2.55.0
