Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5143DA5B7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509192; cv=none; b=pppxrsbwDUfA+5fH5mS1FSUXhethS45NHE0qBxZzCZUpEVJyIVu5/caPPoQpYAbsmCssbXBIY8s4XeS623ocKxk3KH1JVT5mAXPk1ZJNpmZ8aeiYPyYrkWSBTSjDv6Qp37i//4ocuBk2rVdHghplwHitSGWxYerU9no2N2fmtlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509192; c=relaxed/simple;
	bh=jJufBHy0XOHSgCuO4Zat9GBLKTZbHQ5kUy9KcZGBSaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BAsaBJDzTq7lxAvxd+G5LBad8IjFgC7ZXx2GPoAkbnZJITlBamf/T92x0M8N6U88fEM+UVcoZzjkESNWp0hVza+7zp7QEk5HoOAnDqumqez08uJSSZTLg7MEfNBsl3Sj9bXYOPIggPr+FkY+q5lZw001I7jfQwaSpgO8gqympsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvIi2z3G; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvIi2z3G"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso720381a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788509190; x=1789113990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QTyILQ3Nb9xTYITTyUAAxXfDx2OTqAg1QFKIj6VFxCw=;
        b=cvIi2z3G/FyEPlEM6kzAS6FschP+zDTysHgRwMIBTKxUESG7Fqmt/rX/sOpqikxbWV
         U8qvJj7JyO/1hraa/mIU/rJaUdpUfpr78ZROhArNK70kcGO5Z5QucDfdyQAlMF6ZroF9
         EWg9Z3s4hZ3ujb0/FJYPpk1fT9KUtCG6f1sygpNKaMniDhRdJwmjZfBqLCB9AAb1yPLH
         WmlqDOlxW61lL0E5Z+uS5xAgtAIdEx91tGOXQiepw9BVL4r3BeFNGrrez5fbDH1k9+x2
         uvUY1Na2nZVuKbW82katZfLp4Xy/FLFiKNGdv+RzNxyZzYL6X0G8lKIc2YwParGSbryh
         djmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509190; x=1789113990;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QTyILQ3Nb9xTYITTyUAAxXfDx2OTqAg1QFKIj6VFxCw=;
        b=aRnKEjKhYj9mDH98HobVna3zyYOA5gyWfKeGzKQIjWvPNFBLKS8NyPL6jyxUGpiRHY
         JjrqsETGW+TZuDnILQhmqdW3WOMwWAcrlebp1Cus+IpEU4RKaP4qKiAPL+cC1ulD5EXD
         bTwNNHE3YMv3PuK+BGBoyDQMclQsWj8pEDpKWLSc3KV1ob3+zvf7N+GFGvOdCtKvyLIK
         /suJ7yVMODEWCyjgvSBDsfiB8iBzafvX2ub5BnM8neJPznv/ranI5qf4zyOhYw4H8a5k
         AAltVlTNs850eK2CAO1HmShcDXqUuEJHQmoQqLP0zNln0ichGFDrhjbL9tY10lNB+knk
         bA+A==
X-Forwarded-Encrypted: i=1; AKwUvBzmea6zSSTwMbPeV5TEoOcNNHgYipfbLSKqLoA/jiDA3WrY7BmurXVN/1dDVpSmGUyGSfsBd4U7Rjsy6nc=@vger.kernel.org
X-Gm-Message-State: AFuF++nhTV8yXOaAr8OhlmEvjyQA7zNnR/5S6U6+8KxZmCIP3IT58VU9
	0/hDgbkbTMyu8Vc9CPVDTcgy2ebfYkQZJN3RfEKbNM47oxYENoBH4fM=
