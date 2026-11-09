Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200001;
	b=MHWFBKCQi/dZGmBeX9Kv5+r2MC9v7OXjfBQWPpN6nlJJYmB7d3qGFkvqER5HRxL/8JIb
	 oGo0JwV6ZEum9hSgErloIprZYBq4BH9lJBgoUAIA6dCx5yqrwqX3OlC0q4fvlJU9l9b7w
	 qNMh0h1XsgLHLXuaBZ+gLsZgOfH/Xi5oFeIsavod8EIOje1yQYxx9wekY7Hqbj+bz5Zka
	 Qh3XJTjWnWR8PxDaUawqYqhYPWUvHu1nkfO2Q2KpUG7HPMAGsLg3NfoJJPs1SjiWgqn3j
	 87UbivQDHThf8UOgOE3+Yz1apw+duAmtIhocR9B6xQKbv5G0ZIE3YMRE4mZDk0cNcjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OVPWR8szOHg1B5tabceM6OrLtjIwXl1TZU2e2aNbhqg=;
	b=UMY9awjLQEEhrHdhlI8zBTfWeiuM8sD8HPq2wQa2R2B6w8SLPkkvEuq8vTN+YJ9EuVfX
	 RmqLA55eBV2stqt2Go81zDLG9q+cnX7RL9KsL0eewUTTVbxhvG1CQofABxPE2hkNXMiBR
	 0qyhJCMBA6tbPMzPxV+Sio8FzzIBJlF0pqLG893qmbRsX112iZadBGZQ23ET4ayxdmybh
	 gmS2jOyk91kKzUCeiHUE67S8EuXPxNJGlwqAoiYeD9ovbJkH3sKsi2X5CniI+VvRTK+zp
	 uOr6kYg8mqZPWMfom9TOe37gDSPC+SDzEac1roQyk13y+lgSkJiW4cnEiZ3ci1flo/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qY16YHLa;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F54606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8F54606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qY16YHLa
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36f6295304dso516902eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200000; x=1794804800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVPWR8szOHg1B5tabceM6OrLtjIwXl1TZU2e2aNbhqg=;
        b=qY16YHLaYcsSGtQaIHBGRxDeitfflTbWSp5Fg/cztpz7NzD9mnVKzqH1b5OUQZa8aX
         69S1+iA33pi9iwO6mVSLtiRWYlwek60/xHCieXiR84UowCyP84KsBIqoW+YV6Rj4xf3F
         zJYu4QTJ/iDEHLq3MxUw+pcnhP6hGsx7tKN+ua+TprgS1T7F6m6VkDk64IvrxT+nnT/y
         Lz+IRCAK8dMgqR5zf1Hfgm510Cuur0f8/CO1+3iKBrzTdilakBAsGtJ0xJNXqTYcSRzJ
         pyrr5t0uoA728okiY8D7sUXje4KiXpgR8eJNE5vhSUvbJ7FVIJPpg+SHrxpdRfVYLfVf
         +oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200000; x=1794804800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVPWR8szOHg1B5tabceM6OrLtjIwXl1TZU2e2aNbhqg=;
        b=iJh2rmRI6agtUF+SiidJXPviMynHGHOGnO7QnmIuhonBbdMtufqnef8l0kMUuAxIIv
         jhzJ/+0PPuUFdh+U9TAk5KTNUHa3bwVJX7l0VxOFViR8LENbNrqcjH2BgmW2tu2SST+n
         Sze24yxqnh2DD/A8Cn/MCUyeFx2qE79otdYoZTGs/yW8LDvHtDc4ODgew9ExOz0NyHnR
         J7Kva3tfUf9JEa4akurMHAtX2UwK0H10OibJ1fsiP/o+BhMTJZoAnAfKbpXG6HlH0kpi
         ot/TIfzY2bk/qe+q8ahUdYwz5CBR00VVKLyPbS6xH6p3it8/2nfxLserVKCLZA/KeOKT
         lQ4g==
