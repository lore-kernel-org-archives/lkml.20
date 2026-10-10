Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5B33328FD
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791676019; cv=none; b=tg/v7S6PdEyrIJ0v7EtuglCCz8ODvRQmjLmzorcihiukn2/ZF8Gjpz7lrVlDM8XBZzymqNB1jALcMhTd+HmhDWXx3t9Qd6r0qJtx4+cplc23NG0QukoyT7VSzM8wZ/KpbPg3StcMNpMFyfBnXsVqiKSmJYRvx7yY+cv1dIoTit4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791676019; c=relaxed/simple;
	bh=2hvFsAf8JAV1vNTH5rf2/2G92H15dI0BJwMTejjyruw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KENyD5bSYUHCPY1ybA4lh8fAcn4gkmQSUZRCzzCglTW2WVc2qp364zt35XUvGc44iy1wP1rBnbSnXY+Lxulgyab0GWQz0fdU4tB/orkjJ/drC3DJHBscTpypmAgPnHhcxIz5MUCwHoM1CTPzjzzgwcWbKCTSzm5E+l7Mk5qYvuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=IzTA7/Vf; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="IzTA7/Vf"
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C132F3F28B
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1791676007;
	bh=pQvssHYBZZeCPq+XUhxAF5bUl+NBotKc8Bo70aaWCyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=IzTA7/Vf1/0N+9t2h+6/OwgKSN2rskBtFqQQi2wZjjnLYH4nACZsOrNpP/4fNih2y
	 /fw26622i6x6z0rpUKCpYT4/gkE5bx4Jdei5vTBu76uMjZ/9gpEfYlY9LyVdCJGI0r
	 zhA89dC5riH8yHcij7hQwrqIVeqMyuOQNPvPGofrJd7mh8950/C2Nz/9t5r2xRX65J
	 E9pBszcyeSwLZDnSXQJsQfT6jz8HwNuCRFnzR+M2oGb41aSY9Fy5hiQ25kcWz2oHVK
	 JKLa7RhodFvFDPB74B93BnS0TIhsE/1kIfD0s1Vyd5b0Be8v68wgOzkU599/hxFbC/
	 j2dYbc66cMkcvUsBQ1KjIl2vjo+y5Xc/yqf73XzUjP0r0NitDau2+vj3HU8ZbeLTk1
	 CHOJDtoMATOiLlZR4hjFL73Nxb17JYypxVn9xebec0oKB3GSUEd0/Zq3Yduhzj49zZ
	 8bTux80FK44MJvhJDZX0Sx7Pbn2Rx3kIdQM91EcvNZExTqcyWPmxSizd21vQ+A4Oy7
	 kkujupwwzcA5lU/i89Lns+bNoviKQJTL2OE+IpD6qKrTeoSR+KfCAZdzqTQJU5My6Y
	 y1pAu0Hqrhw1Tgm6jpnNQUbTLMb0kUkCSxO+IFV9awYBKWzUu7W7cMhWzQmtKJhog7
	 Ff/XIWNfGMi6Dq6R+m7YX4Cw=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so6045115e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791676007; x=1792280807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQvssHYBZZeCPq+XUhxAF5bUl+NBotKc8Bo70aaWCyo=;
        b=ZjehDv4RJ+QC5cP4OXeviCWRwfLL2I18+3WVzjkOc6Z1Ef53h7nNFG7eAa8dQfiLzt
         m80fkiiuplMNy7OQen8UDhK9GFKWfx/D3zzj3mba0JfxGj8eGUoBsIVau9FUcJRgpVhq
         wPZKEZAf3vylq+FoBocvQthD8Tu/9uXeMc+E0/OlEzabj0LqY6VihlmRyEAEfWYrJvru
         35b/O22d9jqnjPAMURSMtiIBcgYA6OtmiPF3ejt5FXYeIQeOAHK88sXFI+uGT5JOCv7T
         sbztvzrx8o5zPGc782tn+PUjUIi2EF+WCH416lEgjY7emHegRkLdET7O1lghsT4Q7Ob2
         ch6w==
X-Forwarded-Encrypted: i=1; AKwUvByIJVllEvXLga3OIkMNC0oNiNf3PQ19rsxa2BO/axW0WLV1NO4/s2BDNJt5KWbjBVWaECMMQ/jB16uNABI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAOYBTq7iSFdI5MLf8j1UjO8G5FqT7LmvoATD0Ivr++QxviJto
	/5Z68GAOWZsnis6EoXsh67HiA1C6BU9AFa8KqHzvjx8cewg5HKNkWmIpBkI70VngrK/UcE9fBca
	aeZQgM6K01w6nyv+kNAqXcZW9IVQU+60ZbQBFviTcbkH77o6XL9qhIOL5bq9PF/uL6+tgETxGgC
	Pgm4Rb6uOzrAZdykcPVzo=
