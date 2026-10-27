Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126611;
	b=qDPZVpstUxAUBI2qTmJsOSa28c7S5mcVsxH2MbvUy3UhrEBH67HGzV7gLRfyRkHMz5Ve
	 yYLxJcr56OwCotuE5MU9mz7zV1fk2efBxwFwVzdKADT8KDCni+dV4eEcIhIlLJfQHM7Tv
	 blkfaQFHE0tCDu25L1/yM4F1me/9pclABSMKnddgd6z/q969TsjDuwbcd+6phHUWlKf56
	 hVZz/BaDW6yx9vo/lcwuLXdX3wzSgjJEietZhBR/xbrvR7ilEdj9uNWYW71In8fdFVlz/
	 uWnmm8qaH0HEgeoHzX8ZJGNNpJvKyQWgBLZZnHeBil/CQPiBgUclUbfjD1PM0qtpkOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/3tibRvQ76ExQ0W3ZkBRUL/Y1H2AP4fK7D1nRgB0KTM=;
	b=jYd2gU9Kv9g+WW8JiH+dgRYNSn+nWOCWl8GxpmpkofOH0FeBtRdoZ3no3eaSOHL4SWtP
	 98QwRbwF0v+W6PZbWousDEVCkqQ49TzbfSghFYX40AGyZbh19yKjC3YyDlmh53EqBZL2G
	 XpE6h2dQvl4bz12dzR3iZ4KqE4C5W+uCQffJ8sMCpnzGfDhTemm/0eAay0qSyFICn8ZrZ
	 0Iv9fLADUpI3eoytsEmqkdOHikfwnGnsWpnbZGXB2IhkNOEnA4P71p7vz1sNg0fkqm4Hl
	 L02wDL9vYNgWet8JIbqA8bWOzLIdrQ5E89fuTJfkSKbfazXyF5OpyT2yDSfFL0OX0CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b="aL/2Qb2A";
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5D0606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F5D0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=aL/2Qb2A
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c67992ce5so1818746d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793126610; x=1793731410; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/3tibRvQ76ExQ0W3ZkBRUL/Y1H2AP4fK7D1nRgB0KTM=;
        b=aL/2Qb2A6wIg62sataJ4dhl7YCi8CuF/ywKK2ZkdAMm/4r+vwoyJNNQgWpuMhAe5Hu
         DOoKVXejH35OXH31pDusY1ns6/OsrpceBFGvQsT8fySizIjyxjJiyKP3MW4xslN8ckcw
         sEqavfAF8QVq8cnobdZLdkGDdscMHzgbUlcbAKWDFrjZ62LvAS9RDfmo9Q4sUyhnQO76
         VfccEHnwoU+9Czq+7TFzm5UBcdGf+VvrQRdtcjKVeD1CMV752Y/EJZ5y8IRWMkT7p5rj
         hC0TjbjuIIqEqX0sMCEnkaBA5dSaAt2pRP8jUvi5RESHrom6vO0akDM9Yd3ph49smflz
         BLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126610; x=1793731410;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/3tibRvQ76ExQ0W3ZkBRUL/Y1H2AP4fK7D1nRgB0KTM=;
        b=ljHmc1OZ+yo8d9e9+N2SM0o7cRvUes3/huOIXMegCyOP8bEtb/o9re0Qat9SXNbkce
         RoX9KfPPnWL6IGwBFD60QyyyCgTMzjwuxcfsRI64L0FggYVdl1JE6kXGkrQoGIkqmA97
         p1PhRI7pIyijkLKBR4s/m8dODTWe0kC9PZ0x9ITI5nknGERTcep12ZF00dnLWj+K6r4A
         H0GttcHQwu5yfVck7nD3Y9ZbbXzVY2EMid0xbbdSlYb+PTRGhFCVgyS7uzDel/rR1dn8
         Hm8S3hwmIiBEJUmD0uv8/6qRnUnoVbVjVyKTPwC/EGAFNlLtX0oaiUDRm1O92r7btw7R
         NLQw==
X-Forwarded-Encrypted: i=1; AKwUvBxEfvvoGH3VeoYdIyh3uJc4vmh2BT3zNGWFlY3aKMP4PLZZ7QG8IljxmIVLJi+9VJrBLrRNZaLUlUPe1g4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ4Mw8LVaO29c6m7lqlZbRAk+uDlIfyRlB9yTOqOIL9yKsOqBN
	PYx9kqg97PDbdLkzYvYrbI8NAhoCGAsWMuM2Ey3ienuF9UxdX/b+E9lQBkKQuQhxip+nGmwTfEP
	uL4E/
