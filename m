Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792649421;
	b=xmXLmkGZN0S6kFrzN3eE75c7LplOtjDiNWu5AjrXHm6RHWv76WPEPtPl1kk5yMr9LT8K
	 m0M34zqrm5r3kQ2/N4hSBsJSlFQwRWFZZWIKo7w2xA8SGT+XjL7JMMw1c9GKjcwWnEf2d
	 ii4TJ+xZX2ox6/+mCiZdfZ5dv7WaaX+bi5RBFFxrkGNap5k7Ur+T6aATddbyLYUlog7tA
	 yO+D+u9L+hMi8CqmF2cy49ZeYQxXGaW4QwK5Mj74gWdTvClPhKt7PC5bkuEU3GZcvLLjh
	 4WPwBgVkfLfgu4RVAqx2U5gMcjiYtz4gP4mbZpABgxV4rQgCg8E95eSgC4sNo/bouDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KvKvyltRiP4Ke/z2dntLyy0kgAM4HVdxfr5LeScNCoI=;
	b=AZBhE8bYlkLo3NEWI+VaZAaqkzpeHSVR2J5QFAPQjGT9OO0vX9pYSDjGKH3QhQ7ZUVMY
	 9zU6GE55xa2BJQpVKjWgTNciSakzDSI/jVrCtC7rppiDr55NyP6FYR+mA1BySv6u8C5Nx
	 8XOVP9PG1y4jsnEF73s05owQvHBZvJTnNPZttCyl7yLYNEuDEQFtQhJiFZ4Dncn4rk0ME
	 WLF77wCOtbdU45U3j6TFQs2vjvPoR57aCnKBQz0wntmpTFvGVRa5ecT05EtgY1Bt+eZHV
	 9APGLN0M+hfF7b4x7iyDrYQKbWMqFV7gMwvXOYQUxaeANAMyEtQpXgqFq3D9ZUxiLIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NUBhU2XD;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03213606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03213606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NUBhU2XD
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df54150dfso875062f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792649419; x=1793254219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KvKvyltRiP4Ke/z2dntLyy0kgAM4HVdxfr5LeScNCoI=;
        b=NUBhU2XDFa5V1S7OC3k8AVAmDThd4OvTos+jPDdK/XSUeYCYNXJFQFl4lzQhbPWtBk
         vTXLBjWcH6lO+KRdgZhf/kcZ6rfejKNOVdWticrTXFVBda/vX159DeQkGXo4Y0BLzfby
         ylHFliK5tJaBLX97p0NJgtAq1NGjs9I0Kp/j48RZNjkFViGb0W6aKB67TxfMIP4+hMNb
         vc0dQU8Sn0SEqlst1MUimN8qaexz0jFk1KY+61GY1s2g0Sws04pzbn1t5tQ66T8x14ma
         lMX5EdGfUXGnt5LoyA/PT5ucR/gjllwYrZ4/1QRFgPLzIAKDVAaA5rZ+BPH9bq2axZae
         Ejfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792649419; x=1793254219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvKvyltRiP4Ke/z2dntLyy0kgAM4HVdxfr5LeScNCoI=;
        b=Yt9yOnxDHrQSxZqpl3K2g82v/QMnWJNqLjn7RGsKDEYq4n1uL9LQFmlWB0CBijpMNd
         OFy8YnOWGS/e0OU/2lO0uTgLXTXZMGOuD3RKG1nKNx3QewKYZ0wChCPQIzrvdPZrt0zu
         V2Ma9X1g2l9n2szJI6LdZHyUDb6UjJDK3DqaeK6BKfJR1wFiDO029WcmKa3UlTSe1QQx
         VRCRSjdKqn7p/mbeaYjcjF+8Qaap5/rtBgDLk4ZxTL0cBeGaUmSKN2iBoOZrcUFVUd99
         URLiY68ZFlA3+KOry5CK4mfWQ/lJ0NTfQVIHYdzRvznarRQW73i2XXtZ5msPTLZXLsE3
         nXuw==
X-Forwarded-Encrypted: i=1; AKwUvBx4kq/69jBf6jdikKQkOIuzj5n3FHYMGKtTYKwXMasSii6F8U4zjfzTEE0FbjMR/ZvMITgZYtCQWWre1dY=@vger.kernel.org
X-Gm-Message-State: AFq9FYILBqfkqWxCiLhoDf9LMxiQxq4490q9JV17s1cr62uDOJO0qdCL
	9MN/iFoc5vmrnR+ws6AHq65PnP40y3XA5yn3wI6TY6AKO5idoRNdGWTH
