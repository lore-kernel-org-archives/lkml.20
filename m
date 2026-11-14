Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644425;
	b=4IaHqdfSXGAYeqEhQ7Y86FTAd/GUf69AhTH/o722CM8tcbDRIEwr2b8t2kK2kMOj4vrU
	 t5GW4nogylRuDQF4lYBX8OWTLPHtpNXlNpqGjXrbSX/M0JbhypEXJ6nEm1yKc8FelK4aV
	 O+zqHv8QD8GbZ3f9cz5LRaR0iRwkDKtWXvldwv3CgXeeIPGSuDuXUd41poYcHHDbkeZgg
	 xjoYggg8mofbOIJDprLHsm3zfthk//KiNsmqHI0QO+Qz4r5v0dw3DBzZ/4FdzSU0P/rG9
	 GElNtczob/I4PP4jdaVWfkZa2cBsOq9R+btiWrjOI+LLfdxvjK5GgZhyfg7g6fxW5nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P7gyRMTycBiU+K9V2+iRGyig/k7M3DfU55SoQH+FP34=;
	b=zsUFnWna61yxQ5LoeHeu/kbQyouV00XkM9X60vwLzXRQkhzdKTGwHF1ZeWlI+0MMzZpZ
	 0cflfaOdVfYpDPAQ7T/9PAAfQEvYPXW75SbONzdh70KEGUBGY/bPRoYOze6cNWW9Czleh
	 80QqjqZ/dBJqcBD4PHttLpB50R0eqP60kcMogZCyysfTYG0BIC2W/LCLdCYxj9kTE7avf
	 4ENAsm2hvpqovseLLo2+xBECUAqvoLflEq4Q3Vg+vMwtB5XvZMnOzWIwUE/vadwJ1xSLP
	 0//O84VntD/MVm+Vprk4N3gL1TnFGJQb/0Jo/29lyJJbmQLn40emiUIMHhjo/Brv+hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXwsV58F;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465FA606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 465FA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXwsV58F
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a607a2e2bcso37044c88.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794644424; x=1795249224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P7gyRMTycBiU+K9V2+iRGyig/k7M3DfU55SoQH+FP34=;
        b=YXwsV58F5OCe5nykTsBpkgiAusI2SV1WeNZE59WQiM0ekPKwTITeqvXyO2oPM7bh/u
         gxcPOvQ2pdMBWaUwbIp54Stp0jNOt5vtoaIcpmKh1XgYp4B/J0boCKwBUIcsBlRkrQjk
         TS9G0TllG3CwG1z5H9n6kUG9wnfD7g0DCYQqPkEwS7iCWJ/+xz0gwDH8OjIFVq79azNU
         8McCN7o0lbXj/wtQBArYdJyyzJcB+FBZz43vRPufVihMkJFQBDuzY2vPrFVPOgXKLsV6
         ldvFm2PXAiulRlJKMlUDI5oRMD2n5uTweVpJzG1QGr5p7pG2fy6WTJqDRsgb8H5Gaq/P
         ZtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644424; x=1795249224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7gyRMTycBiU+K9V2+iRGyig/k7M3DfU55SoQH+FP34=;
        b=v31G7+eB0OYVmHLkT6gUXQp6MwUCZdUZOLWWaRxru5P0fWiT1hLklED1nglePiXJZC
         jSRw4OfIR49HcFv91NK7phTPebp+ioi/6WFB7Omgqk2KGTJND2nloGr2LpraBGTDJujb
         Agt3wzAgWEYFXnh39iKc3SOc4lSikg27eWpfDhE94WifQhdhEQA2zRa/+1jsmtaYc5PJ
         cZhFdyAe8HjoVYk2zjZZ+FijVKqoX8XBcqaitTM0OEvbbT4a9OhPh+2C3Txa1bpVnmsq
         kiPibrMZiQkw3f2l4fDdJZ1SId4OUWootRrynfqNFx2XoMfmTS5HrjJFSmW8k5eNui73
         J6Zg==
