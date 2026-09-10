Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DDC4AB1CA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047094; cv=none; b=i9YRaWP3ljWbQjQEVSwncqa4frlJldLQ3SfNNLPmRM546laxo+pJNS88GSep0E/1nixHOQRzsEFpZ9XBaecWbB+PnjeONYVrXyZB0l59iU0xzLoQyqw6KCrPu2mIkBLMw/bYBA+xrBQoLg0N6lsdFuMqhZ7sqX+qsS0GNYLF1L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047094; c=relaxed/simple;
	bh=9aWxhq6aPkbkBA5Bm034rqeiube8V2OfXvl3w7mnWNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E133eszZTt5wpWV0xFAC8sINFQ8TAQjVeg8avdXObyuVXNc93sOCKy1rPb0PeEr/0emRWfsIcmn/bI/jA7geL48AwUHM19YfTS+J8MvozfnO+TafTZwDv5saXKNMsKpji7WYC/U2Enp7RRlOCyYriNeiLA0S7LKLIgXvI3Xs3ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aoZrjCzy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bBR9se2t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aoZrjCzy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bBR9se2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789047092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GrVnlBtAuLm+sbH5l8hpM9T8LdGQ5QcnQOqckPlEqwg=;
	b=aoZrjCzya6VwkK2vXPUhRmPINbdwV/3bNdpRkXvoBi0FwsSfTxgRuekbZMrs27Ut62WRfG
	HE1vz9ydHttw0NF00SKNzgKY5TKRHF7DCa2FCipLTIHWfv3mjO5kqXk48SRRjrW4ISNCcw
	yfUWYXsg/VRgClGvIqedtQXjYWuvQeY=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-VLfhQYKIMTiHohgwd5oR9w-1; Thu, 10 Sep 2026 09:31:31 -0400
X-MC-Unique: VLfhQYKIMTiHohgwd5oR9w-1
X-Mimecast-MFC-AGG-ID: VLfhQYKIMTiHohgwd5oR9w_1789047090
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088202so6475143a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789047090; x=1789651890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GrVnlBtAuLm+sbH5l8hpM9T8LdGQ5QcnQOqckPlEqwg=;
        b=bBR9se2tJfGo1fA5NEj6DkKfhAQXPH97nsmwaKkgIng/6M6t8dF8xMVH2DlidZncRg
         UmToKc2A32HGQ0hQhorsMlLt06aU7EEl41ige/lTEjFWojhby32Ss4n9q7VTnCjj20aC
         GMN2M+Lmmc1OBowM//pukyCQw/7KVUXSGMBSR0AWQjHcEQdhoHkpw0L+00QneG9X2073
         yryPDVUAv0Ru5tTumJxGvDVoFwsjPMyUO+rI1Z7m0LQc6VTdzcpXYQdAfsDIWp7VBaA4
         ENQYbBUZfeCKJ2jr7Hk9v0yPzG5b6W1JSuenhfj5n8amwrHvSUx0Au4RDL5+bOaslrIK
         /Pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047090; x=1789651890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrVnlBtAuLm+sbH5l8hpM9T8LdGQ5QcnQOqckPlEqwg=;
        b=rs12lCtKzYjxe0y29vsJlPew0x29wOmLLOLolX5HIzOwnCa6ohwE38IKw1/RqwpK/q
         yLOPNDO+Y1gMyvt0OaQxPXyy80ZkyG9EaVAJFh9rSqt+uKxv/4aNXR6T7aamNll6wxaR
         D0WOKRwCq99d2MM0GLpK7XFFyrbOf/nPBD4+uQaJ5TSbi7vI4kfnxn4pgy8avGlBGiJA
         /wBF1D7CbZh7BQ5virJ4hBfET1A2S3R5W3OcroP4T94a3kTFmzsV9CYZqpeRZyJgdqu2
         c5+hNfaU/t4etXAHc+kXaUsfvEtTULil1VyFwq1+23SWwuelG6Y7+5o56fRIAlOV5CJy
         11KQ==
