Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C643AB5DA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668516; cv=none; b=WchU2SA+8I6mhw4jKyq36/a9WGKqYaeDiymLh04C674jFC2IsBbmE/CMYyqlo59RFQDmUJooYI3BprjN5QXGxpBucNiyE8S9XboKpawwECfm27miCI9m2/wGSGpVKZI4enbnam0KW0JOTct5xowmRXFyzuuUEUjNIAPHhlxMsnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668516; c=relaxed/simple;
	bh=TLmtPSWepcn7rEhYmjGCvbmnajWcRQcalYXntALHW1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F9pdLpbBDtaVzvvi6M2DIOC7FGL0RhRF/XLk31initsO0llLPnrEbvsbrHXj8/RPbuenPQHVN2xoSDLKPREnPK2VUvJLWdsxDqddCYC4HkbBJchHOoUs4RBlA2mqZI3mdJ6ZOSNGESDwYbTZsh9f3WcGE7Y7E2UWUrC17jjsicw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJ0rOYMc; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJ0rOYMc"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88272e1d069so1609099b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790668514; x=1791273314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bO/dnbIluSZBxDsguugBt2mCZ2F4+x9OSDZJiC/GO6g=;
        b=LJ0rOYMcft5mt8PFZqf+0w+D5HEljFlmaqGg4ltP+kKX1JJ9jh4fG25XsArNSC3OnF
         9wVDDLBfwnrP3zo7trQe4dedNcLdIN4AT1TqREt97Pz1QmTU8ZvRrF27wLRLqDHrBfGq
         8Mub1s9FwZsAM3vd92svv4hOzm6LYl0lqnKglPwwITtPsrV91WVOOeIVTk4xIznghu6d
         Pv2wBEPRHt/E+LlT2WPI/VHSTKaAodJAkdoxUXzaj8WMuFdc6MV+r6Qb0CqBYM1C1Ilt
         vlN84BVDAjeDPx+la/jcHWsPopNndZUOBEyoG/vD1bbQYZyS8kUXDogEIj10bUy7VBz4
         6ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790668514; x=1791273314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bO/dnbIluSZBxDsguugBt2mCZ2F4+x9OSDZJiC/GO6g=;
        b=1bZQITceIW/XByOprZVkWaIsy7WymLM3newxZTJwhf1iNdSTxZMIvQFiByFUIoKwuD
         n/zAw4+Y/gt49uh30jsjRHR54uI7y+enIUAA6GjrvRTIfH30CYa0RAY5gLl2LBFCLoB0
         jmlSGJgaAQP0t70IoT3if6HWztMYK6nDkyrWasks8LfgSX0SAw27rBBl+AanuwH35+55
         OPahuKmXE2Q54AetcScTVkxbHld6tslHygmNg4MCXaWWaSLTLDAjcaBzYsSgO/W9pvDa
         tXZfkq4O6r1IXVZafb4CB4ulkrBFwTjINHNh0MqMvKWqYz/4MR4byQ6nU8p4s4hMdo+F
         u3Ww==
X-Forwarded-Encrypted: i=1; AKwUvByDGNcBqW8lSB6/4S9PA86Ofci6HfAdeoBPn/wgQHuUCPxVO+6L0pvGTAm81cdNX6mtIZT4XsYV90Up1oc=@vger.kernel.org
X-Gm-Message-State: AFuF++nL4kNAQr8Jm4R2CnCdGscGpfLzpPd0L7CqqdAZ++4YCr4CDvzv
	+JPybgItYPOQ/qxNsOFcyo11XbdvDmuXoLmf33iIX6TDeKFP1RU6AGna
