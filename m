Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6936C45C709;
	Mon, 28 Sep 2026 07:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578891; cv=none; b=DwF7/kkDWOQtoMjKICu9vrvy2TMDtjiV2rBCXcHt7wzsSWzy7GQnOfWMjOuM6Fc6LjNkoX1NB8DF50m1P5NyCe23Mt1zrwIn9Zdke2Gvtj8YWQXhbJfqlLzD4xVXxRESHiZUZtnO6vkKYpRsRkxZfvrTLGL4P4rLlRSdqBMDDW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578891; c=relaxed/simple;
	bh=raFQ56VQr6uevSpdeH/ic+9B1tGp+pUbS40zMfJygRY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=DjdzxhU+MwWFY4RAfBDoG0K21tUsCndp7VDP7PjxDy8Uxg0YdPnOTpuEQhYec6SK+YqPu3IveAAE/sc0iOXuKIw5MqWaWVTyIMreV0VfcnhVTpxB4YqRb8Jue6YlFlyjwx4R6aj3buEulP5hmiB+uR3Xe0M2ITUwXc79AF+QXK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TufuF9QF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YfY42aAB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TufuF9QF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YfY42aAB"
Date: Mon, 28 Sep 2026 07:01:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578887;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1bvD0ICp2lkdzeRT6o6GeRMeb9AG8ETCvASNvDZaX6I=;
	b=TufuF9QFazhkT4J/+9il0HT/gOQGIjJIZI45NjhFgmwHYla8yzohPwcqkCb/5pT4FaGGCI
	Hxud95JWPUCkARG5qlhPp65T2s88jtLRdisTtPGS19LBOC+Wr4y7WvLBJhVgLreZMYnC/F
	ODNHAXJyBXJIh++TyoieSVBZ1/Wg1p0hcE4CSAxmZQzUL32Wq2S8j2i4neiufult98uV0F
	wSwpG2GFhamaHz5uXrbV/lcqGNCNqLSxhF8mwDlCc1TVtkxHloxY3+HSJl7Hu+JsYbSwPX
	KB2+H8B2T7s6+Wci6qI5XHMTbKYjBydlXk0i6U8lPzc8yIdfYbxiXKgcn5fWTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578887;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1bvD0ICp2lkdzeRT6o6GeRMeb9AG8ETCvASNvDZaX6I=;
	b=YfY42aAB4Sfmg/ZOCjF+aj2cWfj66yo70DzL46AOGR6efPbcSGD2JDzzHHK/JbN/JfOH/g
	UYPr4IjgUTT84XBw==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sysfs: Add preferred CPU file
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928053728.797539-6-sshegde@linux.ibm.com>
References: <20260928053728.797539-6-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057888593.3910103.2433113604205347888.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     62082451655747dae25496d126e58f985df29f50
Gitweb:        https://git.kernel.org/tip/62082451655747dae25496d126e58f985df=
29f50
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Mon, 28 Sep 2026 11:07:20 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:41 +02:00

sysfs: Add preferred CPU file

Add a "preferred" file in /sys/devices/system/cpu/ when kernel is
built with CONFIG_PREFERRED_CPU=3Dy.

This would help
- Users to quickly check which CPUs are marked as preferred.
- Userspace daemons such as irqbalance to use this mask to
  route irqs into preferred CPUs.

For example:
cat /sys/devices/system/cpu/online
0-719
cat /sys/devices/system/cpu/preferred
0-599        <<< Implies 0-599 are preferred for workloads and 600-719
                 should be avoided at this moment.

cat /sys/devices/system/cpu/preferred
0-719        <<< All CPUs are usable. There is no preference.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260928053728.797539-6-sshegde@linux.ibm.com
---
 Documentation/ABI/testing/sysfs-devices-system-cpu | 14 +++++++++++++-
 drivers/base/cpu.c                                 | 12 +++++++++++-
 2 files changed, 26 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentati=
on/ABI/testing/sysfs-devices-system-cpu
index 82d10d5..8f250b8 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -806,3 +806,17 @@ Date:		Nov 2022
 Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
 Description:
 		(RO) the list of CPUs that can be brought online.
+
+What:		/sys/devices/system/cpu/preferred
+Date:		Sep 2026
+Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
+Description:
+		(RO) the list of preferred CPUs applicable in
+		paravirtualized environments.
+
+		The steal governor driver dynamically adjusts this mask
+		based on observed steal time. Scheduling tasks on
+		CPUs outside of this list may lead to performance
+		degradations due to underlying physical CPU contention.
+
+		See Documentation/scheduler/sched-paravirt.rst for more details.
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 69e52fe..747915f 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -391,6 +391,15 @@ static int cpu_uevent(const struct device *dev, struct k=
obj_uevent_env *env)
 }
 #endif
=20
+#ifdef CONFIG_PREFERRED_CPU
+static ssize_t preferred_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_preferred_mask));
+}
+static DEVICE_ATTR_RO(preferred);
+#endif
+
 const struct bus_type cpu_subsys =3D {
 	.name =3D "cpu",
 	.dev_name =3D "cpu",
@@ -532,6 +541,9 @@ static struct attribute *cpu_root_attrs[] =3D {
 #ifdef CONFIG_GENERIC_CPU_AUTOPROBE
 	&dev_attr_modalias.attr,
 #endif
+#ifdef CONFIG_PREFERRED_CPU
+	&dev_attr_preferred.attr,
+#endif
 	NULL
 };
=20
