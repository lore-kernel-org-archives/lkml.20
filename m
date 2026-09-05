Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27931A5BAE
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 02:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788575882; cv=none; b=Y2ncQJ//vgcIKFjEisuSn5eGZZpB3M5415QuIGDuAmDZiYlnnP8JysbIwB3hF5fpsh5xhv1QrDm1X7ZzAyhGTP46GXYZwBuGFkcA/gGWoomawOaVJtAdyFppYzRtIRowD3RBMA/IHZHBjXwp4koQx5I1XEgbpzsoc05pY7BiEM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788575882; c=relaxed/simple;
	bh=j2RVUpj+x667v7vyWSyYDkDg2CgNdAXc01JuvoeLxyA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hUs0c717n2kmj36me6TRteJYg5XntPSLnUwGlnsAwZrYCGJFZD7BGt49H8FG/jKqJIRcm9t7HuampHS7SPqXMBZeTv7YscbD2bOe5HimhoXDhiElSraoCE3S/B+SfFPqQ0U+jB3CO115cg2IcXc6z7qa7B/tpKJ1beBv7TC32xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrosNoVS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrosNoVS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495590dde14so23681145e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 19:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788575879; x=1789180679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZH3wkIQcCWjm+BxTgOu09F0rbTL1k1ZraSpB3gco3J8=;
        b=BrosNoVSjfTJmr5qf95CTuB4ufV2KjG2BrJOk+SOtDDsY59cDezJfVRcjc/lZJ7dtS
         OZoknfpM6IxUYocY6CsA4+iJ9ysUJj8adr8Ot4DiGr4V7kBbhqVOKf8crKNUT4kWwyI8
         p+LVRGarS0IO9CS2g1YKDzLmQdumoFKz6bPAC12bCJVwYAbbXxtoUu+R1DXVCRFRKYAW
         F+qZPqBx0lFxfh5L/72uua8qmBd476w7PBhTXueGaJ3EGBHRjQH5LpO2IHjOVJgfE4/F
         mcaJIKS/gX23PHszPH69yKfo6pyWi4tNgDwdRKni8xK2NS9ARWqp47uUGC3mKaBqPJ08
         KIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788575879; x=1789180679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZH3wkIQcCWjm+BxTgOu09F0rbTL1k1ZraSpB3gco3J8=;
        b=q6Uv7gsamNDzxsqqU4RoxOYcOlmSWpiu3JKv0rpOuvUNNE8Fa/yLHFizK165X3qAAi
         A42UFIdgZLmiCSZjBK81Dt+ENr7G4SIo/R1Ia0s0EAo39/itryLXQtcWQKpdSJRVhb8U
         0YCT1N1CuskuiJNBn/VZPXWPqRcT7C3STflUrmi9z9hEZ9H2pmFG6lNJuFIdzs3EwHMq
         Nvs/iopS4Jh2knacFJnLHS4IyhjnQbmOLWoBc9iKoieNNifgKSlw+S0M/EU2Q8kpyCZk
         WacFOpy6T/iyjXzMfqkmCiwHqzPSkMJeM5RhGNEHn4OWp+lVxCKDAFSme9WRyH/1j8+2
         lJMA==
X-Forwarded-Encrypted: i=1; AKwUvBwHjX9Pf5ZgbXnP6RfpMvYj3bUCKv9HiJLkLgfoNM41R3uLTLNdwvmAINbxR0MZ1+HCxUu+W5J2H9mTJLY=@vger.kernel.org
X-Gm-Message-State: AFuF++ljo50/GUQnQPgiZ9EREi1Q+RmmVVwDGMsZ0xmYO01hIl1m/JF6
	kxh7T0fYf884AqMls3ZRS49wcp29G4lLOo8db040PsfQ+ZknuqrVZhQJ
