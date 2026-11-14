Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637103;
	b=eJQLmA+7xDhkMZEW29DQHpMaMGEqBY6+2Q7Uy2ZHViT7+bkbk+N7Q0gQoS5iOTx0EfIu
	 6x/q6yh2QSJqshugbLiCX5O9GnUv3P/lNxSHYPtwqBrP0gqKfOBo061WS/35djmj1Jaqo
	 sEll/fzeoQqOvryQDX3EdleNnVw1yqM96Eyxg3EpsyCCldABgJdW9mNhekb2CbolhFD3W
	 5ksZO0ZVhLJsypVXL0e1ZKERXx/kQnhFcW9YoQO5ahKVfVu1bKeXk9/ndJ18rqMQF44Xn
	 qDn4LZHAUG39Gb1TgrY+Qvi1aSr7YzEKnHCZncJigBH5dGpIhGUpa9YZgVOzIN/AWtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bizjzmDglxZ2DeJ1FgJ1hagjRnQiFik83BZEZhTNp+0=;
	b=N/3mjNCusQo7yTke/TgLvG91ZJwj7ToQPWQtu8lE0o4ixIOHp3gm+07R3oubwX84FWgf
	 o1ygPuxIFmEB6s7g5jtLLdHYRg9azB9PDayRF4X2caZVtV+tbzwUa4tw7Ak8i9/Zvw/Xs
	 z/S3uH1q6RpajdrA7wyjD9LJUV+RRkrSnB/R4rt8o9HYLu0zZ7fMeZULSoVXjzokiG5fW
	 9HLvkwZtZtZOvn6t6Fy4gjLvgkHE8wFNCwYnelAQM+3lJJBpdM0TEjwFd4i1Y55ypJ5PP
	 OZcGXf7SpzMfXnF8jeNU9v5Poe2z7PaJtPwDQA5ZQlDeFXdajAgb4vO/QeRYzylylCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1njg+0O;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B099F606A883
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B099F606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1njg+0O
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so3237011eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637102; x=1795241902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bizjzmDglxZ2DeJ1FgJ1hagjRnQiFik83BZEZhTNp+0=;
        b=N1njg+0OUaWLeOvQVIdoQEwpWq5ec7UKlmwd7dXQPk9OPim4HMrtQUbZKMX7pLzq5X
         T4Grk//kwu7IpOcIsuKTdqRoAyOEnl/zofEBLyxOAcppzSMiZhM3eGitCtPQb92qU9Wn
         ak7x5lIs79hDqwC4hNILazEH01L+k8+usC7UesJmr44W46PbTtuGHBhwya8hc6zTRhw7
         rErZFsi4ZdAjJkaaJ2GsCPI/7+Hu1fP3dsa6KnJaAv5RRGd2XwDVfwmS8L3HkMaMbXou
         1Zc2AKauNUBJ/MHuqrtEoPk5NW4Qnk1CNb479UckOjHOFM7dhF2omajiGtYRODuxbwCd
         PoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637102; x=1795241902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bizjzmDglxZ2DeJ1FgJ1hagjRnQiFik83BZEZhTNp+0=;
        b=fPkIhCUUJPRZadUg8t0+b90URB7IYlJ5XrAbzhkBgEfz34Jy0bZJwBiYaZqfHZh8Kg
         I8saEkom0R2LQSSn2IIoYMaxpXCHlXnuHJXG3EPJchPLLlNuJe3IlKO9bHqFTlWjZJ61
         iK9zd2JfjAomdRfzL2wvJ42o2uv9giakPbk9yFFQXxDMXxNP26T8X3gNNSj250t8eviF
         ZaX/QciG6e2urdmAMakRvia58tB6hy8FbBU34z9uQ8iw51YQXxGrpYqJfAeJIzd9xa3a
         qm4MpF/WaTWkzwkbFFyneuKJtjx6fMMPaDuVKq3gdgrPTYdMNfBYmVXcPtcPFg14vRA+
         W3rw==
X-Forwarded-Encrypted: i=1; AL+hErGWRhammek6WfdArtPmoqz3aGzLO/cyuYlBWqCzhZ8Ah/5VgA4pNPZEaJk3CdcOAd4uhD5jd4WN3J8vErs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YhUxBO4xxZlCZ/lwq9fGztC+aiO1WRAHWNme8a3zBea7/En98
	mBUTlWLBFsxvdoW9ZZ9gQU6oJXl5wujMUJKvWoQqYvCX5Nn88X0xnKeP
