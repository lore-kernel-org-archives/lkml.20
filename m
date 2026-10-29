Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793301641;
	b=Ho31EQW1ZUigXa7gGB/vOlABdEXTp9/LYPUUnIWtU7UTDNvduTHoGFi4MhU8LWfd7RTf
	 Dz0oEYev+hU6SWIU7ifFUQTa05XlcMYDB6qeB5mV+NRncDkVbdLoxcvPHWJqj+S50CXT3
	 E1/EmH3l2z9unTc+R15prsm0gvPs9wTaQWq0maC8sy5+9tFL4S+639e0ZUdDNaxP62dPl
	 xiFSwlJhYZIzUtP/dQ8vzJDLaHNoqqpoYCS2K59QEbOaT480ROmrUw+WVYhDtKedA19+q
	 q8PdLj68rmH15wozCK/EIAMJ1wCkEO84qVoRNH+i95W+XVqx72P7V6NDHL2nadaov2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oo07AymxXKphZjVTkZm9UuDYPtSNG1/pfgaxaGNq8To=;
	b=b1cJ3ztL5ZUf7nPuHs4K+wPvYN8pvJKK/5u4gywhIqyF7LoyPAbDLRud61UJhynoHK51
	 YUSVXX9jBTuYXg2qgfrV6t0bbwshnwddb63Vqr+0q4OS3x7tF2dtNDWGWVT6SDp+0J6Ch
	 nkx1SeEj2QbjH61KSWZRcZ9EDXlu60s7zyQFn2hpg/idU5FJte4RQf2daxuqQwk6CQXBx
	 2vn+VMOEGnnShlGj7D08Evs426zycxUD+Iv9i3nsUxPoQKWPw04VzUdZEhNYdrZmNDtXs
	 9n3OJt2plJjssAJLd5j/I7GhrKfgdoImrcf9BBdYR5/InWB6ibIkWbZtLqHuLUGSNpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x97OqItx;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB019606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB019606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x97OqItx
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0d91601bdso9566397b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793301640; x=1793906440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oo07AymxXKphZjVTkZm9UuDYPtSNG1/pfgaxaGNq8To=;
        b=x97OqItxM0zTlU1SeqXVC4Vhbt/CfmrDOfg8uezTolPAJeuA8wroLbnXN26YCMiQBF
         Suk3OxZmp4X6FdOJfB38LR+WlWTiA4P8eRG7/ZyQmArInsG0aKLJ0GyM7qTaPc3vJuCq
         7Sonh1b5Gu7zlAHMta36NDBL+DmVu4X9QNZ/f9uVFY/K23cQk9+SxzvPbTlBN1RJ/axZ
         Fr6h/4LXhVC6uJb1ovaP56MOa1RoUHMzfuEo54lEDclSiNC3VPaRE+23cqVGRkvR1rAQ
         iyISuOthySarKzuajCYAggn5Ee7exS7sD6LEiQePbozzygzvfiQ2xd7KjRbzMCvszWxM
         sFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793301640; x=1793906440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oo07AymxXKphZjVTkZm9UuDYPtSNG1/pfgaxaGNq8To=;
        b=j4tZfjRi4z2ViyLd+v6vvGHLBhJDkw4foALk814StQQx+imtoH5aY5Zs+HTE0G3jms
         diJWiP1Ddye1GEXY7fC0pQa1AuztC/9NPY2vZ+znpMMEpvJTMnkjpcxNoemlw3hpyuXM
         esQ3igk3qKJGorYlQ2lyPD12q6ri8FURdFnX14KYciayBHROi236RNrFkYtJcYUnNDuK
         ihIl7Yrg6NxLfL6uTCJ9G7V5KDeBBcmYg2hzcwH1g+1JuKXPTmf3p1ku9oHBIZ2yooT1
         SiHlPsAX6joYlFugZQAt0iNL5353Q/iblVCkoTlOGBxAIiTz0VD+N6JMdU8VdwL4xYcw
         e6dw==
X-Forwarded-Encrypted: i=1; AKwUvBxufhjm6keR+OZzZ/a+W0r6O85BZG0Iu/q++mUnw/ofiymmOA1IPReEncJIYpvJ1eOYwZ2vsFsFb8t3mws=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD5NkQtKhgj6xb4nfzm5KpsEAUgNsNI1UlJdHR1AjmYlXATcrd
	fK2yQQvBTScfJpCf58oAgkOtAWzXjX1vePqS8xc0EupZa8q+vcCH0cJt
