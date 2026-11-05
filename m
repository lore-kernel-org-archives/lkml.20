Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854041;
	b=nTqTJrJHMGbCKUpnjpsX1NZTX1P/yoygoTaTEyFEiRM2DV2zJLXelW5b2O+zAo87rJWv
	 2+fSxOGJlvLfTDAWGpw+uWHCkzlGq8ZuQOWbMsYIJiF3mZ6mtRiSVD5H6PKWawq/92NKh
	 PwiXaY5vFbvc07Q9bmASEjRtsx39dNSUoDCetNdpkOFCh1cruvw7f/e7jHbqfizbiytHl
	 BN/6a95RtkVv8aCLoeMt9xmFsLdqsXje4WUo+0TiAN/EsMdn5zpwGtf6GVKBUrUjSSMwg
	 R/FlY1NXTaO73OqSjyBtaBlE3ipd7OeFxFgnrM5d46vWIx3hNselcAs2CnwOWuR4oMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GyuaTqMYNmS5JsviQOab4u/oXrUKmx3oHJ66xNoxHJw=;
	b=ldsqpAUljZsoCmzMncRr8tHISuq7pPmarZ4svtVJ+WD7jGjps1LSdhslN5bytmasc2Gi
	 3CsdXOi5tvO309zKIop1+T7l2XVIrNyoaoebbIqYESPka/FcdbF42Ex12KCUUZuEH/7Mb
	 NZ2ftOYWaeQOdIwzh/Pc9AW83Y/XtvXTOw6MqNGZv3vZ3c1yhtM0P+9darIMr0BTBzf9G
	 uM9z8Kdj/YV5TJkZhp/D+NmBQ71idBJFNxbb2NXDr1ovZOGG4Yaycv6EuWaU/UfGgzMGi
	 O5i0yZRvVMH00AXW8qS0Q10DQ+4NK42CAaks0d3b2vuTueEnKfU6NVgkdnnxpCEV06Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G2zPK6tX;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A842D606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A842D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G2zPK6tX
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2536758eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793854040; x=1794458840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GyuaTqMYNmS5JsviQOab4u/oXrUKmx3oHJ66xNoxHJw=;
        b=G2zPK6tXSN4K4BADvYtW/I4EFH/UjmRFSJZlXeEXKCnSaWTz8G6oP+r5mE5FykLpaz
         eWNaVuzIOYu9T4YXJ3kHobHJsx6G6dAC7ZKXE17726ZWKgyV3UMnUsp7HOV8qq5TsyX2
         zq0Mc+1fo+h7uyCh8cqlOodZ/UZ1V/LJ9RRMG8vAZob4yFL7OWHmpXtHtf9keNX1eFSN
         FBOrAccZpQ1FpWqj5ZotoV5G8UVbhIL7TOOwAtfitdf1Nk6pySACo/3WFqsQpkdh7rzN
         lXNtLBkiXtBhfUBGveqaESkRTsE2TO4L9X6ciNeA8kZ28kJ8T7+eaTbeUYBEvCUxWTGT
         dK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854040; x=1794458840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyuaTqMYNmS5JsviQOab4u/oXrUKmx3oHJ66xNoxHJw=;
        b=oPoeDVB22j8VZCWOAekSZHl6kI2qXbCkWa+9fpFXMybeb4gVFctdc+sJA695CJouSH
         OLu6i0K1rYWeE/YB/QQt04tW5sq++ivt02bEKv1oDrX2zzbv5eUuA53MAnA/pJ7+g4xJ
         ue6Etk/AZRJztqmLJfwqEMGIvDUCvsYPSsChI+PXGyUuaCCNvzjoWgAGD4sv+G0SfThw
         KzEexRJhDzynhzHIVGIrqMd1YwMJmrj1jVUQ5YjU++ZyWQteCheaTGzknikfuyZ2saA2
         zHtMdhexQabCbAzqUlyCbnYf6bvdcbmvlMOixfh+Gf6Wz6mqVnUGZATtIUY4Y0LYv/Rq
         2z8g==
