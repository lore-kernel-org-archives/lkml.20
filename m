Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870342;
	b=22j35S6RK5A4pah7381fpwG3AJ7kZr7PZvYp5JH3PaOOeeE0OpwyRXSq/iv83Z9Eriat
	 rHAykGXrCpN/M4AMtP8NqZsPIZw60oWkpEjxOa/7zHLacpC6NiamH3NoyAt1J/IIO3wvI
	 Gp5e9BrvExYid2kLQz/ffW2sjvVH/Mu63oeIu0Ip+v98CVda44wYB5XvYsNg4SUjyvwjT
	 Y2hnEGZhKgeSVTUB+K98wTSbdjKrZM2/KedYX5fbDa8Wud3gzjNpNh91Ek1vRHHP+s17K
	 X0hFy3nWLS4Y06gqL6EZmnIQiLsk1A4BoP5KaFNCthMgxE/dXIcpRyMnf6kRw7F8KkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PSS420+ZveM2uYmxbBh1j0bl8rEpgaKmjthRN6A2qTk=;
	b=gOJlS5HRCGT8AIFLbuDUO7Q+QBPeofwQLFns/xZd7s9/wZELafi+R7vPzXQXsG+lz2dM
	 R/ONanZ2QzKqcDEjzgMfuwsLSW5lVdl6K1vzn5Qsf5J+OLeEct8eTW99eFf8Rz6iiC4Fn
	 vei51SJLXGb98KMd9eUQ9UV3WGhp4OgugDs4jkjRrs7llg9C7smj0XI2spmeVNf3WjMwz
	 Mw/0BrXaSkvitnbkA4P9fZ2Cd3KjYLIV3lJgb+D6BF7aNScjjeRRn6xq+nNtKp6ZwYxbk
	 9Dx7jhIKp1aSzjUTN2+srXbj7ZVJpBet2HN7VA3JzJYlDMjkZ8YgV8N5pibDX814Q2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aYYzcOvb;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ABC606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97ABC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aYYzcOvb
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so16485215e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794870340; x=1795475140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PSS420+ZveM2uYmxbBh1j0bl8rEpgaKmjthRN6A2qTk=;
        b=aYYzcOvbMB97AMsyr7A+Q8c0NLSRRGix8a6FZ5H2GRfxGTICyFQO4TccT4m6gbSm6t
         qVaolZU5OyFysVC2aEvsfEy0xb1eBcRoT4Ob/NtypZ1bbFPEukVN9LGEyWNurtEiKYGf
         PS25OMmfFFSk+vSfUr0Ti4zB2kSM+RvWUBxgeHoh5MQqWnN+4QAfHo4YS+V03lBJridv
         TJ/NOZTy2DZdrguFMcuBD0UvA+P0nMHh6tbCHZhihcKdG8QNLRrnHyKTEqbnQYKrVhlM
         wFzfUW5pggBc9QDLROx1bMOieIw6rLVGEnE0HXSS810g6vcjrpdvCyUudRY3y3YNmN5/
         qdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870340; x=1795475140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSS420+ZveM2uYmxbBh1j0bl8rEpgaKmjthRN6A2qTk=;
        b=xT1Muw50nWU9L2CChx5D9HGfXuKehq/0+nLYY8BD+6kVMO7rhxrdvt/61W4Jq39jEk
         UR5np771oaJe2pBja/LTnQwIgakeFsT9C5JAYHOMrX93Rc6/9NizYP77r2BCLD3DZb8U
         MbXMZ1sN8j90yKUMmMywtpvuEI8ugBAbcONIpOWEOlxnZMCWlG0M7R9rhaYOsGjolKkk
         KFpdVO5wX0hWv62VUJURrSXFcn6erUl9G8/BSw05M+xUHobFE2rk4FOFQWA6gpMqf8to
         MMhCaU0F6JrRjMiDjg9o8GUxhHqBK1zWR2M/JSszwzlF/U67B9netQz/p8XQfqQhr/kO
         Hm0g==
X-Gm-Message-State: APuU4Z/3PqB15fGTCg5PslnMw1eBmGPuZic++DHGCpNQyiNWMefvBKE6
	JYssQQJ9PH9anOP0OC4+EIBo3jVe17W/Pb3W0gTe2PPYpOyoCN/iAML/CsenuqL6NxY=