X-Gm-Gg: AYBFou0fgV/SIwA+J6OPLJ/PKMlKmCPSonq0hcMx6VparYT5QV19QCTQ+CShCiOQkVS
	1kYjusz1rx/WZUQwjuWY8PkHJhkjIYJIYrfS0o1/UwtY2d37juqQ0Bd4t79zHm4VyST4bnSSxpD
	OVoqjxZT222NrdPlUhixOPMoGEsglUwA1OJZ4y2feOhgu6wj5RUeccTYcCGXpgBB1UUWsVOf4u3
	btc2pWMC+GwqcUeoIP4d6XK0mXR2IvAhdH2YfPm/WXOreas7felRpxd/DFv//9K2Bx3hgG0rzFW
	QWZJLWJVnz6i1dGjRsTjOUtunpu2LBV+ao+rJznvTJQfNUDLaLcyyPWZtiftLmaD0s2yXxGYMtD
	LzdLImWQfd7Qb8yUv+fTnGxXIadEM+Kgz5OyKT5g9GcEIlBhu5akhCyVTAlD+Y1Q1kr0jLlKyY5
	q/IGW0TsuMEhyvoaGArhob6v+DC1dWf7IP0E30MdnHX8qx7LUSzdRVQrSR3NtF3a2PvQl5K7gfq
	uFgvpYycAnD1t1jEb2BQ7VCLCZRmxmteWVzyBIer3D7THsBY+R1VVPp9sFMD2esnPNBEL2jhcwF
	VCMGY5Pfz1Y+l2ownA==
X-Received: by 2002:a05:6000:200c:b0:48a:f8fb:cd49 with SMTP id ffacd0b85a97d-48e264d53efmr9159596f8f.22.1792649419117;
        Wed, 21 Oct 2026 23:10:19 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:2fac:694b:933a:abb0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583f25asm9906898f8f.45.2026.10.21.23.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:10:18 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2] signal: respect the blocked mask in dequeue_synchronous_signal()
Date: Thu, 22 Oct 2026 09:10:15 +0300
Message-ID: <20261022061015.3737924-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

dequeue_synchronous_signal() uses the signal number and a positive
si_code to identify synchronous signals. An ordinarily queued
signal can also match this heuristic.

The initial pending-mask check only establishes that an unblocked
signal in SYNCHRONOUS_MASK is pending. The queue scan can select a
different blocked signal matching the heuristic and deliver it
despite its mask.

For example, a thread can block SIGSEGV and queue it to itself with
a positive si_code using rt_tgsigqueueinfo(). An unblocked SIGTRAP
then allows the scan to select the blocked SIGSEGV.

Check each candidate against the blocked mask. Genuine forced faults
are unblocked by force_sig_info_to_task() when necessary.

Fixes: 7146db3317c6 ("signal: Better detection of synchronous signals")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

Reproduced by blocking SIGSEGV, queuing a positive-code SIGSEGV
with rt_tgsigqueueinfo(), then triggering an unblocked SIGTRAP.
Without the fix, SIGSEGV was delivered while still blocked.

Tested unpatched and patched kernels under QEMU on UP x86-64, with
test processes running as UID/GID 1000. The unpatched kernel passed
21/38 checks and the patched kernel passed 38/38.

These results are from the original patch base. The rebased v2 has
not been runtime-tested separately.

Changes in v2:
- Restore the original queue-scan comment following Eric's feedback.
- Clarify that ordinarily queued signals can match the
  synchronous-signal heuristic.
- Rebase onto current mainline.

 kernel/signal.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index cb6ec7054eee..7e690f4fb5bc 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -689,7 +689,8 @@ static int dequeue_synchronous_signal(kernel_siginfo_t *info)
 	list_for_each_entry(q, &pending->list, list) {
 		/* Synchronous signals have a positive si_code */
 		if ((q->info.si_code > SI_USER) &&
-		    (sigmask(q->info.si_signo) & SYNCHRONOUS_MASK)) {
+		    (sigmask(q->info.si_signo) & SYNCHRONOUS_MASK) &&
+		    !sigismember(&tsk->blocked, q->info.si_signo)) {
 			sync = q;
 			goto next;
 		}

base-commit: 4403278e4ea2f654f8130a5c03eb8b4516a0f201
-- 
2.43.0

