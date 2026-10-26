Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013195;
	b=WbeVPI7qoG/dHPxX0kuDmpOmAq5nMLFQEEsBO6ueGGQcGwedftzCLhS/oEYyvq5DIPI4
	 W1rd1RGNRKK4Gw2M23SwrcRnsqFa9qktzaGw/cSsmeL6USah56L2e9DE9GYcoangfE0xm
	 g11nmBgpM2Y6V6CAWueCNgPcjQ1hGNLgQPxKGOSjW1weWUro2SzGKixp64ltB7cK4LzTv
	 2qIkwobNUBNqA02wO5pOZ9/zngNRJ2z21LD/GJdhllh8+RZGNzusg1FtTDRq8Ns0kxbNH
	 eLXDXvYLQfUs0IRvFnc+itzMj3l1AKkvQA3ncVsi+t5yRzKjfhpwXs/B4tqSXoUemsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=44FELyA7Kt+MCPXIDXpQzdpRkek5ze01af2IV4Cf03E=;
	b=4yg4gusI+DsW0iLqDAkowlV+CIFV7Z9URN5yPVWDpwP9kJisEJog6HY1TQhBMoSio2fm
	 ltFPlNVE3OZSy9m+zqahwjzgiH7m4w10CAR/6jSWThyTiS+z3q+zocaQSJ4GVi7lS7Rkz
	 s/mhXN1CD5vaNLuf3dvZyi4KfuDClzgfoieRQoS/EfEXqaa/t3nI8VErfzJh1kXQMM+Ex
	 SR7oFVoyoz1uENWntLc63d+lZWgdvM2XopwPI1RPJv+9ZW5GJlrcuzH2ATkcH4IurWXsn
	 YqZMLMK17q2zTyO+/CdKLbL9Zp0eFcdYqWH9dsp4b0qm1YSyrBjbB44GhkHOv6qBEag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LZhkHCHv;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00256606B952
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00256606B952
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LZhkHCHv
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06c60065fso2107422b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013194; x=1793617994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=44FELyA7Kt+MCPXIDXpQzdpRkek5ze01af2IV4Cf03E=;
        b=LZhkHCHvsoG0TDM8rkXqEt0JDM3s5J6afDon/fYUgfIwEUn8yS69oKHbD0ldlIdw3e
         xIzEwVnyQwxbSeEJVpqIsRwfOjVj2ldoL1gglmDlrrTtUz/G9qiFigfnhIH2QYaG6oNL
         PSnIp6dO9nTMmwhu2b9yRm5xfS12q2J9zCuLzCJqeUOaXLjmOOl6iE9XeuzQjKvL4275
         6njJwcXOehJHOUvvMOGPpHNZ+aah8uZlwciGDWIzl+e7nSn65CGPLYLj2ZUaNgKG1kvt
         lixrzQwpqJaNdZPxh9Ea/DCrsnLdFcHMcr7iqos6oCnK7wPT5gRH6uscec+S7t1nrLnx
         8Hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013194; x=1793617994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44FELyA7Kt+MCPXIDXpQzdpRkek5ze01af2IV4Cf03E=;
        b=K32n0PTK3OyYru23FCxhxgmwoDPsm8xvxfx7ODslAU9wMy27/bPEs2nnXFtsDuzC9/
         3t9la+aEwTLLOdDcJi2OnW9gZudcr9EMhqDLr3bPKNiP9MwMUxCOiFIFsBu7fWYrhIQk
         /Ztz8vBZ+/P0uWbvIGkKeymX2CAhFbs8wM165ncuMbKIo/Jjre4LudqSrr2mTDbhVBzY
         X1E0iPAK9y37lkS4DNTU/Qu0LxDk3Iokc2GuwCO12QkfIM2rcP7RwBGxNRww4lXG+dxP
         pIHTfawNjQ45vYIOxFXJvYHFBz0ngUOJhd9lGolOFJzHqTyITkMjVB6jpZY3skjGxQr2
         eBnA==
X-Forwarded-Encrypted: i=1; AKwUvBy2O1A/cTOHzPhCBDeZIz3G4gb9sPXU/sSqaG3t/H8uIJnVwXjnS8kZK8jRHdAcplIsRji+RbJVlF+dfxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7cCkOGMxFFunrEEY1Vp9FJB6rV7BTPWoau5vcBMa8vDgz7rw3
	/cHXesuBpmUhv3OweNGUKFMEcoLYLw8yaeYeD/xaCLQGuo3EDD8cYSAtupigPUDx+RSmPQ==
X-Gm-Gg: AYBFou1PI9R/zj/dpcnUxPuaFn53uY4eI5+aVvdzr9EpbqWH2dE8rrFp+g9bIgL+hue
	hPugcmSod7d4dN26aOpLHcWT4/oMPFb3K4KDoibvlS67Ngl33KyOyRYUB8nuxiOU5hHyRw8Q5gh
	bBgfrAeODnV0uQ6UsWcBjrWEjUVuRmSRYKeq3zadRqznXvpvlK0/00rWoqqHFKTG7IspYhjaGu8
	vK7XyRygcQAFOb5HTpdkxVT8pMuGx+LyWjNBYv1KPZaUt1rqRXr3n4KeqwHOnXmhzmzi5Lo4OP8
	5ucnM406s2TDiiSdLCs1ZC1zxlKMcelbGQfbvfEY2/bq8TL+dQbwCnsAKoacrwcWq03cwB36ZQw
	MzRUBqfNQjUrK7+hfgx4cvktM7dtyo7QMgXpzt2/4DjQNI0Qs+E+8+da679EZPLIjXy6586Lr32
	59x42wKZxCmOLqkamoLJUsq6aeXPlhtMwS6HQqC+wo/T7NpfQvGIQ3SeJ65vgl8LVlrdr+NgPYi
	P1gP6KEfDFDAJ3pPaJQ3GUCQ+jb8cKapLcUqnAO
X-Received: by 2002:a05:6a20:914d:b0:3e0:dc12:8908 with SMTP id adf61e73a8af0-3e7cd50c6c0mr5002050637.81.1793013194179;
        Mon, 26 Oct 2026 04:13:14 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::8534])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fdfefsm1128535b3a.50.2026.10.26.04.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:13:13 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "Lee, Chun-Yi" <jlee@suse.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthew Garrett <mjg@redhat.com>,
	Marek Vasut <marex@denx.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: acer-wmi: fix UAF after accelerometer registration failure
Date: Mon, 26 Oct 2026 19:11:03 +0800
Message-ID: <20261026111103.4158855-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When input_register_device() fails in acer_wmi_accel_setup(), the error
path frees acer_wmi_accel_dev but leaves the global pointer non-NULL.

Since acer_wmi_init() ignores the accelerometer setup failure and
continues initialization, a later driver removal or initialization
failure can call input_unregister_device() on the dangling pointer,
resulting in a use-after-free.

Set acer_wmi_accel_dev to NULL after freeing it so that the cleanup
paths do not attempt to unregister the already-freed input device.

This issue was found by our static analysis tool under development.

Fixes: 1eb3fe1d3b6b ("ACER: Add support for accelerometer sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 61ae622c93d9..26e17aa04abb 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2681,6 +2681,7 @@ static int __init acer_wmi_accel_setup(void)
 
 err_free_dev:
 	input_free_device(acer_wmi_accel_dev);
+	acer_wmi_accel_dev = NULL;
 	return err;
 }
 
-- 
2.43.0

