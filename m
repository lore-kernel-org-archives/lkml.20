Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2056C2DFA3A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790527485; cv=none; b=CGnhbL7F6XOM65aixqvHe0HPT1u3w+JAkcRz+CaNInnwceymi5iFTyVgWDkE+Ezry7aLoysJpStZ3KXYEsTX37EjwtRFH4+eJY0/Z9Byk4gLs5vT5gVELkZden6zjbzAvCqgQuCemzg7kLTVkZO+f986KLr32V6oUt+ZWJFk+oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790527485; c=relaxed/simple;
	bh=XMexBVhRhaoQxvYVaRyTdcI/Gtw5OgloD35RljlCZ58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Weq3N7AadKG8h4stTElfLbwYIOSYHpBXpQqVcxlY705tqkxRZuu8GWm88y6Ry1Y6V+GaeUkVe6YBzGFzaWuTgq4fztfxI2Je6DW7u1fJUekfsV53//MizbOwEX+ehYmccofQK6VJf/wUfsVMaVieoS431smPRN5LPkqV9Q0kpJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgPJMl/s; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgPJMl/s"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e93611e7so2235518e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790527479; x=1791132279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dv/smFAyNI+/T4zmB6bAUmDWj4koE82HeZ/XI0Xh8LE=;
        b=DgPJMl/sTtCSDJIFgNvLATBQmpU6f5TXvhlOejdyhM6utVFN7QFcbT8lez5GoCcO/5
         kbL5CIc2ez7DmyrJS5a67DEsNY0EyDelDK3tpp7d0RkOi2VMvM2Eg0NMz4B0a0GAO6xX
         X6AESzrCw8Ogp6OPPciIHG0wFCax1pK4PrEsnckIlYJ2UUJq4OTbrVMsxvyHKhSIr97A
         3ZSsa5ABPZYWBpW6krK9Vsz/LL/kG6zRYS5UK5WVJ7w6tg+qMwq2j6E8j129PlKlz4eP
         2iONaLLamrfJFBOPl5Lr+vVkZkN+zgd5OVkJGslyrjcpitxs40YS35R5j7eRk8Reky7c
         Ghfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527479; x=1791132279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dv/smFAyNI+/T4zmB6bAUmDWj4koE82HeZ/XI0Xh8LE=;
        b=TxygmIBqEaS7Mja5z0NeO5QpAVfsU+ApeJmlwSf1+Vu53Fle/ucLz987A9YPkdLW3r
         8X4wqoDsNsoFrgkgiKEXPbjMZuo5k0c/jXePoabV8IXhfPHtTezNu8i0pVF9CFnje5vx
         XuVCbTXvFckVCMGzYC76SbPUZiasR45Zxydf6u3cxY3ewLHVYWo2vdTzPX2HfxT4I3da
         yLuhDj0bNY1H+AOHo40qLFfREF8cnoeccOt4zS9iITlh88nEbRrWA93qCxJYJwksbxQF
         xovT6mgVahIZa8q01zX4mCf33cjTIC7aqhQLBh0NaNXp31b7bN47WJlY8ICaZ6m0LEZl
         wJNA==
X-Gm-Message-State: AFq9FYJ0AkMF3vjcmjEZkevPslJvxYqLfa8EciCwAIIS9E9vgfKEjgli
	zvoaBDxw8HcNvtyRAo/ePUUT+A+mqiIEw1GzT9x42nNkNR5dLMQMHJf/w3M09kNN
X-Gm-Gg: AYBFou23Mnre60srvLV+vxZX90f7MIO3perWX73APXce1E5OnNvMuP71LneZmqDR9eW
	wIvYgglb9qr8608m8SvOpJMXW1920+imVeQUmtuPTM9cKOecgjk5TXFH2nyPzmdXbZHXHlGarmC
	jPg2cEi6ZVgTnPxF92EGwIAHVfttMxQxCrnoKotsKC2bb586yliAQl0VM5VX4rSNdMaaMHYZNJq
	YLi5tX0OSCTzOJQWmbEo5ONk4YUnYg4GzjdDhor9fZUwzQnGXj0IQxGPFzbK5L3qLAISbQJKfwL
	+Dh3sq+504KqqJmD3WVTeGgykuPbg6XSNM/P6V4+mvyAGGtRYF2Ox+e5jH7OtdFok6ni3IGIg4Z
	j8J2kalPgVhEqikMerGoYuwxU8NxQVmlKM/7mtA11IeEgQRuiq8VoDTrQUx0ezehtnPmp+QY6xe
	FzINSnOxsDs3Ql2It+3oOouyljTpJstF4y3//T2/G8cRTiTfhqGG4l6sPJz1jNfnQnm5oWWlzk9
	coMxkC/wCrG99Riu1P2rR2Op+/owJB4
X-Received: by 2002:a05:651c:b23:b0:3a5:e027:1b49 with SMTP id 38308e7fff4ca-3a64c71fe9bmr18935721fa.2.1790527479362;
        Sun, 27 Sep 2026 09:44:39 -0700 (PDT)
