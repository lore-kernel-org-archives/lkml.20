Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350933;
	b=yHlqJsyk+dewhtcEFtGvr33YUZQY2YIjn4u1vjk2g6MbDQdM6QWiXQRyrxeu9ReobLEl
	 EY2iq1pr/vneLufV/ImbsyHGPkhlmkn3fVNGTUvc5Iq9ReG5aivl6pz3W54q0wbWtHp4k
	 NDej8zdQ0zA+aKUo7aHjnoBeDKjo5ZSxC3zg6BKc0swA17uZVTVJ3SkcSUd7IsmrE1GnA
	 BartMWVeO/5nHwpZrrADEbwOQI/t/H8EhQtc/Oeoqyc7ZnjJqXa72Ur1zaEnGrkwMEftB
	 IArZRSklqvusgjvbABxKMYbRC99HfAq7FrbXtR93uIi9kU6cGcJUJIB/IY55+ht4qEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2Mihb4OPZBic55UeIz2xeg7uf8TjtjfwKjVCpWgCi8w=;
	b=jYchf30TWpetJNupA9xWoRJSCJRKOGB4mrN8CqAi6L0kITmLolWQe2/okwUizePYvx7/
	 PrWWWQbJKInudM1bKkeVzS0RGGawIMIwxgMcHBn3NgbHqTcXP58JU72R91AqsXRMuXFUv
	 ryUKxMTg+afuSFcSMaCocrumW9HuJ5xrnJmqSLy0sxYZ4Bcwio8gIWknzpcDddR32kymD
	 4c0QBL/tqu0i+5xIuKjL/mspbJkkp1im3ix6/7atzp+ejMqv5ucV5Rp+g/1p9HbMpggEk
	 wzV1fdL95KT/HPhh+kiLKHjLG/VrblgyZbq/M10ozBH3jqDhNbxx/DdM5v3r+A93uHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b="dbg1/IxO";
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AD7606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01AD7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=dbg1/IxO
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5363c8de563so5356681cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1793350932; x=1793955732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Mihb4OPZBic55UeIz2xeg7uf8TjtjfwKjVCpWgCi8w=;
        b=dbg1/IxOZ96hc3CHweDCGa5yfW18aW/qdKsZ36dESwYy/4+LqKm2LjwafpEoenOP3L
         KBnEKqqo78/1KSRUzRUK6zksH0nLRI638ih3w+LnUILAhwxqz1/TnX/HJXnll5CkPT0E
         U2qRG9IaXl1/2fITjEbMrYdEfGo1kLQgziGPtHlCDUYOwQCLdgBix8QuBT10F7jH9iso
         ZcvTyx7jmmrTYaxKJABa96QcNO9gFYVjRxOuoDk/eFUDkcNpuM4ABcgYI8ulSSXsGe3y
         yaGjTjAcpSJMroXXHfANtFep8YfXmGERoHVZiEr34KvHUcBixyM7RxLaL4tZ9EsNX0Mh
         kqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350932; x=1793955732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Mihb4OPZBic55UeIz2xeg7uf8TjtjfwKjVCpWgCi8w=;
        b=PLpUqpOVYPUCrqlUwYhPU7Zc9C2w0wrptrV+uvC7Wb48/aXssWceH/6OLtBD868sOd
         E5z06EUMaRiYO/ch1HL9+WKl77WL5Mptz8AmGgr6WP87CluBy4bfGn3z+m9NRmLsANoH
         lHACjGWB3dcbkmfdeAo5XqM64E27WP4fdY3sfdXmgFzWVGhktd30UlkOozwmG0X5lKRv
         /S5nge5n4WyJuxYUzbH5r9Jgg7kEKikHG66p0U2ELZDu6oNO38LLfZWEbtdVtFljq0Gw
         ZyT7RyBOEVmdwu7UUDMgPyweCzAuRHFWvU+D+4cQ493wYM+6c/aFPUqtzVSaJPjd8vUL
         M8BA==
X-Forwarded-Encrypted: i=1; AKwUvBw7Dsi1SOkR18CQJMT8fixi4aQCpaD0hjY5YIPhbTNnBIOVBWhxzl6AkcTThQgxJCtxPBki2nQlFCkIsPI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHedR49lIzpoL0NlUDayZjCQ2COaI1omzQ47F+6lcgploVLQhb
	oo+1cxQoajntufrf2EmXr2H9kn5UmsaveU96q0DANYroMYijlr98IsYn0ybbJ+J9Mw==
X-Gm-Gg: AYBFou3xjurCiQKCbdb21HEKT+gnq2vOfXCjwxWqkJqT9AfZJLRGfsDtfAtCp0IkUN6
	pvkPMDWrYMkv0lrNChfuXPAlHpflOCPbiKHeQyzGh+7u2tRuo5EDvBecovK4u3XIDngp3Xzl21/
	QC7wwOR44Gd3peWres+gTByM4aUlIzhRnN6io0TP9lPF+hjoQbBZi8y5qoiacDXfKcIH3FMTAtG
	y6zdt56MSA4+kpUinhYpdaQKm8GeqJFFQY3rNgY7YWs1l396/FKjjeuyYylwSzMVg4+x7aBcZfz
	EnH8Tn+enWIPqqZ/pyZxV15y7AXVYy6bWlUOIEcXaR9fN18FqYdOC0Hcy6ebvW329w7aa5rWMDC
	GZyWD+ZEKC49UBmMTDN63Ix0RGGCYmH0wWtTQkQN7xiMDvdtRpJzAVY12ia2NM2PzKYS7hPlCB1
	8rG48xYUCBci9zcq6NNcM8UzBLhVgPXg9QdogJ1JLWtET239WysbAR35thn2CbYA6jNsbTzW4dr
	dRfZYKRFn4M/PhgQUeQu9OIqxlrG8F33sTwKZXfOXhDNKRx9QrD77T2LPrIM/+W1Y+tPDnD/Bs0
	QsUWKwgGFTL/tj7W3P4FHj837rFHGNHigcSwlMZhcBR0lgmLURTi
