Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF47F1397
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787871438; cv=none; b=uJR6G+vkNi0reKI2cspJUF8AtbNNvUMhIbEl2BPsq9ytPYjvDyz7Nsv9f7iR7zTQjZLbxlLcCMSfa2325xCk6dKvcywhfadNhvdcrOEhU8nt9GWYU7nwV2eYgQ0oYiF4qH9Ry2CSKZYTZuyPqwKKyLlI/l1dKSxHvbNqLtN1C3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787871438; c=relaxed/simple;
	bh=PrYnc1NVIONTNqZ6gF7P1SFs9erfmuZJsF0BLbbLBFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kdNauhrTQ+IgrD8HoSk06ddxo0/1Dulb+pGWIykr+cw1C5GOgZKtOwSGQhdWORBSfF/jAPOcq206+QdPfh+SoBEBnTbjBYoYgjRxS196LlBWhbIYQNM44DnYYfSTnR/l2ZUsabYb3SbunOShXUfurKzEowDJIqr2qwmTt+JXGLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=grrlz.net; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nQEL8PMI; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=w4/FZdrz; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=grrlz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nQEL8PMI";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="w4/FZdrz"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787871427; bh=TZTH3k1EIdDPbqjZFjizcEv
	kOl02obDXXhHiLQsGXcI=; b=nQEL8PMIJTrQA1AW8DzrrUz+xBAvQdVHftPACDCY2W41dEHT+V
	EXJETha3BvIWEFu5GNZJJEYzDEnlePoxOerxlw+ZapaLQHnSTPq+9NcBMFJpYIGC0fHRf83zYA+
	G9FmvORqkO9H4uGCiK/qlL2HTMQJrgmTpIAK7zIj2FsmGMrXXuwD20oRGH28p3tTXOMR97xkdS6
	R1t0vGWiHn6HWOqdXZAf8o5DoqZoBm9NAi+xJxV5VJBpgYt9jo+1+jYEEbQ1+uig3Tw5E8+QN0+
	u+cN93H4e51xJe8EuNfQ1zxEbKQo3gLPpAn1tv0l8hZUudZxQdA7+HGsREwvbZ1EUsA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787871427; bh=TZTH3k1EIdDPbqjZFjizcEv
	kOl02obDXXhHiLQsGXcI=; b=w4/FZdrzSVJmYbUod2WEtI9dNTXUysnLcDJW51YShogkRKtJYB
	6UAYvXN+n3bkCGBdQb4wPppyHccZqQ/ZBCBQ==;
From: Bradley Morgan <include@grrlz.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH 1/2] reboot: log the task that initiated the reboot
Date: Thu, 27 Aug 2026 22:57:07 +0000
Message-ID: <20260827225708.6831-1-include@grrlz.net>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bradley Morgan <brads@mainlining.org>

When a machine reboots or powers off, the kernel log records what
happened but not who asked for it. The reboot syscall throws the
caller identity away, and userspace does not reliably record it either:
systemd only journals shutdowns that go through logind, anything calling
reboot(2) directly (watchdog daemons, container agents, orchestration
tooling) leaves no record at all, and the journal is being torn down
while the machine goes away, so even the lines that should be written
can be lost. The kernel is the only place that always sees the caller,
and a kernel log line survives via pstore or a serial console when
userspace logs do not.

Log the comm and pid of the calling task in the reboot syscall, once
the requested command is committed and can no longer fail, e.g:

  reboot: initiated by systemd-shutdow[1]
  reboot: Restarting system

The existing "Restarting system", "System halted" and "Power down"
lines are left untouched, so anything parsing dmesg today keeps working.
The two ctrl alt del toggle commands are excluded so init setting the
mode does not add a line to dmesg on every boot.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 include/linux/reboot.h |  1 +
 kernel/reboot.c        | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/linux/reboot.h b/include/linux/reboot.h
index aa08c3bbbf59..3fb8d8533563 100644
--- a/include/linux/reboot.h
+++ b/include/linux/reboot.h
@@ -172,6 +172,7 @@ extern void kernel_restart(char *cmd);
 extern void kernel_halt(void);
 extern void kernel_power_off(void);
 extern bool kernel_can_power_off(void);
+void reboot_log_initiator(void);
 
 void ctrl_alt_del(void);
 
diff --git a/kernel/reboot.c b/kernel/reboot.c
index f070c5c1103a..42517e0b621b 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -717,6 +717,19 @@ EXPORT_SYMBOL_GPL(kernel_power_off);
 
 DEFINE_MUTEX(system_transition_mutex);
 
+/*
+ * Log the task that asked for the transition once the requested
+ * command is committed and can no longer fail, e.g:
+ *
+ *   reboot: initiated by systemd-shutdow[1]
+ *   reboot: Restarting system
+ */
+void reboot_log_initiator(void)
+{
+	pr_emerg("initiated by %s[%d]\n", current->comm, task_pid_nr(current));
+}
+EXPORT_SYMBOL_GPL(reboot_log_initiator);
+
 /*
  * Reboot system call: for obvious reasons only root may call it,
  * and even root needs to set up some magic numbers in the registers
@@ -764,6 +777,7 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
 	mutex_lock(&system_transition_mutex);
 	switch (cmd) {
 	case LINUX_REBOOT_CMD_RESTART:
+		reboot_log_initiator();
 		kernel_restart(NULL);
 		break;
 
@@ -776,10 +790,12 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
 		break;
 
 	case LINUX_REBOOT_CMD_HALT:
+		reboot_log_initiator();
 		kernel_halt();
 		do_exit(0);
 
 	case LINUX_REBOOT_CMD_POWER_OFF:
+		reboot_log_initiator();
 		kernel_power_off();
 		do_exit(0);
 		break;
@@ -792,6 +808,7 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
 		}
 		buffer[sizeof(buffer) - 1] = '\0';
 
+		reboot_log_initiator();
 		kernel_restart(buffer);
 		break;
 
-- 
2.47.3

