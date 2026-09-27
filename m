Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E26B283FE5
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485722; cv=none; b=K6pQCyBi443ClDRfU3HIn0EJz9Bqm+qen4rGqEghMrZhLCZwDWQgot64U8QJPoq60tPO1a9LEpe+pn8TE11aSe+U2rGNcsi4KgEjt1cSYvfmACPqlZvZlFv4lkwl4ZwFLAGByxTCdC13IPo/e/9PLM8HEi3qC9g7zYDNaGInKug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485722; c=relaxed/simple;
	bh=WRPywmVYQO0VtIPWxm29CrmFWUlUwbhwwdpQgzpRPMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HPyTq9qqhJ20/ns7Zxir+1ulYz/DeGDpi2hp1ZQrZ1LssilPy3/XEDzIy7Vz3HgUQ36Lc1gvLt0IQc8RJQhb/f7JWEcHTVs6P8eQ0Da/SZljh3WrYleS7exJ1jeO313Uo2V99U7WvPQvlfmKWAPdMiOY0mJOV2O8Ig31iLncS6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YP3mDWlU; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YP3mDWlU"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fbef5018so13790275ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790485720; x=1791090520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufLJ+ytiFqLa5W5DPoK5dh+B3PH/RjJJE+Ibm3U4zmw=;
        b=YP3mDWlUqshBUKAvqDLNepWthV6ighNgFn+7jKNoqVD2uTH2/Oct95f6Q2vP6ibb7g
         KIl2Dek98J22kVKU9eykp+g7qcbbr6H7XJpYpDYdVuUYhyXFUFk6cKg7axQn+TTl1s1x
         aoQs7hbXiIqDf51gLHdlv3CQhHuKKyJZY02MVaPkxPRE8JJW9NjZT0N3kqUHkn/E0/7y
         DAFMpS9DD3+WedRgZxr2Kv/ID5KpDTKO5zJLG8lDHksOBeiaAqeB/tDf5+qHqe4n6Ikq
         cz8EtJ/OX8RpMCwzUWVNMgyGv0qN2YWtbmp7auSEg05OuZfOiuAyMbG5VNfk61ZTUPF7
         qw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790485720; x=1791090520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ufLJ+ytiFqLa5W5DPoK5dh+B3PH/RjJJE+Ibm3U4zmw=;
        b=kbfnJD4wPNSFEWaA9yasyjm/NQugrzPR1xdWHu0vubyClQ3p93NkkS0Bak4lSWKmHO
         JaazlSjnG5fF+imh+sHAlED0ulYDe/ZG0YdQ86SMl+jdhG8daG1ODkqY43BrfLLQmyU6
         nhgMhWzlzJn43r+IwgXSi5DaLvC3jXgKEmqbtIgEF4uWWZA6lpFMbZYiMm71p6/9rA+z
         /m5hYqyqODcOLB9Acf6fxlwC4H19R459BD2amFuVlqBL2Uzu6nD0JNRRuOmuLS2lwFD7
         bgj7LJ9+hRuybyB1/m+Bh4YeXlrBF42UaTzzdyPjtdyWgoTD+DjWB8xar5IfU3dqenEu
         KZcw==
X-Forwarded-Encrypted: i=1; AKwUvBxlwSOl+KrBdF5ba184lv6Q8gIpxaHsHloqXgiNoRyxj/UdP+LXxvqHHBpzUI31zhvgcuBf6ko3O2LoO6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVfXSV0UsSZaWNH0amG+pMAsK9p5IcFTFw7Rtsa87Lp+DbOasA
	IOSz+26yJ2WOCNXEDYXX77rwy8Fj5S2z6ThzcjRQwsudtbUPaT9RQ9Bq
