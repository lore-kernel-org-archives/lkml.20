Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218526;
	b=pmdG87IiRgQfEPWqGfOdTrXTtSGEnVmMniQD8dtV8yeeEQaDdifELHv/XUpPmgu8FB0/
	 /DmpezW6h0pIDO7H5RRdRm9vZ36c81Fk4/TMC5Uaw9TXyWcZmZboPJa8FgQSnoMGtpgSU
	 g68NJawIAMPDm5IRowpoAzigZB5Xjp2+CZnt2N+0fOrhi3nFwTKvY0NIR5ptgPBx9Kgyq
	 fZGhFpowZqVXGRIgqyQT2wNpmAFn7Gt7n1ND49LteYSA0UOXQtnGT6P6451MjtQHjHVBe
	 NetkhrFKp2a7SET03/qcs70nsKzu/iCilSEqnxmB+s6n4P0X7ARBlzach2whakE5qUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218526;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=FwOjHYHHLviCyZ7DNKTk+PzqVTPRbfwjzmtcikpzKQo=;
	b=2qubYtswIFB1ZNfQH1l3h7/zh8WkESoLLyi2AGIrmlSO9M/w6iyOjvstdjdPxZZTvL4m
	 8ZZsaZm65ImZBc3pINe3yqoVYVF6OrCNxfTlfpbTWS0FgRIU8DUKs0QAXZhLCE4D/ndiM
	 a2U26cgvNEBqMshpuSO5oza4C74iX1/oAtTy0AqqiV2e3s/Y7XjeL5LOnFda1YkxHN+Yz
	 vuc+jypklLMJK9a1L+cSGgtPhpmiFKLzI8Vthzi4/AzSw06JoQLUfNjaFapOcs4BOigQr
	 aE7KfGFLFXcEyZZj/s39D3z0QJpBPJ72rUXmPNk0aI4AN2CZ4oxtEkeyI2qVwc31IvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uZ+4XiVY;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CgCT7D8H;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE0A606A33A;
	Mon,  9 Nov 2026 10:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCE0A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uZ+4XiVY;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CgCT7D8H
Date: Mon, 09 Nov 2026 10:02:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794218524;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FwOjHYHHLviCyZ7DNKTk+PzqVTPRbfwjzmtcikpzKQo=;
	b=uZ+4XiVYl6wwUWeVe4fZ7gk6HEDQlpZDuWmWDQc0SAxmPM94vENmzlQut5VKeNFDGJ/xX0
	lJv72xBfxmeKWr7XjS3oCv/wUu049jzoaTds73yFUXCBFfFIQ9MM6/LZYzxn6Xw7b5bc+7
	kOANLQwRwsUeWySlT0mF4zndbb1fBzCIicJYt1uz5i6eiX+lL/EFF9Xld244xCyy8gu1Y5
	lAzoRlvNXK+Y82BeOq8hceqfFMyYSn3uYHv7hDmbRWClX+2wF9O9HSJ6IB1Vy+JdIca2LL
	DJN9PO2i2FRbTMYqT0YzAQj5iNdjOtLzD2wgwEglN/2i2Jn1zWMV4kHN6ECp4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794218524;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FwOjHYHHLviCyZ7DNKTk+PzqVTPRbfwjzmtcikpzKQo=;
	b=CgCT7D8HNd+fLAEyu1JEsF4r6Av2fGfC7ueAJEPMY2VwGBbCWIr6oTTDCEueChfEdF3PGc
	PLYCLnPmgQU+OJCg==
From: "tip-bot2 for Aaron Tomlin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/debug: Introduce per-CPU debugfs files
Cc: Aaron Tomlin <atomlin@atomlin.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261030151307.768523-7-atomlin@atomlin.com>
References: <20261030151307.768523-7-atomlin@atomlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421852232.2093942.3619005916848473925.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     fd03f9fcf821f8663c292933865d8adf6e9c9fc2
Gitweb:        https://git.kernel.org/tip/fd03f9fcf821f8663c292933865d8adf6e9=
c9fc2
Author:        Aaron Tomlin <atomlin@atomlin.com>
AuthorDate:    Fri, 30 Oct 2026 11:13:07 -04:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:57:54 +01:00

sched/debug: Introduce per-CPU debugfs files

Currently, accessing scheduler debugging details for a specific CPU
requires reading /sys/kernel/debug/sched/debug, which outputs
information for all online CPUs. When investigating a latency anomaly or
scheduling issue isolated to a specific CPU, accessing
/sys/kernel/debug/sched/cpu/cpu<N>/debug provides an immediate, targeted
view of that runqueue.

Add support for per-CPU debug files under:
/sys/kernel/debug/sched/cpu/cpu<N>/debug. Reading
/sys/kernel/debug/sched/cpu/cpu<N>/debug calls print_cpu() specifically
for CPU <N>, exposing CPU-specific runqueue details on demand. If the
target CPU is currently offline, reading its file returns -ENODEV.

Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20261030151307.768523-7-atomlin@atomlin.com
---
 kernel/sched/debug.c | 43 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 11290c7..ab6ff91 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -339,6 +339,7 @@ static const struct file_operations sched_verbose_fops =
=3D {
 };
=20
 static const struct seq_operations sched_debug_sops;
+static void print_cpu(struct seq_file *m, int cpu);
=20
 static int sched_debug_open(struct inode *inode, struct file *filp)
 {
@@ -692,6 +693,47 @@ static const struct file_operations sched_cgroup_fops =
=3D {
 };
 #endif
=20
+static int sched_debug_cpu_show(struct seq_file *m, void *v)
+{
+	unsigned long cpu =3D (unsigned long) m->private;
+
+	if (!cpu_online(cpu))
+		return -ENODEV;
+
+	print_cpu(m, cpu);
+	return 0;
+}
+
+static int sched_debug_cpu_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, sched_debug_cpu_show, inode->i_private);
+}
+
+static const struct file_operations sched_debug_cpu_fops =3D {
+	.open		=3D sched_debug_cpu_open,
+	.read		=3D seq_read,
+	.llseek		=3D seq_lseek,
+	.release	=3D single_release,
+};
+
+static __init void debugfs_cpu_init(void)
+{
+	struct dentry *d_cpu_dir;
+	unsigned long cpu;
+	char buf[16];
+
+	d_cpu_dir =3D debugfs_create_dir("cpu", debugfs_sched);
+
+	for_each_possible_cpu(cpu) {
+		struct dentry *d_cpu;
+
+		snprintf(buf, sizeof(buf), "cpu%lu", cpu);
+		d_cpu =3D debugfs_create_dir(buf, d_cpu_dir);
+
+		debugfs_create_file("debug", 0444, d_cpu, (void *) cpu, &sched_debug_cpu_f=
ops);
+	}
+}
+
 static __init int sched_init_debug(void)
 {
 	struct dentry __maybe_unused *numa, *llc;
@@ -753,6 +795,7 @@ static __init int sched_init_debug(void)
 #ifdef CONFIG_SCHED_CLASS_EXT
 	debugfs_ext_server_init();
 #endif
+	debugfs_cpu_init();
=20
 	return 0;
 }
