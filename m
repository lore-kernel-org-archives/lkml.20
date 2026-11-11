Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413927;
	b=Iket76h89ZJgANF9mx1bcckfTuAbHR+0wM8/w9jiDOlMgLVrqyvjZJVZPUqmJ8hobomL
	 gbs/JuujPhyo8OM4W0+/RB2hpyBCPtOYNQ1IwvPWoa6v+wTLJe0p1YibM8n74VSfLrvIW
	 PnOgn/DTcZhK+j3Q5RyFwotlOfpvDc7T3eitoSZJgbNsU1Ev5whLqC2lzamlyuyBqyRNj
	 5DvIedlFPWefVWKZUXW8kKnWzBO1yYV47YxjixE0a+zl6MkVN0uUJDOO9iLcM3TTEb0Yt
	 zvI8z+POeiu9p2Wd+n+ElqNGb5zJfKyBcQCxZbExR0DPLVzfrzN0M3NxFCcII/kQ55g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zHAbfUofqZjzoaZj66J2AEb1qG75/hMFQRjc/fK5hjg=;
	b=dOYguwsxCMzr2eK6l0BYJRc05PpIMYzVvSjf5AQ0QImtuat6E51sfSqegWkHmHa2DKOt
	 1HcI2BsxEHU+Lm/k4aTiyxiI5gkCw8nU5tQgGLO4somYgcpvD6s5LuetbsmFAqzcJpOvC
	 59jDYrrKCQl2bJj85jO5O1+14zvZzNzZmtMSpXWi9ohcV4x9HrrmBHd+xSdL+IFUO5wkZ
	 UqkauCVNOWkV9kq4rF3U8iek8B4PhScXR3Dd00YL+JyA+I1n/8eG/8D52H5B1ctJ9UZnA
	 yYtxv1oNRUjgQUu4xZGyjxyJMi69dciliJIp1z40E9dWQnmwypTV7k6GHvELmIFz4hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=LcTx5C4X;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E160F60A5BCF
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E160F60A5BCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=LcTx5C4X
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490f38e9688so2671134f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794413924; x=1795018724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zHAbfUofqZjzoaZj66J2AEb1qG75/hMFQRjc/fK5hjg=;
        b=LcTx5C4Xz1FOa9eEWojWoGvMhDB2PhsCg6WivIIm1qYMMM8rfWlP/5meHeI35+lpZh
         UgorwTqXUHZkiDIlL7fM49fxcp5ENfI69dgARVMXoCgVEr8NC/5g4qJ3htMsWhAfyDP4
         x8m+KOzu3OPC8zo7xY3/fFfgDV95pGxjTRd8XVUZeCoz9xj1GLrzp4WoEIIXURb9CQNc
         MncoR2uje0y7Nh8z6w07tungs0ceMkn9TOCxfo2n+/W0OeDqJN0TLE7dbQ2kGcaqb+uE
         P+4W6DBBBheowZgoNWkwgPpF47xiwNALjlaQ+Ew7teA6V8ztu/nK1qXJzZz79bV+fQ7I
         gVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413924; x=1795018724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zHAbfUofqZjzoaZj66J2AEb1qG75/hMFQRjc/fK5hjg=;
        b=uZMrLEfnml8lLMqFK1IZwpliU0dwYEDzJFbBd+6rRtLeK5C0r98MMlT09aWeYZ/4aA
         3G8Mdn6/On4u1KRiuH3M+OjudQdindr+L+gYksuKLiolTCJaZ54lsfxHPoY1H6wUGAWJ
         am0DTvQQoVfVl08cV/D9Y/b8sYMQn90OfKX57PTXIjAiWk1ti3cLdb3tyIsXmg/PxHUl
         dnBG3Ans9H8frG1bKKZPEQoJ38SiFqV37EfX0GcGgma61mOXqVT6/6zF67dWT7ZRXVnu
         NB7/qZEfru6scDM20kFh2LOPEgfZwd/tWkL/W2EKQJF8csloN/2kBC2TUCjcAbYipLLS
         Rp+Q==
X-Forwarded-Encrypted: i=1; AL+hErE8oPflzxS/ZUewC8MRpA5KUc7LoybssCFJvSeqJ+kOsqMvXAA0Y+ADlGTLCGX4gXkOL82JEfERbxKuw6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z81sn36VZmwso7iXEXzWymInzs7/GQlf+OV53jAc9y8XIjVZb3L
	o3L7q8iPSo4uozQNQBNQg9ZZ8poQnwMcUWtf6EbAVy0X2atgMlZxR0uX0F8T+pSu8gw=
