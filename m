Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2C343DEDE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976531; cv=none; b=AeIZ0G8rUJBQck+Sv+Chhq/hY/ElXj5Iqd4XS2KgXIGZMx7mUFoHfpP+5M3I8g93X7LIqUqqhhDv2k6dt8LKIn/STFY0Ny/OHY4IkgvH9ORMuqT1l9clo7T5zgA2kYsyQNj8pigazdrXJtgm1XGnEn9KwbFvkxxkDzm4O7OPapM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976531; c=relaxed/simple;
	bh=HBE/+kSisSLQtTti9PD0IF4r82pEZs1xT/tQKJlZHgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gUNPiTMXHFtsSRqmkTxesxTSbqSeHuV5cWH0Z/S+Hl42fn0K/krelO4EMShU7keOAIRqVbG82oGa+OhPCv0o9Dtg9aztroFU/ekWHVVW+rZWBnjzvZQdOdsL4gIzAMBuroh95CiJMvHapt01PHnPJGLKMvcZDqqldQohdKIn/58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rDIHpsbK; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rDIHpsbK"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b355ffso1558763b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789976529; x=1790581329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EpPg8uLiGCt1nmkqruCW0RWeQqwd9zjhCiMPftKkUsQ=;
        b=rDIHpsbK0Tl8HpuwCfE4/CmCKps1Zep2g4sz/H9wvWTa8ogLLKX1qn05qcQHaBjC+O
         b6YK5UlXhSxpiD/mqjHdGsQEvp29yx+wBNsDkM/6K0SdUQCIMAd23w+gGwcwAsC4aDfp
         gnCOhU5JhFAVvhtjhmyOOIk9Av8ABgooYYYbIkLM1TTQn6OJUwIsJ0Y++v5vkJZVQNYM
         NZQbNJMRHR0gjevbWrQL09gyOqnOQBKsxa5auG0NcNT3OAsog9GrZejE7oS4mRRtT9Vg
         KtLvAaeSL2OWXwl309uKiTZ23ntLY6OUQ8MYyIxFa/GNiEqe4/TvauISNVCCiJITvqqj
         EMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976529; x=1790581329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EpPg8uLiGCt1nmkqruCW0RWeQqwd9zjhCiMPftKkUsQ=;
        b=VrmZoyD1flzEq9tPoWuqT6PJ6dkbrP4bI8/w/FJC9tMehrWW7JFwtAmw58v+R5YRNs
         bBsv8uPcZmw1U//ZShV5hoR00P6QgU7Iqe1T2Yvu6k9QXWeJ2zAgeRLNK3eVIAntRjTn
         ILXEhsiLpyvKmqft5Bx5j3pSJ+veVVFnknsCl8RznRfWh4qQJDqxZGAGP/xphQZ+pHWw
         awp+4EUcLRj0h0rINsdt/kBZWgGm0A0Bw5QqndXl8EUFQPnQJlzA39MgBRR2rXNUogMv
         kB2VBodzjuX3FwJUq3gfOm0NHtB0t8BDUzwriQj89uq3LHZQen7FrBhH/pqaQ5mguI8B
         1Ffw==
X-Forwarded-Encrypted: i=1; AKwUvBzqpqXS+OseBivByLhStTitQVch53Pr1cHmx/oCiPVuhSA8kwon3O5YUUXErd7LaD0SY6YR2yCZqC7WVew=@vger.kernel.org
X-Gm-Message-State: AFuF++lRx03CpzDOwAaq5Hrm95XZxEyEsri9uZT0BhOQ4j7mOo/lIGR1
	aS9ItV3PxXAw1P0i0LaZCkml2dFQDOBzSJI+EVyqWNlbKtrWlAwnwKvv
