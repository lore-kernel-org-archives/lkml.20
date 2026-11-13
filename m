Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567719;
	b=fj5nwcZxDCEaNcXTROJAwmh8yO0YVW6S0A4AVvnIMIJFXiILS7j/jykTISQXOLGo8EHu
	 vcG45G0QKf/EDArDxLiLtYm9jS+U1UzCDEhMaoDmIjbGxhLOiNtYP6Q4w25NWkKh8VtTd
	 7weMlgCXYTvYiRpRjHlNiRXo31zSXslsLvhmQ16vAZYPrzOa13LOYG8JeVT1+n7D8R3AF
	 aAGbozg+QglXksNUPbC1JpCImebe/Um4Yioo0nKWt2Kopsop346DOnk6JcfVoK1jahdZs
	 NThqzKKWMNtdEi7rcFx43HwUH8+oINX2WVnI0w2hv4yZQYeaW38LzcUEwTHMH/4gTTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer;
	bh=rWzmNEep0iX5uEZI1S/qGXTXdilbvqQY8SkirUZFpaM=;
	b=edTIMw3WNrrIdJXjnH3f0rlERffm2p2/1BrXXcWyFUtY604lRGgHMwTtI1nzY/BU5Fgq
	 rljRYVhkKQhS+Wtydv6tuki4xx6lSFISES/zEDNo6sLS58kgpFXaECMwgvalbfuqgmn4e
	 lc1418PuvdW2kS2fkXky6H7tVwvZyTEca6O/mcg/SPHYZBcMZUCJ6nlrsge7CDhXgMYWK
	 TMUsUJNjG5ecI2VyqKOQ2HR3NC8lR9zLI3Andg5ZBIHy8xbnTGQ0QZocojmDNhx7/Bjcv
	 g6Xr/x24aMUF9DqXWgMxL+WL3+kXsEPSMzzt2g0H9Ss/s7hYR+3U6Ob2wHJ7ceY+dig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NeO4Av02;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214D7606A895
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 214D7606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NeO4Av02
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b18c01238eso202601a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567718; x=1795172518; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWzmNEep0iX5uEZI1S/qGXTXdilbvqQY8SkirUZFpaM=;
        b=NeO4Av02mt66gW5iSyZSWnxHKa5d3kti5aWxj9UnBPVzjlLCDPecR7obp/9NHPELUa
         7hEGjuL7LZjWSzgcTHZtgl+cLxmAZfDXJlXd+paPU+w6cOsv/RPzVHxYbwMSGCYs2Tcp
         zj81/ZAE/sOzZK/n8GVKrUkyl8Yz4pVKqkd3X+jkzdyibnjj8OGlpXmtLOeT0ozi+1rs
         yuWPtPXgMD/KYIdYzBQQEfwumoqPPhd7UbF4mbXFRgWvod12rEKU85cZ/P71g0kcTUwm
         46Qnr9/t6XHcBvMtkZ2Od3MZkpX4+Wha04q2DT6EPYGwpa/NB66eQ6F5T3WIb/E7PWyY
         LzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567718; x=1795172518;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWzmNEep0iX5uEZI1S/qGXTXdilbvqQY8SkirUZFpaM=;
        b=QO2Z+8ion97QSEe59ia2gd8+RE9nGsoAR8flRvXMcFKjhY178x1w7VdrWSIGxYzZYu
         8y5NcLjEyo6383Aa6oTmyZJNGgShwUa7mau7zbJGFXckJIXHPPslBm4P2iK1+GTjGJzE
         PLs/gJ6AsT4MwmDpoUww7Oxtb4vyPf+vfqNuMNcEl4NjbASEy+X7aFWFd5ziD7jDTM/7
         5gBZzfE8N2myvUPYTmn61jyt38s8mLN5fTTy0VZqbY4DXy8c8K7KSpxxsG2e65jNVyri
         MmQ6g3GiJb7+HcaMI38qruQ9arH0KZhiftJq08GlkPYs06YPU5ehnLCFpjD+lsJlRpHB
         Bf6Q==
