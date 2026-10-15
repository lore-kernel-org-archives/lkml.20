Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288F63E1231
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792107225; cv=none; b=UdiBAoMkIXhsHoHy4lEkPHUU1rOsqptCDWhqjo1sljt6zjaAOo8KMt0cFCb1NkPbePe2NsVkXkEIc3Fq6xP5EccK3gi9Sr4X63ixNXXTdDrkEBDUInMlDo/J4KWpIbGZp2ret2tCCMgXFfW1tM4kQQC9OlTsG2ym/mVglG7dsTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792107225; c=relaxed/simple;
	bh=GrTN2b5PpfqmbfLLMqSYA4B6Q1Ro+NBdw8xoIri7aK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uTLUg0VtGxqFn0hh2cMJL5qoBb3hNncIJAHRHEZsgVaTEumQ6FuMGQ1GzJrMQJpi9P5D4o25TLeXTfeqJMzvlvuxtpWhLZ7/41WtgVoGa3aQf5HwjFp2lVt9ZOuaAW20FdkDvZAK0CqyQrKdPcWh5tB8hROijq3z5PJSWZRLLPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuJwfZa+; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuJwfZa+"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6e560e00a86so4055414eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792107221; x=1792712021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOGTVagpmg3SkovNg8gY9NJcdR0snicKiJ3IvwwYIZg=;
        b=BuJwfZa+frL9anoe1a/YGLllVJgn0irp7JXNwT/GqJa2xxm5jLJbQRK40MzM4/gKwt
         Wn+BDuWoNXAmyWouZMPgqqfKaqFpiBIsr0fWgVkqeMJXlCkgYhUBmzCXG6wlazTyjm0+
         hKyfs7HJDjYFOYqwm0VOmIKooUMR2e2HSdXVbiGG8keil9tWw4bNW1PmdLZZe7hWmWfx
         DaGNURWOSqNCLFD4ZdR78oJdxTDv84XLJ07EfAnn6n1UMcnrHsZT65B5W3zx270EvIDJ
         /MEtntWBw+H6wocoC+lOjQqdhmo8sn4AiqCIxExT++wyfbSYp0/AyFD536TYxi5M9X1d
         e8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792107221; x=1792712021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOGTVagpmg3SkovNg8gY9NJcdR0snicKiJ3IvwwYIZg=;
        b=pE0qdzi4d5dNdhrAuOO5BHIt/GzvUze21AHU0Bj9WDIQUEcGfJOitNPLRRSJvzsvDB
         2cqPmD6n2gyqQaKcGt+46bUYRwHXjkdHBmn+qJR+wP7YS668ImqWTPJaDnNKc0G3MJGR
         PNXGI0nx21duinq5UsZWyWP22JRk37a0c8nJOYEusB4aGA/Ca4WiQfoQAcg3RVJGTstn
         m07ip2md7tUBmYP4/O4diOw40a24nmfD3fpLzt0EQrU2+xqW5ixJh4Yj/FJpprXW1n/i
         ARmHzeLhOjXc7ykyjsZyXMm/oDNIFNSigBCzDAjE89J0lIX4SnkjYHrcjcJ2i0AevCeU
         7meA==
X-Forwarded-Encrypted: i=1; AKwUvBxlYjJDmyWHXs7Bi5GarNBScF9ip5zViWIDBsgi//vy8izDdYmbxLJYSP8ociwz3zCnjGypcZj05O6/1Kc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJny9aaOBJXEWdamqOvitlodMUNKV/gfYi17UOmFnVk5JKSi/fm
	2/T8TsxgdSn5LdWvPatgr8LsPyvGaexm3PrFacitQnjTjZrHKe/TwPAz
