Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA60E4E9C25
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617933; cv=none; b=n52U0WNc0hfn5Yh7Cy8rr8v28wnITZ5gYYtN4zjCLc3uH3iCll2H6JOZtIlZfYl0XzuBaOd+VtLU1YQ/BSTe6jXcJRRHfMjPXHriRHmUJOR/Doj/tWuc0xftFD+uo7VyqwMHXveJf8Hj2QEh57r5sjZabW8yh9pK3yqL17N6KiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617933; c=relaxed/simple;
	bh=2LSF5HERBAXaWrTaOk/FuMVJr6fFkoRp20uob5n33os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OiMIBroXu6Z+RqxRStuJ+odHOiTn3mxmoIG/R4CjHv/KsI0UyzC6SxBR02Tk+ynscj+H0k9fLhpIlG3WPMrpOGbvcCh/OgdzKPfacILN5rV2nr2Q2v1fVZVKPo82er/PGtjeqGl1+r3S832Y9yPrY4rxSrKkAb7Ni9QLcAUKfbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKydhv7F; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKydhv7F"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-81be5042c51so1553588a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790617929; x=1791222729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=emYdYXWYEvgQlvx3I4XrWNAs9Xp8822ArT+qqs7IdXE=;
        b=MKydhv7F5aAa7ZwHyd/sHkrg5WyI6MDfZGXiNto2VTqxPivu3GpLQSMmNnH1PiajvJ
         fBSDHtqtbzrPpgtt8gRiiGGDJ54894bWtyDHPmEBoy6CnZYxQMyBLWgH/pWRDsBOLC68
         7HaWISj/zSWgtmE6IMeQpYPp39jaGUlXBryEgFz6+cad50ZELNvi/fUMbAMet7lkh9Ta
         fK2+L3bih7n6Y1T+596eLBTdIrZgOD/wATALGD+IJCZaIL5qqgnhmokzf9cdrCFZb8Qh
         uMpJnzncQXbufs2OXu+AFCLHyce/DserD5jP8fzqTRjnqs3zSnt0++0TElgjKgdPA8WE
         QJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617929; x=1791222729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=emYdYXWYEvgQlvx3I4XrWNAs9Xp8822ArT+qqs7IdXE=;
        b=Wl8F8F25BF4uiCIbvtOslx2OK+Dz35EaVsmp3A4sxXpB+olul3Y0IxD7WuA8PN5ESg
         +yH3U71Ms1KvCkX9MkBvzAavS61vQCCQfzzvni5auSIzdYzBOZfnHC4+RjW43rMDSnJ9
         3z0RrJUSph2X8ddatSELEs8PjZMEpqrvCWVgYnSu/O9WMCbNgaQg15VI3FNrybNgv/fW
         wKgbtEtBB1jHbybh+LpbiXJpt9SbBVJtEgDGn6rEQM6wof9R+sesXkORP6UVMUOzYrIe
         gY9EgSJN6Oo5tvIc0w5VDI+OcXsuvg7uCJRDhLmumM5OOb3Wmb2+neqyCnCbVUoLwxmb
         9Llg==
X-Forwarded-Encrypted: i=1; AKwUvBwlZLoYxx7gujes7Blb/w3bnf1rYQqjuLMiE2VxcAEwT7DT/5GXiLcuqmsPZUBQ+KuInc4rcBHAwcNXN3k=@vger.kernel.org
X-Gm-Message-State: AFuF++lONMytdfjQTExCYfH3kTnF+b5t3yol5LqOy66e6/IRlMGTAuVx
	mGUzRR2CjBT3DI6WZO+IdzsyoMJ/c5y/VgJhmRuY/vN/DbBmGYwcFOPm
X-Gm-Gg: AYBFou39eFYKTuToYPM8DoWUGG+XgvVjvoZX2NGZXZbsjeA94qTYfiRvMdHlJZvzcf1
	JC7IsaQIqnmOvWQHqTLR8wPeVnH+fBCjM+u7sG+dvbZzuNLk8ICFM5J3xr84QX6LnD5L4zBVjc6
	CQPNjl5mp4kkvsmRMTGR3qU7aGX+0w2XBXlbSiWozFdODap64DpjbRtkuc1UQYBcU9kaFyo6NW7
	35lx1Y63S7AkM+RSL+YXu0VeldeJNshXNBJNwgZbeU9nOOZOMQKzaWMT7CxFRBOf0UGbGyBt1rH
	aOywaWLEbjzI7W0m+WDFG93BXyg9ywbZJkuRlqR0Mvj0Ov8aU0xs8+feiERFrL57qe5rLGm+554
	a6mO3ue+xAD/LsRcPJQjJyD7hcuzcmhKHLUzUOuNDnV+bGEB9+4CgPvpRGPYZgrICCKIk8XZc0O
	Dn+h98/Ht7vADVFQL7cVnGIMuEFFa64EnIGT5XAznMixNLL9KwWdhqGLOzyVsqgq5KP5WW2H4g3
	nXaNWFBornUxiNmmgtHvw==
X-Received: by 2002:a4a:e847:0:b0:6ae:8a52:ffa9 with SMTP id 006d021491bc7-6d43f2c71cemr11507723eaf.3.1790617929268;
        Mon, 28 Sep 2026 10:52:09 -0700 (PDT)
Received: from cachyos-SlimIce.lan ([2607:fb90:9a26:9349::e71])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8822199cbsm5971644eaf.5.2026.09.28.10.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:52:08 -0700 (PDT)
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
Subject: [PATCH v4 1/2] iio: imu: st_lsm6dsx: Use C99 initializers in ACPI match table
Date: Mon, 28 Sep 2026 12:50:48 -0500
Message-ID: <20260928175049.86941-2-jwuerz@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928175049.86941-1-jwuerz@gmail.com>
References: <20260928175049.86941-1-jwuerz@gmail.com>
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
Link: https://lore.kernel.org/linux-iio/aroutl04Q99mqJor@ashevche-desk.local/
Assisted-by: LLM
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

