Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A1835E936
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789797658; cv=none; b=EyexMhUQNTd5TIzhHLw2w+sSYTLOzrna2wiUjD4pe0eATIOsVbrTbPBH9Qm2caJgCEYewtkzV7cdxZ9iyqyB6+d7Dl9tEB4zKFdiq1D9hATbpCpjXYeqQWnXKEsL+X01/rFLic6dZkQ296QQuHcYmL7yT/onUtjzSySdYsyOar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789797658; c=relaxed/simple;
	bh=Jy5TaLrwRqkwt1UO+ssRNusHMelPmB+dJLFY0YgEd2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u2lxTcKxTyZwv+syGr/vFQyhkFjQMW0Ige2gdgQmr3+eYBJErUq3mWX/a6Nuv/8S+sfHL4C33bUwrKE+A3hCD+erkzr9aIqES4f8oYgRq5Rh3U3K7XpqqLAOVaWKfbjBdY9SAq7uCMiRBML4ZrEmzYoj8DeclLCJQFgWKnGTWao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1xGSEwq; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1xGSEwq"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so971680f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789797655; x=1790402455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pMviqo4XEkPwNRzdFDIqATmDkxn/o8ifOVjJBWoYCzQ=;
        b=R1xGSEwq2VEZ8A9e+m6LrHHkVkkR0ZsdGuZZ/jOQNKibDBXBKT1rKQhXfBJuTgHp3R
         IyWmj9+fsRzTaoMjeLY1Sfpjjsz7hztfvgGPjHiIBvPD9IuMRiiZchgWz6xp/vEspDZN
         B/+JGvJYBPiFsxhVqPNZLJwRHHVAe1ZiItrRGCQIBPC/bPOZm8/ctaSYrtKa0COk9fPQ
         3lJN7i6KFuDnmQYWhWXiRGwxcBgg48Suh2kLK6t5PZZVi1qrRptQXNueRJ1KyHFGTScJ
         Bt7Klo5Jq8Bnf/mATPeGQzutF6OIuWox/oI8YWzKyylKtYUHnKwyiCyCgHPd5O41txyL
         MZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789797655; x=1790402455;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMviqo4XEkPwNRzdFDIqATmDkxn/o8ifOVjJBWoYCzQ=;
        b=PDijIa9T5oU0EuH7t3vCIgU1Djru+Id6U3ccxMFITKcTCEner/8rWPv8xEII6StDjn
         xdX9dt9GTuxSyi+ql5lUbkcdwtWOGiJFgC19PD7TL8Cr2f+aR3rKKRfCXVEWUfhw4Gwr
         RBmXDrEDrE3z5TEpb50Gu7X+kqDkObqzHzzENxnim+nMFMvbgbApZmA7jGNb5vfJzh/s
         4SRPvr8M/8ij1R+Nc3rS/N/zS+UWDEEC2m5v6LfRICZHG308fLbUxsCo0lVn9DKcnjXO
         Ah8sDrZ01JzyGx6azAf9xWKXVEMwHA+qLw1rZ24OQo+QpJLJfsYZy8wIC88DIjypuNkq
         yfYw==
X-Forwarded-Encrypted: i=1; AKwUvBwbpvoAkd72yqc4vOb5QdWgsvfjhWZZDfQElWOU84HWlcjMGBlkRVyUQOOOPSKRonIt3dxPN4dt+0qmV5I=@vger.kernel.org
X-Gm-Message-State: AFuF++lUEefP28I0/BnMBues2FLwVCyprQS12pGJ1T/ubI4S89iqxRXP
	DpDFsZZX0kGnXmg6VHOG61qKFAqBKT7Q85anHt4+fJTFF1wiYRqh1rbDD091Z1C7yS2nsA==
X-Gm-Gg: AYBFou1EilI8eoiHoxdlSeYiClLUz9zgIOGnF7onm23FmPLYq41xwrwWY9HkKiJVhhE
	MMDSvpINq2Mu0I4RKtshobSi101UEGTD6jJ269cVPSObUAPpkcMMuEnZlQbXh4pHgWb0rk6gXQV
	bcayWfRfdijTf1OSKa6+lQX9z4id3AGB7bNgycrjJxXpR5G7wwlBzdk4ZUGvDCEoXWb7+RyM1U6
	64vTgTmgGy497D2eqW3lqRPfsAR6hKWsRAPsZA7S30t8BRGjZJPtz607YhgGA+O5VLnGspjSbo8
	lpBV0TWzzu3QreKq1cQ76sVsftDEoL1lqFGhyu0+dRcIbVkfs4jhxHJh2X90tgSKbEJNkU3d4X7
	358wvh5pMdZ4NzMZBA2e6m0D8k0eyKw7/6rz0zH7iDZnbZebrvImWXbirkFp3OZpEyCrkArO0Ko
	gygn7L0nXwdOEy392IRkeVa0HWN3kTLnSBsEQlxRXo+HqDeQKNRtndQZvbhSmbV2ngmIxiIrUVD
	qyJv3d6TmZSaaugFoM81gPUhaOKNbVHw3EChFrSng0snisbW6Y=