Received: from artemiipatov-ThinkPad-T14-Gen-2i.. ([185.119.0.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b580b28sm22425781fa.11.2026.09.27.09.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:44:39 -0700 (PDT)
From: artemiispatov@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: tglx@kernel.org,
	peterz@infradead.org,
	anup@brainfault.org,
	atishp@rivosinc.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor@kernel.org,
	hui.wang@canonical.com,
	artemiispatov@gmail.com
Subject: [PATCH 1/2] cpu/hotplug: Skip kick stage if the AP is stuck in SYNC_STATE_ALIVE
Date: Sun, 27 Sep 2026 19:44:17 +0300
Message-ID: <20260927164418.3090433-2-artemiispatov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927164418.3090433-1-artemiispatov@gmail.com>
References: <20260927164418.3090433-1-artemiispatov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Artemii Patov <artemiispatov@gmail.com>

There are scenarios where the AP gets stuck in cpuhp_ap_sync_alive()
during bringup. For example, when the AP starts late, the control CPU
may time out in cpuhp_wait_for_sync_state() waiting for the ALIVE state
and abort the bringup with an error.

The AP eventually reaches cpuhp_ap_sync_alive(), marks itself ALIVE and
spins, waiting for the control CPU to release it. The only way out of
this loop is the compare-exchange in cpuhp_wait_for_sync_state(), which
is invoked from cpuhp_bp_sync_alive() and transitions
SYNC_STATE_ALIVE to SYNC_STATE_SHOULD_ONLINE.

On a retry of the bringup, the ALIVE state was treated as a CPU which
did not come up: cpuhp_can_boot_ap() overwrote SYNC_STATE_ALIVE with
SYNC_STATE_KICKED and the kick stage tried to start the AP again. That
would require the AP to run through the boot stages once more until it
sets SYNC_STATE_ALIVE, which the kick mechanism cannot guarantee: on
RISC-V, sbi_hsm_hart_start() on an already running hart returns
SBI_ERR_ALREADY_AVAILABLE and does not reset it. So the AP remained
stuck and the retry failed.

Fix this by treating SYNC_STATE_ALIVE as "already alive, no kick
needed": cpuhp_can_boot_ap() leaves the state unchanged and
cpuhp_kick_ap_alive() skips the kick in that case. The retry then
proceeds to cpuhp_wait_for_sync_state(), which performs the
ALIVE -> SHOULD_ONLINE transition and releases the stuck CPU.

In cpuhp_ap_sync_alive() promote SYNC_STATE_KICKED to SYNC_STATE_ALIVE
only, so that SYNC_STATE_SHOULD_ONLINE set earlier by the control CPU
(e.g. when the AP re-enters the sync point on a retry after a failed
bringup attempt) is not overwritten.

Fixes: 6f0621238b7e ("cpu/hotplug: Add CPU state tracking and synchronization")
Signed-off-by: Artemii Patov <artemiispatov@gmail.com>
---
 kernel/cpu.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553d7bd6..eb9cb7c3e565 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -392,7 +392,11 @@ void cpuhp_ap_sync_alive(void)
 {
 	atomic_t *st = this_cpu_ptr(&cpuhp_state.ap_sync_state);
 
-	cpuhp_ap_update_sync_state(SYNC_STATE_ALIVE);
+	/*
+	 * Compare-exchange failure means that the state is either SYNC_STATE_ALIVE
+	 * or SYNC_STATE_SHOULD_ONLINE, both are acceptable.
+	 */
+	atomic_cmpxchg(st, SYNC_STATE_KICKED, SYNC_STATE_ALIVE);
 
 	/* Wait for the control CPU to release it. */
 	while (atomic_read(st) != SYNC_STATE_SHOULD_ONLINE)
@@ -414,7 +418,7 @@ static bool cpuhp_can_boot_ap(unsigned int cpu)
 		break;
 	case SYNC_STATE_ALIVE:
 		/* CPU is stuck cpuhp_ap_sync_alive(). */
-		break;
+		return true;
 	default:
 		/* CPU failed to report online or dead and is in limbo state. */
 		return false;
@@ -822,6 +826,15 @@ static int bringup_wait_for_ap_online(unsigned int cpu)
 #ifdef CONFIG_HOTPLUG_SPLIT_STARTUP
 static int cpuhp_kick_ap_alive(unsigned int cpu)
 {
+	struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
+
+	/*
+	 * The AP is already alive and waiting in cpuhp_ap_sync_alive().
+	 * cpuhp_bp_sync_alive() will release it, so skip the kick.
+	 */
+	if (atomic_read(&st->ap_sync_state) == SYNC_STATE_ALIVE)
+		return 0;
+
 	if (!cpuhp_can_boot_ap(cpu))
 		return -EAGAIN;
 
-- 
2.43.0

