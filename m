Received: from mail-yx2-f22.google.com (mail-yx2-f22.google.com [74.125.224.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87E247CA69
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933142; cv=none; b=XCTnhUraK9oiw36/6TbnIGhS+hFuAp7LrypY1UUDuQLKCG7TUACydgKzELSYsVQWhzdld5ELN4P6QdHWxhQ37x2RgsK1Eok7H2ep6mpJH9RJd1lxJh9Ju4NkSe4p13R7fzD1lZZvfT2ItTwWazMKKl94QmDPW9ZBq1vFYehz23I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933142; c=relaxed/simple;
	bh=fj1ljrkGSWoWpWEYuUtg0SmAvZFcruAXdGd+rtoE5yo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k37hg7sZRTn64sMhjvBJh83IuLSXry+s3+opI7K1L93a6kdxlnqkUW7gY7nu+Q37tfisqy/ONbHmoXlITLJL6KHmtVozaSCOeKHnEJ1W/ms8xK+gRBsj/V9unk1KmaOwnzgBl3QIg/wfpk30dLG4nkkhKxC9ne7k07AZE7NJmOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=GadUUrgc; arc=none smtp.client-ip=74.125.224.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="GadUUrgc"
Received: by mail-yx2-f22.google.com with SMTP id 00721157ae682-85d4ddd1d91so15242717b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789933138; x=1790537938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pYr/9NMKeUZAYHni34Sv6tdHvQS74uTyy8Pha66A4FI=;
        b=GadUUrgcXAaYNr4NlPVFPLhq+tiMLBgejhFt0oTqtzTwtP2h507o3zL3J760uPKEtF
         CCcs0ylh1DQbsxGHBWrR5klK0H4ha8xrphhnoQ6pyadsRMrQlehjRyPQggVmkGIpNMYS
         dThjjys/A2b8X1DAqjUBbnFYpxkhma1hJulQpWq/J4m5xj7mxC5byRLSlx2+hKXlvI/c
         0xVixnNWBf2MCi+IIk0Ju0eoOWadly/gEdzex+nLuAklIb3gMAgBDsRE3M7+oSPjGk3f
         7nInf2/oxO4p7aPo7yUmOr9anoKHbHMvpViooIelhN6StE1Pdqxqj8Ks/Ismq/y1L9UC
         iRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933138; x=1790537938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pYr/9NMKeUZAYHni34Sv6tdHvQS74uTyy8Pha66A4FI=;
        b=rUeO1NviRuytCKSA2R01ueXovSbeTTy5+7if/LCeqMShCCcHb0FddhDBPdvCIxrchh
         7sanLZrJDiNGw+UFyhi58uaQ+3nBlQp0JknPIiT2jAoqukSA4piI7bb7p6+RxxSbuC1i
         /tGBNbdI0Q1jGWwYV3akl4EVD3UUIbHBjA7fUcxX2PeYHVGNPR5O8zjyg/DksSmHy8n6
         LaklqTj4R03MfRS8GGCwA5oaKdXILVog+f/fpKwV6bz8P9+foWAMohSJfPL9/y3I4tgP
         QopTVUg0XknzQBBgZjiTfcfIExFGz39K1HKq+M05Gs8T9ArmC/EPxJy9SKTpm8uDpOny
         pzVA==
X-Forwarded-Encrypted: i=1; AKwUvBysDosjla1M9v8NBSSU4zh+D5jyqDKr/Rs15JJfUamoyv/OCCXpP7IKMXZp03qFvIWSbAa8NceZYjEEZnk=@vger.kernel.org
X-Gm-Message-State: AFuF++mQ4mjS10qO5KVDZKkBfsz7ZZRPbZQNb65HuLqDGW46W/eRSnXK
	QlGC6wZQZurcV5vIvS3riQMjSLkUk75OIKc1xWgpdSTttXe9GVR+Zkate/IoybPDJm8=
X-Gm-Gg: AYBFou3n5rPtUITsmil7D/meHjjkTYdgEaDTWNtlb79mhsI4yObEA84liM8RreFXnM5
	jPcossWVqDOeFSmhGZGn35LNd9mRaDUFRaTx91+33X8PYWM214bHjzab9PUBESCP55PD7XyF+SX
	hrsSywceyWBkH2SKbgLz632/pjPxFtwG9oUtsu8Cjhc1XuALmbFuLBEM0S559cfu+SksSGRPbSx
	kqEyYQOyU+ONgE/ZvmWeCe9mz1GKQAyWEeyC4YfuObe5ixtPQ7XtHlauOZjewhlL8gd1cs3VyLf
	56nFtsptIKYtlZH5suOZlfscq3wb9hh7O3KtgWKcbaICCpoa48vhpgkDmfj0EF5I2jtE4cNE8SE
	tMC0bmos62pyIDnPHgSFfVDCJPTIkuAeWjH7ozB9CiF6tMaVi0OL6JJgVE9WpkB7AyVU+0EwoSF
	/ftG/4inApTzo2xB8qcYpG5j1c6A6nC9PLsVWYx1kyp09UTCNM9BLapcZE5yPLWi2kb3Clc7/aC
	tXIzV9o+hVa+rdimU0DE1J22bvdvxytj+vCNJ+CLGnEcrb/CGrXAAZLj0aMeRrr7WdytaoHc7qf
	1nhMyuVHQpXrbxelrIQ=
X-Received: by 2002:a05:690c:e196:20b0:89a:63da:cbe9 with SMTP id 00721157ae682-89a63daccb1mr15163787b3.47.1789933138554;
        Sun, 20 Sep 2026 12:38:58 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a482d3648sm18568067b3.39.2026.09.20.12.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:38:58 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	legion@kernel.org,
	kees@kernel.org,
	will@kernel.org,
	ruanjinjie@huawei.com,
	atomlin@atomlin.com,
	rppt@kernel.org,
	jani.nikula@intel.com,
	hamzamahfooz@linux.microsoft.com,
	joey.gouly@arm.com,
	tglx@kernel.org,
	nsc@kernel.org,
	alexandre.chartre@oracle.com,
	james.morse@arm.com,
	dianders@chromium.org,
	bp@alien8.de,
	jpoimboe@kernel.org,
	shuah@kernel.org,
	catalin.marinas@arm.com,
	linux-kbuild@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kvmarm@lists.linux.dev,
	jaredwhite@microsoft.com,
	johan@kernel.org,
	pbonzini@redhat.com,
	mingo@redhat.com,
	linux-mm@kvack.org,
	seanjc@google.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	tarunsahu@google.com,
	gshan@redhat.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	xur@google.com,
	djbw@kernel.org,
	oupton@kernel.org,
	nogikh@google.com,
	sumitg@nvidia.com,
	linux-kernel@vger.kernel.org,
	zengheng4@huawei.com,
	peterz@infradead.org,
	corbet@lwn.net,
	suzuki.poulose@arm.com,
	luto@kernel.org,
	hpa@zytor.com,
	zhangpengjie2@huawei.com,
	x86@kernel.org,
	yuzenghui@huawei.com,
	jic23@kernel.org,
	ardb@kernel.org,
	pasha.tatashin@soleen.com,
	petr.pavlu@suse.com,
	ryan.roberts@arm.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	dave.hansen@linux.intel.com,
	rdunlap@infradead.org,
	kvm@vger.kernel.org,
	fuad.tabba@linux.dev,
	maz@kernel.org,
	mbenes@suse.cz,
	jgross@suse.com,
	seiden@linux.ibm.com,
	pierre.gondois@arm.com,
	song@kernel.org,
	nathan@kernel.org,
	pmladek@suse.com,
	graf@amazon.com,
	chao.gao@intel.com,
	zhenglifeng1@huawei.com,
	arnd@arndb.de,
	sidnayyar@google.com,
	linux-arm-kernel@lists.infradead.org,
	vladimir.murzin@arm.com,
	kas@kernel.org
Subject: [RFC PATCH 21/46] selftests: liveupdate: Add physical CPU preservation unit tests
Date: Sun, 20 Sep 2026 15:36:25 -0400
Message-ID: <20260920193650.3373435-22-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
References: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add unit tests exercising CPU preservation sysfs interface:
- Verify /sys/devices/system/cpu/cpu<N>/preserve operations.
- Test CPU offline and preserve sequencing.
- Verify status reporting and error handling.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 tools/testing/selftests/liveupdate/config     |   6 +
 .../testing/selftests/liveupdate/liveupdate.c | 251 ++++++++++++++++++
 2 files changed, 257 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/config b/tools/testing/selftests/liveupdate/config
index 016d009dba13..9458b9c70eeb 100644
--- a/tools/testing/selftests/liveupdate/config
+++ b/tools/testing/selftests/liveupdate/config
@@ -5,8 +5,14 @@ CONFIG_KEXEC_HANDOVER=y
 CONFIG_KEXEC_HANDOVER_ENABLE_DEFAULT=y
 CONFIG_KEXEC_HANDOVER_DEBUGFS=y
 CONFIG_KEXEC_HANDOVER_DEBUG=y
+CONFIG_SMP=y
+CONFIG_HOTPLUG_CPU=y
 CONFIG_LIVEUPDATE=y
 CONFIG_LIVEUPDATE_TEST=y
+CONFIG_LIVEUPDATE_CPU=y
+CONFIG_ACPI=y
+CONFIG_ACPI_PROCESSOR=y
+CONFIG_ACPI_HOTPLUG_CPU=y
 CONFIG_MEMFD_CREATE=y
 CONFIG_TMPFS=y
 CONFIG_SHMEM=y
diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index 2dedd5fc2534..b3c9cd7ea653 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -530,4 +530,255 @@ TEST_F(liveupdate_device, preserve_many_files)
 	ASSERT_EQ(close(session_fd), 0);
 }
 
+static int find_hotplug_cpu(void)
+{
+	char path[128];
+	int cpu;
+
+	for (cpu = 1; cpu < 256; cpu++) {
+		snprintf(path, sizeof(path), "/sys/devices/system/cpu/cpu%d/preserve", cpu);
+		if (access(path, R_OK) == 0) {
+			snprintf(path, sizeof(path), "/sys/devices/system/cpu/cpu%d/online", cpu);
+			if (access(path, R_OK) == 0)
+				return cpu;
+		}
+	}
+	return -1;
+}
+
+static int read_cpu_online(int cpu)
+{
+	char path[128], buf[16];
+	int fd, val;
+
+	snprintf(path, sizeof(path), "/sys/devices/system/cpu/cpu%d/online", cpu);
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		return -1;
+	memset(buf, 0, sizeof(buf));
+	if (read(fd, buf, sizeof(buf) - 1) <= 0) {
+		close(fd);
+		return -1;
+	}
+	close(fd);
+	val = atoi(buf);
+	return val;
+}
+
+static int write_cpu_online(int cpu, int val)
+{
+	char path[128], buf[16];
+	int fd, ret;
+
+	snprintf(path, sizeof(path), "/sys/devices/system/cpu/cpu%d/online", cpu);
+	fd = open(path, O_WRONLY);
+	if (fd < 0)
+		return -errno;
+	snprintf(buf, sizeof(buf), "%d\n", val);
+	ret = write(fd, buf, strlen(buf));
+	if (ret < 0) {
+		ret = -errno;
+		close(fd);
+		return ret;
+	}
+	close(fd);
+	return 0;
+}
+
+/*
+ * Test Case: CPU Preservation Basic
+ *
+ * Verifies that a CPU preserve sysfs file descriptor can be preserved in a
+ * LUO session, offlining the CPU from scheduler and returning it online upon
+ * session teardown.
+ */
+TEST_F(liveupdate_device, cpu_preserve_basic)
+{
+	char path[128];
+	int target_cpu;
+	int session_fd, cpu_fd;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	target_cpu = find_hotplug_cpu();
+	if (target_cpu < 0)
+		SKIP(return, "No hotpluggable CPU with preserve attribute found");
+
+	snprintf(path, sizeof(path), "/sys/devices/system/cpu/cpu%d/preserve", target_cpu);
+	cpu_fd = open(path, O_RDONLY);
+	ASSERT_GE(cpu_fd, 0);
+
+	session_fd = luo_create_session(self->fd1, "cpu-preserve-test");
+	ASSERT_GE(session_fd, 0);
+
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, cpu_fd, 0x42), 0);
+	close(cpu_fd);
+
+	/* Verify target CPU is now offline */
+	ASSERT_EQ(read_cpu_online(target_cpu), 0);
+
+	/* Closing session unpreserves and brings CPU back online */
+	ASSERT_EQ(close(session_fd), 0);
+	ASSERT_EQ(read_cpu_online(target_cpu), 1);
+}
+
+/*
+ * Test Case: CPU Preservation Sysfs Online/Offline Rejection
+ *
+ * Verifies that while a CPU is preserved, attempting to bring it online
+ * via sysfs fails with -EBUSY. After session closure, normal online/offline
+ * hotplug operations succeed.
+ */
+TEST_F(liveupdate_device, cpu_preserve_sysfs_online_offline)
+{
+	char path[128];
+	int target_cpu;
+	int session_fd, cpu_fd;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	target_cpu = find_hotplug_cpu();
+	if (target_cpu < 0)
+		SKIP(return, "No hotpluggable CPU with preserve attribute found");
+
+	snprintf(path, sizeof(path), "/sys/devices/system/cpu/cpu%d/preserve", target_cpu);
+	cpu_fd = open(path, O_RDONLY);
+	ASSERT_GE(cpu_fd, 0);
+
+	session_fd = luo_create_session(self->fd1, "cpu-preserve-sysfs");
+	ASSERT_GE(session_fd, 0);
+
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, cpu_fd, 0x100), 0);
+	close(cpu_fd);
+
+	/* Target CPU is offline while preserved */
+	ASSERT_EQ(read_cpu_online(target_cpu), 0);
+
+	/* Attempting to bring the preserved CPU online via sysfs must fail with EBUSY */
+	EXPECT_EQ(write_cpu_online(target_cpu, 1), -EBUSY);
+	ASSERT_EQ(read_cpu_online(target_cpu), 0);
+
+	/* Writing 0 to online (offline) should succeed since it is already offline */
+	EXPECT_EQ(write_cpu_online(target_cpu, 0), 0);
+
+	/* Close session -> unpreserve and restore online */
+	ASSERT_EQ(close(session_fd), 0);
+	ASSERT_EQ(read_cpu_online(target_cpu), 1);
+
+	/* Verify normal offline and online now succeed */
+	ASSERT_EQ(write_cpu_online(target_cpu, 0), 0);
+	ASSERT_EQ(read_cpu_online(target_cpu), 0);
+	ASSERT_EQ(write_cpu_online(target_cpu, 1), 0);
+	ASSERT_EQ(read_cpu_online(target_cpu), 1);
+}
+
+/*
+ * Test Case: Prevent Double CPU Preservation
+ *
+ * Verifies that a CPU cannot be preserved twice across the same or different
+ * sessions simultaneously.
+ */
+TEST_F(liveupdate_device, cpu_preserve_prevent_double)
+{
+	char path[128];
+	int target_cpu;
+	int session_fd1, session_fd2, cpu_fd1, cpu_fd2;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	target_cpu = find_hotplug_cpu();
+	if (target_cpu < 0)
+		SKIP(return, "No hotpluggable CPU with preserve attribute found");
+
+	session_fd1 = luo_create_session(self->fd1, "cpu-double-1");
+	ASSERT_GE(session_fd1, 0);
+	session_fd2 = luo_create_session(self->fd1, "cpu-double-2");
+	ASSERT_GE(session_fd2, 0);
+
+	snprintf(path, sizeof(path), "/sys/devices/system/cpu/cpu%d/preserve", target_cpu);
+	cpu_fd1 = open(path, O_RDONLY);
+	ASSERT_GE(cpu_fd1, 0);
+
+	ASSERT_EQ(luo_session_preserve_fd(session_fd1, cpu_fd1, 0x10), 0);
+	close(cpu_fd1);
+
+	/* Attempting to preserve the same CPU in session2 must fail with -EBUSY */
+	cpu_fd2 = open(path, O_RDONLY);
+	ASSERT_GE(cpu_fd2, 0);
+	EXPECT_EQ(luo_session_preserve_fd(session_fd2, cpu_fd2, 0x20), -EBUSY);
+	close(cpu_fd2);
+
+	/* Attempting to preserve again in session1 must also fail with -EBUSY */
+	cpu_fd2 = open(path, O_RDONLY);
+	ASSERT_GE(cpu_fd2, 0);
+	EXPECT_EQ(luo_session_preserve_fd(session_fd1, cpu_fd2, 0x30), -EBUSY);
+	close(cpu_fd2);
+
+	ASSERT_EQ(close(session_fd1), 0);
+	ASSERT_EQ(close(session_fd2), 0);
+	ASSERT_EQ(read_cpu_online(target_cpu), 1);
+}
+
+/*
+ * Test Case: Multiple Preserved CPUs
+ *
+ * Verifies preserving multiple distinct CPUs simultaneously in the same session.
+ */
+TEST_F(liveupdate_device, cpu_preserve_multiple_cpus)
+{
+	char path[128];
+	int target_cpus[8];
+	int num_targets = 0;
+	int session_fd, cpu_fd, cpu, i;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	for (cpu = 1; cpu < 256 && num_targets < 8; cpu++) {
+		snprintf(path, sizeof(path), "/sys/devices/system/cpu/cpu%d/preserve", cpu);
+		if (access(path, R_OK) == 0) {
+			snprintf(path, sizeof(path), "/sys/devices/system/cpu/cpu%d/online", cpu);
+			if (access(path, R_OK) == 0)
+				target_cpus[num_targets++] = cpu;
+		}
+	}
+
+	if (num_targets < 2)
+		SKIP(return, "Need at least 2 hotpluggable CPUs for multiple CPU preserve test");
+
+	session_fd = luo_create_session(self->fd1, "multi-cpu-preserve");
+	ASSERT_GE(session_fd, 0);
+
+	for (i = 0; i < num_targets; i++) {
+		snprintf(path, sizeof(path),
+			 "/sys/devices/system/cpu/cpu%d/preserve", target_cpus[i]);
+		cpu_fd = open(path, O_RDONLY);
+		ASSERT_GE(cpu_fd, 0);
+		ASSERT_EQ(luo_session_preserve_fd(session_fd, cpu_fd, 0x1000 + i), 0);
+		close(cpu_fd);
+	}
+
+	/* Verify all targets are offline and reject sysfs online */
+	for (i = 0; i < num_targets; i++) {
+		ASSERT_EQ(read_cpu_online(target_cpus[i]), 0);
+		EXPECT_EQ(write_cpu_online(target_cpus[i], 1), -EBUSY);
+	}
+
+	/* Close session and verify all targets return online */
+	ASSERT_EQ(close(session_fd), 0);
+	for (i = 0; i < num_targets; i++)
+		ASSERT_EQ(read_cpu_online(target_cpus[i]), 1);
+}
+
 TEST_HARNESS_MAIN
-- 
2.55.0.1082.g2b9226bbc0-goog