X-Gm-Gg: AYBFou2djIiTFx+Vqz7DdMmkmbDkYnjUr76mEo1dBz2G/aABDrsKoa5WyTJZY7+VkYp
	k8wVmQ2VkOoUAtQU7IFYqHAdtiOGrQJbVbIeC6ZUZoCFXnM2PC0YO8rsIqMQwN/0Qz/vSbar70z
	spkKmr03QSbB9+5K3QsMz+pkpw27e6fPg/Kqg/796qlzj4lgsvJGl8s+JZWankI8jY29nzbi8Dy
	LHvtIcZW/Mp1387qhvARNLgBI0bA7rpC85TFxTixcMYwW15cIdJyjJrLQB395ZdUePL9hQiMTu3
	GkF5nG6pfi8nEWh/AQd86aAOKfhOPKtTKyLt967GZWv0YugX8sZoynHF6Y/1xajJRIWMcVzNRKp
	bi4olWI/b3DLkAG9cZBwQILjb9jAMb3x6zfXmyu7dX+GTku+TTvPrOyajqoXBmWOUUGAzDaF2k5
	aFa4M7nCJMoCinHudMOxib5OoMr0p3cl4WPp0906I9cpp45m2dvr4gpZAhFHRAo4EHqGxSuDG4j
	CAn0Tyfzn2bJECj+tEUTeLkaF3R3jQwxh0pSvY6LlO+jwwNHFIebb9Lcso3hyYVog1xbUzrPZk/
	WUHlsQg/WS01ZhXKj93Jyjs4
X-Received: by 2002:a05:600c:3553:b0:4bb:60b1:4409 with SMTP id 5b1f17b1804b1-4bb60b1448dmr209445495e9.19.1794870339869;
        Mon, 16 Nov 2026 15:05:39 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm20104945e9.14.2026.11.16.15.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:05:39 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] ntfs3: fix under/overflow in kernel2nt() due to unset sb->s_time_min/max
Date: Tue, 17 Nov 2026 00:05:26 +0100
Message-ID: <20261116230526.945330-1-koray.fra@gmail.com>
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

Because ntfs_fill_super() initializes sb->s_time_gran to NTFS_TIME_GRAN
(100 ns) without setting sb->s_time_min and sb->s_time_max, the superblock
bounds remain at their alloc_super() defaults of TIME64_MIN and TIME64_MAX.
When a user updates timestamps through notify_change(),
timestamp_truncate() does not clamp ts->tv_sec to the range representable
by 64-bit 100-nanosecond NTFS intervals.
When ni_write_inode() subsequently converts the unclamped inode
timestamps via kernel2nt(), multiplying by _100ns2seconds overflows or
underflows and wraps around, writing corrupted timestamps to the on-disk
MFT standard information and directory filename attributes and causing a
mismatch between in-memory and on-disk timestamps across inode eviction.

Fix this by setting sb->s_time_min and sb->s_time_max to the smallest
possible and largest possible values respectively using nt2kernel() like
other filesystems (e.g. CIFS) do.

Reproducer, with /dev/loop0 formatted as NTFS and mounted at /mnt:

  mount -t ntfs3 /dev/loop0 /mnt
  touch -d "@1000000000000" /mnt/test.txt
  stat -c 'in memory: %Y (%y)' /mnt/test.txt
  # remount to evict caches
  umount /mnt
  mount -t ntfs3 /dev/loop0 /mnt
  stat -c 'from disk: %Y (%y)' /mnt/test.txt

output before fix:

  in memory: 1000000000000 (33658-09-27 01:46:40.000000000 +0000)
  from disk: -844674407371 (-24797-05-02 20:10:29.044838400 +0000)

output after fix:

  in memory: 910692730085 (30828-09-14 02:48:05.000000000 +0000)
  from disk: 910692730085 (30828-09-14 02:48:05.000000000 +0000)

The reproducer for the underflow is the same, but with "@-1000000000000"
instead of "@1000000000000" in the touch command:

output before fix:

  in memory: -1000000000000 (-29719-04-05 22:13:20.000000000 +0000)
  from disk: 844674407370 (28736-09-01 03:49:30.955161600 +0000)

output after fix:

  in memory: -11644473600 (1601-01-01 00:00:00.000000000 +0000)
  from disk: -11644473600 (1601-01-01 00:00:00.000000000 +0000)

[ First paragraph of this commit message is by Sashiko, see Closes: tag ]

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-11bcb274-4eb7-4a14-af1a-ed7ab6b0b769
Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/ntfs3/super.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 29aabdc8a801..915722abef5d 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1325,6 +1325,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	struct ntfs_mount_options *options = NULL;
 	struct inode *inode;
 	struct ntfs_inode *ni;
+	struct timespec64 ts;
 	size_t i, tt, bad_len, bad_frags;
 	CLST vcn, lcn, len;
 	struct ATTRIB *attr;
@@ -1361,6 +1362,10 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sb->s_op = &ntfs_sops;
 	sb->s_export_op = &ntfs_export_ops;
 	sb->s_time_gran = NTFS_TIME_GRAN; // 100 nsec
+	nt2kernel(0, &ts);
+	sb->s_time_min = ts.tv_sec;
+	nt2kernel(cpu_to_le64(S64_MAX), &ts);
+	sb->s_time_max = ts.tv_sec;
 	sb->s_xattr = ntfs_xattr_handlers;
 	set_default_d_op(sb, options->nocase ? &ntfs_dentry_ops : NULL);
 

base-commit: 0c895b1f6ab37a7c72a437818f307ef6e629051c
prerequisite-patch-id: 26605e50ebd4bbfcfd30aca746348b6f79bc83e0
-- 
2.56.0