X-Gm-Gg: AYBFou2VXKcpfwbHBMu122dIbvZLUY/JdDr91hxlT1Eow5fVZbGENzoa3ptx5SyfdOU
	L6iy5K/eWfz/9D2uczXNWZxPmCvkQYtspXVZy9H/sOJgFubI9VP/YW2U/D8y1mTgaTIc3I7PPzx
	lXvq/Rdqb0hvSSeQejwguFMOnYrLh66jeqPlZ7f2vzkg4YkqIGWvB2diV63SJAaX/CoSu7v/28E
	11j59ZuO6r8tkhT2GCTpsDb6a6X/djCkDUVVs6n8V30MsLYAfQzaC2udyzBKG3POh+EXDPW2/oW
	uEiJTZPLQghgoxLuJ6O+zIA6NaAaS8j5+0JLeS3G52+50UkgWltXqFWFemdFLwafwY2ZOYHkLwa
	UW+FdSACJw5YpoWYKgZITBNKGtFmDTwDtdiKMQ2N4ZcOiLDNbboh2oPwgUiVdF/it3G8h/Zcuet
	HoiclyddSyQ8EyuieVq5dt6lcE1F6Si0ThQzd1Aoc3fZoXftLaS543ALpVcxv1bbuMywru/sg4i
	V3XxYoPM5C03l3snARc1JNJSQyCemZ8KKTgOj0/1ns3TtYOEAaoGglKtTyit1CYQAIy00m4CQ7K
	Idt8/W0dGF4t1pldx8V4OXTyn93TU0+X1kGK28qaKbq/mroz62ZLHSU1xmwHVQB/yMKHvqIVpLz
	0b7Pnuwy/v19hhs4LiYc3czazvM7Kcw==
X-Received: by 2002:a05:6000:603:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-499c7648566mr5495254f8f.13.1794413924411;
        Wed, 11 Nov 2026 08:18:44 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm12209506f8f.28.2026.11.11.08.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:18:43 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: xiubli@redhat.com,
	idryomov@gmail.com,
	amarkuze@redhat.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	stable@vger.kernel.org
Subject: [PATCH 9/9] rbd: fix osdmap use-after-free in pool lookups
Date: Wed, 11 Nov 2026 17:18:30 +0100
Message-ID: <20261111161830.1336485-10-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111161830.1336485-1-max.kellermann@ionos.com>
References: <20261111161830.1336485-1-max.kellermann@ionos.com>
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

rbd_spec_fill_names() and do_rbd_add() look up pools in osdc->osdmap
without holding osdc->lock, but ceph_osdc_handle_map() replaces the
osdmap and frees the old one under that lock (held for writing).  An
"rbd map" racing with an osdmap update can therefore walk the freed
pool tree, and rbd_spec_fill_names() can kstrdup() a pool name that
has been freed already.

Do the lookups while holding osdc->lock for reading, and copy the pool
name before releasing it.  Use GFP_NOIO for the copy, because reclaim
could issue I/O to an rbd device, which needs osdc->lock while a writer
may be waiting for it.

Fixes: 9e15b77d9af3 ("rbd: get additional info in parent spec")
Fixes: 30ba1f020221 ("rbd: make sure we have latest osdmap on 'rbd map'")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 drivers/block/rbd.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index 96743c059d98..d287c4882ca0 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -6001,14 +6001,21 @@ static int rbd_spec_fill_names(struct rbd_device *rbd_dev)
 	rbd_assert(spec->image_id);
 	rbd_assert(spec->snap_id != CEPH_NOSNAP);
 
-	/* Get the pool name; we have to make our own copy of this */
+	/*
+	 * Get the pool name; we have to make our own copy of this
+	 * because ceph_osdc_handle_map() replaces and frees the
+	 * osdmap
+	 */
 
+	down_read(&osdc->lock);
 	pool_name = ceph_pg_pool_name_by_id(osdc->osdmap, spec->pool_id);
 	if (!pool_name) {
+		up_read(&osdc->lock);
 		rbd_warn(rbd_dev, "no pool with id %llu", spec->pool_id);
 		return -EIO;
 	}
-	pool_name = kstrdup(pool_name, GFP_KERNEL);
+	pool_name = kstrdup(pool_name, GFP_NOIO);
+	up_read(&osdc->lock);
 	if (!pool_name)
 		return -ENOMEM;
 
@@ -7100,7 +7107,9 @@ static ssize_t do_rbd_add(const char *buf, size_t count)
 	}
 
 	/* pick the pool */
+	down_read(&rbdc->client->osdc.lock);
 	rc = ceph_pg_poolid_by_name(rbdc->client->osdc.osdmap, spec->pool_name);
+	up_read(&rbdc->client->osdc.lock);
 	if (rc < 0) {
 		if (rc == -ENOENT)
 			pr_info("pool %s does not exist\n", spec->pool_name);
-- 
2.53.0

