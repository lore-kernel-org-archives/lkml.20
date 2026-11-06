Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939756;
	b=YcLHPTbnTq2rfy8/fiDc7nQ/x/Wzq2TKzMwDQBcf/7RUGaukOm9z+nJZnlI/dRXT/hk/
	 OFda+LSlN5xU5tYjiga7fxfONfXZI59QgPGbM+BEqlepNFdC8n6gDLpFbM8A4AP6bGb9g
	 4q1CRrVbu9bPtP576Uom8W6mCtx4a8zAZParnTyswXm67Or2Y9+oNvoqxq78DoypeqK73
	 0cYNxStjq9vnJLVF/Lfm/0jp0m8f9Os02mJ3+CuS3u3zKvuNyJXt2DQe7tPxewFhIqx9C
	 jl+2HWhY9iXmedNLewADfBbkXm57O38aHN5RsiUPrA+u6phPOA49AEh6S6HY/E8hz4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rNfdsim6JmlWhi4wC/pPC/d/fJvMZLNKiWhCufGclNE=;
	b=ucc8bnu0WfJHGUxZm9BV83Ej7XxTUtrofK09uSiLX8GhqASTiwAD1Zb5vdeo1BDHGCh7
	 sQ46cUeEnif6scl6UMH+Fc1ph8Ru5S2oB6B42t4Nde8aGFsLJgc8ePrgbQuqmsxgdHWH7
	 WZc866i4DiO7/iQmtCmI8ZYNvBaAp/IKwsGnltMi5osDdGgOICXGlIy1uNwZC7DuohoKW
	 GhU6BbbB7Oo7IwQo7LaE8mUQN/9Z5m8kSHWPcKcnNwkdaTxfBZrwjJX1waQ2s3pwnYQeF
	 Br3RRfY+1t+nc5/nPKsmm5diCxR87RU/Qe/dBxJ2xY1Vz1tVRegSNW8CYKOIFMhWp5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTACDzCa;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E22606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E22606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTACDzCa
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so213857a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939755; x=1794544555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rNfdsim6JmlWhi4wC/pPC/d/fJvMZLNKiWhCufGclNE=;
        b=jTACDzCac2Ap7ipMOkR9opZR3ZLHb1GdpGAzbS1HvOMvEg5tVrS8wUsQerXPqikdk4
         GGSGOcvMtFx5P6BUdVbmmJ+fE8bx7nvB4cWaq3IBM8H5L9pf+P/yTiNmSx30YrHyprZH
         yIQhXlgpCILziLVViPSb48a7C5ALaBg+Pke59/L1DsYRXKvr6s/oEOQlKUUZabaXLbj3
         T7pLacqbE/JOmvHmTdN2yK8xA909tuOgTQ2FRdv3VFqBTPQQ7gPEkX7fGfO7g6iV5MZ3
         ZPkkJe45ldeZ1vbfOUKrWa56JvYCZn4qJsXXj88KR4jaJZHuL1oLfJwKkVWfTTZZE/zD
         TjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939755; x=1794544555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNfdsim6JmlWhi4wC/pPC/d/fJvMZLNKiWhCufGclNE=;
        b=ndx5CvW61YF3s0MELdEgXugEktj1QJNOgCLRnY/Jv5TdNpcg5yY4fB6M2yz9TsyPIJ
         KJA8OalJVQsuCpz0V7u5uBS1EZn9UxRTj8AdIcO5HH9AQCiv/qxzjQKRzU0ywOno2RQt
         iuPH1FzWnYtL+yc1Tl02lqGcj3lE3yLYYn93izI7atdJeD2d4Tqu3jfgcJFLOvgtvSNt
         RHbVx8NJs2/gcsjcXa/bVvo+8mgnesWtrxfXPDGR/KkhlDGkxvU1XB+tpJGYe7AfEH9V
         CKCA1niUG5R+3/xj63PzIKMC2JvXloqogGqtiT52Wd0zhSaS8HqdWxF7R2/tF/qj0Ia7
         jdFA==
