Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514236;
	b=z7VrcYqcZGOKMEYeYO/wNQqalKgtuwAkckFdNPMiWULo5aGZHs3OOyVJ8l+aYKRxxqSj
	 hWzgxxafTrUKPw8X1DU9sWG7U2Xfz/dMdOMim3Xd3oNjBba3AsUPJMyyEVvqdtIZmF/Ma
	 IZXuGVRzx4SbyY6UsT7eaksde+ThEBp3XzvIB3VJCLQYEvoWlbZAmWw4YCLl1LNKJR6OW
	 h/p0LCHYI1O8E3wLol98NxZ20qr0vs6LP1oqcSTGZ4hmsIseqSqpyoVl6B+V+0WZ+cfC7
	 Vpv+WuWrnKA9l07TC8tvaB+VHpalg6JdrPLeZ5onY2kBV0BR3UauLW5fDWIP9fF0pOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rDJB4+RNQq+2GGn7bCoZbRLSivKXqiepj5wyQ8N3btg=;
	b=3+UQwktqLE7uy1sI2bzZFS9KI9AD90u3puShF0sCx8kMF0xeFPp3YvNaYMK9jj9VsSsp
	 JaNOimnuFKoGZ8AkY/3LdohnxGQROfGLn1T3POi8U9ESKNBV8Rf7KRUMW5RqvIh4bkjtg
	 GPUnmeZx+6fUmiTJUEXc7a2LN0IWfA5J5YWA33TabmkDFYrMN146TYGGdxYrFD6xnjucv
	 8N/ctRj/QpK0Q3t2m4dlsXE5tvdEcXrsQdJda2vm1lqr5oZnvPolqE0qDiI/1GVjgJXxc
	 cVlwEuxABW2v6yRQ5L0S3rFdKdd6/SWrQczKqm9LjA0zglvVg0iTd/O9TvmzW7qAd2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XqCQ9ygA;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D00960A3834
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D00960A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XqCQ9ygA
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e00eee27dso2055657f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792514234; x=1793119034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rDJB4+RNQq+2GGn7bCoZbRLSivKXqiepj5wyQ8N3btg=;
        b=XqCQ9ygA3wdNL766DLnX49Mjx7DsoaPHu8/2dY3QTaGa13+55YliyIeJlbSKWDDBOP
         kYigoY4GhBCVQdKAz1o1oBZDORZ+eFalLv21PwR74pEt+nDMa3gCye3AWoLEIm4OKi5F
         /ll4MSTjvSw86Zfh+maNyroeCqeMOCbU3t8AEXt5PN9kFdQu4qHLk8I5chiFBIcTXffv
         NLaGKyb7QyFAPSnt0Jn9fcHTCNevUjp/07zrR6w2o4Xuwihix7RXyLubvnSm+YUGMDR1
         8hLIdiZCyPB7aGLM5upx5Tu5bMkIIQ3zichayBsVZLBLx1J+bnsnybi7zPIvy08+i+7A
         V9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514234; x=1793119034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDJB4+RNQq+2GGn7bCoZbRLSivKXqiepj5wyQ8N3btg=;
        b=FpzZYQ7pGxBljqoUnHhQCBX5ZDC9Nnh7meYHsOefSQJhv2Fb/frMQLxZedRAfMmpth
         zXfRzLF5E1Gu7LscQty5RruQEzlb/657bLuscNG8TbFt6LidFE80OiP76kxOh0KfFJtP
         ObfeBha4ikO/8XZUJEP5KilTjWy9nclyfvx5sCTjIoIrYNcPFo9KQhKQN20xTj16sakL
         IAfIsYGI38sp9i9/cIW8QZX+eQDXiUNyDZxbxxEum8x/dDGPMRr4F2OOdhZwe4JUOTAC
         oNtyhjYUP4zUnJxGQ56LSjev0e9Yc5PQakEaHSYZ/axQChzDLmc6s2/YtfykidCqB2n0
         Fcmg==
X-Forwarded-Encrypted: i=1; AKwUvByVfJ0urhGimPvnWx2l6FPTqnHYr2M/K9eHUwxqzs84hw4QrtFiTtefvnj76tzcvp0fuK9DdbQcPpFhU3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIi4hnDGYo/jJJG/mBdCwxQpMgCUZM3n4GlH8BW37LBl3UkYeNf
	AoufrM/JJ4CquG4HWiavsypi7ApwqJIrvi845oh5IISeeumqbm5c0PUO
X-Gm-Gg: AYBFou23E9sEXzUzr9aR83o0BcO4mULH9ZqJ3z51qgj9SW+vjkJqyWuCbmra9DlkOzO
	/Vgp5lrA76mnqsNGmDZlTfNwlln584rX8teVTjxpbZ0zlh6MidVO56AfII/IhfkDcfVzTzKWOBH
	uBT0vSzf+fu5xSDaFAfBJCuSfstkFhr38/nWJK67sjgXhLbt9qF2UCbPXE2cbc2SHJ6Uhdj2TKG
	n9a26BL1OfY6X15lV8ZvtMKq1CDyk/8BPpKNe6MygNZhb8PebiPkO5MOh65ryzMfyQd/9rNpEkg
	eeLaCXa7O07Ve2H8boEjd3+JcCSEgvDkHCws6MvAFvw89tqJ+vxwbRnwEGVT+6kleghmjDFY3lW
	EyePY9O8bg6DCOigX4/NWhwFlC5M+O88r0gr6NeRa3b6WRi0LVHQ8dEBNYLQ/JoijHssmQRuREc
	52KKn4ptB82UYQ6TtPFk2GjxtuKXXxJMJ586kEBxZExQelqgH7496RgK+P7MsSVt43TjBG11a1z
	rciQ3aKTELvmveR1n5e4ObqQe9bi7XLSqs=
X-Received: by 2002:a05:6000:29cd:b0:48d:ff71:dd8e with SMTP id ffacd0b85a97d-48e079800c8mr15957718f8f.3.1792514234297;
        Tue, 20 Oct 2026 09:37:14 -0700 (PDT)
Received: from Ubuntu-vm ([39.62.145.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6db78csm7471967f8f.2.2026.10.20.09.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:37:13 -0700 (PDT)
From: Haasham Khan <haasham93@gmail.com>
To: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Haasham Khan <haasham93@gmail.com>
Subject: [PATCH v2] staging: greybus: remove unnecessary goto
Date: Tue, 20 Oct 2026 16:36:36 +0000
Message-ID: <20261020163636.7629-1-haasham93@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Remove the conditional jump to gb_error, as both success and error
paths proceed to free the request and return the result.

This simplifies the control flow without changing the function's
behavior.

Signed-off-by: Haasham Khan <haasham93@gmail.com>
---
 drivers/staging/greybus/loopback.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index efc69c10cffe..284935fded12 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -609,10 +609,6 @@ static int gb_loopback_async_transfer(struct gb_loopback *gb, u32 len)
 					     request, len + sizeof(*request),
 					     len + response_len,
 					     gb_loopback_async_transfer_complete);
-	if (retval)
-		goto gb_error;
-
-gb_error:
 	kfree(request);
 	return retval;
 }
-- 
2.53.0

