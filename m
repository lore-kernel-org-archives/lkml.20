Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A53524B1C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651606; cv=none; b=QJwi1GSTaUWi4qVe8GRbZG8A3/c85t9nxfbEwDKWEqMWQDF7ORW2EPrUOpmPwh1mPrlkjj6d47aJox9xpYOseYLX4VmnSCr5PwMgAmVOZpMyW9zfr79exgSN2aFV2daxuu8NMgU/wG2rl7nRBU85c9LwW6huXZpC1aPW4ARLGMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651606; c=relaxed/simple;
	bh=m2UU0/l7oXH4nDDm4aNiVdsK/0ORRSvCe00W37MZM54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YfsRZX+hdNMBh1XYgtfkcmcxDkDWJs0HjduLhoHCdk+dKuYIOSjpY7yuNomh3lOuIepLKmfsI79ZW5kzBaJpqPwfnCWQHXijhrk/1RHQfBFe2xrcpDOVqRfgiBhWRnrCl80mvggUWCd5syjUohDwfBHM4TOjJEkDggSBHeDng+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=QU/D8fjp; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="QU/D8fjp"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f88so540625f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1789651600; x=1790256400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYqy4JvgQiRzCuvqvHp97HhL8V2ft2LLYeHwmXteui8=;
        b=QU/D8fjp3FdyDDs4Zw9GAUX6wERcZu4+cCkyTquYLgUKh2K4/e9Z3CsogrukcRlqPV
         vezxT1Ppfy/HTuw1YeP0wufv879MH8X7xJkJ1MdhLQH5ePyPCnknaSToD+H0i996QU2F
         ezfeJ+0PBOx4S8si0MtVHuAfvcykyJktxeeL7ziqs0eX4kuOegbziJVg+5HH+xjX3S6z
         pkIYymfTPOhXklw5VmQc54VDQOy1Vnfbw0l5jri+63+CNzStVTBydn46tUL6K8WPBUkO
         g5uLV7mA7yLzAMvEwt//2gUw1IC9ou5KNBZSIu0siJysW3Yy0Yv+s2D4rYPSWfC8r/9D
         w4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651600; x=1790256400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYqy4JvgQiRzCuvqvHp97HhL8V2ft2LLYeHwmXteui8=;
        b=Vtll6DS6ti/rTzU4fR5dwWUOx08u9h4XsN3hQYoAYLvu7VNpMz6Wiq9dRp0b1sRfpp
         wxQkUklVpKnNrKeLH3Hfn1mpLy4kwjiHFMnhrYo2k2Y6EV0CCTM+fPIc8d6CK3Mxzi1s
         6U6tAGzNNBnYFc6htJils3G7CzU7MGz274LVnJuWPhgRsIyoLIBrofqsex/QB/U6asC8
         hvyuAI2WS149B0ZXfj66kQB4JASt4UFjfXP7RMYL0Vj+wgy+3ExTc0Wub61TQX/XWens
         I7Dh6vAdhhO8YMh1fVg7xZ0muuNRJ423/Os1+1Px/oEnTSDKxxN1sFDdPQJMfffMPFpH
         U3/Q==
X-Forwarded-Encrypted: i=1; AKwUvBx5897nImtctLUapLaAyD0jq4eiczQez+0Z9R5QWMx0kx7b8PpdF+iCa8X3gFpKHQZsGCGIML+dPO0fYS8=@vger.kernel.org
X-Gm-Message-State: AFuF++m31YJo8kBY/gf6eA6EdUUIMDCscM/m/0qs6tf3KJBsoFbM2HjY
	Nk/v+pCLcUieaX2A8YOYpAHusqDXqIR9grTqIndftQdWaIqJBC3QCKhSlpZD64KeHg==
