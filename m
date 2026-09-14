Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F333A453F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374557; cv=none; b=NIn4HVWm7cWeH05G8qcjJKKQ2z4n6N61ekmGWk6vs68G2MenrfYut8FXloDcYSAOz7Nkk5/49nWSPyc/KNd02m8f2dFIFi0JIknmxxYyBzldDbLC9nhzx9VmRfG/B01IOwWhUy3ob1mqjs/nJhmS4olymdjcu8GfAep9sUmKZCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374557; c=relaxed/simple;
	bh=ThjuJJIilkFnb3x21CQlJpZVJrdeK0DbvDM3qFJoTpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0S+ZwNvk0HdOELqfuM51Iv4dKWF6fEd0t4H4NRtoKATUWBHJoPWTw6REafqla7mBAxr8eMYXL1XwVpP+aE3hatltDr0VxH4SsUEKsGGb3s7csNaJk/bFEA334TI2NT6n2PsNPk2SvuRWBtDhXdX66ojPIT8XCopSZrQ4gDVg/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sHroQjuI; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sHroQjuI"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea48edcso1117017a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789374555; x=1789979355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VIqJAEv0wE0GewharGE+LoF/XSc70c9h3/w9GQFRHEs=;
        b=sHroQjuIbiEQXSi22SU9sWidRXpp5zHr7SJ6AsJNq9LF1pd3/023NoAUtdDkYCcxiJ
         49KTlwKA6UeVZTkn4CAbe5vlA7q94Ybk9pkOkVp9aQ51rhCEgbMUlZF6duFaNngUXmP/
         ekRFobmrIYqjF5ZgNudTj1Ne1nA8/WGIY8yHv47Ab0bs32M/ImQKJ4RbYanlV0WntBse
         BvxS4PkVUzW0A33Q0qvkDVjLLmHUTIerDMltROeuh/5ZIuZY3CwzY5T9SRDO0UWx/AO4
         xufhw4hJH04yjTr9TGp+waczB/JJ0mYa6vgT/cUxma7RHu/TqSp+u+cxaWLMDNqfPO1T
         +kfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789374555; x=1789979355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VIqJAEv0wE0GewharGE+LoF/XSc70c9h3/w9GQFRHEs=;
        b=sizPLSlNeXg9jK97PZLi+bcfJF/DZv/lYHpeNFTYLM4Qv6RZdR9P5p71s44mejunKa
         vPaV8X0W2IyF/Wan16IVmnq4zbSdCS8F+9lijDJRTAiKPzpXU0q7w2IJUQimQ69n1/8T
         zgtuNUJ8JQ2X8fqhoyEPgDx3lvYAn1NB3FyRU/WPgKz/UHzwEypL7qwIe9aYpG+fyYR2
         XqelfC8kMLI4Ymw7CpIdBwafQpKGyXJvec/3FfHeLrySb5Hei6FKDzhoWfINxpuGyH6C
         gODfF2b3FEQD6aLJHvcM8Aaj/jqiHDOWDL7DMqtYCS7TXh8j9xOw8EN1fjcwQwdmA89X
         Xi1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwzVWTioPp6bkK2wjOOB8zTBaC20Feo0KouJAf7fvx8ObVBl+O6OOz3jQ2qg6PUMjsUxR4eEx4NKUGjOuI=@vger.kernel.org
X-Gm-Message-State: AFuF++mnvFbiq1AfQoyzH76z0a310T8XTG62U8NyOekLbjZByZOxIxmJ
	vKXHCyTuht+2MAz1YBF2QcdRtaNH2OalPl5UKlFhvmvOLmQeha3SM1Jk
