Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114192;
	b=ZmwTTcsS4qZk99Y6+lEw6TWqFRWTO7iAVGuBd4q8UTzHtzpPi9C+/5K9L1xMjjrtYOTu
	 snLcUVe3Tg1MTkPZ80azo1ogTvbGUefyW+03RGyo28NkeXrXMKh4rWhqqB/t7oNmkbbnr
	 djGC/qZdjux8ShZnZe6OAjIQNfwsLbqpo3u44IF2lBR5RbP6eGa8+L3PX13ZjTUIS/0g5
	 bJuujp/QkgiGhNTuSIQzkoP7gNPkiy1b5N8HX/kYxlvVjqw9fj69oikMP7mkJ9L204NKI
	 o/muBaxxAwNyjPggwY2FBa2jr15I4Axj9sT6KsADnlwPAZtpyevYGnk5o77gpJb2VIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uTppmobKlXCQMDn3ZVLxidM0e+PEeg9PY8KBlnC43UE=;
	b=N9AvQx9f1dyDPUwD/pBl/jSWT4ttEP/WdzXfTT1B33qHLue52p7SkF69PmJljpCqiF9J
	 jk6WTcnVvpLVcbKOS1Ov0PYixZ1yno0/dakjR0pc67QKQiLIU6GxtxOv26lj3mQrrh5Xm
	 /onxJgQzACJfVjHNzZ/H3wCJAlhRBVr2i/stL/W67OPEr6bOi2jVCfFRXfiORNx0ih36F
	 ABog93x9ESRDAiIkvGj2FXGcjqYrWodhPwG2TORKRgYctgFtDMXyZQhyyaHSnwWIuczjU
	 FwAMRofG8nrRk4cyryKquXf1u9BryKEQAdI2ed32/KxVx0mYsG68LZGarn9lDmZd8mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E45A7aCi;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A721F606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A721F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E45A7aCi
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-824413e10dcso2177549a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114190; x=1793718990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uTppmobKlXCQMDn3ZVLxidM0e+PEeg9PY8KBlnC43UE=;
        b=E45A7aCi61MU/blkZE72dtLfe7C9BLMirAPuvC7djnoj5oT7666j8k2GG/oUKL3hbv
         5hhxwpqTjSMetX56AsLS03dd1i2rE8+ZBBGRLribP4n1eFthw8KiyR5Qn1C+H3KxYWEu
         rIx9AyYL/mBUb+aucQRu8OzMCqUioax5nfCImwaq8sBMWi3l+uqJtWi7Sd6SCuO0zN4Q
         5MuRxgHpMEG9B/yKkdzSU6u6z/JiqtW82z/fKSs1wdeIu+3FCdOOruHDzYHeRlfhUb3J
         HH7wTl26p2yFhyxlBTzS6hAqFu4H1//0OaunyBnpxc8x5uIgOkKAIGRBVv2+ygabVYo5
         a8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114190; x=1793718990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTppmobKlXCQMDn3ZVLxidM0e+PEeg9PY8KBlnC43UE=;
        b=TJD1+hCJ4xBGhi/lldNY0Zp2FJhdhntVURhQOPqM3bhKegFjYFloy3dkUmuJTx0jml
         WV5HDGuATAlBMQpazupJW5HhX4JDewSOJxfMPiuf2eb8WDCtXQkyP5TNbclzYfSj25Ya
         1eUIQSJ+LhjHcul3oLEvzsLRYrCovTqvnUbc60+LUYoxyUUA6Z1jXbyKj6yoJ672oGyO
         PMIuHZG0p5mpbaaPxA3L2FTecOXA0jaI8Yr0Nh5QQ9uSUg0Rthq8i5iHIt4AIhOU9gon
         y0rvf3sTq2NXq2YV7h5ppLMOWudR+26ROLz7GovQ+PKBOFQ6RVsyrLmJ43fmDwYgF+Ok
         pKPQ==
X-Forwarded-Encrypted: i=1; AKwUvBycZB94DVUsuOQ8a1hMoG2NRu+eQcRmmkzm0f/ZN/gIFwspRzD550e4z8mZeJoQpm+BJdTj3xr+ZuQyWRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLS20XycZMDXb6hd054k2V9jLvLiYDN2NCFpxKX8aQuPU9RPPQd
	c309AcioNouvRQLyWfs0BBuMxnt+0dWpnRk67aDfdzulrhVLQIj4X1rcbolWzhyz7bQ=