X-Gm-Gg: AYBFou3/Seux+/9LiPcwuvP8EsuNNLEYzbLeiqIfPei88ktH9BNFpIqwDF152O4cd7x
	qcUfwDqerbLtwHvPyNEULf9/kR7IY167O2X7+6WojhZjrqdqStoo+vhVYBgvrvIeI47JpAlavUR
	wTOPRqMlqg+cuxsZXTbrJpUF37OsajNJxpfkfx7cx+x9kZoDIdc1YvsI7qUutZ56JRMxPROONOK
	/GMd83+vACNtyiBopzph8eeAGcPYfZvFxV9+yT75RRd9qZ9y5rYNMJBfEKYIVDjVz43XCmCsQgc
	Yx2AKtknNs9kRKR22K3TckEmHA//cpR5zH2lnqqCnb4fRgWSFPDn5Os8LRZTBROHpYrBCtkXV3u
	cjA22X4iDqzWPZTx4PZvUU6I/u48FYU8r/UXGit5YihSBVr8CiH3SEgeTyqx6x8kxo47Pk8THDD
	vu+2iLVij60WFjbGTMN34ZXnKW2f1QuUebDUOf/WMhFIylVggZtKvEzxAdVbaKK4peqXPWcyjW3
	VyZXQZCXWuTJ7TA9qNbJJis+TzaupB07HEmrj8aK7Iyf4uG/Vjq+RgOj5GZYXtH18OFVxSK4Rbl
	9zKnM6rjEvGR6P8cPj4WZ0ht6VXcBFZFIwQJMNulLslLI8U=
X-Received: by 2002:a05:6214:4198:b0:91b:5d3a:5106 with SMTP id 6a1803df08f44-91c48e86a0amr179280536d6.52.1793126609742;
        Tue, 27 Oct 2026 11:43:29 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.253])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c6e20ba4fsm31819396d6.14.2026.10.27.11.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:43:29 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 27 Oct 2026 18:43:14 +0000
Subject: [PATCH] ext2: only flush DIRSYNC directories on every change
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-b4-ext2-dirsync-v1-1-3dcd012d518d@toxicpanda.com>
X-B4-Tracking: v=1; b=H4sIAMHw4GoC/03MMQ7CMAyF4atUnrFIolAQV0EMsWuoGQKKCyqqe
 ncSWBg/y+9fwKSoGBy7BYq81PSeK/ymAx5TvgrqUA3Bhd67sEeKKPMUcNBi78x46Dn56PwuEkN
 dPYpcdP4WT+ef7Uk34all2gclE6SSMo/t1Lj9T8K6fgAPV658lwAAAA==
X-Change-ID: 20261027-b4-ext2-dirsync-86ca140154bc
To: Jan Kara <jack@suse.com>
Cc: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793126607; l=1707;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=+K3FWhF6zDMGz/BBYD/9H90CCViXMrrzDaS65J+qi7Q=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBPzjtD6VIdsn/SXpO6bRWXb/ppKa0VePG+69S+DwXUp6u+Lkjsi6IoVmuGN1N2uwOUijesbDuS
 IeNJ5pTVCCAc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Every change of an ext2 directory is written to disk before the system call
returns, whether the directory is DIRSYNC or not: its pages with
filemap_write_and_wait() and its inode with sync_inode_metadata().

Writes which reach the device for 2000 files, and 200 directories, in a
directory without DIRSYNC, with the flusher turned off:

            create   rename   unlink   mkdir
    before    4000     8000     4000     800
    after        0        0        0       0

In a directory with chattr +D the numbers are those of "before", before and
after.

commit bc943f4872a7 ("ext2: Don't flush page immediately for DIRSYNC
directories") moved the flush from ext2_commit_chunk() to the new
ext2_handle_dirsync().  The IS_DIRSYNC() check which was around it didn't
move along.

Fix by putting the check into ext2_handle_dirsync().

Fixes: bc943f4872a7 ("ext2: Don't flush page immediately for DIRSYNC directories")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
I ran into this while testing an overlayfs series with ext2 as the upper
file system. Directory entries were always on disk after a crash, also
the ones nobody had synced.
---
 fs/ext2/dir.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ext2/dir.c b/fs/ext2/dir.c
index e17bbc7598c1..5de32c221a83 100644
--- a/fs/ext2/dir.c
+++ b/fs/ext2/dir.c
@@ -442,6 +442,9 @@ static int ext2_handle_dirsync(struct inode *dir)
 {
 	int err;
 
+	if (!IS_DIRSYNC(dir))
+		return 0;
+
 	err = filemap_write_and_wait(dir->i_mapping);
 	if (!err)
 		err = sync_inode_metadata(dir, 1);

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261027-b4-ext2-dirsync-86ca140154bc

