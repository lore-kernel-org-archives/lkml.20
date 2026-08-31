Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5584B26FB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191674; cv=none; b=hPwo+fk25weAph8hkLCPGfTFqNvyBfm+4+dWfR9qRDBo9sTBZjilQyyoMotVQ1kedD68wMBklS4qmPpdyRWAsaZ2gfOm/RHZBt1E4eUNT5eQkoUloLUE6ZGxwTmxEwYOjyeFNfwaJMUE/UDEJphYjqUyP9e7CtjZWvKIqV2DwQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191674; c=relaxed/simple;
	bh=1ACBKGWFnRzB7mIrkry+VhzfZ/1U7/wkPLi5NxEehLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=acNXupG1OELevg+1R8/2WZ0Kopvu0JCVKZw57uZAXnQ637T2wSG+zEKqgefn/+voXW3oVKXBMsfjJgwP4qgwqHM6tK6Wbd5hKWjv79yLhbnfEhtRD740Gyq/S5XCT7nia8Dp+1m7vBISowRguwA/dRrf2cNy9igP1p/+psFumwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ga+tp5to; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ga+tp5to"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482fc2b44a7so3117546f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788191671; x=1788796471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASvcEdxyqVgpQZwCMt7dzVrotri8xOjcCj35/ZBDavE=;
        b=Ga+tp5totCQONUdcJWX+4wZUuu++eZRBNXqQAexHGP4dAcD8u3NWwv020ifqzIfDBA
         grZRkrbkgOvTemeKgayV1pqJL2eveZbePFtvBcmX6D4bep27NLaFFGdofpXwg6sQss5i
         QR99IwcSVh/J+0NEr9OuJgecz5Vu/snHN7rGD32bLrG2N+s8aluF9ujm1emGVsOjURZd
         IrF0eN8m+WlJYIYlt2y35yeo/e7ISeYGJDO2Ee9DlO91/CNmlWYj9PVFkdegzKjpUOq0
         vKDHi3HJqKmp9e5GaKTdh46pKQj4izMJZR06d+RcQxi4T+8Dpm4JVgj+7voJSgr9h8rg
         NLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191671; x=1788796471;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASvcEdxyqVgpQZwCMt7dzVrotri8xOjcCj35/ZBDavE=;
        b=df3iotjmbHeHvNJ/q+5JBxUOK0amnc92mhQhrhe/sAIw6WzF3V/Hlw9PjkgcjJgUBf
         X07T9poFJQZ4MiWf7oL10cnzApbwyoCDQ8z0U+7uENsZEIbqrwwrzoorydjQfGwirQg9
         F5Cbxh99ZZ1BTOxSnCYS6h1eZS3ill6E41r5Be3ozHHTEShonAz0fehQb1fumXNEBy32
         jfprtaBWw3XgpbSaQI0cvst7hl5IkDXOpH2EH/ueq3zJM2wI3JgLyxrqEMFDDzpRBPzG
         9Ti04E37fA0tqqUJk8aBFT1Ac+VN/VkoFBy9VmbxOohCHPN0Xu4+JhKuQlMl8tpY1Uub
         jEjg==
X-Forwarded-Encrypted: i=1; AKwUvBwiBR9/FSu+pm/6daVgNJEWPEMOdRhNMwHgTJNZ/oE3ROIziRCUTAKzvl1RdQgGO+euJbdFem+pqAXGivk=@vger.kernel.org
X-Gm-Message-State: AFuF++m1kNnsLu28nhDE5MMatkVnqwyeMdPnK+yAer5Mq4+vOFkb05sS
	LC5+uzYBtoASK3iIbqjmXWd96kw+bFIspsMqWLxxA436NHsmOGQ96ugk
