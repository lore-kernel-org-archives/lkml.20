Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48093B83EF
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285377; cv=none; b=KCJ9MVesSzlzVeZf9fL6qjACMSrqJRvGEd2oEA52rTuImhU2ERKRo/LPEMFoxWTylh7frpc9bwBRRYLJnUp2wDBnPohveMz4OxM84XyP3lKRQDRzQkfnFAOnuizi7PflSjwHdhePa5g9wlwqxyYXpN4ACdzme3im1uico659kgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285377; c=relaxed/simple;
	bh=G//01b+pdGQuVaSGbli0NMHPAXwyyLVeWMUub/nIK48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pXlVP5PYwtoZkucm3r1AfgbWKRYT2H+ybPTyZbi5MEHTGHndj8gTCpYPt4IZKvOXyKn+0PhAy+RYGH0hlr1HBzAwsvf7BWkKmgur7psBLcbN/CDFAMN7Zf9lvYtqas81eG4VaaEM9PNbNkMpTLBuIqtwD+PJSV/IJ7yeKW3ggnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=BHZI6j2r; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="BHZI6j2r"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-917866225aaso9622956d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791285375; x=1791890175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=devy6bzsaYlsguV5/NED3lG3N5sUd9XCvEtiVBo2paU=;
        b=BHZI6j2rSvskVWgGY7hwZm8s8c+Zw0wWRlv1w8bhSPxlbYUJ47MFt7QsSIhBOlvihS
         9QlDINHe6ooqDVpZVszp+rkM7eQrS/7gYj2ywtK9znd82kcfvr334XzTcDk+396GN0MK
         z1LNSCsWI225RDY/7H+TdHgX/1uaavZ5hQ/QQ70ldR9tz3Pi1xQxAKa+7YHVKBaUyCdY
         wnIamR3P4BpYN+SyidZRWpRjcUPybn7Q2Kogfj+dUFukW90ZsYHJlkxr2wmYKovwyT2Y
         Kw5HG5uVBjJsYV1diNkymtxMu/TObYQcB4Hh+DhyCbXhAzJIIZceLFu+C2bXyRD+UCEW
         xV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285375; x=1791890175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=devy6bzsaYlsguV5/NED3lG3N5sUd9XCvEtiVBo2paU=;
        b=b4m8amFDZRfJpgQz6O+B8Kpr4sateM+VSVofQF/po/QeqM6itWxxQ0cB8WnCcS/oG8
         U3E9cy8/KCzKkebpszrffwdsfxpCp2cf/siCqBPq3KM8Stf/EEG1ujh4NBqL6c1Gv8pm
         TVhMHhsee2AXUVKMCZNssjoll2HdBqLK9uX8f/O0o8rPLMuOWbN+Aj1HENaNeTDa7LqX
         VbwUXdZrPzux+CeIK1C0Apw9EAoRVJIlm6redKgZhLE4NUPZaooDFAzYlaoO3qMqa9gB
         ZY++FzOSl6eXifItzBCR7vf6Y9oYb+BoZEMfLW+fx9/AEVLxQkN9lav9M6jLAUdUJokZ
         B7pg==
X-Forwarded-Encrypted: i=1; AKwUvBz7bwzTuEkSoZxUndmhfA8gf0OUWpqEt4kMeRP0O5UzH2WGDEHsG5H1txjpp4hqr2e7ZKjzmeLl2BBjDf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/8fdyXwMueq79+haxWPDhrNdiSMtsUpQtX0gIdL6Jb3h3mdS4
	wZQJAGrfBcbw0lHgrzSe07AfzFPGzEO7DOf/GOatalNGJqMzABOV95QEnNsZuq0PjQ==