X-Gm-Gg: AYBFou1h8tii1R0hzNp0PKsmAZFzMNdUBTHeyssQUZnF4d76mch7htiZwRn6RVK36Ml
	2joLpjztDJ2jQkHCB2NM0c3s5wvM92sCz0qumldP0ab2zDQFvPw+ZMjZeCNh8koNHHWvAqgfe9h
	l0uHLjpEcVvbaMNz7Ay7ppzBgoL7rqmEj1gAU1ySkCJYMVoaX5g/AkGQmTrZp6QCkUHMnY6EHxH
	1efsgP1OkLIhaAWKHvq4uYeT5+5cvrs6mfXhPltXnCnghYrCGU2fuv3tnJZuyoPqiB/Ez+UUWCc
	9Q79isAJxfgEB8GPV3TguJqxjVSnAJzRsFZ3N3OXc5heO9f45jnnYk2PmTBZEmb273Z3wtdP5FS
	w4iVOtoazoB0P0oaRDY9XKQ/JYeL2lnuTuhWmxZ6iRxKZw/5gAGwAwJUgCo8IrxbmXO0IpZAKHQ
	sE9Zr1zVK0k97eWIvPaFqQyiHhqyLRjZNTzqueVNcZ7+Txbhbbl7WQV/Fsl45bljK1eiwMUqmCj
	dETlVFBR8Da9ahWQGdtqsdwQxaNicfoRxlhIttcofta23Y1mFay1QxbOTbb+hXercrfy20iafOl
	+2za/o3dXlKkGoBBMKu7PAugRMJKMS2/RglPukRzzmwOayGoQlfr8aPUScU=
X-Received: by 2002:a17:903:2b05:b0:2df:950d:8f44 with SMTP id d9443c01a7336-2df950dbafdmr52321505ad.31.1790485720400;
        Sat, 26 Sep 2026 22:08:40 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm26615495ad.45.2026.09.26.22.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:08:40 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] ntfs: fail the mount when $MFT's data size exceeds its allocation
Date: Sun, 27 Sep 2026 13:08:24 +0800
Message-ID: <20260927050831.2739166-5-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790417653.git.matthias.goergens@gmail.com>
References: <arMoap0ZgeORuktT@hyunchul-PC02> <cover.1790417653.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_read_inode_mount() takes $MFT's i_size from data_size without
checking it against allocated_size, unlike the resident case in
ntfs_read_locked_inode().  mft records between the two are not on disk.

On a crafted volume with 512-byte clusters whose $MFT is cut to 4
clusters while data_size still says 27 records, reading the folio
holding records 0-3 finds the end of the runlist at vcn 4.  An unpatched
kernel hangs there on the folio lock, as in "ntfs: fail the mount when
$MFT needs its own extent records".  With the previous patch vcn 4-7 are
past the allocation and so read as a hole: records 2 and 3 come back as
zeros and the mount carries on until check_mft_mirror() finds the zeroed
record 2.

Refuse such a $MFT before anything is read through it.  The mount now
fails with:

  ntfs: (device vda): ntfs_read_inode_mount(): $MFT data size 27648
    exceeds its allocated size 2048. $MFT is corrupt. Run chkdsk.

fs/ntfs3 rejects any non-resident attribute whose data_size exceeds its
allocated size.  This patch checks only $MFT; the next one covers the
other non-resident attributes.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/inode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index a61f1519549cb..9c97fc3f9e5ff 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2136,6 +2136,16 @@ int ntfs_read_inode_mount(struct inode *vi)
 			vi->i_size = le64_to_cpu(a->data.non_resident.data_size);
 			ni->initialized_size = le64_to_cpu(a->data.non_resident.initialized_size);
 			ni->allocated_size = le64_to_cpu(a->data.non_resident.allocated_size);
+			/*
+			 * Records between allocated_size and data_size are not
+			 * on disk, and would be read as zeros.
+			 */
+			if (vi->i_size > ni->allocated_size) {
+				ntfs_error(sb,
+					   "$MFT data size %lld exceeds its allocated size %lld. $MFT is corrupt. Run chkdsk.",
+					   vi->i_size, ni->allocated_size);
+				goto put_err_out;
+			}
 			/*
 			 * Verify the number of mft records does not exceed
 			 * 2^32 - 1.
-- 
2.55.0

