Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280AA37F00A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848921; cv=none; b=UMP+9opoG4m7lRI6hPHM+K7dX8RpPcf1II24Ud0J4UIiIIHiDGnuODOhXjQRIEb9c3Y3Oq9+tfpu6oYZ3KSTYBsozdiTFa9bGS5vfcwtAXQn7MPezBYMSstcS8OJMhHiEoU/2B5qNodgJiD3NXG/Wi5MVQo5aV9UpKtsCoj1x8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848921; c=relaxed/simple;
	bh=xeL2XZisgo/FUrGnl5D33KAEDxNC1ErjkrARUG8bI+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxYrIKfuRwaP+zAELLZd5LgIoVgZb/CHULVBj6CYo6SNDnkN1KbqYq7+KDlWf/tvzDcFO4p/YEiRsXoj1hZErjzSkrhQbyLsz5LKllUjp++42kjXtIPqkLn+oykUr94H6bKqpPwPUku94PhStG6/ZRjNjasjSFExxwGtW3L1ONY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=N8yV5RIQ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="N8yV5RIQ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-85339ed040aso3328476b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788848918; x=1789453718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWrOKVPw0FussDK28wDfiGtsg6J7IXyelNHwkTWChaQ=;
        b=N8yV5RIQtimPiD9HYrJi1GyiBsLsRbERpXWx6Q49fwh1UfCkHMxVqFk5Gv7+zXT3Ml
         XhGujVBYdYnXt30mHZC8y6CTXCk48E3Kvv/Q2sKMb68Ya8dhPeQAyhJl83qIAEqsLYPT
         6QuZT6tZO74riSKlz19LgRNv30u3oTcCvnWkRW1/f/sQR/qCzffNWMCtu862TIuH8P9r
         tlft42KiA3apJEBV4AlcEFLzVExsB+uIAj7MMwfNfPIFL7yzBujAKdZpUFftqPGZ5plI
         Yb+qQS97IGerAYwOShXr3TDolUoF3dK6GbdpGUUT6IZmKy2H9b23HIIOKvCO5yz7YHy3
         dvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848918; x=1789453718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UWrOKVPw0FussDK28wDfiGtsg6J7IXyelNHwkTWChaQ=;
        b=loaZQEBYGuD/SzNTUSZCXNXIujmpzynvQTa7tKcMVink8lwhQUI2N6bEkMgGMfu2Wp
         mbNGZHOTNHDiZvG61qSTHpA7UQTfo59KIEG1zwuo+FySII/sJyqQQsW46ce1ozRQfmeO
         LgQ4LFFhvWjOXPMcc29N0/ScfVuH14DzdQnEO9P5CPZwtmL590l3ea/H6/oBnj6wyAIy
         cASYcIerW7xDnYCeiV8tPvRKaxVOfxTxUjki96rhlXgofV1e31fu2vk9oxrWF+ebLVDJ
         EMBUK8NP6/6N+3/BakXTsJWxWIQfoa70ENnFiMCRlIwhdW5bPtw2/qa8TSzNLKhipkJW
         wUcw==
X-Forwarded-Encrypted: i=1; AKwUvBxrav0C7n5hITahdWc4ejElvDOIKzipxTUhndHj+FIaslRBvTcClxTp/fanRFKH3EVSYjylHGM6yLHihUA=@vger.kernel.org
X-Gm-Message-State: AFuF++mB3fuibmtyS3uvL5BMd5cZSBAFruEYH/IPoM+sfxq3Us2aWDbj
	lR+u7QBx5GxhFKvtsWWbEi0jk5tuseZopMbewtm1/IzZaYd5xJIK/JMzKVhAKZp3i7A8
