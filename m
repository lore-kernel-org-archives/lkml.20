Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594598;
	b=YwwLFf6r5u/PoMhjQy59wLR9wIeSR1AGCU0Ia4L1VcltPMpgnM1iAmkUguwXJh0OJjG/
	 kUc799oSXxcutT851EMwNLATD3UlPJNWhJT4Tw1EnHspY34EK2lQ57N45NIvIq6ynGvz5
	 NuvVOpQd9CZD6vMcIgOsqrEezzU6eAkOzjlRMDme6wbpUC33n/JufVWbkfI1SrFHAnvtV
	 8DL2cOPGlFfz6kmsJHniYqsdMyQZEJCdryhbAMO3AxkhDd5MHSxJucVsLfVuG2hh8rDeA
	 ry5jf07FcyPcAFlSCeItWUu+B2UV6FMtIAfS27xg+ZoY6r5nyu8uBEx6ZsHCrYRdY0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+D+uYFURRsfo5Ok/4sB6xpuqajcrbQ8BvhCvpo4B0eE=;
	b=QvuVomKSa8JgqsHsU1RTdPe8vXrLvqIsiAAZYbsX16wQ02pj+EPVSAekT6iGk0pRBldc
	 03+6Z5Vdd7Z9erZcPuzpnLOX0fwBFSSxzXG7Vut/UnrGYJ2pL2Kd9PpgqO+p6EMu7peyy
	 6wfVhw1CYESQeN7zkNTBD1EwqTDt6J+2rJHjG4B8HVu9HAxbLgUqRW9OVSCZyc46QEWMX
	 fNwWfsOvccZVyRJs7+rqrtlxwcX+W80kybPT/gkubuyD1WTaJ/ZgrcszGhG5JVJDJF2AD
	 XjrIzriOb+24JaTGn+G97CfzFGdextxOjeLQSff/aHOe9S1QVcTofrIv2uDRnL9MwQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Rcg+HvSm;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C000F606A334
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C000F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Rcg+HvSm
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8871ada1a26so5989937b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792594596; x=1793199396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+D+uYFURRsfo5Ok/4sB6xpuqajcrbQ8BvhCvpo4B0eE=;
        b=Rcg+HvSm1cRKtGxBLvy+UzvB4FlP0Wn3qNQ6xR0NhmPS++rsshq5TctpktPLNA918z
         X1e/maKV8/pe1PIUHUKHVLdh2+QkAWCK/4tobN2omwqx1x8GpqLTNJ6IJa3rmcPk9/NF
         /m3WciXvJziBW3RD9t1VUceEsqmgSLi6mW2gzqx5dUSsMOOW+MeBQTgYXlJf8uLYMueO
         msQiowSg/48g44t4URWJ/aJXFTxmRYtMXWCvERPbMf9UcQ4Cpo2yOubZbo/SbK997pZe
         mylMYQ/nN4gyjIhSklJgqJadqUGmxi2nKzywVRw5VOFvBDh/64+2Bycva+B6aY5tsMbi
         zHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594597; x=1793199397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+D+uYFURRsfo5Ok/4sB6xpuqajcrbQ8BvhCvpo4B0eE=;
        b=Lb6+LhxoVRJZYPE30phNY6DnN2ixnLkWaDU3REQeKykIFzc3d0OXgmL7VxKJMZ8yZh
         2mZ7sXB0R+3UWNRIivihhSz/epgiLvveVei+yCG2fNpw1/pat7lO7usv5LK7l7hmpeD6
         8EwF9PZigePbyFVfpbbW+HKvZ6QntxMam1dr5ck8dbI/K7M95mISJBlU1myZqe6cG54k
         KNYOytJPZ8fU/5Hes+T1o947n+wvPHBlthedx1vLNxu5X2E7rQV+gZ2dtbjyPRo+kQfh
         P4l07tZg1wgiwPuHnBqqPsoxhdofN7k4bFxHWiezKdjViNgKpcMy1fdUKNf0gGl+d3eM
         P0Ew==
X-Forwarded-Encrypted: i=1; AKwUvBwad0mH6rQitLhJ8f6b1NzP0VnIWoKUDhGn360sXT+K2b0IAoKD1UnwbReyMJ3Loqxq9oacFp7U9CeBKG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPbETg13gdQBqMIb6dFQYeF7Bl1JKCroNHQzVsAMsEuIRHVUaa
	ZRBfP3aHb4U7EDJzqCoxsnqj2Mk/mTsghGt2HOatv4J9iXBR8wl2SnLv9KHTEpMa6Q==
