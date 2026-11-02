Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593171;
	b=tq25WMl1VV2+02pGa23i8porfZK9W9Qb8dGPn7t+mWHSkYzdL4Fym/FYILILUQZ14lT4
	 Am0PFiV4/Kw/hUEtwl2PE50f4gobZNgTLtvVz/N8uBC4rXLW8lBTNhbBOSj/N8LU4WF6r
	 6u/Cr23XylQ62erT5yxSfTQ8tWp3tYLcJnaf4lXFwW3xkMN8hCfk39KmUwd8QMdU0rnKN
	 jD6gG62Oug1jup7xtKVHoYH4AlXhAIaU48or6nvATgjk+eNDVobS/MP8RydYeO6yj7cOA
	 ReJJy6yZiFcCj8Qwzjhqfbn8KDCjuD/Ai3AENgF9RF7Yik9oO1wD7KMvnAMv3G7hf8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593171;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=BFKaTDZjSkZCc1LL1xMGg9sv6fWHg0tceUB/+sYjW64=;
	b=MnZP4YGJvHk3mK49tm5UJCyEgzqqUwrdAbjR5XnfcY8uwev+7xYoY2G7aPthSEpLd6By
	 TSeioDa6zHZsvE3Jx1xd3U/Bb6CenPw27kYdUOvVAqjb6fcYaDu9pqI1LCjdCv/V2DOiT
	 9Na7JYnOZIqGN6IDqV6szrcBl9RnUwoGhdO8pgAV+L7KQuryjIBRRn+w1Jk/6D1273EwL
	 kbi2e/DfutKQ/hg8sOWzGczCbGyAqJIumBmbY8vGGjFrAQztaAkxpWSkejlRj8bntM94G
	 5+YaoZWa0oeA2KsNTc62Hhx+fYI8stgQFxC8hA57nRAHm4U9tfb0bfp/D6IQPrmesxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=lDhRTIGz;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OOdFUgS+;
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0172606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0172606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=lDhRTIGz;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OOdFUgS+
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 57CB27A014E
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:19:30 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 01 Nov 2026 23:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793593170; x=
	1793679570; bh=BFKaTDZjSkZCc1LL1xMGg9sv6fWHg0tceUB/+sYjW64=; b=l
	DhRTIGz6WvQNxap9JShnG34XppfEC/NxbneHiLGfgdZOPOCdNVPwUkKzTAqE0fjY
	qjdP4SlRpvT/dEVXd9/CrmOZhXGZFFjsfB6t31RfjwEyBv7HGvchsNiy3c2zVOxU
	X2YZAS3a6siSr6wl/ES3QYWhWL1Ae2iqAS2cznZpGFVk+f/JwdFOUhzfIvC7n62D
	aVXfU7SrHN+sIWV0wCMaXVN0U5S4Ij+412SL3SvQk4jjs1Ljm+lfQEHH9XPPzzhm
	RSz5jmIrQPMAOnjPU+k/1q3kJDDvyy5OTB0vCIi4UCg+2MNIbBe2Xudch5YufU6J
	TWx59EYrMQtuc6NHYdUMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793593170; x=1793679570; bh=B
	FKaTDZjSkZCc1LL1xMGg9sv6fWHg0tceUB/+sYjW64=; b=OOdFUgS+8tOYex3qK
	HlOpNFg9TYBVxUeA9qfzUoSh7lioMj0rdj7h2fPcgPcU3wq373wEf8/MOf11XQ3m
	8SxdqbVidnHx90askGlDVAWzkxxNnijWVN+2PMorfc8164ja/OaDMyqOdRKJ1xRj
	gaZ+VH5g38UWDm7/sMAizqubZfQCLkPCcVeYbfyQSrlmEveOfKU0y7kw3puEx33T
	mVHb9LQOZcVOI4gZeneMd/RWQ5wtTe+wie7joSss6q4rrE0dBB+dExk5pdSbEawT
	wFgLAfX6gVOoN9OMc9g0PeNveOmsGTj+z552HibwUXThQ6MySpUFfvp+jQjt2+zU
	CUjgA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793593170; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:l54MDCFVSoFH9JI4RXSStoGKNK9IQRBXjXzjz6XX13Qfmdr
	4qiAZ8xAX2LAxw7RbM0ahht2517fQ53+k8BtSz9ixzpLzLlJayJFE9NW0gyeRhrN
	84INwyL9Xw9/4aintWcBiKfnmrAUlAbexVFD+MgInjqv9EooNzhGyUrS0jg01l8d
	CFEmOxYaQiVwZ31x/mGRZe+feCqfS6NQa7TBoTsmppS7RNasQPUgdhy5e1f3Odlv
	T7xz4fDJG+QuncOvF63hS5sZ4oKGT+Z+RDO+gqspIZis3A57PdOiNOHRSqWrt07x
	wO2v/oapr+D0keH+ZVusBIoZAgsvxibotyXw9VQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:d3G4fedtrnb8dp4vD5UJBzmYeUTcIqGQj00wFL/hjHU=:bfWZGmG0EtZICik1r5J+0diCAFZYOJ+zvnkJr+1rT3s=;
