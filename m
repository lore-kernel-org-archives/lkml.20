Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777964;
	b=n8lnrbNuxcawa6Qc/vZ9hbQZe50Izhw3EMWZyNVnJWTYP9blADh4W5SXTAaB+e29BAay
	 OLT9rifLHitH5TGfz/dfHpMVsNCbiy+lZFuFYckhZrgZEbBKORvSMDmRNfzNhGv7dN7Q9
	 t/HTdB7Qk5+4xhGnxnchLAq0rO3B/pcszqMnqiAsebquIGP207AQp0R2zwc2UbBsVbhSf
	 OL57qpzCoN4VuXdg5/TMOk/F8xKPjXt2axT24U32gc5cbKGDiZp7Yv9vPIEX0hWQ4srfc
	 6Aj0Qye5KHv5C9VwSK2A9ImOV3ExleEtNJl/MRNydlxx80ep3M7nOjEL87AzadwUtNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=siWU9HM2qbRbWZV4CvMwdmGRzsKBMI32Ha2fsv+L+xE=;
	b=TvC1hCtuZo9jLdAABIRlpXrzxGh3GoGE5DyRFTRRf36KsNIIiousmAK84DT3m4+WRglN
	 yUM6FMXjdDedoFJeeRW43+y/8fSw49etiDsi6x/h6pGSyIe0gbKJJ9DncXgTbTWfX0NLh
	 yieqMwHaZTX9MLTjZH9kYCS7VTLrQHTwureIxylnwrNCW4KfOxdN0fY3BDW+BWkwg1BUy
	 xWwegJ4wBZM2OPitk2zRhyQxa0rt0TirNA/Yk4Q/4aDc5+n88HeZWouKrYxpcEm8Jlmme
	 MYUCMQMElCaP1B9owD87hq90kDC6oS5LxqVzeySDX0+c1Zgmjzi89Rl8VWdAxVOBGWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At4LbaYQ;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D15A606EE91
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D15A606EE91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At4LbaYQ
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso191740b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793777963; x=1794382763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siWU9HM2qbRbWZV4CvMwdmGRzsKBMI32Ha2fsv+L+xE=;
        b=At4LbaYQAeXdYiJeFFtgJLN7xypecI5bSn1fPH7MOMfUivowUxA/aw3ybq75wKzNhQ
         fCxhpYoTtBwL//aIUXN8ksH/+eyP+FW9b27uaZZZ/IAfujp8hSOi5EViow8TGiDqesHZ
         0RkaPpaY2CAK3gtg3wBOLNAEXi7tTI7E9ZK8KnbjImnA1ukjWf0PdizDpxXAUtom8A1q
         Z+0ZT7SN0X5U3Ygh3xby23DLPfCbFyHFi+WV+yWCfBsrMVfvgYEvMPO5NR1zAmQy2WSy
         kKrPsIDp/rIFVphRprqodjxZLll95ywot6zC+NRoaT12NdSwgoGcKHemx+5sUQwjc7Mk
         nt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777963; x=1794382763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=siWU9HM2qbRbWZV4CvMwdmGRzsKBMI32Ha2fsv+L+xE=;
        b=j4P/l8HaUEYpW5S7ZKlItVddcRm9BB5zQupPiueViM2JXUyyWrgUl6HZsF6wG7cobN
         9oThddN/UjUQrt2F4j6kNmzjbPHKQsZSMzAyO0IsjaJ/ySyQAGAUYpWKmqyKgmjqQ2a5
         3IGRqPw9dYdMJMXN3+AScs9ainhwUz8xAU7OtdRDCIHb+S03DODux6Xj2lFK8+NQj6ox
         WNlzfvO+gQljKbaXJPKZmRmgjZeS9oMlz2Z3ALInCG5dvSkX+mr60Z7Wm+d8ECfbkMjk
         kNBOV6veAtEAAD8KvZxeQulCrH4MSkr3RK6RWY5mLvs0Ph7dBzf5pevYsSYn9xDgD5le
         YT8g==
X-Forwarded-Encrypted: i=1; AKwUvBz2NhtOH7nnC1RBJuqwrc2A3/RTLaw4Cs55QaE5ezQ6tHOTgbuIOJF14rpHCTR2C8x0Zwy/miID/c/Gq0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LaXexag6d+fKlGR45qmR9e74CkDZ2kFIHYS8xjgWzaRoq9yN7
	wbbnnZAXD4dLYN2ZbARPS2tZIEzyVfFWgOas/STeDnKtgrcfE4VUHtyX
