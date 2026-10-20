Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486086;
	b=DZDZIxJ/Qa+GqFz1Ss9INa+hCDeoGz6Q7dFQQ06w/svDXJIICKtuOoYqpmTWASzxxX+S
	 xZnbt8qY5okYidNz+MeDxYgnUJVgDw/KGp/29/5TVFPh2hjFPrXDS2pBWC2qrDTDAiUZC
	 Hts0Y1it3hC9OWlmo9g+Ruzu8YCmDHEn3bKgyKe2+XXUm/1+PTHCeN0o1anKaJKWY0g6o
	 5LqBCOqCDqR4J7DSTGvYhNLOy4Z2fAV/7a7IX/8wTatkinqsnhDVgoncUVWIkAHd4qdBP
	 sOsn0asI/M9dWRYdjvaYLt4NQxxEkviX2cSDhwsDTk30hAvsqqVVpxhsBybGt5b+tMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486086;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=776xgnIpelkP99vLdtU4LQJqK/Rq6jmwtJsaFoiMxNE=;
	b=FpMR5hUU/ctGluoED1rnn6jTX4lczo7sRHCXQma+KpiB0Nax/8jmdxz4lDPsjuxfBN38
	 OKhIe3C5W6NAJavMkuj32ip5APMBjb3H1FuG9wOnC7Cbha/SRUxOyZvSwM9vqZiwMSezP
	 jCeWDpokHi1AmPJXpf4FjqiHFp9xY+cc/c+gYhMnsLGyk4ii+AmohTqVhEKEvntmEcTr1
	 /l7t5fmJDfIWMxlgTeCmNruYrM+9KdpbwA6rhE6BR1ob0ptLwIR6wC0o+2XsW2B72ezsH
	 k1HKCFREKwQ3a0MDnL/EGxVwbQiqM2TW6y5pzHhokbhiwv+kaX6QPcIHqIxfdI5BmGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GaRUhTH+;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4381D60A3828
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4381D60A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GaRUhTH+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=77
	6xgnIpelkP99vLdtU4LQJqK/Rq6jmwtJsaFoiMxNE=; b=GaRUhTH+qmwWO5rIJf
	NWvhJ6s42t1I0HCw6MVF1BmaAYrYa8ZdVLhzyZ/RX431ZGM8YAroOCvsFr0V+w52
	BS65/WiajGOVnV0AiEG9pwg4P6IJwvFGcFU5/ozs29+sDouaN+MjUoLIlCfhLVvI
	J4nliD2PBbMYGugj6DiQqrPN0=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3t62yKtdqN_ayBQ--.9980S9;
	Tue, 20 Oct 2026 16:47:53 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 31/31] ntfs: report each shutdown transition once
Date: Tue, 20 Oct 2026 16:44:21 +0800
Message-ID: <20261020084421.2196486-32-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261020084421.2196486-1-liubaolin12138@163.com>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3t62yKtdqN_ayBQ--.9980S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr17tr4xAF43Xr4kGryxuFg_yoW5tFWkpF
	97Ar93K3s2qFy2vwsrt3y3AFy0yFn7Ww4UKr4UGw12gw1kKr1FqF4kKF1F9FyFgasYgw4U
	Z3Wjgws8urW7ZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzq2NUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RlJFGrXKrl3EgAA3m

From: Baolin Liu <liubaolin@kylinos.cn>

The existing shutdown sites set NV_Shutdown without notifying filesystem
error listeners. Add ntfs_report_shutdown() and use it for forced
shutdown, device removal, EA restoration and named-stream rollback.

Use test_and_set_bit(NV_Shutdown, &vol->flags) to set the flag atomically
and call the generic shutdown reporter only when the bit was previously
clear. Concurrent callers therefore initiate one report per transition.
Keep the existing conditions that trigger shutdown.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/ea.c           |  2 +-
 fs/ntfs/named_stream.c |  2 +-
 fs/ntfs/super.c        | 12 +++++++++---
 fs/ntfs/volume.h       |  1 +
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index ee4d7d082b2c..fa8ed74791a9 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -379,7 +379,7 @@ static int ntfs_set_ea(struct inode *inode, const char *name, size_t name_len,
 				ntfs_report_file_metadata_error(inode, ea_err);
 			if (info_err)
 				ntfs_report_file_metadata_error(inode, info_err);
-			NVolSetShutdown(ni->vol);
+			ntfs_report_shutdown(ni->vol);
 			ntfs_error(inode->i_sb,
 				   "Failed to restore EAs of inode 0x%llx (%d, %d); shutting down.",
 				   ni->mft_no, ea_err, info_err);
diff --git a/fs/ntfs/named_stream.c b/fs/ntfs/named_stream.c
index 1073ff7e12f7..ae1e907e729b 100644
--- a/fs/ntfs/named_stream.c
+++ b/fs/ntfs/named_stream.c
@@ -661,7 +661,7 @@ struct inode *ntfs_create_named_stream(struct mnt_idmap *idmap,
 				} else {
 					ntfs_report_file_metadata_error(base_vi,
 									rollback_err);
-					NVolSetShutdown(base_ni->vol);
+					ntfs_report_shutdown(base_ni->vol);
 					err = -EIO;
 				}
 			}
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 7c10a1b24b14..462173686a37 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -455,6 +455,12 @@ void ntfs_report_file_metadata_error(struct inode *inode, int error)
 		fserror_report_file_metadata(inode, error, GFP_ATOMIC);
 }
 
+void ntfs_report_shutdown(struct ntfs_volume *vol)
+{
+	if (!test_and_set_bit(NV_Shutdown, &vol->flags))
+		fserror_report_shutdown(vol->sb, GFP_ATOMIC);
+}
+
 void ntfs_handle_error(struct super_block *sb)
 {
 	struct ntfs_volume *vol = NTFS_SB(sb);
@@ -471,7 +477,7 @@ void ntfs_handle_error(struct super_block *sb)
 		      sb->s_id);
 	} else if (vol->on_errors == ON_ERRORS_CONTINUE) {
 		if (errseq_check(&sb->s_wb_err, vol->wb_err) == -ENODEV) {
-			NVolSetShutdown(vol);
+			ntfs_report_shutdown(vol);
 			vol->wb_err = sb->s_wb_err;
 		}
 	}
@@ -2352,10 +2358,10 @@ int ntfs_force_shutdown(struct super_block *sb, u32 flags)
 		if (ret)
 			return ret;
 		bdev_thaw(sb->s_bdev);
-		NVolSetShutdown(vol);
+		ntfs_report_shutdown(vol);
 		break;
 	case FS_SHUTDOWN_FLAGS_NOLOGFLUSH:
-		NVolSetShutdown(vol);
+		ntfs_report_shutdown(vol);
 		break;
 	default:
 		return -EINVAL;
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index 27f58beb4b2d..95ca0019906e 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -264,6 +264,7 @@ DEFINE_NVOL_BIT_OPS(StreamsWindows)
 
 void ntfs_report_metadata_error(struct ntfs_volume *vol, int error);
 void ntfs_report_file_metadata_error(struct inode *inode, int error);
+void ntfs_report_shutdown(struct ntfs_volume *vol);
 
 static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
 {
-- 
2.51.0

