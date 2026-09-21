Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9A32E266C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032030; cv=none; b=fP67aBQeSJJCEB05SvZ/dv1miA7aXoHu5lY9sLzarGTcV4iAfUDcjCamUMOzwaKw3fyQJ/qY2d1vX0oXYFMlbv4NvejORGxfZHzxPV0qZb11d73DXoghaLtoYJ6uijTopWcx0wmDH5L1ngclNOCNXvJyOqY8m8bCXl4ykpPOW4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032030; c=relaxed/simple;
	bh=HGszQMeBtGpcbjkEFUOHfoC/2lvOPq5mMavL1qn3WAc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lcURRowVvh2RyJvawjvrkH7c3W87cHlB9wdoUNSJD8SqiHm1SXfqoZjQIDvCTLnoUIURhe64bV2ZBarg/iFRO6vf4EKR8PLVc62EPuO65xBiNk4PSPoyXs/8m6mYFIY13p56oYKrK0G/3cGfScybbEjpHI2P4Hfrdx5GvuxeZR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GtinnQDy; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GtinnQDy"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b8088202so3155874a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790032028; x=1790636828; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKYG5VGbTPWmb7q1Nsotz5JXyK1vTlAdhH+6NwpOCvM=;
        b=GtinnQDyuWC9Ak5XQPRhusV1K+9rz4qU2n7R/z0Xq4U0GvSz8LBRa43jED0vJG3b+1
         TgFKLR/q7T/cB3ACt5htEUooFv38QAnOI6zQRDFKDWzUg5jyxRWSYM2wV/r+JWqZuR9x
         0vSfz6lxM9HyGkE3TaasFp8xCgWr9BblLb46EolD1whEMtfRAUue86CB63MvTAI2OKTi
         qjb7IMfBFCKtrNZ3Ph4mfVhJH3tYeuUkGj+uFr0zMmwe8ch9S8kT4xO+ZGQjH6zqakqh
         Nlb/M+MaliXu7QNzMaGBGtw09F41VB4kSE1lqg8ZatvFZWKIKpLFyM/6p04JFywy2c0x
         w66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032028; x=1790636828;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKYG5VGbTPWmb7q1Nsotz5JXyK1vTlAdhH+6NwpOCvM=;
        b=VYPBdSyuSue005zvCRg+jO5tR06BTd5TmLEZ39WUHmBP3O/fEGtn+XTUZDLVhrwbSw
         fMVGh0UkMrMt9fow1TFdIyuTpnyepHp1Eg8gKjXaH0eA+8p9lmLeBTRJZuEs9DbHdP7X
         2vXoMOdZVjueD7m3JGzT8UoyzpC0rLtDPQQbYRaY44GZDIBxFIvQLtWw5eoy80IU9lKQ
         sPgtGCVlMgb7lCvrw1Iu4dancDc3/cpRU8v+tuPPMiKr8aW2lU4ItPlITR5wG3eV0+/U
         7vopBejEDvrg6qX8i7pvG4U7X2VnhtVQpHABsGl3niHw35MPEtGSxAUmB11GC00uyZ3V
         3yxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAshdt876Xe0Rt/uwxK+tcrHF5n8wIZbvJZIpQg+3HVdGx9x/lEQYuAPaMSm+KRE0LLvdDHFxeB7uLcwM=@vger.kernel.org
X-Gm-Message-State: AFuF++k/y4PkL4Yq1XPruTrsSA6AL3O5VKtsJQm5Xu0ZzKvnXHICXoYE
	wBAEihshiVngV8QjEz3E7Shuj95XVuHlQo8AH3/ZdJQY5QGYk/PIeEo/Z+Fvk0ounIhxqY7Dbyz
	jFvrChXcAXj4z4RSpbdXfYWuwOaBKgA==
X-Received: from dlae24.prod.google.com ([2002:a05:701b:2318:b0:144:d326:40ff])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a10f:b0:3dd:a196:30a4 with SMTP id adf61e73a8af0-3dda19633d1mr11930087637.84.1790032028317;
 Mon, 21 Sep 2026 16:07:08 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:05:59 +0000
In-Reply-To: <20260921230603.2518652-1-samagazaryan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921230603.2518652-2-samagazaryan@google.com>
Subject: [PATCH v5 1/5] i3c: master: export i3c_masterdev_type
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vitor Soares <vitor.soares@toradex.com>

Export i3c_masterdev_type so i3cdev module can verify if an i3c device
is a master.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
---
 drivers/i3c/internals.h | 2 ++
 drivers/i3c/master.c    | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 86a36b951e0d..cbc00c862104 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -11,6 +11,8 @@
 #include <linux/i3c/master.h>
 #include <linux/io.h>
 
+extern const struct device_type i3c_masterdev_type;
+
 int __must_check i3c_bus_rpm_get(struct i3c_bus *bus);
 void i3c_bus_rpm_put(struct i3c_bus *bus);
 bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus);
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index afcd7a21a3e6..e8a9f8c3041e 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -864,9 +864,10 @@ static void i3c_masterdev_release(struct device *dev)
 	i3c_master_free_i3c_dev(master->this);
 }
 
-static const struct device_type i3c_masterdev_type = {
+const struct device_type i3c_masterdev_type = {
 	.groups	= i3c_masterdev_groups,
 };
+EXPORT_SYMBOL_GPL(i3c_masterdev_type);
 
 static void i3c_master_shutdown(struct i3c_master_controller *master)
 {
-- 
2.55.0.1082.g2b9226bbc0-goog

