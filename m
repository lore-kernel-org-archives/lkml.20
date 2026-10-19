Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF6044D020
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414546; cv=none; b=ooYJJnioJ7ASjX09Y/wPVCZd+DzTjIkCP9wv8LQ4NxuKaWcvUOx63a8fJVv7qMFK+ik0idnX1ZuBkX4crGKMuJOwiVGahTsyeNzAtHSvQF0YALY3vzV6LIgOn/nTECmMGg9RSdpFCgR+4gJTQAt6dWydOZB3pcFFrLRywQlygzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414546; c=relaxed/simple;
	bh=V+hQCe8wq71h7sYDfEQ0xdrVW9SKws0wJ1GVDHpJzKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TCL+hzqTBs0xjDb3dP3dFtnqYV8BsUFMwsKc6ZYYCAImXRdzQcz8KSMPJJvMCr2Aoovwy6/6ztwSGRnyap/LWn0lo/6YTVp9YS4udIxwnaKfnQlhZc5IghiC4EiGlTZzbNi6JK25Ct3LkRn5SYcoj7KLcsIBqB3jt8DBiGu85Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POZyB+Ee; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POZyB+Ee"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14fd9dafb0dso222654c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792414544; x=1793019344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhYB8OWrSiu0aZgB/NBRTuM36QWQSaDbi30LsYAq7Sk=;
        b=POZyB+EeCDc8fEZROzQFHqzWCbN4Mlnaa52WaNbVOuDcijDPsPDVClZpAFjNBIz/+p
         Ok4vwkc1liHheXbUIImFeU+86hSOYsyRniQg1yKlNPqms/D/5Zl42KCIIqUx4irxneRn
         XXhoh6b+G2ljcMxL3N6r5WtiyCgIwiFOfNhuaAv3gXLGF7k4QQtqOtrSQ8V4VcHNkLWU
         5PGxceFwTPNhf6KQoM8vAHBEhvYT0K+97a597tqlyN7jEk7UQuaADwIE7zPsxz5/SrKQ
         98RhgiXLWkQjbZOPNlCobITIaVXvEfofHR6eWegyOwDGIa6nrqLMraqZBEfXjZ+QwxS/
         AkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414544; x=1793019344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhYB8OWrSiu0aZgB/NBRTuM36QWQSaDbi30LsYAq7Sk=;
        b=NXFpyQQy3a0LPzhCN+98JiIbY4gF1q6PqtILOGN7CrokBPbLmhyUU8TqAojOPgmIXa
         kM/YTKxGAp9iO3oU1fpdgaMMhDhEl0abHG7Nx64ep2bht/SGYPe0cZNlNuQ0pRpCiGak
         dKyMPrYH+bp2sOGWDV04ZhB3J+ZSpUcklFGti0TCXeX1aCZMcBvaXS8CqwezzVWJx9nV
         PKtXT2iOXPu9QBI1B771c5MxfH+uF77FNm95vVhVw+TNeeiqahqF7FYMOIzPZKXhAhmD
         BNxmP5+GdkUKU6T5tKizTccnj5BJgBhu5e8Goz85bXa4iqWx9KbP4zfRLD/GUsqv46OZ
         qtnw==
X-Forwarded-Encrypted: i=1; AKwUvBxtCVYhyGEpcGA68qaB4LEPCQLmS3jWpyGHlYwn3mx3sPqkLP1/u1UhIDJP1kvFaAtBh3hS7mWnS3GlZf8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRtAhomSGtiHzYXTAlNcspk8yj1AwUVW3zmWfuW4CvSzoryCfZ
	ps6Z3O1LIy/hfn3h+nF6tj0/VdaVTIXG9/w4i2AAbaeSUxNyKsU+LDr9
