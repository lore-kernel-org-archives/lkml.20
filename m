Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3456E3B103B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015508; cv=none; b=tSxgtjU3OijaNPG2RQk5P1jHifhyKZYwNkc2G/8GIcGunO7TF4W7aM3nXs8W/sEkAvlsYu3g02akMTb2FVeHCrbe6fc2s8O/euD9XBqV0tZdcdsuSgbEjyZ9o/Fwk1eE9g6/w3pj67UD+Qb8z7jxshJBZViGWL5uXSawYI3wmE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015508; c=relaxed/simple;
	bh=DbAnA95/sQfPUsxRU86NrQeRnVVS8VlPgU3ZU52Ce6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h8c5lu5cDmZCYLBHJMYq6SfxAtTOzouBs9Zr6STM2cjUvilQzoUXtz1JThr24zRSxbZNW5T81SDxussipRTYUSy9dppCy+MQV7k90W1Uhtb2yHMh5pIdK2PqIYPUhit0zzm7fSTVlugDVL6YlIG8rBJ8NWvBNQbyOTua7cQnHRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+ivWM5Y; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+ivWM5Y"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so5126200a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015506; x=1789620306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqSgPddEDVHcqyf/hXdXD85X99gY1uI8qD2zQ4pN/mk=;
        b=N+ivWM5Yz4QmpKd4jhQ8lmnIE7eoeOe9WR7aU1QW/pIhM6Gng7pAhYFZgXPv9JBESd
         /xXpgvbIJtheucpSk4dFDMXdiRZqA8mZ1ntisWEHh2CBmGGaO4vaT/Ecw29ugi4kQ6/r
         rkwsYBMML76sMAYpdrwLrc2rtALWROp5fHfwuxjLZfVEmtfC4U+YHwH/89yhS/3Y3ovQ
         ypioH1qtnBJ/yxsoDfKGufpS29TQBk9IZwHnI83CkRhOMY3QcKt1PSueY6ZKYLm0tqSB
         D3W8JMMiCZlVsRu28VGbOqOSxXo3Nb4FrYX5sD4ZMvvLSEyhudjIJBhjdoKktw5LwXrs
         CvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015506; x=1789620306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqSgPddEDVHcqyf/hXdXD85X99gY1uI8qD2zQ4pN/mk=;
        b=BfO8/F9Q5g81CyjteAbxJGAWc8+t1eqvJsJImB/iuWmvwwHhf7lFhrDlnEAIfi9gql
         9oicmAXyoxtv79Yt5CFXwjpIwId9ofu4JRYMfrqlSnQTVBnxX5sVt6cPADqjjXdfwrXy
         vk8SXGTRhOGwt+Rh3YDfVhOXuo4+PoxL5ccvPDuft0OI35RTCYh7iYWFM0/PQGxyOuLV
         VIsx5MwwZwrdso+W70f6Sdi1lla0mBgNwy6oYjoVxaVjrXZqzmQp4xD/dMOb3eM/9mt9
         2tmGSnFlCqd+rIAiR5UP5+ODhVTFd/C3w6RI8gtv2Eq5x4QUowEc/hURNxg7B0RdXLh6
         Tztw==
X-Forwarded-Encrypted: i=1; AKwUvBzwZZmAGho0YouEaoxeRuBJx73Bul65v2z0HYGrC9APu2bhhLjU5O1RRmcy3tJLsYr0EsO5+hSFHgH1ZYM=@vger.kernel.org
X-Gm-Message-State: AFuF++ncmIOHI6GbXd4rldiSyCTy5kie2xWAbeGMewlRicrk0gRtn8Lc
	EOlc5i2zF3AT4pUjrYwajlsL0EyBxdHGpVCt2wPwHVn5fozcCVmFE/Hi
X-Gm-Gg: AYBFou37uAcqN6Hm6sqRRU2t7mRdtG9oTE9n+u9Nwx3C+/P51Q8rGImeSEXxYET9UVi
	L4kanzb9r01xHOqX0CIyX1ybCizvL9wdrG+9DysdJcFowgVDmpASQxBd7NZJHeqiTgD+y75250b
	MQRBLI22rt363goW4RGmfdL4iBqesTLxsU4HOOJKnqpYfJM7lT8YUMx+/tRUbOuIBPAS/7N0w2F
	NHpHoojr+8cKlFXpf1+7iEWMyF8rYhXPrtHtzzL8PoM9cgmt4Zsi7oK0+rcQhmSRCqAKmYTcRMc
	Qvz/EfKGDmtfYFmvGu4eroTbfkxsIwxQv8JeE9eMxJ6+h4s18E9J25JvX+RUTcYwGjb4Egk3YT6
	h6U9pKru4CWvN34hmlWrg16qcIL3lgK5sJbtGZjHYwXYJ4/TUuI/14ZNgm5eqzc7HMjIpqxkzSH
	Yw3vStS9ALow4IJleokcf3yaX+RFirqMJon+vVFjhw+Ch2/ytxOzqIFLBf0+Z8tKUjQCCNxpRYc
	RmKV5q3S6ffgFacQx0dlpMipg==
X-Received: by 2002:a05:6a21:9103:b0:3d3:ae40:51e6 with SMTP id adf61e73a8af0-3da3a104fefmr61474616637.26.1789015506417;
        Wed, 09 Sep 2026 21:45:06 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58731485c88.5.2026.09.09.21.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:45:06 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	W_Armin@gmx.de,
	eric.piel@tremplin-utc.net,
	kenneth.t.chan@gmail.com,
	jlee@suse.com,
	srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] platform/x86: hp_accel: Fix typo in lis3lv02d_acpi_write() comment
Date: Thu, 10 Sep 2026 10:14:38 +0530
Message-ID: <402a3251fcffa3b080415513b05e65843da69825.1789015364.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789015364.git.hemanth.selam@gmail.com>
References: <cover.1789015364.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "writting" to "writing".  Comment only, no functional change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/hp/hp_accel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp_accel.c b/drivers/platform/x86/hp/hp_accel.c
index 39b73dc473f1..40e1b9fb1b6d 100644
--- a/drivers/platform/x86/hp/hp_accel.c
+++ b/drivers/platform/x86/hp/hp_accel.c
@@ -122,7 +122,7 @@ static int lis3lv02d_acpi_read(struct lis3lv02d *lis3, int reg, u8 *ret)
 static int lis3lv02d_acpi_write(struct lis3lv02d *lis3, int reg, u8 val)
 {
 	struct acpi_device *dev = lis3->bus_priv;
-	unsigned long long ret; /* Not used when writting */
+	unsigned long long ret; /* Not used when writing */
 	union acpi_object in_obj[2];
 	struct acpi_object_list args = { 2, in_obj };
 
-- 
2.48.1