X-Forwarded-Encrypted: i=1; AL+hErHrunxvvPVHKRph3oSVcBkDikWhzcggMwPqZ2VGpYhdlDyjPEx2qU9e5DwcwTUpV2haIthv2OEB8GIz/+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/P+vuevePzF99LMaZYIoiq3kALTRr5Vxx4aD7GIYR5dry19+o2
	VahZbIhZhVAsNdaILkLjbvnZlw9FNR5iaL92OEOMuV60wrrsJtYpiOg0LP8iynPY
X-Gm-Gg: AYBFou3ohGwLM0NzRNN2N/zItDRL8xjsEPJpB35Yo2vX5NRBoc0d5sIT4u7rIOmRgAP
	vKiXXKKXx/YEXYtaHDB16RY97SUuhWhHSpyY+P0qoKET92R7cXq3tBh8O0UiqX1EXFztwy2MezY
	hofb6NxKjS02kyM++YgAY9K0ndf5dTT2yqkIqE3lNKUOHwmIXw7KvNXyGSvT3BBAf8n41pgkgmc
	ZgkE5Dcs+cie7vJq7tyBcr5gEQ9y6PnIXf2MRmaGtS9omcl+vfM5DN/wVlydkuayRIIrC7T19vr
	gFJqwHfpFqmR5JiNYjYnsINlJll3XFHTGGb3E9e/Erja17mPnf+iHXldckqogX5sYtgxuza8wrE
	G8DhopRSo9SMdLJV8o3MSZqLRMXJR3FtqdhWIzb49QxwsqaZGb4365/iCzEezc4VybebsIPNpnC
	IRpUyYgPegCJgj+lHuU0rx010CLSyHEs0yaEWc5/4E40wM6NW9xn554sV0DTGt4q6fYyM3ZTtWe
	4BCF+ROSOQfgCS5UMrepx4IkahyrM4xAu5Mqoq/fv8CYOlmUoQkAoLT1fheAx+t0B8q+Uw9hLzz
	rA2V/uzNDMJlfZ7IixpRi02mjRD56oe74kdPGHcMJ2r85qMsSg==
X-Received: by 2002:a17:90b:33cc:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b0db6d37famr1221823a91.35.1793939755107;
        Thu, 05 Nov 2026 20:35:55 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7cb447esm1610110a91.17.2026.11.05.20.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:35:54 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] media: mgb4: cancel err_work before freeing the vin device
Date: Fri,  6 Nov 2026 13:35:41 +0900
Message-ID: <20261106043541.1902730-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

The input (vin) device schedules err_work (signal_change) from its error
interrupt handler err_handler(). On device removal, mgb4_vin_free() masks
and frees the error IRQ, but never drains err_work before kfree(vindev):

	xdma_disable_user_irq(vindev->mgbdev->xdev, err_irq);
	free_irq(vin_irq, vindev);
	free_irq(err_irq, vindev);
	...
	kfree(vindev);

free_irq() only synchronises against the IRQ handler itself; it does not
wait for a work item the handler has already queued on the system
workqueue. If an error interrupt fires shortly before removal, the queued
signal_change() work can run after vindev has been freed and dereferences
it (vindev->mgbdev->video, vindev->vdev, vindev->queue, vindev->timings),
causing a use-after-free.

Note the dma_work counterpart is already drained via cancel_work_sync() in
stop_streaming(); err_work has no corresponding cancel on any path. Add a
cancel_work_sync() for err_work in mgb4_vin_free(), placed after both IRQs
are freed so the handler can no longer re-queue the work.

Found by code review; not reproduced (requires the Digiteq MGB4 frame
grabber and an error interrupt racing device removal).

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/media/pci/mgb4/mgb4_vin.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -1068,6 +1068,8 @@ void mgb4_vin_free(struct mgb4_vin_dev *vindev)
 	free_irq(vin_irq, vindev);
 	free_irq(err_irq, vindev);

+	cancel_work_sync(&vindev->err_work);
+
 	device_remove_groups(&vindev->vdev.dev, module_groups(vindev->mgbdev));

 	mgb4_i2c_free(&vindev->deser);