X-Gm-Gg: AYBFou35ur8nKkJlhDGUqRrk7FExEc7zqqQaHTNVV4g/yflC+fPyWWl84Jn1X1PoNjg
	QOAcdSSsBtSLZpqCuKt9LtDAYjx/97i0vjB5+oGtijCFrZ4SdOB6zrFbsc45HnmeQQTTlGve2Zx
	LnncUZoyky0SemcHRPlfhNRe3NN37mcavcT0lyM0FxUpXbc9K1URdInxka7wjjy00dwrVrU60K5
	B7f2YS4ffuQMcUX7Iep88osGaiS+GrtzdKt0nMAYzo+wny2FRhv00cX3SQ1/FYnZ8DaVs/L3O4u
	qI+DmL87vtYEatIhZchrS+M3Jo//ma3d4yDIImIMX1Aj1u14i+Sosn5v2X6FI3xzv03rs/pkhcZ
	lYQetivtp6h4LGOBuCO0aIMpmKeVQPBP27MtLruYqt85hBhlbSwQQDtL9ls39UtooCYWnR852by
	ppvFBYPQMas+8iAuAkr/4lzuPvg9dugUjc4QB73BesWxsWG3pgeqelHh63Hq5vzQQQt5SrjzEmG
	jIsS3USRWM8dBZqE708jDl8RCI=
X-Received: by 2002:a17:90b:28cc:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-39b260e13d5mr7636395a91.1.1788509190441;
        Fri, 04 Sep 2026 01:06:30 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b261549f3sm3181153a91.16.2026.09.04.01.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:06:29 -0700 (PDT)
From: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: phasta@kernel.org,
	christian.koenig@amd.com,
	tursulin@ursulin.net,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mdaenzer@redhat.com,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com,
	"Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
Subject: [PATCH v4 2/3] drm/sched: add the fence ops-detach cleanup to the TODO list
Date: Fri,  4 Sep 2026 17:06:17 +0900
Message-ID: <20260904080618.2098450-3-malhyuk97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904080618.2098450-1-malhyuk97@gmail.com>
References: <20260904080618.2098450-1-malhyuk97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The previous patch caches the timeline name so that get_timeline_name() no
longer dereferences a scheduler that a userspace-held fence has outlived.
That is a targeted fix: the underlying reason the callback is reachable at
all is that both drm_sched fences implement .release, so dma_fence never
detaches their ops on signalling. get_driver_name() has the same exposure
for module unload.

Dropping the .release callbacks is the complete fix, but it requires
auditing every to_drm_sched_fence() caller (ops-detach makes it return NULL
for signalled fences), a different identity mechanism for
pvr_queue_fence_is_native(), and a rework of the shared allocation's
reference handling. Record that as a TODO entry so the cleanup is not lost.

Suggested-by: Philipp Stanner <phasta@kernel.org>
Signed-off-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
---
 Documentation/gpu/todo.rst | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 14cf37590fc7..284aeba3c752 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -990,6 +990,45 @@ Contact:
 
 Level: Beginner
 
+Detach the scheduler fence ops on signalling
+--------------------------------------------
+
+The dma-fence contract forbids touching driver-provided data - everything
+reachable through &dma_fence.ops - once a fence is signalled. dma_fence enforces
+that by detaching a fence's ops on signalling, but only for fences that carry
+neither a .release nor a .wait callback (see
+dma_fence_signal_timestamp_locked()).
+
+Both drm_sched fences implement .release, so their ops stay attached forever.
+That leaves the callbacks reachable on a long-signalled fence that userspace
+still holds through a sync_file or drm_syncobj, even after the scheduler is
+gone: get_timeline_name() used to dereference the freed &drm_sched_fence.sched
+(fixed by caching the name), and get_driver_name() can still return a string
+literal belonging to a module that has since been unloaded.
+
+Dropping the .release callbacks so that the ops are detached on signalling is
+the complete fix, and it is what the dma-fence rules ask for. It is not
+straightforward:
+
+Tasks:
+
+- Audit every to_drm_sched_fence() caller. Detaching the ops makes the helper
+  return NULL for a signalled fence, and callers such as
+  amdgpu_cs_p2_dependencies() and amdgpu_ctx_fence_time() dereference the result
+  unconditionally.
+- drm/imagination uses the ops pointer as an identity test in
+  pvr_queue_fence_is_native(); that needs a different mechanism.
+- Rework the reference handling. The scheduled and the finished fence share one
+  allocation, and the finished fence's .release currently drops the scheduled
+  fence's reference, so the callbacks cannot simply be deleted.
+
+Contact:
+
+- Philipp Stanner <phasta@kernel.org>
+- Christian König <christian.koenig@amd.com>
+
+Level: Advanced
+
 Outside DRM
 ===========
 
-- 
2.43.0