X-Gm-Gg: AYBFou0HNjRNKAbPTLoZJc0j6/Xi4MywarR12vo5s3NJMzxfCePDPykawcUncCD/jS3
	k2K9keZb2qat4ivkqyaho0lNjF6Vq5uB6phik0vpNzpJIZaJmv/xfJhteNhSXPtKw/pI6dpOyug
	RugDUu7VR9Fb+e9ray4IKZ8HOg/KtBUSr/9lbJCTZoI7HpMcWIZj27/lBh6oZkH60aFHxdxrjgX
	LEMJptelpa2YPnXIwJorCFmD/9rXb+teqVxpz2ZxlOQgYjYFtHCzfNdH8Cll22K1CRp8u8T0hfR
	hpeQHUze1enz1Yv7SaBDkCtFP5pp43tDgLlmX8wl9iE6DPm1DzJG5hCacU9A0WUuMj1edCQBNE6
	VCd8buhmCuSKpD+1DnbMY/HcZgiXUith+5NXbCxOh1JdKdYi4CDRy0iFNpNFk534+a1+w9cu0nc
	JoZgfzPx2jDsgs8DWLNKtADFKD5w1qk0d4xAfjjFcjRKtLPoRU+thpP8UySPFpBfjGF3+ZmAgEM
	CoQI360rvyklcUDcSFl4apCtEZPCQ==
X-Received: by 2002:a05:6a21:483:b0:3c4:3112:3b with SMTP id adf61e73a8af0-3da3a0a264fmr46279526637.18.1788848918208;
        Mon, 07 Sep 2026 23:28:38 -0700 (PDT)
Received: from b6ad5085b32f.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4554a312dsm5109502a12.29.2026.09.07.23.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:28:37 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: Zihan Xi <zihanx@nebusec.ai>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vega <vega@nebusec.ai>,
	Luxing Yin <root@tr0jan.top>
Subject: [PATCH wireless 1/1] wifi: mac80211: fix mesh fast xmit path deletion UAF
Date: Tue,  8 Sep 2026 06:28:27 +0000
Message-ID: <94174303640c5e1022b31836770bad75f741afbf.1788845030.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788845030.git.zihanx@nebusec.ai>
References: <cover.1788845030.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mesh_fast_tx_cache() stores raw mesh_path pointers in a persistent
fast-xmit cache entry. Path deletion flushes currently visible cache
entries and then schedules the path for RCU freeing, but a sender that
already holds the path in an RCU read-side section can insert a new
entry after that flush. Once the lookup RCU section ends, the path is
freed while the new cache entry still points at it. A later
mesh_fast_tx_get() then dereferences the freed flags, expiry, or
next_hop fields.

Mark the path MESH_PATH_DELETED before flushing the cache, and reject
cache insertion if the mesh path or optional MPP path was deleted while
the entry was being built. The cache walk lock orders this check with
deletion flush, so entries inserted before the flush are removed and
later entries are not cached.

The crash path is ieee80211_mesh_xmit_fast() -> mesh_fast_tx_get().
The same cache is also consumed by ieee80211_rx_mesh_fast_forward(),
so the deletion tombstone covers both consumers.

Fixes: d5edb9ae8d56 ("wifi: mac80211: mesh fast xmit support")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Co-developed-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 net/mac80211/mesh_pathtbl.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/mac80211/mesh_pathtbl.c b/net/mac80211/mesh_pathtbl.c
index 03171cf008557..dfcc4f3a7088e 100644
--- a/net/mac80211/mesh_pathtbl.c
+++ b/net/mac80211/mesh_pathtbl.c
@@ -577,6 +577,12 @@ void mesh_fast_tx_cache(struct ieee80211_sub_if_data *sdata,
 		goto unlock_sta;
 
 	spin_lock(&cache->walk_lock);
+	if ((READ_ONCE(mpath->flags) & MESH_PATH_DELETED) ||
+	    (mppath && (READ_ONCE(mppath->flags) & MESH_PATH_DELETED))) {
+		kfree(entry);
+		goto unlock_cache;
+	}
+
 	prev = rhashtable_lookup_get_insert_fast(&cache->rht,
 						 &entry->rhash,
 						 fast_tx_rht_params);
@@ -812,6 +818,9 @@ static void __mesh_path_del(struct mesh_table *tbl, struct mesh_path *mpath)
 {
 	hlist_del_rcu(&mpath->walk_list);
 	rhashtable_remove_fast(&tbl->rhead, &mpath->rhash, mesh_rht_params);
+	spin_lock_bh(&mpath->state_lock);
+	mpath->flags |= MESH_PATH_DELETED;
+	spin_unlock_bh(&mpath->state_lock);
 	if (tbl == &mpath->sdata->u.mesh.mpp_paths)
 		mesh_fast_tx_flush_addr(mpath->sdata, mpath->dst);
 	else
-- 
2.43.0

