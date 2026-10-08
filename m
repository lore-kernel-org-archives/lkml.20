Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E933BFAFC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439427; cv=none; b=mb9FVcU0ZebIMlqCDUisbpL/yveWnqDdaiLZhVjkZ/aacsq6xlSgUHFkaCgAMcb1Bhw/oDtJdejKWNxqwYmcsb4O5Kbs90B6OSOmzy2xr9Alj2oLQKHUOHCEVpA8PUKnqTpqBwSr+n6TMeo3Lzap3/trv0Un1wSG1AEImSUErqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439427; c=relaxed/simple;
	bh=LogPqtRI+3Y251ECMeXLKVerF2MqU068FSQUU1CxGQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M4Tjw4EJn365JM7ND1Ssap9+WawSY+QzmJJXeSbU8dowZaxEoTG2x3j7TLt+BwLk5Wr7cLGyPZhPh2fYhGXOjfHgIOYBsdKn5V9ID7WsRF1HnjR9yhAiGALaRKEqcdkPfS1UBNRmm8gN7tQg6+z/nXpUkhnvuUXt6mrGRdrY7BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfzEIrKo; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfzEIrKo"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-34c4a0868b6so4442304eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439424; x=1792044224; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vG8A5DHOHEm0r2MxX5Tv8Bi5dsLrsgnlM8XJb+VYSKY=;
        b=XfzEIrKoH+6CkUyAKSMvV7eIkCwlNgY2LM4QzjjDG6Buq/qPk72n0RyRNXxBCCT7tW
         Uf1rjcchoFHa5wj6P1kz6nOGq4aDlgh0YmOyCT/goGNZlFTmk8HGdy/cBThGck11vajU
         e/71JO4Vezcrbp2QRf23/eNUUo7UnVnWp4VoHAgial50dcSVNDg9aswufaYhfQ86ERiF
         39fWaGW0d2jLwaIxoKZE4rAVDaqXmgK/POYL7hZ9Ss7pGSSbiH6AR4RyMEpAN9WiiY4/
         8f5M8SWRqHRcoG3QVD2WxnQPamsKFqz4oM5Nl0k7WsVGVfQdppbWXp1smzYzcVLzPxY8
         /1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439424; x=1792044224;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vG8A5DHOHEm0r2MxX5Tv8Bi5dsLrsgnlM8XJb+VYSKY=;
        b=WCVKaBUcBhmJ5xJW8/HJnw7/Eq4snFqAAPa6/Ep7tK3lq2t4QD56i3ZoYh3n8dvWxB
         jvkjGZC9AJe2hsWwBvzfDPi72rmOOHQQ8T4HEeT/we8lrPFsinW1LIuH1PdR1Lwi74FN
         uCOzTvOIwbzvoTx/10yzBDCxfenEjP+/XkycGFsiR9j9pHvW8FboA+GZogipsZqPku4R
         Ox41S4NqfpzDgOTW+5N6sp3qC0nSCzHsZNWLR5wZ/uVIaKpjO3E2cpakTAvNss9x9D8N
         ikWYOT/VRtI5z0zBL3ErPsp7wZeMIsZkl73y9leRZSh+aAISWk77SShMA9M4rznGUFW7
         ZyOA==
X-Forwarded-Encrypted: i=1; AKwUvBycg/i3EAiCZ8RibU8U2PiTICTkh64RPWrHAWNLJsyxWoAYzl2L4nTb7b2zRdDR4r4sVJGxYVl4JvrDB98=@vger.kernel.org
X-Gm-Message-State: AFuF++ll/EqjFl3fvJ3hBBShSKCSF02Du78E/qst8Ljg3olHi5fumGla
	lwUwCbPHeqAsGRrpy86cm4h9LIp0W1+FFlsj3q0W2224oaDuoNn1Xd/d
X-Gm-Gg: AYBFou0gMN4ztTkW9OyxgXxo+cbIng3aAU8RYtY5JXESuKnIMhT1mE/3kL4cIZXHC36
	u2jBe1/oRQivqQYT1uSwQO/1uZ/Wu6UqXZjBGrCWh0HKwsSbQ8Ea7tQpxvJimdgv+fUgZSBf8Bp
	G8ZX7HC4zWlMyImwJROMxvY/XKsJ9ZMfqLa2oLIoU+4WUhfCAwKq26LNW8F/7k+dEUSl3KdBbfm
	c/el/UYsdEdpMSX2eKxyPcJon84rc0zkrmjknJ+lfGNANHLytQm/zAB/Z4YgA6DMFKjXEUooc5z
	hKgr9/L7PkP+GdkR7eg8BVT4A8SVeNmbM+s8K8bpOvXEUrK7ZHUiZsqjbbIaGQKFGp87pRluNMC
	By/yxrrEdwjbvmsm5RtW60GI8Oz7DJajq49xjm6xwJQ9rLPSZxt6/U4CzcrQeYj6OAOlqz8W2Ss
	fvIENkaCciF5BYvq4J75cYkab+oHBbnTBfE+RVO/mrEb6yuTZoits80cImfzZsfttE7xS0QBnQe
	t+xn6SPMj5eSHKX5/zJzhhMpRF53+CaM1aWM4ZE
X-Received: by 2002:a05:7300:ae97:b0:34b:6f6c:2274 with SMTP id 5a478bee46e88-35177712b36mr1862469eec.5.1791439423696;
        Wed, 07 Oct 2026 23:03:43 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3002:e11e:c053:ebcb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515b02d552sm22832634eec.28.2026.10.07.23.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:03:42 -0700 (PDT)
Date: Wed, 7 Oct 2026 23:03:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: axp20x-pek - drop redundant idev->dev.parent
 assignment
Message-ID: <ascyIezYwLuoqmtw@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

devm_input_allocate_device() already initializes idev->dev.parent to
the supplied parent device, so the explicit assignment in
axp20x_pek_probe_input_device() is redundant. Remove it.

Reported-by: sashiko-bot@kernel.org
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/axp20x-pek.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index 24f9e9d893de..c34e002258ee 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -241,7 +241,6 @@ static int axp20x_pek_probe_input_device(struct axp20x_pek *axp20x_pek,
 
 	idev->name = "axp20x-pek";
 	idev->phys = "m1kbd/input2";
-	idev->dev.parent = &pdev->dev;
 
 	input_set_capability(idev, EV_KEY, KEY_POWER);
 
-- 
2.56.0.385.gd3acb90ef8-goog


-- 
Dmitry
