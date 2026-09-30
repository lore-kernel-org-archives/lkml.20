Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4E845FFAD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756397; cv=none; b=XUjy5Zqpe3uot0gWWynKoaxuM059EzJeqN02T5JSCCEerpHO3o4BldadbDvovE3r3/YZLFzCCW5oLbRNaIVYSJ9dXWSWcpgRZOf+j3gNhkNdrav+P4Wsr0SCDUnv0KFcbJZT2X3qJDFXMG+5O7WEJtRzKjbiWG5ijpgCrddzAZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756397; c=relaxed/simple;
	bh=5hD9XVqI+4PXRTEiMFVCtYvnNEvjFeZDmjYsnp//hD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=stIl4u/D7mHJXEEhSJvLUvzuWifiKb4aX7mQqUMNGvfN6wiyRwNi62WmXQoM6H14p2GrklgONxltdA5R32uCf6T7vETwGR020QBXxx0tXiwpOR1fPpOfg1JKRzImcdI25nztcT57aAlF4waTkv7DEs2F8iqqUejgdy42sEJksfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2hpvbJ2; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2hpvbJ2"
Received: by mail-pz2-f36.google.com with SMTP id 41be03b00d2f7-cc7c058617aso967946a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790756391; x=1791361191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jUtxKLRNZI7zQbmKekUxqQuRuxiBkqKsZtXk7alpZM=;
        b=n2hpvbJ2UHi9Wzw07T/GafyKlZ3x2/NYzkd8msvSgubsu1U+eYDvWDMtFQC8nNQlWe
         qZJoQ6+MTOBaqWcA51XICQJisb1c/5siyZ+KgbK7v79lvokLXMTPtTXtTbIJIV2vGP6R
         5IKvmIwNIXQkZGRtOSKrK8q9ppCHBnBVxpPeAJnCuMABz2oFBO8jgAkUSW6iF9kY8OY2
         bgT98g7PnCIeWdcT8IWa1nle1YTfVzBo1auaSd5y7j+ZOPgK9kTEuCxu9VRXQQhtNsAl
         6FKqdbFv8RZXozrNjuAds4EAX1kjxPpdlxiuPTDG62MV/dWbBDnseeE40t5UK5mMu0Tt
         emOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790756391; x=1791361191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9jUtxKLRNZI7zQbmKekUxqQuRuxiBkqKsZtXk7alpZM=;
        b=Q0I1J/0i78h3jJ+dti6jOw7Lmv0mS9kN4XSdd629WHAbXjgU2W2L+dxSt7xc5aoAk2
         yYdVlKjf6VTxRJ6N7NBZMsWyT8sYjYqJl7zNDQhVD91ZO7BjsTLwkdQqJst0V9EjlkKO
         OPNw+YRkVdkVK5tFZK1ETsrjxH8IcHkV/ZcYcxjSBLy5Me7qWz3+tmPAAjTvJ4eOInaX
         Ojb/aOwGUeWEiQcit/901iZB0qkW2q5U5aciSuQ3DUVDfoSoJWFp6OSO+bc6ym7m1m+C
         +of1ZLjWjU0waRcztOJ8N9Db8amMjf3Ozt2ZHx2YO0aYlRJUWx2tvHv7N9dZ604ZL3Ch
         META==
X-Forwarded-Encrypted: i=1; AKwUvBypDqLBTydQid1pTIV+7xPi6JKCB0VINMONYzW1++M/EWC6UkLeH4pYuJikKTY9qzc1TOs24vRsN5nm1R4=@vger.kernel.org
X-Gm-Message-State: AFuF++mRhvVccZgydIkMe3VrAFUYIa0tYYw+RkgckLD3kUgxf100L28x
	vK0dVtrxhewIf2LF13Zf11MNxbetwqXjzUGh3aMf873f+V+mBDctH+iU
