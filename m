Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7351751EDFA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866187; cv=none; b=G+xwVSmywEf7zad7rs9my9pzX/OU7J/xQ4W0Hb+/vZw1Ob8lSXYgQF48iCAtZg5Jj0XvHOZ56vFgMn7o1jJO+N55HXM0oazpO5nF1tJP4/cVya/ObswEskkvsBSuBekQYFC+xvXunHmHwwX56TNQRiwihsuqjI823vyeEqKhhf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866187; c=relaxed/simple;
	bh=od5UOGqE7GtEqrYf/tsxbzP7F5YC9LcKKBOi7OU84K4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7X9qj2Q6NCzERDSsEcDbkL/6SSmdzR23m+xE4fH3pFLoZnX39JJXLVN6OAdhOhbOVUSh7tI7Hh5bFAAyKnSKqrcL7EtBhA/5xTUaqra3hQcYNCvfdGcON62RkWYFlt48sHzKseLhH/amWTbDEay6XbgzTkqyC7VDce4Hmf7hJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIQryTAq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIQryTAq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2dfa54c8ccfso3295275ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790866185; x=1791470985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RW0gC8Xa864mcCPKJ6lllOafsP+DDzzv6dxQC9lX8Ik=;
        b=BIQryTAqKA5CMjom9nOTM7XCRWqOJm4p5m+xN4h+G6a04irnb3ATtju+Wkkiq1ULzb
         OlhcllGdExth3LIH31ONnEGaR1vaOPB6D2xLILQf8/Q7ZZ7ikIYzXWnbYVj6hcQb34Hf
         BOGvKEMqpdgny0fpTbZVIt/rtWbKZ8luuxELQkAawft5/GO8wdABPQs2TGwqn/YnddoC
         T0oHIPfemM0xD+BNWMjVBhYdJTv4B/PCv76F0Z+hXKOJjjqG1QjokioDID3L6GJu/c9q
         Ju1BogtYtB8zwKH28OTslkPL8U9x34tM5AX1t77El1XJWfzN8Hs4YN/PK56LD/IllISv
         nhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866185; x=1791470985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RW0gC8Xa864mcCPKJ6lllOafsP+DDzzv6dxQC9lX8Ik=;
        b=nKGi4f5RSpEIqTOZx37UWOy2dRs44OF0bAy2Wi9zEDjhz/t4TYFCwbmIR9Jixfdq1F
         bO3DCvJFpUFtLfTUmuuKNj/8rA97vzYw91lKHIqfNdmkBokQq2Qn+6VQs8j6WhAu4tH6
         YoKsb+jQjjCbsXeaeqM+i+NbQX1Xvnotzm8fsfjGdtjgP7ITvMtu+9/z6fOHB5zI1nzq
         FWYf++dDBQVOyTyz9UXUh68qJYoGAP8s+xmMRSBRFQoNflkeHyQ0wEVZqF4YESaVQ1vN
         Z6zddXynsxzciyYBExWqpsdhOdVU/uDPVb48VEKF54RK6SxrfN15nKB6ABTrosvTcSIV
         9vCw==
X-Forwarded-Encrypted: i=1; AKwUvBzEzI8igLzhEEBSyp5vgMVe7+OW592gxNRri9JFjQv9IlcbqolLhgMYRI3BwaDRdsi3Ad8yYtK7RyPZoXk=@vger.kernel.org
X-Gm-Message-State: AFuF++l4CGtOIeHD6lpT0I/cjnle/Jji3WrKhnA3HLm1aMDZASGmiKU5
	e1lDoWuCqoadR9FFB3zLgUJMIhc8Ggt0BiaWSBqmL4rWhU2Ytz6X0YhN4mQ090vfTEj+Qw==