X-Gm-Gg: AYBFou0x3TYeIeb8Qsyz4v/gbxEIWr/FdDEw9ljfSltq9YB4GpuH+T+IRbJ6HRG0dVN
	HMKQhnqp5/MhJIz1dMSd8TP5sk3lQhpeo3DOOCfV765CQuv2zsTDfQdX0b64Km3VOkV11jMq8Br
	U1qb/GlsArYjOIQyIr5CkqGrV1MKUEAqlI1F9PatctqzuJGbGPo9YjFBjGCvPb1hOUW5cNwLkhh
	uUb7ZUsPUrwHaUWc7pQ0ViLmMW9ct4IcarffoiY4UoQBl/Os18Ekq93N1g0auaukfnUVWA0IQpR
	HhCp0J/fmh0P/ed8lh7xIbk9Arokj+1KUasTik0R/TTUEFVOTSKlSQO2YGmYfCr1I9NReiwDAdC
	290IghiKNXGS3HGHzz3C3Jxp7PszGW5QnNs8ePODw9DqfouQnSBUUfLerjAQu/RMe6vR4//2H8T
	NGKhHSIuWRU1VuNB9VqD+AN/6PbbmT1duXx+m54aKnsi5YwwX5yEpHU+k47E54iPRJeICJBsG/3
	qC4KSGlhGO9GMx7nIkFs5LkfjqMXBnAk4tuDs84elRJX8U1QsXqrStrm1UzRZdprQihR/xWVXAT
	t4SG12/B0w==
X-Received: by 2002:a05:6300:85:b0:3dd:a195:dd57 with SMTP id adf61e73a8af0-3dda195e4bemr10090144637.57.1789976528682;
        Mon, 21 Sep 2026 00:42:08 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae70637sm3048650a12.6.2026.09.21.00.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:42:08 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Alexander Aring <alex.aring@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>
Cc: linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 2/4] ieee802154: cc2520: flush fifop_irqwork before destroying buffer_mutex in probe
Date: Mon, 21 Sep 2026 07:42:05 +0000
Message-ID: <20260921074207.2289391-2-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260919213639.3316625-1-benquike@gmail.com>
References: <20260919213639.3316625-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cc2520_probe()'s err_hw_init path, mutex_destroy(&priv->buffer_mutex)
is called before flush_work(&priv->fifop_irqwork). If fifop_irq fires
after devm_request_irq() and schedules priv->fifop_irqwork before probe
fails, cc2520_fifop_irqwork() can lock priv->buffer_mutex after it has
already been destroyed:

  BUG: KASAN: slab-use-after-free in assign_work+0x2f1/0x340
  Read of size 8 at addr ffff88800246b0b0 by task kworker/1:1/43
  Workqueue:  0x0 (events)
  Call Trace:
   <TASK>
   dump_stack_lvl+0x70/0xa0
   print_report+0x153/0x4c6
   kasan_report+0xf1/0x120
   assign_work+0x2f1/0x340
   worker_thread+0x2b8/0xb70

Flush priv->fifop_irqwork before mutex_destroy(&priv->buffer_mutex),
matching the teardown order in cc2520_remove().

Tested in QEMU with KASAN enabled by scheduling fifop_irqwork on the
cc2520_probe() error path.

Fixes: ff5891b266a7 ("ieee802154: cc2520: fix FIFOP work use-after-free")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split out as patch 2/4 and documented the probe cleanup ordering fix and
  Fixes: tag as requested by Miquel Raynal.

 drivers/net/ieee802154/cc2520.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ieee802154/cc2520.c b/drivers/net/ieee802154/cc2520.c
index 5454872..d2c8484 100644
--- a/drivers/net/ieee802154/cc2520.c
+++ b/drivers/net/ieee802154/cc2520.c
@@ -1153,8 +1153,8 @@ static int cc2520_probe(struct spi_device *spi)
 	return 0;
 
 err_hw_init:
-	mutex_destroy(&priv->buffer_mutex);
 	flush_work(&priv->fifop_irqwork);
+	mutex_destroy(&priv->buffer_mutex);
 	return ret;
 }
 
-- 
2.47.3
