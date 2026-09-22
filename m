Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC60492E56
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055784; cv=none; b=i0V2IbJulbYmz3N/l5Fcyg+3GLf/9O9eSluA2W/0vOOwG40zsNw1AvE0HDva5Lbw1lb3iIKeTZTWKU517vwXQnBV8KnHuTYJaXmjW43cit/fv3UuO/MqD2t9+GDB/psuSU9yJobVlg+IghkzM2DX5nneB+WyYNcI/VuBP86NlXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055784; c=relaxed/simple;
	bh=qaR7d/zM90YPWHcOm3TYV77R2th6xdwLV93lEheSkeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O6v1qGSmzFErQhUHWP6KRFBjVqieO42O5mwGBcwv3Nr5qvfqHLggJa8bvidjoNb4/Xn6pqAUXu7A4/nfHricaTUyn0ztiiciIMhio+zA4jeUqMCcrCmZ8qgUxyF/xcu9y/iLk9BAUlCsnH7axunwhpxxwu5a6eKFqhnpxSKILFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie8Cb0ip; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie8Cb0ip"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so2013697a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790055778; x=1790660578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ss6yyG18xKmL3ChDu352XFK2c5fShKuGkPx5v64MPyE=;
        b=Ie8Cb0ipIlW8LQAyMJbvlxNypO48a+OIbWvEEkf2WdnZBuDaGyECiL3u5+4TcReJBx
         dD6YS3eAV/KQrqStDLASXBrbTxavOWlYf4Skkky9x2eYjmihfsXzGuQ78yQPrpC/mjL5
         wGPUTUJgWHG3plmCEs5PWNVjCqa+C2EkcJRvTvUQ/sS9gGxkkTxatVOLYkbi2FtMX4Ul
         suL0fGq0aMVOWWwjvckYR6qEvqTua7Ook8HxO1E50ajJMdr5oI8wKnJ6luyvev6F3XAx
         iUmfA0ahdydFxSV7yZuxktdePP0k3MVgJZedAhFnXIk/S8ade2Cg91IbnRuhymHVvmnt
         +JQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055778; x=1790660578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ss6yyG18xKmL3ChDu352XFK2c5fShKuGkPx5v64MPyE=;
        b=xIlMIhrX7OTjXnAlnoEOp7ykrFPosLptpttBf4vjMC9ZdpSX5+HLsnfjyadm08WBii
         Y1r/GrOsudGN/aBYnSQZaOasrCRY/PLd9yLgzHgfsFEMKp6hviCPrFCnb2agG0wsJEQQ
         EFy7k1d6kDlqBH2nT/+nf5vmE/oxk4WuuWEXN7Rb4CKJqde9GLZE8giMyfmtNj6QJG+i
         KkbrWV/18IFddUWxaPFlcTx9RWds8UF6p8iipQz6k5d1tWWqjOpmTGo73X3gZSvP4vLY
         hMqKukdn1qwHLqvRqU17+kJzKbqeFnXmJJ/vLz0d4LNSBOr1c3YY+7qINBtXk5C0FqXI
         z53Q==
X-Forwarded-Encrypted: i=1; AKwUvBxhEHeuBE4SdTUzXS+bF9OCRiYDWbZ8ZEEsFk30f2sw6HZvrJIw4/X53GcJ/OTxWrMd/qIM/iqVhl+6z1I=@vger.kernel.org
X-Gm-Message-State: AFuF++miinpl5zkcltlXnbSogVabclVIIdn1UZZGIB9V7lQZ7lEmymnO
	Q+IpXVF6kDtpwAlSxU/G7gV0NcuQJywLVbdEe0NVKUv+z/dQ8jVxsb5RfLV6yYDG
