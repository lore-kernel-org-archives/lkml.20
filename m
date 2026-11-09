Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213838;
	b=kUueEOf9FWtl9a7s8t+THGgH+mrrDzZNZmt32wgMVj6wGSs6n+5gaOKEoc9tCOmKc0Dd
	 Q9JOk9Ho9IhIDG8kMR6BtBbblNmlX8A5JSkrLsvHdA1UIFUc3kBar+ojtwEsfy50fCCKt
	 9NvALoYVpXRtXhIFM09ibxEkE6dnyerN0xxIObmHcHzmxtDaoKng6llf25m7ma3WbCBhB
	 QoA/VnYgPFzyP7SR8gneO3xJDL/sUuqCsczgDiA6rT99QERylo5+suscXrKiiLDkV2zcU
	 mRPXb6dp4t7avrDom94gLDz+oT4mhItoZdcMYCcx50kpTFQ2y7rKTuuwJBTKETjeYWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213838;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=iCKZQAx2TnxCEzkgU+zm5nppeiSMqgk0H3IdUUprJ04=;
	b=L1U+4k1/MbGJdjcllnh0oQpPiOxwS4T4edo4wvTHaMnevIbyw4wq893Xv+xqDlJ0fhLl
	 rD8dS5CB8+ijCLeBZTVR/i09SFQbs/O91u9M/8zaYwP0vFWsTY8W1LHCnHtV9O372q0hQ
	 fEfE4VVAuF4vtpGD5yTeKB9jjUGJjO2pMKsvAf6MSo5Q3+5mKepzyIcauZ4oF85m5bpCf
	 65iMb1ByC+pp9Sty/khYNTnNp+TjG0Dcqtv32eiYAEbGuAInInLqqPzphAQuq3AQKZt00
	 LbEkibRAyeIelQM8K35pRHxU15VhGOT0Vm+rypshBQ04y9AbKGyILKaBqd2YL0cja/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="cDEnVk/C";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=67aN5Pgp;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C9D606D819;
	Mon,  9 Nov 2026 08:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8C9D606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cDEnVk/C;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=67aN5Pgp
Date: Mon, 09 Nov 2026 08:43:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794213836;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iCKZQAx2TnxCEzkgU+zm5nppeiSMqgk0H3IdUUprJ04=;
	b=cDEnVk/Ca/It9P1WMZKfCj5kF8qn4yw9uL/CsCo+xzEBvDhGPUbUtXVeKZl7FqSdeYtOUS
	2zFETp3FNr99iWv40VbCpl45q3xUPrBI9+UCXpl7TaOgXzbzlCZSyOPUSnZ+ZnWaevmBFl
	/sUleDUbiG+F6Q6RjyI+pgWsbhjh8oCm/1xaFc6EYklb6nx+GBfoTTxF+B+oq/PaJWCu81
	/DlUE6SBH9nuugoOnrA6TP06CqTXDnwx0jTSVv9wdNgnVIs6+9XbrhwNhcpwYVUcJJynYv
	nd6fEk3dJ3fzzKcSkb2dW923Cz21xualgaA4C5XhdnCOKk3zjsJey5zH50BmlQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794213836;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iCKZQAx2TnxCEzkgU+zm5nppeiSMqgk0H3IdUUprJ04=;
	b=67aN5Pgpxfk5u15Wj9CkUo7P1nCXSf51QwImdkjTUkOATQ7GqE5SkETNiM26lHhfLKH0GC
	LlaOUdKrR3lIkvDg==
From: "tip-bot2 for Aaron Tomlin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/debug: Introduce per-CPU debugfs files
Cc: Aaron Tomlin <atomlin@atomlin.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
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
Message-ID: <179421383474.2093942.1310755559011871009.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     88149d425814de26a92a4c6898fa72098111ab8e
Gitweb:        https://git.kernel.org/tip/88149d425814de26a92a4c6898fa7209811=
1ab8e
Author:        Aaron Tomlin <atomlin@atomlin.com>
AuthorDate:    Fri, 30 Oct 2026 11:13:07 -04:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 09 Nov 2026 09:39:58 +01:00

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
Link: https://patch.msgid.link/20261030151307.768523-7-atomlin@atomlin.com
---
 kernel/sched/debug.c | 43 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index b291595..ac4971c 100644
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
