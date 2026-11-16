Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836349;
	b=Aa2o0ZWVfUCHjCN0IK+hhRJC1MpcLKikvv8UR4m2GMjmORbZO98XtV6Uoc385/Pf12nh
	 Yjbc4YNDvP2mM/Z8ljaxVQsArhBa5oa5FnKC9xdCEKhfJs8t/03ytFpDw9YHY6jguOLEl
	 8pjscG9QhjR9zVjwP9nmhN1ulXKUxXNvphMlOMQRWiRAs6iNRNba3av8VtGTQ0QRpA5He
	 mRUaRCf5vOFbPy5bKXAbLvb+nv8Trf0e4YRUtH4j7+nKW41o97b0R/G4BwPNPJY9ngbSn
	 PJbOxxg82zy43yzNaFGId9NSbuO934dOms8NHWAvde5R2q4ZzxS00NKWnRN1kfFEs7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HsELSAnxZihj6ZkiimEvCuTIFKXoiz4Ga8/+1nOu6fs=;
	b=pJCsN22q+Vham+DuQ+hwQA3bI4igc7yIhqENAqvh19yf2IprL2UEuk8OW6p5roNB8a6C
	 2U5Y+BC8LFvC41AVj9hC3Sg0uZoAmATAbREecGwD2lYe/JeElOnX30gTDpqZBCb7hJczi
	 bfUsd13fFkdrC7E9nxlI+z+TTlGU7685l88tO7vKSP5fClr3ZVMHfJi7kI96KqQXR8l0I
	 ZFFQxgqkqeCgbDxffXmrra89PBWUTRva0tmhP+HGEoV3odC7GdCx3pSqFW8uGamq1GhpI
	 cP2PNq8MV872eQ0W057l2TSBVQmW42lFjPzk8oxlfVdlpKyfCHyC55YMHYlb3CWRLgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQVNaGWY;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF521606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF521606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQVNaGWY
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4322d310e7so636035666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794836347; x=1795441147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsELSAnxZihj6ZkiimEvCuTIFKXoiz4Ga8/+1nOu6fs=;
        b=fQVNaGWYmeClC+iZ5aQrT2xu4pWQ7xor+FJzP7Vz2OIGAYwCe67gtufjbbImSINN3n
         UO2jkZ0DKhUwCsCd6coLqb1Gx+xCqWEmzecVe4PczqQzaQ7wPLknCr9JLQDRw6xeG3uV
         eboCkLF6AGb4CQORCOgxrK42uN+sd05JmMv1vySKwmu/TTu3Y1k4xAf7gaT6mlVRO74I
         nhqQJOqydmzv32StJKgB98cKraU4xkfgTz9FLErM5Yad2WAfzVeegpVRb2Q2xvmzvAR5
         cz7rmKlTQCyfCvBBicYeyMcX1rNWfvRmVZsMdxx4c8NcLD5x7IbT55qvjnX4NmBQgj7h
         RBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836347; x=1795441147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsELSAnxZihj6ZkiimEvCuTIFKXoiz4Ga8/+1nOu6fs=;
        b=XhMM3DPmNXphvGi9iyc/oeuNmZWhvFIJ5BPDlsyng5xefz+q9GE0MEKSMIa/mdj3g9
         lmsd0WMAZ+FBVCMmv0gJKX3U4JwpUf4DA1Gg40h7NvxFzs+FsUg4rIlURT4y9FVzi3XX
         kMU2s+B10xAst1jLIwuqiFZN68LhMI/fX5jT3DyN9PtQpk5I1wRGLZNZJTX15MlXzBs9
         PUzipXMnPFp3DE0LUen6byBIgOntLssq0Sy1SGoWBM4gIHjN6OyeLotbahI9RaX6/g9r
         quldMbIwS63/K6KQgXuATcsY4RLhCIYtKQf4YJq9ZtiX1BqahLhm+EnuHH6XMYterDS8
         cRmg==
X-Forwarded-Encrypted: i=1; AL+hErHmkGTBjp6zKNVWnnEn9l2gUu3q8YeMOQ17DI1cvhvidaHVzW/7DSSKKLt2eNpuRxtU/UdzwAr+h5npVJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4h8gE63PLFj0udhNQ173XMZXmcrh5jsCwbp4/TnP/fpg6SlgD
	kWQY0ZYowHFr+VBK6X36C2hspzgJBopei6kpZH7mmdML6gjwKF5n82Ki
