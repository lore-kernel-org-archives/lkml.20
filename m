Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785719;
	b=28BVKnSunSoZnnEuxo8VVTHA0uzLOm2EFGlKp0F9+bYbFf+kcPCZPPkpGmRvEF3IoCCy
	 yDHNInzf1SZgsDZ10TltpC7g+XDWPTgVoTOiwFXz8spmyDejGsbNTIhuaaTIRImv5VJsM
	 qmr1LpUx/VSbfVjXUjxZ6Chi6E4TY7NqjvTp6+SS6KGrP/7gf/AuYdIp/p6MEr9sBjsV5
	 BUAvwHEJa1P7Fod68NZJFbcdhrkDZgXehxfB096joau+1ceH8R4B8+EbX9l6b7A2lj5Fh
	 agXLQmJ/KulBxS3N5Fj8TRcZJvlzBe+ozMBam1Lo9Mu3bXmnnNy28TgqQWavvWz+/SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=azQ1SapQOkMTrXIVwS9Kiv0631Om1FyCKkU6yXLN/6s=;
	b=VMP4LMEmezphVXo7aVnzlUwjjfb9KTxsdWH1R35UrsgkxW5SGQJKO0QJE6MRM499O/Vq
	 cDBxQphChvsnuWf8U9SXNWsiSAkLZyg+in9d6JN4bs3mRjyds4AJqZqh2R2U4QJSJjVhd
	 OaVvNJs9/eiMeXGwAo7DZA0mElY/dX2GltzgDT7aUwA8m2G38YwfuM5MLk/sIbCBEsFlH
	 kmXaPA75i5uSI3E7ir26p85zqW5jp7q8L/rZYZW4DEoG2QnVGPOR0JCLc5RrM1QP2NFMN
	 LdxxtNsSBdb+iTxKApx0nlNoXX2VVIsxjkAueURiDC2wjL9EzIkZ0VV/eJ+m/7QvhlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxCAiYFY;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5C4606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D5C4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxCAiYFY
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36661f953e4so614085eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785718; x=1794390518; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azQ1SapQOkMTrXIVwS9Kiv0631Om1FyCKkU6yXLN/6s=;
        b=xxCAiYFYAaooXcIt5iStjdV0AOVVoXi+yrnprNzY9+n33SYmsyTMbh0V/Rkh020Rem
         yqRqndlqZelv08FGrwvWrakHtnpq2D61txfmxzQrzbiOegjaMAFIzXU2herVwAx6wyzZ
         ea4UuRW5gLWLMiB1Em6FN3bUs1lyeukxs8dlXSgxmi4qyKev3tuGbkdTyXXkOP2kyT/5
         YTkeoqPg0CvUwBI3VGz+XKVUKpZGWTWLVBwYnkWqs85Q35hWM0Rug6hWo9axSGQrPGJ6
         07wzvRs15ycC8UMRK+dc549M4rbQUyhY4VWJyirzb189GguXIDlppc211Xr/lX6Ttm5C
         QnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785718; x=1794390518;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=azQ1SapQOkMTrXIVwS9Kiv0631Om1FyCKkU6yXLN/6s=;
        b=Atdlk35F8qzF9daaE/YYgHJ3ytAyMLE2k4hJaQrJnXSzzwFnf3tRYjKDmELkTF5pRj
         VNV4I4gqUw3ASLLFwT0W5hl2e2S9vB8FOCnODfKiSyYooiVPvFrScczkDJaGxGBQoI/I
         w+ipSKcUqf01uJNtLfz4rAaNWAUiwdA1OfEGpQOym0k89ZsBeMTlbQyE6UL0Hyr924fV
         rqLAZgjYTOPHfyUboGfXjJ4l0lpayj37ReS9j9orkIgE/xzbEmP8MBMoCF/EyZOBs+A8
         +g6mmM+DFrprH2iLaIJOr3Jz+CVKAamO9qmdrCTHQOsJ+ERrJlHDA/PRe1pGMksTK1+Y
         pI7A==