X-Gm-Gg: AYBFou1Ww5xJaLuZ4qHDFQBR/KemY4JH+ir6o/+BDSIein4Ys0wKorBabaZY+JazqdW
	nlm4xT+9BSUta/OOaB2D8QYoJw5K8mh0Q+aJgwty3cidLGVghBIKgbfju9H5KWtl/f6w/BvOP5Y
	GGWucOHWsxPON9grKZN2VkMNqcwnYyM5MQBzbR4OobJzE17dx+iMjAvW1ZHpfJ+jCEoDvXKmpk6
	ZBaxviEFGCtXYvyqo86eVJFc8oFXDDBqap4OO+xrk8dAn+mxmOC2Ss136QtSwbU2f6DWpF4bHpP
	5F46+UXVbcj6gkN+fQNsit3L6w0gZjDr4mtgObQvzs/2MYO7TLOaJ4d/tyu1rmdbk5WS4VuYfNZ
	IdwGWoxVzHsBQfG8rgWzAydaN/qd5FImtACio4qN1A+y1t30bKm3ppKOakDGI1iTpy12L0P1dlV
	dNcJY6m3GLKfYMuXdDHwuNBDUyz43/RroUVffqm2T2W5vxNahX9wAKHLbvJRONCzfpmp3eT+7q6
	U+znalYF5Wyu3HKcIc51vhe/ook
X-Received: by 2002:a05:6a00:2d19:b0:878:34d7:6977 with SMTP id d2e1a72fcca58-8802ba90ea9mr8821978b3a.37.1790668513942;
        Tue, 29 Sep 2026 00:55:13 -0700 (PDT)
