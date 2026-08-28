Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74113C3C1C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895634; cv=none; b=nC7eogClDJcigTm81RNGsc0ZDeD2wKxPThSfPs3IbkCPQnjGQCxkOFOkVYVRsaM887QIBxBwcS57w1RBPT6/CP7R8/hdyZVNCFuQmMAEUgAFIa79rACQHCoKdeqk9XSzravT/T0ev4twtTAULNg4IaBqzSidc9+UYUHJGqC9gHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895634; c=relaxed/simple;
	bh=dBbjlkA2tsBHvTcCMvacmI4N9SCJyqRzT+DHpOXjsMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RTS34aJUKLmMnA7V2Q9Jir6+n6lhTB1Fm1Pmhk1MoQN1C13LnDDI/SZ5gTG0viPqe0iLaO8CeJi4npq3XJZYPqJkVsqlEdXqeQpXzTqr8UoEGlRl/PFtYpLXdWrYSOPdfVUdv77uiuO2FU7nXJJTpQ3Kca1c7qZ/0lYIxxIoOVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjWTOHUw; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjWTOHUw"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b01910b499so594914e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787895631; x=1788500431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oNQ5o0lvWu2bpZfsZoLZ2i4xs2m18GDSA2KNq9uyagw=;
        b=XjWTOHUwFviNpgOB0vhQDseacVjeO8zgnU1Oo3EmvuR8v104iNEcpvFPwH25sXYcF5
         OUeHM//1tiEgopQMA2kUOVKD7hYSsrbbLz4ReCyfGLdJR1KIfZVtpneHHIUY9dHNKuTz
         J/URtQ/U6rdOYfTYojD6EQ2wvdOlzPdwyvCPWkc4/cBpk0z8IMuBXNjiEhFuPJ7LczMK
         iFie5xWBJv0siO9UcO7cpIZwgSY87GGqU7tdlqkSdDZ7W5t3XHdAMh1X4ZYGyblClLd7
         xMhhTE9JoRB9eEP9MTVxBY/pO9wYCIprQro7jK3qoc439Mc8X5s1n6YsrIQJ8BoyYurj
         uSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895631; x=1788500431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNQ5o0lvWu2bpZfsZoLZ2i4xs2m18GDSA2KNq9uyagw=;
        b=i697m/c4BAyFPEy/9GqoGR6FU+hEfEoSG7NjnUUgtZCX1m7JlUc8iPtEzEJSoYZWbO
         V7ZRvFFyZlcyTp360XJfMsBqHBor7UwhyrgZY3pJidlWQWPc+3+3tIELlafJHLyVJq/7
         g+dwAFKLvexAQMaE6I3V7yXxY4dACeVrws9xPJgRy+wJRXobe8hHvEURXdBq9zGWv1Ps
         vJF9peeIjzlwtgF4n9K8zLHrTGOn3FduanvUT2syXOWzFVvogM9ghWvSB1MnJMKUQ9o9
         Len9m6xomGUue3uOZZloIw+OevrOoU0Jr91DbRHfuG7iI7jTq5biEhlE2I7b+YBNCSnC
         IEGg==
X-Forwarded-Encrypted: i=1; AHgh+RrC+vWcmpZtwS7FDBXs55gKN5Ux4yohjfWsNd5WuXkynMsxGKIlfyQ/bvNy20gweg9vf3udbo0eXvAc4y0=@vger.kernel.org
X-Gm-Message-State: AFuF++lUdh4htWCsjhs3tEtvegxPIrGfDDb1zalHOhhxNa9RpG40jpAo
	8z5Xp3MN+fUlfwef53s1hmrKZFqk6brIq007EQGvyfJEs/oX9q6qJSK1
X-Gm-Gg: AR+sD13ixUgi+BIW1+5GNhHsFENCWXaMXtB2iVbGHYe6dGa+iod/rAFib3wWBD8YLUc
	UezF6nN00dqn3aLPh7MJJWndPei5eGq8fivZU2ArMx5Ty3Z1ZKMsShYibhWFR7SFPJ1rUD84Cr9
	88lXnM1VHYGcAJCXrm11Pm2l+X9sV7vZGo+9A7iza5UbgJlgi6dS2/erKtdGMz+ObmeFqiA7EuX
	M/wdV5rxhmZL8YFr/LqR9vbGh2StrQHjPDXLjzDYYZXvgzeZ5jHJ5F57a3QEdB7jZY28fbS5s/o
	l0kTJPRfC+8f3Q2+qPznZ8vNoMTO8knVPTMb1Mm6yJEGggGfzTaUJRfStpSBaBkYymcYEfzO9GQ
	eUkqF76tOrzzvB8VHDiw51kRiAe9WEnKwwJHjJpqcRocZx47rOSNn5F6I1dL+9GMTUjqfby7i4h
	1nDn1mYdPYK3BXf3q0hZnuH/CGf/lH5ev2Tb9QtX3TTdbV+OHB9kStBOLVfch0PRAm2cM5phQXj
	bjRyZdTp+STOkyRBv5RnBNvLAwVYT42ZLo1g7g2F1GHP6+KtNbdKoIYiIsiiXhtyTzoiec=
