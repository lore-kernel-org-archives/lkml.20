Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE8F35C6B4
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789828842; cv=none; b=QdPoQVyZ4q+Ocz+EykAL/Ar3aLmsLpuZMfjRH74yY4I90qauk8NTKXhPkxgtlyoAmkthmFl2rwAnPxWlVDQzib+kdLUmbFBZC5gnzDbGJ25GDgrAb8Eurb0gmpcMS8BXsxohNfF2E0MC0UAKDr3WYXcqvYBFcwpY5AzuZVMP+og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789828842; c=relaxed/simple;
	bh=mLnArDqYAL1ntffXjM4958AzFGRsCn0t9y9yelbJeFI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fNOfcJzGYNLYMJcq7WjH/P7tOm3AeHw5Qk49AgVyXtHTRHWbogO7KlVBrFOj33Kd1Sqm0nOVHe1QSBmzexETvkNPPwCC7etWPyiswex7sxgJTB5SDjGef5pEm888HIDCoSUHZy9aqc5CKHbq0/uvEuG+HTwuiGdcdN/POq1hxiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4Vl35k6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4Vl35k6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso14319935e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789828839; x=1790433639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgN7nWScW5BJSzPdYvBki0LAnthq6w0fiY8IXN8fGAk=;
        b=W4Vl35k6Y7uzGORNci/uYaOMbP8wi/KEtO0+PGENC/sCWcF3dJA8pA9Rpytdsl5kbE
         Y2gCDY/As+1+uW0t5GvCMIWvUIdDkmuR19GePAmmUDZOGSkN73fPUdQK7lNQcnhL/7Qh
         TG+HBXLaTlxy/VHK8zcPyTV/gtDcqvYddsp/+8gGcmmpW5oS5T9+ShCMmaDYivUlLyYq
         mmSEjoex42DuLPjVT0OoZNHfIezhf5pnmEIx4ime93ccUoG1WG4UWfp/Z0GLcemGHJKS
         674PE3jnOeCdgJdvG9AVv/lUrAiWWnEwnOiYi9yle+qymKrH6GwxDiTdxfPUBqO39deQ
         Y+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789828839; x=1790433639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgN7nWScW5BJSzPdYvBki0LAnthq6w0fiY8IXN8fGAk=;
        b=dX7h3rymC7XYY4zDZTD3hQe9yy8lgzP3a3hoFqo3BbUcwHDBro3FfsupYxW3aUMgn0
         cWZ3QQUOeJx9+5phv5Pynd9LQEuQrvalVP6IcuATHVD14DcruWy1AED4eHD+NuVibFjZ
         URo/XQIFuakOvRu7WbBPbKrCaL7FrwIWCb7iiORHBMnShYodVGEJZA8NQDS2TMf/mU7Y
         bQ4mEKBWz4SKL+/wKFjMoM8OLcv0FgJETy9LS4fMSsk2vBM3fJSgs/NNdR93NfW4ygHW
         dNuBHnVb2nz7MnYWICNB++akirymWB97PzgJf2OyhIiS6JwIxQMIC9+h/vQHPnxD1TWS
         yEvA==
X-Forwarded-Encrypted: i=1; AKwUvBxMvznR5HHxt1qDoAohzK0PKvFET8z5B7rNpfHrZMQlaOxUifOJb1ZA36NYRdzZz6Tj5Z6bZG3aS0ZCXLU=@vger.kernel.org
X-Gm-Message-State: AFuF++m+Ef82rLnXIx2KxdM82xOWXA+UdE4q6ykGei+DLz9clzqYWVdy
	yWCr+PS5TVZ3Gy06YRNJS3YBwGm8ufWCu6+iLh1KT+P84e/UrbcVdehPdM3mjfac