X-Forwarded-Encrypted: i=1; AL+hErGvzwXW8Y0NQ/Ny4kvE82WYvHBH5LxV6cA/3sIC13JIgflzowKDiCVz6FPweYe9g916cHJjg3P8KeI+JMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ij7PLGhxc47rVtAJTYJy0gcULJNH1ohdCo1BP1Nav6XLQI/pH
	PMGjK/1/ZK6688iA9Q6jLsh2QkKqza2Mqm/YlZi63SMPFMf5UmDZc5QM
X-Gm-Gg: AYBFou3L9/dhjniE+R4DfuFGn0KcuUtOykutRzXMo78+UPBFhM/xnkNRhb7mvKw9yRx
	62WbKLrEpbuZyXawdXs5cUukxhlWBF50CZEnEryUPlPy9KuM4glx3+Zvve2H8vugEQm7GekTtjM
	I5ey7mIZ0br4zSWgHpcoHuw8M1Ixzykx7or/FQ5E5FuFfSh37hju8Ja0JgLFqtT+0Nq5BI1ddo3
	MmrqmlawrVjVKnDVgKmHiAsf1Do2OqrX4xZ7qLkWYnIvhllJrHJWRLPtUsxpIpv+CfmH3OiSdhm
	9DfzUyzx3FIjtgmwe9Np01fn8vSRr+L2eYlXTA252FTx1TMC8Ymp4HPZUMpDXlTGLpqxtSezzc/
	+AHUWg+KWILOoV+f4okRfo/XQsau3IBJWBdG6IdD02jcMmLdwAOaxtBATILQuSAygGwz84ySypy
	qudwljCHAORaWOQ2FHdwiM4eXUG6hHO9ov1HfJB6Ezy7SsXrLq5Yd/d8FBS1IjPPDPkzO4+qaid
	ptMfOhez3NBDUyFvrBno5+LdFTuU+qLjbiTfhLTZbHc0Lovyo/Rby5HNh5/GDZCjX58u1eveFXy
	eTcPYpiYdPlF6asOC9hYMT2zCOSjRJozOG5rgP6JMZf9rAD5mJaTqJpd5IJbMa9mdia5c+r1zQC
	qRAOBjJ1c7O8bqTvRBzN4NU2HSw==
X-Received: by 2002:a05:7023:88b:b0:16b:4f52:a08 with SMTP id a92af1059eb24-1b502fe08aemr8181038c88.0.1794644424293;
        Sat, 14 Nov 2026 00:20:24 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm19524043c88.9.2026.11.14.00.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:20:23 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 0/4] drm/panfrost: Fix jobs that outlive their JM context
Date: Sat, 14 Nov 2026 17:20:12 +0900
Message-ID: <20261114082016.2454-1-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
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

These fix how jobs are handled when their JM context is destroyed,
explicitly or because the file is closed, and the error path of JM
context creation.

Patch 1 makes a job hold a reference to its MMU context. Patch 2 makes
panfrost_jm_ctx_destroy() find the jobs of the context again: it looks
them up by job->base.entity, which the scheduler clears when it pops a
job. Patch 3 stops a job that is queued after its context was
destroyed. Patch 4 keeps panfrost_jm_ctx_create() from destroying
entities that it never initialized when it fails.

Changes in v2:
- New patch 2, and new patch 4 for a related issue, both reported by
  Sashiko on v1.
- Patches 1 and 3: changelogs updated, as panfrost_jm_ctx_destroy() did
  not actually stop any job before patch 2.

v1: https://lore.kernel.org/r/20261114062637.2447-1-arpe1618@gmail.com

Jiwoo Kim (4):
  drm/panfrost: Hold a reference to the MMU context of a job
  drm/panfrost: Find the jobs of a destroyed JM context by their context
  drm/panfrost: Stop a job queued after its JM context was destroyed
  drm/panfrost: Don't destroy uninitialized entities of a new JM context

 drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c | 91 +++++++++++++++++--------
 2 files changed, 62 insertions(+), 31 deletions(-)


base-commit: d48ea86919434695da12d280dccab72b094397e1
-- 
2.43.0

