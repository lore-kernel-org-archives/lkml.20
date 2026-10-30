Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793344049;
	b=sFUYNWOfJuo0xHK9bozHGn02zo0yq6zMXDwd56j3MmtBOxULCjdMEy0XFSL/VNs4EeRV
	 56dBtf+VCicMRu+CZA05S3W+nLIaJNqROZNM2xHWMNmJd+mJCehYyhXGmCGY7vBmMBxKs
	 psyW21kiFdf/0jThGHFZZqsDVCIakMuLbQWohpq1j/HmE6YSW4WAgb6VuTT7z/rpPpU6P
	 A3E63nN1hJ+BQg2gbOLUDi3ie0SfB2x2hIcRPmCP1dlXKbruzd0iWDew6AIQyUkQcEVx+
	 B+eOZNPZxcHt+RUCruYu02qiRpGlmUanrzwfWB9/IrbBzONBAosyQnVaWImpBgbrCyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793344049;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RGnwldQVZzVAoZ1qlLODNLMQJM0GYwGMzdcDtHz91sE=;
	b=ZSNAdKC8O0IZbbVhy1PEwpuhucMp633Ej1IEebl8OqSNuRbTX81ujLI2pUE0ZffEyPx8
	 iETKuGCKF+LAWkFJTX0gRbi9RJtzX2IUCkGK8GPe6trqWcAMWoNfd+G0CBYrnSDedBU3j
	 /5ftjpvtazUwv2qXGaf5jlG9xC/jLQCL4NDsosTTZzqIZKDlmKBYP1y1KQHJHydn94OF9
	 zKL9kVnluKgdY0E4PWrHWO/A3U7KuSSuIn4GqD3fF5azPYI9i1iwlEsibPNxZysF97GdQ
	 Lz4Lct0RfnYg3elxWbIE6k85ax3fPs+kUhDiqdmMDHaUAjciy9pgCZUBmx8caM+xRHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRHdc5IO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AEC606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRHdc5IO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793344048;
	b=M4gQ2HroXW7elkYwmQuddx5AFpVFnMEn5jAX5dWubCgNsqUQkUsQoTxU/B1PNitN6lZu
	 iUpS2SnVt4VOjahAhPIuhUgPeHeeKJWmkYuJI9MIHIXS4eNz2howAB+unpyFXqbTHwzjF
	 CEIeolyCnM21BAWiV/6xLl7e2h7PVoFBtN/CgGjzdtjk/4dU2usXN69dzPPx4nj7CZqNA
	 xarMLRhTPzK1/S8JU/HzHuoxwUpNhFPYalQHgEwabnPLfMcufm1mdV0wAWHx+sDNaJjYf
	 jVI7zNgV741k34BJ1LdMXzCmM1CMiHO8PiAQVx7afyEqH3M/l7Ia7bzY4JVvFbWOtVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793344048;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RGnwldQVZzVAoZ1qlLODNLMQJM0GYwGMzdcDtHz91sE=;
	b=0Ur2jm9nOUwIor+OnBMr9qirSeeQJYShGBehK3qgnl2x3s8/VF2kxtbEAn/ylOq64D/7
	 emWbl10GEGzs4xo5h8OhYc7C4OJxuqHGBSB16l7mSeZRmBf0JCx43SO7tKaIwkuXP66kB
	 6HgqemUpTMJV/J+742kQ1F+AAo9PaOhWUDl6CFC+xBSjtPMUbYsY50+/Ddxjmm0p4tP68
	 3qP4vLhEzNM12jg/oV4WA2/rTLwfgIGJ9qNA8AFUgd6LAncGpWyPRriN/ge+9WADE/Z0M
	 EAvuPFvtsJfbih9PLDmmS42urhG6q8whdi6adRnwR5pOeGcwDp3/uQE1nH8cfrpkJAA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62C8C1F000C1;
	Fri, 30 Oct 2026 07:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793344048;
	bh=RGnwldQVZzVAoZ1qlLODNLMQJM0GYwGMzdcDtHz91sE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=lRHdc5IOoHZlSaVnX4+vt/7CZZs7NtdNrjx07TUZINXqfS8anZw2hK/eFp0/1IkS8
	 fPRIQTL2bKaRPclpsrjo46tiFGLTiYZjrKGenF/haWIYTpsinJL0tPKDgEWBERTOKq
	 xINRJHgiuCwkubqilDHvMtMldaT9ogXey9U+mHFgUTMb4pHQe5auWA1Ma5PLPY8o7b
	 9dFuOoFmZKhfo7bTC5ME37h6n/zrTfIJ9/hq1aA+JrIKF8Cvn+V9VigOmuNHkDUBVD
	 lE8GCfycOg0N7qLUV5vJM0/ednfihY2Vzgcg9JtIgJ0ndotNGIMji/4DoEA1HyFksC
	 Iwx6yIrSmj1Dg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B37D8436A4;
	Fri, 30 Oct 2026 07:07:27 +0000 (UTC)
