Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768480;
	b=evo5GTqV1wfnX8VQDSQeM086WHL3qVdgt2ZGtt76ktPEm2P5OX3X1Z7q3YHAdYMf6fMj
	 Ngw+++zU2fAzxqlThsUdaq8qdOTuqqSwq22u20ctTBuaZOc0ZNV06awcktqseq0Gmx+5E
	 IPrPOUk+jytiLbrdwvcxRS4effNSNpgDQk6otZGcKR8QsVtDcQVi55RLbM61p/nAAkiW5
	 +E2RzAuxVDz9MvRrBdg8V3X6/dX6mQVPpmAM/IFPOlZZl9nJN3vsWxQKiqFDIH5YEwlYs
	 L6DZJ7Q12bMl9Bz1p73v5TfnK0JL/YWqonLHLGYIMWMwhKNi1onuH9p7z4BRJ7V3W9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8L5S1yEMn1GLRLY49CtHKitz++JkkbJAD3VmPGekKZM=;
	b=1JjuxnL822AwdazBjJbYtt04tK/L4DFq44FGPBuQCfNSv8SdLB7SgwNydFhoYt7KgjEA
	 Auc1lLsmaBKP8WHgCBq6MyOsXLjBDV6ZHMPdveVgZgpBXmbxmSUk5aZSBQS0h9ZBkxh+0
	 4fENJYjIEYfInDHeOFQHdFXvj13kErV+oXZQKl/LLayHIE8GOMVt6xfn+LUyW9aFyFqda
	 8kSzoW2YUgunCQf2zBBLirGtMoEOwv1RSkoMC3PtVQweGXcgF1q5BO8qNsFbmkj8naUHV
	 UQ3AY/ykOA+jytbnalEzD5IIqCOsmcQv6Uc4DW4aIrkliLp85ZQND20LD82U6jZOxDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kwzqg+Vp;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDCC606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCDCC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kwzqg+Vp
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35f036b17easo1229624eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768479; x=1793373279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8L5S1yEMn1GLRLY49CtHKitz++JkkbJAD3VmPGekKZM=;
        b=kwzqg+Vp+SRoKXLl8TwTxTZEG8y7zSr2f8CNZAWuWIcU/ZrPjLE0OP13pP8YwdyzdQ
         cepCKiyCJk/Mgq8BdeDMjp7uOw0Snsh42HAOcoLIH0y465q1/ZDO6PoJB5aNYZE06hqr
         Gb/RZoEbrruMA/LU6G3NaWbN6td2RG4j8hErqIgYskRaL3YCEo0mgP7YvgGWn33RUdxF
         jb2XPnmOoL7WK7a3N8t0jcNHNETSYkTcFeKL0FrU7uPhtCnJBDJJEMmhNv/tV/5n/BEF
         ilMKgiAO2ZfFO1NhbK1GfmV7T1jSBbjt/MQUbF14HgaWS1qf9NMRMc9K4HNvXyFD/5gT
         0EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768479; x=1793373279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8L5S1yEMn1GLRLY49CtHKitz++JkkbJAD3VmPGekKZM=;
        b=NQmE4XqmWoRohoPq2vq3HWw4h3aL+KkpkgXbfHP/QHHUoJ1czg7rKNthPNFmGrDD6T
         wA/uotsMpKEjgmoIEurkfcHy0hPXykfhLpzMFP0HelYKLtzgTXpDRqk1XFNHRneZrLLd
         /hHdXpFjLt6Vnt88s269OXivvoob7S6HZVM2YUHN+3EeUYKm1OXUaoNNaNOcHFcbLL/H
         tJtn1aJC9PX8PDTFu8a6nbdQ9SsySvumLPuZlDms5NckSZfUiWdybAukdQ7oO2Vi4VUu
         mhf/or8yGppKCw1ktuJ38yXeT4FsPhTld0Ce/wDtuKRVvyx7xH5bSIqYanRnFbnpXvcq
         8BCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzynpJ7A4p90EdIUZB6KKvJEtUR8R8ZKgTTXWpvdTS9ev5HLg1629O73Rd5DikXKAr5ex7IzwhIEut2cDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE8li5WNfyxdl+KBspeJjsEELeCMVZF1uP3VQClrZoxVeY76zD
	ebNY8QOztsPXDapnXw9Lw6xsf5aDk9pxvz6sadkJybVK75Z0I37na6OY
X-Gm-Gg: AYBFou0CTC8XTu9trt0tJeHzRgvIo89eKM7/zMkDb/ugHL40aMh6+jkt8KZ9YWUYd2x
	2jFztQDQLJ8bI06CJ5M41BXfgFCBZAKjDTf9xAPF+8ESdwg5dG9ApQlyevxnn1UNYbjlqXpUSVr
	fmSULaRaZbaUL/tAjBfR9OYdWyZHI3TgkwFYdadX6vu9NARQ9K43Qr2wiFRBQwiPlxlbs96X548
	VsDWJy03oBUuLD0FGHLjRtzqxh1tY5mNjRUnI0LKJed8ZNllpXDRSFF6DH9zPx6rLr6gng6cZEY
	4MWEi0cRaD1O+q0PULFFXF8ftDuwuX9jAT61ik2NP+CJENJxNwCYZZwkMmmfAgxgpr/l2v4z8MI
	JAh5W38AopE8UybifrTgB46xEzl/mdN+asxlCx2xADilnDkgGc9iLJQxZ27BriJ6JOh0jhWqSXJ
	Oi9UVViNqE3e0gfiz+SMZAUJkellSxTS8xOvs4DnXfmGkkpqDXqAJoSEUqefowq38ge0ltm/jhW
	7I7uXDvvuWpiVs+qWNAp0ODVYNQFZmdlco9x6TXRxCJNf13AJmUgh2kUcUKCE2ugkD5wyTEiaI+
	bzFJvEchVI5OVVKW
X-Received: by 2002:a05:7301:77ca:b0:35c:8abb:b4ae with SMTP id 5a478bee46e88-369d97ecd90mr3030080eec.25.1792768478593;
        Fri, 23 Oct 2026 08:14:38 -0700 (PDT)
Received: from localhost ([220.196.228.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e6db0d87sm483974eec.4.2026.10.23.08.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:14:38 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Liang Hao <haohlliang@gmail.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] gpio: dwapb: Use gpiolib irq_set_affinity helper
Date: Fri, 23 Oct 2026 23:11:05 +0800
Message-ID: <20261023151209.58772-3-haohlliang@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023151209.58772-1-haohlliang@gmail.com>
References: <20261023151209.58772-1-haohlliang@gmail.com>
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

Wire GPIOCHIP_IRQ_AFFINITY_HELPERS into dwapb_irq_chip.

Signed-off-by: Liang Hao <haohlliang@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index aa7c08e60707..9e63c3ecb5b4 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -412,6 +412,7 @@ static const struct irq_chip dwapb_irq_chip = {
 	.irq_enable	= dwapb_irq_enable,
 	.irq_disable	= dwapb_irq_disable,
 	.irq_set_wake	= pm_sleep_ptr(dwapb_irq_set_wake),
+	GPIOCHIP_IRQ_AFFINITY_HELPERS,
 	.flags		= IRQCHIP_IMMUTABLE,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
-- 
2.54.0 (Apple Git-157)

