Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76DC3A5E97
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437383; cv=none; b=esmXech3LOohi+OVSqr2pPHBSNa52/YtTv2UnLYGKzvj/xaHyO91p79tzc/M/bDVeQo7NY5Adfhmi2nRWyZ8ldS7jDLc1sSxliCcTr+fOGkxYIhqEuxPjP3A6Nfh0UUWEp1OefhsRkpA2YeQBgWjEbCzmMTnlvrYUMnvwPyd85s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437383; c=relaxed/simple;
	bh=niVvTWNk3QWOalqFTP346D6I7kaju0YJcJoHhRrZRGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XxA3FSm9Zfn8b6nLK4HQ9+C9MzI1c6oZ33veX7dsU6cLgw7PLNSMD4PERzn5UVftGhFcF88Y53EfCb4YSvI+6GFhqpTVj4ls2HnNb/hzxKDqEWlgqFgWGz3OG6LGE1zrr+HToPYH055IDDTF5bpOydmZ8zidYd06G3Swqu+/4Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGashld6; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGashld6"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ccd0887c542so1176775a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437382; x=1792042182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Eincc2xR/aQzEUZWBEcbooh1c8vCK29qIoSJ+5aX63E=;
        b=WGashld6RPycFq2DvZkoaHoTT+6zkPDGfIqrj7dC9DsmxxABDEdejDf/17mHTK0Pth
         hkbH5bRZ2ca1CTZFg9zh3dCnen3jWSo+qewrI4iqIqtuPC8M0DY+6GL2trCqm7bevyDg
         HzJiJ0cjThCoRTmFA4tTv8QNcwenK4uj9rgk8xsvOS/XbzkpVus4ZF0i1bRAv5vXEqZn
         TrTBPbNhct0xKoA79wn4jkxLKor0pp9BhRQTEd7h6X8EluX+Q7eNo7rcXL5BDHHQdvDy
         BcPjYpiYikkQAkLIn1R57CBQolfectDdJ/cEZvGOfLBIKSBvga4ig4ESRYDItsqwdNft
         S0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437382; x=1792042182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eincc2xR/aQzEUZWBEcbooh1c8vCK29qIoSJ+5aX63E=;
        b=t1HB8076E8sjbAq9L22fQnk0RxD5rq1uesUT8EB2eJFFwZ25BDQfkK+9J9O3wP6Bxm
         o3ZUtq202Yvx2LxsuIiIIasVqCcXGsqqYd5qycz0EhshTAAYoDS8x7BRmdUtTZIDeDj0
         CZos1r9BMsnduqnlo5Ieb5dMDstDV6348Xa8HzC37CQh9DC/fSD96i37n9qkCU+jZrqn
         2+3aP3u7fwXgrAhr+HnSI7mUuOVx8TgYUOzUNvsxILy4fgTWsAafnsYm/DWI3diPV2N2
         QAqTXIp+Q/0lV+h6Z9RfK5Y2QpxURuPbor8pHvCsLgeDneSsoZbhDXrQghJ/Om7Gjcgg
         TGyw==
X-Forwarded-Encrypted: i=1; AKwUvByzvd7ysK+3mXNgqMqVvWbagYxEJe3Ty8fLLaDlUMHsZEc3L92GVr1VaTmijB+6z8DbAtTFM3ixfO/0174=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIIHZKIeMl3VzmANDT/krGmzULIfeCNzNrA97n+6lZAYyBrc8w
	+j4TphKltLMomskAG7s1MnB6zZhZcZxB4QbUTM2vlsN4cckJzsuqJzcMpaIKHQ==
