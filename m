Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01392EC09B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788068577; cv=none; b=NW/JNwwEGolhLM1mumQrVdvxp/HnKQbFiSpKXs807oylbq35NfbQV7Ne2mSbtEg3p1DiDfhX1XYyZCNXds5/kICyMOV+GqMlCbBLtozIAHtGH+vMMEWHOpvq1z1cm1BmECR/l/Kvjv0Soz7qXfzBWtWs+szQmfF31aXybpgsCJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788068577; c=relaxed/simple;
	bh=+s/v5GLOFlvOVMK5SETD1orZfbBnXi2XVTW2DNvvDxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pyE7h/mcGnQi+aQed+ai48kF3t72jrsiCQ4IADUmHroW8sRWTBIA1LW+w8K52PPi21oNOsCRqy5ymZ7/clrodkFCSFoquaxOp2onO6ZsQTxAHvncdfmr6WkRVck9dH8W7QbQi99KtmnnhNFgGCf47F5eGaPacYRVpPPIA3ngxPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM4mnCUV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NM4mnCUV"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caed617615so18755595ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788068575; x=1788673375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i8zBuAWBdPaHf6WnQ75ec30yZDUQcbxFXmLKJ2IcPwQ=;
        b=NM4mnCUVFqsVVjgg0on9MLfewbPMKW6qk7WWxcin622JEPwcpl6Ah5n3K26icnf4Mq
         qL+0EFMNx3ppCi/Y+xxQwJsQnRzdce0rtyqCt7F79jxtFfsLdOb3lqrVz0MdjDBJDGUc
         t2YFy2xJQ7wRR7so7ClvGRpSIlu+0Ij+CwBojjCNrf5vG2u5y2LO7oYBpD9dyGVLF+4q
         AXD8pFXCkI4GyJlrkaUlWpBQx8lpiGbwWv0BDz4QdCPkd1L15IAneKg1dEg+cR6NH3TI
         0SIFnfkcrNjUXQPAfdbvUUPUhozt24bV0rNsmebtKmAkmWUrpskO6DFDlgkpe73FsDmg
         Fbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788068575; x=1788673375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8zBuAWBdPaHf6WnQ75ec30yZDUQcbxFXmLKJ2IcPwQ=;
        b=jbWGdp3BqoDRF3YCXjq/Mc1UquywOX/ZL2oivJFYQWRkgFx7Evf4+AUeccm3srhMxh
         6Kr8TsR5Hc8J2/DrrcurhjuHrou2+2hkmboinl0zaG7eDZ0VMUbe3W9rzgZewGtpWlqY
         pXIMxOScfVqcxqSSqoSpzT0aUkoqTHK+74sBKHJnG7sgFt6SuYiwhdLSjalCXJDurkjZ
         qNdgfzklFFnReuMZ8uARlQt4wgKEpVmlhDMcWdGEzU93Wq+yBHFFW5IjFltz/uZ2rJ0w
         0+MSnrd69K/o+a8q/DGhldWfjerPQpC5DLVtqh/wn1Q+gSFdp/eWX+UhckI/Fv0KJmQY
         6NIg==
X-Forwarded-Encrypted: i=1; AKwUvBzD2wqA5aV5cnlaTAHZqxXu3oo2wUOecg59kP7YprjxiMC2nh/KZ349yREPJM187/AVTKFPlMkADQDNPGU=@vger.kernel.org
X-Gm-Message-State: AFuF++loctWw0b3J4ClGDIbRxz+W5si4uMNFcZwwfM4JSCNl2FMiNRrT
	2NZNl/Psw+v58tLH+R3Ms5XgyG+1NCOihvbidtGl404NnQaB1z+yUsJZRyYsYR8K3yj/
X-Gm-Gg: AR+sD10/iSFD0UQiSOR9bTVAguxFVpSBAXd/mjPRLf0oqBFnZG+Z1GiKU6PReHDW8yg
	ryHT01dOZUBcRR5ewKFsB6mHJau2AAtjKflJP69oOvE9YD4B/Opq/f3QjxWrXaNkeP6Ardl2txq
	MVZiIncbm+xKbSapwgkEUDY9dPaATV81ls9KHUzMGq7hjrBwwZn9/zHfpkbKVh/xotlr0vAOPlc
	ONUKhH1ujsFN3ECmk20/VIS3+U8Ye/w19Scmx9KYBZDmOKPzavhxWIK+vzmuU36ceAiS1vKyCU8
	31uWKK8hl1ucyAjzOJrNdUN2p4bwAAxvpIRwzbVsg99DhZlmxCHEEs+pPrcRX2EBDvw5axKCUft
	bPy/PunUFezqHDRw679XNibC9Evzj7s1UeUEb2Vo01SUE+Z279D9d8fUraYamXeOboW8cv3/t8J
	+f4/VyIrS/QBrg+a8xPvYDJBKEHH5wXLxmwBnYFBfnhC3damrJaiy3vR/AV93qn87XVeoxJkJ/P
	A==
X-Received: by 2002:a17:902:e751:b0:2d6:7409:7145 with SMTP id d9443c01a7336-2d74dbfe91dmr241822205ad.1.1788068575063;
        Sat, 29 Aug 2026 22:42:55 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6496:3266:4625:ebf0:e422:3504])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm19575735ad.59.2026.08.29.22.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 22:42:53 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: light: vcnl4000: use sysfs_emit() for near_level
Date: Sun, 30 Aug 2026 14:42:36 +0900
Message-ID: <20260830054237.2147950-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sysfs_emit() instead of sprintf() for writing to the sysfs
output buffer. sysfs_emit() is aware of the buffer's PAGE_SIZE
limit and is the preferred helper for sysfs callbacks.

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 336468d59ea7..dac235dd6220 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -1504,7 +1504,7 @@ static ssize_t vcnl4000_read_near_level(struct iio_dev *indio_dev,
 {
 	struct vcnl4000_data *data = iio_priv(indio_dev);
 
-	return sprintf(buf, "%u\n", data->near_level);
+	return sysfs_emit(buf, "%u\n", data->near_level);
 }
 
 static irqreturn_t vcnl4010_irq_thread(int irq, void *p)

base-commit: 350d1fb9204b13c5f95e511e98b8bcb47574d425
-- 
2.53.0

