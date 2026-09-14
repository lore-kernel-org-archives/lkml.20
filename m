Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA344360EFF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789359939; cv=none; b=VGehgWmvztGFFQCnWDic9rZNaYkjZXjqjCT8RNSD3E5uOlElAo0Sn6wZGJhslVIhd4qgq0vxjS/FLK4B2I2z5oeolMy+MEgtSvPoVP7HTN+KVt3v7l75pJrRdRd5hAtzs488IU7ZukVzsRrylodTDTraCwPnBAxMvSftiJmKUbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789359939; c=relaxed/simple;
	bh=IKYTEkRJA/yTXqJoVZoiN4hKi//+UQNf48N+jbQglYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UkvsRsrodTUh5XHS4dctald5t9LMpO4ndwHDj8HMJDK07WM0NQ7OvjQfNCHbyUtdkLYvJawkhA1XP2cxNNomXEvP2xEvoh9IBKbibJe0rsSIMF23VBSmrder7Fh81bU6ohoEFLCE+cOfROuJHzy8V4ehJr1DKwoK/E/d6z8xKpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iySuluh6; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iySuluh6"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8692be1cda4so2254656b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789359937; x=1789964737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGYYwUXQBV/IktFqjUcwZn3BsoQtowX7trp9zvobBJ4=;
        b=iySuluh697TJX27bAKrtFKSI2mMg3lBKsEZt6tV/PxeeDOBy1DXMNezRaMMe/33QRa
         3uOF5VWaot7pGQ5MmEV/o9AQwI4T668xanvpwZS/jMFKc5bYH/AguL847vH1+mVh+uRj
         LPewDP6qpkwX5Kod3oTA6rcvclo1s3z36y8SXaE6YnFwCOhr8yWCVqDOrpkpUZSmrkee
         fHtuPagiCwfHcC72JtKLiaE2lJRm+XbQ7JnHqTC0VlCaTR5r/ThP2EsyGaHc9ZA8+AmX
         5BRRcCN7ZWI+52muPEsRMmEMwC/H5kcRha3fU44ji1SgJ/bFW16udg56BfqayA7wwHu7
         gOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789359937; x=1789964737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGYYwUXQBV/IktFqjUcwZn3BsoQtowX7trp9zvobBJ4=;
        b=cZ0ksgqXKYWZzcwIpVoVYgHgNiAKsT7ZkFOQDV10M9vSmeClCsxYU7TCK9hoRiBIEA
         xwevVUkS/590d0jKqQcb1vzpZjjf6arwSEDWVmHRIXhBpiwRUXMb+lokGiiqWg6ae0d+
         UsXq8N8j73zunBjNh+rfy5JdB3lObEf7p+DW9cmaw+sKzOeKwE7KWy0YFkPIfxevgdoT
         yv3MeShURwcJ+QVr5ZCAJF6tp0uLnzOSrFJw+VvRxk95RFfFncE49SSV8ADcM23nJN/k
         Yh3SUFpqRkfg79fVFXspBDt0zMnkORRRfXERZwABFIrau6aJkAp6EnC0xNa7Ei5b3abl
         dPHA==
X-Forwarded-Encrypted: i=1; AKwUvBwpQiXIeq9NVit6QjXQ2MZSwWCYgxyh4TNpI2dpgVzdlAAMU4ViQrQ+ziU7rf24av43IGrIUvaMtglFFPw=@vger.kernel.org
X-Gm-Message-State: AFuF++leOq9cZr9zfX5/oNq66kqiEcykhix24kEKlsjc5c18pSIfH2r4
	VC5UhfTckfos7V899UFGyzJ4AmIXbiCKxy0Fy0+IwhEn8RX1T9Y8jq7A