From: Zhuangzhuang Wang via B4 Relay <devnull+3050681779.qq.com@kernel.org>
Date: Fri, 30 Oct 2026 07:07:27 +0000
Subject: [PATCH] lockdep: Fix inverted "on"/"last" CPU label in
 lockdep_print_held_locks()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261030-lockdep-fix-cpu-label-v1-1-96875c74b15b@qq.com>
X-B4-Tracking: v=1; b=H4sIAC5C5GoC/yXM0QqCQBCF4VeRuW5Ah0rsVaILdzzp6KLLrkYgv
 ntbXX5wzr9TQjQkuhU7Rbws2TJnVKeCdGjnHmxdNkkp16qUhv2iU4fAT3uzho196+C5UbhLLYD
 UZ8rfEJEHv+798Xfa3AhdvzE6jg+pTO7WeQAAAA==
X-Change-ID: 20261029-lockdep-fix-cpu-label-9ceb572ee274
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, Zhuangzhuang Wang <3050681779@qq.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793344047; l=1377;
 i=3050681779@qq.com; s=20261029; h=from:subject:message-id;
 bh=6Z2toOrr1MZMaiNJqhLdHt3xNCky5kA9I29By0W/ZlE=;
 b=CAy+zFL/ckUOr2YxzunyS7eycpsvoOZAMBZCb084iD2TVJxDWfxmE4fNoMkCnl0KPBRMMVG8G
 EiFFr+8dc2RCkhFgV4rL9H08ZzxBSYjgRoCWm4rsugs8BD4hKg5xkGE
X-Developer-Key: i=3050681779@qq.com; a=ed25519;
 pk=oGgMbb1S6zGzNgE2ItK2PWjTk3iITWtu91CA5G5Czuw=
X-Endpoint-Received: by B4 Relay for 3050681779@qq.com/20261029 with
 auth_id=1350
X-Original-From: Zhuangzhuang Wang <3050681779@qq.com>
Reply-To: 3050681779@qq.com
Content-Transfer-Encoding: 7bit

From: Zhuangzhuang Wang <3050681779@qq.com>

Commit 051f5d223dfc ("lockdep: Enable the printing of held locks of
remote running tasks and print task CPU") added the task's CPU to the
"locks held by" line. As the comment above the printk() describes, a
running task should be reported as "on CPU#N" and a task that is not
running as "last CPU#N". The ternary has the two strings swapped, so
the labels are inverted.

Swap the strings so the output matches the comment.

Fixes: 051f5d223dfc ("lockdep: Enable the printing of held locks of remote running tasks and print task CPU")
Signed-off-by: Zhuangzhuang Wang <3050681779@qq.com>
---
 kernel/locking/lockdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c3dc84a7c..fdae495bf 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -811,7 +811,7 @@ static void lockdep_print_held_locks(struct task_struct *p)
 	 */
 	printk("locks held by %s/%d: %d, %s CPU#%d%s\n",
 		p->comm, task_pid_nr(p), depth,
-		task_is_running(p) ? "last" : "on", task_cpu(p),
+		task_is_running(p) ? "on" : "last", task_cpu(p),
 		depth > 0 ? ":" : "");
 
 	for (i = 0; i < depth; i++) {

---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261029-lockdep-fix-cpu-label-9ceb572ee274

Best regards,
--  
Zhuangzhuang Wang <3050681779@qq.com>


