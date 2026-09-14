Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384EC31ED93
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410467; cv=none; b=VWjUY0izTEmy6FZEhGt0Z8nDKgeq0Nza8mcdw75tfhZw5VxvzIeVw5Z2z2VsFnmsAAWtAcjkHoxEDWs5CCY9iARwLDgBUUR5uqzQprm4sLFCOqYzM/RF+ZW2ZjAMOBoXak+BeMR5x4L3nelay6PQjBnyENNYSVOoz90ECMQU4FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410467; c=relaxed/simple;
	bh=MdRXsGFwmvfgHC06yY4X29kmaJywLGikQ0T8M1HwnsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lfwHGkrObmCMoPVqqUgz0v3PTbs21j57lslUolmNzJ8lFEac1EebOg2B96lRAco/iX9LqLXkV2H2lMF/cvQ7oIIesQK7n1uubXpuy5+pzTYDUrI4PmvUoT6TXRuxmQwA/Bilw69hLqU32P3BJrnTWohmZ0bFphSRg36ycPaaJX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UsiYCrwM; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsiYCrwM"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so1113626f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789410463; x=1790015263; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:content-type:mime-version
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtinZDaa2vVKSqBwDg7kga2GKJXc4vSPzazNjm4AtY4=;
        b=UsiYCrwMbUQyoRqDLvVe2TuBnmI4Y083hpTzUhhTc++dHs2aGRZVPDeTZCsWhxgg/1
         MmB1dwPhYGeAmzFmm/74Cj4by8j+KcYD2cA5gu9YozatgSN+hO1cWMHQAtbs7306MYO7
         xDDPLOy5UKl0Bs61abPuyMTgczlwULt8+Bs9IA2qSTPx4g2JTdQaAUw/IERT7a1ZdEYA
         s9T/sxIXuTqy/OR+sVOS9DFMOBSmKvmae0r1S/KCOMPh7hkh4Yx+69cKH9PCyGkgUiiX
         7BSwwp9cY44U4KL0DmAHqjpPpK468V1PL6wNb79Nwoh3uMv+2j8dhvR5cU8+lecbwmjz
         yaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789410463; x=1790015263;
        h=content-transfer-encoding:reply-to:content-type:mime-version
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QtinZDaa2vVKSqBwDg7kga2GKJXc4vSPzazNjm4AtY4=;
        b=RFtLevhS92Y1u3f+sWfcS2fWAWy7b5fVvLF8DjbefJFJ7cyGbAAGIv+SF8dUSHnKd9
         psG8OKLO9l6FQ4uE3qdj+yU2XgN1kwFd+hwUKN1UrhhGixhfADiA9794SmbWr7UaFOIr
         3UZ24a34bisX+GZlN8N3ERTpNaoU0bJ+NmqJTWlfNwkqRMxAJyEOU8K6UDOh+x0G+yyl
         rDxjKtT07vb7QIBvWNDVz6jsyg0aRw1weBH9eB6acQ+qsWeIKMbq5inUkinscVH7ufCI
         MP4feTmM3KcMTmDlK/viulIM4PtimCEy1Vt5NX6jgU+8NdxTL/jpMoaFSn2z7tQ8PpQi
         dxdg==
X-Forwarded-Encrypted: i=1; AKwUvBxzkBHQrok6tgrW72blWYxHsn768PXrrB3vS5j8ggr+ZGwa4lVdWeBWSumcHrvnKLPTQCWjrzuJFzhXX84=@vger.kernel.org
X-Gm-Message-State: AFuF++n8Zr+RHQzZx7CscPaaIQceVdbHtx70HVT9Lc4RdgaLqAkfXDf3
	PaWknFEk15Bl59N29ybRueOIIuJIu6cWJg7UFpsuKyymANiUs+0/HXXl
