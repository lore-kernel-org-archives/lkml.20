Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DEB4E66DA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558647; cv=none; b=O/6dSvjtGEfVzvSo1KvEKEYeF5UHsbEB8GwoPBLEofclaoj1jCnctXs0ELahSCCN/ojl3YzPQR/SnGGAHzMk5zta6YrH/JsVjVYzQRZI0mj7O1cXdZsRhH7atBRhh65q2NgKGvk0c7xGJ17GVzPRV7uIdDRrzLF7W/7iXMxwIUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558647; c=relaxed/simple;
	bh=3uaObKhY36qkdLUb4pvRy/Y7taGooeBUyJJlfhXMPyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPoqs2oDqrsdYX/+eXvNS4v6wEAzyD0NmxljX+a7eX/IaTvpgSBBgFeRJYoI9gYuqWBGB+V2uMbCOykHFH5px7UOjw5LqPEFBuZUSqUslAQMaGtr13O7DXoiGQJvuyn54b7LQ6M7Xj85a2ThmcprIfPyCb+3gkbvaMpgp6mc4RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8N5Jcs3; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8N5Jcs3"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91ede8035so9284045ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789558638; x=1790163438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOQF8lSD7wdJvBSJlzI6UX4BPG3ivMWDQsQe23mQk7c=;
        b=X8N5Jcs3hPDyXmeaSlRypDxXcs9LPre+NLB/t6soDQBJyMteLrs00qojbyXgS3gjIQ
         353omtc5s0xw4Tg/EKD9jPpIkoPccKwqDzAqnrVjPGOexvVO1Lkufq5V9XzL7FEMKjCc
         up5//J5YvW1fYOW71km9urGjABEhVqvK5NGzpwwU+mMpKJxJ/6l2hbLPOLX6iCAMzGQ5
         PiF7m+8vUcopxDQV2qjQNhZNxEu9M6DCgs2vmWfh2E3M2DWda3+Lo9B0oSqVIjgD5p9c
         c2IWu6S6/aIHMDXzJlylkMCI7Op2QMY2/7u8Rs+Ur35ZE4vY86Rskasa0W2iazpydER1
         dk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789558638; x=1790163438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOQF8lSD7wdJvBSJlzI6UX4BPG3ivMWDQsQe23mQk7c=;
        b=NCiL7xNH/AR4Xi+8OMM/6gkAXrd0J0qP9PBerNR0p3wn/AzutXEWOGhGWoGkJZT0+e
         wOfrmbJOD/vdEu3+iSleAcad26yTgNRMT6JU4iUCckmZ8D4NdqSPIo08gwoyImYwQG7P
         vXAkls5D+9aCHEBdsgG/XE2Xm6jxmm+/y6TJC9x/8Ux3vWmk1rZUrWApI0IyJ0Mz0Vvr
         6EvdM1YHhSTeoFf5G1so/fVbTg8Z3OXlI0oiREIRUc/GfSVFXgl/iY7tosEeVynQ4SwH
         P3aCjqkphk64eAmE66KhfvotMbGduSC5+nK8HDGuW17XVu86VST9MHlWOzDaOcDOcJih
         AUbQ==
X-Forwarded-Encrypted: i=1; AKwUvBybj6fOa/E7sqd0Z8/Av1SUKEF/3hmuUI1HUcJA9rQVGU4/t55q9nohUVaiI2gt3Posim3JgXxLR5mizH0=@vger.kernel.org
X-Gm-Message-State: AFuF++kI3Lbo0wIGpDn4r/mD5CdIXHhRe67s8HXHVzxgKwzzUqE5oghQ
	AbrPSxp2m6VU6Q8Bm/9ltGYV0AQ9VKLmNANLKumlCFSLgyAaBn+asSTY
