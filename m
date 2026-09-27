Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758E54502F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519696; cv=none; b=sRXb0GzwiL3244tudzliBpgjUi3wfZcSXUormOfsDQ5w/xakbwH8UpEG03ow0LhtnE6A82mtVq3xvfyo+CQSAPCe1adpihzsoX28sG2Cvd9Vs04kLDXf6mIXK96QnVMZdNElaxN9SzTi4w7aCYwKF5kEFI7veFwf59W2OqL1Sz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519696; c=relaxed/simple;
	bh=+g3LUuZQXvGBvoKZjvSdWYiX/6vY5KycfzekZVjvmWk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mVJxziKxuLJmcSIeZUUjbHgnO55MNNWkH/+sXfBUTCza3B8/ZUasviVzO6s3NdGflFiUtfrJ0gTe9MNhkc7ZV+vGz4XwQBGH9NGZmpewMn85xPgX982OewTYSgyY3ZT8WCXIw9tdxG209H4vdzt28bdyzVWVosfXqwiy35Cv+R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6jQXe8C; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6jQXe8C"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664dbe2dso1200878eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519692; x=1791124492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=io+CTWk+B5zCdv2jhfadGeS4AMrXIMCEILzj93M705I=;
        b=g6jQXe8C5gEuni2QnrSchtLe9LcrnMaGoP5Y4LGU7GpzkiTlqmOET0dXP1plDFPxGp
         RdVkOwBZf6taU0fzGJFe1O1u3OzLJSNnguyhZKhVMUY93GPmS4XdULZn0i/XbgSRgUYl
         6H7pg3JCHIuYOK7sXdPAprZbSLWscLW5d1hcWe8m6HYVSYjkXN6wRmfjOe66jb+grMZ6
         uxLocHhtcO+n13Ir78Ji5H3HFTTID3QrKoxpW1GYNBv4kJYIF9YfPm9+syOmFS4L6coG
         eLBbvZX8Ac2gpl4C5kVPdR/k7XYGBVovpqeHedpOhhaK8cnFwUyr0NBu/fY+Szwrz4Rg
         xDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519692; x=1791124492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=io+CTWk+B5zCdv2jhfadGeS4AMrXIMCEILzj93M705I=;
        b=TeRdTniNgesy8MHl4c+Ou7BVP7H/cvBOlka/n4zYasLqrsR5cX8HctU0IcP3Wp1LxE
         +7EtOiMV9y/GxM+seAheyIeGs/jz6+DNkhchx30EzC/cpboANEmGXqhbBiZPG4DbI64W
         sr8MYX3nu9tB0iSUj1IRsP3VoHbzAmA+u2B0rHzR9Jg98dbMKGEJlR6P7cM6coeUfwgc
         qH3cIwUzZZ9sbKIdznS2WcVNKS4fPlUFWERfeyFWfAHQnjiN3IEy/dUcOxKx8MuBDDWJ
         c5hiYf+b6z1w+eYNyx8SfnVKn4wiSozu5S3HFfgfQYhc+D5tdIvq8Z6Gab98xpoWwuyT
         YGDw==
X-Forwarded-Encrypted: i=1; AKwUvBzW88gdFl+WXKNcjvY4ZmIHrlrO+TLvQABB9EKwR1ZKNGyxTgWPbkr55kmjkcG8j3rfe+66+39QxaCXLYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkSW/29hpx2lbKK8HOTIl4mlsogUWqkM0t3+YYw00LSZDWq5WM
	t/WUqK4rUnYL3X4575r9p2XA+7AsUvBFpjo0AJBMJteKnmHvOBhNDhdC
X-Gm-Gg: AYBFou0JGltHHq1lmQht6Fd/VrdtVgi8FdJkveR1I7Lp1+qRk7UjDr8tSbNepk0XMDY
	vBNp7aT7spvLjdMxBOiNLwUPnIJ7edjirYTeoeY1DUHILCif6ixvLxsjAwTbBxjEY0X5MmhJHx4
	gltVyXWJKvmg+VwhVb2nnWWtSkk/ZzUliPnA12vQqUNEadAJTZYsxd3Gan8EMbZ77w66XncnnKd
	z2JueoxryqUlxt22564QuUVUtB+sdF+2cj0gXKsZREs6l3OXg34BQiVmcUUiz6PYDSHOIrtp7OS
	B+Gn3h1YVUiwYuNn/+Gx7icPdkwH7jEeCgrgoM64NM5CNT/ZfIEBE1tH2JpWs5D2tKPmha5diCn
	fZanbuNzhgCZ5ExrAdnolsksZveaKv2MgXGVy7Nb2+gJ8FcIhqju5wbNobHjiC9kxCkmTAM7re6
	j/CmI6EjkL958KezKqE+0H9j+PIE0pV20iUUghw2mg/iEj9eA1H17GW1jD43tzrYsM01mAEVEiq
	p2d0w0G4aqHbHv9JwioolCgD6TGsz5DIRkjoqDL6O8cUyYEF1fgVw/snTWE
X-Received: by 2002:a05:7300:b54b:b0:33b:e586:ba81 with SMTP id 5a478bee46e88-3427265fed0mr7784905eec.8.1790519692224;
        Sun, 27 Sep 2026 07:34:52 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm21869436eec.17.2026.09.27.07.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:34:51 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 04/12] powerpc/pseries: Add context annotations for the DTL worker lock
Date: Sun, 27 Sep 2026 20:03:45 +0530
Message-Id: <20a3dfd2d68df0c3bf2bd24d51496a4a238a8456.1790517984.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790517984.git.ritesh.list@gmail.com>
References: <cover.1790517984.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dtl_worker_{enable,disable}() needs annotations since they acquire and
release locks. So this adds conditional annotation based on return value.

Let's also disable context analysis for vcpudispatch_stats_write(),
since based on received input, it can leave the lock held until a later
write of 0 unlocks it. So we need to mark it with __context_unsafe().

Otherwise we get following error on enabling CONTEXT_ANALYSIS on this
file:
  lpar.c:490:9: error: rw_semaphore 'dtl_access_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]
  lpar.c:498:2: error: releasing rw_semaphore 'dtl_access_lock' that was not held [-Werror,-Wthread-safety-analysis]

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 5dbf447d3a83..9965ead1e93c 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -461,6 +461,7 @@ static void reset_global_dtl_mask(void)
 }
 
 static int dtl_worker_enable(unsigned long *time_limit)
+		__cond_acquires(0, &dtl_access_lock)
 {
 	int rc = 0, state;
 
@@ -491,6 +492,7 @@ static int dtl_worker_enable(unsigned long *time_limit)
 }
 
 static void dtl_worker_disable(unsigned long *time_limit)
+		__releases(&dtl_access_lock)
 {
 	cpuhp_remove_state(dtl_worker_state);
 	free_dtl_buffers(time_limit);
@@ -500,6 +502,7 @@ static void dtl_worker_disable(unsigned long *time_limit)
 
 static ssize_t vcpudispatch_stats_write(struct file *file, const char __user *p,
 		size_t count, loff_t *ppos)
+		__context_unsafe(/* dtl_access_lock is held from enable write until disable write */)
 {
 	unsigned long time_limit = jiffies + HZ;
 	struct vcpu_dispatch_data *disp;
-- 
2.39.5

