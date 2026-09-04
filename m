Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4828E46AA97
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518038; cv=none; b=UzMV+YbhvHKATwA7/CNQ6YF79KPY5NTdXKlMzS0cKbjGQ/s+eZIGu08SKdNjpL5UBj9lY1/IaRRUyYMlUD+5g5q1/4dl4HfcROxebjLTe2dhkFb7oeFi/A/Me3MNxuxA1at4KVwHTB7HLXYHEc8hLRk/NEkLLVrSCbSePog1jx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518038; c=relaxed/simple;
	bh=lnOd2Cu+mfYC06hiaS9xwajbcEsrwnQBxbyBPrBJXnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B/nCU2n+9riV4xDY1Giplr/4d8o4Bxebx7FaA5BVmJAGlpt+CkVPF6AyWHkYXXdh39pVHiBUebKCSJMaiFDGDpfqP5kAFNFFQaB5SHU/y8B7VJTbEmKMZuME4rOt98xThch57hXOz4Zwug9TE3VxrN8tJbxpQWqDWFUvb+nwC1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=dHQE+2sJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="dHQE+2sJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso5610055e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1788518034; x=1789122834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CH4/K0wijj7OtRSv4HcTF7FzgieNSCBLu9edWOGkVVg=;
        b=dHQE+2sJcyvfOvlxjN8MRvfSKb0YVCp2Nh2xKoUKmKqESo+yJSxQBAsUf4e92TLuAr
         n64RhNIAl4NCmEMxs4TGKEBlcD+cs2LDzMxNnAQ6uLiI2USwrp5n4dFWO2cA27irnjr6
         unPz6FMFM0xsqSgN/V+6P0WgZ9B8NmkIIf8AEqazeu1v1Tb+Gig8CVynvrA+K36ICWNt
         NkIapDGIiOqLxbvKmK7uIrrgGzmHv7/Y106KsDsbJfxtmitQCnvSLpsAHtvmPw6XvrjM
         qbxW2gH9Fd4kovWnkN8DzC61cziSH5C7aB5c1GDdND+NT/DGT9VcRZBm+Fj1wmtOLIpZ
         dmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518034; x=1789122834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CH4/K0wijj7OtRSv4HcTF7FzgieNSCBLu9edWOGkVVg=;
        b=MIDSgwUh5q7maSYUCHkIwdVFEd9oQDi5FoKNWR7g6UPJWkZwFiURvVtEZzdfyYeO4k
         aukqre19nwDwLVkUZ0K4qlYI/tmzYT3m8aaz5gzxToIya16MNvYT1gBJ0SxPBgcrlj0Q
         auzwXjGqoCcPusFBfXuog4qsdNgSPoZMlU+p+lZSFbjbiLjli9BPAwWXllsdsxE36GHg
         u3rrj3xmCijsFnxXkyCN7/XPfnElwb/mK90yl9BLnpkXKQviGLRkmVTpn3PDhBQcT3qU
         t5YIRQ2BzYMMav4LAsLr93ibefpJSKOL64SSeAxyWjpelSKjYozdu4I68ssiYp9oR8P6
         KDeg==
X-Forwarded-Encrypted: i=1; AKwUvBzmWkCzrjgMQSfQJCRFJaQfP50GoloM8ojseIJDm0ZL/iEWpJpK0teDaJ4eVeuOgj5ZUmi/wKYAtSqMSx0=@vger.kernel.org
X-Gm-Message-State: AFuF++lWRS7i2H2HZv220rZJXx/0RsilkOwI8PXcy0U5e/qaovCkOZuN
	axe/b9RHU97ZDPbMWjRZfcII4nUjyk+bwocSLJhtR3E3cvsnYHgv0qYO3BGLuQqrWlU=
X-Gm-Gg: AYBFou3YYQAafhyFppRF6rj5/t0t1LYI9Q/tsuXyLDM4lodClPCoPUyF22FZDP+5Z9P
	GeKcFUdRyzVueJ0FQWJ44szyp6+Gmy6xHeemujiRSTxG/lwwgghiJ2JNxywIW68RPNp8dXpT7tV
	yxAEt5slqxmXdLSb1fSB72jd9rgTTjOMFlcrxTs8p/Phs0ZlEPT0lH0HQobkqWFJuSgDHhSacCC
	Nmwj5SDY+umziAY1TVwtkK9OQIA6/xoNjKEwpJJViwFHrX9l47VPGuWc8zxwlERXgad9NrGHQxw
	tI8Ya0wKc2IXikRzt8djFQBhwETaLbMwehGhQLcYfdHWwg6JW0YcfuuF6EY9FYEy9UUdnr/GH5d
	BgTGVAlyglfZ95kWiBSidRBTxOxGBOouxyX5H5YUxsHOOFnpmAgcJE+9nJU3qGmmkZ6/O8/FYhU
	4x5IZhVbCTKUAZs8JQ79WSjDawn5jUtFMqZdTbSQLV+9db/MXdZ0IxQ/SfXiFxItwsil16Ap3CC
	r11zIeTHGCUZRyTLg4RzTkZ+R/Xsbh7YtVdSSo4BMG1366hr9mK5qSQEeFsxb24
X-Received: by 2002:a05:600c:1914:b0:49c:ff23:a6d5 with SMTP id 5b1f17b1804b1-49cff23a70bmr3661865e9.0.1788518034477;
        Fri, 04 Sep 2026 03:33:54 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm141003045e9.15.2026.09.04.03.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:33:54 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: idryomov@gmail.com,
	amarkuze@redhat.com,
	xiubo.li@clyso.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	stable@vger.kernel.org
Subject: [PATCH] ceph: avoid pending truncate during nonblocking cap acquire
Date: Fri,  4 Sep 2026 12:33:51 +0200
Message-ID: <20260904103351.15357-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Readahead acquires caps while the folios are locked.  This can
deadlock when processing a pending truncate; truncate_pagecache() can
then attempt to a folio that is already locked.

Return -EAGAIN instead when `NON_BLOCKING` is set, causing the
readahead to be abandoned.

Fixes: 49870056005c ("ceph: convert ceph_readpages to ceph_readahead")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ceph/caps.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ceph/caps.c b/fs/ceph/caps.c
index bcb04c6cb92c..86e195c5fd32 100644
--- a/fs/ceph/caps.c
+++ b/fs/ceph/caps.c
@@ -2889,6 +2889,10 @@ static int try_get_cap_refs(struct inode *inode, int need, int want,
 	}
 
 	/* finish pending truncate */
+	if (ci->i_truncate_pending && (flags & NON_BLOCKING)) {
+		ret = -EAGAIN;
+		goto out_unlock;
+	}
 	while (ci->i_truncate_pending) {
 		spin_unlock(&ci->i_ceph_lock);
 		if (snap_rwsem_locked) {
-- 
2.47.3