X-Gm-Gg: AYBFou1HXJNVOdfojDhYJMRf3PU8BZjHbGwjeNsd0nK/512PJldCz25ZDWMxy1zhm77
	Ip+SWLw0YT0Rf+7O6vJriFTpKtuX4FO2/4HzRtCjWIeP63qUjRmDJZUegTOv9+kATF0xVym2IdD
	6hh5d2fJ6243ErN6/JVwhzgj+kUpqLGeyduqw10NM7dPhumN2ebxle/uDAaR9w/v/P1C0De1fON
	9Ag4EHgzF0DALjhOnQLhAGQa5ZTc5uvFx+yxTgKmF8MT3Uslf1jooMhGesjYJIWuE9Ii4L0Hg6T
	tuuNDUSTOeFEsvDUVYzj6Ih6RVAK6sXMxMSE0EEjKVEZvG770NNk1RXDJjURTUM60dgmkH9Fv3R
	e7lEyeaQTsjlyxjSlulxn2gqwohIRuJce/F0CY/xTJQ9Wk4v8P3maLQAZB+Fz+zWdn91SejPxJ9
	ZfgDRxhbLeyQe3ZRu4Gq5v9VZt/1XidzawuRyNVXaQh5pV/rn9WI9S7/QKr7g3MoFahRST69zSg
	ReoKtBUmRTqJ8qkhVLj2eVb6Xszba9FZs55w76uKtu5/dc/RHmnjzV4FpetZQbzsgbZP6Q0q50G
	/cSkAjB5fbIixNuKCq4re0ZhCjowfmDFRd0jeIrTB/CEJQ3wQI8AG5oKmqTU+wDxw5UyP+8kdrz
	IpxtIg1a0TFru1LqQfdWGqfa1qhB3C8ml
X-Received: by 2002:a4a:e907:0:b0:6be:1570:73b6 with SMTP id 006d021491bc7-6ef0e9dac96mr13517324eaf.20.1792107221207;
        Thu, 15 Oct 2026 16:33:41 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70188bd9ecdsm525519eaf.2.2026.10.15.16.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:33:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 17:33:32 -0600
Subject: [PATCH net v4 2/5] ptp: unwind partially completed virtual clock
 creation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-ptp-vclock-sampling-v4-2-cba6ffc8ceb6@gmail.com>
References: <20261015-ptp-vclock-sampling-v4-0-cba6ffc8ceb6@gmail.com>
In-Reply-To: <20261015-ptp-vclock-sampling-v4-0-cba6ffc8ceb6@gmail.com>
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Yangbo Lu <yangbo.lu@nxp.com>, 
 Miroslav Lichvar <mlichvar@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

n_vclocks_store() publishes the new clock count only after every child
has been registered. If a later registration fails, it returns without
unregistering the children already created by that request. Those clocks
are left out of n_vclocks, and a subsequent request can overwrite their
index entries without removing them.

Unregister the newly created children in reverse order and clear their
index entries on failure. Leave the previously installed clocks and
their count unchanged. The n_vclocks mutex serializes this rollback with
other sysfs changes, and parent removal drains the store before walking
the children.

This was found by code inspection while adding initial PHC sample error
handling to virtual clock registration.

Fixes: 73f37068d540 ("ptp: support ptp physical/virtual clocks conversion")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/ptp/ptp_sysfs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index 53388b123198..fabc1c9b1752 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -225,7 +225,7 @@ static ssize_t n_vclocks_store(struct device *dev,
 		for (i = 0; i < num - ptp->n_vclocks; i++) {
 			vclock = ptp_vclock_register(ptp);
 			if (!vclock)
-				goto out;
+				goto err_register;
 
 			*(ptp->vclock_index + ptp->n_vclocks + i) =
 				vclock->clock->index;
@@ -257,6 +257,12 @@ static ssize_t n_vclocks_store(struct device *dev,
 	mutex_unlock(&ptp->n_vclocks_mux);
 
 	return count;
+err_register:
+	num = i;
+	if (num)
+		device_for_each_child_reverse(dev, &num, unregister_vclock);
+	for (num = 0; num < i; num++)
+		ptp->vclock_index[ptp->n_vclocks + num] = -1;
 out:
 	mutex_unlock(&ptp->n_vclocks_mux);
 	return err;

-- 
2.53.0

