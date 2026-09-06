Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45240175A8A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 00:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788656023; cv=none; b=etfMUBZInmz/cyXGRK6teeC1g55juIQlMfAvEad9A3u11g8OlasCTdF4XXTCbtRA70+s3aSNrqIMUlOAlD8dbKzJzAonzks32FjchdPGzMMJGCv/2EFAMhdk+lpigcNvAf8iZqOmIG5X+5Sh3P17bi8JUgWdavCtYr2vMZld3H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788656023; c=relaxed/simple;
	bh=rBXUUvvkerHNhThNqGS5MYoS9ksLclnjJVKvR2FDQT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vxm72XfKFUHhOxYRY1XZgL3TTbNM6u6ZX4RpUMJD0SaHAvHmL3aVlx2Vms8gpt1adAGZbWuGNKh17zVXN7z46uc+zWdyXBaZlOE90IAMJ9dlPKKun7JdSDRhRRd3EKA95jW2T435w+rotPsKcna1vJIplLr6oZzjnM6Veq0fW8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYsnn8lO; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYsnn8lO"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so2106025a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 17:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788656021; x=1789260821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPwTaXDwrhHArbsCgN4N1e0e3zBlfs7GCg68IUwyQLs=;
        b=MYsnn8lO3HkRC3ZDCIE3r8uQO6S0n4j176zu4D1KwKeC+U3yPsndQzmCoRTMf2ZU7p
         11wDJr6skOtAPv71gLnsnLxEFtVf8ser8R1H6jSqA15JRw7HP7IMN/u/R4NQelR7Y1b7
         1YW73u6fq/X+8p/QCLnpV/Nr46rywlJDT3hVhN5VsSqHpzwvCT1MiHFatGrOnu7caCxX
         WMsU5bio3USbVPEHx26e5o9cGa+JkJOLrGmEkMvq+NWZZAxa1kmO/6YM/DvkHrm76auE
         gIIf92i+LOddFGsXsnmjU+Z+1qOGI3ObywO1pUr2mBJAbhp3SVP0ox0nwt7QJTr4HmKG
         og1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788656021; x=1789260821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPwTaXDwrhHArbsCgN4N1e0e3zBlfs7GCg68IUwyQLs=;
        b=YkSovV/a0Gr8wSkHAfcAGmafLPZAp+I0vLDQC1UMJmh2aNCn7BldhGjIU+AHZEerVG
         Tvy6iH05LL5FhhuAESZ8AFniJuEH06HWSM12deg8psUjt1zHBXuyV0PA1f4+Zs0l54sO
         TLFoHzCnBwMn/MldJj1KpbRK+8k1xArqrRxxUduJXOrcHQHncrO+x07KKqrJ8ovThWXh
         SBuofSxYZxR5UmTc6Z7nuW9UX0+1n8n1M3XlliHGeERGina1cqWQlFHCiPbrCm8xAzqr
         vMJMLTi84r4laEidYLWUcSGzLs2fxLrIdEJOro+GakqNC4ZhFLo+veJjkKKiibDvqU4L
         rhZA==
X-Forwarded-Encrypted: i=1; AKwUvBwFuFi2y5zJK9uo31+kh37XdIgrZzntAFZTClKqHJFCXaMyV36RxXAT1K2v2n37+OLqT50pZOJcQn4V4a4=@vger.kernel.org
X-Gm-Message-State: AFuF++mvajrM+k0T0ei6whDZxZE9PAImPn978lBqUtA8LHQ9RElXA9qN
	6H3/9/mX/eKx9xJ+zDtxaP6FAabCWLW/565wJwBx9j0GeMtjMt7+AQvm/GPRg3uh
X-Gm-Gg: AYBFou1GjUmZwV/mos8vLDORzeBJF4mlP8cKhP7BdTM/C+Tjd3uFcb4zrRl8NT5cPfL
	q3EnsQzrH9jRKWwKKDtGvo4ivVBoAIAhCaPJIr7uT60u/smvfsBaQqfrmP8UGRAfrtGqlG8IPrL
	uBUE0GXADWQNfMgp+BpRvdRlrpk/LRUZE1QKikbvmMgddGiKz8VVBarLtn7o/snpq2jYNfwWZPI
	6IiWlWMH5C5RqIJo4qbUL0apwOVeUrJWMUlXmVLO/v5dMAXZR1f+DNRgyGqtvSFj4LlvQMPweHl
	tk4oxOChWo35xUZbHo8zAzyAzVCUaFS2CySdXRnvNhylFVUV85DZAAM5bop1mFfV64BBbZsUFTY
	h3cg2jujAeciwE7YpIRXSVzckOZDaGkh62MUnK38S9r/SR6TfuNX9PdecfBXApeFIMmR2FWFj7m
	roV78o8eLnJtJGYuHCCM7qr/YkD9Aj5hD0ZCU/EqowuWZohuTNA2cdRE0o2qGQmMgx
X-Received: by 2002:a05:6a21:138c:b0:3d3:afd9:6040 with SMTP id adf61e73a8af0-3da3a1f77f2mr23964308637.27.1788656021393;
        Sat, 05 Sep 2026 17:53:41 -0700 (PDT)
Received: from G15-5520 ([103.246.195.200])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm15261476c88.14.2026.09.05.17.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 17:53:41 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org (open list:STAGING - ATOMISP DRIVER),
	linux-kernel@vger.kernel.org (open list:INTEL MID (Mobile Internet Device) PLATFORM),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] staging: media: atomisp: Use C99 initializers for ACPI IDs
Date: Sun,  6 Sep 2026 00:49:58 +0000
Message-ID: <20260906004958.26041-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers for the ACPI ID tables.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index f9cc5f45fe00..588f2f90a884 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -857,8 +857,8 @@ static int gc2235_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id gc2235_acpi_match[] = {
-	{ "INT33F8" },
-	{},
+	{ .id = "INT33F8" },
+	{ },
 };
 MODULE_DEVICE_TABLE(acpi, gc2235_acpi_match);
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..b02fe0c915ab 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -995,8 +995,8 @@ static int ov2722_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id ov2722_acpi_match[] = {
-	{ "INT33FB" },
-	{},
+	{ .id = "INT33FB" },
+	{ },
 };
 MODULE_DEVICE_TABLE(acpi, ov2722_acpi_match);
 
-- 
2.53.0

