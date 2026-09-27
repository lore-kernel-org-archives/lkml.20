Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEF22F12A1
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790549404; cv=none; b=NXYd4i2okhpNaTF7Ei+/pSyVx3vi8hkhZqQ72SNJPv9rw3/5w3tuDCBZ7jNGIGnpcGcGXHKeRWucwwt5jPUnrPY90d6OUbe/6GMYHCmfvKZr3QnS+A5lzmWZQrxoDXgvFwcKxgXUVvDcCoxqD0oAv//NAeOZqPBgCQ2MeLXd00Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790549404; c=relaxed/simple;
	bh=CPBoCXuji0HCs+npGcNAjkg4D0lxWLPFivqKavuEncQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y6+ImTdI9XqD4lvnWPPN8XqegtiW5erdjHTWawfM6nO93A3F37DSCP4XDS1Xteh1C6OsfRYkSoJUxsx65Hv9vLFS2fEpIWouNKDFyTBf9XgRcn3oSizsBgq1KWm2bTZo6n0x8CS30guEhmsckhz4czX0WhFptbiQYRByvcUBV+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rU9oFutO; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rU9oFutO"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so1039029a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790549402; x=1791154202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9eIatuVEBgbUOC7aadx8tcbBVKVDmPDXKTSaTvp6c0E=;
        b=rU9oFutOobOtNxXBl+rLiOx2xDO8l4K4aFYMrColMRKpvFcv9hTP/b96cTovwJClnp
         Rs0d/26tQwyJn4/7PlxV7T8QUG5KDQNKvr9tNr3zdyXMq0xTX7upgyqr1QGTut9neMYV
         1kxXKX0SbfEE3l12SKib1K0PzAj+IM5K0ZoCCHxFMS8zLKZIbGXDNdbZX9o8pifVnbMq
         m8p0NSwZ8WAqb6cDiMIDVttxd/uP8LZrIyA73KAQtebTEd4D5Ns5jIg6nMUS5spk0j0F
         e8rSXy0qa5ZOaJmZ+fg/MsMCcYf45DxByV+wjxbmxue8STpwMM/DLA4UbTy6NQkSdi3c
         d/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790549402; x=1791154202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9eIatuVEBgbUOC7aadx8tcbBVKVDmPDXKTSaTvp6c0E=;
        b=088cHm/LUs+CfCmfSVnudLBeWnz9nkZBAMfkOgwcjlr0DHYqd0aieQEKzmQn5LZJnx
         gu7hfhQr9OQDTiK+tlC+V1HEE0POQa+Xef00a6BlCD2SQhG/0kcsBYFWS+2nMe5l/DNc
         h5YE3exV2WedcdYXu7VnBoepL47JmAQyS542x7kqfFxnuAV7bB0j27nazPBn8vzRhRzK
         eEhDcsP5QlDTYe65q96Ko42iOJBmMFKuj/PjzMhP2eDnQY5Pl5dx6AANYkBvJnE/rwar
         S94s8YznfUeV/OWyrsoDW9KMpan1tYLMfToJWn7ZVl9D794gmq/wF3blnQHCk/kUtqP+
         DqEQ==
X-Forwarded-Encrypted: i=1; AKwUvByLUu0hlGg7NKH7j6cjRd/YniwkQ7FUgsZgnW79lJEHuT6lhrvuIEftzAwaE31uGufmH7IbTBP3ZOUlxyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYINSVsf5L/Qsl7MCR3b9Zi1RoM5ef8K2ipQ3B6XZR8nqLFmaqMP
	UZloiDrJ5lz+ZpFTqxJE9w9TB8ZaKaUF6o7w0dyST3I08Fo+36Ge/oKV
X-Gm-Gg: AYBFou3fY/9zt21zS3IYtx8j0YXb7Y4/8d0gUE09mdv5MVsrlZGXhly+sf1h4fzHIDB
	29Bs7YSKWloNxT2sq0Ig0oI0MRgBS4mZIzjGekO1QOcWlVmUzamH6KjUEMJJVhvRZsAGKzO1+lM
	SWuByNEoXFdboKK6F1BVlcTgtpVAwM8b/9m1iwY+thomYIQ/6pbQ2jLqlez5mllMoOVwjgtiPYP
	aQCGWD27pHRVBNyIOQZ+5/4fTfrK1eTpa0ecLt3nxz8hUGEM4KQc1tzQK91sxtM/UN+EU6E+1ya
	OL5svRFm3PvZhJStLULhwVwtIyN+NO/seSRRsIbvzRjS/Cf/MeB/UyRjEKNz7gitOAwOsbMrm95
	OFYCcn8gDYtW+jPGM/jVj7h/MALOx1RTebH52S3QAsyFhvxW5I7RKSDrM4S+1YbEw6djvMDyOZo
	eZQGVmR3RfWTfC98nzQNUI3666CHJ3Vb/Pg5rzOyZOAgJKdjjD4LDZk19FBx5ylOMxG9kng1m6q
	Wrz3GGvYYBaoTJPOF/z0lVYiFuPawh2ek5ZnGF87G1oB2we+uCymbjI9uEoPdJx00t2DgT436Tc
	9lYkiWM1ZzgO5XQiXTAH0ELdgkvsoTgMHoWkkpY8lj3sWKs0PSCB8stERmI=
X-Received: by 2002:a17:90b:55d0:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-3a098cdbb1fmr9472000a91.18.1790549402130;
        Sun, 27 Sep 2026 15:50:02 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0ca127237sm5596551a91.4.2026.09.27.15.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 15:50:01 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kdev_t: shift in dev_t in MKDEV()
Date: Mon, 28 Sep 2026 06:49:58 +0800
Message-ID: <20260927224958.508964-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MKDEV(ma, mi) evaluates ((ma) << MINORBITS) in whatever type the
caller passes, usually int.  For majors >= 2048 (legal: majors go up
to 4095) the result exceeds INT_MAX, which C11 leaves undefined for
a signed left shift; shifting a negative ma is undefined regardless
of the major's value.  In practice, on the compilers and two's
complement targets the kernel supports, both cases wrap to the
intended bit pattern; this patch makes the macro well defined
regardless by casting the major to dev_t before shifting.  For major and
minor numbers in range, the device number it produces is unchanged.

isofs feeds the Rock Ridge 'PN' entry's dev_high and dev_low into
MKDEV() while holding them in int variables (fs/isofs/rock.c), so a
crafted image can drive this exact shift.  Fixing the macro covers
every caller instead of just that one.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 include/linux/kdev_t.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kdev_t.h b/include/linux/kdev_t.h
index 4856706fbfeb..2dbbd47f1e68 100644
--- a/include/linux/kdev_t.h
+++ b/include/linux/kdev_t.h
@@ -9,7 +9,7 @@
 
 #define MAJOR(dev)	((unsigned int) ((dev) >> MINORBITS))
 #define MINOR(dev)	((unsigned int) ((dev) & MINORMASK))
-#define MKDEV(ma,mi)	(((ma) << MINORBITS) | (mi))
+#define MKDEV(ma, mi)	(((dev_t)(ma) << MINORBITS) | (mi))
 
 #define print_dev_t(buffer, dev)					\
 	sprintf((buffer), "%u:%u\n", MAJOR(dev), MINOR(dev))
-- 
2.55.0

