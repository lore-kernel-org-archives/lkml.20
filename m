Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122879;
	b=UUHeu1WM1XsfTsZPdx76sVpRwmCMDW4jp/eXJdXjI7dUUsGVt4Cb5Nx7OrKmbs4YdVeU
	 6E6yyFTrZH2RLmtjSwtDObjpoUQbePQA6JVPHQXcq8BTvgGjljHEITnmgqNESLhQ6j/Zb
	 lolq1rlFYkBkPTKzDzcOmOonZlF7Nu86CaKGVtw7gL7j/Wkg2tenogLjjIelSg1fTbgKZ
	 Mo24JaoETKh1P72c2RnJlzlXcyJ0UjDngTD7eY2H1g2ay2+ORsXDvz5Wb8H2M8J1Cltdl
	 mBTbSWoKpyN2nGAxwku9TveK5xQu0fckzoG386V/yLrL1MQhRJ/5afenK3HAp7j8tyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122879;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=as9n+dNBfp1o44qNiI4p9jEq0z77VwxPRRD44uR3xLY=;
	b=5IlHKPKJzPlzgKxSTvhedMZXwqun4uJDv2jFGolKh7jBipBjAra8sFPky4vS25irVty2
	 ePz1eb59pdA/Mg4GabpNaM2j6lac4VTt3azkwJHhBoxalJm5fLFjW406hB4qLmjeDxvkX
	 IGFNu8J/ZhhCvRlIm9E2cO/VDEpdVrAZt5QDxUe3rczH/6hYUqbkuS0zeuG2JXljcMuvc
	 o+8X372zrX+JNjpDUEPqvAWSquMrWgtGtvrXz89KU1E7/FG3fjm0P3vjdJHYnwrQTA8ac
	 2cac2tgDrUL6KQHk/wbrIuuWjzwV6cXQu3n/fJdyxpFdf+cWb1R4R4Km/yhGA+hnMBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kGnzMWBf;
	arc=none smtp.remote-ip=95.215.58.33
Received: from mta1.migadu.com (out-33.mta1.migadu.com [95.215.58.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31A8606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B31A8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kGnzMWBf
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4elqSwc3DAM5howwrqEHgu/Vk/FDsIcZJHWFPI3k6NI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794122876; v=1; x=1794727676;
 b=kGnzMWBfJQp2yk7gP3ByV94Oo30xQFkPnUMzpcRgIJvdiUTW9kyykkDH+8oZRtl+Tyn+HjvV
 VeWkGBNVcS9QrhAD29IxJSX59Jok/a4o84XAcwElVSYYeLsp1ZF3NOXosZIkUiArfW0aJGHc1z6
 LZyHphbVB6KgHSawy6iZBj7k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7e7fadc3522c9a21;
	Sun, 08 Nov 2026 07:27:56 +0000
X-Mizu-Trace-ID: 7e7fadc3522c9a21
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-kselftest@vger.kernel.org,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	surenb@google.com,
	hao.ge@linux.dev,
	abhishekbapat@google.com,
	brauner@kernel.org,
	aniketgattani@google.com,
	peterz@infradead.org,
	thehajime@gmail.com,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] selftests: Add missing generated files to .gitignore
Date: Sun,  8 Nov 2026 15:27:35 +0800
Message-ID: <20261108072735.36842-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.56.0
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

Add .gitignore entries for test binaries that are generated during
a build but leave git status dirty, and add the missing .gitignore
files for the alloc_tag and nommu directories.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---

These are all trivial one-liner changes, so I have folded them into a
single patch. Please let me know if you would prefer it to be split.

 tools/testing/selftests/alloc_tag/.gitignore  | 2 ++
 tools/testing/selftests/coredump/.gitignore   | 2 ++
 tools/testing/selftests/exec/.gitignore       | 4 ++++
 tools/testing/selftests/membarrier/.gitignore | 1 +
 tools/testing/selftests/nommu/.gitignore      | 3 +++
 5 files changed, 12 insertions(+)
 create mode 100644 tools/testing/selftests/alloc_tag/.gitignore
 create mode 100644 tools/testing/selftests/nommu/.gitignore

diff --git a/tools/testing/selftests/alloc_tag/.gitignore b/tools/testing/selftests/alloc_tag/.gitignore
new file mode 100644
index 000000000000..30fa3b6712c0
--- /dev/null
+++ b/tools/testing/selftests/alloc_tag/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+allocinfo_ioctl_test
diff --git a/tools/testing/selftests/coredump/.gitignore b/tools/testing/selftests/coredump/.gitignore
index e32f6e9006f6..6a9460c4450f 100644
--- a/tools/testing/selftests/coredump/.gitignore
+++ b/tools/testing/selftests/coredump/.gitignore
@@ -4,3 +4,5 @@ coredump_socket_test
 coredump_socket_protocol_test
 coredump_signal_test
 coredump_worker_test
+coredump_notify_signal_helper
+coredump_notify_signal_test
diff --git a/tools/testing/selftests/exec/.gitignore b/tools/testing/selftests/exec/.gitignore
index e42ecd4c908d..d39df26e5cf9 100644
--- a/tools/testing/selftests/exec/.gitignore
+++ b/tools/testing/selftests/exec/.gitignore
@@ -28,5 +28,9 @@ binfmt_transparent_interp
 binfmt_misc_loader
 binfmt_loader_payload
 binfmt_loader_payload_static
+binfmt_bind_interp
+binfmt_misc_delim
+binfmt_misc_disabled
+binfmt_misc_selfpin
 *.bpf.o
 vmlinux.h
diff --git a/tools/testing/selftests/membarrier/.gitignore b/tools/testing/selftests/membarrier/.gitignore
index f2fbba178601..031920478205 100644
--- a/tools/testing/selftests/membarrier/.gitignore
+++ b/tools/testing/selftests/membarrier/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 membarrier_test_multi_thread
 membarrier_test_single_thread
+membarrier_rseq_stress
diff --git a/tools/testing/selftests/nommu/.gitignore b/tools/testing/selftests/nommu/.gitignore
new file mode 100644
index 000000000000..37da7c4765cd
--- /dev/null
+++ b/tools/testing/selftests/nommu/.gitignore
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+nommu_mmap_test
+nommu_mremap_test
-- 
2.56.0

