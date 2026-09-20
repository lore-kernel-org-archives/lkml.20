Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F533DDB15
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 20:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789935205; cv=none; b=cmYyGciz2kEB7cZjleetxe/qz/McoXjCG92ucr2r3AnxSWMauu/2vTk5kMEGGPJ33YzFLYCv3hbsNqoeE9VKZw/3aDpDOp2y4a6rZF0WpGs5MdzO7UbME12FeB3GTt3A0e5D863ECuvHlIrUgkUjOOCRnNmcu9pC85MzA9KaC8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789935205; c=relaxed/simple;
	bh=v3M9yuVNEHFfAOpxuRij9I+SDG3ysu5E3qudWIva/VI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E3FVCGXqEEbmsTQyF/8WM5ASN0/Q8wiLcE97GTC5/SM/I6pBFm+o0LHrjMG5TgI/Co+rTOVx79FYgZRr/0Oomul7MuKubRoKjes5XhJKoRQSwvDMS50B32PFF1KiUxRWcuTfFkfzVW/ENc9T3ooW5jFr8PnK9QuDgvZs3brkbYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ai5G+USS; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ai5G+USS"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so28177165ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789935204; x=1790540004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAKC5GCwTerAHXbLUCgzMcXJeFahaz+vZdTOklpw0Y0=;
        b=Ai5G+USSO+ZKK909QY+OZvsAak19TqaEsabSxlI7TEEzCgEi8XugTt6ROK1EF3005G
         X+lA/+RpNBVVQve93PEd2urMo5fdLwEsZ9NZTkdN7S+ardHDpRzRm86r1IhzBGEakksg
         DvBFqJ8ep/KSuAkj6lemR0htxq/irNAh4bHWqOvGkRB5xCq5nSjB5ivMvJ2UBxSD1oxL
         yWNierSpYzh5ihLs2E4bDcuZ6IGs+iueYLBY0E7Ms1BzD0TrZZDGkPqJymxs3WITnKEQ
         jbS+pRiRXdzItinUmzJAGbF+cTGKhczgbjsIzIk4pk3GJk3jn0kRlrzwLKjQe8sCcrI9
         AMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789935204; x=1790540004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TAKC5GCwTerAHXbLUCgzMcXJeFahaz+vZdTOklpw0Y0=;
        b=JtUHpTQaFiScB7C8GU/C6iRuK0cx/5vCnWaOSyg9+hAThqGwtDJY+OkcmjryiLqNnh
         NK0I8t3872M2AKIqZvnRVbdoc36q3EONFAulbZbl/sj1mYrEAXXJdmAYinlllfWNN4VQ
         5bfEZyGi6JFMFsmdzKHZQLxV+2g9PBJVM4vcN1MT0AWIjR1MnoRwdELsxHCadQ/4GiW5
         7R8XQj8OmgLvBTaF/kHi1s47sTSbEWuoLH8xEPR3v110g0amOkUKkW0KfBdnbEG3tCD6
         2CCUCE2DYXKSvNu6FVX6u3KoNKWrXCxv71+L+YKcTnN+6khgmIAkSSKCWg07aFraD7u3
         BIVg==
X-Gm-Message-State: AFuF++nyHrhVYOVkngB0bX8wuL8d39gVJZAUETSKK1sl2sAiJVSqLCNo
	hc3MMf/c8uIrAlVHCTU0mzOeIIZLINVcv4Mx8x336nK02pED35GD1S1Z
X-Gm-Gg: AYBFou0AlZPv0n+sgOczTIKaY5BUuPZdbUNn/D8s76IlWV8Qu6xGBqZKCuKJg0OYDi9
	X8POjrk3buh6tApGcsqC1Sm/oCualt7W0yM9OAxvUKqzdAJE9y1wDdOyPxPRtscv7m5gT57vDxY
	3JjW/LIRo6VYCzLpvvSfi+GU2oq0lL6eb1sSZF8FrkYLLLrtyxEAAyBmmtc6ECl9Lw7ZVl7vJda
	WNn2WR4G9WJGLSELhM7fQj3NpmdGZdxlrJFsr0aBzt197iqx18zOPukTQL9MKYW+tIXgGNsa+aq
	vzPk2pXqsmFg7Ch48s/qrqoNwVZWP7D6wUhFlkZmECRVhDMUt+UuqW7Mx6ktcwxhLfrtySlzo1j
	rO4Om2WOmF59qJq9JZYWVqkyld7gp15dHL0WhSA86vCt2AIfaKx99PrtU0946QONLpebLs32jc1
	CYiT+dl6FV4txDsrGzhGaGK48Tp6P657jzxS1R3YZrQnoKjEvQNAIDO+LeQZyz6n834pTuWMJB5
	Zz/eOQ7e8fmHHjRg9X01JcMJ6h7aTVyfW87Cg==
X-Received: by 2002:a17:902:ce84:b0:2d6:e9f3:9305 with SMTP id d9443c01a7336-2ddb1ab3cb1mr143733365ad.5.1789935203814;
        Sun, 20 Sep 2026 13:13:23 -0700 (PDT)
Received: from localhost ([2409:40c4:136:c0b:7911:68d7:f26b:cf67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331b0d6esm11994571eec.27.2026.09.20.13.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 13:13:23 -0700 (PDT)
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: rosencutter@gmail.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Subject: [PATCH] Input: synaptics - Add LEN205b entry to smbus_pnp_ids for ThinkPad T490
Date: Mon, 21 Sep 2026 01:37:30 +0530
Message-ID: <20260920200730.1836756-1-lovekeshsolanki00@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAOGuaRh025eKcBf9P8UrvtXNp68vQ0HVF2EbNMp-kpdaC1HNpA@mail.gmail.com>
References: <CAOGuaRh025eKcBf9P8UrvtXNp68vQ0HVF2EbNMp-kpdaC1HNpA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lenovo ThinkPad T490 has a Synaptics Touchpad that supports SMBus/RMI4
mode, but is not listed in smbus_pnp_ids table.

Add LEN205b to smbus_pnp_ids[] passlist.

Reported-by: John Rosencutter <rosencutter@gmail.com>
Closes: https://lore.kernel.org/all/CAOGuaRh025eKcBf9P8UrvtXNp68vQ0HVF2EbNMp-kpdaC1HNpA@mail.gmail.com/
Signed-off-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 2170bbe4c589..14484164f067 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -192,6 +192,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN2054", /* E480 */
 	"LEN2055", /* E580 */
 	"LEN2058", /* E490 */
+	"LEN205b", /* T490 */
 	"LEN2068", /* T14 Gen 1 */
 	"SYN1221", /* TUXEDO InfinityBook Pro 14 v5 */
 	"SYN3003", /* HP EliteBook 850 G1 */
-- 
2.55.0

