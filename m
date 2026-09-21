Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22A94A99C8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008740; cv=none; b=rjMPycv6ATBmbeMnLs4j68ZtowYz9cQDPga+coI6+DT/aXmJLVbq58+GaxAnQvWaJ81YfNpeD7+1OyzPhRx6zI5HjjIj5f/z0S9eRUC+ftN+mqwij8MZ8qyeGnNEcyAtssKaDjoc2Idd0iDScXRSZoWbSVL6biBcaz5//TI0T54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008740; c=relaxed/simple;
	bh=oyO5I38QhRJOPUE1i0SV3fy58NHPZWLk25nbmjWSnJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hG+D0+ekRRzjsv7k/d38uVUENNRJfXTb6GXV5ADAQN83a5Tp55ml1ITRpNi6FV4x5Eei5TL+sWmpbQ/mFVre9+TYkTzqZIo5zfPpjy3Z9bX367hrHd3s1tn67UgiWqI8/re1yB+2b7of+T8enAiE0O0Xh7BCc8PaT5ZeevwACEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5Gx6vQV; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5Gx6vQV"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso1927835a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790008738; x=1790613538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrxP4VetDWNLbGw9JjkKxEcsdiIybzRwKOzYXgb8glM=;
        b=f5Gx6vQVOh5xm/omthgT1VAhj7A3HLmKP0nWzfr7hzWXAmAU8HTKsbbnm/YfTZ5Fun
         K4OeqRsEqQGIc3HRmsFbyIqtTT3A2mSNZv9mFtVhDRUOmBYWznYBriqGqsvcUv8u5qqA
         nWDY9hhW4aKr9celuu9j9gspJdHo61EEzgutfwqGZJzbCsRl247UnULGIM7qzSmtBXTA
         zWSDF0Ov7tHjE6DZuuE3YUZKw8dHtHLMOAe+jXL/DDn/s8uGj8eqvk8WYXjSy5bgg0np
         eblC+ig0QoV8yBXt32NV2RqiB6VmSFSAl7KQdH6it5z7Y/L1IzQCHjJVAjVFx0Ay0rTK
         o7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008738; x=1790613538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrxP4VetDWNLbGw9JjkKxEcsdiIybzRwKOzYXgb8glM=;
        b=Ib3qcaYwayRncUKySWvdqGTmRgDuCjfU3poul2RWzc+nuNpgsMYD4DyLnQ9h4p8vgL
         19mzSDHfIFTkVrSIa+JrpTeGuPoaWylPkKpqUJ4AwHFsTasrbsYeeHC8sgwuQQl/J7q3
         tw3nj9S9HnWnLXSuSTafbk/dBx3wqeFU2hZRzHKKrw8R40iDAiG/mb6lMoxoO/0Koo+L
         FjE55g9l+bDhUfZD0rvrkHxskM3pj6TXINSsvg1G5rO1g/RKvzHmRiXeeuH61NDoS8cG
         BwbVz1lVKWTWK9oaPbGAf8EoAWrjhnhfctWxxbnEpvJNYKLSBuG7SX5tDIfgyjovfYl5
         MxSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLHjSftrEVuZmk6OZ5seqtOOk7i29U89qXUueMAwoG2FdZ8HG7EYwryiYb4w2JoGSacN+CfKsa7FeD4SU=@vger.kernel.org
X-Gm-Message-State: AFuF++nf1o5LvKrE4UKBL5y+NQx8fbWdFu43YeBww38hnceZxnt2ob7u
	IBH2UoNilE1LAlWWQDgghhhFoYC/lbYkLEw1M3IkyZgIVSzpR832nXfK
X-Gm-Gg: AYBFou3OT/W95vOWIlmoOkr5xmmB76kf+4VzXfxDfIoLXlRt/SXnBnltyqqOVjLUO8V
	ofU1W3wgsndRGwdfsAme4bLkfgjDaby2Ni3/R2CjCJYvZi84AagOdcaiEuUIxDJ3+HNNbRSBE1S
	sxY5mB6OZlyxv/3HE48WsyAQECwJucW8L4jFHBETojSQ8zP9Tix5sQbEw2Q3VwLHCXspKdzgHH2
	SR1g0SG6PrEAxKPK2l0LBEx96M+RZDwV6LJDYl3vZoUMHAxbp1ajvodFkZESGFMKpRpg1Q4/eIR
	rshPOP/kfpgQpMrRaZZo2XgEI6pygmF6R6RFUcXg7u64PaX/4W5xMBhHEcm286D+q/tlOdNkfX3
	2ecNvpoCkLy19teCX7rtEMCP4tD3+/yMYiyBuQ9LuEaqqxlc5Vr8OEFex+kZmDlbttwfmCOSaiY
	eathl8BMN5u5Y/hAXDbzXvId8rsAPHRSDjZ+TwbWGTY7tj8r8JzNiE5JaWKAjsr+64QQ==
X-Received: by 2002:a05:6a21:6e43:b0:3dd:a195:fa1d with SMTP id adf61e73a8af0-3dda195fcd8mr12032124637.66.1790008737804;
        Mon, 21 Sep 2026 09:38:57 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae8ff2bsm3812261a12.13.2026.09.21.09.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:38:57 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH] printk: fix wrong number of CPUs required to increase the ring buffer
Date: Tue, 22 Sep 2026 01:38:27 +0900
Message-ID: <20260921163828.111061-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default LOG_BUF_SHIFT is 17, which means 128 KB, and
LOG_CPU_MAX_BUF_SHIFT is 12, which means 4 KB per CPU.

By default the ring buffer is increased when
(num_possible_cpus() - 1) * 4 KB > 64 KB, which requires 18 or more CPUs.

Fix the wrong comment and help text.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 init/Kconfig           | 2 +-
 kernel/printk/printk.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 60448fd4ee12..446cbb59a43b 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -843,7 +843,7 @@ config LOG_CPU_MAX_BUF_SHIFT
 	  with more CPUs. Therefore this value is used only when the sum of
 	  contributions is greater than the half of the default kernel ring
 	  buffer as defined by LOG_BUF_SHIFT. The default values are set
-	  so that more than 16 CPUs are needed to trigger the allocation.
+	  so that 18 or more CPUs are needed to trigger the allocation.
 
 	  Also this option is ignored when "log_buf_len" kernel parameter is
 	  used as it forces an exact (power of two) size of the ring buffer.
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 00f8e1291564..c7d961256c88 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1087,7 +1087,7 @@ static void __init log_buf_add_cpu(void)
 
 	cpu_extra = (num_possible_cpus() - 1) * __LOG_CPU_MAX_BUF_LEN;
 
-	/* by default this will only continue through for large > 64 CPUs */
+	/* by default this will only continue through for 18 or more CPUs */
 	if (cpu_extra <= __LOG_BUF_LEN / 2)
 		return;
 

base-commit: b03d22ec8186f3f6b40b95a5a678100cf80116cb
-- 
2.43.0

