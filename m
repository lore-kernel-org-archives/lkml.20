Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013041;
	b=C/iq7w/c5rkGT3solvy+5aIpt0rRW4BfrQ8V9R3sV6/jruUQ3Y2EqnHKHCU1cLVmtHFm
	 IlfbWZqKw6YwbBPs6HivVjSzgK84uXoi+vxE8ShrrGXqJ5/Zzlt0yItiOoJ1y/sK4Opo3
	 E/1iSovEFlhUQmot4fY4EpITH58giIaTs3Pz7YcabnkrCEddITXo0ChgOyXc9eATD7PJE
	 hs33bp+SbnuoAgdM6QLXKOx+0e3HhlPwG2SdPwrGARrPf5+XI2hxrbxPcbs6tiFLVnxGt
	 P7uwri4Jvoy1atQ4/a+smZyAFWAfaxOUS+byOuVXIXa/+eWeqsIDT4ChIWmaD7N+KRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nPvZd6ipcHhyyKgSYRp44a/mOJGJPLjA8+pqMRT1rUc=;
	b=qlidtFJni0JScGGKTvlNxv0afWY20rEREiLtxj8zt/fRjmBOeF3X+bVxG95V1UvdFYcI
	 e9GnkSNdroyrzhg7lLkDSbOSjCgP3+GzLujwVf7KJBhqoAaPoAvJycOdi1yQtPglZi0o7
	 VP3VXTLq00p5E6ulGRyJsZJ/BljYeB/6NIWcYAZL4xxoBQngQF3A9ArCLNcRdjevAJSCb
	 Ug1i+4EywG0dCPBKkNX0CLT+2lC3rCZM/pTpUVojbxHHiF8APovMYXwqwzygeIiGf6pG5
	 uOmFady+YntVrxaDFhG+CYXSR9YdMe2bXdpUawsITUcVhCYbpaOEl2NzOOK2Huu9Mfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NFrt4eiV;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D73160A5BEB
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D73160A5BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NFrt4eiV
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a091e4eea2so126794b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013040; x=1793617840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nPvZd6ipcHhyyKgSYRp44a/mOJGJPLjA8+pqMRT1rUc=;
        b=NFrt4eiVbq4Mp8B0y4o25ojFp+FFa+4f66uMwJtHoVi/woM9GOFpLAcZWlD8iPQMSV
         s4eoGDF/diHSBsKR/tsnpoY7RrRmG20QTZe5kqKT7s2fYLf301xS5hunbFVxI9gR9T4A
         CjFVGigZlaPXSYWVSZ64dZMArV19RYkeO02mm6MWuMvpRbxdFqXuDTrloQPz8eXMtyZ4
         5+tz5yEDhOTfPLYDXvKgvClHmd/AoBm5hig71DxXYHskC02+iPVBWKVJTS6EJAXsSx4c
         lZFEg+Bf4wA1B0szWc/6Zmx0DNhbtRiN8q+GMGbsYOIJe8+xVAAy6354QW73xycIxW9t
         edPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013040; x=1793617840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nPvZd6ipcHhyyKgSYRp44a/mOJGJPLjA8+pqMRT1rUc=;
        b=dUNeUWwa5UIvBYimH2WqMYtzMVVXgjWH55zr1TLZbr9kKtMxnf9c+iqN61tNiNCSdx
         O80lKQKwLuv8rBj7yNjP4XuiLmrxClGLfgDBkZyRWIAwHQi38EK/J5o5iAUI3wPOxLpt
         v1ZG/wyPM3pjNlVIK8aolYXL2K34d2ZCWscqkSe0u0zawUvCEc2xZraz9astRTqv5L1B
         YHSdzrBQu54f3fcolrKH64cy+1u+UHwNM8eVdqxZW58f46VlFtcKMhS/Lzx98IjKPJK8
         jLG1Ul0mtkrCemNPQSAwA55+1HWw51fDH8Cux3dH10R7Gg73VQftwFRLMbkUr+z3knRS
         gFnw==