X-Gm-Gg: AYBFou2lwniZ3w7qf/SHOdesgXJbBr88nGGrJ5Jjz/tvkhun71SkkAaAAmhhhN5H0by
	I2bCm2nDVwrQ7rfzoddpkcg9uTyGiUI8LzRdfubVfKcZGTwuz4pbeomzhNa77J+36DSdmrReafr
	qwADkJCYAITlcuCcIduVWMhBXa9Y5gt8RXiJInjRnpCLUfzKBotZUSXjDAtBB0Qj5b5lVsWixSY
	0TwrERouD5e5eIFmYh1ZeBkBTOWcAIXZlYA5IPUpli9llmvcUXHafL7vdm8hSwiYw8TwFc2FjJ5
	RLzQ94qc+3hgjb3QAQQ1vfMBbifa8xHnhlKHlFn+PdVCyl1/kCHzTz+/2efS1KuljoFyMkdsNXf
	Qnbz69veDP8b+EChe+4AN4W55NYUraaSl8wV0bLjTKJL978iJdtrVSuTIvd7HXAF8T/15j9KD6g
	r+yo5dkUCqp1eDw4UzFrlKA+97vFSrTpqMS8XfH/V0YjGVRp+YYPv6+D9/bRaF5DHGw/PlAlFgQ
	79O64jyh3knStNbqNR5uuUMs3HEnzoMI1EoOut+f2Oodp40bPentNEIzaAbZryeQSviy9PQKhnd
	yY75y3SjHVDn7cpCcBnBqOfc
X-Received: by 2002:a05:690c:c0d8:b0:89a:63bc:8d7 with SMTP id 00721157ae682-8b1340cc1e0mr8889117b3.97.1792594596537;
        Wed, 21 Oct 2026 07:56:36 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1300c00d3sm12495757b3.22.2026.10.21.07.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:56:36 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: slava@dubeyko.com
Cc: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hfs: report errors when extending files with setattr
Date: Wed, 21 Oct 2026 10:56:27 -0400
Message-ID: <20261021145627.288953-1-hengyul@cs.unc.edu>
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

hfs_inode_setattr() sets i_size and calls hfs_file_truncate() to change
the allocation. If expansion fails, hfs_file_truncate() restores i_size
to the allocated size, but its void return type leaves setattr reporting
success.

On a freshly formatted 64 MiB HFS volume, ftruncate() to 128 MiB returns
zero while the file remains empty. When the requested size fits within
the volume but exceeds the free space, it also returns zero, leaving
the file only partially extended.

Call generic_cont_expand_simple() when growing a file and propagate its
error. Keep truncate_setsize() and hfs_file_truncate() in the shrinking
path. This makes failed extensions report EFBIG or ENOSPC.

Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Changes in v2:
- Keep truncate_setsize() and hfs_file_truncate() in the shrinking path,
  as suggested by Viacheslav Dubeyko.
- Replace the generic/736 and fsx runs with a comparison of the whole
  xfstests set selected for HFS, as requested.

v1: https://lore.kernel.org/r/20261017160612.3740256-1-hengyul@cs.unc.edu

Compared unpatched and patched v7.3-rc7 with identical KASAN configs.
All 805 tests selected for HFS by "check -n -g all" were attempted,
using freshly formatted 2 GiB test and scratch volumes for each case:
                passed  failed  not run
  unpatched       109      27      669
  v2              109      27      669

The different results were generic/113, /394, /464 and /795. /113 and
/464 passed and failed in replays on the unpatched kernel, and the /113
failures are the same existing workqueue warning from hfs_file_fsync().
/795 failed on all three kernels in replays. On the 2 GiB volume, /394
passes without the fix only because ftruncate() returns success after a
partial extension; v1 and v2 report ENOSPC. It passes on all three
kernels with a 4 GiB volume.

Also ran 39 functional and 18 recovery cases per kernel on 32/64/128 MiB
volumes. Content and read-only remount checks passed on unpatched, v1
and v2 kernels. All three had the same 12 post-ENOSPC fsck failures;
recovery fsck checks were clean.

Functional/recovery cases and generic/394 were repeated on unpatched
and v2 kernels at the hfs 7.4 merge (dd7b15aeac80), with the same results.

 fs/hfs/inode.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
index 2aef3c36a150..9bdaa60fc392 100644
--- a/fs/hfs/inode.c
+++ b/fs/hfs/inode.c
@@ -684,8 +684,14 @@ int hfs_inode_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		if (error)
 			return error;
 
-		truncate_setsize(inode, attr->ia_size);
-		hfs_file_truncate(inode);
+		if (attr->ia_size > inode->i_size) {
+			error = generic_cont_expand_simple(inode, attr->ia_size);
+			if (error)
+				return error;
+		} else {
+			truncate_setsize(inode, attr->ia_size);
+			hfs_file_truncate(inode);
+		}
 		inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
 	}
 
-- 
2.53.0

