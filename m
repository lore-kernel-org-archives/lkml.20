Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359274E3769
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186725; cv=none; b=KSThNpJxtWF8MjvEnwEqYo4NtuCW0jCGoXcCFQd/mEnr8r66Uxz/f08CTBsOVQQznLP2RBmQ7uDbtKM33e78WnQ7HmW9yEfgMymr+p0lm6pmRJEtOpkOFc9vcMRaI0FxCX9lRDTJx7rESWCMZwHtCINegvgrG3IQ7j3I8f5Mwk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186725; c=relaxed/simple;
	bh=TUnjuVNTMvAhZF9FTkevSiPKsEs2vsMID2000or5ufo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uz97Z53//lUWvShwahhizMWav7FFskevMDMVb4bncFJEBlTK/6186VKUk913mAQGdwRPoAIIvFUcaxF4MPFTgEyxFtvHy3CDFwCQIfa65ERKxlT2SNa3cwJVeTVOb7vvxlFR3EdbHkLUIPJiUETwixBoim8ab745LCEHpNNG100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmC4Jg8E; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmC4Jg8E"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b965570d7so33299345e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186722; x=1788791522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7NP691EgnqrqnLjGXgIUg/rmeTCElLgq1DAscm0V6r4=;
        b=bmC4Jg8E24KHYj+K81/0TOVmD+M2DUPuGBHHXe43jS7cY+PYDXy35v3rD9CnSSVoYF
         2WS9lCirne6mvYn/V6HENHNnSXpKYH/hR7Ff9CBGk4U3eCKCfCThEo2w94xfuiVYpyJi
         ARgSIY78QdONohckLCrzyFy2FUsuyAoS9XJhfxGrrOKZIedu+Om0fKcXqAkTsIo4jnzr
         2Y+Ll/w2P3g2Eo9p0kt6vWiCfgNKG+NBtuww+e1SNjW87eAoho4N3g9gUvWAsqaMprQf
         MggcG/xvXtu8eGJLAAXwaMejs+QbPHtIHk4iNttVdBPQg8cvFH0KpNFACAEJ/0orPj5E
         jSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186722; x=1788791522;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NP691EgnqrqnLjGXgIUg/rmeTCElLgq1DAscm0V6r4=;
        b=Uc/+eKoI36c78pv7FafTVHi0AJI+80h/SeQjIpaKlmOdB+ajjYecdlkZWHoEBRZDAq
         q5NW8YxOiWwk3Qc3VjjlymZ88PdKVZGTNIPbJdgIbrohfhBuIrQxfjPmadskIKVhuOR3
         IJl3ElNwgkhYMSMXw8wPQKTHON+PhQyCjE8965wBp/MM9vnsTFrZ7I6PDIi6vO6Oj32E
         SzmoVtQLqo3+oZWUcLRCaYPCyXDsLtVx9SBrW6bdDhhUhnkTuXr+B5v8Hyg/impGPxwn
         w98ThHDIlkRS3CMKgmxvzCyZOSzXu5r9/MS8WlGBGaty7Bry+5wCzJjK4EYQSuqGOUwn
         2hVA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2yhCSCDMaOi+cNwilP7jHuZhmxKMHNr/e+UAggXY+DUchCwMDBdxLdQ5fabhMZ4WjsAzIBO1cWLDRyNs=@vger.kernel.org
X-Gm-Message-State: AFuF++nkLSWY3v1NN937DqmxBJahKJJ5EEfkxL3dg3xkBKKHpvCeoX9L
	D7TM70RF3vH2GOh+/9ACcEwj5zbICjSSjUFlcEqAGeguW4LG6lA2Macn
X-Gm-Gg: AR+sD12JrDEiPLNPpoJvjuETIgyu4Y1iWMYeXAw+vWWqpIqqKTTbcMUwozYhJ7apP0N
	gcjPKwaBJFRWE40f7uIrF0IWEvIZYOTzkFekJgEo+6LEmEW71zurkF9OT5jSh3i94H3Ng3vfsyY
	IMxR2eG5zR1C23dGzW409oC5Fc0XxNKlsjjeyaBaRU/uTTcJ/HuMZWCGNDFN2x9u3O1UwqJp9AH
	BJv20T5UK4bh5frSuunIpJGr6dSR2WRhzeQiaY083Hg9eNo8SGaPwPHQiXbLKbDONMtzhX1eWVE
	xmuqESrtN1h3HnAt2w4UaFLtmk7fVXyVxUHQTS9rf6qkvxfXpUGib+zJx+fSA+x7b+DR+WJdl4x
	g9PvdeitlH6XdVQkBPCjpwLj8tbtXkQY6t+Ubu901R/zJ8GJQh3ayNGTDopSHWVsNy/FPP5WaxK
	3dVQtf0hJO2r/PKrt+39hsaKp43bKoYhyQygVlfXVNRokKPgz7ofTysJBlnwtQeo0tvrYRtnpwZ
	mR3axh6zVGrTl9cLNujW33C
X-Received: by 2002:a05:600c:a01:b0:499:cd34:100d with SMTP id 5b1f17b1804b1-49b91c33792mr362331505e9.7.1788186722075;
        Mon, 31 Aug 2026 07:32:02 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm344786125e9.8.2026.08.31.07.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:32:01 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jason Wang <jasowangio@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 2/7] docs: landlock: fix ENOMSG condition in create_ruleset kernel-doc
Date: Mon, 31 Aug 2026 11:31:20 -0300
Message-ID: <20260831143125.151360-3-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831143125.151360-1-ivanrwcm25@gmail.com>
References: <20260831143125.151360-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The kernel-doc stated ENOMSG applies when handled_access_fs is empty,
but landlock_create_ruleset() returns ENOMSG only when handled_access_fs,
handled_access_net, and scoped are all zero.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 security/landlock/syscalls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/landlock/syscalls.c b/security/landlock/syscalls.c
index 1d02d57f4c48..400a2f928de3 100644
--- a/security/landlock/syscalls.c
+++ b/security/landlock/syscalls.c
@@ -204,7 +204,7 @@ const int landlock_abi_version = 11;
  *   scoped;
  * - %E2BIG: @attr or @size inconsistencies;
  * - %EFAULT: @attr or @size inconsistencies;
- * - %ENOMSG: empty &landlock_ruleset_attr.handled_access_fs.
+ * - %ENOMSG: empty handled_access_fs, handled_access_net, and scoped fields.
  *
  * .. kernel-doc:: include/uapi/linux/landlock.h
  *     :identifiers: landlock_create_ruleset_flags
-- 
2.43.0

