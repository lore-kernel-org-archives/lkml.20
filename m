Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF50379C34
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642130; cv=none; b=Dl2gWG0YrqEavuj8aM+fv+rjFphEy7Ohuu5CwIuGN5KXjnH2mA0iutV00Ea2dO4OBmvLXM8LHgfLLJMEsKTxudIrJ+Fjy97PtdJuiDrJ0HBZe4YR6nkgOhmtFPONz52xlwXwxHub1YPbtTTiQBTLvf9gn3+pArxpLOvTs5rM3qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642130; c=relaxed/simple;
	bh=v81aBt2o2xPhCiAmHllIBfNzG7LkO0LDXg8m7+xct+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jNm6jFoEq6Nn/4P7JNgdBfGAnlXQu4kAuSUE1852501cbG+wuZaXv4oj1ISNqBQFx2gRf6B4g/8IHF8Ji/8dZilr3thfZwxqvpEnZF9ZznOFF3EIoTJvlCX//hjHti1AXodAPmc2BjGidS1+XhrLJXYYM3+QA55NqDOxoxF0uSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OA6rSDEp; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OA6rSDEp"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9851592ada1so126066241.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642128; x=1792246928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v81aBt2o2xPhCiAmHllIBfNzG7LkO0LDXg8m7+xct+w=;
        b=OA6rSDEpsHTKvpWvOnLPBT8gNeaiGeX96o8D2F2jJTDrYwhKwVVSF7drbkciaNFMaL
         xxyWFzw0H65FI6J+n+6om60WG3liFWqS6pheXukIeBEnD/ah3IszGpYYk6B7hxzUD+Qe
         h5VmU8U6+mc2LIBTN3RerqReCrMsba7NuT+KD5JO1r4bk7tWmOYznmUXBiKGPH/uiQi0
         0VaurzKPyfzd7V+dl85Z/RnT2ji3N7WXN5DVO9ZvDlQpKPq4UxrfY2VKRl7soDHq97qs
         ikZ9/1KyWJyUlInnWgpl19sl5N/TW7ugFYPhqZQboWaCuygMMxGKtkz6KW0kZ/QCz5WY
         uuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642128; x=1792246928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v81aBt2o2xPhCiAmHllIBfNzG7LkO0LDXg8m7+xct+w=;
        b=YV5b7txyYQeT39Jba/rpnoVoK8h7drFEtEjyoTKSoJkYGNqtQwF3vvXff4VnjL7MoJ
         bfduYt+M90lMnhY++GQH22Mh1fwkmm5hAnDYgTwkQ6FO/8AKBCTFW477No28HM7z7bvu
         k69L+hrxYfrEclh053LHUK8VO76X7n98Um5bODzpcadXk9OZrridhd8F3mdQcmQ6Curx
         H5jtRtdVciVnrVT+vQal2a7WkUIIwWUzetkPZb893dIMX9KxDu1+ooENjsPXBESgADHK
         49SSPmXTE302SuFm2voTKO3hrjIC9PIxilOvXXNnnwO7Ah7vV6utpeqyZUYvmgw8AuwZ
         UQ7g==
X-Forwarded-Encrypted: i=1; AKwUvBy9Pl++a9gEq6pg3ZYW0Aa03asuLHTWj/J/n2yHASRl10es2FNOJlvsRXNMTBlaOu8ThaPoUyKEiBCtPfM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvfqFUpt7RDi9+6/yxJmFpO4Cx1A61ocRygB5a7X9EeYqHWTYW
	KHRPJJfierTxMrQn4ybS0kvi2WdmffkTRVf7QJjyx5pmdmHWRhWzvyY1UDZxggbiVDP3ZoPU
X-Gm-Gg: AYBFou08iwdD3Xa4pEYRUZVUV0E8PJWoSeF1szlX1hznxUiFieDUqwO0tcs/q9YWCyj
	JP9MPU3AYNGDQoO7hWfcN6V9jTiNhR1adL35HNQ5JhDad2voN50HEKXMPUqXsQzpzQ4n4OJ8uZS
	mv+7ZrGuO2RjazkEcx58adtDdSAOHQw+djqMchpsoP63Dmy4mRMpcpyeIv+GRZJmagZwEWGFyyc
	rhGU0YZf3ajm03ZNmAmyfIYs48RrpHs2HgmckwrrTwK7Cu+vpCvmKJ9Drl9tW1CZpWGP+iX447v
	Mp5n19uhmx38taLMYQf9ICBZOEpCISB9VIikpgLm299bTTQ/aRMFLKP014i/q5Rldh04gMwA/ve
	zH5peeN9JUfZSOGu/xro7Kuil/SHiMEbvyEIribjAhCRuX05PSHDk5WRsiLh/HNDHsWJZLmNhsW
	02w9K6Ge1gNHCycgpW6FeRc1W3KNKg260sY0dZ5PwO7ZnR9lJCWCWYJKs17HKmFvI=
X-Received: by 2002:a05:6102:4b19:b0:7c3:a175:b3a4 with SMTP id ada2fe7eead31-7cb373eab9bmr1315060137.36.1791642128304;
        Sat, 10 Oct 2026 07:22:08 -0700 (PDT)
Received: from beelink.. ([187.13.210.57])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f66f94sm3595530241.9.2026.10.10.07.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:22:08 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	gregkh@linuxfoundation.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	johan@kernel.org,
	make24@iscas.ac.cn,
	kees@kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] usb: gadget: lpc32xx_udc: cancel pullup work on remove
Date: Sat, 10 Oct 2026 11:21:54 -0300
Message-ID: <20261010142158.2644446-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928134158.117-1-getshell@seu.edu.cn>
References: <20260928134158.117-1-getshell@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 28, 2026 at 09:41:58PM +0800, Hongyan Xu wrote:
> Several device interrupts can queue pullup_job, whose callback accesses
> the UDC and its I2C transceiver. The IRQs are device-managed, so they
> remain registered throughout the driver remove callback, and no path
> drains work queued before the resources are released.

The use-after-free is real and the shape of the fix is right. The suspend
and resume interrupt paths both schedule_work(&udc->pullup_job), and the
device-managed IRQs stay live until after remove() returns, so disabling
the four IRQs before teardown and draining the work before
put_device(&udc->isp1301_i2c_client->dev) does close the window.

One side effect is worth reconsidering, though. remove() calls
pullup(udc, 0) right before the cancel. For a gadget that was enumerated
that reaches isp1301_pullup_enable(udc, 0, 0), which only defers the
actual transceiver write via schedule_work(); cancel_work_sync() then
discards that work before it runs, since the IRQs are already disabled and
nothing re-queues it. udc_disable() touches only the UDC core, not the
ISP1301, so the D+ pull-up is left asserted -- the explicit pullup(udc, 0)
ends up doing nothing on the common path and the device does not
electrically disconnect on removal.

Draining with flush_work() instead (or clearing the pull-up synchronously
before the cancel) would both close the use-after-free and keep the
disconnect: a job still queued runs with udc->pullup already 0, so it
performs the clear while the i2c client is still valid.

Thanks,
Aldo