X-Gm-Gg: AYBFou2N1fSkLgxjulG8P+eSD1noLJDKovFuLAFk2FEZOw46ADsxa0mj3YasBiZRZal
	sbv/pQHRQu56o1fuWIDZkDt0BwVCtERKRwZ4aeyqwzAsLLjHXQi4mwwNywLX/WHhjO/cLqs0OM+
	38qY7SCk0K1W9xB/7ZQ4hju39b+tdzmDhjv3GHJpqZx2+Qqrh1amjWRRc4P/2m5E+PSaV3fYnAS
	h4sYFBK4sswHQ+9MMmygVoVriD4DZVjV/q9phnLOp4+IGc4X3BDudU+pl6k6uk6OHWGLFg0Z3Av
	LUskuLM0NVM5tzsolYJqUi/+Opuls87UbDpHwce9APTUWqHLDKAB3K/lZxSAKLjmj/6KF+AyO/7
	0ShX+I3KszYRloj1x3Cclg3asOp7n346xKIGPkhvsPZYGGAfiYaHntPUvno59FwX10PpuDZSPoc
	0DhMPFf9wHoeyLVBAKT9H3EyazF10JdEek7ZHClZdzxxKKKbIWASLEOH10/8N0KmXkOPKFl2PSC
	zaU5L4RwhHnvahm6AF5KPYln5Qngo+nLw==
X-Received: by 2002:a17:903:46c7:b0:2db:8ae7:a5d2 with SMTP id d9443c01a7336-2dd8e026db9mr44702525ad.9.1789558638056;
        Wed, 16 Sep 2026 04:37:18 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f02fc2sm9927045ad.59.2026.09.16.04.37.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Sep 2026 04:37:17 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Bob Copeland <me@bobcopeland.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] wifi: mac80211: release mesh path quota on failed additions
Date: Wed, 16 Sep 2026 19:36:48 +0800
Message-ID: <20260916113649.28315-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916113649.28315-1-enderaoelyther@gmail.com>
References: <20260916113649.28315-1-enderaoelyther@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Repeated failed or duplicate mesh path additions can exhaust
MESH_MAX_MPATHS while the path table holds fewer paths, which stops new
paths to reachable destinations from being created.

mesh_path_add() reserves a slot before allocating and inserting a path.
If allocation fails, the function returns without releasing the slot. If
the rhashtable insertion reports an error or an existing destination, the
function discards its candidate but retains the reservation. No new path
is installed in any of these cases.

Release the reservation whenever the candidate is not installed.

Fixes: ae76eef027f7 ("mac80211: return new mpath from mesh_path_add()")
Fixes: 60854fd94573 ("mac80211: mesh: convert path table to rhashtable")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse kasan
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation:
- GCC W=1 and Sparse C=2 produced no diagnostics.
- A controlled production-helper matrix reproduced the allocation,
  insertion, and duplicate reservation leaks. Allocation and insertion
  errors used test-only fault injection; 24/24 concurrent same-destination
  trials leaked a reservation before the fix and 0/24 after. That case used
  no forced-failure hook.
- A two-point hwsim 802.11s run reached production mesh_path_add() from
  mesh_nexthop_resolve() and hwmp_route_info_get() during PREQ/PREP
  processing. No physical-radio or layer-3 success is claimed.

 net/mac80211/mesh_pathtbl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/mesh_pathtbl.c b/net/mac80211/mesh_pathtbl.c
index 03171cf00855..770fc16b439b 100644
--- a/net/mac80211/mesh_pathtbl.c
+++ b/net/mac80211/mesh_pathtbl.c
@@ -694,8 +694,10 @@ struct mesh_path *mesh_path_add(struct ieee80211_sub_if_data *sdata,
 		return ERR_PTR(-ENOSPC);
 
 	new_mpath = mesh_path_new(sdata, dst, GFP_ATOMIC);
-	if (!new_mpath)
+	if (!new_mpath) {
+		atomic_dec(&sdata->u.mesh.mpaths);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	tbl = &sdata->u.mesh.mesh_paths;
 	spin_lock_bh(&tbl->walk_lock);
@@ -708,6 +710,7 @@ struct mesh_path *mesh_path_add(struct ieee80211_sub_if_data *sdata,
 
 	if (mpath) {
 		kfree(new_mpath);
+		atomic_dec(&sdata->u.mesh.mpaths);
 
 		if (IS_ERR(mpath))
 			return mpath;
-- 
2.55.0