X-Gm-Gg: AYBFou2Dyd9r5W0ZGI+eGxyqxV90MTpS7esg4vv9HFs3q4D5qhDEwIrO8A/vsCEd8DO
	Xp+Yxv5afO5FzOzA3Yia3v+Nh30vRqmnnHiwmkWAd38sW4ty3PeZfbdkj9lBL8T35q28cagLLye
	Yw/wx9FUyi3hmVLwOtTMCt0F3wf9Tsr6X1ehLvPRUhQVG9sYxKns/1vZ1bdrqnjwHz6B8kruGc7
	BtiODjXYeQJpYeWSLR1fTCQZTwf2CatEsd8DBld2xk+dMcp5fBBaByLGcnGx0jh9xXljshV1jOw
	NQrYZsIoQ5pE1RN0t0cP85d6CzvBpYfNgNwTEfMcezw9SwojxJ3dEmUX4JHLoFzW045ZyQ==
X-Received: by 2002:a05:600c:8708:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a18e49881amr99936215e9.8.1791676007282;
        Sat, 10 Oct 2026 16:46:47 -0700 (PDT)
X-Received: by 2002:a05:600c:8708:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a18e49881amr99936095e9.8.1791676006955;
        Sat, 10 Oct 2026 16:46:46 -0700 (PDT)
Received: from localhost ([2001:67c:1560:8007::aac:cab2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm85743135e9.1.2026.10.10.16.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 16:46:46 -0700 (PDT)
From: Sarah Emery <sarah.emery@canonical.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Sarah Emery <sarah.emery@canonical.com>,
	Hui Wang <hui.wang@canonical.com>
Subject: [PATCH v2] selftests/ftrace: Account for 8-byte aligned trace_marker_raw events
Date: Sun, 11 Oct 2026 01:46:45 +0200
Message-ID: <20261010234645.173550-1-sarah.emery@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

trace_marker_raw.tc expects the length of each raw event to be rounded
up to a multiple of 4 bytes. That is not the case when the ring buffer
forces 8-byte alignment of events (CONFIG_HAVE_64BIT_ALIGNED_ACCESS):
the id plus the data is rounded up to a multiple of 8 bytes instead, so
trace_pipe shows 8 * N + 4 items. This was seen on riscv64.

Make the test accept either rounding.

Fixes: 37f46601383a ("selftests/tracing: Add basic test for trace_marker_raw file")
Reported-by: Hui Wang <hui.wang@canonical.com>
Closes: https://lore.kernel.org/all/20260607072431.125633-3-hui.wang@canonical.com/
Signed-off-by: Sarah Emery <sarah.emery@canonical.com>
---
Original v1 patch from Hui Wang was posted in June and only patch 1/2
was merged (commit c37e0a4b79a6).
This is a v2 for commit 2/2, addressing reviews.

Changes since v1:
 - Drop kconfig_enabled() and the CONFIG_HAVE_64BIT_ALIGNED_ACCESS
   lookup. The review of v1 objected that it depends on the kernel config
   being readable from the test environment. The test now accepts the
   4 and 8 byte roundings based on what trace_pipe prints.
 - The expected length for the 8 byte case is unchanged (8 * N + 4).
 - Rebase on 65f26d15f7db ("selftests/ftrace: Fix trace_marker_raw test
   on 64K page kernels"), which changed how the test writes its events.

diff --git a/tools/testing/selftests/ftrace/test.d/00basic/trace_marker_raw.tc b/tools/testing/selftests/ftrace/test.d/00basic/trace_marker_raw.tc
index f985ff391463..dd2b94be0947 100644
--- a/tools/testing/selftests/ftrace/test.d/00basic/trace_marker_raw.tc
+++ b/tools/testing/selftests/ftrace/test.d/00basic/trace_marker_raw.tc
@@ -67,7 +67,8 @@ test_multiple_writes() {
 	# add a little buffer
 	echo stop > trace_marker
 
-	# Check to make sure the number of entries is the id (rounded up by 4)
+	# Check to make sure the number of entries is the id (rounded up by 4,
+	# or by 8 on architectures forcing 8 byte alignment of ring buffer events)
 	awk '/.*: # [0-9a-f]* / {
 			print;
 			cnt = -1;
@@ -77,9 +78,12 @@ test_multiple_writes() {
 					i++;
 					cnt = strtonum("0x" $i);
 					num = NF - (i + 1);
-					# The number of items is always rounded up by 4
+					# The number of items is rounded up by 4
-					cnt2 = int((cnt + 3) / 4) * 4;
+					cnt4 = int((cnt + 3) / 4) * 4;
-					if (cnt2 != num) {
+					# With forced 8 byte alignment, the id (4 bytes) plus the data
+					# is rounded up to a multiple of 8, and the id is not counted
+					cnt8 = int((cnt + 3) / 8) * 8 + 4;
+					if (num != cnt4 && num != cnt8) {
 						exit 1;
 					}
 					break;
-- 
2.43.0

