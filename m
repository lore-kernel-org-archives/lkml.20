Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A5A443C10
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122372; cv=none; b=Vabhm5y8svLEGuk2yY1f9GFZACDYXh3RPj+qYLuf5cx1CdMs7i9zweEYWfcbin/egKm+da9ii+Uewsgb5XHXxIPLPS3NyPBZCUYYiMgtEE8ShpuYLDIDfj6N5s0fi0AnVkaa4qJTrbcEu/dxDYD7yO5zBUaU+atHOph6wseZAT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122372; c=relaxed/simple;
	bh=eqVZgeBn3pFGkDvZueVueXd23kt1HUk/Ka9kdogQI7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvNPOI/bpNcsui3dj+cH3W7XCEZchd1O+XaJAy+MiDZODpbNF8+GgQYNqXMUzF2ntG0RUdFqD9RVtIMqypI445vNmSCJV1RarvGH1GwHCFHsoPEcGEJQrans2nKToaH7bMuAXpqv3LEN1qydrAJ1KlHpFspgSsmVSs/11k7Pp2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCAzeJty; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCAzeJty"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d715f4a587so9389675ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789122370; x=1789727170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yz8Wf/76e1pwHAM3SmDXbmtzcXfyZlPBJr/oXRWCwns=;
        b=aCAzeJtyyg8KnJWpOVWtsobv94cf9zhcRY0fZGNfkg6vh7xDkj0ewh6bH38ReXLM2D
         5nQ0a90TJ87P4HwrImPZyaAd+ORZfO85WeohyYFS4YFfuy3OYez67r5kXrXcURdcprZZ
         NvTq/xY2uhtdfKu60r/gFBk2y1Y1plfqRSle6I3u43LHeDRhBPM+A4ilOuki97iUxN96
         G7C4NV7HItwMjlwPQYl0RSrOExPJK4y4jN6r25HAYimnoeGukseU7OuejkUiVra6gAEw
         RfTvdE0MfGcdGaNyHy2G68RfiCpPG0Chys/5/S8qUpFywcQNP4fgSXRCnas2Z1lMSL8K
         pIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122370; x=1789727170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yz8Wf/76e1pwHAM3SmDXbmtzcXfyZlPBJr/oXRWCwns=;
        b=Wm/uVX9P86aa3x6gc8D9E3ltZ4Rw7BK70IoHVQ8Tf/q/IkHK5O/KJhwBloL7b7+9w+
         3sPeaZMVUObtOdk57hwfl+bSMI8DUVvrzUkR0wiJoupf9P43FZJ7YI7cQHFxY4wUfECO
         WwxtODxHekq8U7+SL5TSvVuw9ivdja6o6K5IbeNQYIKoKwYfru1lzpaM23d2bNQ7mp+Y
         SGGKjV63z5PBu1yV4Ih/PzMSrcD/yDm+GtrFXh6WY1tU/yQv0YeKcAeJ8CreK3wJ16uJ
         mBBS5lyg2oaqufDS3YWPtchucN57FJMCU8qs+KvC08RrnlZIDQnZeShd00QHIbVpoM91
         Ppzw==
X-Forwarded-Encrypted: i=1; AKwUvBzH83HO68NBxrJC6e7So3x5PVAAPLZ3b84KgXP2/2Pgq87vOxNrB+lQhzajPx9710iK4QRxtkO+naqawh4=@vger.kernel.org
X-Gm-Message-State: AFuF++l3D9QOXb6HOgwxVQSrcaQZYMEhwIkBBDK6kiUgrwYHft3K3Vhf
	YBGjp9naEwctPe1OUJUCmcO9RQYODPJH6iwYvIV57D2SOY4mTL4NpD9aOhalww==
