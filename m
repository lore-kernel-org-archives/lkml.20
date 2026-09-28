Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A907D4EDCD8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617319; cv=none; b=fHvzeyvhQ/nIUk/dif9EOrg0E6KCcg/OTszTvKJNoXmDZhdlHayp85X1Vhlu9gRciEKQxXv9ICIhH54b0W+VOOFI0S+QbeeUZJY7audp/TL6eZ5YINetH+D+Xlbh4/IzD0BZOxGCUPEI+R3UPbmZwEIrFJQ27dwbDNyx0Ss9efY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617319; c=relaxed/simple;
	bh=OjWnAwqkXs+i44MTqOp1Ck5J5mQ7pY35YplCenpi9Mc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RAYCxw07Dq2TwdZTuS/8nU9w7Zliu4WM+zFwo11XpD/XjIGZgXBOuDU4f7NgVzCkYrIoxcEwio/yC6Ll3amwT9+xdQfFklEjNPi0sv0S1se4U8tVO8rUD+UN0NgbybZN0majLpIFLQMjVmy+xPUmGxTVMtbcsvnOU+LRjyzhVHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GhkNQzfK; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GhkNQzfK"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49ffde4293cso15066185e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617314; x=1791222114; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUO525MYjN5YsfP/KDhp3xMzNW05smVZVp3S7wkbxmU=;
        b=GhkNQzfK74LzqYlGLXENrhteifhPIk5q689GbRVErIK6osnD7gRq0aQRMBfmIShMpQ
         4Ri4wNOvGKjiPmcy82hoDGOtSmm/jb0mjai3bAA8rMtjforAENUVCiHsqeVlqTsb1tla
         h5tuGcMopU/6BwCqeXoC560cpD8SEr3va1g8x9Edo+wF1W7RjQT9tPh9JJTM/me6kpQX
         ESg9JTeJSaSoQp6fuhvb4S68T59Xge0lm372Ne6i5yrJZtH2NRc5szRfc1v0dhzkdqk2
         aQ160AT3zR44ZoMFJZWSK5ahbM+0wbeLjxmITmTyK3nyeyNFywbChkSEOI3xR4vrOrF8
         QJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617314; x=1791222114;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUO525MYjN5YsfP/KDhp3xMzNW05smVZVp3S7wkbxmU=;
        b=XYntsJ5e/yL9JevR+pmlZO+OrfZVuo+HDBfamgW6JqxYpERVn8iT4bUpx0nbs8I+3s
         dDVE1cJus3BhOZyMpQSg9EvSmmLwlVUyBYLWaUErzMskxRGT4ZXJKBKLRe6XWscRI5XK
         UTJTiTe24TMKazX1yE2ZKF76k97sCiK2gITGfxfUAxro+a7Oz4so8GXAhngebc1y4YeA
         noEkpD2mQckUUjbQGp1ykBXXmi++aG/C0EltZybEPApNSl1DZOXiDLPAzHtHZoRlXT0G
         +qYWtRAV/BKgy5lyflEpk79vWl8K944haOVkh2Fy59Oj+5WEAFL5P/Q1B/f5EjmFFkCp
         +yvA==
X-Forwarded-Encrypted: i=1; AKwUvByrCzPangU2oNV0l/iKk2nrnK8G/L/OS5j/2ZA741BTCio4tAtrWanRFObuCcln9LkNqsc17oah5yBAhJw=@vger.kernel.org
X-Gm-Message-State: AFuF++m45hZ7iRHXN4Al4I5gbppNhlEyAKgu4j1wPVZyKgBoH1UD9aqy
	8EVzHRZzPFtVKjZyC7T2GjP1AMPvHE+Kj8cUCASkqbNyPCaIPw9QziGPnLHXdaUi/zDka5qXySo
	7CFck50VmCtqCvA==
X-Received: from wmgb3.prod.google.com ([2002:a05:600c:1503:b0:49f:fec8:8e56])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5487:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-49fe66ee809mr241216335e9.22.1790617314094;
 Mon, 28 Sep 2026 10:41:54 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:13 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-7-smostafa@google.com>
Subject: [RFC PATCH 06/15] exit: Don't assume the kernel stack size
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

check_stack_usage() assumes that the kernel stack size is THREAD_SIZE.
The allocated kernel stack size may not be THREAD_SIZE anymore, rely
on the newly introduced helpers task_stack_size()

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 kernel/exit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 424c44a42a4d..899d3bf048d4 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -883,7 +883,7 @@ static void check_stack_usage(void)
 	unsigned long free;
 
 	free = stack_not_used(current);
-	kstack_histogram(THREAD_SIZE - free);
+	kstack_histogram(task_stack_size(current) - free);
 
 	if (free >= lowest_to_date)
 		return;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

