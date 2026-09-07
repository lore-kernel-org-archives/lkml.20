Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A63B50C282
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799848; cv=none; b=q0hlFYlQEtROSvk+gPR2GnJK5fR7M+ZSYcP/UnyIXoF/xnzzI9vEEXnl93E/sjBwXboLkFo0GNwMuOsKv2vm4hokjsfXKHKKmUiekyhKkwbB0WucW463epST3w6IDWzZnwJJNKIL9N26B3dIsWSnK14l/9ArE0+TigDAPsjN1Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799848; c=relaxed/simple;
	bh=MKgoXYTXSjlrtYrBtVpRepPWqUSRXg6w982y1Pay3bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jMg/3so5mYuPqM8XJE2pGltW6m7PjAc7qEfU7q3ZomF2kpzGcENotEppLbJled7pat7FXvTkuQyvXkokedkL6xB6OGqNbqm8A47S/qOGdzuJCRwhplrxyXugJFAVcc7+KT7DOzD/x+58ETw1xjZObaTGJCQAqJSITp65EV3gPNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZnCAQPe; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZnCAQPe"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2972871a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788799846; x=1789404646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mJA+EFreX2+ndoSjltuac97HgB0U6+rcf3y9yIV00LQ=;
        b=gZnCAQPeiUYSFHFvjs8skhyim7vGzXH7RCg81FDIxyY5FuHilgjcBaYIYbRaZBiRwc
         C7xBulPYySP7pLi/MEK0rY3XHEmtX0x+/7GPBVepqwFWzKAX2j0aShKfxrl1R8ZduTf+
         q1njhB85xzciBgoB6FTMy1VBDVsiacPR1aREMN/IiCV4GlAQVtpYux07CtDXJAlaQlL9
         1tSCO9K6gnd3uCAhjlk8q9g59Fs++FXf8rj68XA73c354L7SXYqOlVvF59b9J9j+EmJi
         T1xkXlLmZV0iKIIQPDgGTPoSedN3y5hxaYpRbI7qPVxDj2xQBz7VyqJwAmiLH7lHP82A
         NkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788799846; x=1789404646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mJA+EFreX2+ndoSjltuac97HgB0U6+rcf3y9yIV00LQ=;
        b=cEQZ0MrEXGaMKC/pZchP8SDEn8y91E0NJ6LPGpd1H5tSb3Upzft9WZzuTnS6Dsu/ml
         V4q1pboR1dQkKcg1bRheUGMW+af1L1m/tg/gVX1Q25u3faxMFMbvFbrTbHVD0ZBbatWI
         Sh+U7BU/OViAIv/i5pnat0b5y6gmVmoRcUw1fZX+CMfuJ6s07ggr3bwbIJtPoKqGNPmf
         KPy1x5izSkWTegqkKOetxDywsPArDvcXpGzzqipK6QcCqQiXrYBNQ6BFsLys+Y+hzpMn
         zVwHrL+Sx7btL5pdbdrjedzz1gzUj9X4oTn4uTLA3KMgvijHPR7OoIZdcJdWH2J+SHXK
         lGDA==
X-Forwarded-Encrypted: i=1; AKwUvBy/+ia7Of5IGGtB/I/0P8sdexaNcTXRwlmddjUcYfAO9T9KbfqVGVG/roxk/a8hi4ja8IPQbIEVBKvla9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lXvhIA3K61ZOAqAU7KX6iUJ3UmepU/mmP/jZHMAdpf2CAl5Ml3
	AaN4DkFXDanzZCkHQmbT06UBUa7lmu+Fiia8ST5KEDmutRG6htdCOJ2N
X-Gm-Gg: AYBFou1Ez4F4wFISDABfYmKbnDvTK3QhQt8oNNH2DxSP9nNHYWW3pwAzhw32X0llAcx
	nhcfgwVgC7GpuvmpVC92HuBzRQ699L+iDK5CgEzFJGTm+mwKcZhDUwUagqxxHK4g36m0HBQHoZn
	7TXczTthPDAWaafmt4eMGhzL5X2OX3ubOzRl4n4UEkfa+PRL7vKqXw2Lc5wGIOUSyX2Yw9ljPg1
	GcwGe3bcpJxFyetaBxFIdmGcuUTlCWuPuPKN0S2tRmY3B17Ct+tV6g/i2/eXyEuZRnzaRjN35bA
	NZ8BNh29iyybuHYrXtAbzhxKPOufbUlahT8dkYJCbueNi4+6BO6yHouarDxo1Oyakky6yUT9+1b
	RljyMGHCGWZbViTtFWdL8b5iT3lBLynSOJZobTvnNCObDEU/3clCIB5TWtrZgFGGCPnGWoT3Rqa
	QisrxyoGG35k27YgW8LmDZvmNjQbeBigWmO7OroEZh+O+SsA1Eebik6XodSFypC0z5
X-Received: by 2002:a17:90b:4d06:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39b2614df74mr34283307a91.1.1788799846338;
        Mon, 07 Sep 2026 09:50:46 -0700 (PDT)
Received: from G15-5520 ([103.246.195.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm808934eec.14.2026.09.07.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:50:46 -0700 (PDT)
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
Subject: [PATCH v2] staging: media: atomisp: Use C99 initializers for ACPI IDs
Date: Mon,  7 Sep 2026 16:50:33 +0000
Message-ID: <20260907165033.8460-1-lalitshankarch@gmail.com>
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
index f9cc5f45fe00..5e4bdbc4a127 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -857,8 +857,8 @@ static int gc2235_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id gc2235_acpi_match[] = {
-	{ "INT33F8" },
-	{},
+	{ .id = "INT33F8" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, gc2235_acpi_match);
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..2d95ad91db69 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -995,8 +995,8 @@ static int ov2722_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id ov2722_acpi_match[] = {
-	{ "INT33FB" },
-	{},
+	{ .id = "INT33FB" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2722_acpi_match);
 
-- 
2.53.0