X-Gm-Gg: AYBFou36KeWbOMTuyFEYy3hKYo0wXn43e3r3DbdrTayY2sKYz/6evhYzXrcGcrR9PdX
	JOp3iCDEzEKyQL6s3Ns33J/W/zclWhfHaaJoezVQGVFpUP3Z4BCB0zmevV+g3fyY+J5QyMGxrkc
	1md3YdryskpWpd7XVZ7SdoY3ogyjafarM5imHCumAIP8d9/XpNcjZ8hQqsQ4cnc5I2O9WVEPVfC
	NZjj4kDfN9XzNPRP23u/n9TNDNAya2pwEAybSQtRu/fnVa34uoiomrV7rQTxPVnNYXmoQwKVJJe
	Dci/Ts68Mw1pZs5t+nMnLWPKrS6pNAaEzkA0l5AxRJvMqz+Ec20uJ08B08RwlTtzv2WxAVbhzRl
	SYo7ehtLPw6eURuR5dv8Q7CdJ8a8QXzqce3jtwoKS3aMrBGmkaeuGIFiL2JHzbS/882UX/VqbIt
	nGasCWWv1e2tQTsT1SBiBsEQZZ2/rZzRp16SH4PPOD0gBN7PG7neRunIUMouwmsSTwK5vZtUesn
	t6kTkkJ+rvhQTyAPBgYgcL9OFUyHuJFfRxpTmeVYn6WUgGIogH1EJgQde+raDSRhCXESMBuzYwL
	7dVGRmLlTgPSVtZ1K3I5DJG5Z5ASm91g0H3lVo4etF7GE8mhSjq/O4do3xlMGondF04wbkG1cnp
	A
X-Received: by 2002:a05:600c:138f:b0:49f:bbab:aa10 with SMTP id 5b1f17b1804b1-49fc5741672mr73100745e9.20.1789828839005;
        Sat, 19 Sep 2026 07:40:39 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd12ad97sm84083545e9.13.2026.09.19.07.40.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 07:40:38 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hrtimer: Use the mask to clear TIF_HRTIMER_REARM from the exit work
Date: Sat, 19 Sep 2026 16:40:27 +0200
Message-Id: <20260919144027.70250-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hrtimer_rearm_deferred_user_irq() removes the rearm bit from the local
copy of the TIF work with:

	*tif_work &= ~TIF_HRTIMER_REARM;

TIF_HRTIMER_REARM is the bit number (12), not the mask. That clears
TIF_NOTIFY_SIGNAL (bit 2) and TIF_MEMDIE (bit 3) from the copy and
leaves bit 12 set.

So the function never returns true, and the copy handed to
exit_to_user_mode_loop() lacks TIF_NOTIFY_SIGNAL. If that was the only
work for the loop, the task returns to user space with the task work
still pending. hrtimer_interrupt() sets TIF_HRTIMER_REARM every time,
so the next tick repeats that. Task work queued with TWA_SIGNAL from a
hrtimer callback stays pending until the task does a syscall, takes an
interrupt without deferred rearm or has to reschedule.

A task which polls the io_uring completion ring in user space sees a
timeout completion after 30ms (median) instead of 70us. 2 CPU QEMU
guest, HZ=1000.

Use the mask.

Fixes: 15dd3a948855 ("hrtimer: Push reprogramming timers into the interrupt return path")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/hrtimer_rearm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hrtimer_rearm.h b/include/linux/hrtimer_rearm.h
index 17a81826bd9a9..12e42721c8e01 100644
--- a/include/linux/hrtimer_rearm.h
+++ b/include/linux/hrtimer_rearm.h
@@ -45,7 +45,7 @@ hrtimer_rearm_deferred_user_irq(unsigned long *tif_work, const unsigned long tif
 		clear_thread_flag(TIF_HRTIMER_REARM);
 		__hrtimer_rearm_deferred();
 		/* Don't go into the loop if HRTIMER_REARM was the only flag */
-		*tif_work &= ~TIF_HRTIMER_REARM;
+		*tif_work &= ~_TIF_HRTIMER_REARM;
 		return !*tif_work;
 	}
 	return false;

base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
-- 
2.53.0