X-Received: by 2002:a05:6512:31d0:b0:5b4:ab3a:8305 with SMTP id 2adb3069b0e04-5b5e63db7d3mr849136e87.11.1787895630494;
        Thu, 27 Aug 2026 22:40:30 -0700 (PDT)
Received: from archlinux ([94.180.48.0])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a1a8edsm166172e87.79.2026.08.27.22.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:40:30 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arsenii Pashchenko <ulijg308@gmail.com>
Subject: [PATCH rtw-next v7 0/3] wifi: rtw88: rtw8822c: refactor DAC IQ calibration to s32
Date: Fri, 28 Aug 2026 12:40:20 +0700
Message-ID: <cover.1787895379.git.ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors the Digital-to-Analog Converter (DAC) IQ
calibration routines in the rtw8822c driver, eliminating legacy
unsigned workarounds in favor of native signed math.

The original code heavily relies on unsigned 32-bit math mapped over
a 10-bit circular hardware register scale centered around 0x200. This
introduces complex nested boundary checks, custom bubble sort rules,
and custom min/max tracking helpers.

By migrating the temporary stack arrays and signatures to signed s32
and utilizing the kernel's FIELD_GET_SIGNED() API, the coordination
system is linearized. This allows the removal of internal custom
helpers, collapses unsigned wrap-around logic into standard linear
operations, and enables the drop-in integration of the kernel's
native heapsort library.

The series is broken down as follows:
Patch 1: Introduces GENMASK constants for register fields and replaces
         manual bit shifts with standard FIELD_GET() macros.
Patch 2: Converts stack buffers and function signatures to signed s32,
         switches sampling to FIELD_GET_SIGNED(), and straightens out
         the validation windows and hardware offset mapping.
Patch 3: Replaces custom bubble sort logic and unused helpers with a direct
         call to the kernel's native sort() library using a safe,
         overflow-proof relational comparator.

AI Disclosure:
An AI assistant was used for source code analysis and conceptual
consultation regarding the signed math transformation. All code
modifications, final implementations, and refactoring steps were
written, reviewed, and verified manually by the author.

Testing:
- Note: The author does not possess the actual rtw8822c hardware. Actual
  throughput and runtime performance verification is left to the vendor
  or community testers.
- Every patch in the series was verified with scripts/checkpatch.pl
  and yielded 0 errors and 0 warnings.
- Each patch was sequentially built (bisected and compiled) to ensure
  there are no compiler warnings, pointer type mismatches, or broken
  builds at any intermediate step.
---
Changes in v7:
 - Fixed variables declaration order in rtw8822c_dac_iq_offset() to comply
   with the "no declarations in the middle" kernel style rule (moved 'avg'
   and 'i' to the top of the function).
 - Fixed a typo in patch 2 commit message: changed FIELD_GET() to
   FIELD_GET_SIGNED() to match the actual code implementation.
 - Simplified the signed average hardware mapping in rtw8822c_dac_iq_offset()
   by replacing the complex ternary operator arithmetic with a clean, standard 
   bitwise AND mask via GENMASK(9, 0) and added an explanatory comment block.

Changes in v6:
 - Noted lack of physical hardware for throughput testing in the cover letter.
 - Fixed a typo in the subject prefix of patch 2 ("fi:" -> "wifi:").
 - Optimized the min/max search loop in rtw8822c_dac_cal_iq_search() by
   starting from index 1 since index 0 is used for initialization.
 - Reverted an accidental change that broke the compilation.

Changes in v5:
 - Fixed a typo in the subject prefix of patch 2 ("fi:" -> "wifi:").
 
Changes in v4:
 - Flattened the series from 4 to 3 patches to avoid intermediate broken
   states where sign-extended variables interacted with unsigned check
   logic, ensuring 100% clean bisectability.
 - Leveraged FIELD_GET_SIGNED() for modern, native handling of 10-bit
   signed hardware entries as suggested during review.
 - Shifted definition of register field masks from the .c file into the
   shared rtw8822c.h header file according to subsystem design patterns.
 - Stripped out custom rtw8822c_dac_iq_sort() wrapper, invoking the
   kernel sort() library directly inside the main calibration search loop.

Changes in v3:
 - Corrected the subject prefix target tree from wireless-next to rtw-next 
   as requested by the maintainer.
   
Changes in v2:
 - Fixed missing target tree name in the subject prefix (switched to wireless-next).

Arsenii Pashchenko (3):
  wifi: rtw88: rtw8822c: Use bitfield macros for DAC IQ sampling
  wifi: rtw88: rtw8822c: Convert DAC IQ calibration path to signed math
  wifi: rtw88: rtw8822c: Replace custom DAC IQ sorting with kernel sort

 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 160 ++++++------------
 drivers/net/wireless/realtek/rtw88/rtw8822c.h |   3 +
 2 files changed, 54 insertions(+), 109 deletions(-)

-- 
2.55.0