X-Gm-Gg: AYBFou25VcSsLD+me6KXzEEANHx2Kp3AMPNr90rTF1U5Jw45Jc6ynbPSj7tpouTbCBb
	XDfLBZWSX1EejpQuYIPfyPgzcGAde+QdnRE2LXOivJhdyQyfuqGKAacPlxH/5+ZY8QVo5wnmt3p
	5VVOW2og1pTQkIpEzV4Cc20Mli13FKctDzlg40N5DNA0+Po4+OuvnXmPOp72PUtECndi7RJaE3K
	n1VOyXQqqTzwutE7wSQSNlln2kd77A1AsLPXAUfbDtl3bW06FfmUCKE9r60Af37chDL/GewDKF4
	zKocwiZbUCHVe1REO0VX5Kxt2ch1z1GmkBkz0oiwP7XkzYZHTv8+me8fkKUT/Qr030mpMTXX3JX
	J3nJWXlFVQldxc0iWQrN1xbbJKjOxaDFcISRoMJGjDWCEi1/nRJC44+37aSOb2CH4hAKijCi7FN
	QJKDCHTlhWI6julrWLfEWUJUqpKfYHAw46vfuFGaGIUUyDGsg8pLsbg54df1KWVxDPCUguj6BQu
	8cLMIJGy3Iadx/HdzoSSGRuqstw
X-Received: by 2002:a05:6000:4209:b0:487:77c:f6c4 with SMTP id ffacd0b85a97d-4870d0667a0mr8425263f8f.35.1789651599627;
        Thu, 17 Sep 2026 06:26:39 -0700 (PDT)
Received: from fighter ([216.128.28.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1f6cfsm15879947f8f.13.2026.09.17.06.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:26:39 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-pm@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sean Rhodes <sean@starlabs.systems>,
	Evan Green <evgreen@chromium.org>,
	linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Xueqin Luo <luoxueqin@kylinos.cn>,
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>
Subject: [PATCH v3 3/4] PM: hibernate: permit encrypted snapshot device under lockdown
Date: Thu, 17 Sep 2026 14:26:30 +0100
Message-ID: <f237b56e8444ea7b477dbcf4aa6dafd2ff0c1dc7.1789651581.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789651581.git.sean@starlabs.systems>
References: <cover.1789651581.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lockdown disables hibernation because restoring attacker-controlled image
data can modify kernel memory. Permit opening the userspace snapshot
device under lockdown when encrypted hibernation support is built, but
require encryption to be enabled before image data can be read or written
and before restore or power-off ioctls can proceed.

Tested on StarFighter MTL with lockdown enabled: encrypted uswsusp
hibernate and restore used the snapshot device path.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 kernel/power/hibernate.c | 8 ++++++++
 kernel/power/power.h     | 1 +
 kernel/power/user.c      | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index a95cb447a13a..0b8626bdf81a 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -114,6 +114,14 @@ bool hibernation_available(void)
 		!secretmem_active() && !cxl_mem_active();
 }
 
+bool hibernation_snapshot_dev_available(void)
+{
+	return nohibernate == 0 &&
+		(!security_locked_down(LOCKDOWN_HIBERNATION) ||
+		 IS_ENABLED(CONFIG_ENCRYPTED_HIBERNATION)) &&
+		!secretmem_active() && !cxl_mem_active();
+}
+
 /**
  * hibernation_set_ops - Set the global hibernate operations.
  * @ops: Hibernation operations to use in subsequent hibernation transitions.
diff --git a/kernel/power/power.h b/kernel/power/power.h
index 815c84c1e0dd..351b5f68bde3 100644
--- a/kernel/power/power.h
+++ b/kernel/power/power.h
@@ -168,6 +168,7 @@ extern int snapshot_image_loaded(struct snapshot_handle *handle);
 
 extern bool hibernate_acquire(void);
 extern void hibernate_release(void);
+bool hibernation_snapshot_dev_available(void);
 
 extern sector_t alloc_swapdev_block(int swap);
 bool swsusp_swap_range_allocated(int swap, loff_t pos, size_t count);
diff --git a/kernel/power/user.c b/kernel/power/user.c
index de41f590c98d..b8d3342f1548 100644
--- a/kernel/power/user.c
+++ b/kernel/power/user.c
@@ -184,7 +184,7 @@ static int snapshot_open(struct inode *inode, struct file *filp)
 	unsigned int sleep_flags;
 	int error;
 
-	if (!hibernation_available())
+	if (!hibernation_snapshot_dev_available())
 		return -EPERM;
 
 	sleep_flags = lock_system_sleep();