X-Forwarded-Encrypted: i=1; AL+hErH2K9dB3LPpsJBhsnYEDvJFMY2jpA8O4SfHIga/f5sImslfocaCuS0rHQRrZPz5w7KjWtCmoIrdJvWTTBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BplFI66qfc8mdYDyOpRQM32iE0BIebaIbZCFLFki0Lu4k0JiE
	mRgaHBclVfxVGh0QvuU+wD63+GUMV/1OjiNbbzgOg1qE988XBfUIjqwJ
X-Gm-Gg: AYBFou04vBPNMAmnrdfPPbDi/f248RjdeXOh5ieOZluLcBNzXIPobmI/iVc7Y7P6l2j
	x9AQoGSU9O7Cu4lyq5Az0/H/s14ZFgZ9s3ntsT9gNUsYKB+rjzJZqwEzvYx0KLBsnl79vm09kCG
	2Q2yoNae64x3EaEUSz/8S89ehI3rf7h2hFwuYDC8rweYhMJDM2AavUrL5YiLnfeTCisM6chIAVg
	OFJPvS2QE862c9ZV7uz6z2pGssHQkL0Sgfn2FMibfYrT3XptQ1q/3KEo9Q+3sqvZgM0sy0+NJuC
	FERgCg2FT12Pu3I1FQTm33BkbkTfNqPwNOoPPkjahVM1nSnPGvP+OLBZeOpYeEoC4pDT+CCls1Q
	gYXNpymzaExdOMqJqo1p2qWmkWt+J5jdvbSU2QhAXNvWweWSF2i7HzKRswi1JOlOZ3nbKtoMMdX
	Q35GxYrBGN4BTjJhwLvvocDgT3iBw91++RL+Jan3yW0qOAPZln/B7YPsBMnpXYvQ1EntYuqNfPm
	k4m5khVsasMk83ZM9mo9ZevmjWa3flLVxFyClgZQNu1D9nWGA/cuBCgxjX1FLRaJ+oE0CriPzLh
	/raKrwfe2ryHdFYFSHKNT3X8dbvRmLD/yj7BvBQDTPKS91cKGFxV25TZN24YdcKpsSMaUA==
X-Received: by 2002:a05:701b:2506:b0:176:a225:e364 with SMTP id a92af1059eb24-1b39febea9emr4982230c88.35.1794199999858;
        Sun, 08 Nov 2026 20:53:19 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8838sm8409707c88.8.2026.11.08.20.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:53:19 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] media: mgb4: cancel err_work on teardown to avoid use-after-free
Date: Mon,  9 Nov 2026 13:53:07 +0900
Message-ID: <20261109045307.1167784-1-hj351016@gmail.com>
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

The err IRQ handler (err_handler) schedules vindev->err_work
(signal_change), which dereferences vindev (vindev->mgbdev, vindev->vdev,
vindev->queue). mgb4_vin_free() disables and frees the err IRQ, so no new
err_work is scheduled, but it never cancels an err_work that was already
queued by the last interrupt before kfree(vindev). As err_work runs on
the system workqueue with no timing bound, it can execute after vindev is
freed, dereferencing freed memory -- a use-after-free.

Cancel err_work after the interrupts are freed (so it cannot be
re-queued) and before vindev is freed, mirroring the existing
cancel_work_sync(&vindev->dma_work) in stop_streaming().

Fixes: 0ab13674a9bd ("media: pci: mgb4: Added Digiteq Automotive MGB4 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/media/pci/mgb4/mgb4_vin.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index b247854..64b7a9b 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -1068,6 +1068,8 @@ void mgb4_vin_free(struct mgb4_vin_dev *vindev)
 	free_irq(vin_irq, vindev);
 	free_irq(err_irq, vindev);
 
+	cancel_work_sync(&vindev->err_work);
+
 	device_remove_groups(&vindev->vdev.dev, module_groups(vindev->mgbdev));
 
 	mgb4_i2c_free(&vindev->deser);
-- 
2.43.0

