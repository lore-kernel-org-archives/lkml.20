Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C275448FF7E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789587511; cv=none; b=L0XNnysgSdS/uCuV/6rArTN/i7fSOUO/9zq7ekT6SrtUEhF4S1auBHwxixrW/tpk3wxQTuGuaOQk2M3ysL0mLlvlLsGrcp5UBfQXnsoR9+ts5kLMWlH1o1aI70pyTVtKRMyu0UkPKc6mk7EEb5Pn0Thgg7b9nZsOZhPdmk7Z3yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789587511; c=relaxed/simple;
	bh=GUUQbRt1zMfb+eBg5VoDPbwqdt+9wQD7eh4Y4Ha+Vco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZgGv4ym7gqsy4o/4RlKdBdSpWcgBpdTrl3JtZaYzRNu3jm85ovtf5x3Oy6RmBGAsitzTtsQqtMW1yJ2LUyog+dxjS+p06kGyRkCLmjGmRpwdaQUs3AGhzHHAOhG8JdVZq1E59MmD7zFHSvOZHSQjp0We/t33hdriDBg3wpNSELU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhxKBbVo; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhxKBbVo"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so614585e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789587465; x=1790192265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqmFViQO1iqqbGZZzEcy3ok+zdPAZK2tv24+QLSxd2g=;
        b=lhxKBbVojw5DhqleSjJ4N39W4YbSbbTIwV3CUz1D20d84WfvOGJT16k9SIB5cIkJTZ
         DDI2qYa2gCBmeu26/5PHlT3Mj61C/YAtjARS48Yt9iD2Gz1105+uV6N74hKo7CMi1r/L
         xpVrze4QT/I7ZjHWrkJ79WeabbVRgQjHiEYOPaFWiXOdwJkFfKdjteP7hKgBIVOUM5Y8
         z1GGksblsVD3EL72cyBl4HBZKxNoEyB5vT1xNoYXCehyeFCF8g4IeLyTdmRKynW/j/Jh
         8GdPILsk+EHMOkJt+o+juNEIp1tkv7x8U2cd8w7/xcVQ1z48AauncTHbqeQ02gkkbNVM
         IXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789587465; x=1790192265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hqmFViQO1iqqbGZZzEcy3ok+zdPAZK2tv24+QLSxd2g=;
        b=IoVJpCUV6pLv+WaoWwRTD9EGlqYhYmnKcrOuUjAKJNg4mAdR8aZ1+6++dr+yNwzPz3
         MnYYoycw3qIjyaWcq9NC5VPkRliUPdkeZ76ZzK7IUrkBMAkE5N3vOnISUe3dN+xWU59T
         Zkg0ji33D7/0RqMq9U/xVhFk9JY9UNxtSzTJ0aJzD+QdKYRR4oR9n70QNr8876Z8qj4H
         4cNiCWKxj1OGxEB0xtmE6XbZXFOqfUp8by+Cra0roCBw5U7NkSUzH699wyT6rvjHGPuf
         iMNbeM37a3+rzUAzy39pFThUd67R5cV2umYoZ89RazvVB+ThjSQbb3obGd8oW2y/PrFy
         8YaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKeT+JBFnho5mDKmWJaRlTnvyVVhtdMYhaxkGBMJ+Qf8Tcphyy3Beh+ypN5bZ1LDKJkUTL4c3ZzjP+GdI=@vger.kernel.org
X-Gm-Message-State: AFuF++nrSbVeHr7kgyvM0kHdrM98rGQNdCEYnrnqoVZi5qNTFsvfQ9HX
	rVk3jNigWlPKWrwTTS1ut3Pq6j4fkDsTENw2TbLs3VOvvCvOzOiRaseZbvvig1SC0aQ=
X-Gm-Gg: AYBFou1TU/9XVle4qINGfxn3IXpLulwDbga8ER0WvOy7THbrl0n0lk2wh1OJUJgDSrW
	H5qaOQ0KNSNxEpberl3Awl2olIRBLmxwLfLOJhP2kSVyiJwnKt270tVcg5NSuXe2lFQiRXl0ZvC
	fX5SYER6eoJ3+TpX/q5PO98Aj81M/RdrvC8E2i6UVTr1X+ViCHPcBU6L6hMlAMNvxAKeB3M4QzM
	D++eONdLHndKRfarrmElrnM7zVeJUN7WKKT11nBCBRvjIGptXN7g7jl5U+qZL41xYrUo96RBJ1E
	+3skZoCnbJFkJsEL4Ok/i/mmToZ1BAPJ1VIl2PPeQX52JpUCILrWixU/PJIgkXlwT4T5AxI6e9w
	4hZUwAdqDu2Km82nPgooXmlLa0P0/XqURRYsiVm/x8pHdLpu9q0Ip572W0Dbm4RA6o4RjzvOWnv
	muOMp7W+/+iN5xXQeoD70XazXD1or9mNazBAedz0e/bDqrJ6Nak82wKBlh8+CpZP5Lr52fY+aIU
	g==
X-Received: by 2002:a05:600d:8485:10b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-49fbc43a0a0mr19318395e9.8.1789587465257;
        Wed, 16 Sep 2026 12:37:45 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23ac75sm12936105e9.13.2026.09.16.12.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 12:37:44 -0700 (PDT)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v2 4/5] vxlan: vnifilter: account the VNI node to memcg
Date: Wed, 16 Sep 2026 22:34:48 +0300
Message-ID: <20260916193449.2552039-5-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916193449.2552039-1-alishmery18@gmail.com>
References: <20260916193449.2552039-1-alishmery18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vxlan_vni_alloc() allocates a struct vxlan_vni_node for every VNI with
plain GFP_KERNEL. The per-CPU stats block it allocates next is now
charged to the caller's cgroup, but the node itself is not.

Use GFP_KERNEL_ACCOUNT. The only caller already handles a NULL return.

Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v1: https://lore.kernel.org/netdev/20260909092645.3105263-1-alishmery18@gmail.com/
 drivers/net/vxlan/vxlan_vnifilter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 9a1baca39d8b..fbff52c450c0 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -710,7 +710,7 @@ static struct vxlan_vni_node *vxlan_vni_alloc(struct vxlan_dev *vxlan,
 {
 	struct vxlan_vni_node *vninode;
 
-	vninode = kzalloc_obj(*vninode);
+	vninode = kzalloc_obj(*vninode, GFP_KERNEL_ACCOUNT);
 	if (!vninode)
 		return NULL;
 	vninode->stats = netdev_alloc_pcpu_stats(struct vxlan_vni_stats_pcpu);
-- 
2.53.0

