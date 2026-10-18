Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E903D4119
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792294963; cv=none; b=BQMCqzUxAaNfUhJFzVbBFJH8zIzKWTq9q2DKwVNgNo52/Bn/xGzXVUOYFcv+L3OzInB+5q5OqwCt1aXv1NInn+ToGG/ON78yPb93gRfHxFwNkbHrVsfxMHBkmQFVUaaDftFOamd3h0xz7TQojBm/sZ90qsHU1Z7UDJywfwRBzU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792294963; c=relaxed/simple;
	bh=OEiXZACQSG+UMfc3g985+eXqc1K6tNvfEVBEPiC+0Js=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=o/Zoz9FOhjI2pfdbzHjxGm1bOwb7lt7Ak3g626pFwYAlPcCDZsqU3JCbklrPuWPVobwlrMSt1x/Vh8hqvd+YyU72+aim7xu95Gn3RhYkHFFOFXZ11iXo4X7i0CRBIo+HCFGOhnNdhbNqyTm1C3nKFZgkKsQ/u0kGqEbPXnmO8EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k92C8ftm; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k92C8ftm"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2175201eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792294960; x=1792899760; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEiXZACQSG+UMfc3g985+eXqc1K6tNvfEVBEPiC+0Js=;
        b=k92C8ftm4Z4uVSPvuYtUJvVrhJy837wGK15NvGscbLc6ABrM4otx4JXt3NFqQNE0GN
         AIR+chAK01GHsCB1X0eY0Krofz2OjNceM+mynyi9xJPOuqLPQPxHYbXabEuahhLWcV8l
         Bl8rYd8mr60vccXZerJjUntxVYc4IQAuZlWshZjIGNlnaa4xIIfEMZn146HxNXZmLYgr
         hLc0eOKEBPrXHKvXIS7rVmB3O7350w85n3CKQLql1n3P8ngCVmb/8a2k62VGeB1r1Mvj
         KT2Cq6915LZ4VCSJ6y4V3ERd5U6XABdoe765mLUBMT6uG4Jpy8YNfeAjlWpB1aGtYMS4
         /32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792294960; x=1792899760;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEiXZACQSG+UMfc3g985+eXqc1K6tNvfEVBEPiC+0Js=;
        b=LqO55Lwy+vqIKpRQsHaFV1o7246fdelcJRBLpieT6tY3e/mk9YfByXrQLQnoK0GcGO
         6mUaONuFpqVMgxG7lZXAE5vF57t57a8n0WwXnLOCu2cXIuh0gQ964lhjV3zqNNihfbCQ
         0CuZ1gcfuac0OpQwO0VEcjfLSds7199vItZYtVWr/apFvQhJNHlE4tny6fYNDgqGTxZV
         oueyPcAdYq5rNroj4QxaBwC8pYxXclWzWgP/T/Kt9p/ykqWPysw76B9jPcZeAmDZFKv9
         h747xuv6EResLtAieLh8cdc2QdtPfVp3yAoJOy5TRUc2zlUhmpZp82qda4N32JlXdsKP
         jwOg==
X-Forwarded-Encrypted: i=1; AKwUvBzNxNOQZCjTt8a12HZSXU9l/XBtj6O6LyzXSF3RZZFhAzHaRRwHYdVMPOHBlaAuA1SIU7Y0INeyYxDb5bM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0CERw9HS8buv3vLkoN1t+hWsHHuVQ4Js5wGqgxjAZX2uYDoif
	81/+oDCX4P20nOVhhGpRbrzqePdKSzKif8hM64lqNVK6WrvKjWxR856i
X-Gm-Gg: AYBFou3pjFTQ0oDctQvPZI5aj1FIZ8imc+egXsInrXI5HYW7MAAezsQpsvJ+hb9cN/c
	tDWvB0K0KTA9ZGLYVpy7I8ifbeiy9lTOrOMa+pRFnFRop8D7eeJmaaZIqMFuMUitOtlJPpXltwd
	6IzthNZCaUeY17HuJf96jpqSpeJPewIal+yYJHJy4qK73Dk6bghpu9jRC60VYqoiW0c/QVHEFib
	cTMO/4F+FmyI8PcAf1A4MUrFenWY2j83GQsU8gXVsDbZ78UTQ+iOod20Dnp+T3mkGJQ5uGLudIt
	0+fAnxaED2aQYgXoz4Rprq0Vg755Vs2R02ivrCC2Dl1dWb1eFesiIbnSau5ibEF3txmmM1b43AG
	lHWf0UGFjKfO69xtzo09/dCO+GN78BYGqMYoBUk23+nKRPkOoq7c0RuDTnQF5PmIRkGbYqYIHoK
	xecvGwP0FX7nQo37lvqUcmh21WGeyh5olwu+Zaae22wZfb7JCm3CgY3E7TSx8Ne0PlzQ==
X-Received: by 2002:a05:701b:205b:10b0:184:d593:2897 with SMTP id a92af1059eb24-185138b5855mr6502042c88.29.1792294959920;
        Sat, 17 Oct 2026 20:42:39 -0700 (PDT)
Received: from localhost ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f5a13sm21454007c88.12.2026.10.17.20.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:42:39 -0700 (PDT)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Peter Zijlstra <peterz@infradead.org>, Martin King <martin3kx@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org
Subject: Re: [PATCH] sched/rt: queue a push when a queued RT task is boosted
In-Reply-To: <atOGI0tcyXnuWuD9@scheduler.schedules>
References:
 <CAEB5A_91hob8ddOhW=PrO1=O7GrFmSxY3r1-_Ard6x8KHHuJGA@mail.gmail.com>
 <20260814183652.611e7ecf@gandalf.local.home>
 <6db9c47f-a1f8-49dd-9e80-f9014d75f9e8@leemhuis.info>
 <20260903092037.5b739980@gandalf.local.home>
 <20261015061915.126442-1-chaosheng.qu.linux@gmail.com>
 <20261017121423.393837-1-chaosheng.qu.linux@gmail.com>
 <atOGI0tcyXnuWuD9@scheduler.schedules>
Date: Sun, 18 Oct 2026 11:42:32 +0800
Message-ID: <179229495240.39966.14792426764563252817@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks. The long explanation is below the --- in the patch; the prose above
it is the short changelog. I added the Suggested-by and shortened the
changelog. The commit is now 04de902d6a4e8a6ce6471b97d73f869c5753dc61 on top
of 1d08a07fd492.

The patch is attached.

Thanks,
Chaosheng