X-Gm-Gg: AYBFou2TrMNrbfccwQKeaorXkedrByLy9IBiUG8Q4OlfR/NIl3pcEZXnZRMR+5Z3xmg
	uhW5e6Ibdz1ROA2GLj5cyghGOH/8p3Zi7YWnPcxFtwgshrM63ut053PhHJuhO+hM/dSmNUIYjLy
	kqwGPPCeYPqkSH3HnjUMsD6mt+0K65KKulFrdP/lx8bW5m++47c3GdZ45hQEaliDzMpVBzWbu2S
	74X+yFhhDaLDRs76cH+YeoQ9xMGQa7vl8kTyTDSZZabHdEZBnVyb0BGXi6/jvGI3AgYWpVPIoaC
	kznbDEVhhlqsiz8Uq3EOS/oNWsVuMAfduniBztMhkAjadrQM1YBz6TMeSIIWyiriUWo9RZmpRCI
	o0LuynOlRjv5YEclkLPzM9giGE/7xPob7ksqw7vVWEgnalGTvXJYt5btiCpisLdtnlLhZIKkGvX
	Skvq2BFkQx/emP3TAGClhrLQQXXkxojr/25FCVYNFokOWL18H3uVgOxHbK44krYpnlrCn5ww==
X-Received: by 2002:a05:701b:458e:10b0:151:5d01:9316 with SMTP id a92af1059eb24-18512f1d08bmr11058121c88.23.1792414544393;
        Mon, 19 Oct 2026 05:55:44 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7a80:50::3cf:67])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm27988120c88.5.2026.10.19.05.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:55:43 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a2e50fb40695811c2dab@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH v3] greybus: operation: close the race between completion and arming the timer
Date: Mon, 19 Oct 2026 19:55:38 +0700
Message-ID: <20261019125538.20451-1-ngocthang2710.1999@gmail.com>
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
the synchronous caller returns and drops the last reference, and the
operation is freed while the timer is pending:

  ODEBUG: free active (active state 0) object type: timer_list
          hint: gb_operation_timeout+0x0/0xc0
  WARNING: lib/debugobjects.c:629 at debug_print_object+0x198/0x2b0
   kmem_cache_free+0xfd/0x6d0
   gb_operation_sync_timeout+0x1c7/0x270
   gb_svc_process_deferred_request+0x5f3/0x1150

Keep sending the request first, so a request that is cancelled or times
out is always one that has been submitted. Instead, hold an extra
reference until the timer is armed, and delete the timer again if the
operation has completed by then, since the completion work could not
have seen it.

Fixes: dbec27298b0d ("staging: greybus: operation: add generic timeout support")
Cc: stable@vger.kernel.org
Reported-by: syzbot+a2e50fb40695811c2dab@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a2e50fb40695811c2dab
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Changes in v3 (after Johan's review):
- Do not reorder send and add_timer, so a cancelled or timed-out request
  has always been submitted. Hold an extra reference until the timer is
  armed and delete the timer if the operation already completed.
- Retested with the syzbot C reproducer in QEMU (DEBUG_OBJECTS_TIMERS):
  5 ODEBUG warnings per run before, none in 3/3 runs after.
- v1/v2 armed the timer before sending the message and are dropped.

 drivers/greybus/operation.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd60..f3a65e693133 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -766,18 +766,28 @@ int gb_operation_request_send(struct gb_operation *operation,
 	if (ret)
 		goto err_put;
 
+	/* The completion can drop the other references before the timer is armed. */
+	gb_operation_get(operation);
+
 	ret = gb_message_send(operation->request, gfp);
 	if (ret)
-		goto err_put_active;
+		goto err_put_send;
 
 	if (timeout) {
 		operation->timer.expires = jiffies + msecs_to_jiffies(timeout);
 		add_timer(&operation->timer);
+
+		/* A completion that already ran did not see the timer. */
+		smp_mb();
+		if (READ_ONCE(operation->errno) != -EINPROGRESS)
+			timer_delete_sync(&operation->timer);
 	}
+	gb_operation_put(operation);
 
 	return 0;
 
-err_put_active:
+err_put_send:
+	gb_operation_put(operation);
 	gb_operation_put_active(operation);
 err_put:
 	gb_operation_put(operation);
-- 
2.43.0