X-Gm-Gg: AYBFou35Kqa0abSyrWOjkSKW8y0fFKNGovEOgczH0zAKdOSM3u/k+XMzkJw8RbdTqbz
	DPhdml2oR/9yG2wDRxeUxcpvyVOyS2PFh+sxRIzidYD/sPFdukdyMfJTUD/9iIni2fUivrZpuDS
	3Sf40p9sPV4NNSDF8oQEIziz6KTpnd4htzohgN1fB4Kz0WRQI1m1EJOd0YW+DCWH5mjpxhGcDyU
	UbvFvSGMyYj/0r14zX0/a5ipAm2LSVR7MhLZr9RuER1r0DRzoKumm0T6jGny4OWKhVDpVbb9B1U
	1dYOyDxeAKkiy9iWdiB0wX2bpCRWxkLvSdMsP0c7ZzIxLCF8RAKNqPvvuRzo7I5Mn7PG9UUViRH
	ssUWXDYD84MST0DGThiqy02BeVDVflrldH/LJwVud9jcclmwKYFwPxI5VFRyhMo31FnRRTs+HcL
	h0+x6B/6lKq0bxEfcpgU9239UcQmjOVl8n/02b9IKVxLvWWFW7MKeYg8VtP/y19zsAkaCbJXvYo
	mAJgGjAlfnlZ/HnsNwdKPYzztXyYyy5Gtf6d8/bX36luh9fhoS+L/v+VrLfLZKxh81zhizu5xR8
	I6R1+5vQEQ==
X-Received: by 2002:a05:6a21:918f:b0:3d3:adbf:7780 with SMTP id adf61e73a8af0-3de9e844522mr717549637.21.1790756390740;
        Wed, 30 Sep 2026 01:19:50 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7da126a49sm453319a12.7.2026.09.30.01.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:19:50 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Anders Larsen <al@alarsen.net>,
	Matthias Goergens <matthias.goergens@gmail.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v5 1/6] qnx6: validate di_filelevels in qnx6_iget() before accessing level pointers
Date: Wed, 30 Sep 2026 08:19:42 +0000
Message-ID: <20260930081947.511613-2-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930081947.511613-1-benquike@gmail.com>
References: <20260930081947.511613-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qnx6_iget(), raw_inode->di_filelevels is loaded directly from disk
without checking if it exceeds QNX6_PTR_MAX_LEVELS (3). When di_filelevels
exceeds 3 (for example, 6 or 255), qnx6_block_map() triggers UBSAN
shift-out-of-bounds reports at both shifts during indirect block tree
traversal.

Validate raw_inode->di_filelevels <= QNX6_PTR_MAX_LEVELS in qnx6_iget()
and return -EIO on invalid values.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v5:
- Restored commit description to accurately specify UBSAN
  shift-out-of-bounds reports at both shifts in qnx6_block_map() per
  Matthias Goergens.
- Added Tested-by: Matthias Goergens.

 fs/qnx6/inode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
index a350280f2d47..eb6b5dfbc599 100644
--- a/fs/qnx6/inode.c
+++ b/fs/qnx6/inode.c
@@ -543,6 +543,11 @@ struct inode *qnx6_iget(struct super_block *sb, unsigned int ino)
 
 	raw_inode = qnx6_raw_inode(sb, ino, bh);
 	inode->i_mode = fs16_to_cpu(sbi, raw_inode->di_mode);
+	if (raw_inode->di_filelevels > QNX6_PTR_MAX_LEVELS) {
+		pr_err("invalid inode levels %d (max %d)\n",
+		       raw_inode->di_filelevels, QNX6_PTR_MAX_LEVELS);
+		goto bad_inode;
+	}
 	i_uid_write(inode, fs32_to_cpu(sbi, raw_inode->di_uid));
 	i_gid_write(inode, fs32_to_cpu(sbi, raw_inode->di_gid));
 	set_nlink(inode, fs32_to_cpu(sbi, raw_inode->di_nlink));
-- 
2.47.3
