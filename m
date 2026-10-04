Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED3F30EF91
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 23:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791157979; cv=none; b=i+Q4tQ1Bb+5tPTAiA+gk13c9LZXpk5FymV6XOUb49Tl0SLeDvkY1tUGhJySPwkObtFaA8Y2A56g1XczeQFrz/M6sMEVpSFtBvmfnWv3wL3cyQf+sIyQLI1g3Ehjr5hzp5aH4+Qqibgkm/GFihbwu2GBohdTswD4oJjbKUW0k2G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791157979; c=relaxed/simple;
	bh=x0Vpnd7wlojArUaLaoa1Q/FPBY3Am3JpyTwu2xDHfqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rvmgN4xws6T4bbk4xnVKPnSbIXaPWIvhHasUTFVtduO4o/jM2zYQS1N6j5sV26OL/9ZhN9KRMRp3wPrLtPZYCzR1qq97j1cqtQ8KxH5DcoFb2ySlPS6dB5ZFtIzzKIsyvwDv2NEdxLCI72zPFFc/oxOaq4PYrsZnRsYIWQf7HFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caoPaimL; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caoPaimL"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-35122ae71e9so386271eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 16:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791157977; x=1791762777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZqiKuFnajSw67rytiWL4B9vhK9q5bykbBSbbq28tnv8=;
        b=caoPaimLCVW8Gmvx9H8DCID77T/wt2ecQu6Y2MhZU5YhqGA0UUsWsDyPmbVwHED3jB
         +QbdiGuyGt5dw5VI7Xy5LR2FFGyrQ+e6m1y1u3VK8lTVh/0BunfmPxseBSuvQYGGOJoZ
         D8Jr3DRPk0wRF48T5peWhnMpJxKs2OvTJQJIQ6LDxCiwsKKsDgwxSVNf6g2Nh5FL8jqd
         xf9u7KIXE9bJLKoZBnc5mId4mLnrKj6nhriBdZQpZoZf0xvT+qzEyibEm1+COwnV3tXT
         gLwCa3e20B3CxhjAVoo9hc/EkV4IywMoK+CuYfyA2uTSs/LtJCJK8CQYl1Nf+6fC3STF
         sEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791157977; x=1791762777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqiKuFnajSw67rytiWL4B9vhK9q5bykbBSbbq28tnv8=;
        b=yyxXrKCt0LJ8Oxi7Xf7iC/pn5XjooZeJOoZzcOczoIa0gPnEzspsOGkqioBeXZ974D
         gu0n9bSA2Q6Gg+UrdU17pN79cOd/DytijHBQkzdgn0NYTzZMxrlH1OLZcilLV0cLptMp
         6Nl825GWcN+E6dY7RGASqcnSQ27rRUK+gBDFg26DHDFy7CZT8qOIC83SzPT4YmHPRf3p
         t5K0trmb2+5XSvdAkc9yFJxgHpxqwAYXmaPermL4g+EJMRxbX1R8GQ6jK2m/xfoXT00E
         G5aSg8WVGvskf1qyx2yhwySllLrdZIysai1KauIF8dWXAeSIYoPgySyph77/w9hGkmtZ
         BjMg==
X-Forwarded-Encrypted: i=1; AKwUvBzlRV/K74z18ezeTaubSv3cfYwnnbRbGCmf8kp2vN6E/nYHU+++tOwfZ3cVuoBF2kqlA+jR2ByzxzTWnv4=@vger.kernel.org
X-Gm-Message-State: AFuF++nnOVybcdgNl0bl6ONaaa/qM3yQcF5CJJm/XihHEEDgcSmHKaO1
	jertUNQum8E2P47n7gIJzgD7GY/q1JmopnC3a+RD8HhgHx3I0P0iL9FF
X-Gm-Gg: AYBFou28xdeByhdLXlgI4In6QQG1NuFW0eb287Hte76lPbqptVES1QOGV+AwLnt3XmN
	zvld09iaHWERelsFlyFeC9T8S4rKVfbFmz6W+L6lVUE9NgCrsFS+8AxhdoFLZVL8DS2AfwbueW4
	VYmZsoxFfCikiGzztYbHE6/eeq5dspAz6g1uLxGVxjU8kcEvxVBllHsip8T3L4hoTVciJbMrBHp
	hHvdGJ4jGXdYXBq4cLOTnwcSSQcqGfrA2pPFyV0Jzz1QcCdxBrqu6uZmV4nvp1v7x8HKec+6LTX
	1A1cof//CsD8jOeBeELCjzwYUSbhP47GbyuFQSmaZDNdvmyoM0yXk5gEV5MDbbbY7bLBLDccirV
	ezz/gLvkezeWAUW4Hn8HgNtvhbxLAIG3MdlkVJKHNDVdk1OX/FxIUDaTj50w0AKjVK85DrjskZs
	LiXoP5VbQqx9U0ApCvWXDHRgoa0pItem7mSGwFyTVTEZ4pleRu35/22mBMweVwxV5zOJg96as07
	PvST9rXzf4i/Q/Jv6DGk99Gn6I1keCm2Q1E7uX8P7ORH1H9sfHFgupEquKBCo72GcshKKnptkSF
	jjcRH6pFqLgl23D+IPU97BQpJ4Ggv94YngiJwA0buaVluChU
X-Received: by 2002:a05:693c:4019:b0:34b:fd9e:ad4f with SMTP id 5a478bee46e88-34f21856407mr11608346eec.22.1791157977345;
        Sun, 04 Oct 2026 16:52:57 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127161456sm8126005eec.14.2026.10.04.16.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 16:52:56 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpu/buddy: drop stale @p from gpu_buddy_print() kernel-doc
Date: Sun,  4 Oct 2026 16:52:55 -0700
Message-ID: <20261004235255.547593-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpu_buddy_print() lost its printer argument when the buddy allocator
moved out of DRM and now prints with pr_info(), but the kernel-doc
still describes @p:

  buddy.c:2153 Excess function parameter 'p' description in 'gpu_buddy_print'

Remove the stale line.

Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part two)")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/buddy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index 2f2aaadafe35..503f7d5934e4 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -2148,7 +2148,6 @@ EXPORT_SYMBOL(gpu_buddy_block_print);
  * gpu_buddy_print - print allocator state
  *
  * @mm: GPU buddy manager
- * @p: GPU printer to use
  */
 void gpu_buddy_print(struct gpu_buddy *mm)
 {
-- 
2.56.0

