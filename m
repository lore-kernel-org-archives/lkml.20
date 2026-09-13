Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1FA326924
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311000; cv=none; b=N9N1D2FylY+QRauxG7/X3lg2t0fkDpxirKD0DTTeHOAVPJIjjSMHuWa6wZqVXTRK61662ITFI3Vhzjs1pygNvAuEytXQ9QBZaqcT04XGUnLjRwk1ViS781+jfC07ezrO3ELcyyzl+8AAGphyO0C6nJl6WbDAbO5FDlp62dPIf0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311000; c=relaxed/simple;
	bh=u8esOdOTfFzVCI5F3C0EbDh+10B+rPHpIkrnx3VBn7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Br+J6tktEslOeG6VrAuBh3dn0G4dVkqK5Oan1s+LLZ1Guy/2hEPYvRPTLsEDEXab/wBkQyLxh5uLhqwlpke3bC7AVCDXQZ9dF0300EYUQP/7vGF8GVunD/78AP9lZJW4iztzfiCb3k7aanerXrytZi/54lmeLO4t1iTw7fxPvhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2Rg4rnc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2Rg4rnc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so9663605e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789310994; x=1789915794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jwIeBJauvU7aEOo2TsAcRg29a4SIp+GcLjXkxP9CcM=;
        b=l2Rg4rnc9ynki09cRof5KOW5MpHUgwaurdfXxjEaf590/iKfXH1K7dx2enZFxdaFIC
         NgYYSeD9ztQvLGb7GM5F+UfcLWO3CX+fpNbyLSZUtFVCpDMxaX3jhWEMzKd2TamFjAPc
         ubscxUycfgG+vuSEBQaBLD2C/vZtJS8bA/K8C/ln9ENaClBs8WxqTLM/lASyNny8lHg2
         bClzwkDkQL+eVZidk8XAoSATU+YqIzw91LZI3E74o1mqFVy6ZkOURtt4Ssd9IrpVYOkK
         XzTkBzWSz9oRgYhNU6TOnuoObRDyaEJZi4iLBpoeyXETwPOhkgA/MozlOmO4EUFRzK+v
         SYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310994; x=1789915794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9jwIeBJauvU7aEOo2TsAcRg29a4SIp+GcLjXkxP9CcM=;
        b=TCIB59CkbGZ93TKPx8FfVZZH7zWkLhgtxqWTtygp4JdjaBJo7bK1Lmtjgg+BBFOgoI
         99l1kz/9Hc6mG+K9YK3cc/FGHfu6gqq+HKvyKTjyseD8HDpYQZZnL+4nCnyM/dusfm3t
         t/XbkAtFx6NaDpFA7pV4PdbWiQ39cDyyRjqAjhhLSt9M5rYCyV/o1UGSUD0Ra6TltmDw
         FfI9Bc+8zWlmmEYYp8SzhBmB5X4zkKrANEcqM794MPIATmarayS9eFMD9uL1EQKGS9Dg
         dgtP30qxffIxixKSuQmWCRcoq4dla66q9pOWOjERD/nSjIJFa9hMB7cwZwCbi12xC5rH
         AhUQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2f0CNDLI1eDIICi5nlpZhrIndNtFcKKRVNzjplUIurDSraHPhh6WyyydrpHsrOcIoDL6Mh6XstjzdNBQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mllAeIchl4Ds9zrI9J9V++qmDD/EPFVFeYZcV9pJcrtpFsIMGe
	SwjDYk0DZTUW2yRK7VfFwBqvE1HHiYWkBAFhV9etkJdr2fY6RsiOyRKt
X-Gm-Gg: AYBFou1g6x/0uF8gOaxGiiSuAv8KeKK7kpx2HBpTMlrKCzX7uPVp15UQaJBQfPs31+b
	K7RdvhPnBq29xhKj/MAq/1ktAMQ0TwZ2SEcL/3gZy4ZU7IaHOtTsdumr1XDJCXG+fKweSTREke6
	ksQSDwc8PUji/y1dxPrwnYrc6BVzo9ESZlkLVFTgHDBB/KuB1RIMBIhGp3ib8Hve0qEavMJtOiT
	UKDMA+e4WVGxQvKDXh7B2nvxvFY+wAP12SyXp7Q0DNaGYV3DEWTOf/7eaLuzJC4mLFRa2maBMfD
	Llj/+yni3ifn72odB4pHVISSTyBVxe9ODcCVinv9VIzVA7YoEd09u5OV5z5YMWFrt8KR5HvIx6X
	MACuu89OuncgKhiU9jAg1JHpkdLzAlzR7PI84JyYZwX79UzvsjNjR3RtKrVX1Oi+IYfRAew/hRm
	UoQEEqISPVp1yOvVUHHhEbQQ/3Q13k4BBBBVKJLFz89/YL8lurNmiVOneUnV+nx8lsJgzR2WB7O
	P9ZFp//kSSrRJlFNOj+h5Pw1Am21UFiKo5NGYe/PqM=
X-Received: by 2002:a05:600c:3491:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49e6cbfc8c1mr64395435e9.16.1789310993998;
        Sun, 13 Sep 2026 07:49:53 -0700 (PDT)
Received: from f.. (cst-prg-84-1.cust.vodafone.cz. [46.135.84.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6420de77sm109534235e9.3.2026.09.13.07.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:49:53 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH 03/10] fs: use path_clone() in path_init()
Date: Sun, 13 Sep 2026 16:49:10 +0200
Message-ID: <20260913144918.1606123-4-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913144918.1606123-1-mjguzik@gmail.com>
References: <20260913144918.1606123-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional changes.

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 fs/namei.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index c8754c7ba8be..11937cfa8c7f 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2745,13 +2745,13 @@ static const char *path_init(struct nameidata *nd, unsigned flags)
 		struct inode *inode = root->d_inode;
 		if (*s && unlikely(!d_can_lookup(root)))
 			return ERR_PTR(-ENOTDIR);
-		nd->path = nd->root;
 		nd->inode = inode;
 		if (flags & LOOKUP_RCU) {
+			nd->path = nd->root;
 			nd->seq = read_seqcount_begin(&nd->path.dentry->d_seq);
 			nd->root_seq = nd->seq;
 		} else {
-			path_get(&nd->path);
+			path_clone(&nd->root, &nd->path);
 		}
 		return s;
 	}
@@ -2801,23 +2801,23 @@ static const char *path_init(struct nameidata *nd, unsigned flags)
 		if (*s && unlikely(!d_can_lookup(dentry)))
 			return ERR_PTR(-ENOTDIR);
 
-		nd->path = fd_file(f)->f_path;
 		if (flags & LOOKUP_RCU) {
+			nd->path = fd_file(f)->f_path;
 			nd->inode = nd->path.dentry->d_inode;
 			nd->seq = read_seqcount_begin(&nd->path.dentry->d_seq);
 		} else {
-			path_get(&nd->path);
+			path_clone(&fd_file(f)->f_path, &nd->path);
 			nd->inode = nd->path.dentry->d_inode;
 		}
 	}
 
 	/* For scoped-lookups we need to set the root to the dirfd as well. */
 	if (unlikely(flags & LOOKUP_IS_SCOPED)) {
-		nd->root = nd->path;
 		if (flags & LOOKUP_RCU) {
+			nd->root = nd->path;
 			nd->root_seq = nd->seq;
 		} else {
-			path_get(&nd->root);
+			path_clone(&nd->path, &nd->root);
 			nd->state |= ND_ROOT_GRABBED;
 		}
 	}
-- 
2.53.0

