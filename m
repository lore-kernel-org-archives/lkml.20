Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C4355D884
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959900; cv=none; b=J+a7filyX9p+g1h/+wLuyL1kTbULSWgccolESPbEYhSrAA5Xj2lMZm+Ny4NhKPVOWOQJvlf/OCS9k5WuHab329cxbZ8w+TY3pfLoZ5DWL352IYU/JBqp/p50tZCsBHvh5KBvKDC1UUsoEqDenkCRyn0Pv/6qYsmsWSp53hRWQAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959900; c=relaxed/simple;
	bh=29Q1JN/CtG9e3jFCEjyrkGBGNJpxEO7c/NFbcIWB/7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HX5E6SOSl6fuCAkkjf4TZV9eonwOM7KPp3V/oKSQZwM2wv2Mapok2bRzVoYN2NFXeroKyN7mythdpaT6rC756peEfMz8qfFqIcg74pPCKKEnqem3op77dCyJt5Jfw1vj9jlJF77V26in1MzsRF+OPBp/72qh4Dgnj+qSSQ7GJ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHc5S3zB; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHc5S3zB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so13039145e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788959892; x=1789564692; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:content-type:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R4bCu5HRDrBYxQ3ZQ5U942enQUCmlULb13io90gargA=;
        b=tHc5S3zB8ranEm+LFcyOpm9EtN4Akms9RYJzm5xfOe85EwjX86vkNXc7QnSGHbvXTo
         s8bzI7b1EqnV55Sda4VsIGhBX1Y2wOZsQyF/brx1o2n+9X4w7gCJXoA3GLVFwOEL90qJ
         yGeUysk358PqdZ3N7TmZfw3CZGcHzQJsLUsjM36nxF66n8sXLuMatetastrG+iQjDbDz
         GAMR5JF7lusCgyKXJvw1JU541NUvcqrxlNB5aS7fRmZmqbe2Bi4NMxugGiqYfSpFURJw
         qDTzKyhXX7oQTGRg1xTOjwuUpz0Bql+u9eekNrUJk37p8uB7d9XtgjIB6hS7nwrXOKBN
         0N7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959892; x=1789564692;
        h=content-transfer-encoding:reply-to:content-type:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4bCu5HRDrBYxQ3ZQ5U942enQUCmlULb13io90gargA=;
        b=sj5z6e+Bol63Abf1/8HBcU7R6VHR4m1xaHGvhO9C4/Tm2HDB5XuRFDrWX3iEojDVGF
         4bbQ17wJE7LP561luMC2m+bcML2TgSjzDCENQnN5GVJx8+uBmHO3+kAyUFSQfhmrw1I2
         CkSv3rs7lhqgG3z2tOmhSmmIaS6rcG5TI1bIU0nkRt+80478UFwV6+/ssl/KtmAEC2fE
         HO3atD3XQ0FgCLdiiqYkm1Dkw4ntGI8ugMtFezu8+vDTTIplBnsl93U8fHKaDGajIAwi
         4LvcP3xhjvlYWxdNZEUmuVGaKeYFv043ZuQM9HPJzFzv284qkdQZwS3Z5RbbgwgvtoWa
         9+jw==
X-Forwarded-Encrypted: i=1; AKwUvBwZdDUQfl8fLHOnnFOMy8gcksUUYcE331w8ADCnWEpy5lz9MxIQDrrOFsmULqjlm0KUaDMTOL5Si+3JE9k=@vger.kernel.org
X-Gm-Message-State: AFuF++mFjZqRlrCDCFP5FbNRsE89uXotxOTzEec5wJnh9v+BrV3UcKjC
	iWZjPYPKBGW3c2/EEUsP1tpiGRFEScxNlj830lfHMwI0KHe6KszfuFHd
X-Gm-Gg: AYBFou3rNme+EyhfSnNOfywaisFvmo8o3TiO/6l/sCChPxriK2ERKDTWdEbiJuCNlfc
	ZWgYwjj/VPoYCSaVC4wHOCiNZL9zgHQAPcsnKuVvqMc38Wf8nk83gTaamuwMFduTgHu5hyFJuDQ
	Ve6RQ1Abcsuts48IZwgUaxr5XimGihW6qWStHJxVc3+9xJAJvH3xPwKClPJREsBk7ynnW6zkojn
	JGMv64efmd/CnB3yJpFZO5HpZgWxlJty3xhfRFBHV/3zvqyihvfaGDYb0BraAysGq2P267IlHt7
	BixpfySoQtwXwePnMCCZ2qua1nLVKHOGtBhkA9cTTE5t0YlrkVRiPDyMiGheSBcxaXpKvNZomof
	Xscc9u0hw8q6AG3Grl3hH0hTIj93vRxOU+sbkGWp1mO8L9tx2nfqvACEoPHYUAHgX3q1RITHXc5
	clsLNt8xJiObTCGHafb6lF4GmpR0sWeVATKH9lro3T2jcBVm8oULCihPFcSzzcCWQlBXbDZ4cUa
	LJT/lGL1RcB
X-Received: by 2002:a05:600c:b8d:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49d1754e950mr144997695e9.4.1788959892008;
        Wed, 09 Sep 2026 06:18:12 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1568:cb00:7389:2b93:7e4e:44c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm555457755e9.15.2026.09.09.06.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:18:11 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: phasta@mailbox.org,
	malhyuk97@gmail.com,
	tursulin@ursulin.net,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mdaenzer@redhat.com,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com
Subject: [PATCH 1/2] dma-buf/dma-fence: fix checking signaling bit for timeline and driver name
Date: Wed,  9 Sep 2026 15:14:23 +0200
Message-ID: <20260909131808.2201-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909131808.2201-1-christian.koenig@amd.com>
References: <20260909131808.2201-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 035219a760ed ("dma-buf: dma-fence: Fix potential NULL pointer dereference")
CC: stable@vger.kernel.org # 7.2+
Reported-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
Tested-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
---
 drivers/dma-buf/dma-fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 05090fb0fd5a..e92f9df8d63c 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1170,7 +1170,7 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
 
 	/* RCU protection is required for safe access to returned string */
 	ops = rcu_dereference(fence->ops);
-	if (ops)
+	if (!dma_fence_test_signaled_flag(fence) && ops)
 		return (const char __rcu *)ops->get_driver_name(fence);
 	else
 		return (const char __rcu *)"detached-driver";
@@ -1203,7 +1203,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
 
 	/* RCU protection is required for safe access to returned string */
 	ops = rcu_dereference(fence->ops);
-	if (ops)
+	if (!dma_fence_test_signaled_flag(fence) && ops)
 		return (const char __rcu *)ops->get_timeline_name(fence);
 	else
 		return (const char __rcu *)"signaled-timeline";
-- 
2.43.0