X-Gm-Gg: AYBFou2c4vUYbBbt+GeCMfndtbaz6+QD6VE0O8pWFlDIHyPuoamV1D8w0uK2J6DCc71
	kO9Yzx5g3XiqYA/Uc5+AzpbBbOIHwL8BZRvQLWglGOTyaFi3FBFtUB7j2nMVd50nr3xvzLqQ/5V
	XNH2tsG5ud9UH/zHtfvso7iHNx1cm3mXBP+zg2JZMdwyCcAnKJPWH0CtXEAwouYGk1BYsAc5a8h
	ZrTNxZyC/kcD6I2a2c9h2bxn+29fHOuwRjLCLgvBIPrce5ViK2E/vRqx+4xtNAV2LH8+EPmwAwo
	wG43F7KLPxZ+0VLKV5rdK34zOG76vkwvJcMERli8Fli9UQTLHn4yhTW70OxNxQzaBvaVmg8O1AN
	WwKcOs7izTL373pYlenHmaonMc6zbbGMv2MDTZM/20B5iGFgN8V5WX2ItmIb8wyoxMnjk1Vrt0+
	AdIqLxCNRee8r0l55HJlENcfSOjTom8Y+YKmcfS45IAB8WflDtvpyN49npYfni/WrOVTV0Pvjek
	q/NH/Rwq6X9n3i29Y7jpgmsN6YNC3OwM7uaefuAB6ZVK9y/drq9tmkBbQtvdRTXepKenqTmdSr8
	gO2xsLPBz576YhrEWj9SJEGw5iGYt8Hou5VT5FZy4EZTfOH7ml50bcZxjZ87zr3b0Ji10e+gRRC
	lIpuDVE3f
X-Received: by 2002:a17:90b:1a85:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-39debf9ca9cmr3433982a91.9.1789374555059;
        Mon, 14 Sep 2026 01:29:15 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-b.c.t54fbfa9bf0658dcb-tp.internal (189.207.21.34.bc.googleusercontent.com. [34.21.207.189])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994872e0sm19843658a91.8.2026.09.14.01.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:29:14 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: "Darrick J . Wong" <djwong@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Subject: [PATCH] xfs: prevent close() from hanging on frozen filesystems
Date: Mon, 14 Sep 2026 08:28:36 +0000
Message-ID: <20260914082836.1658-2-aditya.ansh182@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914082836.1658-1-aditya.ansh182@gmail.com>
References: <20260914082836.1658-1-aditya.ansh182@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a file is closed, xfs_file_release() attempts to trim speculative
post-EOF blocks. This requires allocating a transaction, which blocks
indefinitely if the filesystem is frozen.

Fix the hang by wrapping the preallocation cleanup block with
sb_start_write_trylock() and xfs_ilock_nowait() to bypass the trim
best-effort when the filesystem is frozen or locking fails.

Suggested-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
---
 fs/xfs/xfs_file.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index d8202da15aca..dd6d2e08faff 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -1872,17 +1872,21 @@ xfs_file_release(
 		return 0;
 
 	/*
-	 * If we can't get the iolock just skip truncating the blocks past EOF
-	 * because we could deadlock with the mmap_lock otherwise. We'll get
-	 * another chance to drop them once the last reference to the inode is
-	 * dropped, so we'll never leak blocks permanently.
+	 * If we can't get the iolock or if the filesystem is frozen, just skip
+	 * truncating the blocks past EOF because we could deadlock with the
+	 * mmap_lock or hang the close() call. We'll get another chance to drop
+	 * them once the last reference to the inode is dropped, so we'll never
+	 * leak blocks permanently.
 	 */
 	if (!xfs_iflags_test(ip, XFS_EOFBLOCKS_RELEASED) &&
-	    xfs_ilock_nowait(ip, XFS_IOLOCK_EXCL)) {
-		if (xfs_can_free_eofblocks(ip) &&
-		    !xfs_iflags_test_and_set(ip, XFS_EOFBLOCKS_RELEASED))
-			xfs_free_eofblocks(ip);
-		xfs_iunlock(ip, XFS_IOLOCK_EXCL);
+	    sb_start_write_trylock(mp->m_super)) {
+		if (xfs_ilock_nowait(ip, XFS_IOLOCK_EXCL)) {
+			if (xfs_can_free_eofblocks(ip) &&
+			    !xfs_iflags_test_and_set(ip, XFS_EOFBLOCKS_RELEASED))
+				xfs_free_eofblocks(ip);
+			xfs_iunlock(ip, XFS_IOLOCK_EXCL);
+		}
+		sb_end_write(mp->m_super);
 	}
 
 	return 0;
-- 
2.47.3