X-Forwarded-Encrypted: i=1; AKwUvBy5QdtqXIkcW1ZQqCWmJXNySLGkz1pu2l0F6Khbr1JLHPGZx6IR7tx4vXIBUdZzpMR6VaCp8QWibwAucV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b89ZW7uVB9pqfwK+8KFJ8if+LAAWYhJCidnp43Pyy9TiR5BRO
	RMFvttL2/dLU3qoeRAOW1M9EokxqCzZXXVTHQRZAUVfTibPIyEEifg3YkNMoYhIOIEFeJpae
X-Gm-Gg: AYBFou3mW6pEvJpoRt5BEBgcQVnPCAQP+tSjWZm5cjYCDescVPiELWwLsWYrRCySgAK
	TdA32QMZRve/DYOC9njRI4Hr8LlRJo1ep6QgPhZnOi0wehedCCXrUU1m95Xv1WopvRlVWDAMRzY
	SHDQZ/c6HR7naqZHvsHzsK+86aNM6tdj+2M339eySnrfwlQ5WlORMg75Q/1hSbWdH0vVOFf68Ho
	DNbQ/aQ6xA+mnnw4BMjTWU/Jiu9JZs5NujFlEPpcj1rmW9FDC/wbPpxKKqOjiWSChEamhzC3hB/
	g7yBincIQnxnUl4CdmerbcaPcUpXz5hnpkys9+WjiNDkda9D41GdryzeLiemMqQNQOSaAXKBnS2
	UQFoiFP2SYYjBd3ri6W6ko+oXOYeuw87BJAkk878JmO3r796rx19VVzkh4uOYU6ObNKqtv10Xr9
	JaraWO9EhuXU6RAxiyXR+JqAmFQTUE0kk+Dv2xOeTKrlZxVBk602HBElviitJ+0wZqvVV1JyUK7
	k0ZDBo6mMCbid/Ww4/Zy5D8uvVwLGM3sE9lCzKKFuB0DhuBMotDjMpWqo4THNIDKd3daRv8RE49
	XRXnSZwUbLiZvu/IHgRqRA/oDXxdua9XoaKXQoxKCTBVhGyJJi0qEGNBZMQ74nzfVWs=
X-Received: by 2002:a05:693c:2802:b0:36a:1008:5815 with SMTP id 5a478bee46e88-36a4220407bmr21577572eec.5.1793785718329;
        Wed, 04 Nov 2026 01:48:38 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm7255076eec.2.2026.11.04.01.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:48:37 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:48:24 +0800
Subject: [PATCH] pps: parport: release port claim before unregistering PPS
Message-ID: <179378570450.72941.3525412815403628312@gmail.com>
To: giometti@enneenne.com
Cc: akpm@linux-foundation.org, lasaine@lvk.cs.msu.su,
 linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

parport_detach() unregisters the PPS source before releasing the
parallel-port claim. Disabling interrupts does not necessarily drain
an interrupt handler already in progress, and the handler can still
reference the PPS source after it has been released.

Release the parport claim first. parport_release() synchronizes with
interrupt handlers using the parport claim lock, so the PPS source
remains valid until the existing handler has completed. Unregister
the PPS source only after the claim has been released.

A KASAN test using the actual pps_parport detach and interrupt paths
reproduced the use-after-free before the change and did not report
it under the same injected interleaving after the change.

Fixes: a10203c691eac ("pps: add parallel port PPS client")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/pps/clients/pps_parport.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pps/clients/pps_parport.c b/drivers/pps/clients/pps_parport.c
index f5af18bc2971a..8031446db8ada 100644
--- a/drivers/pps/clients/pps_parport.c
+++ b/drivers/pps/clients/pps_parport.c
@@ -209,8 +209,16 @@ static void parport_detach(struct parport *port)
 	device = pardev->private;
 
 	port->ops->disable_irq(port);
-	pps_unregister_source(device->pps);
+	/*
+	 * Release the port claim before unregistering the PPS source:
+	 * parport_release() takes cad_lock for writing, which drains any
+	 * in-flight interrupt handler (parport_generic_irq() calls our
+	 * irq_func under cad_lock for reading, touching device->pps).
+	 * With the old order the handler could still run after
+	 * pps_unregister_source() had freed the pps_device.
+	 */
 	parport_release(pardev);
+	pps_unregister_source(device->pps);
 	parport_unregister_device(pardev);
 	ida_free(&pps_client_index, device->index);
 	kfree(device);
-- 
2.34.1