X-Forwarded-Encrypted: i=1; AL+hErH5hjiXV7utBMMS54xn90tBILo62F/eThIGRa5Xt6HQR6HS7F7YnM1IF7GMJPce49XNcP51woEeuSQn20c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/joFxegcgUZYaTsoeoQc7w45A+S8bn7BRPpJ1SjHPNRCRRHPL1
	7LakDoiC8Tfgbtq9JHadp8DJVfQAmix8uYOszrxuUoK7noqM29lRTn2/
X-Gm-Gg: AYBFou1+QdbjtC1qB5DaV3LHahTlDvlNbT/uY6kzfmg+32EUvFj7O6KMMP+jECp2Kg3
	EGN1tZI6ha/0UNxwX1Ivyl+rY+oevvOsKSGFezL11HK0sfYApvprlnGQky94i0Gwhadptr5WuxA
	hqbDL2ZCE4Ryd1OhHIJ79A1NDdhp85qaGLqNONz687VTZauozWRZMjFtTn9Kf4e2sjAyaJSCnXH
	Hl1FWNp/jgRchAqw5wW+Iaql6A84yyekcN1hTFn5hKaIK+7mrgx9KV+wNDV/6xye05bgTzF8U/N
	/T80GhgCnf+C86TDK5JQI7RSkQNrwxRn+MKHqYLqmWfcekOf+jQas+5rM6D4oM7+rT5UCUPjgw4
	kLSdnilH4SEpj+BaLcr0C39zM1t0g9qvGrUEDSucwx2I0na1dnltDFxGfl46gZKGXl3h0Q8rN2Z
	B+rc5NuSJ4/25Njsb9qDVuhxwus+bekY00jYwdCGx/dN9VTarmWZtSXvief9QmXb7g1amR8/qzD
	Q/MIMJSzuoDujAE02tyOGQ99F9mS41zEnOCpd6MJTbxtqQFaIxnNdDTBo6xAkJrFCCpYAWBEsx0
	7zA9E9Q8fuZh8v8Q6pMe
X-Received: by 2002:a17:90b:1d03:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3b1b0b47a08mr1923159a91.42.1794567718314;
        Fri, 13 Nov 2026 03:01:58 -0800 (PST)
