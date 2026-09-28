Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B314EB871
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617322; cv=none; b=FATzkKoaQJf+3I6zRUKdGKkPKOq1fZf3n9L83MjXwYDMBe2wharJfOwDcjjN4YmRHn7Uwx2AbdNBwTpY/RtANng+X0HXaBmXQuG0EOHtPtfHDcP6mWAw0ZaJBPyCQliS8G64RkpyuczR2AefvDklYfttsbGsnVmHiJEMsqcwjo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617322; c=relaxed/simple;
	bh=fxbdyOtQyXxGPt9dE6qJI2lO85bbyV/d17xndfVGn+o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qFn9G6CSgPObyLqcaaYBKwn+qdv6Jk486kMWmu6cLaLRBwccPLT+WHHV64DGvg98mOXRbBUWFH/KYm1VrPbilnSfmbwHQqw7tqTrZtaIH4Qc756cSkKJD/bwlohsuW9xL8QVJkutVo1y2RxuNnfosBJoxFSaKlHfptr2SZ+Cr88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qx/ZR6PG; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qx/ZR6PG"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e7631c43aso34370375e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617316; x=1791222116; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ci6kw3U2QUuQ8iEQWyGnN3yV0fEIMUBiQ7ACCZCMmiU=;
        b=Qx/ZR6PGU3d/Y5pORJOfCc4fPIY3UCdq8sHmkmxRq8+Ixuqa9If/prcX2nGUH/YWDH
         V31xpP4upmF9E0oqzUsqtUEW6S7AwBYJbzNd79Aun/d4VnLJPljsWqbM97LKpQuF9xn0
         nilNyi5W3utDHtWXc1dQhqqK1TK1VdzvCtbb2fHaLEXRb5IF3P1frHpeNOBMwMvYUWFS
         kCjN11FjLVUZlqO5ikGhSMIewbkq3i7W3akEw/ShHOA3AvpYKLELmmIeTqZweVnAh9xH
         5kmmBTt1g4+PpwBSd5mPucc7ZUUncEgzMeWKMo1tLTSkdei/ZZT/KtXzARgcBHMFmIMf
         tLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617316; x=1791222116;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ci6kw3U2QUuQ8iEQWyGnN3yV0fEIMUBiQ7ACCZCMmiU=;
        b=Xu+1i+Vd5UfdMhHiwFA74dsrkTIT6MmRUNuM2Xq+P9axPG9BiQTDdneDQGv1n2qRBo
         95O/igHlkcrOo0b2jtfhvXBbvhaNATEs4Pwc2F+hCwKn0iMn9SnsishEyp8ZiDgDH5Eg
         yNbhJ29rRpve8TJIQQmy+hp3IcvbCbvelYDaKGPq73ZA6uNfcNx1gUsRRdNM7sPtAh6F
         hflXhgtshxlu8QLSsOE7eYgQqzk7FHq064J3EbZxjyOeXHXKUGEdfDHHbtjR9BKEgP8r
         EXGYPAkV+lKZbo9tCZkcrhkl0otyoGMF9Kgynv3/anK384kgovvXiFkqVFQYeA9H/5/r
         5SdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOdoS+2vhJWf1pj8oFkwnW36+d9HDeyzGaAGDay1lsh4hvgN1MkZj/iiHVVoN3rQEz38pmTY0+xMeVusM=@vger.kernel.org
X-Gm-Message-State: AFuF++mroU6GdhxgwApsawv/QPUIx2H34H0zPq50zYxKPLFqVr7cYcIi
	DP6SMCVYJbkkVwsSlqigjmLiJH4pkzJtkplumct55PhNNQ766ozXAr9TnfajIMqkEdUqxM+x9WS
	X+2OlBlFe6uSFPg==
X-Received: from wmoz7.prod.google.com ([2002:a05:600c:787:b0:49f:e26d:37ea])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a16:b0:49f:eddb:bcb1 with SMTP id 5b1f17b1804b1-49feddbbe6dmr202116635e9.25.1790617315540;
 Mon, 28 Sep 2026 10:41:55 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:14 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-8-smostafa@google.com>
Subject: [RFC PATCH 07/15] usercopy: Don't assume the kernel stack size
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

check_stack_object() assumes that the kernel stack size is
THREAD_SIZE.

The allocated kernel stack size may not be THREAD_SIZE anymore, rely
on the newly introduced helper task_stack_{low, high}()

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 mm/usercopy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/usercopy.c b/mm/usercopy.c
index 5de7a518b1b1..f31a42b9f9c4 100644
--- a/mm/usercopy.c
+++ b/mm/usercopy.c
@@ -36,8 +36,8 @@
  */
 static noinline int check_stack_object(const void *obj, unsigned long len)
 {
-	const void * const stack = task_stack_page(current);
-	const void * const stackend = stack + THREAD_SIZE;
+	const void * const stack = task_stack_low(current);
+	const void * const stackend = task_stack_high(current);
 	int ret;
 
 	/* Object is not on the stack at all. */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

