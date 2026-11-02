Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617259;
	b=C5jb2vXJut5aev0ejW+ITCwzdqyaSenVcM0Oi2XP4sNanl4qU6+9Y4DFhtnqFJR05T3P
	 I16UOHGtNMGGO6Htar109aq9UNyrD8BSpeo2kubbm3YND4i/ONHLlIm/ISavelo02BXKG
	 XQlmgk2fNC2s84V8HtKsV6h2T84YinvDzUfuruHTgT+xnPJw5S95TlbeoEm4yaIxYCY2Y
	 UXXZ5+j+jBfL1jxE/T4TbsGNejfTvBqvspPFLs0ZIeeiweTCUq6Z/rGe0hgzxhIFFfvkA
	 F4NWjIWFs/tSss2P3PGVxBmjvv29O69TCj4RZuvBUxhASV8B0AzC4wrDvMoOc94MjtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fpDshb6iGOBff2OxlNXN1O5AeGuJByPavE5PtiG+euQ=;
	b=E/j7uNQrcdAecfB86BMo82Jl7OaoPDsGV/6GFq25i0k9DFoA8zKRjpGOa8iLskFN/2ho
	 Agrcyej0CJoyhJYGjKPIcfoD/kD8S7YNBi8FaSK2er+yJo6nmmiBF2RIBErzOIfsogYL3
	 ekWwAQ7AAu7bJJI+TLH7dAAMpviB3Z0litpVorIwGovG07zwX4YWHd8S313r2Qm3EIzCd
	 0+Vfjiw9qVpl8zpYERPGxPTHz+t/AjF3MBOPodw8Hx0e00Bn7ul3KyZiYWSQxXPViOi3z
	 /DGaToarn+FPXce62hkcV/Tj89gHv5AF41vwyEscPcQ+t3dRryTo0C2hJgXVETRaGkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NhzmEU2i;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F363606A336
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F363606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NhzmEU2i
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so18430715e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793617258; x=1794222058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fpDshb6iGOBff2OxlNXN1O5AeGuJByPavE5PtiG+euQ=;
        b=NhzmEU2iRaaLzeQyrTR9j+CX7mTl8EewMztO5sESmLsvG7hlWTPGaoX1BYQzz+yl/S
         /YSkHM1KniPAucF5e5R+U6aiJYWXttPE6PYR6FJhny3W+yqsm9Yq3Gss94vjsl6kutC5
         0VwuuX4UwU88yBt5lWumLa7F6XzfNhQx/+uYnqDt3Dzplx7WOdWLgtGNFK529BoK8uq1
         DvKZqm8m90pNrBPNCtzHKUaggI8aWsKm2tPJRRg0obIoRJuJKDOSGN7XYKr9Tr3RfdJZ
         0y+r5CPaAwipMSc1+49SDaY4JfsJ3qczhexDJNum+YPDGV8aJGhilUCxq2J5laZG9REt
         L2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617258; x=1794222058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fpDshb6iGOBff2OxlNXN1O5AeGuJByPavE5PtiG+euQ=;
        b=xXCa5V2ytF4CU5PT/weBZjnsi7JGGJyuUvu4ZE6ftqgP4kULbiA572i7Q/IeJHoULZ
         1UfBUHaEFmx8ReFWKmVG7DQmv13doNRYdgJVRuLVzxO6hkvWnOdfa7Co0JTJMxLI2jFs
         z7F6OzakZ7Z98C8kkHpPHDnArDKpl1i7AuTwSLECp3dLE0EcCp9dkPowzMdgCGGC1lrK
         t3Mr74JvOhxOQooxHVwp2F+yAK/vgvW7k7o/JuGlM3AQfE22GrBHIrXl2Dhijd7XWPO8
         X6dXG3HhTeJQnH1RRWIporXn7woz9PHpjSx3f+z1s7OX84a8ArEL9hzfST6AmBpTSeP+
         EEtg==
X-Gm-Message-State: AFq9FYIM1C0mMyRBOgEC9Zt0Y4zXGBBDmayVzfInMg1heyEsarf7Y83g
	/kLCxq+zrO5OPbt91QaKMHqE5fVIFcDAswB0s4KePd9NiONtrw2Zw+BQsqXTgWMNC7uBnXz1fNm
	enMXv+kI=
