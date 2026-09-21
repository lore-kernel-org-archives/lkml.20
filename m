Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E5441DE01
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032032; cv=none; b=CQnDQX8h+tio9B0vMBRKmrXaAEPyKFO1Ip7gVWKoPNM+DjcuJYFqAMyS7fmOcwOiLdY1FRnFViZ1/aV1BBwqN/MlEzoO1+Pjc2uhpXo7LkatiYcHMBudP4fJg1wIFAagxu+v4OXaKubq8em4CnrsA59d2Sphzhts3PRKyQGsKn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032032; c=relaxed/simple;
	bh=1kqLnj+8FvoNP8Iyva2qZ+5nUXP82oQZlgmxYX2kTFA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZfhenjIYjJu8n6tDrNWg7CZ9/eMLIvTkx19yaeGIoGC9lAQkoCFl+okHH869jp50KV6z10uqz4XVl0hvw4lp2Ccc3m4cpnTMzcMrzO/nFksffIx2K25iP982KD9jaRpx9NUYo3G0ymUdpIIp0jw5xpeZRvqcdarj5N3Z86HZ59M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=olGKUuNc; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="olGKUuNc"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so4735162a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790032030; x=1790636830; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rN3UiEVeD5JTvm5L/WrJ3sMgipX1w5Id3f3Ngl73Mok=;
        b=olGKUuNctDQHyfzUJ1BsQDZOqh52iEYhIA646YOE7tsQ5v5cnhlzuvx1G73xRPie51
         CGB0NjOMCM5DHah+/GgDQ3aaQptVLeODxyHaBAwxAJ5WQ/XcihYfaRdMfFP3qza77Iav
         OAnOmabeiCy6OLOq6YvaLbgWv9VHgxvhkaJUo9jukSilSabtN4Phlxq4SXiIoPEKueyC
         bjEHS3TsNpBe/mOwxCQMVmtC7CFHWuQ5kWiPr1vXekeGsmOUo0d6glhvUYsobGrFNXK6
         WK+Cws8804XYICqUy+0V3GFGkoKJWkG3Uv35dYTpzAf3lCzdRrf96Jy2BeXSCdTSeLTC
         jjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032030; x=1790636830;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rN3UiEVeD5JTvm5L/WrJ3sMgipX1w5Id3f3Ngl73Mok=;
        b=fJ2PxG4AzoCFDY6GppRbJjI9HfzY2Bt/dsaHr3NhSPkWYBFqSVpITzPMq8Ynm4btA7
         p2Yx7VzSrBw2eGiprORONsmTX8JvtiEHzyEf0zdqwh935JANHhT0CrgFDPI0Ap+kMGBC
         9XXI8uGYKq9jqVfLRjf15fW6D26hk8JiqbO8V09knAAKVY+R73TUdE7cNGwL/obkGxUx
         FonGucmYpBEbfk5iFZc6O69GJsjKWukChPIKIVctNNc8hqXns/+a8vntBV+hhTPobCjJ
         pzS66z05rWolHrw7h5pcAWJoKEd1yvB0UT8okM2ALscmVCODZfw57WbAlhZOjSNpHA6C
         kvwQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+RwnmkEE5pV3UO8O5ePP94gdvksWCJmUnRzGyMn8hV2s5nZ6QwJCAW13STbdxmG8B6fE5foZzj1RswoE=@vger.kernel.org
X-Gm-Message-State: AFuF++lvw1bqf5DCw5HCxVXJfNJcZSaghYdhgaALhtBQ+OVKd9txGBWe
	SZljTLzK77vpjKI5tY3xBC2m6z6jhRjCt6fmyn5Vhpt0IisGUVq/tUdpliTigoK+7ZywZhkOCYJ
	roXyoGjhOZCYo5Q5pLCGF9Eeui0HWhQ==
X-Received: from dleb16-n2.prod.google.com ([2002:a05:701b:4250:20b0:144:dc13:586b])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7704:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3dd8c3f1681mr17721014637.4.1790032029435;
 Mon, 21 Sep 2026 16:07:09 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:06:00 +0000
In-Reply-To: <20260921230603.2518652-1-samagazaryan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921230603.2518652-3-samagazaryan@google.com>
Subject: [PATCH v5 2/5] i3c: master: add i3c_for_each_dev helper
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

Introduce i3c_for_each_dev(), an i3c device iterator for use by i3cdev.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
---
 drivers/i3c/internals.h | 2 ++
 drivers/i3c/master.c    | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index cbc00c862104..3c53a5108b81 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -79,4 +79,6 @@ static inline struct i3c_master_controller *i3c_bus_to_i3c_master(struct i3c_bus
 	return container_of(i3cbus, struct i3c_master_controller, bus);
 }
 
+int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *));
+
 #endif /* I3C_INTERNAL_H */
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index e8a9f8c3041e..07540ea73aec 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -4011,6 +4011,12 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 }
 EXPORT_SYMBOL_GPL(i3c_dev_free_ibi_locked);
 
+int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *))
+{
+	return bus_for_each_dev(&i3c_bus_type, NULL, data, fn);
+}
+EXPORT_SYMBOL_GPL(i3c_for_each_dev);
+
 static int __init i3c_init(void)
 {
 	int res;
-- 
2.55.0.1082.g2b9226bbc0-goog

