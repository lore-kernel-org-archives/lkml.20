Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F683AEB29
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668519; cv=none; b=YVkcRiFYLBQCxBI96FQcinSv+ySpcVC9e941eHoG37Xw+Go9U/8RhE5raynqXvttqIB+krkyMujFmlmq1zYPlK5axGdlvab2BhTL71vFivCyTsYYVdZGDqZTbmnPH/nT8HuaioIODp7+LNL8Vo6+Op6VLYm0xYWDdnC76L1BGMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668519; c=relaxed/simple;
	bh=FYZwtLTF4ZR6XvVcE6UIlWRHtU1RYVKrtavEYY8WiQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pU1zmB3N7Gkipu8GpWGAKLYWV2+gUlnFeF3VeacqUriHiMKFvNvR4HWj5CgxT/7fL38fAWPTyqkB1PSRu9CSqrDTMpUJxmxChO2XFsX8yXMXzLzDDleAviU7wg/jtQ1we4wSRpgOCxUncJLB7iOF0Ti0UppUNSI8dxSimm1pHv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7zRqxkH; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7zRqxkH"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86b90133ae8so1811814b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790668517; x=1791273317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l5DueSv+kzmVwwFXvkmHETqHpEgJSedbH3Fjdv28lXo=;
        b=m7zRqxkHfkIhnKdVf9ktPDR93mB+hTFeVdQ71q3AeNNWt3AWXYqg8SZ/10uHWfoESP
         KZnU9SgvixUu+PkgthMslIQDi3H0Or9lWujWmx/88J8QNHlI0nUrGHzvWEitzXyAyqzg
         MSYWiX6BpdTwDAgDefOA9YmynUDIGaYiNu9WjVur/XtciAL+m4Lwei1LuLk1WvpuIgIg
         Hlbg0o7EapKC/Vit1j6WIFqQWnzHzsGKjgXPn0TdrbvMDHNaoJdjec4g/9A+oytJTJUW
         mt/3uxE0napHW+qR5EgwwRzszqyjHF0Puu/SPoQCNFzb30wIhvOgZHyJeFroEowM5vog
         zMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790668517; x=1791273317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l5DueSv+kzmVwwFXvkmHETqHpEgJSedbH3Fjdv28lXo=;
        b=A1guRQEWqH20dZHfSkTNVjtbaal3Qs8mMzYmFkQHoMtGabzlnIWbHDdnlT7EAHjxWr
         XnpGN/69Lo150HHIG5FCoo/AllHWmFewgrp72CtdhJyYNFka7gGp8MSqltgaQ3S8Z4fx
         uVJN34E/XkYPjHNCdCXgsQhACuzZungzPMl74fB2pYFrRV4oEBJavMcfBp0/EO8gXnQz
         YUzxCbxcurLQ8UIZizxBQQZiALVFFUsNCwtIYQzNQaVEEdnJqiC5qf6bmVheLQQ1eQHW
         R/PAhc4u6rfqwbqera/ARgnMB+Ga2Ach9hNdlr2smx4aHZJ8KBtVmJlfzLy4BSCVZz6Z
         9tWw==
X-Forwarded-Encrypted: i=1; AKwUvBw9zAfuL+zGcwTu5DPCd38mDDzjCwn9kb+/bvq2peimT9xNFUbbVNgxso90qlSHyFVyx2j4p6QKtojbIJI=@vger.kernel.org
X-Gm-Message-State: AFuF++nmimxE7oj1hxG7x7r/8jXxUM2kJiMZJ7BwqKkaSZepDw0xdsJd
	WzPzuMZAnl/VZBVDAi6uhl1TUkCZXrKsL72N7CzRM/oiqcpyatWPbWtP
X-Gm-Gg: AYBFou2Kzby45R57A1dCPG0hU+EynhEsIdskb0Uy6awy0GvFmrNfqrqPf9g19Og+xUr
	hpcngVTAVLyRXZQ+NOfHabRQB2oU+OARaFZFx8+UJs61rBuvrqGw0lNm5idkoua8MCFg+Foj+13
	caqLxYG8MtzgoDu8o7rYcV6KdQlD+uHxmBJ/940b6xkVUCHXrBIFblNqJzijU6hcSd4cxdkyQdK
	sUXdP8/ntggqBvlsqmOnbxJAJGp4MAe1SZla+zcdn7V8CJZ9U32Q/6YyiqL4jOELYBaXOox2t0l
	L1OQ4jMafRyimR5YKazkIbUHRnvdOdzO/2TpYeH7twqqpRZ2jIfTYv/b+dwfm0TF50u+34Ysf7p
	pxzjZcBWCTR+sodyRlh0dQgMpLiD9C2h+8iGoLLKEFz6r/RgxgasTXA9d9666REF+dk/lVBj7p1
	zMnTqeRPwMVo4TF7cIXKu9HKdHFg/kKOJK7at9IrdE7NcgM0WwtGZXxqHzlt8TAXOlrc9bvzTsO
	RN4A6l0RQ/xuOwqCA==