X-Gm-Gg: AYBFou1oHHdbP86Xc4JPiSwnqVnzQ6VjfTegAj6LlV2nKXU9flE0LP8x8vP7kGLeJbv
	h2fxhEgHLe0qhxdXfOnOe9ensbPPTtHvbCqJUs3u5KonSGKfllRKEfGZJ6UWMoXLtKf+Kbmgrva
	aGGY0rTxjYvtP8TcueIsagUXOu9Ivh//zgEJkBSUICGbjtF7yV6rzw7ZgxfF2gYIMQR8a4sCMbK
	fqe1A3oWuRQRb9NvXGeKjyyX360h4zHes1EpfGCXjvgQ9etHerAFBDFlwiN7WoHS5y2JH5q8ije
	rY52OBnfK8irH0y6OdGskLsyEtO1KJSV427f9PzATwhhdCW5yqh4u63caetnRGn1qAbSxXtdNzB
	r9GdFhs61qGrg5Kp8OimLSNgK80Xguo8VpFpXRJmaT3PrtyprvVJu28VoZwJOo03KpS7Hj9XhrG
	78iuBSRy51vcf2uVJX5OCcFdjXz5cKK+2kJiTOieip7O6jEVKM+wWDIcqthVIVHZpTNr1CM6oat
	0Kv/EN2JKPS85NzsOI1/oXY0W+zzoThan2TR0bdi17o49CsbWyUF9O6m3UWpYUJq5V5le+oK8fA
	qvSLyTe+mIzk5UGhxnhQLWcyAgssdINLoiIfXAuYp++jp+14Viho7DIcWBqjnSg6Clxuq4v8eJ3
	aSIAGclA3at1jn/dG7XF2CUwvTqwT15F4CIuppYvc5v1PlWjILDG+u8kdB5YHd30ds1ulNdY1jL
	6jfA==
X-Received: by 2002:a05:7301:1285:b0:376:6aea:ab with SMTP id 5a478bee46e88-3796337238amr6009944eec.3.1794637101846;
        Fri, 13 Nov 2026 22:18:21 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm13200536eec.15.2026.11.13.22.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:18:21 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] platform/x86: dell: dcdbas: Actually wait for the host control SMI
Date: Fri, 13 Nov 2026 22:17:54 -0800
Message-ID: <c35b26234163789f1fc37ba09a48de58d475629a.1794633178.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633178.git.rosenp@gmail.com>
References: <cover.1794633178.git.rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For SMI types 2 and 3, host_control_smi() writes the command status as
-1, raises the SMI and then waits for the BIOS to change the status:

	while (apm_cmd->status == ESM_STATUS_CMD_UNSUCCESSFUL) {

apm_cmd->status is a plain memory read, and neither outb() nor inb()
tells the compiler that memory may have changed, so the compiler
assumes status is still -1. The loop then has no side effects and its
return value is not used, so it is removed entirely: in the generated
code, the read of the control port is followed directly by the return.
The kernel goes on to power off right after raising the host control
SMI, without waiting for the BIOS to accept it.

Poll the status with read_poll_timeout_atomic() and READ_ONCE(), 1us
apart, for up to TIMEOUT_USEC_SHORT_SEMA_BLOCKING microseconds as the
name suggests. The type 1 loop polls an I/O port, which already takes
about a microsecond per read, and is left alone.

Fixes: 90563ec4129f ("[PATCH] dcdbas: add Dell Systems Management Base Driver with sysfs support")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index 678f44252a45..a5917093d539 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -21,6 +21,7 @@
 #include <linux/gfp.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/mc146818rtc.h>
 #include <linux/module.h>
@@ -441,12 +442,11 @@ static int host_control_smi(void)
 		cmd_status = inb(PE1400_APM_CONTROL_PORT);
 
 		/* wait a few to see if it executed */
-		num_ticks = TIMEOUT_USEC_SHORT_SEMA_BLOCKING;
-		while (apm_cmd->status == ESM_STATUS_CMD_UNSUCCESSFUL) {
-			num_ticks--;
-			if (num_ticks == EXPIRED_TIMER)
-				return -ETIME;
-		}
+		if (read_poll_timeout_atomic(READ_ONCE, cmd_status,
+					     cmd_status != ESM_STATUS_CMD_UNSUCCESSFUL,
+					     1, TIMEOUT_USEC_SHORT_SEMA_BLOCKING,
+					     false, apm_cmd->status))
+			return -ETIME;
 		break;
 
 	default:
-- 
2.56.0