X-Gm-Gg: AYBFou3yVdlsPeIGtzdvbDPVryNFaHhHnLslRBz+rHxi2MvdeScQzxZUdWPnQS+WH7r
	ZrtEM6oTs3Pbe5puEo4BJAJUtf5d4IQRNgilYuILrbSvVLjY+DMBWfg8F9k2iI+Cx+3ogS1P01l
	I+SM1LMwun6+9FfNHx841qb+zg6z2Ev8fgzxRnqKKfFqSYAxDM5yyIp8blxSyToZhe8/ikngumr
	WxkAGR2fviPU9/YQ572ZbcfX768JSuPadaYc7Cjc+IHkUi/Xo4o4CskAPLVxGGivPi6KaP7h3I8
	ijDF97l6d9jkb5bwJF5wLuVZDot0jL3M3gtuaBVG8AjTolMLisxFxzC4zkaWxVJ2K1rjflRafOf
	ZnrsMzbInQ6QUzkIe0heab5g+G70w52TLw8cixz78Y/eN/8ziX4uujFLqpqrbu04uEE+jP/cpHt
	TfCEyXruWgub8iI9em43rOWkLRAv0mwO562LCk2/zcgXmJVJlHqqgQFJeovN+/2ZI60QQtkdPw8
	jgz2ianEUrU49c8hiR9HMM=
X-Received: by 2002:a05:6214:21ad:b0:917:882c:5754 with SMTP id 6a1803df08f44-9198b76f7dcmr19763346d6.17.1791285374599;
        Tue, 06 Oct 2026 04:16:14 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b690f3sm110033886d6.24.2026.10.06.04.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:16:13 -0700 (PDT)
From: hengyul@cs.unc.edu
To: tytso@mit.edu,
	linux-ext4@vger.kernel.org
Cc: adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	linux-kernel@vger.kernel.org,
	Hengyu Liang <hengyul@cs.unc.edu>,
	stable@vger.kernel.org
Subject: [PATCH] ext4: do not accept rec_len 0 for block sizes below 64k
Date: Tue,  6 Oct 2026 07:15:46 -0400
Message-ID: <20261006111546.3252481-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hengyu Liang <hengyul@cs.unc.edu>

Commit afa6d5a16bf2 ("ext4: remove PAGE_SIZE checks for rec_len
conversion") made ext4_rec_len_from_disk() read a rec_len of 0 as "this
entry covers the whole block" for every block size.

However, this special value only exists for block sizes of 64k and
more. With smaller blocks, a rec_len of 0 means that the directory
block is corrupted. As of now, a directory block that has been
overwritten with zeroes is treated as an empty block. The kernel no
longer reports the corruption and can store new entries in that block,
while e2fsck still reports the block as corrupted.

The issue can be reproduced on a file system without metadata_csum:

    mke2fs -q -t ext4 -b 1024 -O ^metadata_csum,^dir_index img 8M
    mount -o loop img /mnt
    mkdir /mnt/d
    for i in $(seq 100); do touch /mnt/d/file_with_a_long_name_$i; done
    umount /mnt
    dd if=/dev/zero of=img bs=1024 count=1 conv=notrunc \
        seek=$(debugfs -R "bmap d 1" img)
    mount -o loop img /mnt
    touch /mnt/d/new

Before commit afa6d5a16bf2 ("ext4: remove PAGE_SIZE checks for rec_len
conversion"), the last command fails with "Structure needs cleaning".
After that commit, it succeeds.

This patch makes ext4_rec_len_from_disk() return the on-disk value
unchanged when the block size is below 64k, as e2fsprogs does.

Fixes: afa6d5a16bf2 ("ext4: remove PAGE_SIZE checks for rec_len conversion")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 fs/ext4/ext4.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 724a27e8be61..ab716a5ad6da 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2611,6 +2611,13 @@ ext4_rec_len_from_disk(__le16 dlen, unsigned blocksize)
 {
 	unsigned len = le16_to_cpu(dlen);
 
+	/*
+	 * Only blocks of 64k and more need the special encoding of rec_len.
+	 * For smaller blocks 0 and EXT4_MAX_REC_LEN are not valid lengths
+	 * and must not be taken for an entry that spans the whole block.
+	 */
+	if (blocksize < 65536)
+		return len;
 	if (len == EXT4_MAX_REC_LEN || len == 0)
 		return blocksize;
 	return (len & 65532) | ((len & 3) << 16);
-- 
2.53.0

