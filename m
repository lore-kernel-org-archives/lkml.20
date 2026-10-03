Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC97F395D99
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 08:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016131; cv=none; b=DVkAsV5PUktrlx7IkNLdYgja0tnUg1VIE8dIG0qnFJgtzLgabFYpfTZqqyg9RLNxYfm0ln8g0KSlHqkpFxOLyiW5AlZ+ld+J9QI7M+fuANac8WXkhxMglCjW5YjO8VGw20gMrh6+R7C2dJ2KuASR459FG+CvpEsaNycF+nHc6tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016131; c=relaxed/simple;
	bh=HTPEmPCGYmkqZSgwlod58JbSJWkfi4nkOEYwzAfzU/M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n323JTSWSkF9tN/xs8huRS1a8CS9OC643tApNfY/7WZc6bqadt7AZvA488dfsg6u09dLOAcVw7Anrgh8Z/HLNkC3Ol0QMFBl419j5CzzRFlWB1XL4QXHoO1LOZ3kOnREJH7/BuVuzQjbDQyZm9MZxl2sx4KpydIUT9p6u0xPavg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2s2AwrX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2s2AwrX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16629a040so5673375e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 01:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791016128; x=1791620928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CgkLt2eJLsFwOY1HeC2FpkdUeH6OhVDWA9sxCZx56OU=;
        b=V2s2AwrXE3qChXALPLP6LdN5Lkd7jnNw0Y1pchRFvuRGcgPAoiaqyI9uEIkjdqyc8k
         uyqKlWyo4kC7KloA7YuMs2vw541JmRdC9K3w3rfCcg+L30ZrnzKgri8I98yjirZutCWY
         TIVEsHPn4XFTi7C2ZEQA0Ud2pWNx2UJdVhERcTo3s3vY14DZFzEqfbH0ky34gw5rQYG4
         leIfoQ3yIvS6d0DQN62dmAzypbnpsnQAWsedhuNvh8W+/YaT+cI66PXuOJGf/rC/byDP
         UbwEQE+l9YE4i4yuMifS/ydDpnilP3Ubd2EoNnqweHij3xsUO+IE7XsGoQmmXoIG2w7m
         KGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791016128; x=1791620928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgkLt2eJLsFwOY1HeC2FpkdUeH6OhVDWA9sxCZx56OU=;
        b=x2zhw3GbLNJhkCw2qTQk/enWPasVduVMu59j7nkyKItjlKfnxQ+qUnArXhT/uRQjmY
         2ITIOctKwYaKO2dArUOWY1goRUpK2FqG8igPqPHiR4wFsE9rwXKVAxG3KmDZOqkQa/6f
         q6w91wOFPjPe67feirjHc7wBqpKbPPjNnoPpZQpEjI7F+VkOM2DSOKQ9PaxnhbuVjoxV
         PYgSuImjhq+c9oJacc9MNN3aviclyHCvkMrwV52w9oU4C7o/qvysKAjd6+2i0pGCWcrj
         wXDBPIgVSL9e5zAjFmvb5TllRV9v72GjwNYqsArpgZnHOQYbImhZDf845u3Sxyj/Z4Qy
         HURQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaVBPV3zcnRoJhLPl31bi4hSCveIDgtfmUtZayo8RqhnpGlLmuc0orcZ6fa0bBhPLBRamzWx2dTm69GUA=@vger.kernel.org
X-Gm-Message-State: AFuF++mChzaGPV7k9TsZ6r0uhvUkg7QY0QtbhCyYVviopyWBQbI4PyO1
	Nd+KSbaP4+ZO9IJMtQxlkYrDqA2+TmyL5aeKBSrkVqXW+Pb8Chh2RTGe
X-Gm-Gg: AYBFou17wLDt8sO8tYX/F6SEjb5fud845qkIuRavgEMueZNWLtFxV4HwUJVQ2+MnP5N
	pcIs0E8D5YVNwmEJZSQlFuJo/vH+PY65tz5DyEub/tTLULsvWE9dH99UQuVCxgWx1jcpRshuWXq
	wiGZ4Hd5X3qvyKilrziBO3sOiE4/vFL9YRSG9gfGd2vvqH3/7adCMroArIwJmJykB/RaTDVeuPl
	dbL3U5mbBYNrGKdTIEemhLIz8niT/JTVYykrKSwnYX2NSmRn15gxk+JKxKH8+pvTVrvpBxRZQyR
	668yBgYgJt97mAI8r4+NzuGYNNiXfGFkW6sYP66q7cpizbM7ZExmjBe5W7FlQ2JxXUe61AHmct1
	DOvMZGDcLO9ByHXckFElaWvQuVOQ9zGXSjw05u2COoKTW5vnP7sfoQgnIyTFFV3GmZV735YX53n
	wPhKia/Y0uk7zAr2cCxLbW/BsFuE5jizsx18HNKhZqtqWXarX71C6oTZKd7T7vRI13m4OZ8UOhd
	xhAcCUE/MDwj9eQMRN/+f8Aln2DxCrXYiQemD28WYB1ZLQ8/6rF31oYZ6Ry4Kz0Hawbd3gq2qPH
	GTSXWcsdQU4SI1F3n+RqN6hm2CnxlHJY4aadeoxiVI1yC6X4tlxwwqYB1yfruY/5OFn0eYNOZyP
	nv6Q=
X-Received: by 2002:a05:600c:c091:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a1680dd2c0mr16619435e9.10.1791016127684;
        Sat, 03 Oct 2026 01:28:47 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fab11sm10937712f8f.16.2026.10.03.01.28.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 01:28:46 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Yoshinori Sato <yoshinori.sato@nifty.com>,
	Rich Felker <dalias@libc.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sh: sh7785lcr: register the PCA9564 as I2C bus 0
Date: Sat,  3 Oct 2026 10:28:33 +0200
Message-Id: <20261003082833.21511-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The R2025S/D board information is registered on I2C bus 0. Commit
44454baa7ca7 ("i2c: Dynamically assign adapter id if it wasn't explictly
specified") changed the PCA9564 platform driver to pass negative platform
device IDs to the I2C core. The SH7785LCR device uses ID -1, so the core
assigns it a dynamic bus number. Reserving bus 0 for the board information
makes i2c-1 the first dynamic bus, and the RTC is never instantiated.

Set the platform device ID to 0 so the adapter is registered as i2c-0 and
the RTC board information matches it.

Fixes: 44454baa7ca7 ("i2c: Dynamically assign adapter id if it wasn't explictly specified")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Tested with 29-bit and 32-bit kernels on a custom QEMU model of the
SH7785LCR. Both registered the controller as i2c-0 and the R2025S/D as
rtc0.
Testing on real hardware is welcome.

 arch/sh/boards/board-sh7785lcr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/boards/board-sh7785lcr.c b/arch/sh/boards/board-sh7785lcr.c
index 25c4968f0d8b..b93423df582f 100644
--- a/arch/sh/boards/board-sh7785lcr.c
+++ b/arch/sh/boards/board-sh7785lcr.c
@@ -256,7 +256,7 @@ static struct i2c_pca9564_pf_platform_data i2c_platform_data = {
 
 static struct platform_device i2c_device = {
 	.name		= "i2c-pca-platform",
-	.id		= -1,
+	.id		= 0,
 	.dev		= {
 		.platform_data	= &i2c_platform_data,
 	},
-- 
2.53.0
