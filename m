Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195216;
	b=l+8JoR2oE4e53zfdfOLP8dDW32lrJ5mpQSNE2anuJ4bEn+CqW++l9vM15gtXPRKHgzLK
	 arnPhGkinhTFxojTHy+u4mht32gfxMM7uuRPBquu7HeYZXBSAPk+3sd/TQBH1KxYyB3xs
	 s8kfvwc1RiCJAE/fRvfZOBtpHa7/p4UWlsEYZsx9T45Bgp2wk6jc3ZWJ1rxn3HDH9V49I
	 lvXvHQ0+3imcocMsnVdPYyr2JfO2Kt12nor4CaB55yFlbKdNP2YA0Tf0pytYRin3258Ki
	 9XBZDlXGsCZYx0Q/MML06FGSKmhl7bnYTwsbSRe8PQWzRTgpaB7lpWveRVfVcYSxY/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gKFUBdSy6v7/SpB0ZQpz0JziViW1zO3RHjALuxOoURI=;
	b=Q56tExgmLDYFR9d/B8X6AKy7nNogPGMpr4hC6GCbMfEx4LAmmVpr3w2gsFHKVI5QvVvZ
	 PYPHQjQJG3m6xk0LidLGAWLvshShAaD57475dKCXgeNhwgGXYtPDyIwvNhyqV2/y/orPA
	 7iSovcwo9rT2L2V6VTvIUHpUrf7vkrXca346eDXaHoAFPhsi6jA5eSDnalXlLnjKx75rj
	 U8YqNiQHx1IP9tCYA0se+T+2Pm0w4vdvY3ip9KYGMTtnIfp6BhSyBt5HX7Z5ms8zhYvpA
	 NRJF5VsE1qKWjpbe1hBB3tmmGTQIjTfsyOVAnJV35uz183QLbLlYyJrdoe0sFqVq4dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySZ8Gku6;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9847C606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9847C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySZ8Gku6
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso588460a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793195215; x=1793800015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gKFUBdSy6v7/SpB0ZQpz0JziViW1zO3RHjALuxOoURI=;
        b=ySZ8Gku6JZsRKF/ZXOTFrtFCgptbD8XVG9rj3ueJGlb80x03uOkIGq5aO6M8NPj0BP
         yNlRhvBVMUFYF9fOTLx3i7OBp6RKuOrNgyoEhgU0GoigGfRiLJ1VlCqwHiKpna3NaSLu
         7WAxhtQK0psi264P5RMsP0WtgLDYQ7Za0pOPIgnjb1kxdO500dbIPHcWiJlBUUSliShp
         UGAlYc46JxL7/Y7Vi8M/Q5lcP4MRYX49/X+EPVOGuPPPMo5lldfAIHB98BHSkOb11WWa
         rLuBVh7PoyKZFAP2mRfdWeU3rv/GqYaWMpL23fi7phQKaECo147WvY0RMKx6gTKXvMbE
         38rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195215; x=1793800015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKFUBdSy6v7/SpB0ZQpz0JziViW1zO3RHjALuxOoURI=;
        b=NPaTia8RTgu2y6zxXtLFLMUj7srtLW70Ltp4fpPk0eEB1JwWEIXSQlrXQyH/cDVrvR
         vcd0UIHgc5SsBp0IRSA8xEHa4Zf7/3pwxVhotN5MKZu4B2cEoHWWLy5STNydLl8+EqCd
         lYR/Fd8TB3jabpZnPzBs6DxlthkG8r4qOVj1oSvEqtnWEzTWtHzpsITWTWZdROo6wLsT
         zHrfDiRFrY+LglC8wP6Q6wSDSrKsRxqjeYbEPcB/X8/bSvSWwEspzlsPjCCBnXGx2X0m
         dy/s8xdA8yFIJMp8hF62Gpb9Okto3SRqmGQlDvk1t345wKks5TrzOCIOgAPOWHvZrmCR
         ycKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBBhljbgzhilUWg1UzXWzvgnRcROgPp4TZqHjmyUsfgqqmTw3TwWWA+6sr+5QWL2HcdreV1LDppHHkvGE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTryRroCt7mnIruuqcwYN/LSbhjbF7UXRhBt/HcuNiZuaLSr0g
	UdJXZUmyKZdlv7SsI6GuI7MV6RhNe2xUXMeFRcLYXtCmbIckOdP7s3/R
