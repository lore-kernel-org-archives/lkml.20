Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89373CA4BC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032139; cv=none; b=ZmtTJGPCPPT+s2/YnfgZ18DGLopyxZfdurkVKfqX+cOmu26i8loj+a3IzJPcZs5K5pem52RZpV7LrGcx9LchKXQOk5QZgjyHoq+riKEdCHqDoL0ysS714s8oIWEYtplZ6hU0RQYHX5epSU1WSedZMXPbtau9guMRg888TXyO4iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032139; c=relaxed/simple;
	bh=1gnA8TGe9af5RJ6waDfAsYApcBrdbInaq4eInVQa1YI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEHO8uSNwv4yK2pdd9r75U5LbvEJzqlIjJHXqnfJXgq9u6VsEp/nmQh43l1gbkl9UJgYN/H3SsPFoPYRFxa+WV9Pbcz7BO9nlhA+VQ57ppmCXUfMwF/3fl2u5C456Une4GSwAllC0cUOfmZQ7vCR8xeYt8TE1/SOPbPgRGeBnQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxemTQS+; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxemTQS+"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cadeb7so357703085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790032137; x=1790636937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uil38kKcJdnxLESM2C/w42Vib+0WwToXVLrxxQmRKFM=;
        b=bxemTQS+2DFclC5/fsx+gHH1PG43tVu5KjOWk5bfXVu0elQhvWAV6v4FyLkUvnEnW4
         CiO016aTfsnenevBHUcYPc+WCSq8UJfwVpnd6ZwQEoRFzG5d86zvAf42aaHUSyTrsvP5
         3rssbewrN/HGWWyY/BuuKjZSk+w3jKL1z8ZlIaMt5yJcIrCDEJ3PABi58GSv0Cxt1AaR
         6hEJvauXXzGjcILnvNIt3Q8fAFFBBRevjnp7d4tKZMc91iOwx2D5ADl3Z8IV53GlE/CD
         gaVbWpu4FWXTQVVA0gpu5DdzSccolI4L3uJYbfGk15joVe7oIQKGOPK4MNbhm4Cu3+9j
         dhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032137; x=1790636937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uil38kKcJdnxLESM2C/w42Vib+0WwToXVLrxxQmRKFM=;
        b=hOCdsKKsqmUY/fhf2+eh3yuVpO5wF10oBUh6znckj1AJPynvepSQob5wLWRFAI5W0w
         PxfdoTZLYuF7e/KIsGzl74GFh7H4DS2f17H9RLYzta7Y9LXPjCUuK5m//ocYUnmBZ6ST
         n8NXWKMMQZ6t3C2o0CUqcv5JvN+sNsBnyGFH/hogrHf/UUiVyguZI4rkPjlJebiV2WwD
         yILmM1nQMI1j9fc5LaylloPNQYSADLZPC9ATctQ8p3JmaKdbWCFAYd59k6dyLdCytEya
         hkqBiKzZTq9env174uNescknMSyU36L0UkJxoXuvMQppy8pOMvrNxF60VJSHMs/z2enM
         Wxhg==
X-Forwarded-Encrypted: i=1; AKwUvBxb6yXlWbVDUhvwbqYTztUoSnyf7HTd5RNSSVJ4zewvzkU+OTC5qZ8zkq9Sr2YJNb34OY0YWCa7rXJ3qZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++kLJQTl5mEpTSwQEfc5MJA31dhhyrtajx/ogbUfVH8CpJyej6uE
	l7XJqPDT8Plx8yKz6moFj/fnjYxMjPdYvxlD3LkKYVgiGaaaWUZ+pGc=
X-Gm-Gg: AYBFou3Rrd6qEISR0EMXlbW7TmHWFfQe7j64A5g4oAI+K5B8yOZVjPVr9mUKoRpdL/7
	181CtxAHSZWwr4auhJdS7ShyoB79qtRDgviD6RA8fkkcz6EnmAwwt/Tltvw0tHeRVJAGetgxOSL
	DvHJPZlGP3XjrrYairRC5aiC9HF5BC77MVdXhXCC3QnbE3UNbhblWAT8dSD1qElnGMbs49ps+7H
	qC0O9txQdaGPfpNYlG1VXDe9BHHoAYqltwRLkCIv/0ys6Zhou6sRVVMqW1QGhK3B92kp/0fbEpk
	dUPnZ2rRUQrhKhx8EBiNmJ4MNKQorfY3NUwQ6era92JBVAwJe1AizWCXz+3W37xkp+DyEULNduv
	7UtqWjsugAA1zWN3lVRfG4Ui4D2qS0px0luEhrCm8LMf2awEP4pcnsFSRF3uMlX+RwCtE+RNWir
	JGGkPGZBeri6GLdHj9dnomkYrUif5DyPE0V9pQ7YpoKwd6bMPnMm9MBw/egUHEg9K+BmtYNEMMF
	yt4Rwujqao9o1HZbVoAixDA6DhKEBkERBUU94nMRfgYUjTArHjsRA6CgJ53YBAbwbHlwMWMhZbn
	PjyfO4fO8tMsLx1agR3qj/Rbz9iq
X-Received: by 2002:a05:620a:404f:b0:93b:e412:8cee with SMTP id af79cd13be357-93c15eea61cmr284237385a.73.1790032136724;
        Mon, 21 Sep 2026 16:08:56 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19a7f592sm39933985a.17.2026.09.21.16.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:08:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] usb: gadget: tegra-xudc: Unregister VBUS notifier
Date: Mon, 21 Sep 2026 19:08:47 -0400
Message-ID: <20260921230849.502492-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921230849.502492-1-mhun512@gmail.com>
References: <20260921230849.502492-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_xudc_vbus_notify() queues usb_role_sw_work.  The notifier is
registered with usb_register_notifier(), while devm_usb_get_phy_by_node()
is passed NULL, so devres never unregisters it.  vbus_nb lives in the
devm allocation, so a later PHY event calls it after xudc is freed.

Unregister the notifier before cancel_work_sync().  That waits for
in-flight callbacks, and the existing cancel drains the last work.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 2582d629c9e0 ("usb: gadget: xudc: Refactor update data role work")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Unregister the VBUS notifier before cancel_work_sync().  It queues
  usb_role_sw_work and is not devres-managed.

 drivers/usb/gadget/udc/tegra-xudc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index e9d33be02866..a0585a1f19f0 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3926,6 +3926,12 @@ static void tegra_xudc_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(xudc->dev);
 
+	for (i = 0; i < xudc->soc->num_phys; i++) {
+		if (xudc->usbphy[i])
+			usb_unregister_notifier(xudc->usbphy[i],
+						&xudc->vbus_nb);
+	}
+
 	cancel_delayed_work_sync(&xudc->plc_reset_work);
 	cancel_work_sync(&xudc->usb_role_sw_work);
 
-- 
2.53.0

