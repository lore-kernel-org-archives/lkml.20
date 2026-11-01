Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793508854;
	b=ScbokCEMQTQe3dSX3LMUi3KgIcysvzX3ums0lWS8wtb+ETgmmgBT1LFKVucmK6kj8uYz
	 Tzn8uCcs9HYovjs44+dlOmR/UxC9BkgCDWXSrZ2BRubms7yWkcxlUBq+LoEhDYjuMr4Ld
	 ccjBw765hNYoPY/Wwuc4USS06Ril422G62a6FcQwa/hAxW5BXqp5/pCm50WPcl//fEOTL
	 JesS6jMKI4aq4zAKgo3B276OgQxoIls4D9AU9/0FlfvLC5PkAfCU+0Lw6LZ0fW8ez0FtU
	 vHA1biU5DmYUaoRDXo3TopK/hx56FdO/7E2oY9sk1BZUETMBzb7d66QSRl8jvozJCjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793508854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M3Ud+a0XKmipRvum2sdY2bzu5rks9GfJr8hWAWzt+f0=;
	b=nYAU29oc5y8OKfkNCmpr0bBajw5WBA5zgEh7gBzkcJWP7rkJnvZj+dZi7ZOUEz5bbcf9
	 DWP0ld/UX94YP3rLEcShaiAIeHghG64vVdXEuzW0gGinvYl0kcPCSrwWodqIH8kQ4a1Yw
	 rh1kbnN9l3nanIiXZmO5X6filc7yoryXFLf/0bsQOjoZ0LTWNTDpBUL8yLTYuBPFuzlbO
	 lGKhfW5bzssFWtAOztbfB2c2lFKMj3/RpjJ9LoPcdgnlJV3Pq/yOz/T1I0vkHna9awCbz
	 /wR3Plrr6nHVRITB03Kp4Uyfd+lwtTVwJl+PHn9DpXudT8xW3/mtM2iRkNz5Rc2Tgew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6eQhPJF;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7A7606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 04:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB7A7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6eQhPJF
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so12283615e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793508852; x=1794113652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M3Ud+a0XKmipRvum2sdY2bzu5rks9GfJr8hWAWzt+f0=;
        b=W6eQhPJFKLPhdDzK/Xaq+MCF+oKDVHzqb9Dqw4M+Y+SRyC3UZHdNfaqzAfP8CetG03
         SulkDJmKr3YqtVyRCrjJ/ZFHl+tpS8zN2ngKVnORqYuRX+ZmSSk6TW0CbQDhN9XbiFhC
         YBn6QRTH9VPUFNWUSj+47zeYFRixTmwHJZloVnxNJP00y4blhN5zKsLk4lZa3q2nBYPG
         zrIzBIJfWUPLsVuDNBSDxasV7ikvhy+2ndE0o99tv08p9YwADPc6WpMJHNLi6KoMudWo
         ++Ae2MToImPc1cDMBB+mcvaBQRfcRDYsxoGU7c3x6RQ1jPwUnqPQgpWMpVfJ0EoMDUvs
         b5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793508852; x=1794113652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3Ud+a0XKmipRvum2sdY2bzu5rks9GfJr8hWAWzt+f0=;
        b=h4PSatTsrLgQZQu/YBcoMEgWkA7/Zu+ksD6MFIWNs+turebDb8JMGkGoyTbVElfKjd
         vy4kop5O/xrMaEB3ew3Kh5X6IrKRvNyx+vtg83DEH4sVy7E3LwQ4RiA2OcbdXO28fMS/
         0YcKWjZIopLMLKRCYQj8Yi5yV74ia4ZcTBCT517gC/SGVMYMrDAopPc0//LEFe/yHRpv
         lxPEd76XmcH31uN2XMy9qnBGteHgxvyW4SByWnVCe+1AYmeBpcjyuWRgqfqJDCsxgfkR
         mZy4vIsZPRvtrH9pq/6yq2FO6pKsIxTq04hwReGlllng2jLzUIS3kYt6jUKOrh36jiZs
         TlvA==
X-Forwarded-Encrypted: i=1; AKwUvBwFGAicM5QbN9vuI7K3k3Fa023ihsmUr/k24RFbbGcb8RBhK8/PV/Jjss4kcGiBWkit419MTAZbtf+zpDg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/+LgD58GPY78oHrNGRkgi4wR5D06Qwc30+cuNrVz3AipjSi3s
	WEiMdTxuz7F+pq5vZxnsiaO1pJpxCLm5mX1w3RrOEURd+Z59nxFCYstF
X-Gm-Gg: AYBFou3d67NBE2JBcSFK0MCGqK4GfZtcitL2Y2o1RpXSBGr5Z8ltmSJ/wcNC9+XXhnD
	CWTRoYROOJMYKOk4rHe9vDh9aCsM1yHdrcfpcehxnv2AHP0j3cT0G5yfT/5znYFJVZ7jCeszJoW
	TeeCyedC8AoLeE0/j+nlQZtPhqUHq1+DMMyEPxkQy3mpFnCHrqviBgyLyCMeXvBrfERpN2f8iPj
	Bsee0269MRu8B6Y2ntq/eQh1yN0jcst6QShK/KYdGF9oCvcO+yqKwSPLu153yZ6Jz4nDg6Hfhhe
	ejC9rVxyOS9HQ6w1nOlsSJHBVsuSfgFgoloF+KCW7RsAZ5kXWlGTsIAwB9NctVGbfl3Wwdm3pkC
	CzcceXYsCXXvj429vHYzDM9R4CeRaOPBtvY12cyHEhe3ltxDWwIyVcWYxd2fZm7d72g26hD+5CY
	OVWZnjkSMBa4oiHICAsZ654p6UfUqWH0ecJq0z6pfC/EElGVZXqJ2E5+4xMFSZPAoYinMY/J0HW
	m9HEF8Q9UCzAV7fa/16E3jT5nclWtVGKhXsoREPJ7ptg+nsI/r7LPHDQSh29Bmqh6HQs/18EpTF
	drr6fmYyOsiDXrt+pTJmhmLhMylYGPSEFni0qjD3/Pfn9so=
X-Received: by 2002:a05:600c:1d23:b0:4a2:167a:c946 with SMTP id 5b1f17b1804b1-4ac185bccfbmr150111855e9.13.1793508852044;
        Sat, 31 Oct 2026 21:54:12 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:1f0e:d397:58dc:8e89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm278308975e9.10.2026.10.31.21.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 21:54:11 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	maz@kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] genirq/core: Free per-CPU enabled mask when releasing an IRQ descriptor
Date: Sun,  1 Nov 2026 06:53:55 +0200
Message-ID: <20261101045354.60854-2-thnkslprpt@gmail.com>
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

irq_set_percpu_devid() allocates desc->percpu_enabled separately from
the descriptor's affinity masks. irq_kobj_release() frees the other
descriptor allocations but leaves this mask allocated when a sparse
IRQ descriptor is destroyed.

Free desc->percpu_enabled during descriptor release.

Fixes: 31d9d9b6d830 ("genirq: Add support for per-cpu dev_id interrupts")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

Validation: Source-extracted ASan/LSan harness.
Baseline leak reproduced; patched test and controls passed.
Kernel object compilation not performed (no verified .config).

 kernel/irq/irqdesc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 7cbcc3fb9e6d..ee8b4646372e 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -461,6 +461,7 @@ static void irq_kobj_release(struct kobject *kobj)
 
 	free_masks(desc);
 	free_percpu(desc->kstat_irqs);
+	kfree(desc->percpu_enabled);
 	kfree(desc);
 }
 
-- 
2.43.0