Received: from hhost ([120.231.212.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce460csm8992762a91.5.2026.11.13.03.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:01:57 -0800 (PST)
Date: Fri, 13 Nov 2026 19:01:47 +0800
From: Xingyuan Mo <hdthky0@gmail.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: "open list:XFS FILESYSTEM" <linux-xfs@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Xingyuan Mo <hdthky0@gmail.com>
Subject: [PATCH] xfs: validate dquot buffer geometry in dquot log recovery
Message-ID: <20261113110128.4001610-1-hdthky0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.43.0

xlog_recover_dquot_commit_pass2() has never really validated the dquot
log item. The only check on qlf_len is a DEBUG-only ASSERT, and
qlf_boffset goes straight into xfs_buf_offset() to pick the dquot slot
inside the chunk buffer:

        dqb = xfs_buf_offset(bp, dq_f->qlf_boffset);
        ...
        memcpy(ddq, recddq, item->ri_buf[1].iov_len);

Both the offset and the length of the memcpy come from the journal of
the filesystem being mounted, so a crafted log can make mount time
replay write past the end of the chunk buffer. Sub-page block sizes
get an exact-size kmalloc for the buffer, so an offset of one blocksize
lands right on the KASAN redzone; larger offsets are wild writes. On
CRC filesystems the dd_lsn load in between is out of bounds too. The
recovery regions are allocated to the logged length, so a short region
0 also turns the qlf_* dereferences into out-of-bounds reads.

Make this code validate the item like the rest of log recovery does:
both regions must be exactly the expected size, qlf_len must be 1, and
qlf_boffset must point inside the buffer that is about to be read.
The readahead path gets the region length and qlf_len checks too.

I reproduced this on a v4 filesystem with 512-byte blocks and user
quota enabled: force a few dquot transactions into the log, crash the
box so they stay dirty, rewrite qlf_boffset of the on-disk XFS_LI_DQUOT
items to 512 (one block past bp->b_addr) and mount. Without the fix,
replay trips KASAN:

BUG: KASAN: slab-out-of-bounds in xlog_recover_dquot_commit_pass2+0x32a/0x500
Write of size 104 at addr ffff88801c8b0200 by task mount/430
CPU: 0 UID: 0 PID: 430 Comm: mount Not tainted 7.4.0-rc2-00021-gb3dfbde62cf1 #44 PREEMPT(lazy)
Call Trace:
 <TASK>
 dump_stack_lvl+0x73/0xb0
 print_report+0xd1/0x610
 kasan_report+0xff/0x130
 kasan_check_range+0x10c/0x1c0
 __asan_memcpy+0x3f/0x70
 xlog_recover_dquot_commit_pass2+0x32a/0x500
 xlog_recover_items_pass2+0x7d/0x1b0
 xlog_recover_commit_trans+0x585/0x630
 xlog_recovery_process_trans+0xe2/0xf0
 xlog_recover_process_ophdr+0xf8/0x1d0
 xlog_recover_process_data+0x126/0x270
 xlog_recover_process+0x132/0x210
 xlog_do_recovery_pass+0x6be/0x8f0
 xlog_do_log_recovery+0x65/0x90
 xlog_do_recover+0x7d/0x2b0
 xlog_recover+0x1bc/0x2d0
 xfs_log_mount+0x17b/0x2c0
 xfs_mountfs+0x70a/0xe70
 xfs_fs_fill_super+0xaca/0xf60
 get_tree_bdev+0x14/0x20
 xfs_fs_get_tree+0x19/0x20
 vfs_get_tree+0x54/0x170
 path_mount+0x4ad/0x13a0
 __x64_sys_mount+0x1dd/0x210
 do_syscall_64+0x10b/0x5f0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 </TASK>

With the fix the same image is rejected without any out-of-bounds
access, and a pristine dirty log still recovers fine:

XFS (loop2): log mount/recovery failed: error -117

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Xingyuan Mo <hdthky0@gmail.com>
---
 fs/xfs/xfs_dquot_item_recover.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/xfs_dquot_item_recover.c b/fs/xfs/xfs_dquot_item_recover.c
index b8854316ac756..3172efb94c277 100644
--- a/fs/xfs/xfs_dquot_item_recover.c
+++ b/fs/xfs/xfs_dquot_item_recover.c
@@ -47,7 +47,9 @@ xlog_recover_dquot_ra_pass2(
 
 	dq_f = item->ri_buf[0].iov_base;
 	ASSERT(dq_f);
-	ASSERT(dq_f->qlf_len == 1);
+	if (item->ri_buf[0].iov_len != sizeof(struct xfs_dq_logformat) ||
+	    dq_f->qlf_len != 1)
+		return;
 
 	xlog_buf_readahead(log, dq_f->qlf_blkno,
 			XFS_FSB_TO_BB(mp, dq_f->qlf_len),
@@ -84,7 +86,7 @@ xlog_recover_dquot_commit_pass2(
 		xfs_alert(log->l_mp, "NULL dquot in %s.", __func__);
 		return -EFSCORRUPTED;
 	}
-	if (item->ri_buf[1].iov_len < sizeof(struct xfs_disk_dquot)) {
+	if (item->ri_buf[1].iov_len != sizeof(struct xfs_disk_dquot)) {
 		xfs_alert(log->l_mp, "dquot too small (%zd) in %s.",
 			item->ri_buf[1].iov_len, __func__);
 		return -EFSCORRUPTED;
@@ -110,13 +112,22 @@ xlog_recover_dquot_commit_pass2(
 	 */
 	dq_f = item->ri_buf[0].iov_base;
 	ASSERT(dq_f);
+
+	if (item->ri_buf[0].iov_len != sizeof(struct xfs_dq_logformat))
+		return -EFSCORRUPTED;
+
 	fa = xfs_dquot_verify(mp, recddq, dq_f->qlf_id);
 	if (fa) {
 		xfs_alert(mp, "corrupt dquot ID 0x%x in log at %pS",
 				dq_f->qlf_id, fa);
 		return -EFSCORRUPTED;
 	}
-	ASSERT(dq_f->qlf_len == 1);
+	if (dq_f->qlf_len != 1)
+		return -EFSCORRUPTED;
+
+	if (dq_f->qlf_boffset > BBTOB(XFS_FSB_TO_BB(mp, dq_f->qlf_len)) -
+				  sizeof(struct xfs_dqblk))
+		return -EFSCORRUPTED;
 
 	/*
 	 * At this point we are assuming that the dquots have been allocated
-- 
2.43.0

