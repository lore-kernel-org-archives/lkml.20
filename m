Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084843B2FD9
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257470; cv=none; b=MTEDQYMSiLXRkP6b00i/262PeXBtY5yXP8HF6RD+xao19UvbWUOu8H4MucUjfvoz9LyCcugzpAwes1rdTuV4dqqsIxh/5pBETeehS6ANyY//xs0oHWPY7ktwkGlGKzlr45ERsTcwl4jxS5d44BGy3eASDhyBUaQm0AzeRAM9WUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257470; c=relaxed/simple;
	bh=dzyiSRz4+xBFKPvndD/3jeiT3Eok+8jZG/7BgH78V4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rUmBmB8XkUPtml9EweFwuaPcyWvPBlRs4MgUXEX6Q6ztL5rv7fypK6G2sdzNjoXJL0Sa6i6gR9V5Fp+cJ8l8DPQyiXloJu4Xwe+NZt7mA3exWPhpVWEMfLuFe6ZgEkHxphIeaMwFNBxbnisZZsB/4lqn27prrqcAfFZglePc66Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsZLAZUI; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsZLAZUI"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so1656782c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792257468; x=1792862268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDa9JjAt9pCFlYhBjZKvcPCh0gjBULFSTkPmO/Bq8MA=;
        b=RsZLAZUIZIrApSgGRfnsdNVG8OpGlLeYSzIZbQWm3bNTY2nKP1AFxZ/lr6D2FK7dZ2
         0m2vKdD2obhIzuR1vREY0njveHfO7nAXT8Pcal88q4I110WO2rAyMdhwbnh7aemZKveU
         xYi1UzUTcqwY3OY9hRjtBYUHeSaNZ3LUhoVEDQlBa+cZZDGEalprEYe1ieytCcXY8VAZ
         eJOz9YXG+7z5ukvKOJR7FLOeL91xndSCvBVw2ReR22ZwzubaQzNqJu3428ZE1ecwPERW
         tBy9oOfMB/l3wm9/jebNrOT3922Sc4+gJDV/wS2MZ5IMMb0b/xMbjeQ77LdpzTdM7mDt
         ciQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257468; x=1792862268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDa9JjAt9pCFlYhBjZKvcPCh0gjBULFSTkPmO/Bq8MA=;
        b=mur464EFcs0fjRE4Y7+BouV+eDpF7pBuVX9ZzBjwWa+T5AuIccf2HnwlojEL+cgtvj
         VJFlD8bsUQWpqk3prCiUTdiwhHtHXiEZZtfxE0eCBrEaLmJrqCyB6ikKNN1YTudUy52H
         dqXbbKshETGcupsEkeOQHf3aXnm6kdxepY91FleLyLRliJXz5qLSl2xTC0hS4kwdIgWU
         rSIsyrsUj6dPSrnOcSUhd6qWdd07Tv/7roeC+TWX+cUOZkK3fk4rGWsBZ37nS6c0SDkQ
         awT+VoTkgGryWcv1ZKz6ITchSSJsJI7gsXFYeRq0YHHtVOJCEmv5ORkIc5L+dTyAAGj/
         tBxA==
X-Forwarded-Encrypted: i=1; AKwUvBw1mO2CmZ2uvcrH47RiX8blKQFaJcuDXvIYlmwIajh/DKXWbX950Yr4pz6//DoI43e+4OzjS4LBnqZcVYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFldIowfrJ653K9gCu0mHI91kOiUarAyRgT6eE+Z+0B++7ZrVc
	S3flBCvEuXXomqn8VqVX2Rt+OMlfa7HFUTrDOkOnGw0o860jKSMBT9F6
X-Gm-Gg: AYBFou2hvkA9xOcCaAvNxZm9aQbYh+HBgQlE/2cXIKm/2oM0Pq8yULwRIuxdWcMcpBA
	1LuSr8Qu6RfVsOWv3KQfyV0vx/en2nqs8HwVY6j6M97ZKXjYya3WHaZNznnwnkpYIuJtAXSA1J1
	JMFNE2kHxpNMNdb9cD9XK452d3X9fBZC7Bp8hyrLFTUGSASI85Dw1hhfIRAswKGSPtHv+QTGWwc
	REYaUOAdjfK+fkhBSgqmv18HdStc3N6jUDqeO9Qtvs2CWF+cBvFJ7AkgX+vPzzzXvPeqd4yHy56
	l80Kgy/HwLiD68tL2xSN38G6iTnUS4CHD4HXAGhQti7Xz8F8QMMHm+3Krg7YQdlZ/Z1FPtakIic
	lP8q9Dj9nNKb4XVJ9+WfPgI6W5iKECJuXSrD+IX7DuD59182Jt/JgcYMRwM3FCcRdNpOK5GvTXC
	b7sJlqvNLw8tmzvbWnogbHiUauOOJ/Melm5JYLRDGVzxZ6LYno26Ay4j2V3Qf+6Qz2pfqHXtg=
X-Received: by 2002:a05:701b:4308:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-18511ad8bacmr5174627c88.13.1792257467699;
        Sat, 17 Oct 2026 10:17:47 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45a:263c::3cf:8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm24518865c88.11.2026.10.17.10.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:17:47 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a2e50fb40695811c2dab@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH] greybus: operation: arm the timeout timer before sending the request
Date: Sun, 18 Oct 2026 00:17:43 +0700
Message-ID: <20261017171743.24612-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_operation_request_send() sends the request message and only then arms
the operation timer. The host driver can complete the operation before
add_timer() runs, e.g. when the transfer fails right away. The completion
work then calls timer_delete_sync() on a timer that is not armed yet,
the synchronous caller wakes up and drops the last reference, and
the operation is freed while the timer is still pending:

  ODEBUG: free active (active state 0) object type: timer_list
          hint: gb_operation_timeout+0x0/0xc0
  WARNING: lib/debugobjects.c:629 at debug_print_object+0x198/0x2b0
   kmem_cache_free+0xfd/0x6d0
   gb_operation_sync_timeout+0x1c7/0x270
   gb_svc_process_deferred_request+0x5f3/0x1150

Arm the timer before the message is sent. If sending fails, delete the
timer again. If it has already fired, its work is queued and drops the
active and operation references itself, so the error path must not drop
them a second time.

Fixes: dbec27298b0d ("staging: greybus: operation: add generic timeout support")
Cc: stable@vger.kernel.org
Reported-by: syzbot+a2e50fb40695811c2dab@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a2e50fb40695811c2dab
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/greybus/operation.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd60..19b0cdeca498 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -766,17 +766,22 @@ int gb_operation_request_send(struct gb_operation *operation,
 	if (ret)
 		goto err_put;
 
-	ret = gb_message_send(operation->request, gfp);
-	if (ret)
-		goto err_put_active;
-
+	/* Arm before sending, as the response may complete the operation at once. */
 	if (timeout) {
 		operation->timer.expires = jiffies + msecs_to_jiffies(timeout);
 		add_timer(&operation->timer);
 	}
 
+	ret = gb_message_send(operation->request, gfp);
+	if (ret)
+		goto err_del_timer;
+
 	return 0;
 
+err_del_timer:
+	/* A timer that already fired has queued work which drops our references. */
+	if (timeout && !timer_delete_sync(&operation->timer))
+		return ret;
 err_put_active:
 	gb_operation_put_active(operation);
 err_put:
-- 
2.43.0