X-Received: by 2002:a05:6000:2010:b0:487:27f9:82b with SMTP id ffacd0b85a97d-48727f90b71mr525893f8f.32.1789797655106;
        Fri, 18 Sep 2026 23:00:55 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872456301dsm4891022f8f.18.2026.09.18.23.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:00:54 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	Josh Snyder <josh@code406.com>
Subject: [PATCH v4] platform/x86: hp-bioscfg: fix 16-byte heap overflow for empty auth token
Date: Sat, 19 Sep 2026 11:00:37 +0500
Message-ID: <20260919060037.84602-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9d60ef62-a53c-bb13-ff6a-0a195cf2f6f3@linux.intel.com>
References: <9d60ef62-a53c-bb13-ff6a-0a195cf2f6f3@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hp_calculate_security_buffer() special-cases an empty authentication
string and returns a fixed 4 bytes (sizeof(u16) * 2). But
hp_populate_security_buffer() does not special-case that same input:
for any authentication string that does not start with BEAM_PREFIX,
including the empty string, it always builds "UTF_PREFIX +
authentication" and converts the result to UTF-16, writing a 2-byte
length header plus 2 bytes per character of "<utf-16/>" (9 characters),
20 bytes total, regardless of how long "authentication" itself is.

The caller, hp_set_attribute(), sizes its kmalloc() buffer using
hp_calculate_security_buffer()'s return value, so for an empty
authentication token it allocates 4 bytes for the security area but
hp_populate_security_buffer() then writes 20 bytes into it, causing a
16-byte heap buffer overflow.

The authentication token used here is the current admin/setup
password, which is an empty string by default until one is
configured. Any write to a writable BIOS attribute while no admin
password has been set reaches this path.

Fix by removing the special-case early return for an empty string in
hp_calculate_security_buffer(). The generic calculation that follows
already accounts for the UTF_PREFIX correctly, which naturally yields
the same 20 bytes that hp_populate_security_buffer() writes for an empty
string, avoiding duplicate logic for special cases.

Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
Reported-by: Josh Snyder <josh@code406.com>
Closes: https://lore.kernel.org/platform-driver-x86/20260402-hp-bioscfg-overflow-v1-1-6985f8c9e67c@code406.com/
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v4:
  - Straight re-generation against current mainline: v3 was written
    against a tree state that had a duplicate "authlen = strlen(...)"
    assignment (one copy meant to be removed, one meant to survive),
    which current mainline does not have. That mismatch is why Ilpo
    needed "special trickery" to apply v3, and why the manually-applied
    result ended up with no authlen assignment at all (reported by
    kernel test robot). The v3 diff itself was fine, as Ilpo confirmed
    ("authlen is not uninitialized, so only the early return should be
    dropped"); this is that same one change, regenerated from scratch
    against the actual current tree so it applies cleanly without manual
    intervention.

Changes in v3:
  - Remove the special-case return entirely instead of adjusting its
    formula, avoiding code duplication as suggested by Ilpo Järvinen.
  - Credit Josh Snyder who previously noted this approach.

Changes in v2:
  - None for this patch; resubmitted as part of the v2 series.

Link: https://lore.kernel.org/r/20260803143037.93105-1-meatuni001@gmail.com [v1]
Link: https://lore.kernel.org/r/20260812111829.172273-1-meatuni001@gmail.com [v2]
Link: https://lore.kernel.org/r/20260818191120.38556-2-meatuni001@gmail.com [v3]
---
 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index 4d94e48..abf8ce2 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -47,9 +47,6 @@ size_t hp_calculate_security_buffer(const char *authentication)
 		return sizeof(u16) * 2;
 
 	authlen = strlen(authentication);
-	if (!authlen)
-		return sizeof(u16) * 2;
-
 	size = sizeof(u16) + authlen * sizeof(u16);
 	if (!strstarts(authentication, BEAM_PREFIX))
 		size += strlen(UTF_PREFIX) * sizeof(u16);
-- 
2.43.0