X-Gm-Gg: AYBFou0lAzGOpftlxpFtDJSjogjDk5HezjyXWdZoIdeZjJD9NQCF5M4GXTF7Pg2PKIP
	WpcZzFYF8gRMjAfYalreN3fTSi04Cq+d0gSXZG3HyO8b5DxA/R44bWP8iGVMF/vZvAhqdFVHwFS
	rlL3Jbqxb2PoXGBzSfEGW4SvOPyJLFujatcGHQ1ghOmWbEA27ocbtVaWIfNIjfix3m7fiTwZ4c6
	w6OFU9foxgRX6CxunfbroC7CymfjBmM9DbjN1OG4ytPn/a6goQn25Gze+3qLOse1CQt5jNeBk/x
	xK3X6NC7gUNqL34WAZVvQfOkrxuY8wdkxfh4jpvqklFeIDKkjo3f1PJcr7pujDvHtStl6rKNHCh
	USzQ5KIHNnF91c6jLVnRnOvXX4LqC/dogmJlk6/aYasSpQqr/vkVnBcvD+Q6OgEl6k11i1UC//s
	L5gPJt6y1Kt4fZp+HYW8BJcBwuR+OQjDfCEIhzg2LRV4/JhOxLd0hIgxZTfapNaiErmVIwFrtRa
	pkG9Wj2VAoswGbVSfrzOqtJLuBhlZJOvk2Tb99CF29jgZyl9QoIceOvXSUKJ0A+FHcyUEQKI+6J
	uf90Z6ZmQ6134/cX56mqXzkUAhAYariyx3hqDHTbmMf7VSaOYtzFRS2HITHOW8EPphLPURuX2ak
	GsDIBD9DLOdF2pMZSLAqAhVw=
X-Received: by 2002:a05:6a00:bd02:b0:89f:d620:226 with SMTP id d2e1a72fcca58-8a9bea66f1emr10716702b3a.24.1793777963298;
        Tue, 03 Nov 2026 23:39:23 -0800 (PST)
Received: from localhost ([103.109.144.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09af91d32sm543783b3a.25.2026.11.03.23.39.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 23:39:22 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Zhiqi Zhang <zhiqizhangg@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] bootconfig: Allow keys with the maximum supported depth
Date: Wed,  4 Nov 2026 15:37:41 +0800
Message-ID: <20261104073742.21202-2-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104073742.21202-1-zhiqizhangg@gmail.com>
References: <20261104073742.21202-1-zhiqizhangg@gmail.com>
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

xbc_verify_tree() accepts keys with XBC_DEPTH_MAX (16) components,
but xbc_node_compose_key_after() returns -ERANGE immediately after
storing the sixteenth component. It rejects the key before discovering
that there are no more ancestors to collect.

For example, a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p = value can be attached
to an initrd successfully. However, bootconfig -l stops listing and
prints "Failed to compose key -34". In the kernel, the same error
propagates through copy_xbc_key_value_list() during its length probe,
so proc_boot_config_init() returns before creating /proc/bootconfig.

Check the array capacity before storing the next component. This lets
exactly XBC_DEPTH_MAX components be composed while retaining the check
before any out-of-bounds store.

I found this issue while reviewing bootconfig's depth handling and used
OpenAI Codex to verify the failure and develop the fix. I reviewed the
change and wrote and ran the regression tests.

Fixes: 76db5a27a827 ("bootconfig: Add Extra Boot Config support")
Cc: stable@vger.kernel.org
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 lib/bootconfig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/bootconfig.c b/lib/bootconfig.c
index 819685d6c68d..a4aae9a9abca 100644
--- a/lib/bootconfig.c
+++ b/lib/bootconfig.c
@@ -428,9 +428,9 @@ int __init xbc_node_compose_key_after(struct xbc_node *root,
 		node = xbc_node_get_parent(node);
 
 	while (node && node != root) {
-		keys[depth++] = xbc_node_index(node);
 		if (depth == XBC_DEPTH_MAX)
 			return -ERANGE;
+		keys[depth++] = xbc_node_index(node);
 		node = xbc_node_get_parent(node);
 	}
 	if (!node && root)
-- 
2.54.0 (Apple Git-157)

