Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DE13AA1A8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788150910; cv=none; b=qvAvOdPuRdJpDKy/5Ltj89e5QVUcWEcMBX2Z7LXOdcMVkTQLkj0Gm3VvOeUG1YvXbqy0DZpyfI8yWJPoe/yHltt0TCMrDgvZoZ6yQwtBMxvSMLN+4PLyVg7Hl4UYGiI9gzmY7XwQSa/Ai8j8X7Pa+xUzI2t5HslRWQ9FWsYjeds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788150910; c=relaxed/simple;
	bh=2K4OYdBn6JH6BbUMe3S8iRa7QaUbz2dz7Xs9yiDufBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KxsGzrFhi8vSt8XrfCNirw/Nj0L69XpEi9QPVwGitspsCmx/jWX2+a5BVYJQO7IbhGyimfKRZW64HTlvJvhrQRd0o1ks97YABgzd0/oBhoAR6dVsldoZfwYa5PgbrhoekyezZTK1F6a1t6wBgAsVvsMwcW9navvtcFeV6hx5zfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kh0wAtYH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kh0wAtYH"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ce98cb8165so29112995ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788150908; x=1788755708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7eDTIpv2tuo9c5hFEI1wY3H5RV5KUp/pbjznvsnrm28=;
        b=Kh0wAtYHtz+1VclxPNtyByHhq+1aBqYhgxGsMfO66oS6Rzvoqd26W0QQxfzm1ofmok
         7poqs+RsSWBiCwsY2xCccNgUiMLnaSI+RJZOq1xEObuVRCOBaKDoKapodNBT2Qr6xXnZ
         h7w2kmHqFM8faU8mSuiq547C8GdceyHhlCBDAZsOiEtJa+mTiYhxTSL96j5NBB3UTrGI
         5b7iEqNIZhD9KXc6So7s76zY1wbrprN1YaWbG6bQEfvERgT6TW1gn/s+xBxU2qJKGCoZ
         PaoADmlWUn3+eGwv/yqh+H+xx8fd10Wt4dNJZQ5wYFQW7TRVnISxwdZm6WrGiic1DyUd
         OXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788150908; x=1788755708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eDTIpv2tuo9c5hFEI1wY3H5RV5KUp/pbjznvsnrm28=;
        b=ldL/Y0eHvTyqjNRpXku/XGRUQJzWjV9lOv4p70/+vmuE2CUPVCOnNfyrngWPeE3lCS
         S568Qocz7jtspy29bWE8KkInqHNCe89x4gKB8B7SSphZiAJTAlSRoNRPu7dpbA98PEKb
         DQgYzonNJIzlubhzEkGV0vfiBE4/12yJNP3DXcT9T8HnAHE2hubo/IPz6Sai/hKH6P+F
         BvsuGdbaHcAUDvRLojG5uDS7hVZaldPTzMW3dikt6xoZzMZ10zwiNMBJvTKW2MLQ++vy
         9dYALCKWt5UMEqZS57N5fwWUub/ksui1Foi1nOOCPgioYtBh47QsB2CXFPjrFFlMfhM7
         1fKg==
X-Forwarded-Encrypted: i=1; AKwUvBxeP5DSRhCITTV1xwHQ1sRLh4Fi+lWP951+75XL1E5IUGLdq1hJmPBuIgE1xtG5fijMqDvJ48+hHzsPwi0=@vger.kernel.org
X-Gm-Message-State: AFuF++lsGfQbdGZ4Dl25lPWYywQTP2PxOQkHhmNblijtVnacbMntewD+
	fGJfk/u1pt7fqKDm7hiLv6cK1cBUMGKXzkRYLpmT9B/d6heqc4aPS8Iw
