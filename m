Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216523;
	b=m1KT3bL5Nny7BBjs+1lxs2woc86sobCDqCS2YIkv7jjL8luv+oOzYFWCdSyHGfhXPydO
	 tHCJnuQOD5xR6P3jBVogOFwTYKx4qf4YEaoQBrSXOfybf+h1kAW0tZypLJQJW8r2HWEWJ
	 CeXy20UTs/TYbqYR5f64ez3zQaKqVGgf6TujXsXNj5E1jlEersldBz3RUOYxJwqhv0SAF
	 yWv0swA6sTFZKXkUQ4LxF59WGbn2QeF/LdD0RwYzZ8J+vxLwOMgBKdz0sr5BAgA1NNHj4
	 jAbAoMeS3h7+QJNfzX/c9PRDG0XZeJYu1OU9Z7y2nr3LqmVEN1GjMb/OCawyv7LKlzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216523;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=PAl7ZnrdnHZF4Z7uYExWrZkuADPBVdREAT8mjpJYnWA=;
	b=t1NiuJJBHz/Ggz9Rbp/cqj6fvNt2gnpz1vDWQI4LLcbjxGm0+vPYxFdmFTAnCzPqpC+e
	 TADsU8yM2J+awT5KQ5iKaoSp4aWRmJCZ8ekapEkXL4cD0H5KSqS2pFlo9MDSdJfaChhHD
	 zkPxKsqhzos5LBl0yZKrcvW+B7uXBEFUugkZ+SYvQ6Se5F+HndsqOnOzeGJM9VAv1ChMq
	 +H0vJ4rGmlk8ao3paALYwAmt1UkoC3iiRW08mnVFjeSvpEQA4bX2ktr4iWreDYvUHa3iP
	 kUHCejvhqiKk7eOkD1fAIeVJANmTP+/VJFIT8v0cvvBFX5zpRcPz7JnmG38aB/lnZhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=THtzhsLv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EUe14et0;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BB7606D814;
	Mon,  9 Nov 2026 09:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88BB7606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=THtzhsLv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EUe14et0
Date: Mon, 09 Nov 2026 09:28:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216521;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PAl7ZnrdnHZF4Z7uYExWrZkuADPBVdREAT8mjpJYnWA=;
	b=THtzhsLvjkrZabrjtn7Kr+PK1KwdX4uzQxLHzIUGnCx1P9oeeXDSF8JLcmY6tkRIR7LaFM
	9wrut21LO7vFrn0CHLZ/SJm49AvrWuoO7wK1S33ctfFle+9z1lcCe5gFwbzijJuYNxR275
	EzajJQUaoPRlx9EeOZFTTVYLcJBjJTY6FA/rQkMvVYMvhQWtU5DcQqkJhFzHGYg4bGRV9Z
	kSrCIaE1C5BcB7mXnpjN8wWvo/xEjJt8fUNQFb7NKp4OxfdadLr5VfnDLXo8FLp5u4uGRC
	uZFpf4rvsxRkMVqraM01BhPWCGwQbHFBK1tEVfjn5KpyjxUB6YWJ7eeegwgzkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216521;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PAl7ZnrdnHZF4Z7uYExWrZkuADPBVdREAT8mjpJYnWA=;
	b=EUe14et04LoSVyu1h60O4GJXcRGG29tKHCdYXtLNwra3hLNxoAd66JetOave4K2pIPe/tj
	02AOjsUkCn3DH6Cg==
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
Message-ID: <179421651945.2093942.13233338319911918309.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     96225d5b02676504fb4cf384edc971bb232ace57
Gitweb:        https://git.kernel.org/tip/96225d5b02676504fb4cf384edc971bb232=
ace57
Author:        Aaron Tomlin <atomlin@atomlin.com>
AuthorDate:    Fri, 30 Oct 2026 11:13:07 -04:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:24:00 +01:00

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
