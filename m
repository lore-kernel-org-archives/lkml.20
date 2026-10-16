Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E083603C7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148156; cv=none; b=pVI20QXsyTq99CBRd07e8+dHyHrvjK+Y432AT9t5Eb0BFpLOka+IScpIW4fZO5cg3hZFfcWNu3tZInHwoKMHEWyjH5rkkRvfh5oSNgD6Ye6wwVIiXD0Zss3Sg0E6HJCvhQFst39cMnnS8zD2nbL40fmPOqafjUYtzdNiFa+vnqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148156; c=relaxed/simple;
	bh=FWSRLNO9cLDgEi6X8otQID0ZFjodlP6sP+D8agqsO9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H5pWkt2zYPpt72M39/X1X2yQyqb7gMiW39alfOrHuFpQPWb8spKhtWkQ64cwuW1tXaK/idEdx7wHGcM6X1DEsp+bwxueqMGzjexPD+lp7SKpODMCl8lU8tWZLYHPuq2L2x6NnLqqpwjxJ+66kHYeKA3vtVn8ukqXfVm33n1SoHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnJHEKUf; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnJHEKUf"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso28618135ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792148149; x=1792752949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XYdvtinzHSsPD6Yut28fcPN5KBQq/zxQDLq78k29Xn4=;
        b=cnJHEKUf3NLASYNSPAhSw3R6oskK1/k+Mn9fvrFPqOHmGn1lRIb9si7JQtNXvbXQdQ
         ngA2G/KZg2w/5f3Gf1SiP/7bXIiAow9mUgoPiK21jLTdpuaBK3kiBXjHRd6QgTQgk7KC
         lXVSzo5TV6bj5dx4btyBAt4rkyLAt5TBhbTbBHR+r5Y28to8Tmo/cnUr8JzvsgfwoDMc
         DAMxN6PNf0AfmY+N8Epe6bI6kjUA9I1rRppIjOwwIWqq4zNQ2gTAhvta+RmfQOOk8tzm
         2HW0sTmnKTuBG8C9W6siTY8cvxUmtNmF+yAHvMlGQPBKYsZjT6hAFSEG5Vr7+rSN3xI3
         j0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792148149; x=1792752949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYdvtinzHSsPD6Yut28fcPN5KBQq/zxQDLq78k29Xn4=;
        b=mA+ZpykIr6jG9RUpzVtOf3DbyDoXQl8JZp06SqiZP++9ma8NqhibrBdSIaLWJgI52p
         sHJ0xB8IxkJ8o7irJAcTRxDD2pjG66OKtwYxShem2HAR8gHqxpQh7VYL7x+27sLctoyl
         5px+6VZpPo7k/RwwXWy6ziyySDIkT9Q4rR7au8JllbzKjQcPfyAS37WCpJUjKIRtLbq+
         /BzSJJresyfEHmGnur6BqU52mVan+bmPe4YFM3IdktaC5g8KtDL0ZhCI1yT83s6zFOVH
         7Jb8T9T9uIx4CN5i9fczAXrVko0SRXf3cw+3yukLMHbvTuL+KodbOn7ndisoCMsSu97J
         HN3Q==
X-Forwarded-Encrypted: i=1; AKwUvByalVt61U6ZaIBK6XRZK8H/OSE6z9DFYHxLyGWybx49z3wjBjb2a3oI0GtobgjBMKgxv+5fjU0QnzvbchI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWf6WaN99WAEtOfQ0VbqObwYym7YcEDWQJBb+ALG+v1LoIFrYI
	7m0fBo84p4vQrOLSow4OnFBs4KHnalL6hlg8yWl/ANmRbMbhgQ4waSQF
X-Gm-Gg: AYBFou0ohaIEDORslSD7EpH80aq5OCeRDJF6IP7nFIKm9vleV9BlYbKyZsi047mmUpC
	rhBfKm5gvkr9xRwD9rqES/D/fBFWIeMxULoUSd/Jnpg1UJVtT0YubbKSr3dBrfPb7ySLgQiyvSx
	40gTbHPErthlukrNlujyBUP+Bx/GSELtfSxZZwpulJzNDq7WTP9D412FRXMTidD0ChFf6ATWv5T
	MxblSA5of+89X1vVuv7fAIi1owIj+yyV+w6zspWpEM+8cA6IkXo+fpfNtbTKq+lIb5oDtI/AVjf
	cok9BcLROUkv4Ox06tELt0CoyYbxszhd9q//UAwmGA5fDnLwzSFMibmvBNF0/1MHU3b9IWydUg4
	9sPtXqiGM553PKFtZPIEe8qz41BfC7Kb/6miksAwgWvQzt4HYX1+sXtIMc8fUhnsbgCep6KxNst
	h1IzWVCROhPqRTEbMjrD9MKA/IvpQDbGgFd5PEqJk513UFMIupE7jZle9Kpmb69btlgVGLivRAP
	yWlSiqUDmO8DxiJ2pViwq+1vvVTIGo=
X-Received: by 2002:a17:90b:390c:b0:3ac:9669:846e with SMTP id 98e67ed59e1d1-3ac9669876dmr5201494a91.27.1792148149185;
        Fri, 16 Oct 2026 03:55:49 -0700 (PDT)
Received: from rigel.home.arpa (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc980a548sm1554333a91.0.2026.10.16.03.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:55:48 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: brgl@kernel.org,
	linusw@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aambrozewicz@nvidia.com,
	Kent Gibson <warthog618@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] gpiolib: fix memory leak in gpiod_set_array_value_complex() EPERM error path
Date: Fri, 16 Oct 2026 18:54:42 +0800
Message-ID: <20261016105442.109836-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A drive-by review by Sashiko reports that, where the line has not been
configured as an output, gpiod_set_array_value_complex() can return
without freeing potentially alloced bitmaps, thus leaking memory.

Cleanup the bitmaps before returning.

Fixes: 92ac7de3175e ("gpiolib: don't allow setting values on input lines")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/linux-gpio/sashiko-outbox-168233@kernel.org/
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

Based on for-current as it requires the previous patch.

Moved the ret init to the top just to make sure it is always initialised.

Not completely comfortable with the goto jumping out of the loop, so
would be quite happy to rework that if it doesn't work for you.

Cheers,
Kent.

 drivers/gpio/gpiolib.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c0394c7d6279..334a917e3202 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3842,7 +3842,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				  unsigned long *value_bitmap)
 {
 	struct gpio_chip *gc;
-	int i = 0, ret;
+	int i = 0, ret = 0;
 
 	/*
 	 * Validate array_info against desc_array and its size.
@@ -3920,8 +3920,10 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 			int hwgpio = gpiod_hwgpio(desc);
 			int value = test_bit(i, value_bitmap);
 
-			if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags)))
-				return -EPERM;
+			if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags))) {
+				ret = -EPERM;
+				goto cleanup_bitmap;
+			}
 
 			/*
 			 * Pins applicable for fast input but not for
@@ -3954,10 +3956,10 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 		} while ((i < array_size) &&
 			 gpio_device_chip_cmp(desc_array[i]->gdev, guard.gc));
 		/* push collected bits to outputs */
-		ret = 0;
 		if (count != 0)
 			ret = gpiochip_set_multiple(guard.gc, mask, bits);
 
+cleanup_bitmap:
 		if (mask != fastpath_mask)
 			bitmap_free(mask);
 		if (bits != fastpath_bits)

base-commit: 205cccd06e545694754e1bf8d626ea96e742cd8a
-- 
2.56.0

