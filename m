Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794433904;
	b=Wv5Bno37j9kgx4dF6KfoEOubQJ7gf6i59Lh7UwzNY1+m5ptCdHy1jHikN9vTyxYFoXWM
	 rhl8o12LYC+u2ssNL+fYml2cmcoVke22x1UxWGpW6ZU4pEbArad8tZtbQwmc1bck1vhcs
	 q4J+fM7kgVE1iPEOoRIhYQSDzSsVQkhfHhJ5/MYYDbSNCY+P4xu3/1ogt6VXUuWKPXKDd
	 nZOh5vK0RzUUKjBMTFLXe6hf1WzhmcRtmlkTnVJ9Bqbs4iGqSGGKhTcEHba4ahM+PnYy7
	 kMfjq8DzKUMrawpnb/qP2yYNsLjoLyIsfTZ9YaH2H/PcQBDNMlrtyNAVVTiGUccIQSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433904;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O81Xzd5PWJmQde17k7H3DWNdQYVpfX8wGonqraBDnO8=;
	b=sv0zTSpiLWI9dTLQLy+o8u4tI6SKesWB+t2ZsoffbgL75iP08ITfr4ackQ4ZTyoYHXcY
	 14egN2OkmLV9wR5PJ5kmEiSc4azkAaBNXUgWXKEl1ItDTHr33k577CxpdH2p2k9M/R8xr
	 6RPjti/FAcFrGucBTLu/hoAK6qeH5xzDBu+sAo2LradVRWC8PsyBDZyU292MueM7SCXHO
	 cjk/GBi/SdLNRIhy/580PQ2j5u4IfNe2YBwyekwactcKVvYO8dmt1fkBbIMokdc/VQiSo
	 3lhr42rMTreMsODoLPlELbhA3LA0fVCjyvY5pkRGUT8UiKogppmhwxE1VDOuhrwV3Vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4vVOtbH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFC6606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4vVOtbH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794433904;
	b=fDvXUtGjI4gO6K6olQmap8XAV3KOKlB1vSSC2PCdcaLl/JaWut7OkUVhKkK9TgcDphK6
	 5u6LSuPnd/etgChO1DlhnHFzZW/+S8/Y9dDG+aLWrsvshtH6BKiuMAoC3L168PeufP5NA
	 H6TiZcSP+uegIs0oTjjO7zHyLkJZmYrqqRX2oehLFP58oTnGq7ufYiKBil2IB5xCzgTwT
	 pl8ga8iRe22BF42Ilf1d8K6RG5Mu+y09Lgy4rihgCeyRb4pU77AbiVZYQN+WNCUDFdIoH
	 fQqFAyZYo7vYmfT6ds5MGUNE14UhWFvD8snYmxk6jXcA6KbCrNEE7+YzK/lqK39U4Uw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794433904;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O81Xzd5PWJmQde17k7H3DWNdQYVpfX8wGonqraBDnO8=;
	b=OXaoIRqv/QeIbTR8YE7o/0+rez1k0rBDsJx1pVuPypxV7Fanao2I5IAOyuRoPwCeqk9G
	 kaRw7Na1jSd6F5YFMubgsRTX9vXMQGeCNL5teWqHj2yHVUcv6x0/CZ0tlu0WQwOKiPefS
	 877qMEgN2Rox4uU0R4fezvxcCoKFYwrCJCxipdonoeyhzMLy2rHY+5W8celuG+zxvKLWf
	 QUMdgWclHoKF17Gg0RQscweHNFfUv4FJv0aytnhgP5fMFZ3pRugzJV57UM6t0Ls8pjSbP
	 0iNEHQPpSFcBUtNut8ZDVU/biBFG+8uyZLkrf3AQu7+XkUub9A+YfI2vz7/yGIXwBYQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A17111F00A05;
	Wed, 11 Nov 2026 21:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794433904;
	bh=O81Xzd5PWJmQde17k7H3DWNdQYVpfX8wGonqraBDnO8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=O4vVOtbHL9RcEif0xC/qkh4WNAdPJqIl+btoLJRmbFrgx6fetfF94FnlgDKMWYdiL
	 x/9hNeXNELNlT+7D+goxCFsh7Azes0rZIVb43WG8meuA6Y1Ni/fcxAAkN3fAgy2fc+
	 FLb6XCAu40aSkDmfGmSvSb1i8swHqNizetClYsF4CL05DVXhEasLz9hWwH8DIGqIC2
	 4qP6qB5ApZxASZJlnsAw8yVJkaGdwONLWyJH5cfXpFtHPKf5vMas8KXZbqEGD3PbzG
	 cwHuyij2hmA+5xqOwOxiRLIiKdEYvhuWnxoYiYeblonQ3X0pAbflzFekRYAW7lUFt9
	 2lxambfrAmdZw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ECCFB49126;
	Wed, 11 Nov 2026 21:51:42 +0000 (UTC)