X-Forwarded-Encrypted: i=1; AKwUvBzOlG3qv3FVQTuR6EnCXSagr2C3qdkSYvCa40mX4owBCobTuDPSWG2QFfEy/zaXD8xcyEzj1Bf/XnXr4A8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKi1FZGrfEYlxEd3VoP9fHJ/ntzmx2zv88fK47S87Q/sn1AqGw9
	HRGDJuTWQCSN/T/YCk9feG7R0XR5j4ONfRHnA5IYbq6tACAC6jVOTfE4
X-Gm-Gg: AYBFou2kKU8rCOaSHsQ+/RuaHoB3Vb7vk1219Fk0u4laXQBQGI80p23gPBvuSLPFnzQ
	KI7L7L/qOfC5r1SyX9LXO2pyp8CbRcH+n8DII/ECWEhgk6PFh1qkgEhRvn2J/3BpZ1c33iX2vJr
	EpPqkQkKaSzDggI9ncnhwSWmuH3BQIcsGHlq05ZmR3jIRnm3KNPOOdfyPg64J9/FAwIh5kkurZE
	xpEvhMsM+BGF/sLUAmUk0lpoQmNg4yMN9otQUKK0DYKHc/Dlbi38axNOUYYR4IS8vn7WfRo2Bwa
	qd36DFWg9MYP5ZfNWa9g0Vs/w/WGXJV+PHUklRDLliwDn+bSq/GTPc98PW8vMUC6ilI/OKY19MZ
	/OlRswgz7g+Q5dLVcWEJ1ws86XnFqqJrMqkzSEGxd0opmoEvmBuCs/5uGZPXuk2KP67jn2VK5Ib
	wQStfnf9/EUGN4gGZuMmiye2+P6I0ErCluWWUXP9BcCZ3bgaSede4GDiV4Sad7Y8Mw+hgZ74Rlg
	lvCkI7oEqPDKaDAmG9/kxHEC0aRShQS6JgXDVLpA7zUxZWJh4nTfuNbx69pR2YQxs/1G4D8ZA7S
	MAVjQtmUqNI4Ex4lDQLQbz02DoxMVAa6gG51ZovgtuR0U7RM9XqtPjttcQj1KIdDim+9AUyrY/h
	I7sQpHjSKxkp5fHFel6XZslmcM6cA4t+sIKgCuUkM0Zpu7Q==
X-Received: by 2002:a17:90b:524d:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3adeafddb1bmr8922396a91.4.1793013039674;
        Mon, 26 Oct 2026 04:10:39 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm8023593a91.8.2026.10.26.04.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:39 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Antoine Pichot <antoine.pichot@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/7] media: i2c: ov7251: Fix link frequency index
Date: Mon, 26 Oct 2026 20:10:26 +0900
Message-ID: <20261026111032.88355-2-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026111032.88355-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
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

ov7251_check_hwcfg() stores i, the index into the firmware's
link_frequencies array, in link_freq_idx, which the driver then uses to
index its own link_freq[], pixel_rates[] and pll1[] tables. The matching
driver entry is j. Store j.

Observed on a Surface Book 2, where ipu-bridge lists one link frequency,
319.2 MHz, which is link_freq[1]: V4L2_CID_LINK_FREQ reads 240000000,
and the pixel rate and PLL registers are off the same way.

Fixes: cc125aaa5a78 ("media: i2c: Provide ov7251_check_hwcfg()")
Cc: stable@vger.kernel.org
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index fce6344b51..1413f1856e 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1523,7 +1523,7 @@ static int ov7251_check_hwcfg(struct ov7251 *ov7251)
 		goto out_free_bus_cfg;
 	}
 
-	ov7251->link_freq_idx = i;
+	ov7251->link_freq_idx = j;
 
 out_free_bus_cfg:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
-- 
2.53.0

