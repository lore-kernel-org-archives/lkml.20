Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785693;
	b=NOYR1FNZXUvy1fYykvQKOwwMbxa40UoQFfHyYIQ2iWRNxcsSbaQUOAlt5kdNRxMAKIe+
	 PqHaTCHV+C0FvbCe2WSf7/GuIUPTfKaHxOrNOAFAIQWBr/qb5AhSvZsFtbFOTywUuMw/Y
	 jBn7JC/Od54uaN/SGJr6ZlK2r6rMHUHmooJtE9P/JlOl5oJJ0K0GPmuHcRldlkhbL1KSG
	 5GwlRzdBNX8U4+CiUxW+PB+qMOONRUMSEtFxB+M7oVC13P4E+XvhK9DePHCRvMEIyDjWe
	 dn9nnQ2abZTVj6dh+DhpIKY8Nk+m8ylfLHOzVNoGp+ABPbCRTTQcr0L15PnRjrWHbRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=csEO5ITGieiYfLlRHach8Sl5I2GDEIKt9+RVcncVde0=;
	b=aU5a8WPY33ynM1VcnK2IehMSNt/PevPOeuS/RLJZsUCvNuWNk1B+4lfGUHdJhv9dxaBU
	 1pk9JyadwZqoMcLLm4cNDCVDWvzFMWeIJVMf7it0u4mOqMn7PsmI756vxSRUMdzNqgw5R
	 53gofqkI3hUbCT24RSYv41SKRmFPLRBZfTGVvLG16LGh50NKaVZMkoBkSvNWcy+P4F/JZ
	 6/3ynuPg6h1n1pO5PFIsA7e0T60Ufs+2Dn5zzx1GcGkMmTLxVFV3VjFVir3Aj2jqTnTJX
	 iP8+pzmKbRWKwUFAxBdC6p8BYtNt6CGopF5NOT3PRk+V+0BRoiOqD0gaqYEsGDbpzQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srYIPxVn;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB80606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB80606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srYIPxVn
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so995270eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785692; x=1794390492; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csEO5ITGieiYfLlRHach8Sl5I2GDEIKt9+RVcncVde0=;
        b=srYIPxVn1p35OZGnV591eyvW5rxMAeWP3IoKZavPAoLLTkB36/TTZt9M6JWsHiHN9Y
         Z3v/H38GN4NHtRy5cMC1aDVPFtY69ZbYjGlKwxk6WWq2FBoVC5hxWa6P4mzxYWHK1NqL
         7mHN9tUseuPrBWxoV6lgrBnkjviN/VGEkO0cyEN4uOBBVb7tf1fYXu7FcrkbN8atxvuq
         tbhgzBYvYelmTm9M8cl3q0bWf1p7VeYk1uSOnNeDQDXlyTvAWY6ZMyO47PD53n9doqMh
         KDk2NIMkhZBxlQA9aIn2XF6pnmIZp/zc15jE+8b4PDqXw5TZIBvL/pdL8HJLRinZvV55
         tc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785692; x=1794390492;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=csEO5ITGieiYfLlRHach8Sl5I2GDEIKt9+RVcncVde0=;
        b=nDZA7xGu6OitPwbattd+1KhAc79uqjXCgm+fhC9Z8oZP69Q/SvUB/FljsnOjf5fqfF
         Rrx1M+Nc/wo3xSRrIHOqwnNQjcMQ9ruJshm54UakXOnFy+7EHmkfIlb7VVljYs3kOI8+
         zgaluhZpRQZOuxQXbKfS87Cmghb/iV49KugUA0MNM3GKee+iqMoNI3FvxUGnQ7fFPyDM
         XArJwIil13KexKoVzYorUfLP30D7Kw5hUYZ7gkZM903M0epCViKsMEG+b5MRcMGTO0MP
         kx9LnpiKJotaQcVi6gFHYntyvsNZUeMtTuvXVV6PH+g5xDyk2SDOMrJE8iJfJsc7b+rY
         63YQ==
X-Forwarded-Encrypted: i=1; AKwUvBybrj/nt7DbZuU/bvefpUEL9dz761jXZB/b9+Hs8w5OMRVdDo2Pio4DCERMmm6yq/xWfzl6uP/rwPIaPYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N+1/R5e6ogUFi5V4k9c8lvJcsGYcaV5j+iYQpIvx7Rz2yWXO3
	td1bm0rQnNOawKiN0ABVAz4FEhCs5sLXGAeNk5u9yh9aoPDBXI9LC9600SfXYEYB/F4YBEEp
