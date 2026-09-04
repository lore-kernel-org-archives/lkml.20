Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFCB40B0FE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523510; cv=none; b=jbwNYwvaQQaYTGRd5C6GOHNeM9vRuilYzFcf/ljuERIoHxy4tOBmjyAmBtD9OwC5kpgINh+IN9N8lGEzPxEOI9+usw4mTJx/WNT9NRESgVfb9FbKByhOQ3ZyqHydQiG62XGkx0YPK0QPJfFd/DusPVEK0hyyoTlCHlVieE/xxyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523510; c=relaxed/simple;
	bh=q4xMfRCG+omyHAtGpbU2YLMGDI8MHnLga5PPMo9CBoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ss7yKatb4SL+MS000FCAx2ez4mHqRDHnhMxi9CNvLLLA0nW/+/8M5tPv4iE8xQmzjlytiPNCQ6yE9saa+jEnFkA+EKHdE+oCecdstmOC2wYeofa+THeuEn7tTRA+Iu7vHxStcb6iYSLQdYJBAvLqSRpoEMEg8u7dcWnmERIvEGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovCqymJs; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovCqymJs"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e9ef94c0e2so584192a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523508; x=1789128308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYrDdFiVD38RqgIzTk5IkPI7oe3vWfrIZd42ghxcZC4=;
        b=ovCqymJs7sApxUELmbtoYIVSrB49Jrv5deCOd95Awizg6dyTHI9NJGTitxuKUflIdR
         osG4r0TQIrwvhK1dO4+tYN7BdpFE6Qf5pVuMS2w4KuxkMO3WgjbUxDjHnbBhoydh2CSF
         DqbuZc+KDxNlblYJFlXrE056Xg6anG/spOS+Jx8F+RCYItNJND/q4kpdM4VP2oH2sW2I
         DaHQgi5RH8LlXLusUjzAuAjZxXGAFzgUgYa7BQDaMxhrnd0OGtjzm0RURHaDc61jVA43
         LGndBK97WUVv2d9X3WMIyegPWKk6nLDfaY1iZzXPnoeQ18rla8MN8rVEmbHEd+C5jloE
         oDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523508; x=1789128308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sYrDdFiVD38RqgIzTk5IkPI7oe3vWfrIZd42ghxcZC4=;
        b=aeIlZDuXanyBNCvoWPKhdnYEhwuxYt/3PPw3GkK2zJkaEVuk2xoboYerTQwUhVpViD
         LG74GADfBq8B1Rkd3teSM7/mbZyYbAfZkBO9q4Hbpe8bsu5sXFEL8X8jb+RYN/7rMTUV
         lC2YmCW6N56eF5As9oX9u9rx1sfDAoFpYjt3mmCHaeI3gHSjo3Ttjsb4zxB3s7L579pn
         D5zfdMMXK6qnBF0m80VjhNpE/FrjDllyvq7hyuXs4CPVLJQ/bRafTA9Gvp0hdVgq0XBq
         oCk8D14/9XsZh9HVpTWGsWbK7fK27FLbta8HZwPd62k2h2/3rBbB5GU15ya1ududURXT
         ZxUw==
X-Gm-Message-State: AFuF++k+28lQxiGyraeC7hTrry2Y1D+zhrMpuQDvzqkkAaJSdpNU0way
	8IiOPuTxaDwFVt4ehkIpIp9TkxH+JW5NbABOOCdElTtSA1tPv19JZedt
X-Gm-Gg: AYBFou0V8mFQiT82trpE7ymwGxPHdpwl4+pKsh49zacebu9snffiE6E6IYVVkfqa4/Z
	ldwnDaY1rHcaC0jHCjxEwqAYorTBSbzMz7xc5wJe27vLDs6KcQFpeXOuTxFS5069LsUA1s+FbWj
	DPNg+FpnhqtpxTYUOd9SWcKTEAPDOVLcHEvN8mLO3B3fT/ZGdoU2jm5nEb2Rvv6ZBojaVKGatbW
	oIk6htnDYwivYn7joHZWGKMeXb0NRRcXKssdSZWYOivwPNx9FKcWDef91o2j9F0zIvmlSXNz+kV
	NjLTXfraB/nh07QYsOTdiqUi+csoK/sBsCXXeOPB0eBmNZatTMJEzeLOgWNtD/zk8C1qdvTWu3O
	LsGHjUgDXaJ3tMd3TGKws5VLC0oAYCf8porAldq1Wwjw2GUl5TW2AGDRjUkyLXPQoFCBAqGe/f0
	xLQojUksoMyuTd4e99k91jt4rgTOBzjhk51/OkHo7iqc1MLq2yldrDCz876j2lIJEU2ex4r2roC
	VUXsGtE38ETMPU=
X-Received: by 2002:a05:6820:818e:b0:6b7:8415:d78e with SMTP id 006d021491bc7-6b78415d959mr1361190eaf.57.1788523508058;
        Fri, 04 Sep 2026 05:05:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f787esm5770422eec.23.2026.09.04.05.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:05:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 2/3] drm: fix repeated words in comments
Date: Fri,  4 Sep 2026 17:34:17 +0530
Message-ID: <20260904120430.17224-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904120430.17224-1-hemanth.selam@gmail.com>
References: <20260904120430.17224-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c                  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 2fa170a29a62..fda036175a3a 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -85,7 +85,7 @@
  * With binary syncobj, all manipulation of the syncobjs's fence happens in
  * terms of the current fence at the time the ioctl is called by userspace
  * regardless of whether that operation is an immediate host-side operation
- * (signal or reset) or or an operation which is enqueued in some driver
+ * (signal or reset) or an operation which is enqueued in some driver
  * queue. &DRM_IOCTL_SYNCOBJ_RESET and &DRM_IOCTL_SYNCOBJ_SIGNAL can be used
  * to manipulate a syncobj from the host by resetting its pointer to NULL or
  * setting its pointer to a fence which is already signaled.
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index b8d847101b13..dab340ffef3f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -910,7 +910,7 @@ gf100_gr_fecs_elpg_bind(struct gf100_gr *gr)
 		return ret;
 
 	/*XXX: We need to allocate + map the above into PMU's inst block,
-	 *     which which means we probably need a proper PMU before we
+	 *     which means we probably need a proper PMU before we
 	 *     even bother.
 	 */
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 6dfb45592d74..be3c3c074e75 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -339,7 +339,7 @@ static int vmw_execbuf_res_val_add(struct vmw_sw_context *sw_context,
 }
 
 /**
- * vmw_view_res_val_add - Add a view and the surface it's pointing to to the
+ * vmw_view_res_val_add - Add a view and the surface it's pointing to the
  * validation list
  *
  * @sw_context: The software context holding the validation list.
@@ -367,7 +367,7 @@ static int vmw_view_res_val_add(struct vmw_sw_context *sw_context,
 
 /**
  * vmw_view_id_val_add - Look up a view and add it and the surface it's pointing
- * to to the validation list.
+ * to the validation list.
  *
  * @sw_context: The software context holding the validation list.
  * @view_type: The view type to look up.
-- 
2.48.1