X-Gm-Gg: AYBFou3LzEWEbKs4wRutSPVrR0pzNsaMC1YctnbpCzcjHe5PAbf3ygtGIOWCikeNSl0
	YhD3sAtl3rwIATJ+n/zQZc1jpGsY33qnFDIW7sRz9kd0uhXu25u715tcre8MtzolTKe1BEdZFit
	g8NCtYcPBWWS+Cs0WWwIJLBIE2enC309+/MmkHJ+sLkOXgvouxXNDMA6tUaUmCN6tjnJKtbiLTM
	bmqSBVseVr3KxRwH4ayKZ6dftq0sv6YMz1MdmxUVtqtSyJ0C3mZ0YKdGxeued5PcB8QcSyrqP5v
	2cWa4CLcHfeZldgJtSFRUgDYUD1T+HLQveUrw9EvipJeOceZDfFT6zILmuuMcCFyDnhiygVPy9A
	dhDcsG05NK3xXfj9eNrX62TO1CW+jI0kFiFFzU/B68eEVdB93DblZWfUXRvgGoxwheGYllo35jG
	DOnh/Ek/OukDpga9iiN009CyjlNCr8mXiUdR6QNQclcFo6vrHU1Jfhvcvk0ed7X3GbkSVIAqt3M
	+Yug8AFurXcgoe6df9ksnL458hitvkzPBaip1gFfxYluiGtptREkZXecdbVGTpeK2hbJjTJoi9O
	3+sGAk2/exNaSE3YjS2K0OoQmFa9S0VuTuZSgfdK6/XJoA==
X-Received: by 2002:a17:90b:4ccc:b0:3a4:9a7a:360 with SMTP id 98e67ed59e1d1-3ae58100a06mr1891992a91.29.1793195214929;
        Wed, 28 Oct 2026 06:46:54 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ca1bb2sm22014585ad.68.2026.10.28.06.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:46:54 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: vbabka@kernel.org,
	harry@kernel.org
Cc: urezki@gmail.com,
	paulmck@kernel.org,
	qiang.zhang@linux.dev,
	akpm@linux-foundation.org,
	hao.li@linux.dev,
	cl@gentwo.org,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	linux-mm@kvack.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH 1/2] mm/slab: restore the rcutree. prefix of the kvfree_rcu parameters
Date: Wed, 28 Oct 2026 21:46:46 +0800
Message-ID: <20261028134647.3176080-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

The move of kvfree_rcu() to mm/slab_common.c dropped the "rcutree."
MODULE_PARAM_PREFIX, so rcu_min_cached_objs and
rcu_delay_page_cache_fill_msec became slab_common.* and the documented
rcutree.* names are silently ignored.  Restore the prefix; the
slab_common.* names, never documented, stop working.

Fixes: bbe658d65802 ("mm/slab: Move kvfree_rcu() into SLAB")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 mm/slab_common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index 01c64ef661e7..3729aa7a6156 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1373,6 +1373,10 @@ void __init kvfree_rcu_init(void)
  * per-CPU. Object size is equal to one page. This value
  * can be changed at boot time.
  */
+/* These used to be rcutree parameters; keep their documented names. */
+#undef MODULE_PARAM_PREFIX
+#define MODULE_PARAM_PREFIX "rcutree."
+
 static int rcu_min_cached_objs = 5;
 module_param(rcu_min_cached_objs, int, 0444);
 

base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
-- 
2.43.0