X-Gm-Gg: AYBFou1oYluSjUNHHTqyP8AQ/fMTm77OOaIVCsILYOuHQ2i14WfebCPvbUmAdD1VRsd
	xVTRyAAqzNcVrAofI5P7lyP0AqaXGWzqSINsU2FQQBw28QWEbMoKPew1tgA0lWYiynATqEXCi6Z
	Si812oJpvOD7HF7u+YhuUXJe3Q/fcjiWX8G/ANPPSgJL6kQ7FQFNXa1p51ukDtsO8AyhXvWhEIe
	C0K+5xOD3D99Dt9889LceH86YcoaM1vH+MpKVJ0PpQhCcyRcgnxtqOMyDFsQmGcuvDvcYvHSNEf
	/rvtwqriOwzL5vGme+aGjTF7ax9DuOCZco0WFDNjsaoRPYGTj4YB1Qnjl4vSexZA4TvW9B/g8DL
	2OksBEV1QqIW8KkKJcIVLdENw0Wy902LvILNr7DZCWMja1QzoDvDrhkFafMfigENVrR2F8blA8z
	xfzC3+3OMQBpHGt7LAk9bxvXwRVGDJLVudpehuYv46dAdyeXznlSoDDW55z5p33LodSBxsISgK4
	2dMuqicIPKEvgJXMH8RHEG4PdQMiTtzaFRR6Bw+25a90Ntdb4rv/v1CjDtFY/EKKQlMUB5o/IUN
	spNeU9MPGkij08tkAjo=
X-Received: by 2002:a05:6830:4393:b0:81e:1262:6536 with SMTP id 46e09a7af769-850fe4f7abemr8973671a34.15.1793114190396;
        Tue, 27 Oct 2026 08:16:30 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.40])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d7fsm10768970a34.2.2026.10.27.08.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:16:29 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: fix UAF in al_destroy() on stream inode eviction
Date: Tue, 27 Oct 2026 23:16:14 +0800
Message-ID: <20261027151615.971171-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

al_destroy() unconditionally dereferences ni->base and frees the shared
base attribute list:

    void al_destroy(struct ntfs_inode *ni)
    {
        ni = ni->base;
        run_close(&ni->attr_list.run);
        kvfree(ni->attr_list.le);
        ni->attr_list.le = NULL;
        ni->attr_list.size = 0;
        ni->attr_list.dirty = false;
    }

ni_clear() (fs/ntfs3/frecord.c) calls al_destroy() for every inode
being evicted, including ADS stream inodes whose ->base still points
at the base inode: the base's attr_list.le is freed while the base
inode is still alive (iput(&ni->base->vfs_inode) happens only at the
end of ni_clear()), racing the base's ni_lock-held attr_list consumers
(attr_set_size, al_add_le, ntfs_load_attr_list).

Stream inodes have no attr_list of their own; freeing the base's list
on their eviction also leaves the base inode with a destroyed list
(size=0, le=NULL) even without a race.

Only destroy the attribute list for inodes that own it: a stream
inode's ->base points at another inode, while on a base inode it is
self-referencing (fs/ntfs3/inode.c), so the ownership check is
ni->base == ni.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 fs/ntfs3/attrlist.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/attrlist.c b/fs/ntfs3/attrlist.c
index 8710560cf2944..6aced486a45c7 100644
--- a/fs/ntfs3/attrlist.c
+++ b/fs/ntfs3/attrlist.c
@@ -29,7 +29,17 @@ static inline bool al_is_valid_le(const struct ntfs_inode *ni,
 
 void al_destroy(struct ntfs_inode *ni)
 {
-	ni = ni->base;
+	struct ntfs_inode *base = ni->base;
+
+	/* Stream inodes share the base's attribute list; freeing it here
+	 * would race the base's ni_lock-held consumers and leave the base
+	 * with a destroyed list while it is still alive.  Only the owner
+	 * frees.
+	 */
+	if (base != ni)
+		return;
+
+	ni = base;
 	run_close(&ni->attr_list.run);
 	kvfree(ni->attr_list.le);
 	ni->attr_list.le = NULL;
-- 
2.43.7