X-Forwarded-Encrypted: i=1; AKwUvBzI7H9VaqmmFSWzlL97/GTEdaER7JEJl9yCHHJyYGy6VfOMwyoXPcb5H+tYzqJ4RBJQPgVv82OL9hBz5Gg=@vger.kernel.org
X-Gm-Message-State: AFuF++lh/A8SqQRVaY8sn3TQYy/CVjbM0UwwKBE2s2HVs65fbyJDTyNQ
	U8MnWG/37P4E+3QIa7aVa8AhSdFebMLYd6kSyU49kykuLPx4Sm/9CabjaikHOsK1ccuWOAgqz0s
	6afVCFBsPBjr+kcOiWFj5cr90uDaboYVUNNaMflcZ/Sho5RXhnOkKW1HTjUb11QGj4g==
X-Gm-Gg: AYBFou2PYbohAcl4q9ZCN5IKgyv31Ztv3zY49aMKj5WPT/UqPf2XbfHuB3Z0oqXSxDh
	bWjDrlnMGillm6sbrqfFqdnlhIb6LudT+4ApeXx/XWXDaVKAeihI1uO/q4wcQX93JilIBC7wuQB
	ua/Fs2krqMDoQTgUyoLhp2i8+d/tm9zULUiUXL53J4f7lAH7xT+CIWlih41pMvNm04TIXWGVrIJ
	pmld6QpTsvTL8UfuA9rep1lCY7fQyVIcgAGnNPOi46lQ8bkGlBmcd8ElKAL8pAxpD2i2qISPKyW
	G9pGh/5Cb2iuKb2j7AylZOYncH/mgFTjDHqjpwkbi2o5/opfbNhFyS0bFcEVdRnzddtXc3ckUH1
	qxqoSUjmlGWPRS+t5uf0Tdm8j
X-Received: by 2002:a17:90b:384e:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39d707b291amr10389483a91.0.1789047089866;
        Thu, 10 Sep 2026 06:31:29 -0700 (PDT)
X-Received: by 2002:a17:90b:384e:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39d707b291amr10389329a91.0.1789047089066;
        Thu, 10 Sep 2026 06:31:29 -0700 (PDT)
Received: from kernel-devel.tail62cea.ts.net ([240d:1a:c0d:9f00:be24:11ff:fe35:71b3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm5032004a91.5.2026.09.10.06.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:31:27 -0700 (PDT)
From: Shigeru Yoshida <syoshida@redhat.com>
To: Carlos Maiolino <cem@kernel.org>,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	"Darrick J. Wong" <djwong@kernel.org>
Cc: Shigeru Yoshida <syoshida@redhat.com>,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xfs: fix double mutex_lock() call in xfs_ioc_health_monitor()
Date: Thu, 10 Sep 2026 22:29:55 +0900
Message-ID: <20260910132956.538828-1-syoshida@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4870da4f49ae ("xfs: take hm->lock in xfs_ioc_health_monitor()
before insert") intended to protect the __xfs_healthmon_insert() call
with hm->lock, but the second mutex operation was accidentally left as
mutex_lock() instead of mutex_unlock(), causing self-deadlock. Change
the second call to mutex_unlock() as originally intended.

Fixes: 4870da4f49ae ("xfs: take hm->lock in xfs_ioc_health_monitor() before insert")
Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
---
 fs/xfs/xfs_healthmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_healthmon.c b/fs/xfs/xfs_healthmon.c
index 6dc3f69d6798..c3749675ef19 100644
--- a/fs/xfs/xfs_healthmon.c
+++ b/fs/xfs/xfs_healthmon.c
@@ -1225,7 +1225,7 @@ xfs_ioc_health_monitor(
 	running_event->domain = XFS_HEALTHMON_MOUNT;
 	mutex_lock(&hm->lock);
 	__xfs_healthmon_insert(hm, INSERT_HEAD, running_event);
-	mutex_lock(&hm->lock);
+	mutex_unlock(&hm->lock);
 
 	/*
 	 * Preallocate the unmount event so that we can't fail to notify the
-- 
2.55.0