X-ME-Sender: <xms:Ug_oai9rkR2b8XjET9BgeGa6N2RdhNfzFqakCeqXwZQb5GRDGmrotA>
    <xme:Ug_oagomZfYYzrdExnVj8PKciLFIH_vBDlIEUY-rkVCbVE8psoJDwC9WkEqkwVkGj
    Z0gRE0qoPP160BOTg1Wwq71kLIVCJz7iwvAAAU2Z0uT6xoVbryLbHg>
X-ME-Received: <xmr:Ug_oavmrPHAewqSmqB7aelGVdIscrdWZFgncQ6W8vqWTgTZ3hKYqsAYpI31BvTHhPdULWfDa0c_5NFNw3PJ8JC1iFWY3WB2oCci-TiAKWY02Ww>
X-ME-Proxy-Cause: dmFkZTGJf+FnbF5cjhRwBgUFeEMN5L2b4qTtS5virJdxdxu1YX+R3SePiVVgL8HKGL0s5n
    wNKEOtqaaVMGfHDS017lAmx65hw9r9W4Ljp+K0fnz8iSRitNfJQ/sJAV/Uc0Qtq7PwpyX2
    PZHhnABRcTLj3bxOkhlk0VDu/QO1zNWu9mvi/+dNSG8ms7PHHX/apGHb01AaDw6i9esJTh
    +THE/VRawV+E7rFx1bVOp69d6/PE5Q5grkhy7DyANV9OwqcDu7pmKtQ/SSYHXmRCP0Ai81
    Edw1nFUWgKojPftlfFZubAa9NlSew1GmX0MwVo58WOQFQoFtM6xMhKxZX7IM7u7cUYc0g+
    jCCvk0bkyhLLLYFfBIe5NTSNFV+3ib/YkyXRGt4dfC5tXdalnJwEQd/6RVEJEr7a45Yy69
    KHZA4GFVpuEnsKpv3ftsO1ZOi3S2t+iJtDG4EFcTZP0QWLlzzfSLvgmC4XhUYdHMy4SBRr
    KGKIfapY8tT5+7tbMYOqg8Sa0rMHbfQt9yTkNIHdm1p2QmF7oagPPwpr6Y5bnyndBHcWMc
    a7iw33ywcDOkE7V625zFXO/nny1aSOcAWVTkoiMSwx6K1dD3JNLjXorahWyptK/2uLcB59
    R+kZAVv4YAE7IJMWbA3I/cCqN8ZgwpKFjka3diUq+VrHyquDA4T9NSAk8zIg
X-ME-Proxy: <xmx:Ug_oanLaemGxHS4VopV-ZRFsK7asy9NZIXV21q5z9i1-ciHKe9DaNw>
    <xmx:Ug_oakwhPvr4JavjtemQk2KeVvI9jO-OgZAUNcz9HGdUkf9p9qfX7Q>
    <xmx:Ug_oavtsQKo9si6R71_bhTXZih8gzGbd3EpuWaRJVpZQdAm540erzw>
    <xmx:Ug_oajvxObVBEEPU_eluT_joiNQzrTgrQLAzEHrVmWbTiFwqikHFRw>
    <xmx:Ug_oaoQ-R-Y5ovbRJ_reOrRAVR7LhEiaWchUX8LMum3-XoH2weAFmYAB>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 23:19:29 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] firewire: cdev: use cleanup function for descriptor_resource allocation
Date: Mon,  2 Nov 2026 13:19:12 +0900
Message-ID: <20261102041913.1187814-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
References: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
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

Use a cleanup function to simplify error handling when allocating a
descriptor_resource object.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index f94b22a608e9..ef4fca7e8363 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -960,7 +960,7 @@ static void release_descriptor(struct client *client,
 static int ioctl_add_descriptor(struct client *client, union ioctl_arg *arg)
 {
 	struct fw_cdev_add_descriptor *a = &arg->add_descriptor;
-	struct descriptor_resource *r;
+	struct descriptor_resource *r __free(kfree) = NULL;
 	int ret;
 
 	/* Access policy: Allow this ioctl only on local nodes' device files. */
@@ -974,11 +974,8 @@ static int ioctl_add_descriptor(struct client *client, union ioctl_arg *arg)
 	if (r == NULL)
 		return -ENOMEM;
 
-	if (copy_from_user(r->data, u64_to_uptr(a->data),
-			   flex_array_size(r, data, a->length))) {
-		ret = -EFAULT;
-		goto failed;
-	}
+	if (copy_from_user(r->data, u64_to_uptr(a->data), flex_array_size(r, data, a->length)))
+		return -EFAULT;
 
 	r->descriptor.length    = a->length;
 	r->descriptor.immediate = a->immediate;
@@ -987,20 +984,16 @@ static int ioctl_add_descriptor(struct client *client, union ioctl_arg *arg)
 
 	ret = fw_core_add_descriptor(&r->descriptor);
 	if (ret < 0)
-		goto failed;
+		return ret;
 
 	ret = add_client_resource(client, &r->resource, release_descriptor);
 	if (ret < 0) {
 		fw_core_remove_descriptor(&r->descriptor);
-		goto failed;
+		return ret;
 	}
-	a->handle = r->resource.handle;
+	a->handle = no_free_ptr(r)->resource.handle;
 
 	return 0;
- failed:
-	kfree(r);
-
-	return ret;
 }
 
 static int ioctl_remove_descriptor(struct client *client, union ioctl_arg *arg)
-- 
2.53.0

