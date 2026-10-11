Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAB833FE09
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791707165; cv=pass; b=NgPM9oJH1+wxVQfe/MYY7gu/OjHACd6BTJg6UFqgsiQy/0iLk9J+fWzC30/tRyHWPf0Sy9fdLQdcbOCt1a841pqjNB1g9EsbCSBMZRVC5X9308V5LYyUQMLBsYkIXww5K/3QPXEQImE+6GlB/JI3Gno43Fk9tYzBsu7DWuZMfeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791707165; c=relaxed/simple;
	bh=1rOitW8r9N3qxI4COoi0xLJMf8zsLADvSuasEynHaEk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=imovWnHJmnMBGzWqITedD58r+N95LRSbvhiphzKLXcii1c0801/OL6WtRoixgZxr8Jo0Vq/2OtwHQ7JEUB4/c71I+pPVApphvgCj+/C95NtO41uNG+08kxjSO3wT+Tt3PZ7ilb3cN6F8cScS0PBtKWnQU+JvzIphw6Caqd2umPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lites.edu.in; spf=none smtp.mailfrom=lites.edu.in; dkim=pass (2048-bit key) header.d=lites-edu-in.20251104.gappssmtp.com header.i=@lites-edu-in.20251104.gappssmtp.com header.b=PH9D2fFH; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lites.edu.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=lites.edu.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lites-edu-in.20251104.gappssmtp.com header.i=@lites-edu-in.20251104.gappssmtp.com header.b="PH9D2fFH"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c315869241fso149012366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791707162; cv=none;
        d=google.com; s=arc-20260327;
        b=slFBzhbwb7R6j35C98PDjc9hRD8grdg/q4JZFHuaXbcfjY3vEOJua8efli2QVe5iUe
         JWoz4i0d49uYKk0N1m84+a++Y/feS959osL7Du4hJHLNLKKz2EugufDecXvkGIDeiYqu
         Qd8c9cBIQEaRuBkixjCe8cv+n/emO3qpRHum5qZQZDBW77UyyQUlA4NKbENJ+ctp1zNa
         qvbXcVWi5OSvOtKA0zCyPUbgi5duiivecHl5sXN6KiGtta65A19sv5VZa7EIOzo7YhbW
         gr05G3z7CU/GSENkWfHH/B4VhkpUv1sgoKlUgjCmhtGmrxPJ5pZa96USIxyy/NYLu4Y9
         EwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7MxxQsJMy8Dabqsfj/WHHYHGTv06Iy9zxs6jX+9/cu8=;
        fh=gSRBVGKNr8dchkk1XeNsnWS1QMguI9U3yiiesf5mubo=;
        b=kzRc352VTN7/+rVJJ/YvUKMBRnY29/5T6TAIbGpV2XVLCS1uRYDQsnVoGIfzAGEmA9
         FSaT6VPYtIr53pTAQLsreBt6tDaei6EfaT7utq6tVc9VGIjmFmzZpXV2QFdr1fKNfCN6
         iQkefh/xMKmTBAJyp+HtinPvIb7Rwpr9pbCQzbWYp2M8gBBWjHIp6oVkBf6UgIx7nPag
         D90Pa8lv2Ub9FDw9OtvrFLUKfDVwn/hs/8vCvacNNLtqWJFMCUKKZ8ASrsrYDbAyMRsH
         mCp9VaBRsDJ4RCdu8FWdRTmX5+rbeoYj76rVSp2JlhuLPASkA8TaV6+kEeed9nQnNDU9
         acOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lites-edu-in.20251104.gappssmtp.com; s=20251104; t=1791707162; x=1792311962; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7MxxQsJMy8Dabqsfj/WHHYHGTv06Iy9zxs6jX+9/cu8=;
        b=PH9D2fFHYeTCGbm3KK/YjdBvECnQYKwHG2CDcuUknaeg/TFNoyoCLvEZ1YSx70vrQ9
         Oz54St+aE2iR5/mokx4SKDhGID93W7YhTxG74igEGGlcN1Pz0mJM47Ol+CNpylEtUoBc
         lAiewF+0mWH8s9bOY4h7VWvrw0WLwpK4zxZe0wS04ummwoOw1qjZ+1cQlcJSKra8W0Rw
         2bNKmtqJ32LOcL/QQeEVREK2hkpD3vlhx2nNO6V7sSBgTd2UrauUMSnqvzNtufDLmKpg
         lCTy0lRsJjFOkbHPQDQHSjsrg9cMtKQKtcIIL8K5j14VAmwUReT/Ew1nZvr9I8z9EVAS
         S9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791707162; x=1792311962;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7MxxQsJMy8Dabqsfj/WHHYHGTv06Iy9zxs6jX+9/cu8=;
        b=R0Ih4bsFPndwyffC3LNeKxDwVeQoviJQ5f7Xw4hJOSSw2yZTZl0WwtCPGU00Gx6Ezs
         Sz8/4r9VaagpAsI4EJagU23WY0QQYN91ydAfa+LQIjiPH2ubC/C/YTbqvysozssyPI2e
         os0gl6pRjE82lKfhiqgFEkHCImsOS+yN5yk2nfBgxMwiSuZOlYxFNUiiVs2nQI4vCppR
         Qrr3dm5vHZpEiRMh8p4YEmjwdYTMojK58yuitoLUOLlvOMVFmtHZ0mXVWJ7a9Sr+EHk1
         +WFPPfLDZ6ewhjQcYJLoMji3Cs7ZZ0pt2alCUVYbi79cAygBNwHHpDqi2dddebgxsWZH
         IeaA==
