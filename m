Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E46047DFBD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629634; cv=none; b=SNTfQOqKsTXZItbnqqtqABjJKQE+0eKeRKCX46bYHKuUM6ggMlLJMI5xU7qVN3hatKRYTciPjcV1BDJXu0ZwFX/cmpYN+X08jRBvUG4Ah25A5qEX62EFAcRzZBbj3wBAgivZnvafNDaBSQjyQL+eeqcHs+8ImYqwcLXBYSzibAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629634; c=relaxed/simple;
	bh=Gpg40NJhOK7FiALEjoDD61BtRfKkLJmAAC/7/tjw5k4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdEbu+B88PDu/UF5uoc7V5oLg4Xm81kK/+GJZQQdhjy2u+1qiXGXUF6spFegEjRZKm25M04n62oAhc4uUUevFswv620NYvZp4WxGMbo+O4dHZMqdXCqSt34sn1z4bLfRJLMQg8rBKhinbyappOZR+pEGV3MRZLiaD3YkZ0qyHaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rvEXUDBq; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rvEXUDBq"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93be29bb454so524239285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790629631; x=1791234431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q9Rmo3WqMy3UpRN33V6S5xmA8tMoREA9/x/jJyiwIN8=;
        b=rvEXUDBqiLeyOGGvSw74QTRHzTXAbIgr5ApuTP1eOkIrGroCZIPiv4GZ0KUN4G/c6w
         q98u42O+d4T4+oLh2jJlVghiG4dn3Xwp9PlCwz43P7hpUD1hXKjpqZZtuyx4BG3bJR9e
         +424rZOticc7EbME+PuK+IXuQdgOfQveV/hTqFskwSnhqzYJzpL6TPkRIu8045BPxysF
         xLKE/mqvGNViel5sL7AwxI3a2giRHM5jvEiFRvRwGP0VnyLhizMNjWjKJQZ8YyH0kPjm
         fSs+M0TnMD99IIksN21vF0xBEC2sCpU5WfgnmGnTU+o8ojb1r8vY7tOi00eXZxvnKvWU
         xRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629631; x=1791234431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q9Rmo3WqMy3UpRN33V6S5xmA8tMoREA9/x/jJyiwIN8=;
        b=Gw3JoTXgqpWjg7GMHa4VFXdB+WB+bLOKct2LPT676ARBTPOHSQmAnIYpOSthOMh68W
         JAyPlW88GU6PU339Lyc+o3mP2qLqpuKdVCxatkGS822Jb1lIcl4HYdEI4hXXz2qS/huL
         Rl3km5nDVTEiaUEGUdyiIhemC4ZSMInBZpBF3MRHfr2x6eC7bjVFh0+8XO5sCAsTb0/r
         vMu2aLExleQ91fObiVtKAwxtSgyQ5ZOkOSD7dUL10V5FqsfUerxgff3N+MyOouBesTfT
         WeUNXFljwbK7mfS3sQmv4LDG6on+RkP3pRusi4htBsNomKOrDvtzL4TeicljM3TyZI5G
         mczA==
X-Forwarded-Encrypted: i=1; AKwUvBxsmtWk1c7LhIPuNk9UdOW5O8I8diI0puUPwmhGDJ+Yur7wrMut6IdlaeeEe/oA4L3vyUqCpJ81NV6S6F8=@vger.kernel.org
X-Gm-Message-State: AFuF++kG6JWJpysZn+tefVmFO9gjM0zU/64SA8ajOiI4GSeOZF0N4gA0
	JUB4xr2yo9EtRYX2bYKyR92e1MWjyvWI7AvGfGO++Lw1z6vgpghdKbyj
X-Gm-Gg: AYBFou3GCwLEpwzFmr/HG2Gv9cUJ95ZKDb4sEzCnJwb1em9JWRKTiABmmNseR5s7Xu+
	nRRspgMmihuvdxpWtEJdsmXDYx/ekPKCxUuThX3l9qF1ES1pWD+KMuwSGsb2oTAzATTEXyA+Ody
	axCoBGoheip9a6BGkxTS7fe4kNVDey3c7cUHprKV8bAU7jy5hM4Dq3u2E32fAJNzL/o7UInKcSO
	guVYsyjZ4tPWMKNF4Ihxqaf9el7l5hv0FyrdksYrxXz9Nc/sx6tLf1KVeJbVecJ3eiZbaTh0Ys+
	UQLt+2sv5j8FfTZWJmIcrpbNigzjOy/oOFQPDcr8F5CK8LMnXVDEGFMWdzfLbvhxekpUxHFBUmW
	qKm5pmEbQTzKWoccvJjigL20TKDdz4YfQtvaDJmFYFHm1KI2KBQGYg7+zt7wrdegwK7igd5bWvt
	2rFtL+5h/XfyUjfr4tL2Fe1qbOTbJoFO/KdG8+QGf9m8KgedPAEmOBYCnxC2Yb70xpvPU51/J+F
	W+TW8maWn4f8hwlf9GE0u0V84DMborEmOV/8s0JlLjmawvx20YQWDffcMfpISiLV/srFgsm0U8P
	vxo/Co8=
X-Received: by 2002:a05:620a:4495:b0:936:6c8a:f7aa with SMTP id af79cd13be357-93c43b86612mr2216726685a.4.1790629631346;
        Mon, 28 Sep 2026 14:07:11 -0700 (PDT)
Received: from cachyos-SlimIce.lan (1841343-static.dvnpiaaa.metronetinc.net. [195.252.229.229])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c814342f9sm241348885a.29.2026.09.28.14.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:07:10 -0700 (PDT)
From: Jared Wuerzburger <jwuerz@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Samuel Dionne-Riel <samuel@dionne-riel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] iio: imu: st_lsm6dsx: Use C99 initializers in ACPI match table
Date: Mon, 28 Sep 2026 16:06:47 -0500
Message-ID: <20260928210648.17166-2-jwuerz@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928210648.17166-1-jwuerz@gmail.com>
References: <20260928210648.17166-1-jwuerz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ACPI match table to designated initializers, in line with
the ongoing effort to do so for all ID tables. This also drops the
trailing comma after the last member of each entry, which is only
useful when more members may follow.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Jared Wuerzburger <jwuerz@gmail.com>
---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
index edec898cb1..c4097ce2bf 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
@@ -143,8 +143,8 @@ static const struct of_device_id st_lsm6dsx_i2c_of_match[] = {
 MODULE_DEVICE_TABLE(of, st_lsm6dsx_i2c_of_match);
 
 static const struct acpi_device_id st_lsm6dsx_i2c_acpi_match[] = {
-	{ "SMO8B30", ST_LSM6DS3TRC_ID, },
-	{ "SMOCF00", ST_LSM6DSO_ID, },
+	{ .id = "SMO8B30", .driver_data = ST_LSM6DS3TRC_ID },
+	{ .id = "SMOCF00", .driver_data = ST_LSM6DSO_ID },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, st_lsm6dsx_i2c_acpi_match);
-- 
2.55.0

