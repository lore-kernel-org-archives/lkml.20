Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F054DA539
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791935017; cv=none; b=F10Xguu7Oe372oHlIXO0f0VBjOtlD6F5CeUM6bcMG019MpsPsqTk8bghhR4+tGhxjJRdiM7Z4hI8s/hlmnPFTg96rN+MxkJTbmSnx6jNf6DcLVhzX8guITDSj9VmbiT49h8ZmUZFkuqZXjN0khIsBSPWbin4p2gdKFQ0O44pByk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791935017; c=relaxed/simple;
	bh=GvZxarkkwqqsR3khBy5tCFsKRpsaRw8uvoLtTbkALNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VzHq9yB8XV0lAWnO6IgRyXbYzyCfpMeEK0A3rfeEAFSgibPmXFfcQRZIrUgrhAZDnz2IEoJymnwecAjZHCT4DSUFoVERbj/hsjLYnJccD1kLc6ys1NEuL07/yqeJrf0bkUyS9K533oA1KKagUqgQw/KTBRXX2hYf+4zGw5/cxXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HxmGHMN+; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HxmGHMN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=lL
	OVZmATFMcWY5AsWvDsdDWTAZ57Fo5AmzovE35nef8=; b=HxmGHMN+F1cmSC5PdD
	H3+yitLmpEcTU/hXcxrFiuzx7/tvPligLq5OahvAPfVWG2Pax/gy+abu7CzLJSxh
	CKtzo1hd0wAObhBQ9HWE0TOrrUrSmuZfiONpn2ypftVq23Gz/Yt8FREo3YxFRify
	JcS1lLMQMzc0GcPhlPRTyHjBw=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3n8YRws5qn3YTEg--.47761S2;
	Wed, 14 Oct 2026 07:43:15 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1] ntfs: support FS_IOC_GETFSUUID
Date: Wed, 14 Oct 2026 07:43:10 +0800
Message-ID: <20261013234310.836392-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n8YRws5qn3YTEg--.47761S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF15ZryxAF4DKF47tFW5Wrg_yoW8Gw1Upr
	nak3yxKrZ5JF4j9ws2kr4Fqr1xZ3sxJa1Dtryqvw1fWws5t3WagrsFya4FgFWrAr95tr4j
	qFs0939xuFyjqaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Um-ewUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hQEzmrOwhS47QAA3T

From: Baolin Liu <liubaolin@kylinos.cn>

NTFS reads the 64-bit volume serial number from the boot sector but leaves
the superblock UUID unset. As a result, the generic FS_IOC_GETFSUUID
handler returns ENOTTY for files and directories on an NTFS volume.

Register the on-disk little-endian serial number as an eight-byte
filesystem identifier with super_set_uuid(). The generic VFS handler can
then expose the existing volume identifier.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
Tested in QEMU with file and directory descriptors, comparing the returned
bytes with the boot sector. Queries remain consistent after read-only
and read-write remounts, unmount/mount and a fresh boot. An invalid output
buffer returns EFAULT.

 fs/ntfs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 242fb19ced2b..950d305ab695 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -997,6 +997,8 @@ static bool parse_ntfs_boot_sector(struct ntfs_volume *vol,
 				vol->mft_record_size_bits;
 	ntfs_debug("vol->mftmirr_size = %i", vol->mftmirr_size);
 	vol->serial_no = le64_to_cpu(b->volume_serial_number);
+	super_set_uuid(vol->sb, (const u8 *)&b->volume_serial_number,
+		       sizeof(b->volume_serial_number));
 	ntfs_debug("vol->serial_no = 0x%llx", vol->serial_no);
 
 	vol->sparse_compression_unit = 4;
-- 
2.51.0