X-Gm-Gg: AYBFou12ahZKYfasqkvlWUF9rl+7xTXCfN80XQYwrS1fnBDMTD9Fc2KR+ptl9UEU9vf
	z+cf8MT0nkj7qx6erM5sxF1WiWrwqyOYkbXX8EcZBJ0ysLVpJHVnhef8QZzsCM/F68kaUsXEBh7
	hhNNQEaoAcZWxCNNVqXemIOAHqpfLEktKg+yataIGlJYpUzxuXvoeiKiZrzSBzRmJye1PpCfys+
	mw/BOutACBzOlu7m4ttYwToMaj8HftAs+yFPoazRll9o2sWUq/7wNF3qpXPfNml1Cl8pKFn2oxi
	LnlTNnHJJh1V7DQfcvSPd4TphO7T96tolnfBQXC+8u/6VO0sNTf0WMe15VjYZvTkL8/OVEguyRx
	4ywMs+5QKemqDmZc6bNvAz8VdV7GXHy/HBZkFGUg1qrR8qJr9avfYy5pRXVfL9WYBVZk1ZXFkQd
	jhnsQOkNNts5U+RPLfHTESu5wid/ic12/uLcr2X8/MeUdP52zWUWs10gAhUxd6BVuUL9mV1F3Ru
	RhWw0vNmpCU4Ph3aHcrokohoTKlE+dQoZGjwAE/KxC/9n1cnaJHoScRKYKe42cPJbjtIFRaGZo1
	/s51+54cxOB4IgGIpwaQZ8+TcvHJ4mZPoPji18bRL0F3lhsSHlrgFj/tNjM=
X-Received: by 2002:a17:902:cf41:b0:2df:b675:22c5 with SMTP id d9443c01a7336-2e2ff199cd2mr18864605ad.0.1790866184464;
        Thu, 01 Oct 2026 07:49:44 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e317cd0624sm6636775ad.30.2026.10.01.07.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:49:44 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	liubaolin <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] ntfs: set the attribute list size before reserving space for it
Date: Thu,  1 Oct 2026 22:49:36 +0800
Message-ID: <4923ad1070694beb1b6ee07c07cfb0a38015883d.1790853718.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1790853718.git.matthias.goergens@gmail.com>
References: <cover.1790853718.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_attrlist_update_locked() resizes the attribute list and then, for
$MFT, tries to reserve the maximum list size.  When that allocation
fails with -ENOSPC it falls back to ntfs_attrlist_repack(), which reads
the list through ntfs_inode_attr_pread().  The read stops at i_size,
but i_size is only updated after the reserve, so when the list has just
grown the repack gets a short read and returns -EIO.  Only -ENOSPC from
the reserve is ignored, so the -EIO fails the $MFT extension and with
it the file creation that needed a new mft record.

On a 32 MiB volume with 512-byte clusters whose $MFT has a non-resident
attribute list, 591 of 1500 creations of empty files succeed and the
rest fail with EIO while 742 KiB is still free:

  ntfs: (device vda): ntfs_attrlist_update_locked(): Failed to reserve attribute list space
  ntfs: Failed add attr entry to attrlist
  ntfs: MP update failed
  ntfs: (device vda): ntfs_mft_record_alloc(): Failed to extend mft data allocation.

Update i_size as soon as the list has been resized.  File creation then
goes on until the volume is full and fails with ENOSPC.

Fixes: b1d732e62a5b ("ntfs: repack $MFT/$ATTRIBUTE LIST")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
---
The volume is frag.img from
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-26-ntfs-mft-runlist
(mft-bootstrap/frag.img.xz); creating empty files on it until one fails
is enough.  Tested with KASAN and lockdep: after the patch the files
written before the volume filled read back intact after a remount, and
ntfsfix and ntfsresize --info find nothing wrong with the image.
---
 fs/ntfs/attrlist.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index 3660e7fd24b1..6edd5d2d9bf2 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -256,6 +256,9 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
 		return err;
 	}
 
+	/* ntfs_attrlist_repack() below reads the list up to i_size. */
+	i_size_write(attr_vi, base_ni->attr_list_size);
+
 	/*
 	 * Reserve the maximum legal list size while the MFT metadata area is
 	 * still easy to allocate contiguously. This prevents a later list entry
@@ -283,8 +286,6 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
 		}
 	}
 
-	i_size_write(attr_vi, base_ni->attr_list_size);
-
 	if (NInoNonResident(attr_ni) && !NInoAttrListNonResident(base_ni))
 		NInoSetAttrListNonResident(base_ni);
 
-- 
2.56.0

