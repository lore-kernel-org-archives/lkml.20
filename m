Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238CC36F915
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788602758; cv=none; b=IBk1TTn6YLN6E07FaT8cMglyPiHBXKFcyV71IOs/flVlpvE9vSEKaOK5e/fZ49xpVBM1OgrFS/pjr8qkEY1TrlnFvdY2ar/+HNo44SszBvQDKmeTlm3+65aEF1zc+BBj+oi88F1/MxxxC/NLJn5mHLIGAz/FOI9Mq1CUu8T1AfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788602758; c=relaxed/simple;
	bh=cpP8ANudbdWPOFQJFqMv+O1f4auumUXQKGMA0l7fPo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JJPOiyMKWq0Bd4y/nK9doiNwnXoBOk+//cSFvVUTJF2bTfNiVxOCbnmevGyB5RUCQ/TXnbKxEaNQbQH6Help0GvoGM/MMxfdcved/ynrIBKzKbcJKzEcyFwNoWqzYOWfjgUK2Jd3ED5SDkR/Nr5iV4uinqQ1Tr5ELc+0jVq+p80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnX5gc2w; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnX5gc2w"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a34f7ebcedso16450111fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788602755; x=1789207555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEmycsxdKEgtKycB7F+mNFHTBFbitCM1fHqOBorxUCg=;
        b=RnX5gc2wuiX2d/Z5Sr0FttOIP9ikHXL0wOBoIpa3JHvSHzL2K2Q3q57u5VoJCQSlB1
         YF6ntulkXgJbjYg0VYeTAaxSCag1JkSVNAgsiFW9d+Pch+uq+nbnnfuzQ2PoR4oSUDLv
         F5vp73UUl07Fm6Tkg953YrsUTXDHcNQwS5gxu2P09tEDDi4zZcIy4dBK70/YM0CQ6LFJ
         WkYZfcIBFrZdb3maqr8ta7pxCse7fwkoFui4rCXcnLhRhYR2YLNeCANvYTq8pWrM+b4/
         HISYHqDjfPdOVq98rBCN6utqyXqH/hAbvoR7AYxlZ3XQxMye9Penn4j8V9DbV3mWcIC5
         XilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788602755; x=1789207555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEmycsxdKEgtKycB7F+mNFHTBFbitCM1fHqOBorxUCg=;
        b=fh2bf/H0LWXeVO58Gcny6Oou4JjfYsLi6qxb+FOKHtmRfQ/72T+uxFuQm/C28yq4pN
         rTHsZdxHKzs+7LzTb6NKJPCwsSeoOB2pX/SakLOs1CSqv4gxOkUnfXmB4LZs13Wnzt+X
         TID8fi95KEPEwN0kMrzW9eaTUW0JxKoQxa8S+hL484Oy6ijNqLjjF8x2LGojiMgoMg/J
         rizIzpmVx9hWQG7YgPuF0lK9AZ2i+0qe5ptDYISWEwIIYyP9X7Vz2oafMTKXYd/B8Kp6
         8r0aspc2m7Drz6Y+XsOCX/yRU9eW9BJkuIPa45qDAv6wjCHbcWQyyGJhOpVZ9wxuhm3w
         Uhtw==
X-Forwarded-Encrypted: i=1; AKwUvBwsYJX/ax/wy1xuS6nBoU5x0th+Pt/5EZvyOIIY9+hZIdNWVQg1/DDU2U0Ho2BCnZt+Ygz5usmtNLjgoGg=@vger.kernel.org
X-Gm-Message-State: AFuF++ldIGiKclArBWtX0tJ+y0MPqf01EAkNmm6B/2EhT3hnOc3rk/X0
	yAMCL9FysZvJJr1PGn2YIBzIW1bQ/tq4iOJ3TaZnMHKonaNsca6I5Iww
X-Gm-Gg: AYBFou3L9Tz0k/i2WaTL71+AE6FaBIV4ZZDA6+5/NckF1gFnnN+wiq45XPvvkijFxTr
	/voiYAf4gyCwb3oxQjaMdipHZCU0RhyfIV9hbd5OSqUIN7kkjbGl1RLsKUpd89+H6Y2VP0R94MI
	oHtiLrV349IU9jquNRNvVL/ar5Ttb5c7hEkAm2VrqznVJJNbUv9YIv8oHlrtD0UFZOeJNDBCuTk
	F2P/wl3wP7s9zcvlLq/7VEUdNm2j61oanmn49Dl3fLkoJSTDpaiMVWhtvHD3RSCXq0/3gPgO1Ne
	+2ljpjHjK6t1uj9X28o2JTpgvp5e5z+f42P17W5Zqm6FConoqAJ0BGybZTf4RaWj3bWwUQg3fxE
	XXetwUNARCUxoC+alj3R3Fn9pXbUapgUnoen58Nu5X2Ta1KSiOHqyLIl5/vYmyTqRoamZzzmSTo
	W/ICMVzr2XIig7g3c4kBnqjLbQ4Zw3zCI+jSEevC/9YUfl+bl+uzg9ZBAguaGSW8IEHIVw2OHgE
	gtDMAc1h//2A3wCg3xh6RfTsGdkeQ4blNikAI9XivSsXc/LZ7QQtHpN2SVbkg==
X-Received: by 2002:a05:651c:a206:20b0:3a3:74b7:fc0f with SMTP id 38308e7fff4ca-3a374b827ffmr7443231fa.27.1788602754702;
        Sat, 05 Sep 2026 03:05:54 -0700 (PDT)
Received: from archlinux ([94.180.80.42])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705868a0sm13107741fa.19.2026.09.05.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 03:05:54 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arsenii Pashchenko <ulijg308@gmail.com>
Subject: [PATCH rtw-next v8 0/3] wifi: rtw88: rtw8822c: refactor DAC IQ calibration to s32
Date: Sat,  5 Sep 2026 17:05:45 +0700
Message-ID: <cover.1788601784.git.ulijg308@gmail.com>
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
Changes in v8:
  - Patches 1/3 and 3/3: Collected Acked-by from Ping-Ke Shih.
  - Patch 2/3: Fixed comment block style (made the first line empty).
  
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

 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 161 ++++++------------
 drivers/net/wireless/realtek/rtw88/rtw8822c.h |   3 +
 2 files changed, 55 insertions(+), 109 deletions(-)

-- 
2.55.0