X-Forwarded-Encrypted: i=1; AKwUvBwbgtJb0Ze0x79XPo+I5HSz1Ufbb9ZE5BrR0+6WOrEMQTi7T4s6vUGSd+YD5xfii3bHiCT1dBY6ys/DpNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2dpURFrCZQ+TxakT/sFDfoaucrCX+KNo8rfbZdSv3/ow5uko+
	wLRC1WECZA2YAPRhz/Rg1JU6M5NBPXK0C5uZQLkrugAw7EcxBRr9uJc=
X-Gm-Gg: AYBFou1LdNlUk/Cucq7p/k2RN8rc8424EAOsizjrqXWPG8FP/wGzVAagnVI65ktyVGx
	0kCeTqIHYqx8JmQosTSwRnq0Ah/p+Bh6LV8AYm2BEi7TRyz+67tC83ysqwM03sGUsAhKe243FSX
	y0gwx/6T8qSveJz4LlQBZsBYWL+b4jhwFhogeuZy0KC4p4LBATMrurPDxwTEN08j/I19KJEWf7H
	z0ItocZrI39nOJzcaWIOeqG14PhCeOO8JX9lrXeni3hdKQLEvAHz6d82Qf9pJmQ7Q40gWdbB3FB
	b6BYIXr0qzMW7XNhlnxV5vBAZUmObqeeZ8dqYBXP/RKVDGxtZQdP6F2Bpn9hcXVvV9qvvu+vibc
	eZXaY8rjzqcsiWJzUwFUTYUEpa5engBqXcyasuuamupdH92iW/lJFx6hHkyeXCtuZ0G3Y3P4rdC
	dNWS9593uxm7fEjvhGcZ+ThaQgj+aj2T1noCm6hGvBxmh8gNHS81mRLyulC9KHF3yDr0IAC59rq
	Bl8nKajJB5UfrgGPpxrF53cT3o8DoyWSEsPqmVxnG3EF9ipPeX82XvbutgFEkeaOJaiOYcN3rHy
	OkQh3NtXnFBEDv8O81jrwUcyydi96Rqabvc1/KMw0xZ6Ydl5u8RnuAb1G1ZWwnOkFkMq
X-Received: by 2002:a05:7300:3aa2:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36cbdf9be3bmr5924825eec.28.1793854039490;
        Wed, 04 Nov 2026 20:47:19 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a599:d119:deec:193f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm13076247eec.13.2026.11.04.20.47.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 20:47:19 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: chrome-platform@lists.linux.dev
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-kernel@vger.kernel.org,
	Nick Crews <ncrews@chromium.org>
Subject: [PATCH] platform/chrome: wilco_ec: Fix device reference leak on open failure
Date: Thu,  5 Nov 2026 12:47:12 +0800
Message-ID: <rc-review-20261103-vc-85-d1e3d35e7c31@gmail.com>
X-Mailer: git-send-email 2.50.1
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

telem_open() takes a reference to dev_data->dev before allocating
the session. If that allocation fails, it returns -ENOMEM without
dropping the reference. Since release is not called after a failed
open, the device data remains pinned after removal.

Drop the reference on the allocation failure path, after restoring
the available flag. Keeping the put after that final access avoids
touching dev_data if the put invokes telem_device_free().

Fixes: 1210d1e6bad1 ("platform/chrome: wilco_ec: Add telemetry char device interface")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance: Codex (LLM) for ownership analysis, code and changelog.

 drivers/platform/chrome/wilco_ec/telemetry.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/wilco_ec/telemetry.c b/drivers/platform/chrome/wilco_ec/telemetry.c
index 45be318b05f6..79fcc46e4417 100644
--- a/drivers/platform/chrome/wilco_ec/telemetry.c
+++ b/drivers/platform/chrome/wilco_ec/telemetry.c
@@ -250,6 +250,7 @@ static int telem_open(struct inode *inode, struct file *filp)
 	sess_data = kzalloc_obj(*sess_data);
 	if (!sess_data) {
 		atomic_set(&dev_data->available, 1);
+		put_device(&dev_data->dev);
 		return -ENOMEM;
 	}
 	sess_data->dev_data = dev_data;

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