X-Gm-Gg: AYBFou110Zna+6Tl5VjgReQheG7+IySu1gKKp4VOsaZbXjurvr63La655FpJWeGTfPc
	JcfJ86kJYclLi4GPizycxxdRkm0zw8ofX6nfsTRoxITXcKL/3yP3UHI4+EqLibxW+Lry7cpiTC3
	USYvYyaXfSvW1IuxfoRJqw/Sh2gUs6gu4bDE4ScqeJAk1DrCVAvxJoTd9reRRCQdsP0MjjiGjFm
	2ldDviJ+CXtJZooUWmSxgCwPkQzAOHcTfe7gEG6oinT2lwX73ZR5SDfiuYjN817Tc+kphztCq9L
	2FwaEsAxmYObazDwt9JEvOyWOmmd2feQ6nr6myTTyTbIWsJHOEpG7zODGhqEpqqvSei47amWE9t
	4Vyj88MPgw55W3ksCr1fSZyIzhqyMMRFTFtAdAHCgCnvbu15tmxwGuxCyBEIEp8SaVlZasyDMq2
	aHiJXiKfD9LgghIZs5EvrgjMI2pKpgZ9H6EFzT12H7oJNKjx4YIwpmNruHgwvd5aNcMRHJVCBYJ
	MsR+zJJEFG681TGRtfz4BMx
X-Received: by 2002:a05:6000:18a1:b0:482:bf78:300a with SMTP id ffacd0b85a97d-482f79c78abmr47604037f8f.17.1788191671171;
        Mon, 31 Aug 2026 08:54:31 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436e2af3asm12949099f8f.12.2026.08.31.08.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:54:29 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v1 3/5] docs: power: fix power_supply_class.rst status, health and time_to
Date: Mon, 31 Aug 2026 12:53:37 -0300
Message-ID: <20260831155339.181487-4-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831155339.181487-1-ivanrwcm25@gmail.com>
References: <20260831155339.181487-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Correct STATUS/HEALTH references to POWER_SUPPLY_* enums in
include/linux/power_supply.h instead of the nonexistent battery.h
macros. Document TIME_TO_{EMPTY,FULL}_{NOW,AVG}, fix the "operatable"
typo, and note that MODEL_NAME and MANUFACTURER already exist.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 Documentation/power/power_supply_class.rst | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/power/power_supply_class.rst b/Documentation/power/power_supply_class.rst
index 6d11f8c594a0..c60aa7ce717b 100644
--- a/Documentation/power/power_supply_class.rst
+++ b/Documentation/power/power_supply_class.rst
@@ -82,7 +82,8 @@ _NOW
 STATUS
   this attribute represents operating status (charging, full,
   discharging (i.e., powering a load), etc.). This corresponds to
-  `BATTERY_STATUS_*` values, as defined in battery.h.
+  `POWER_SUPPLY_STATUS_*` values, as defined in
+  include/linux/power_supply.h.
 
 CHARGE_TYPE
   batteries can typically charge at different rates.
@@ -95,8 +96,8 @@ AUTHENTIC
   to the platform is authentic(1) or non-authentic(0).
 
 HEALTH
-  represents health of the battery. Values corresponds to
-  POWER_SUPPLY_HEALTH_*, defined in battery.h.
+  represents health of the battery. Values correspond to
+  POWER_SUPPLY_HEALTH_*, defined in include/linux/power_supply.h.
 
 VOLTAGE_OCV
   open circuit voltage of the battery.
@@ -202,16 +203,17 @@ TEMP_AMBIENT_ALERT_MIN
 TEMP_AMBIENT_ALERT_MAX
   maximum ambient temperature alert.
 TEMP_MIN
-  minimum operatable temperature
+  minimum operable temperature
 TEMP_MAX
-  maximum operatable temperature
+  maximum operable temperature
 
-TIME_TO_EMPTY
+TIME_TO_EMPTY_NOW, TIME_TO_EMPTY_AVG
   seconds left for battery to be considered empty
-  (i.e., while battery powers a load)
-TIME_TO_FULL
+  (i.e., while battery powers a load). *_NOW is a
+  momentary reading; *_AVG is averaged over a fixed period.
+TIME_TO_FULL_NOW, TIME_TO_FULL_AVG
   seconds left for battery to be considered full
-  (i.e., while battery is charging)
+  (i.e., while battery is charging). Same now/avg distinction.
 
 
 Battery <-> external power supply interaction
@@ -251,10 +253,8 @@ A:
    to add it and send a patch along with your driver.
 
    The attributes available currently are the ones currently provided by the
-   drivers written.
-
-   Good candidates to add in future: model/part#, cycle_time, manufacturer,
-   etc.
+   drivers written. MODEL_NAME and MANUFACTURER are already part of the
+   standard attribute set.
 
 
 Q:
-- 
2.43.0