X-Gm-Gg: AYBFou1OFhAf3AgI5Qi0SxFj1ombY78aTo0D0ExiQn8mHLDZxLu3TIUdDKgxiC1VDNZ
	73uKIlus3yV1P5LV9MfsXgSeFd6AdTIOakdBgkSx+p2ABNFP56p2Ty7jgcMCE/oAbpAsp6Epoyx
	8e1S6IYmZVog+0AOubBVv7Rdm3tIMYX5niPpz2x/5TtMt7td8ozi8mrYoqtjf3hXJrr6DuC0fG+
	K49gV7Q0T0BkVClCkWaczES4mRYa4YKxLQt1zWlnzodiZwmkmPvjqEARICF0OBkzc7P3gYwTgP1
	Ok5U5QAVJ3hxQt7Zjp01n1ODOQCBss3cmtpZxBhG09c24E8FXxLReGkZvl0LBzzj+iG5oFcBFD+
	QxCtKTlzxTmO7iGHjERHn67lK+5a6mvza61qzO4627pcia3xBiE7w2dOj9nC4ByRajczq7qkv2o
	bZWRL3/jHVd5r9tiZzsHkWmP7g2OigpvWbvSX9qNyefe4PQjWWV9Ped5UP7TkaYyXrAnq+GDVtf
	DtgrrNXovD75NLVLmw6jPQoCiHUKzr0F8VRAb7LjhlOriPC1daI7JseCTQdyegHo3lN5l4JhK3c
	s1n4vDY179O9P54IbyAQloKBEPPY
X-Received: by 2002:a05:690e:4594:20b0:679:97d1:439e with SMTP id 956f58d0204a3-67ba4cc2978mr56192d50.2.1793301639027;
        Thu, 29 Oct 2026 12:20:39 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:4c::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba36dfbf9sm166228d50.2.2026.10.29.12.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:20:38 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kbusch@kernel.org,
	Alex Williamson <alex@shazbot.org>,
	kvm@vger.kernel.org,
	Nikita Vetoshkin <nikita.vetoshkin@gmail.com>
Subject: [PATCH v2 2/5] PCI/sysfs: Use user config accessors for bus number attributes
Date: Thu, 29 Oct 2026 12:20:26 -0700
Message-ID: <20261029192032.1325629-3-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029192032.1325629-1-thepacketgeek@gmail.com>
References: <20261029192032.1325629-1-thepacketgeek@gmail.com>
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

secondary_bus_number and subordinate_bus_number read config space with
pci_read_config_byte(). The kernel config accessors don't check
block_cfg_access, so a read that races with a reset goes to the device
mid-reset and can fail or return a bogus bus number.

Use pci_user_read_config_byte() instead, as the "config" attribute does,
so the read waits for any pci_cfg_access_lock() holder (e.g.
pci_reset_function()) to finish.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
Tested-by: Nikita Vetoshkin <nikita.vetoshkin@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 drivers/pci/pci-sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 6669e9ad5bd3..b37a285d717d 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -267,7 +267,7 @@ static ssize_t secondary_bus_number_show(struct device *dev,
 	int err;
 
 	pci_config_pm_runtime_get(pci_dev);
-	err = pci_read_config_byte(pci_dev, PCI_SECONDARY_BUS, &sec_bus);
+	err = pci_user_read_config_byte(pci_dev, PCI_SECONDARY_BUS, &sec_bus);
 	pci_config_pm_runtime_put(pci_dev);
 
 	if (err)
@@ -286,7 +286,7 @@ static ssize_t subordinate_bus_number_show(struct device *dev,
 	int err;
 
 	pci_config_pm_runtime_get(pci_dev);
-	err = pci_read_config_byte(pci_dev, PCI_SUBORDINATE_BUS, &sub_bus);
+	err = pci_user_read_config_byte(pci_dev, PCI_SUBORDINATE_BUS, &sub_bus);
 	pci_config_pm_runtime_put(pci_dev);
 
 	if (err)
-- 
2.53.0-Meta