X-Gm-Gg: AYBFou1aOPKhcuE1h5kPw1binFCzhNMvsj9qMxdmVeIcd8aA0tcISd+muYYezpKfBhQ
	77Jfj3nEFAyVCmPpThtrurarOPwEPGWwpWbjCpsqgjJoirJO1Fcoq4jTfW2onzb2Uf0vLv9RWNs
	o3ltn/Ca3b6aNnM6PXuqVPFFsRBAkI5d0nmX4Zo60aDVpD9yfM8QP/3G3QjtMgC/8DCO9UETP4d
	zET99gbWC0xqg/x8Fd97SKAopKAklBi5OpALiqI4bwqJSAJgG8T9R0ZTuxv5w6z2tZx9ymuFbzX
	h9Mn/Ce/bejJ7cNLQ+ENaymeiyyrYM3pVUx6mG8mcoeHjWvKD7u//1lL2x74U5STzHFsb5CRhN1
	Dqs0Q0dC1tzmcWsbfoUmObhflN7Ucx7WvYvCNpCrrN6K0GJFYkI4g1sTmq0uGB3EWb5EAG1bKyC
	UgdhOqH2PGovdDkzq+BKu1JloetaGG7fnVybyXNA0EWVC39Fpsz0zHpJPV/naaiFzD9VQHQa5wY
	1t0YstyCvQ=
X-Received: by 2002:a17:902:e809:b0:2d8:d4d2:d134 with SMTP id d9443c01a7336-2d91b239e87mr37083215ad.16.1788150908168;
        Sun, 30 Aug 2026 21:35:08 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm26991328eec.27.2026.08.30.21.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 21:35:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com
Cc: iweiny@kernel.org,
	nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] nvdimm/pmem: Release gendisk on probe failure
Date: Mon, 31 Aug 2026 10:04:59 +0530
Message-ID: <20260831043459.1298059-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pmem namespace probe allocates a gendisk early, fills it in, and only hands
it to devres once device_add_disk() has succeeded.  Until that handover the
probe itself owns the disk, and the error paths in between release it
through a common label.

Initializing the namespace's badblocks state sits between those two points
but returns directly on failure, so the gendisk, its queue and its bdev
inode are left allocated with nothing to free them.  The devres release
action has not been registered at that point, so unbinding or destroying
the namespace does not reclaim them either, and they stay allocated for the
rest of the boot.  Nothing is user visible, as the disk was never added, so
the only effect is the memory.

devm_init_badblocks() fails only if a one page GFP_KERNEL allocation fails,
which needs memory exhaustion, so the path is hard to reach in practice.

Release the gendisk through the existing cleanup path on this failure.

Fixes: 0caeef63e6d2 ("libnvdimm: Add a poison list and export badblocks")
Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
Changes in v2, all from Alison's review of v1:
 - Retitled, and the changelog rewritten as background, problem, impact and
   resolution rather than a walk through the error labels.
 - Fixes: re-derived.  b95f5f4391fa only replaced one failing call with
   another; the early return that leaks the disk was added a week earlier by
   0caeef63e6d2, when the disk was already allocated by alloc_disk_node()
   and the only put_disk() was in the detach path.
 - Says what the leak's fate is: the devres release action is registered
   only after device_add_disk(), so nothing reclaims the disk on unbind.
 - The object counts are gone, see below for why.

How this was found: reviewing pmem's probe error paths with an AI assistant,
hence the Assisted-by tag.  The finding was then confirmed against the code
and measured as follows.

How it was tested: this is a unit test of an error path that needs memory
exhaustion to reach, not a user visible scenario.  The badblocks init in
pmem_attach_disk() was forced to fail with a throwaway kernel change, a
namespace was bound 32 times in a guest with memmap=256M!1G, and
disk_release() calls were counted with ftrace's function profiler:

                          without the patch   with the patch
  disk_release() calls          0 of 32          32 of 32
  bdev_cache active         48 -> 72 (+24)     48 -> 48 (+0)

v1 quoted the bdev_cache delta, which is what drew the question about 64
attempts and 60 objects: slab accounting does not track this one for one,
as the +24 above shows for 32 probes.  disk_release() does, so that is the
number reported here and the slab figure is only context.

 drivers/nvdimm/pmem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 30a51c365ce8..648fc7d66063 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -563,8 +563,10 @@ static int pmem_attach_disk(struct device *dev,
 	nvdimm_namespace_disk_name(ndns, disk->disk_name);
 	set_capacity(disk, (pmem->size - pmem->pfn_pad - pmem->data_offset)
 			/ 512);
-	if (devm_init_badblocks(dev, &pmem->bb))
-		return -ENOMEM;
+	if (devm_init_badblocks(dev, &pmem->bb)) {
+		rc = -ENOMEM;
+		goto out;
+	}
 	nvdimm_badblocks_populate(nd_region, &pmem->bb, &bb_range);
 	disk->bb = &pmem->bb;
 
-- 
2.43.7

