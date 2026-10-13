Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586A0455607
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791863537; cv=none; b=GNybfrFldDML3geEcam6XXmoq24TRNv3OUnMxKRd09mroXd8W4HiduwIDPso2Z6atrdC4gaE2ZVycoVBDq69VBwbLebyAfqZS2hNUy2tGqxTK53aHb2+My3l/M4HMVdcMpy6gmEL2Zi4XTFhvu4rfowAq99VVr1Ick+ui6EU5l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791863537; c=relaxed/simple;
	bh=51+OtP2aeGNaUYP4I910l/wDDa+akp4WoYS6xLBGx9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHUr8B9VV71SGPXnaNWDk4aBAWZlI49IFgM4NUPJA1zMatB4IZ10RwlyPxuSWtcTCTuM/gJ2UI4ctvM3MMuuXkntB3fq2+Y2bI4S75cKYA7QmbXjkV257MhGQ+gZG9gy5A5mJXExmgIMehMiLN05PxR0s5lRXcJyn7nQsNsT9Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pl2RkRtM; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pl2RkRtM"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-89a595332c7so1089776b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791863536; x=1792468336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9JRVEvrxfwQIXEs8jD1qgXlnqM+VVYXSC/piCelGt8c=;
        b=Pl2RkRtMBy38j8H2YtSuTh93E/PQikuq4my5cx5/9H9XZDjfjPXxekA8IiDdmn3Y4L
         ALERztYZiAP3ocxgUM7X0Ldyz3WUfkLroS/40h4RaL4Pk74JzkpUiCE5QQ/DELazF9D2
         OSa7DOQkuPSZuTr+vDWUSsC1nyiW9111HRvCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791863536; x=1792468336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9JRVEvrxfwQIXEs8jD1qgXlnqM+VVYXSC/piCelGt8c=;
        b=MpdF+AiJJx1DLMCMyGJBqnph6ZQtrsueR5kcF1Zuj7wc33283hPJd5VO6aEpcksMw7
         UOuMkLlpOHCDb3RCZPHm4YQDO9b2nmZ0MiRFjtyctgfki5VAVrr2qUhW6HdTr76McLeT
         4Lq1RYqAnA/64iKQ5MrRHti1zvYB73MRUqoXNH7zjtclvhGRWMxvbS2iIhaUwP0/kgJ/
         VN0tXIw5w5ioB+liPJ2qZLdwf8fnXOyvz+z+pzUsVA6zCVMYIdoWGYX7wfKqpSY0dOee
         qUh8wt3vV6P8rVW3zz0QPJuAj+qgLd9TQ25fslsCWwBJPG9ifh0qI8A4V2VcF8mzSr0b
         c46w==
X-Forwarded-Encrypted: i=1; AKwUvBzKam/Riden4xDJvWybD3HoJe1IsDlrb5eFJEkWOsFxziqKtFCJ1eQbK272ij4N4g5KkxEQxBU1omoLlls=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKozNzRUsbVqjOIAqKTowOLuCSe81wkLfyZcGHXF/DncmBH4UY
	GBgHuUXT8y2d24U/y+pmEkqluOYtDsI6iIxsU/JiGdL0RwKvvVBDUdhFzgThTIZGEQ==
X-Gm-Gg: AYBFou14cz9u7mq4RjENQiti9G4tDdzI+Xy3IFVNF2TAuQbxWyhUl9G/ZzlUKkWSYZW
	/3xtUa0QKHqKHD/WnqDw8zx6XiG29yJz/z77dlAcJBukvK9Q6j/hv/ZEnLjrAcAMzXl3My3SAPV
	fVJvbFuC5pBk080TwOc/0IGgncT324kwDG762Bl8DemW/FFtptTi1M+XQvbJ04adwgRyHzGY+jI
	9Zx8+IXSP+2b3akOxdUj1sB4hChLk7MYrZaUf28i7Oe0aiHwt8KXPZZyzEey1HSL7njcFbVKMKa
	GPYETZw2zn8YriEjo4FkHVslv5U8J3ZUqzXWaqSlIUgjNZqSnjMvqG9nRViD8UyjRkBSW/8Jc1A
	O3cMMWf0lgrQSIJPPs2wOeEpMG19D+tpKdt4yxWF26clQ3K88ZPBC4/hON7tk0jWXY+CZioI+kp
	lW6iLLWd4T7jaulJT9vgynv5NwXFauWHA8nLDeCabWA9667A3Mn+tNPajFQ4AUyYA7zKyApsCau
	jwxcfTt83sqTmrrivj1ppXjrLBab7ygmxVbKS3mpnnNAWg7rqn/vay3QUlLxM0=
X-Received: by 2002:a05:6a00:1254:b0:886:5438:e47b with SMTP id d2e1a72fcca58-897c73f4412mr8459670b3a.48.1791863534025;
        Mon, 12 Oct 2026 20:52:14 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:476:d384:7c2e:1579])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c41bbb27sm4326818b3a.40.2026.10.12.20.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:52:13 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 02/11] zram: remove debugfs entry on init failure
Date: Tue, 13 Oct 2026 12:50:49 +0900
Message-ID: <20261013035201.2809924-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261013035201.2809924-1-senozhatsky@chromium.org>
References: <20261013035201.2809924-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not leak the debugfs entry when zram_init() fails to register
the block device.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index ab064c84b092..593fa4ae47c4 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -3297,6 +3297,7 @@ static int __init zram_init(void)
 	if (zram_major <= 0) {
 		pr_err("Unable to get major number\n");
 		class_unregister(&zram_control_class);
+		zram_debugfs_destroy();
 		cpuhp_remove_multi_state(CPUHP_ZCOMP_PREPARE);
 		return -EBUSY;
 	}
-- 
2.56.0.385.gd3acb90ef8-goog