X-Gm-Gg: AYBFou1qhJ/C3rfCFx/BFInUiROZ5QS7di29+LEQCdCDLAA4Mb0CzDcg6z2fssA+nTX
	VA/PjzOoz+ZysqpqqfmhHEJOHHNctDmoC1U4cQ/ELN2/STpYDON4oMopuBMowfrPHmFSe+FDkUZ
	+oa7T5bIzJifrChsEFUYxi7tqaL/6PqsOwWPOcfsD9214m75QxZri1wzSPtmrXRpbAjshB/hEAm
	1mMizhVXJFNI3QZ9iZSACQ8zmYDa7ysFHBcJfFG3XsQb6GLEcSY4FWHL1vVI0wtpW+TjZk4wMEO
	3gosZJ/o21DBYD+NHBaUv/0q0WaJI8B9SVSpkDUqC0VKLVLQwAqY6O2hHxI4bFPLi9/iYBTcGM5
	AeXHHhDE0jXnHi8ZqrYNBBOcWdF8VbrdrcuOp3woTBbcg/+958M5SZSMAH+eLmJYl87x+4sBpCZ
	LPm/5/yjqbbGg0AcPxygSYfG6YZ6/BTaIqKT7vM91PqD/GY01akPgUyGw3SyLdzKx4HkC1FrWqC
	k9UBaM5sRbHtzYXmrDkjS9RhI3Xj8t6xb+IlHwzutlKObt8FSb2gnJHIpkKFmDpCJhoorNzqw9k
	yT1xUF0uQeq6yjSkFSs8t17eLiqFZoprHetyzdvbYpV1trpJxnl1ATJfzN97aQfBzy4LFt0SkSc
	D48/6ldMZlRpnk6S842aFeuqv3UZmEa84vxHkBNj4OGzI8KzYnonRiac5y9JTd1MkX0Bp8OQUBM
	iwN8PtmTkPhv+PvrXYErp/thsrZjtxoLcFNQSrwahBotH1/SLjP0GAXc0lBXpFJtjzIxIQ8lfzI
	Q==
X-Received: by 2002:a17:907:1c8f:b0:c31:fb29:a137 with SMTP id a640c23a62f3a-c5096313a83mr870027766b.21.1794836346930;
        Mon, 16 Nov 2026 05:39:06 -0800 (PST)
Received: from Ubuntu.tail0f733b.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50e9b2b5fasm61267066b.35.2026.11.16.05.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:39:06 -0800 (PST)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Ian Kent <raven@themaw.net>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	autofs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Subject: [PATCH v4 0/2] kernfs, sysfs: refuse splice on /sys/power/resume
Date: Mon, 16 Nov 2026 14:39:01 +0100
Message-ID: <20261116133903.400202-1-krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series refuses splice on /sys/power/resume and gives writable
opens of that file separate lockdep classes, as Tejun suggested in the
v1 discussion.

The reported cycle is assembled from two operations. Splice into an
ordinary writable kernfs file records pipe->mutex before of->mutex. A
normal write to /sys/power/resume records of->mutex before the autofs
pipe locks when resume_store() resolves a relative path.

Patch 1 adds SYSFS_NO_SPLICE and kernfs_ops->no_splice. Every open of a
marked file refuses splice. Only writable opens use separate of->mutex
and seq_file lock classes, because only they can reach the store
callback which creates the reverse dependency.

Patch 2 marks /sys/power/resume. Normal reads and writes stay unchanged,
including a write which resolves a relative path through autofs. Rafael
acked it to go together with patch 1.

Other stores also look up paths. They remain outside this minimal series
and can be marked in follow-up patches.

Tested on v7.4-rc1 with fresh builds of the exact base and the patched
tree. The original C and syz reproducers report the lockdep cycle on the
base and run without a lockdep report with the series. Splice and
sendfile from an O_RDONLY open of /sys/power/resume return EINVAL with
the series, while read() still works. All 33 QEMU cases booted and
completed in both phases. The builds, W=1 checks and Coccinelle checks
introduced no warning or report.

v4:
- Refuse splice for all opens of marked files (Tejun).
- Keep separate lockdep classes limited to writable opens.
- Add no-splice operations for read-only regular sysfs attributes.
- Keep Rafael's Acked-by on patch 2, whose code is unchanged.

v3:
- Rename SYSFS_LOOKUP and ->may_lookup to SYSFS_NO_SPLICE and
  ->no_splice (Tejun).
- Drop the mmap, prealloc and binary attribute checks (Tejun).
- Add Rafael's Acked-by to patch 2.

v2:
- Replace the v1 locking changes with per-attribute splice control.
- Preserve splice on read-only opens.
- Split both the open-file mutex and seq_file lock classes.
- Reject incompatible mmap and preallocated-buffer combinations.
- Reject SYSFS_LOOKUP on binary attributes.
- Rebase onto v7.4-rc1.

v3: https://lore.kernel.org/r/cover.1794479968.git.krystianmkaniewski@gmail.com
v2: https://lore.kernel.org/r/cover.1793715774.git.krystianmkaniewski@gmail.com
v1: https://lore.kernel.org/r/cover.1792577179.git.krystianmkaniewski@gmail.com

Krystian Kaniewski (2):
  kernfs, sysfs: add SYSFS_NO_SPLICE to refuse splice
  PM: hibernate: refuse splice on /sys/power/resume

 fs/kernfs/file.c         | 51 ++++++++++++++++++++++++++++++++++++----
 fs/sysfs/file.c          | 23 ++++++++++++++++++
 fs/sysfs/group.c         |  4 ++--
 include/linux/kernfs.h   |  9 +++++++
 include/linux/sysfs.h    | 22 ++++++++++++-----
 kernel/power/hibernate.c |  3 ++-
 6 files changed, 99 insertions(+), 13 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

