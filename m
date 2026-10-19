Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9093596F8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375887; cv=none; b=AobL937YgWldvBbgPLDx6E/b27WH1djygvlbcKZGL60JJsWNLGiXVS1kTzV2IvWOXlg9ubgYciZ6iS6qdkHTy7S+OqJUwqiDpBX18ZVdbc3qqmbU3j3KG0OVDciT2bpc2RYL8Zlz7ITrsf3quTPVxHX33NwnQo4ROaQuOc4JsK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375887; c=relaxed/simple;
	bh=yEG8AcAGFaZQJcqSqjpjUwp6DdocXK0MT8prbUyfCWI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sPmvTlQ4y2+WwOjZJJM+yD8S0CUr1GWvrcam2LVCEgpqalkhJoP0H0bcgrCZJnXBEFgk+NJEgXqi4fO5RCUl44D+Sn7qg5/6eVAORYDYErzFYDOdAostp8+7M9OOUChSSHB+m1v8JiSiCmTKjpFogvGVVkdjfToNP00SFmpxiU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=SN2wOjVe; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="SN2wOjVe"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5e519c39196so454873e0c.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792375884; x=1792980684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HFKyVkuGCKpOVLuQsnhKod7q0RL600zFuUYepG6R/FE=;
        b=SN2wOjVeTNBbwr1PVrBSc6+QHzRxPQcXYHqcW/0lG0xVB3dcguknspbJqE/JJRz8eh
         jARFkMflUGn2MKp3IB/XiaZDDJCDGszCaplOeGhaCWl17SWcXPVi4vjytHn3MFwtJ10n
         TBkFZdCEop5KlOJx+9/rGyTnvQRHiwWERZIAhpiCBR8vSr8iBlh/FMX8d34vdXlSJW3x
         Gfdo1FtBzMZMmWvaJL26tu08ursDA2RGxnUAN2QIapE7A5kM8JNsPdFndLSj4ALdl1se
         CIF7suD8am+ga/fbX/19E0mppnkJMAgSx+L2rdgsnc5Gdcu+e5cPQyle8aBz0rH0uHuV
         36VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375884; x=1792980684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HFKyVkuGCKpOVLuQsnhKod7q0RL600zFuUYepG6R/FE=;
        b=xV5JuVIs+PzXqCUoIl/1NqRHtmXFfKObgNFsARa/QjW9OLL6XK0GUHi2yyvbzIB6yr
         LaUu2a+F2evm6ecKCbTQxNNafJcgr3y3/dbN+0mncjI9DVW/ZEbcQZBFM1xv1EO7eF/p
         cBnrMbXfp1Tw/i4noi1hs/9BdNa2puLqyYtLd7dM36fl7YqbiGMgrkyCw6eKCIOG7HD1
         jLyR1JQkbdrjytbJ+hDHp2blGZYC8cG4JK3gCOmdKdw+doC1M60CPHqjWZDugvULwCEO
         cDttA6P9CSMdOp6LHLNSo2bQBnLx52CS53EzaxNYx8+FG1702cGO1whwC91W0BpCzRm9
         0dcQ==
X-Forwarded-Encrypted: i=1; AKwUvByMqeZPurpK4LZ7pdezutKdBnaMu/Cbzw1g18N/US8uUyFpaCGaBb1AA7r3nUYulh9W9j5CJWVzmLHUs1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRCV6NW+Cf4ItlaDXl+qBG1KhSoZjC3Kwr0Q6g7OVRNTBgEvmG
	Jr0VM6PTPwUbWCHipsooHTgs6dSyu5q1RddxJROolP0OcqLnwujC1Nu+wSF1jvTa7uA=
X-Gm-Gg: AYBFou1IyTgURSPA1RmjD9VIkwKe0iD9tZDDQ+sHHFU/mPFqwAf0JStlP9wFDqfr5G4
	Gzh6liux1jyLTP6dAOHLuw7+0MGVJTKVxQVzSk6EBjAKnka1jRj9f8HhGwlNddnz6F6w85jisaO
	TrggvKKRicgdOQsDngBn08RPlY+maxHrDLzDXaeHJ7aU2D4Fv0bsyR3737fOdGLJTfMG5MBvJJF
	Vx51LsQBQCUP3vIuCTDxSxcVYOL+cDEjGRXnE41jSQTFxsuFE3OmyOt7BsYTbsgROe6zRvFk7XQ
	/VWSke/m4DtcwljO3PFZ9grf3hSJctfKHGsdkGouTZ7MGhgHDIMGHepbUUf1O62Mbx1H1x7YIkR
	yVHt327u8wpiuafNOomxnh0X8vqH14NR2n5ZkMw7syuJLGG2QsfcaDi9OrdYC2YqF5S393J0Yi4
	r6rg0GcQJB4+SVm3I1dKaqtr+9uGk/j2bNy5dCQV+lr4QgE8kpzs1a61LX4HD0dkiZwYX1pejLS
	9u89ROw9fkA2jUHaRCh3adQhAe553oCq55O1i16updfVDQO1tHxBWN/hjyEi2RthIE7BxyJkxJ9
	shhvlsRawKfQ8mbofO0tKiHIfNbBhQ==
X-Received: by 2002:a05:6122:4b10:b0:5ea:b9b5:8c43 with SMTP id 71dfb90a1353d-5eab9b59387mr1211022e0c.18.1792375883763;
        Sun, 18 Oct 2026 19:11:23 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabbd9ea2bsm4271383e0c.2.2026.10.18.19.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:11:22 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v1 4/8] kho: do not modify incoming serialized blocks
Date: Sun, 18 Oct 2026 22:11:07 -0400
Message-ID: <20261019021111.990394-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261019021111.990394-1-pasha.tatashin@soleen.com>
References: <20261019021111.990394-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When restoring an incoming block set via kho_block_set_restore(), the
physical chain of blocks is already linked and bs->head_pa is already
set. However, kho_block_add() unconditionally rewrites last->ser->next
and bs->head_pa, and kho_block_set_shrink_one() clears
new_last->ser->next even when operating on an incoming block set.

In the upcoming KHO read-only mode, incoming serialized blocks are
mapped read-only and must not be modified. Guard the ser->next and
bs->head_pa updates in kho_block_add() and kho_block_set_shrink_one()
with !bs->incoming.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/kho_block.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
index 0d2a342ef422..a4e945f28fad 100644
--- a/kernel/liveupdate/kho_block.c
+++ b/kernel/liveupdate/kho_block.c
@@ -93,10 +93,12 @@ static int kho_block_add(struct kho_block_set *bs,
 	list_add_tail(&block->list, &bs->blocks);
 	bs->nblocks++;
 
-	if (last)
-		last->ser->next = virt_to_phys(ser);
-	else
-		bs->head_pa = virt_to_phys(ser);
+	if (!bs->incoming) {
+		if (last)
+			last->ser->next = virt_to_phys(ser);
+		else
+			bs->head_pa = virt_to_phys(ser);
+	}
 
 	return 0;
 }
@@ -133,10 +135,10 @@ static void kho_block_set_shrink_one(struct kho_block_set *bs)
 	kfree(last);
 
 	new_last = list_last_entry_or_null(&bs->blocks, struct kho_block, list);
-	if (new_last)
-		new_last->ser->next = 0;
-	else
+	if (!new_last)
 		bs->head_pa = 0;
+	else if (!bs->incoming)
+		new_last->ser->next = 0;
 }
 
 /**
-- 
2.56.0.176.g3575e65682-goog