Received: from embedsky001.tail6d6b2f.ts.net ([183.12.106.39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e22ee338sm351772b3a.45.2026.09.29.00.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:55:10 -0700 (PDT)
From: Yonghao Zhang <hyz3367@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH 3/4] remoteproc: core: Roll a failed attach back with detach() when available
Date: Tue, 29 Sep 2026 15:54:52 +0800
Message-Id: <20260929075453.2324597-4-hyz3367@gmail.com>
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

When the subdevice registration that follows ops->attach() fails,
__rproc_attach() rolls back with an unconditional ops->stop() call.
That is wrong on three counts.

An attach-only implementation, one without stop() such as
commit 1168af40b1ad ("remoteproc: k3-r5: Add support for IPC-only
mode for all R5Fs"), dereferences NULL right there.  A processor that
is being attached to was started by another entity and is not ours to
power off: detach() is the matching undo of attach(), and stop()
should only be used as a last resort, when there is no detach() or
it fails.  This is reachable today: when the re-attach of an
RPROC_FEAT_ATTACH_ON_RECOVERY processor fails (imx_rproc and
xlnx_r5 use the feature), the unwind stops a processor which,
per the feature's own contract, "does not need help from Linux to
recover... Linux just needs to attach".  And the unwind leaves
the accounting inconsistent -- no resource table bookkeeping
is done, unlike on the rproc_stop() and __rproc_detach() paths,
and a processor powered off through the fallback keeps its
RPROC_DETACHED state, so the next rproc_boot() tries to attach to a
core that is no longer running.

Roll the attach back with detach() first, along with the same
rproc_reset_rsc_table_on_detach() bookkeeping __rproc_detach() does,
and fall back to stop() only when detach() is unavailable or failed.
A failed resource table reset does not abort the unwind: this is an
error path, and detaching from the remote processor, or powering it
off as the last resort, takes precedence over the bookkeeping.  A
successful fallback moves the processor to RPROC_OFFLINE so the next
boot reloads firmware instead of attaching to a dead core;
implementations with neither handler keep the processor running and
untouched, which is all an attach-only core needs.  The rollback is
factored into rproc_unwind_attach().

The unwind runs the same resource table resets as the detach and
stop paths, which free clean_table and leave a cached copy of the
installed table in rproc->cached_table.  Make rproc_attach()'s error
cleanup, which runs right after, null clean_table after freeing it
and release that copy along with table_ptr, or a failed attach
double-frees clean_table and leaks the copy.

Fixes: d848a4819d85 ("remoteproc: Introducing function rproc_attach()")
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 65 ++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 19e0ea3e7240..c52212a1d180 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1348,6 +1348,59 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static int rproc_reset_rsc_table_on_detach(struct rproc *rproc);
+static int rproc_reset_rsc_table_on_stop(struct rproc *rproc);
+
+/*
+ * Undo an attach whose subdevice registration failed.  The remote
+ * processor was started by another entity and is not ours to power
+ * off, so roll back with detach() when available and fall back to
+ * stop() when there is no detach() or when it failed.  stop() is
+ * the only rollback that does not rely on the remote side.  A
+ * processor powered off through the fallback is marked RPROC_OFFLINE,
+ * so the next boot reloads firmware instead of attaching to a dead
+ * core; with neither handler there is nothing to roll back with and
+ * the processor is left running.
+ *
+ * The resource table resets are best-effort: when one fails, the
+ * unwind carries on with detach()/stop() anyway.  Unlike
+ * __rproc_detach() and rproc_stop(), which bail out before touching
+ * the processor when their reset fails, this is already an error
+ * path, and detaching the remote processor -- or, failing that,
+ * powering it off -- is the minimum it must still deliver.
+ */
+static void rproc_unwind_attach(struct rproc *rproc)
+{
+	struct device *dev = &rproc->dev;
+	int ret;
+
+	if (rproc->ops->detach) {
+		ret = rproc_reset_rsc_table_on_detach(rproc);
+		if (ret)
+			dev_err(dev, "can't reset rsc table on detach: %d\n",
+				ret);
+
+		ret = rproc->ops->detach(rproc);
+		if (!ret)
+			return;
+
+		dev_err(dev, "can't detach from rproc %s: %d\n",
+			rproc->name, ret);
+	}
+
+	if (rproc->ops->stop) {
+		ret = rproc_reset_rsc_table_on_stop(rproc);
+		if (ret)
+			dev_err(dev, "can't reset rsc table on stop: %d\n",
+				ret);
+
+		if (rproc->ops->stop(rproc))
+			dev_err(dev, "can't stop rproc %s\n", rproc->name);
+		else
+			rproc->state = RPROC_OFFLINE;
+	}
+}
+
 static int __rproc_attach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
@@ -1373,7 +1426,7 @@ static int __rproc_attach(struct rproc *rproc)
 	if (ret) {
 		dev_err(dev, "failed to probe subdevices for %s: %d\n",
 			rproc->name, ret);
-		goto stop_rproc;
+		goto unwind_attach;
 	}
 
 	rproc->state = RPROC_ATTACHED;
@@ -1382,8 +1435,8 @@ static int __rproc_attach(struct rproc *rproc)
 
 	return 0;
 
-stop_rproc:
-	rproc->ops->stop(rproc);
+unwind_attach:
+	rproc_unwind_attach(rproc);
 unprepare_subdevices:
 	rproc_unprepare_subdevices(rproc);
 out:
@@ -1562,6 +1615,7 @@ static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
 	 * rproc_set_rsc_table().
 	 */
 	kfree(rproc->clean_table);
+	rproc->clean_table = NULL;
 
 	return 0;
 }
@@ -1597,6 +1651,7 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
 	 * won't be needed.  Allocated in rproc_set_rsc_table().
 	 */
 	kfree(rproc->clean_table);
+	rproc->clean_table = NULL;
 
 out:
 	/*
@@ -1675,6 +1730,10 @@ static int rproc_attach(struct rproc *rproc)
 	/* release HW resources if needed */
 	rproc_unprepare_device(rproc);
 	kfree(rproc->clean_table);
+	rproc->clean_table = NULL;
+	kfree(rproc->cached_table);
+	rproc->cached_table = NULL;
+	rproc->table_ptr = NULL;
 disable_iommu:
 	rproc_disable_iommu(rproc);
 	return ret;
-- 
2.34.1