X-Forwarded-Encrypted: i=1; AKwUvBzacG5UEx7DTSLoFIH9o3cgnm9wZ9OaBtNLlLJQCrCDBVWQtGOF6RO9j8d21/JVdQX9l3Uj9ppyx9b2zto=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtCIpUCElWTAIaqQqkdddqPcNTbQfV1iY48Jmwqf74faSDzEuA
	nJQ08KZy9W2v7TDCqGGZfzlFIFgAezvec8TV1jTTgudKYi2UEggzE6CCZUsBMEhReHIiqolmtqF
	tM90+DLxMbDx7qR9ELFKn0zWa4zCfxk7juMl7ArPf3w==
X-Gm-Gg: AYBFou05dG9RS9L5DiAxIehV+HrJHjIVVrOq6QhhPBGxkLHwncc/Ik2iDivtkrYP9AE
	X4ZEYQEx45za35Q0Q1YC/JyipQULfmmSJGuN+LHFz4dxguAL/3Trp8wCxvLr8+/uSRAEzC/dK6S
	yfm9AE453RMEYzIP2nIa4OSUSuvUyCGwL2UEK/OQ80UpfifRYometHAMaW5f1QK+uoMhfDwJlEz
	p7KVGBwbtr6brDkCtneRqzGMUv2ObCD1EyaEL10Uz1zBrW2Rl/XnuVzxsNvzpnFMgmlF5enPCtl
	w4lCqtYFZhGMXLScdgAPyL3fvlWG3RnDe855XfKxRvqjf84tBonAjEWe
X-Received: by 2002:a17:907:7fab:b0:c25:2fb9:b897 with SMTP id
 a640c23a62f3a-c31a9d148dfmr641783066b.18.1791707161992; Sun, 11 Oct 2026
 01:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: 961222243021 SHYAM J <961222243021@lites.edu.in>
Date: Sun, 11 Oct 2026 13:56:30 +0530
X-Gm-Features: AclHuK970s9MJxl7cp7_4kN1jg2QKdKFYhGp8fdirhXJ4NJ6iJ0a_KRlYOsniLg
Message-ID: <CABQ+_V+-SX4E92NeZiTCC9Vwhq_MomdsmcY4+xoCnrip3uXN_Q@mail.gmail.com>
Subject: [PATCH 2/2] lib/math: rational: test large semiconvergent final terms
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Trent Piepho <tpiepho@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add cases where doubling the semiconvergent final term would overflow
an unsigned long, including odd and even continued-fraction final terms.
Check the cases immediately below and at the halfway boundary as well,
so selecting a semiconvergent too eagerly is detected.

Use ULONG_MAX so the same cases exercise the native unsigned-long width
on both 32-bit and 64-bit builds. Three of the added cases fail without
the overflow guard.

Assisted-by: LLM
---
 lib/math/tests/rational_kunit.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/math/tests/rational_kunit.c b/lib/math/tests/rational_kunit.c
index 47486a95f..743fb16f8 100644
--- a/lib/math/tests/rational_kunit.c
+++ b/lib/math/tests/rational_kunit.c
@@ -2,6 +2,7 @@

 #include <kunit/test.h>

+#include <linux/limits.h>
 #include <linux/rational.h>

 struct rational_test_param {
@@ -21,6 +22,16 @@ static const struct rational_test_param test_parameters[] = {
        { 1155, 7735,   255, 255,       33, 221,   "Exact answer" },
        { 87, 32,       70, 32,         68, 25,    "Semiconvergent,
numerator limit" },
        { 14533, 4626,  15000, 2400,    7433, 2366, "Semiconvergent,
denominator limit" },
+       { 1, ULONG_MAX, 1, ULONG_MAX - 1, 1, ULONG_MAX - 1,
+         "Semiconvergent term multiplication overflows" },
+       { 1, ULONG_MAX, 1, ULONG_MAX / 2 + 1, 1, ULONG_MAX / 2 + 1,
+         "Odd final term, above half" },
+       { 1, ULONG_MAX, 1, ULONG_MAX / 2, 0, 1,
+         "Odd final term, below half" },
+       { 1, ULONG_MAX - 1, 1, ULONG_MAX / 2 + 1, 1, ULONG_MAX / 2 + 1,
+         "Even final term, above half" },
+       { 1, ULONG_MAX - 1, 1, ULONG_MAX / 2, 0, 1,
+         "Even final term, exactly half" },
 };

 static void get_desc(const struct rational_test_param *param, char *desc)
--
2.51.1