X-Gm-Gg: AYBFou0nKm5++v6/Wi89Zojc15jHklMlKLS1lhSH8uwkA1f+AWDoVVQVyIaAlhgbVJx
	5Sr8DWtSFFlUNB8476xGaceZlEED80gs1lKMc+jsgHfrguaw2XrbnuKCcKzVuNmPTPLMHcMez+O
	bf42I7u2TDrY3n0OW9p/XHAfUZIu7M1+Uz6xV87wGQ47niVDKVfF4u1P71u0oT5PH3fH2PxHmwc
	sLChwNJdsJcP7bSQRkWmyTOAAQqifLW3LmJPVRfqBka/DiPtIzsYom6nrjh15O31HSdgqbR4mRI
	Zy/tVrpRL3thMNgZHWNknzJsV7dSt52ciSKI64H1s2yS/vIizqp8M5Aul/6NCLNjKVJV/kaPers
	GcquJX4mIUzxVBQsZ8FkwuGPaUKLTBTxWX/8532Bym8JQmE6pQx/J2KNrJeK1QU1T4ENpE0/hNr
	wWxkHgaNdDyUNbvPBjGaA9BeagVqudDG4h6ZKOHmMGEGJr3JzsHkqy4jYljY/A8sEFYLk=
X-Received: by 2002:a17:90b:2584:b0:3a7:cffb:8b96 with SMTP id 98e67ed59e1d1-3a8a19926b3mr3521076a91.18.1791437382014;
        Wed, 07 Oct 2026 22:29:42 -0700 (PDT)
Received: from dungbv.. ([116.98.134.138])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7a7445sm2484574a91.5.2026.10.07.22.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 22:29:41 -0700 (PDT)
From: Bui Viet Dung <dungvn2345@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Bui Viet Dung <dungvn2345@gmail.com>
Subject: [PATCH] wifi: cfg80211: Pin module for debugfs file operations
Date: Thu,  8 Oct 2026 12:29:36 +0700
Message-ID: <20261008052936.555554-1-dungvn2345@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An open debugfs file retains its file_operations pointer in the
debugfs proxy state. However, the file_operations defined by the
DEBUGFS_READONLY_FILE and DEBUGFS_RADIO_READONLY_FILE macros, as well
as ht40allow_map_ops in net/wireless/debugfs.c, have no .owner set to
THIS_MODULE.

As a result, full_proxy_open_regular() calls fops_get() which succeeds
without taking a reference to the cfg80211 module. When CONFIG_CFG80211=m
and wireless debugfs is enabled, a userspace process can open any of these
debugfs files (e.g. /sys/kernel/debug/ieee80211/phy0/rts_threshold or
ht40allow_map) and keep the file descriptor open while the module is
unloaded (rmmod cfg80211).

When the userspace process subsequently closes the descriptor,
full_proxy_release() accesses the already unmapped file_operations
structure, triggering a kernel oops in full_proxy_release():

  BUG: unable to handle page fault for address: fffffbfff8056f03
  #PF: supervisor read access in kernel mode
  Oops: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:full_proxy_release+0x8e/0x140
  Call Trace:
   <TASK>
   __fput+0x39f/0xa60
   fput_close_sync+0xff/0x200
   __x64_sys_close+0x8c/0xf0
   do_syscall_64+0x115/0x6a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   </TASK>

The issue was discovered via manual code audit of
net/wireless/debugfs.c.

Set .owner = THIS_MODULE on all debugfs file_operations tables in
net/wireless/debugfs.c so that debugfs pins the module until all open
file descriptors have been closed.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Bui Viet Dung <dungvn2345@gmail.com>
---
 net/wireless/debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/wireless/debugfs.c b/net/wireless/debugfs.c
index f9e7fff1ef25..63503dbd8938 100644
--- a/net/wireless/debugfs.c
+++ b/net/wireless/debugfs.c
@@ -24,6 +24,7 @@ static ssize_t name## _read(struct file *file, char __user *userbuf,	\
 }									\
 									\
 static const struct file_operations name## _ops = {			\
+	.owner = THIS_MODULE,						\
 	.read = name## _read,						\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
@@ -42,6 +43,7 @@ static ssize_t name## _read(struct file *file, char __user *userbuf,	\
 }									\
 									\
 static const struct file_operations name## _ops = {			\
+	.owner = THIS_MODULE,						\
 	.read = name## _read,						\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
@@ -113,6 +115,7 @@ static ssize_t ht40allow_map_read(struct file *file,
 }
 
 static const struct file_operations ht40allow_map_ops = {
+	.owner = THIS_MODULE,
 	.read = ht40allow_map_read,
 	.open = simple_open,
 	.llseek = default_llseek,
-- 
2.43.0

