Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9CE38838B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411264; cv=none; b=pElfIELUBXvyMJQMsE6pJyM2HTYq48I0yxxJ3sIl1EKCa3p2b+t3tKfyI+aKitpfugNcsjJqHVNBaPLii9TtaHViZDKBuy7cx39c6vvCDvY8pKDoO1dOXzP8QBZORePt6Xkc1MGkAp14FFQ+3cGAunK09IopiYRqRuGhJ2G3lBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411264; c=relaxed/simple;
	bh=eMG8f/UZxgC4RbM16xCsfyE7Jgui1peQP0C6f3+v8p4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OH8cymI05TUwGa0phmdNiJK+4hYLJgyU/zqBDyc3QpOvhnMWMuA5WUpIqHxe1ex1U8dTtfOzbvyQz4StEivuf4kQEf4p/PSiNBhVV10RDnR8vbjufA5laRDM5BMgpU6UljdI0Jnj2IyRIqWjRLqoHuB5f4m0rlEVuFAG0cipqaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiUt6T2b; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiUt6T2b"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so2303219a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411262; x=1789016062; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjkh/gkNj2lHRKcC2314o/TZsS+moGdJRwGE/ISLp/s=;
        b=CiUt6T2bKcZa6DuwotkYgblsABrig6Oca+ZiHtHwYwJjWMpdl4IWPuIrDjQt+GCNF6
         k48N++cTRW4IMyAa99789f57mvjEiuVJF3sLgE9Rgj9ONea8mHNMcvl19tGOaQHkbx1r
         0SEgJ2r0bV4LyUWK41jZtw92LsBbwnxZ61LCfQWVdv8tJ4F15x6izzoxwRoRwyw6RI4i
         iN4Q/U93T5Yi3RmvRlDwl7zFg4o+vy7Z46XUspd+lBHWElu+MTeDNZuRErxXelvEZ46W
         vDQbgIMHulEPTwK6Yzt4Sk+X46LaoDK3BodMLPTRYJTDlbb+GtA20I6assgmTWKk3tOA
         +ARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411262; x=1789016062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xjkh/gkNj2lHRKcC2314o/TZsS+moGdJRwGE/ISLp/s=;
        b=qapIUhW8PB8injSc7pu9WLC+oMrdIqqbiLDHMo62jHA4u6GxFwxL5JgO0vxaR8ycxW
         Cd9dkbBeq88MlYMmpDiL2e0acHDZTwrjj8/h2uB7Gl5CfVFW3ppDdkVN5ou1AumkWORb
         e7LY8wYyA1p79c0wVDT0Ld+eWW4Zi6UOcAVxBrmygVAJOoUXuxfLZRCc52X8uoposvPZ
         Y9AeuIhtBfihpa0L1P2k9MqigjUQboQBF6iEGws8hIxCc61ORkISPfvmhsqQdJaSaWBV
         NlHBoICwyIHtXIjMGljfPxSkarXc4W0b+HmIt4CdPZ9BS+oA0zqvaV92aTcrQILEhTGX
         9dcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrVBXmsgvzT6dkf1WZWc0BvPdwQLtaJhgFyKpeQaDwUkqdMiEFcifV/QT6QvmPWm/18E2MxUIDLXgmNZo=@vger.kernel.org
X-Gm-Message-State: AFuF++moBroBrtgfWXDu2bxY7W2kRJwIC0tp4Zo+KlNNf/zJH/kCrCGG
	fMl8wQ8HthGMwxZx2C8q4SziKSfI76HN5xocsXIa67MHckwhSDRRZ4JR
X-Gm-Gg: AYBFou1C+Nl+chGunVv22MXPUlPbDp4wgGz9IPtF9pEnUcOeSFLeQotzIfEWXqUWYlh
	McQWDrP6ipujA78MYga11gLmNC7jYJzkhgHl1vYNtTTasvXD6oDPUmGrlQFp1vo2IhBfgRkUv16
	QiTpSKW3rilg9UcCkwSzH1/88gg+ZbjVdF4GdCBthryeLHUMGSZXujScPBNzJzUdXDf0mIToLwi
	fVbEgtUHtb/cTSyajz9ba+swen6qEf15YL0i0GtHwV/ugzoSViK4awg4/wKXHdiPGDABY85XzS6
	lBRdHHlQKQLl/tZbuBfB0AmiBAkoNRsj9IR6CaZciANBYiq0yVujojX5PFhf8JeSqeJw+zbGsxy
	TSpDuKDBTfT6iH2uYbQUaN5426fBd2Vy61D/tswU34uHY9F/5WsURl9gChpy7KVQpl47oY7X6X9
	xwyNfxJZWGPhFVB5/unSJ3IXOSwz8jj7Wuez4FUL8WdWt6wM1QeAPbMlevHhpXgho+vg==
X-Received: by 2002:a17:90b:2807:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-39aee16f931mr16587728a91.16.1788411261874;
        Wed, 02 Sep 2026 21:54:21 -0700 (PDT)
Received: from [192.168.20.42] ([115.70.157.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8f1cf6dsm2300801a91.3.2026.09.02.21.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:54:21 -0700 (PDT)
From: Tsz Shan Chan <tsz.chan.dev@gmail.com>
X-Google-Original-From: Tsz Shan Chan <tchan@jacques.com.au>
Date: Thu, 03 Sep 2026 14:53:47 +1000
Subject: [PATCH v3 2/5] iio: light: vcnl4000: clear DRDY interrupt when
 buffer disabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-vcnl4000-v3-2-5e69c2e715a8@jacques.com.au>
References: <20260903-vcnl4000-v3-0-5e69c2e715a8@jacques.com.au>
In-Reply-To: <20260903-vcnl4000-v3-0-5e69c2e715a8@jacques.com.au>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tsz Shan Chan <tchan@jacques.com.au>
X-Mailer: b4 0.14.3

on vcnl4010/4020, interrupt status bits are cleared by writing 1 to the
corresponding bit in the ISR register. If data ready interrupt triggers
when the iio buffer is disabled, the DRDY bit is never cleared and the
interrupt line stays low.

Clear the DRDY bit in the interrupt handler when the buffer is disabled.

Signed-off-by: Tsz Shan Chan <tchan@jacques.com.au>
---
 drivers/iio/light/vcnl4000.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index cf55fe6afcba..c5f34e748e1a 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -1545,8 +1545,13 @@ static irqreturn_t vcnl4010_irq_thread(int irq, void *p)
 					  isr & VCNL4010_INT_THR);
 	}
 
-	if (isr & VCNL4010_INT_DRDY && iio_buffer_enabled(indio_dev))
-		iio_trigger_poll_nested(indio_dev->trig);
+	if ((isr & VCNL4010_INT_DRDY)) {
+		if (iio_buffer_enabled(indio_dev))
+			iio_trigger_poll_nested(indio_dev->trig);
+		else
+			i2c_smbus_write_byte_data(data->client, VCNL4010_ISR,
+						  isr & VCNL4010_INT_DRDY);
+	}
 
 end:
 	return IRQ_HANDLED;

-- 
2.55.0

