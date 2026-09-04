Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8731138B7D6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562271; cv=none; b=ppQVHH6TDOLdEh3NbiWEzao8mW1ht1zQ5OB8xhpl+hwxOVjRCcL1WhxXUoiNwKc335jR4uuzA+ZOhIqgq4vKBp4fxgFtCsfsyAyMmRyc0wUpyoSxIn38/+BG20/SI/8tQbW/WfcRKyoAvI3ohrn6aTuMH8iNe4ZwI6wj+LwQsZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562271; c=relaxed/simple;
	bh=BH0sJiRzFlk64hqG4rCWsKMMTvzMukqzBxeOy8VRpSU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ltud7l7dgV11sUitgewh0Xmaxzm12glD3ojnb0VfJoHnEkJlKme4V8oVuEggnEHFXOrPmYW1OhTiWzdIz0ooO+P7OgiFohfJwe/b7dYwREA9jUWUoa3KMoJtNiZJjX7v04qQt73fFppjkM5xHisrf4aTFQ0B0EMYP//fM0x2PIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AwWmW932; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AwWmW932"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c1cc5206so1833000a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788562269; x=1789167069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=etVT3JR9OsRtloAyimt/t5S2ubPCA2IZVBKjgKO3AfA=;
        b=AwWmW932FkhjNUV6DIYweOvyEHcmC+At/HTdWgGsKzsaMLu41wtvvOQkahEZfEwFl1
         vHtrO4tB+YiweA/OBUXJE8DY5OUO4qTFZJhts0/onDK1jIAeoWNoQ7ztTz5nCvCIxLAF
         3dcn1FDWawsnRbGsDQEP1kH6n+hSAGVOw0Qce4aYhEJyJwzyWURAcxIe2EKGOOvkO5Px
         G3+a6VcvzPClmn0x5MuDwhgqtjb9TkVwWS4g4CmrR6cpvOKa7QRRkjKbaDrGS/6S7uiM
         gg02gYVjfYLqT7hi5nhnhrnNx1pFiRgHr0HzsCrLpYplizdHlij+FP6mb5lxMg9YNxLf
         vHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788562269; x=1789167069;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etVT3JR9OsRtloAyimt/t5S2ubPCA2IZVBKjgKO3AfA=;
        b=EY8xSVS06vixVSfThKXZ5h4NVZWKCjWl20JO6qBfTezpTrhvLfsDN6tH35ISqdsg3H
         NqNvHbbx442YOBSoeBpjyUipJDFcL2wXfBpUe+z8nvVMrDfw9l/GnBCPoOML8WjA/OHt
         a1RinM3de/iWc3PEkAiWEQ4nBP+RK8Vf2gmtkmCBSwbsJp6Q0ayUAAGHittuBKi43RPN
         fhMU6rd1T0y3Sc8FEQd4JT7Ljv3y7NMXXuspiFeo+SAwHMPxP699l1ztiWbuQrwPObrm
         mBTgPC2A0S9Vmx/K0kSYcfW+qtEDF3LYYp0WRm8SyaPb66qiMoZ/UXs8zRenX5/Esj6T
         l3KQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKWPVLCRwKOXtltvkrectV30tehc0eqDekZbw+En1mQNl3G52huFvgCqrTI/FsknKaWLI3W0kIpDF6XjU=@vger.kernel.org
X-Gm-Message-State: AFuF++naCjvMEwUmfw6pBNPNlq6OGB7+8TUnaxNM1sOi9YOC4sdqRSXf
	zBEEPvtctGQwfEIQKqzkKJ3ww/DltifVm9i7m9OTBRDUvtq/1Fhr+1ksnc+Qk+CKxM4jRv4ys4J
	Q4Byjvpj9SQ==
X-Received: from pgu38.prod.google.com ([2002:a63:1466:0:b0:c9a:53ea:434a])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4388:b0:3da:1e2f:3be9
 with SMTP id adf61e73a8af0-3da3a0b0070mr14239936637.22.1788562268577; Fri, 04
 Sep 2026 15:51:08 -0700 (PDT)
Date: Fri,  4 Sep 2026 22:45:13 +0000
In-Reply-To: <20260904225103.2955759-1-wfelipe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904225103.2955759-1-wfelipe@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904225103.2955759-2-wfelipe@google.com>
Subject: [PATCH v6 1/3] selftests/cgroup: test_zswap: wait for cgroup to
 unpopulate in test_zswap_writeback
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wilson Felipe Pereira <wfelipe@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When running test_zswap on a single-core VM (-smp 1) with 4GB of RAM,
test_zswap_writeback intermittently fails on the initial run after boot.

In test_zswap_writeback(), after waitpid() reaps the child process created
by test_zswap_writeback_one(), writing "+memory" to cgroup.subtree_control
can fail with -EBUSY. Under cgroup v2, enabling domain subtree controllers
is forbidden while any tasks remain in cgroup.procs.

When a child process exits, exit_notify() wakes the parent process,
allowing waitpid() to return immediately. However, the cgroup populated
task count (nr_populated_csets) is only decremented when the exiting
task is switched away via finish_task_switch() -> cgroup_task_dead(). On
single-core systems, the parent runs before the dead child has been
switched out, causing "+memory" to fail with -EBUSY if written immediately
after waitpid() returns.

Fix this by waiting for cgroup.events to report "populated 0\n" via
cg_read_strcmp_wait() before enabling subtree control.

Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
Acked-by: Michal Koutn=C3=BD <mkoutny@suse.com>
---
 tools/testing/selftests/cgroup/test_zswap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/se=
lftests/cgroup/test_zswap.c
index 609c48f38524..8f2c9aa4776c 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -408,6 +408,8 @@ static int test_zswap_writeback(const char *root, bool =
wb)
 	 * Thus, the parent's setting shall be what's in effect. */
 	if (cg_write(test_group, "memory.zswap.max", "max"))
 		goto out;
+	if (cg_read_strcmp_wait(test_group, "cgroup.events", "populated 0\n"))
+		goto out;
 	if (cg_write(test_group, "cgroup.subtree_control", "+memory"))
 		goto out;
=20
--=20
2.55.0.979.g7e5102b832-goog

