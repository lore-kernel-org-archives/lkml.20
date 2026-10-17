Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE923563E1
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792253203; cv=none; b=FHBLFNDzS82Kp7gSNZhEAm0rFOwhvYQrvrGwvsRoDQKyhzlBHFK9AyOYvhPYTcbr1cPa2Ab0dCan9382K9YbaFYJ4jkS8c5pXwLuNwZNfHht4wUVcbmsiWhkZarO8rzSTqHoCIaH7AyGNWiljRe3BcoTGzc6JN3QXWK/61+WpIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792253203; c=relaxed/simple;
	bh=FCML5R3Dv7v8zb2k+BEvUn0jOZC+inFA00fYhfbgW8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nmekTGACpHImXuLEqw5MZjmJR7QJEVDz6s5O3Hbj+/NFIXWSRt9NmsuajGEIZBuSx2LjD4ImZnCHGI9qJRzlCdCV2U+nKAj+raEy/B5i/2IzvzBI2DSchG6ZoGC9aJ/LLp0EOUN5hB1dwPirawSqYJdDIPfuS18jGkaW2wijq5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=IOOA0Zvn; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="IOOA0Zvn"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f2049ea7aso64523185a.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792253200; x=1792858000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjAm2lerQyv+WvIqin+zK5FQil5k5JDfx13NBow3Ln0=;
        b=IOOA0ZvntEgjRNL9sVlvyazbAjvSYJVPoqE/TXuKKKrbJ4c751QRio4t55upLEsks7
         viJeRiY2G1BDwQtKYL+n18N1WQl/0z2Mximl4SnGj+WkY9mTIX5cJmapH+DofeydD4yp
         M7eKUQwP36SyyjtELZQexZUYhtGdtecdLQea0rTZlucuPTBhBX3y8GaBDokq0AnTL9PD
         nnacnQM5NkCPbcxzC2WBJBiCc48ZYbe034XwuibL0Lu9mHeDjaZbLyc9N9qgTKMz22Pe
         GY2138wkOxxj4h6xdrt+9Zloq4+nWCyGObLZSmJb87Cujgcmseh/Wmjf0zr4z56gQWDX
         2Kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792253200; x=1792858000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjAm2lerQyv+WvIqin+zK5FQil5k5JDfx13NBow3Ln0=;
        b=IVcN4JEks8ig+BRh/uKp6CtGoS0Se41eTgTO0m60RjeZgvhKgIybpvWFHM8kYIV8yP
         aXimTWjnh16vMuzslemJLOUhioNAI4bVykZUHd9Q7RuqH4SYJEpyiaOgQXdsNbFusKa6
         L1H/rJkHv3Ox5QmVuL9ly0W0lmr5LiEdaS/nZT8vQRwq1aESfN0LO81G02freG8/rAwf
         pVjJlYc7lkzeUgOJJ638Uar/NEXD+cQkhFQVDDnt9hHcK7sYw+HDEcM67amj0GuskYg4
         TJC0CJQeBMUP78pVrPuIlYZPfXV7hg7puG6eSuppmUCPJlOKigirPK4yxspvNheieGdA
         9fFA==
X-Forwarded-Encrypted: i=1; AKwUvBzEi4GwRT4TQ+jgEf32K9KhnW+xoIPXg8hq4PZMRGYxt8ZLDkkzyMEmr3vXY5ClOBZawXa91XgfSpJVJ7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeP2NR723wj1ldupuLAV9gBdyUuMQw4awDorEunHO9S34EspMm
	3GciKJDM+uyiaVyKg6Jbbd5d8Q9BLFx5M+K36aLkehsjkhr87gHJ6IQzRnHuNOOjew==
X-Gm-Gg: AYBFou1mnGDmLCVZFzgW1LKuECj871vPywHo81kQbHUa8fmaTGhvtccgqUZkFQbnQCI
	TQUXsAXlEnqZGFBqKTH1UzsFysavW+vgwnZTu96YqzfnxeCAAhP9XCO3dB93N7PqeoQYtr2ny8S
	9iKC7l0PAUU2ceQC8Q6ehKCjJCrqfYeMUkRiKkqV9rjd4WKy/fmKcAQKPdSUDSAfR42oi3NzH3N
	+A5OpmfVcDmIsaEexe1ejBkBrfQxdI55tGUMT31AxZiG+hFeLf9CL4LmGZgyBEsCwB6Th/C2Ouo
	TsScBSEFKjAdm1OTU3GDdMb5nW5z6SXxK3w7yvTcVf9pFcNtBv22nRMkg9F4NBzIjLhAJjvRJIU
	HOZmwd5AwhQzFrfxUP9c2jAPPWaeRrZigmgwGkblpcqVHnlxf/ArS++r9lcvzSAwpm/a29bxw2j
	Wugo63oVJDaeVzsmAgfAfH/GnYqgefvpCsVjHfIBheOejrr556yLHejiq+HLRBhnxpn0fnhO1T3
	HEz8d4ljU+n9d1/K9FGUQ==
X-Received: by 2002:a05:620a:31a9:b0:93f:33a8:8e84 with SMTP id af79cd13be357-93f33a88fedmr170468285a.56.1792253200003;
        Sat, 17 Oct 2026 09:06:40 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1850cbsm491261985a.24.2026.10.17.09.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:06:39 -0700 (PDT)
From: hengyul@cs.unc.edu
To: slava@dubeyko.com
Cc: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hfs: report errors when extending files with setattr
Date: Sat, 17 Oct 2026 12:06:12 -0400
Message-ID: <20261017160612.3740256-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hengyu Liang <hengyul@cs.unc.edu>

hfs_inode_setattr() sets i_size and calls hfs_file_truncate() to change
the allocation. If expansion fails, hfs_file_truncate() restores i_size
to the allocated size, but its void return type leaves setattr reporting
success.

On a freshly formatted 64 MiB HFS volume, ftruncate() to 128 MiB returns
zero while the file remains empty. When the requested size fits within
the volume but exceeds the free space, it also returns zero, leaving
the file only partially extended.

Call generic_cont_expand_simple() before truncate_setsize() when growing
a file, and propagate its error. This makes failed extensions report
EFBIG or ENOSPC.

Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Compared unpatched and patched v7.3-rc7 in KVM with GCC 10.5 and
identical KASAN configurations:
- 36 growth/shrink/error cases per kernel on 32/64/128 MiB HFS volumes;
  content, zeroing and read-only remount checks passed.
- fsx (10,000 operations) and generic/736 (10 runs) passed on both
  kernels; post-test fsck.hfs -fn was clean.
- fsck.hfs -fn was also clean for ordinary and recovery cases.

No kernel BUG, WARN or KASAN report was observed.

 fs/hfs/inode.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
index 2aef3c36a150..44b1735a54c2 100644
--- a/fs/hfs/inode.c
+++ b/fs/hfs/inode.c
@@ -684,6 +684,12 @@ int hfs_inode_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		if (error)
 			return error;
 
+		if (attr->ia_size > inode->i_size) {
+			error = generic_cont_expand_simple(inode, attr->ia_size);
+			if (error)
+				return error;
+		}
+
 		truncate_setsize(inode, attr->ia_size);
 		hfs_file_truncate(inode);
 		inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
-- 
2.53.0