X-Gm-Gg: AYBFou1emAVPj/dnEuRDJH1X0wb34951oxFX2S/7bUUoorlwb0id0xFQaX/t/E1vO95
	kmTgP/nankHrv/jlEkijadFvlmux4gxNIRWdJIex3VyKoFgewWlSFbgutD4iTGQCsdrboXgszfB
	GTl5HrFVVdrHGjSOUHAobUe1jZ1Mof4awc1p1HxZg2E+rWJ9V2tN//HTuTM2HPOVbxWc9yTaPs6
	/SBqRDIl+vVw28WYN2ueo8r/xvz+tUe2AIXctfSQjob/93fCLJ0gcy+aPBnw2fjk6PtUcuA7hBX
	kcYZXGgzT277LuU6ZjTxGm5cyGEtfvBWQpIwaCy3HHlChyKIzGSrMxMejBkchnHz29dgg6CxQ1o
	4v0NlN5WzpBKDEFDXrYMUYPJxAmlkJn/GFuoAQ+z4Hh45ByQvbHJZPLR1alZUCu9FitFEDkQgFx
	ppL1IOo/zQneRvScyXanOuVai3gRyTUOmCkYT3s9Lh94nsz8jgdpkxairKqgXGMzFQn/gr5GmZ0
	Z7ggHJzk2ZxO8l5S8AFu088sF1lwcYdtO2a3Ap+lDyEdeH2uCgGzkL/RladQJndtIOxb0l6EvKg
	frm3L2+YqVOn5Eof/rPSI4A=
X-Received: by 2002:a05:6a00:3c8f:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-86f8393cc77mr2219156b3a.6.1789359936974;
        Sun, 13 Sep 2026 21:25:36 -0700 (PDT)
Received: from localhost.localdomain ([121.152.194.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b4c39ebfbsm3873038b3a.54.2026.09.13.21.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 21:25:36 -0700 (PDT)
From: James Kim <james010kim@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matt Porter <mporter@kernel.crashing.org>,
	Alexandre Bounine <alex.bou9@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	James Kim <james010kim@gmail.com>
Subject: [PATCH] rapidio: mport_cdev: fix use-after-free in mport_mm_close()
Date: Mon, 14 Sep 2026 13:23:27 +0900
Message-ID: <20260914042327.49798-1-james010kim@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A use-after-free vulnerability was identified in mport_mm_close() in
drivers/rapidio/devices/rio_mport_cdev.c, identical to the pattern
previously addressed in dma_req_free().

This is observable from userspace when an application creates an mmap
mapping via the RapidIO character device and subsequently unmaps it
(or terminates, triggering exit_mmap()). During munmap, mport_mm_close()
is invoked and drops the mapping reference via kref_put().

If kref_put() drops the last reference, mport_release_mapping() is called,
which frees the underlying rio_mport_mapping structure. The subsequent
mutex_unlock() then dereferences map->md to unlock buf_mutex, leading to
a use-after-free:

   mport_mm_close()
     -> mutex_lock(&map->md->buf_mutex);
     ...
     -> kref_put(&map->ref, mport_release_mapping); /* map is freed */
     -> mutex_unlock(&map->md->buf_mutex);          /* UAF: map used */

Fix this by caching map->md before kref_put() and using the cached
pointer for mutex unlocking, ensuring that freed memory is not accessed.

Fixes: e8de370188d0 ("rapidio: add mport char device driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Kim <james010kim@gmail.com>
---
Note for Andrew:
Following up on the Sashiko review results you shared in the dma_req_free()
thread (https://sashiko.dev/#/patchset/20260615070530.371640-1-james010kim@gmail.com),
I audited the reported pre-existing flaws and verified that this UAF in
mport_mm_close() is a genuine bug with the identical locking pattern.

 drivers/rapidio/devices/rio_mport_cdev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
index ad82c2108a56..47ba34b4afb2 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -2167,11 +2167,12 @@ static void mport_mm_open(struct vm_area_struct *vma)
 static void mport_mm_close(struct vm_area_struct *vma)
 {
 	struct rio_mport_mapping *map = vma->vm_private_data;
+	struct mport_dev *md = map->md;
 
 	rmcd_debug(MMAP, "%pad", &map->phys_addr);
-	mutex_lock(&map->md->buf_mutex);
+	mutex_lock(&md->buf_mutex);
 	kref_put(&map->ref, mport_release_mapping);
-	mutex_unlock(&map->md->buf_mutex);
+	mutex_unlock(&md->buf_mutex);
 }
 
 static const struct vm_operations_struct vm_ops = {
-- 
2.43.0