X-Gm-Gg: AYBFou1yLlZgOm4SytgtHtIahWie3EScNsvOySm4rogUYlqNcQ/yGP+tIFmEhHlLTyj
	Ur6qOue7mTBZdkuEqdYp/tU7j0JD1qIbnvGFr0AzBdhsS5ffIcVvbNZwGlSi9/ZGsPDDEMagFsh
	Aa55di6ajWpFvSBIeMWREgaRXkUltZpeymcBOHOdYuRZiwEhmUZ1n8TyouR5nXqx/5qLbkiZnTW
	C+WiLyzWcfyR/wsEWSvAwBoLQX05y3sxTc3rrvmorpTIMD1pWtSieKVC4t7l1j9/91i1ahpVE9G
	UAYCbA3R9/vext9KjzrdFnuRRQLv5mYGTsw3+bnOvWpY7yYhybyr8lAYzwsf2Kftg1+wyaQR/vm
	BjeNVrVJzvBELoOYSnDrrwhpK0zW7IhUhVkCj3/Zo25iDXtNr91Nm10L80crddLureoI7PMadqo
	oeL+jMaTJTGGm06rZvNnQdWufJqMO+nvDUS8t+rPmA+ImqQvgnSMPB8bjpNRaSj6t+4SidqDp3g
	WxTDQ0sjvjWMUKe2DsnNna+5nLeQZNfsq2HZetdKT+6grAGp946AYao+nZBZrfRUIRKbPnkaoHx
	6G0noBSeF00woogupzbZ9OPBErcbtqOC84kqceChzECRLtKOWiNdrJ6ft+ul5youhxk1
X-Received: by 2002:a05:7300:a98f:b0:360:8596:657d with SMTP id 5a478bee46e88-36a42401568mr33706705eec.32.1793785691546;
        Wed, 04 Nov 2026 01:48:11 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36d34d5960esm3323400eec.5.2026.11.04.01.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:48:11 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:47:54 +0800
Subject: [PATCH] power: supply: bq24190: stop IRQ and work before supply
 removal
Message-ID: <179378567491.72692.9015711605062239156@gmail.com>
To: sre@kernel.org
Cc: johannes.goede@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

bq24190_remove() unregisters its power supplies while a managed IRQ
handler and input_current_limit_work may still access them. The
managed IRQ is only released after remove() returns, so stopping the
supplies first leaves a window for a callback to use freed memory.

Release and synchronize the IRQ before unregistering the supplies,
and cancel the delayed current-limit work. Cancel the work once more
after unregistering to drain any instance requeued by an in-flight
power-supply callback.

A KASAN test with a simulated I2C device and the in-tree charger
driver reproduced the race during removal. The same test completed
without the use-after-free after the change.

Fixes: 4f73a52df7d28278 ("power: supply: bq24190: Avoid rescheduling after cancelling work")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/power/supply/bq24190_charger.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/power/supply/bq24190_charger.c b/drivers/power/supply/bq24190_charger.c
index 7a5867dd74c23..fd0ea5385f0dd 100644
--- a/drivers/power/supply/bq24190_charger.c
+++ b/drivers/power/supply/bq24190_charger.c
@@ -2265,9 +2265,24 @@ static void bq24190_remove(struct i2c_client *client)
 		dev_warn(bdi->dev, "pm_runtime_get failed: %i\n", error);
 
 	bq24190_register_reset(bdi);
+
+	/*
+	 * The IRQ handler and the input current limit work both access the
+	 * power supplies. Stop them before the supplies are unregistered
+	 * and freed below: the devm cleanup only runs after .remove() has
+	 * returned. The second cancel catches work re-queued by an
+	 * external_power_changed() callback which was still running while
+	 * the supplies were unregistered (the work has a 300 ms delay).
+	 */
+	devm_free_irq(bdi->dev, client->irq, bdi);
+	cancel_delayed_work_sync(&bdi->input_current_limit_work);
+
 	if (bdi->battery)
 		power_supply_unregister(bdi->battery);
 	power_supply_unregister(bdi->charger);
+
+	cancel_delayed_work_sync(&bdi->input_current_limit_work);
+
 	if (error >= 0)
 		pm_runtime_put_sync(bdi->dev);
 	pm_runtime_dont_use_autosuspend(bdi->dev);
-- 
2.34.1

