Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7CC2F8EAA
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792197835; cv=none; b=mK64FWtg8xLwMHJvr/AlSjO5SxNifk0jCEAue3O4g4lFELPX4NKyBSQv+fYCtliSte2pUAGNvEvbDniA4kKRYwqDEdOH60TbXUI+6o1vaGrRej3e6s13+LhPnpgOgIXIJ6vSuFeZzAl0k3aWr4kmkSL6wNjAz9rsy73dwXpZ0PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792197835; c=relaxed/simple;
	bh=9CYyxdKiea9cIJBb4uW5ZaZk1cAxoDLhLp9NcSk3vjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nw/RMZ3XuP+S3vZRs0xIG4m2u73oBU0zDptlr1jAt3Bq/d7aonKhDX7JXAxsRW58z83sX+qE0DllWJcj579XwetIi1luvGXGsFeSmN3wl2qnSeWt5tUuUWB7w77/aViGtF2uZp6bsXLf6nQMv9vsSRZqj+BVr7L6GB36mwHhfhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efUldbpy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efUldbpy"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2dd76b1361dso1902015ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792197833; x=1792802633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JfqAGEi4HNPjbODP9gI1R8fCber+6x+PZxAwNZvslrY=;
        b=efUldbpyHHDdz98Tl8FBa4JrC0ETNJHncd7czCCfub3A+7w2XclBXV1acdmZx7Z7gr
         C5pelk8cE6LHckNfHhdgJZLkb2Fsgdkc9KEUIQ+I1ZaX5GWjr5Ixye1M9kqH19vWlJbF
         aMrC1ra7V90ddoIcstPqRSkssN6smRCd69cyy9ouxoyWBefGV8xJESPeyrmhM68O4+NN
         i23jj/CAhVkGQWK5H2rt80FeRS2kTYKznB4/7I4PfMolSOvXGK2CYOmIgiyCGMilrV/+
         JNk3N4Y4DgY1Q+txRi4hIYThRYyHezxmWMpQS+2jh5yW53RPhIs8VWGbrolNrvsMqfXI
         MDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792197833; x=1792802633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfqAGEi4HNPjbODP9gI1R8fCber+6x+PZxAwNZvslrY=;
        b=AoE/cY0Zrbpg4Du0Q1lOijnhbZXkfIHcTviX84AKE1WBy0Jzm95OjMLk8VeqWLc2N4
         Hdif+SXvzhq7d0LVspa/ZOZyqCSIJSEakRntyDhs2iF9yQoooAORTNmRJLGpELGaZB+E
         bTQHPlbWL+69o5Ta3BMpwkCEEXx8z/XYcbrKcNiULmJK07Isr6/3dApp5IPEMmb5Jp7n
         avOt1UOYBIC7LFCLAXh/nRDjkG7ugPAJgtrVQazCeQCaOME1+mH2IrUuRDhfC+SriF5J
         4yVyKwAZJaNVsDAOBTc4e7U6g4c6XcEY58wILWIhsHxljlVA1+mwxGFH0j8PIIyjtnXq
         l41w==
X-Forwarded-Encrypted: i=1; AKwUvByy31Gp+2FFq4YuZqxY7LmvjiVrDL/dGx45b2/CGhtGDzhOSdn5SDgXg+tsPJpEA9EIkggXzfqu2wtu0sE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIZN6glorJ3weiTtapHjEDD5Vp+Wjn49t6F4PFnimA8xvYkloV
	nwZa2NOVF+52L6QWpz3Y0vKtasQj2bo/WHDOO1wUyxTjRydX13qHcFSY
