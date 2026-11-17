Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883164;
	b=npA0MzeVn4Dj3mWQM9MbheSKHcD+a9/XtDY6Ru+Hj3OyDENB4jWgdN+A8JGDqM5S3QU7
	 q0LcMWtkhHSIIMh1gNNcnejFgfx6JKj4BBmk/5VQwtBqPweAXz4TW0UNqSdBKvwrYSpVt
	 98t9J9Pw0vxzKnLTe9e2XILv9Gba/rDf77XGFNOQ8SrgusESU2adlkfcDnkOgVA80NXkA
	 eRhcUAHqHqsuZRh4jZYWWpchACyun1sN/Q/QO8duNVZ4sANe9SjYtYiXJI1W1U9TCQY5S
	 c380unOP/BOF2s7HJjMnxprvVv7IwtEJlVC2SrQ/Gg+zYTJRrZpnAP6JTUotKJQwWOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VU3RfTLNpfs/n3MAsR8jkSfjakNJoajlPmMOjTMtrf0=;
	b=iZGrGFYoZ94ac3q/rd3e8BVP8cda8fRxlcZ0nugWJo/TOC8uQPCqV9Z13FeyVs9/XRE9
	 tS43DKLjwQIn9cKcR6QDMp+o6PifAQdLBTS/m4HZM4ywANQKDs/rGlrC3ki0B+Zy+TYuQ
	 Y/Xw/74c+twbAKKGqTkNwzg3cNOfyFSrcwg6TNiuP97znrUl++JeG2U9faOxR8yL/agJh
	 0jwHmL6N9d3zAphMpaQnp0ky5ObljgRFL3zTcUqDaLs0Yzt5q3EOsG3YkJyiT/OFZuQQk
	 aUar94LnsQwggcdNGME8BnrhDvY9lzryp7tzH7L+Dq1Jfe93Sr0TEyCgjTblKveczBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=W+1sDqUH;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14A9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F14A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=W+1sDqUH
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4f3e22bdfso380207b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794883162; x=1795487962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VU3RfTLNpfs/n3MAsR8jkSfjakNJoajlPmMOjTMtrf0=;
        b=W+1sDqUH8u3YPzkIDI6wFLBLurH2ysyw1bzTrxjAJmgZ+EnUMnn2iu60LCktKbyfvw
         IYL9SOTZSXOviDvvE/WWzlL9n+eTMMTqyDbf7pv/gIW0J1SKBPEMShw0KZl93EJU8OKH
         Dn5sGBiH9r/8xXzWUuExhW91ExzBBzAbEFyMK3zfCDDJj6ICSkE0KfdJeTgQmiYRMErf
         vUxomOjiDazJrb5dC++7nUwCtHZSMt10GQT9VY2F11xr034sr7ABUhx9XX0XfEWD7haq
         mvDoGF2lv4mxI7M09Sjn9UckB6Qny9wnEmCM1O53fi9A99JwUJ0wcXs50fe3r/4/TOUZ
         Sllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883162; x=1795487962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VU3RfTLNpfs/n3MAsR8jkSfjakNJoajlPmMOjTMtrf0=;
        b=FxP2z9ILP9BEdIz23k9MZmBBSl81DwND1Pp+7ugp9xK9v83a6bEPI0E3NIyCpnOgzr
         qVMXzv/Ge4RpCPVL74D0ek6uxfHKWmvwoWGIVFpP0HCBRHQG/SP/9BfrRQYiRXeWmgQE
         yxTWStmWmvo5ZKFvLvqiRAEHfVchZwd0lf/+/Jak1Vqjh4tenGvquYh2VDE8O2Hg7tYe
         1D8zarVmfBqz9QaYQs75wLudhbD7pmSsSnkEv4pTAu9shXFHx4PAKR2BXD/RNOAhkXd9
         FW/vyBamYr3dCQrTA/LhWkuNkcLji8iLOvwJZ2CIDLnoZ/NDbCukmivvmiS2ZG6b9AOz
         OUvw==
X-Forwarded-Encrypted: i=1; AL+hErEAWt+SFP08369iZafcnPo/9ReSQg6DsoAUn0P5tiRQHPO4X7lf5Ww3FVkc2irQeQO2z0LjFk48KYBOYbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KgsZNTzlm4o7WOQXUhy952fJNwua9Ao6mQQDAs/HBWXk6AAnS
	kBE8j5zu5AGADycxKN7PIifis4b2fNUg1CjZ5ndohsmLrQSzpc0l+V7Fgky/R3J76w==