X-Received: by 2002:a05:622a:408:b0:536:2fd8:a4d8 with SMTP id d75a77b69052e-542b6689ab9mr23251791cf.15.1793350931563;
        Fri, 30 Oct 2026 02:02:11 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54313234047sm8404251cf.28.2026.10.30.02.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:02:11 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: hirofumi@mail.parknet.co.jp
Cc: brauner@kernel.org,
	technoboy85@gmail.com,
	teknoraver@meta.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fat: check for hidden entries before overwriting end-of-directory marker
Date: Fri, 30 Oct 2026 05:02:05 -0400
Message-ID: <20261030090205.279419-1-hengyul@cs.unc.edu>
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

Since commit 6a2875517c77 ("fat: stop reading directory entries past the
end-of-directory marker"), lookup and readdir stop at a slot whose first
name byte is 0, and fat_add_entries() reports corruption when its scan
finds an allocated entry after that slot.

The scan stops as soon as it has enough free slots, though. When those
slots include the marker, the new entries overwrite it and the allocated
entries after it become visible again without being checked. A name that
lookup could not find can then appear twice in the directory, and removing
one copy leaves readdir listing a name that stat cannot find.

For example:

  mkfs.fat -F 16 -C fat.img 32768
  mount -t msdos -o loop fat.img /mnt
  touch /mnt/aaa.txt /mnt/bbb.txt /mnt/file1
  umount /mnt
  off=$(grep -obUa 'BBB     TXT' fat.img | cut -d: -f1)
  dd if=/dev/zero of=fat.img bs=1 seek=$off count=32 conv=notrunc
  mount -t msdos -o loop fat.img /mnt
  touch /mnt/file1
  ls /mnt

lists file1 twice.

Before using free slots that include the marker, scan the slots up to the
next marker and take the existing corruption path if one is allocated.

Fixes: 6a2875517c77 ("fat: stop reading directory entries past the end-of-directory marker")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Tested on x86-64 KVM with KASAN, comparing mainline at d89e1d186ec9 with
this patch:
- The example above: the base kernel creates a second file1, which is
  still there after a remount. With the patch, touch fails with EIO, the
  error is logged and fsck.fat only finds the dirty bit.
- vfat, three-slot create whose free run ends exactly at the marker:
  the base kernel exposes the hidden file, the patch returns EIO.
- vfat, one-slot create that leaves a zero slot after the new entry:
  succeeds on both and the hidden file stays hidden.
- Valid directories on FAT16 and FAT32, msdos and vfat (creates, deletes,
  renames and mkdirs, then filling the root): the same entry counts, ENOSPC
  on a full FAT16 root and no FAT-fs messages on both; fsck.fat -n exits 0.

 fs/fat/dir.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/fs/fat/dir.c b/fs/fat/dir.c
index 35bdb62944a2..ab99d53a719a 100644
--- a/fs/fat/dir.c
+++ b/fs/fat/dir.c
@@ -1318,6 +1318,32 @@ static int fat_add_new_entries(struct inode *dir, void *slots, int nr_slots,
 	return err;
 }
 
+/*
+ * The free slots chosen by fat_add_entries() include the end-of-directory
+ * marker.  Once the new entries are written over it, the slots up to the
+ * next marker become visible, so make sure that none of them is allocated.
+ */
+static int fat_check_after_eod(struct inode *dir, loff_t pos)
+{
+	struct buffer_head *bh = NULL;
+	struct msdos_dir_entry *de = NULL;
+	int err = 0;
+
+	while (fat_get_entry(dir, &pos, &bh, &de) > -1) {
+		if (de->name[0] == 0)
+			break;
+		if (!IS_FREE(de->name)) {
+			fat_fs_error_ratelimit(dir->i_sb,
+				"allocated dir entry found after end-of-directory marker (i_pos %lld)",
+				MSDOS_I(dir)->i_pos);
+			err = -EIO;
+			break;
+		}
+	}
+	brelse(bh);
+	return err;
+}
+
 int fat_add_entries(struct inode *dir, void *slots, int nr_slots,
 		    struct fat_slot_info *sinfo)
 {
@@ -1351,8 +1377,14 @@ int fat_add_entries(struct inode *dir, void *slots, int nr_slots,
 				nr_bhs++;
 			}
 			free_slots++;
-			if (free_slots == nr_slots)
+			if (free_slots == nr_slots) {
+				if (saw_eod) {
+					err = fat_check_after_eod(dir, pos);
+					if (err)
+						goto error;
+				}
 				goto found;
+			}
 		} else {
 			if (saw_eod) {
 				fat_fs_error_ratelimit(sb,

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.53.0