X-Gm-Gg: AYBFou0i3Nk/b/wbH3werbd9I0vVbjPBV5mbNg/osEELS9u6xkXQ5sYusynfHlJn5DT
	aQ63ECvIVB/NiilPgKCzuDzRL96f9yTgxXQ7/20iRoB2kXFdJzNudm5X80Gj8NAG46kwHrX9zfx
	/1Z2QXrEKAWeeFn6yJD31G3BOqUL9bWpIeYWLZ+uT9ryf6XUQqjzJJeBJsB/ZeUr6Gzvy+XK3Od
	kokyl5qEaErdQBqmkwZti1bttXbb3C+XblM7fc+naS0npSI+aVt18yDqyGauUMJMcvf86M1858p
	nrMs49nZmAjCDls34wG7qRSC8YGMxEfZe/MHvIVbozSYls9hnGbbVZnewjvk6BPKShfr2xA0dab
	o7nyw5W6IR/vEO62xnFCYwvJ9QE6kj/TSkAkcNhmfB35fxBCvQTf8BkWUeHQg9n/hlzWYiaKbXS
	s8kei3/YlhJeIa30pluguCSkSZQpzmcphKcDrMbf74++pjaZMVxp2Z5HKDF1QWgMOncfDbUO4HG
	SAbSeZJoXGiC/H93Lv/jveDgOZ35x08r9vlVLJsufnubVzXGjufPkEc5+N90WuYjnxT426w5GTo
	FLEHQlE3ekFvfFeu/wM2oFm75qOUjq0bbu5c+jYdQITgmfxtzAPiWxIsXrlGNycg7xk=
X-Received: by 2002:a05:6000:1acb:b0:485:8b5d:96d with SMTP id ffacd0b85a97d-4858b5d0d2dmr14136245f8f.19.1788575878815;
        Fri, 04 Sep 2026 19:37:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm10808778f8f.24.2026.09.04.19.37.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 19:37:57 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: irqflags-tracing: Fix the lockdep Kconfig option names
Date: Sat,  5 Sep 2026 04:37:46 +0200
Message-Id: <20260905023746.82998-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_PROVE_SPIN_LOCKING, CONFIG_PROVE_RW_LOCKING,
CONFIG_PROVE_MUTEX_LOCKING and CONFIG_PROVE_RWSEM_LOCKING have never
existed in mainline. Lock proving was merged as the single
CONFIG_PROVE_LOCKING, which has depended on CONFIG_TRACE_IRQFLAGS_SUPPORT
from the start, so there is no reduced set of options without it.

Fixes: 55df314fbdb4 ("[PATCH] lockdep: irqtrace subsystem, docs")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/core-api/irq/irqflags-tracing.rst | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/core-api/irq/irqflags-tracing.rst b/Documentation/core-api/irq/irqflags-tracing.rst
index bdd208259fb3..a3c77046ae6b 100644
--- a/Documentation/core-api/irq/irqflags-tracing.rst
+++ b/Documentation/core-api/irq/irqflags-tracing.rst
@@ -9,12 +9,8 @@ that it gives interested subsystems an opportunity to be notified of
 every hardirqs-off/hardirqs-on, softirqs-off/softirqs-on event that
 happens in the kernel.
 
-CONFIG_TRACE_IRQFLAGS_SUPPORT is needed for CONFIG_PROVE_SPIN_LOCKING
-and CONFIG_PROVE_RW_LOCKING to be offered by the generic lock debugging
-code. Otherwise only CONFIG_PROVE_MUTEX_LOCKING and
-CONFIG_PROVE_RWSEM_LOCKING will be offered on an architecture - these
-are locking APIs that are not used in IRQ context. (the one exception
-for rwsems is worked around)
+CONFIG_TRACE_IRQFLAGS_SUPPORT is needed for CONFIG_PROVE_LOCKING to be
+offered by the generic lock debugging code.
 
 Architecture support for this is certainly not in the "trivial"
 category, because lots of lowlevel assembly code deal with irq-flags
-- 
2.53.0