X-Received: by 2002:a05:6a00:1304:b0:881:158c:3b4e with SMTP id d2e1a72fcca58-881158c3d5dmr7108188b3a.47.1790668517430;
        Tue, 29 Sep 2026 00:55:17 -0700 (PDT)
Received: from embedsky001.tail6d6b2f.ts.net ([183.12.106.39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e22ee338sm351772b3a.45.2026.09.29.00.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:55:17 -0700 (PDT)
From: Yonghao Zhang <hyz3367@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH 4/4] remoteproc: core: Clean up after a failed recovery
Date: Tue, 29 Sep 2026 15:54:53 +0800
Message-Id: <20260929075453.2324597-5-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929075453.2324597-1-hyz3367@gmail.com>
References: <20260929075453.2324597-1-hyz3367@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When rproc_boot_recovery() fails to bring a crashed processor back
(the firmware request fails, or rproc_start() fails), it returns
with the processor stopped but two kinds of state still held.

The resources of the boot the recovery was trying to restore are
never released: rproc_stop() does not clean them up, and unlike
rproc_attach_recovery(), which releases everything when its
re-attach fails, boot_recovery just returned.  Stale carveout
entries then fail every later firmware boot at "already associated
to resource table", until one of those failing boots happens to run
the cleanup of rproc_fw_boot().

The power references fare worse: nothing can release them anymore.
Take a processor with two outstanding rproc_boot() references whose
recovery stops it and then fails to restart it -- RPROC_OFFLINE,
with the count still at two.  rproc_shutdown() drops exactly one
reference per call, and only once past its state gate; the gate
admits RPROC_RUNNING, RPROC_ATTACHED and RPROC_CRASHED, so an
offline processor never passes and no amount of shutdown() calls
releases anything.  With the count still above zero, rproc_boot()
then short-circuits on atomic_inc_return(&rproc->power) > 1 and
returns success without doing anything: the users of a dead
processor are told it is running.  The reference count and the
state machine are misaligned for good.

Release the resources on the failure paths of rproc_boot_recovery(),
the same way rproc_shutdown() does, and void the power count in
rproc_trigger_recovery() when the recovery failed without leaving
the processor crashed, offline or detached.  The service the count
was tracking is gone, so every outstanding reference is dead, which
decrementing instead would leave the survivors stranded exactly as
above.  A processor that is still crashed keeps its references, as
rproc_shutdown() can still drain them in that state.

Fixes: ba194232edc0 ("remoteproc: Support attach recovery after rproc crash")
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 34 +++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c52212a1d180..b138680b1905 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1900,7 +1900,7 @@ static int rproc_boot_recovery(struct rproc *rproc)
 	ret = request_firmware(&firmware_p, rproc->firmware, dev);
 	if (ret < 0) {
 		dev_err(dev, "request_firmware failed: %d\n", ret);
-		return ret;
+		goto clean_up_resources;
 	}
 
 	/* boot the remote processor up again */
@@ -1908,6 +1908,24 @@ static int rproc_boot_recovery(struct rproc *rproc)
 
 	release_firmware(firmware_p);
 
+	if (ret < 0)
+		goto clean_up_resources;
+
+	return 0;
+
+clean_up_resources:
+	/*
+	 * rproc_stop() has already switched the remote processor off, but
+	 * unlike rproc_shutdown() nothing releases the resources of the
+	 * boot this recovery was trying to restore.
+	 */
+	rproc_resource_cleanup(rproc);
+	kfree(rproc->cached_table);
+	rproc->cached_table = NULL;
+	rproc->table_ptr = NULL;
+	/* release HW resources if needed */
+	rproc_unprepare_device(rproc);
+	rproc_disable_iommu(rproc);
 	return ret;
 }
 
@@ -1948,6 +1966,20 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	else
 		ret = rproc_boot_recovery(rproc);
 
+	/*
+	 * A failed recovery leaves the remote processor in a state from which
+	 * rproc_shutdown() refuses to release the outstanding power references
+	 * (RPROC_OFFLINE or RPROC_DETACHED), so every rproc_boot() would
+	 * free-ride on them and silently do nothing. The service those
+	 * references were tracking is gone: void them all.  Failures that
+	 * leave the processor crashed keep the references, as rproc_shutdown()
+	 * can still drain them in that state.
+	 */
+	if (ret && rproc->state != RPROC_CRASHED) {
+		dev_err(dev, "failed to recover %s: %d\n", rproc->name, ret);
+		atomic_set(&rproc->power, 0);
+	}
+
 unlock_mutex:
 	mutex_unlock(&rproc->lock);
 	return ret;
-- 
2.34.1