X-Gm-Gg: AYBFou1fvoFWKy/OHkiyJFH399xdzheNIpihRHnhGEXzkgRszGoViq6ueqRHwaz3HY+
	dApO0lqJ46Dsa7smDbOyNNlkexjn7nrGz0LRizuK67o4NwIjJq+X5b1MsetbPp6sq/WjPfXmP1t
	NtdH2sottNzSbCuMU4sVVNIO6/JPw7CGl/VfJ+XtfS0OH30sYDDVUOLqOxtQxTNtlVxybVTZn/t
	bfiVdaXLP5xb210FhHkAwo0BfeBRLApXS58nS+B57MokD90qDkgmColJfJoyzpObg3A7p4Kb3YZ
	Ol8S/wP1EfJWZaucoVXF12LM+IEEndJAJ5wAz8Ui16HBeGlkLAtlXtKR9WoLCKWIh8tJhWysEBj
	27TKvsOWJ+Qc3gQbMeqIWysB+J3Y8a5lmDxpy/n3QWsznOWGs9jKsjmp+YDxfoRUVMV7y2Bxp97
	UTXIhM0qqW1EkR7KE5JYLF/jAvLT8Y5cZyi60OcRimSKbKwJtCorKViKY0DXRjzfwTn7zvZjizA
	78u3ko/Y2LnkSrXaobXcg==
X-Received: by 2002:a05:6000:46c6:b0:487:342:d141 with SMTP id ffacd0b85a97d-4870342d1a0mr2948031f8f.23.1789410462767;
        Mon, 14 Sep 2026 11:27:42 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15de:500:7152:15ad:a382:94fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f0403125sm25397683f8f.8.2026.09.14.11.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:27:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: phasta@kernel.org,
	malhyuk97@gmail.com,
	tursulin@ursulin.net,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mdaenzer@redhat.com,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com
Subject: [PATCH 1/2] dma-buf/dma-fence: fix checking signaling bit for timeline and driver name v2
Date: Mon, 14 Sep 2026 20:27:39 +0200
Message-ID: <20260914182740.1587-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 8bit

The patch "dma-buf: dma-fence: Fix potential NULL pointer dereference"
changed the check to test for the ops pointer instead of the signaled
bit to avoid a potential NULL dereference when the ops pointer has been
cleared.

The problem is now that the ops pointer is cleared only when neither the
release nor the wait callback is implemented and this isn't true for a lot
of dma_fence implementations yet. So those implementations lost the RCU
protection after signaling of the returned string resulting in potential
use after free.

Add the signaling check additional to the ops pointer check so that we
have both the protection against NULL dereference as well as the RCU
protection after signaling for the returned string.

v2: improve comments to note RCU protection and explain why we check
    both signaling state and ops pointer

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 035219a760ed ("dma-buf: dma-fence: Fix potential NULL pointer dereference")
CC: stable@vger.kernel.org # 7.2+
Reported-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
Tested-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
---
 drivers/dma-buf/dma-fence.c | 16 ++++++++++++++--
 include/linux/dma-fence.h   |  6 ++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 05090fb0fd5ae..f52675f3ba03a 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1170,7 +1170,13 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
 
 	/* RCU protection is required for safe access to returned string */
 	ops = rcu_dereference(fence->ops);
-	if (ops)
+
+	/*
+	 * Check both signaled state and ops pointer, we don't know which one is
+	 * loaded first and ops pointer is only set to NULL on newer
+	 * implementations.
+	 */
+	if (!dma_fence_test_signaled_flag(fence) && ops)
 		return (const char __rcu *)ops->get_driver_name(fence);
 	else
 		return (const char __rcu *)"detached-driver";
@@ -1203,7 +1209,13 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
 
 	/* RCU protection is required for safe access to returned string */
 	ops = rcu_dereference(fence->ops);
-	if (ops)
+
+	/*
+	 * Check both signaled state and ops pointer, we don't know which one is
+	 * loaded first and ops pointer is only set to NULL on newer
+	 * implementations.
+	 */
+	if (!dma_fence_test_signaled_flag(fence) && ops)
 		return (const char __rcu *)ops->get_timeline_name(fence);
 	else
 		return (const char __rcu *)"signaled-timeline";
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 158cd609f1036..ffa99b930843e 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -141,6 +141,9 @@ struct dma_fence_ops {
 	 * compute the name at runtime, without having it to store permanently
 	 * for each fence, or build a cache of some sort.
 	 *
+	 * The returned string is RCU protected and can be freed after the fence
+	 * signaled and a RCU grace period passed.
+	 *
 	 * This callback is mandatory.
 	 */
 	const char * (*get_driver_name)(struct dma_fence *fence);
@@ -153,6 +156,9 @@ struct dma_fence_ops {
 	 * having it to store permanently for each fence, or build a cache of
 	 * some sort.
 	 *
+	 * The returned string is RCU protected and can be freed after the fence
+	 * signaled and a RCU grace period passed.
+	 *
 	 * This callback is mandatory.
 	 */
 	const char * (*get_timeline_name)(struct dma_fence *fence);
-- 
2.43.0