X-Gm-Gg: AYBFou1L1HpVSMrN2wx6RWjHDncdHiFTnWo1xzE0S+4LtpQqdB1AOTeKZ6icY4gtIQ0
	cPC0wXhRKuA6cfWDrWRHpDRRVnxwAMnAXs887DQOnOOL5hF6pgWk0eMd3DWfWeMd8oh/OJR9ll7
	rb51NvpWVOo725yQGfWgWfbEzJ0PcSwBR3tOVWLOKW2tfWlcnmHdGognjUZAkJOM5zigUORbK3S
	v+GVPELjt7pENKVLWKuQwMrEdA/+09KueKMbCvWoGzYPZFqzrlmq2saXePkDD52eHNVcwvK+N7/
	LPhXPNBMXu2FT7jNgxNwLM3WYrBQtc1l/1iJQVnAmmlYdl4YQmF8juDUAuPxCkqjyC5T0DaAMfF
	0rw0aaJx5tNxLdMHNwPsJepDooigrIriw9isXRNpaiVPCk9FJ3K+q/Q9tlWqrDZ/62MLG5FkWv3
	0re4A5M3HWc7jKGjGksmMo4e3DDWjDHRCnJls8Q9W1Ym3i4BG2u/2RRuVrOef0Ja/BQmGb2aGqN
	WJAhTm9vzpZfmuN2gzuxiGABF23+wkNZdS3Czf0F8reLw8hDexkEwssw+MNGz7HHHNP1EYcs3zl
	shSlwtNlMRtgsbSxncScRtvkWmmpofnLtrPj4RA1Zb0YOC8mkcA/R0bOveo=
X-Received: by 2002:a17:90b:5864:b0:3ac:80dc:f40b with SMTP id 98e67ed59e1d1-3acef15450bmr1236072a91.33.1792197833331;
        Fri, 16 Oct 2026 17:43:53 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947d2706sm11191843a91.16.2026.10.16.17.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:43:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] leds: is31fl32xx: Fix NULL pointer dereference when binding via I2C ID table
Date: Fri, 16 Oct 2026 17:43:51 -0700
Message-ID: <20261017004351.1249547-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the device binds via the I2C ID table (e.g. sysfs new_device, a
software node, or a firmware node without a matching compatible),
device_get_match_data() in is31fl32xx_probe() returns NULL, since only
the OF match table carries the chip definition. is31fl32xx_parse_dt()
then dereferences cdef->output_frequency_setting_reg and
is31fl32xx_parse_child_dt() dereferences cdef->channels, causing a
kernel oops.

Populate .driver_data in is31fl32xx_id with the same chip definitions
as the OF table and use i2c_get_match_data(), which falls back to the
I2C ID table when no firmware match data is available. Every entry
now carries match data, so cdef can no longer be NULL.

Drop the comment above the ID table, as the table is now used for
matching data as well.

Fixes: 2779f4724b2f ("leds: various: use device_get_match_data")
Cc: stable@vger.kernel.org
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use i2c_get_match_data()
 drivers/leds/leds-is31fl32xx.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 285085d27453..5ef4fd649d60 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -574,7 +574,7 @@ static int is31fl32xx_probe(struct i2c_client *client)
 	int count;
 	int ret = 0;
 
-	cdef = device_get_match_data(dev);
+	cdef = i2c_get_match_data(client);
 
 	count = device_get_child_node_count(dev);
 	if (!count)
@@ -611,19 +611,15 @@ static void is31fl32xx_remove(struct i2c_client *client)
 			ERR_PTR(ret));
 }
 
-/*
- * i2c-core (and modalias) requires that id_table be properly filled,
- * even though it is not used for DeviceTree based instantiation.
- */
 static const struct i2c_device_id is31fl32xx_id[] = {
-	{ .name = "is31fl3293" },
-	{ .name = "is31fl3236" },
-	{ .name = "is31fl3236a" },
-	{ .name = "is31fl3235" },
-	{ .name = "is31fl3218" },
-	{ .name = "sn3218" },
-	{ .name = "is31fl3216" },
-	{ .name = "sn3216" },
+	{ "is31fl3293",  (kernel_ulong_t)&is31fl3293_cdef },
+	{ "is31fl3236",  (kernel_ulong_t)&is31fl3236_cdef },
+	{ "is31fl3236a", (kernel_ulong_t)&is31fl3236a_cdef },
+	{ "is31fl3235",  (kernel_ulong_t)&is31fl3235_cdef },
+	{ "is31fl3218",  (kernel_ulong_t)&is31fl3218_cdef },
+	{ "sn3218",      (kernel_ulong_t)&is31fl3218_cdef },
+	{ "is31fl3216",  (kernel_ulong_t)&is31fl3216_cdef },
+	{ "sn3216",      (kernel_ulong_t)&is31fl3216_cdef },
 	{ }
 };
 
-- 
2.56.0