X-Gm-Gg: AYBFou3ytZ89KMeHhMTms3GAc8gelb3laRovzaNqwlcU2bu8tVXbgaCc/SMJBAw43s8
	Fj6dVxUVC//R8WOsDsSMm+tvnyDKn59bYfQumiEbLwikQB5Zs035ZKWoslvTHMKN4i6cEdsR3If
	+x6CBnG6U6aTcxJxaMQccA9Y6fJMFqRhglTvb2cO1M+foecJTI5jN5kLR4N6d9XugOVF+E8E7MY
	wS6Ldh3XxdmCK+CUjsogap743QlF71QYCICBgfniuirBAuL6nad9npryuIsNPFTAbIIgYsd4rQI
	QyG4l5za9Q52xCNCBFoLXp7X2UQdFbQygjVewK/PYJlwZB4EzidYF7QsXfP01dqdewYVi3e5whU
	IVE6o4yofV6XXPm7AYAlDMtTWpkRK3OiMrzZ6Za1BpJmg6/zzSmWxzaXw2K8KbZvweArIohOeW8
	ZbUrUi37/MZKWoYDaMMx/avXqLQD68bWcaFIkKwj8D8Hjo4YW5AO1s1QX3bTWprTNVWr0hLL1ai
	RPk
X-Received: by 2002:a17:902:ce0f:b0:2dd:8b2:6e64 with SMTP id d9443c01a7336-2dd2a336804mr84860135ad.12.1789122369587;
        Fri, 11 Sep 2026 03:26:09 -0700 (PDT)
Received: from Default ([2409:40f4:1034:ff33:e7d7:d190:816c:e597])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed295esm6220095eec.15.2026.09.11.03.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:26:08 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: cem@kernel.org
Cc: dgc@kernel.org,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeffin Philip <jeffinphilip14@gmail.com>
Subject: [RFC PATCH 2/2] xfs: change xfs_trans_ail_delete return type to bool
Date: Fri, 11 Sep 2026 15:55:02 +0530
Message-ID: <20260911102502.163566-3-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911102502.163566-1-jeffinphilip14@gmail.com>
References: <20260911102502.163566-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change xfs_trans_ail_delete's return type from void to
bool which returns true if the item was removed from
AIL and false in case of shutdown(item not in AIL).
Reflect the change in header file too.

Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
 fs/xfs/xfs_trans_ail.c  | 5 +++--
 fs/xfs/xfs_trans_priv.h | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/xfs_trans_ail.c b/fs/xfs/xfs_trans_ail.c
index 99a9bf3762b7..b17b677586a0 100644
--- a/fs/xfs/xfs_trans_ail.c
+++ b/fs/xfs/xfs_trans_ail.c
@@ -913,7 +913,7 @@ xfs_ail_delete_one(
 	return 0;
 }
 
-void
+bool
 xfs_trans_ail_delete(
 	struct xfs_log_item	*lip,
 	int			shutdown_type)
@@ -931,12 +931,13 @@ xfs_trans_ail_delete(
 					__func__);
 			xlog_force_shutdown(log, shutdown_type);
 		}
-		return;
+		return false;
 	}
 
 	clear_bit(XFS_LI_FAILED, &lip->li_flags);
 	tail_lsn = xfs_ail_delete_one(ailp, lip);
 	xfs_ail_update_finish(ailp, tail_lsn);	/* drops the AIL lock */
+	return true;
 }
 
 int
diff --git a/fs/xfs/xfs_trans_priv.h b/fs/xfs/xfs_trans_priv.h
index f945f0450b16..b00c803941c7 100644
--- a/fs/xfs/xfs_trans_priv.h
+++ b/fs/xfs/xfs_trans_priv.h
@@ -100,7 +100,7 @@ void xfs_trans_ail_insert(struct xfs_ail *ailp, struct xfs_log_item *lip,
 xfs_lsn_t xfs_ail_delete_one(struct xfs_ail *ailp, struct xfs_log_item *lip);
 void xfs_ail_update_finish(struct xfs_ail *ailp, xfs_lsn_t old_lsn)
 			__releases(ailp->ail_lock);
-void xfs_trans_ail_delete(struct xfs_log_item *lip, int shutdown_type);
+bool xfs_trans_ail_delete(struct xfs_log_item *lip, int shutdown_type);
 
 static inline void xfs_ail_push(struct xfs_ail *ailp)
 {
-- 
2.55.0