From: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>
Date: Wed, 11 Nov 2026 16:51:43 -0500
Subject: [PATCH] f2fs: don't fall back to the older checkpoint on a read
 error
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-f2fs-cp-read-error-v1-1-a30ede66e589@columbia.edu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMOw6DQAxF0a0g17HETPgo2UqUAowNTgHIJggJs
 fdM4HWneHcHZ1N2eGY7GK/qOo0J4ZYBDc3YM2qXDDGPVUhDieJIMxo3HbLZZCj3R1tToKqQEtJ
 xNhbdzujrfdm/7Ydp+ZfgOH5OPmHEdgAAAA==
X-Change-ID: 20261111-f2fs-cp-read-error-f39b7c1c64f5
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 tz2294@columbia.edu, stable@kernel.org, Mani Tofigh <mt4022@columbia.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794433902; l=3204;
 i=mt4022@columbia.edu; s=20261026; h=from:subject:message-id;
 bh=XjX2qFti2q+oUj8LyAqSc1Ajj/P6RtOkjfwWfSeWPYg=;
 b=uWMZPqjz0pg/OiaLYsHX47sNdInhj4oH1koQiqWYRL6KI2YMQwvz5qlixoz9L39oAbk09Vqv3
 rkZRDjTRdzlCW0fofOTdYcvkxxuU5JPtxryOEPhjR20GrcPBoPF5+dF
X-Developer-Key: i=mt4022@columbia.edu; a=ed25519;
 pk=gljCMQDuxyKPmd5y37CRpEJGSPXDV1MyAnHBhCgXl0I=
X-Endpoint-Received: by B4 Relay for mt4022@columbia.edu/20261026 with
 auth_id=1322
X-Original-From: Mani Tofigh <mt4022@columbia.edu>
Reply-To: mt4022@columbia.edu
Content-Transfer-Encoding: 7bit

From: Mani Tofigh <mt4022@columbia.edu>

One read error on the newest checkpoint pack at mount rolls f2fs back to
the older checkpoint for good.  Everything synced since then is lost,
even if the error was transient.

get_checkpoint_version() returns -EIO when a cp block can't be read, and
validate_checkpoint() treats that like a bad CRC.
f2fs_get_valid_checkpoint() then mounts the other pack, and the next
checkpoint overwrites the pack it couldn't read.  E.g., with a dm error
target over the first block of the newest pack for the mount only:

  write OLD; sync; write NEW; sync; <power cut>
  mount /dev/mapper/err /mnt   # mounts the older checkpoint
  umount /mnt
  mount /dev/ram0 /mnt         # NEW is missing

Return -EIO from validate_checkpoint() and fail the mount instead, as we
already do when a payload block of the chosen pack can't be read.  We
can't tell which pack is newer without reading it, so a read error on
the older pack fails the mount too.  A bad CRC or version mismatch still
falls back to the other pack.  With the fix, the mount fails and NEW is
there on the next mount.

This bug was identified and confirmed with the help of a deterministic
hypervisor currently under development.  The C reproducer below however
hits it every time.

Fixes: 7735730d39d7 ("f2fs: fix to propagate error from __get_meta_page()")
Cc: stable@kernel.org
Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
---
Reproducer: https://github.com/manitofigh/files/blob/main/linux-repros/f2fscpeio.c
---
 fs/f2fs/checkpoint.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index a9a2b9d93231..cbedd3e1399f 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1178,6 +1178,8 @@ static struct f2fs_cached_block *validate_checkpoint(struct f2fs_sb_info *sbi,
 
 	err = get_checkpoint_version(sbi, cp_addr, &cp_block,
 					&cp_entry_1, version);
+	if (err == -EIO)
+		return ERR_PTR(err);
 	if (err)
 		return NULL;
 
@@ -1193,6 +1195,10 @@ static struct f2fs_cached_block *validate_checkpoint(struct f2fs_sb_info *sbi,
 	cp_addr += cp_blocks - 1;
 	err = get_checkpoint_version(sbi, cp_addr, &cp_block,
 					&cp_entry_2, version);
+	if (err == -EIO) {
+		f2fs_put_cache(cp_entry_1, true);
+		return ERR_PTR(err);
+	}
 	if (err)
 		goto invalid_cp;
 	cur_version = *version;
@@ -1231,11 +1237,19 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
 	 */
 	cp_start_blk_no = le32_to_cpu(fsb->cp_blkaddr);
 	cp1 = validate_checkpoint(sbi, cp_start_blk_no, &cp1_version);
+	if (IS_ERR(cp1)) {
+		err = PTR_ERR(cp1);
+		goto free_fail_no_cp;
+	}
 
 	/* The second checkpoint pack should start at the next segment */
 	cp_start_blk_no += ((unsigned long long)1) <<
 				le32_to_cpu(fsb->log_blocks_per_seg);
 	cp2 = validate_checkpoint(sbi, cp_start_blk_no, &cp2_version);
+	if (IS_ERR(cp2)) {
+		err = PTR_ERR(cp2);
+		goto free_fail_no_cp;
+	}
 
 	if (cp1 && cp2) {
 		if (ver_after(cp2_version, cp1_version))

---
base-commit: 648bdfa9bae3850908df31617e5922e0683d5fff
change-id: 20261111-f2fs-cp-read-error-f39b7c1c64f5

Best regards,
--  
Mani Tofigh <mt4022@columbia.edu>