X-Gm-Gg: AZFdTZeUgnSczlhBy6p4jl0xrU194AsMW8mRCq+a+g+0jdtjLwLV9XmvE5ZSCw1I7qS
	YSL41DLoB1Vdi5upWoOVCZblELlAiMJdusQ5NUdwlytuSz+Bi/Gg/zJzR03c4bBhJZmLf50qBns
	Avv65Z6XVJB5l9xeAm7P+0L4l6cnvQvJYumf9ri3LCKutotuEPqUVR2m9o7ZB7DRchhYPYw5qZF
	ltnZGb+D1GiCZ206+2mdt12FWfVt33TI3/n8B8p8IjqnD6Tzho1xiel34OzG07pRH1MYZD0x5Fj
	7TH+fMyU8ROpsijLp4ocTDwgAb3qp0Sa65U8GOqkius8PNVgh+M8JoiU7QsJRzJ4dIxXyaG2Sgy
	I3LoH6iyuHBWmhVavf6Lkg+vY74PUpPDMOL0QZjwyLQ1jz2ReQMoCzzkrlz1X+4QX2JtuWDfqXH
	3ryrw/n9IVTGPjSdJK7/QJyxyrMOTeUGnP6mJuEsZdqQJWn2aAWL9AUwBvHiwfUo/PQyFk/0YK5
	lKdQGMDZSlodrZaobRquAncRIH3wCX5YjUbUTtHIUZUtOk++eHdrqmXRQdvMhCrXTW2YtJ8VMSD
	yCt5I/VHNsOtuqMJFIZvsCxEaYzrZ7FgpD4IoPhozIcILU4+UrVa7w==
X-Received: by 2002:a05:690c:e08a:b0:8b4:d882:4a14 with SMTP id 00721157ae682-8b4d882572bmr17276377b3.5.1794883161880;
        Mon, 16 Nov 2026 18:39:21 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec46a9d2sm13822747b3.45.2026.11.16.18.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:39:21 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] f2fs: fix data loss when zeroing post-EOF data of a compressed file
Date: Mon, 16 Nov 2026 21:39:17 -0500
Message-ID: <20261117023917.1583819-1-hengyul@cs.unc.edu>
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

Commit 5eced87b7d19 ("f2fs: fix to zero post-EOF data when extending
file size") made do_zero_post_eof_page() zero the rest of the last
page with fill_zero() and write the page back when a file is extended.

However, fill_zero() does not decompress. When the page belongs to a
compressed cluster and is not in the page cache, it gets a page of
zeros, and the cluster is written back with that page. As of now,
extending a compressed file with write(), truncate() or fallocate()
replaces the data from the start of its last page to the old end of
the file with zeros.

The issue can be reproduced with:

    mkfs.f2fs -q -f -O extra_attr,compression /dev/vda
    mount -o compress_extension=txt,fsync_mode=strict /dev/vda /mnt
    yes | head -c 16000 > /mnt/a.txt
    sync; echo 3 > /proc/sys/vm/drop_caches
    echo end >> /mnt/a.txt
    sync; echo 3 > /proc/sys/vm/drop_caches
    tr -d 'y\n' < /mnt/a.txt | wc -c

Before commit 5eced87b7d19 ("f2fs: fix to zero post-EOF data when
extending file size"), the result is 3, the length of "end".

After that commit, the result is 3715. The file has 3712 zero bytes
before "end".

This patch will prepare the cluster as a write to it does, which
decompresses it, then zero the rest of the page and write the cluster
back.

Fixes: 5eced87b7d19 ("f2fs: fix to zero post-EOF data when extending file size")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Commit fda0c0dcefc2 ("f2fs: do f2fs_zero_post_eof_page for all the
time") in the dev branch drops the fsync_mode=strict condition. With
it, the commands above give the same result without that option.

Application impact (Ubuntu 26.04 user space): rsyslog 8.2512.0 appends
to syslog.log on a volume mounted with compress_extension=log,
fsync_mode=strict. It is started 16 times and gets 400 messages each
time; the volume is unmounted and mounted again in between. On v7.2,
the file has all 6400 messages. On v7.3, it has 6327 of them and 9620
zero bytes.

Tested on the dev branch with and without fsync_mode=strict: files
extended by write, truncate and fallocate keep their data, and rsyslog
keeps all 6400 messages.

 fs/f2fs/file.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 05061254c3b2..59480c3ba2e8 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -63,6 +63,33 @@ static int do_zero_post_eof_page(struct inode *inode, loff_t new_size)
 			return err;
 	}
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (f2fs_compressed_file(inode)) {
+		int log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
+		void *fsdata = NULL;
+		struct folio *folio;
+		struct page *page;
+		loff_t start;
+
+		/* a page of a compressed cluster must be decompressed first */
+		err = f2fs_prepare_compress_overwrite(inode, &page, index,
+						      &fsdata);
+		if (err < 0)
+			return err;
+		if (err) {
+			folio = page_folio(page);
+			folio_zero_range(folio,
+					 offset_in_folio(folio, old_size), len);
+			f2fs_compress_write_end(inode, fsdata, index, true);
+			start = round_down(old_size,
+					   1 << log_cluster_size << PAGE_SHIFT);
+			return filemap_write_and_wait_range(inode->i_mapping,
+							    start,
+							    old_size + len - 1);
+		}
+	}
+#endif
+
 	err = fill_zero(inode, index, offset, len);
 	if (err)
 		return err;

base-commit: 9b12299b437e0cc3ebf402e7b36a89cc69151238
-- 
2.53.0