X-Gm-Gg: AYBFou02Kpp8nCawYvpQvxMo5quVGcMpUh2o97WsnpINkfdfCm3Edden4Q7qo69TcJp
	F4JGksQ96bfGsfAlf0+ZI53yyHWLTh8ttQA7Uf8wWNcBeyGQizc3iA0xuOSamfMUzJpwGw00GgR
	rO6AlothwZMP5MQZUJrhwmmLlz+XNR6stzxCQA8P7/P28+FsvZS3d2ZXl8u9K8yy6uhPPCMNDAH
	RFxe0plE2ik5YE9huWuhlpZnM0HtdQUSEdJ9J1jWwNh48ezYpKY3T81q749Nx5wyQOS+48N11To
	x6z6t1bsZYNIPscsL9w5orJTVa9L+c1Dy+NwmlIG8E9n7jJTuXUy5OsHQ7uL69/bZ87NWBfSLgJ
	n+mhxDmLVAyS6qYoYY3mmOtJ74Hh0a/oaV0vRfQuUh+YS7z1g2ng4yzYFcNwffVkj2b9othIKXl
	N1YaH66C9jyCDzzHdienxB8BwOslhXRPLfbaqKFtPyuunGBdvZNs3I2vftSCFyjhjUyW+h+N+B4
	YVluFCRHcLMqx5F60xIekVzytt2iVT1KCNXdIldRX5xSTsco9jltKJYmdBlHGa6Zz8sx9zKRroN
	JoCCPI1SoCFRk0JTkW2pxdtc2m4hJMjDamNDhNHZUfU6xfRAHbDsMH+FnQdVRYiH/5V5TO8x+w=
	=
X-Received: by 2002:a05:600c:46d1:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4ac187a72f4mr218022195e9.22.1793617257746;
        Mon, 02 Nov 2026 03:00:57 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm266236305e9.1.2026.11.02.03.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:00:57 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH v5 2/2] workqueue: doc: Update WQ_UNBOUND and WQ_BH documentation
Date: Mon,  2 Nov 2026 12:00:47 +0100
Message-ID: <20261102110047.115375-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102110047.115375-1-marco.crivellari@suse.com>
References: <20261102110047.115375-1-marco.crivellari@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When WQ_PERCPU is not present the default behavior is now WQ_UNBOUND,
so update the documentation accordingly, including the guideline that
recommended bound workqueues.

WQ_BH workqueues are the exception: they are always per-CPU, so
WQ_PERCPU is implied for them and WQ_UNBOUND is rejected. Update the
WQ_BH section accordingly, as WQ_HIGHPRI is no longer the only allowed
additional flag.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Reviewed-by: Breno Leitao <leitao@debian.org>
---
 Documentation/core-api/workqueue.rst | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index bb770f556568..c14aa5555171 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -177,8 +177,9 @@ resources, scheduled and executed.
   workqueues are always per-CPU and all BH work items are executed in the
   queueing CPU's softirq context in the queueing order.
 
-  All BH workqueues must have 0 ``max_active`` and ``WQ_HIGHPRI`` is the
-  only allowed additional flag.
+  All BH workqueues must have 0 ``max_active``. ``WQ_HIGHPRI`` and
+  ``WQ_PERCPU`` are the only allowed additional flags. ``WQ_PERCPU`` is
+  implied, as BH workqueues cannot be unbound.
 
   BH work items cannot sleep. All other features such as delayed queueing,
   flushing and canceling are supported.
@@ -190,6 +191,9 @@ resources, scheduled and executed.
   This flag is the complement of ``WQ_UNBOUND``.
 
 ``WQ_UNBOUND``
+  Workqueues without ``WQ_PERCPU`` are unbound by default, except for
+  ``WQ_BH`` workqueues, which are always per-CPU.
+
   Work items queued to an unbound wq are served by the special
   worker-pools which host workers which are not bound to any
   specific CPU.  This makes the wq behave as a simple execution
@@ -368,9 +372,9 @@ Guidelines
   wq and potentially lead to deadlock. It should utilize its own
   dedicated workqueue rather than the system wq.
 
-* Unless work items are expected to consume a huge amount of CPU
-  cycles, using a bound wq is usually beneficial due to the increased
-  level of locality in wq operations and work item execution.
+* Use ``WQ_PERCPU`` only if work items benefit from the increased level
+  of locality in wq operations and work item execution. Otherwise, the
+  default unbound wq is usually the better choice.
 
 
 Affinity Scopes
-- 
2.56.0

