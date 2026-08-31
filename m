Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52575372070
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199277; cv=none; b=MNOssp6cigcNzLX4JWn7Pcv5eZAwMdYzgFdSxTSqzIGwNZkq9hu3RYxzHflGafnRPUXcV+UnJebbZ/Hqpa09PAggs67spuCYorN47ZfRR03UfwAtn36qqNZqM1teWFGJDlxOWDPUpxKFBrqWAauW/qawIqbDQ/I5eqIHuj4KU3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199277; c=relaxed/simple;
	bh=cmLSqzifwOF8w3gy+VghqBDjtxfwKg/n6RMNTB5n+1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=houGa8IT97n32naiwr4nZvK2jpOgvHTWN0zofZBoPEeb8HhY/jwJcQCo3gukTfDusVxCkFYqZKJaf4GPU5p3yrcz/IatdS8vdKXdlOtq4XaUGGMzcM1qcWfCYlvstZjmMxK+nfjdP95sTcUIhgGe1phxmIIBmHztgAHGcs6jl+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaEcGN8g; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaEcGN8g"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48441a2ba14so119054f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199273; x=1788804073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qlC264ZmuNC9OaSCC+Hoy8y6Tn/lQ6yUUOOH17G4Le0=;
        b=NaEcGN8g7rsZ7imrCNb0vXZtb2m9MDn0Ikvb4xS0NYcaTK+OLAAzXhy1OzGhPo7tqj
         jEll4HpOkXNE1BvWdE5to+bSNoGH1Q/DPd4J2ONc8+TamGidls/1XeIhfQ1taH+QaGoS
         qMO6wXHaym3ILxVfMn2kx3WrS5LDps4xZl3QIUZUClhLcHDWykibVj3e2XRjlEM08iLA
         lNUniNH/Xqrd+GK9cbrF8e/E0c8uZ9cTOFQDkPr/itWa7PdcFiM881rCv2myYIe9UtRU
         nPw+zSeAT0oNiyt5mXaoIIHgqVRjEFHBCzBDAadZI3N3AqvYwM4EQQLlAnfRIpKLYMtj
         CHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199273; x=1788804073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qlC264ZmuNC9OaSCC+Hoy8y6Tn/lQ6yUUOOH17G4Le0=;
        b=FAB5KUIDq78TxWVJOtIoeRqI3AgRZTi6w3pKLFVz1DzpvSh31lulfvmmFNiQvD7Caw
         5Ygz6+6S9MzynzCfEP85+yjdJ2iqHWsP3CrvnVqNqhl25tDDRZIBdwL4MYubpli//Pou
         p3MODRpsRSLBHFbBunEM0cn4dI2nDqAiUyqNGv7Ay6FOd2zaC3dvp4RXmhmFB8PvXmOj
         zTYzzzvin6VyMk10yOWXdwVflpHp/9AnfP53h+qOxvUqlLPUvHQ+dt6sKtJbPfYwXkNP
         jzfS+qVt8UQmJBEp18FwQj7oOA4jMRuhWXnT02S6KVOjrEMyKbME8Z2fayxBRqU8fnvc
         /wyg==
X-Forwarded-Encrypted: i=1; AKwUvBxVwPt//DK0vN1KB2NXotTQXqT9xn37Ig9BY31XxaPlW0ixL2NcyqrMNwmqDRDbnbDQUL4y1BtS1Z6E07k=@vger.kernel.org
X-Gm-Message-State: AFuF++nd+cKPojz1VC6FfwohFfxIq28jh+/ZpHqVWnwc/cS5928Jd853
	mBYwLH/UUVCQACKuVbexllyX/VQuHHY6DkVcCB/Cs/TTDtgitkul8Z9f
X-Gm-Gg: AYBFou2GIBrQ4UOwcLEOyN/xon5XmEFN2qZ5wksdPOXQkLfGoXj2riBVPp/8/qr1EP4
	bAL6X2tbr9kpuURVvrKEkL25sVJfIlwSpJ55YD2QudfMfie3B7IlNnMY13rsO2zEymzJxQjhwg+
	LPP80y5OhX6KQFMIl+kUB87WnvSnUxvsor1KsMf0M7Ua1+wp1+RIFVmKIqB7NZQy2dW+xsZdQxy
	tzfDqeN7iRTb26tGe7gPeCvTmRxwtU2xEBrwnefuPpknW43aNGJ3R7mBlEpdy+11/IK4N+JN0Lk
	Kex0ZoKaVtmckgJKecAGBQUtUuTmr2Hi7ob6SSfu/AI/R4pOvrtI1sUouWF0odUyTGNf2Q6XZN3
	V5+BxBSR9Ma6nZVnBgApVzeTx61mo9pU1DYcSDLlKE8PA4fKzx/pCuWB69hTrwcuK2oFFaIrgmj
	yOgBhFnIB1gjKvSIg6km2oAcQV3O5/TAf/taKO4wCwt0DlVo3bmExQp3aoMyBTXcG7Z2TX5JUuN
	0IrqmfYnnwrN79oi9dePW7pWK+zdyNTVc+ckCqno6c=
X-Received: by 2002:a05:6000:40dd:b0:482:e4bc:51b3 with SMTP id ffacd0b85a97d-482f799da20mr41606868f8f.1.1788199273297;
        Mon, 31 Aug 2026 11:01:13 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:12 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 04/16] media: ov2740: Add OVTI2740 ACPI ID
Date: Mon, 31 Aug 2026 20:00:49 +0200
Message-ID: <20260831180101.3109854-5-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 8f0ad5dbb245..18bb3ac9701f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,6 +1462,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
-- 
With Best Regards,
Maurizio Casciano