X-Gm-Gg: AYBFou3b78O0c8quBCyV4jccKRJ3+0ceK3uGZb6d5M/cWDfY7WGVeXa3WRPZNhWHsxJ
	S046K2zfpxi9D5H22lB+2is3Bbrt/2dlHI07hZsHOk60IzrMoXMhMN52+Csing5+IHyKWh+tJUP
	sYyJOoV3i93bfUESPnfkFrAja5k49MzEOsWTBaNVwsJAJIgXByJwBt9aO4xdxlQwvy4CfDD8/H7
	hItAbWzd1KjKD99VJCZx2mM5EkugaZU44ucwQCo7/qiIR9rw0BGgto4FC5aU2YQGvsNA8uoABxs
	gf0WO9BfZXGqgsasgsxroGasRKRqAkRFckcA54V3xALCEHgUL9mVHIx00hdA4u7BOzUiSQHxoRS
	96JTZPvJhNydA24s+gzy9s91X5Hc8qo05LK1jkJLAen2tGYe0h2IhWE9i67SrwpJOUxlqNxUbgu
	z13rgRUIDe52AVd7YVQa9qDJ4T1f4bmXX3fwLWf/V91//fmWc8ATxvPxTeZmUHV16RUhEI9YS9v
	jkPmUX0zvz8ycHiES3HP8eVjpiqnqKS
X-Received: by 2002:a05:6a21:9185:b0:3dd:d91d:e2c2 with SMTP id adf61e73a8af0-3ddec7c94fbmr77047637.48.1790055778001;
        Mon, 21 Sep 2026 22:42:58 -0700 (PDT)
Received: from localhost.localdomain ([202.189.109.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a317d7sm295136a12.16.2026.09.21.22.42.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 22:42:57 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: mac80211: Fix a race when expiring a mesh path
Date: Tue, 22 Sep 2026 13:42:53 +0800
Message-ID: <20260922054253.11976-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

My static analyzer identified a potential issue in 'net/mac80211/mesh_pathtbl.c':
mpath_expired() reads mpath->flags and mpath->exp_time without holding
mpath->state_lock, while mesh_path_fix_nexthop() and the other writers update
both fields under that lock.  In mpath_lookup() and
__mesh_path_lookup_by_idx() the unlocked check is followed by taking the lock
and clearing MESH_PATH_ACTIVE, so the check and the update are not atomic:

CPU0 (mpath_lookup)                    CPU1 (mesh_path_fix_nexthop)
  mpath_expired() reads the stale
  flags/exp_time and returns true
                                        spin_lock_bh(&mpath->state_lock)
                                        mpath->exp_time = 0;
                                        mpath->flags = FIXED|SN_VALID;
                                        mesh_path_activate(mpath);
                                        spin_unlock_bh(&mpath->state_lock)
  spin_lock_bh(&mpath->state_lock)
  mpath->flags &= ~MESH_PATH_ACTIVE;
  spin_unlock_bh(&mpath->state_lock)

A path which mesh_path_fix_nexthop() has just set up as MESH_PATH_FIXED and
MESH_PATH_ACTIVE then has MESH_PATH_ACTIVE cleared again, and forwarding to
that destination silently stops.

Take mpath->state_lock before evaluating mpath_expired() so that the check and
the clearing of MESH_PATH_ACTIVE are atomic with respect to the writers.

Fixes: 60854fd94573 ("mac80211: mesh: convert path table to rhashtable")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 net/mac80211/mesh_pathtbl.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/net/mac80211/mesh_pathtbl.c b/net/mac80211/mesh_pathtbl.c
--- a/net/mac80211/mesh_pathtbl.c
+++ b/net/mac80211/mesh_pathtbl.c
@@ -247,9 +247,10 @@ static struct mesh_path *mpath_lookup(struct mesh_tabl
 
 	mpath = rhashtable_lookup(&tbl->rhead, dst, mesh_rht_params);
 
-	if (mpath && mpath_expired(mpath)) {
+	if (mpath) {
 		spin_lock_bh(&mpath->state_lock);
-		mpath->flags &= ~MESH_PATH_ACTIVE;
+		if (mpath_expired(mpath))
+			mpath->flags &= ~MESH_PATH_ACTIVE;
 		spin_unlock_bh(&mpath->state_lock);
 	}
 	return mpath;
@@ -290,11 +291,11 @@ __mesh_path_lookup_by_idx(struct mesh_table *tbl, int 
 	if (!mpath)
 		return NULL;
 
-	if (mpath_expired(mpath)) {
-		spin_lock_bh(&mpath->state_lock);
+	spin_lock_bh(&mpath->state_lock);
+	if (mpath_expired(mpath))
 		mpath->flags &= ~MESH_PATH_ACTIVE;
-		spin_unlock_bh(&mpath->state_lock);
-	}
+	spin_unlock_bh(&mpath->state_lock);
+
 	return mpath;
 }
 
-- 
2.43.0

