Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D600E5650E5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999264; cv=none; b=pKCmFGqr1SAEDG6o/LmhfowfYsiE/lHZyAQperASzqGql/zHbvank2ntgV8QssZlz9NEYW//4jdUCWSBYK0Ya2/YL7tyHtgoDWrBlAW8RJVUcM0ZItGcboMzEMV5OGa94J5CBqzeE88IbX7Z1Hr4TV9TsLdCLPCCJbXY1Wh2Nxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999264; c=relaxed/simple;
	bh=HCCwccNtMSECrm+qSwkwcmxAaGpiINoZ+NAiQVr2tpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YFwL/7OtQ9763hjEC99Rno+OaWpRQIkR5fJxRQr6CWv8jsqMk7LOdq9hqNOVOK8lqMOp1s3TpNNB9YimZHBYS0UEWp1kIpWBsylqELv75PBAcDBJyoAAOguMVYuMjKQT699oGgc4r1f460hC1WTaWK8MnS/uERQlj+CYEse7aqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHtNqHWp; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHtNqHWp"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e6df2742cso681918366b.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999257; x=1792604057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NA2euEzeRdMqsgpTzmLVhgxwMW/bnldVdN9i+bZJu5Q=;
        b=BHtNqHWpGAe5rH0lbkmum0ZWkNmpqDGDmQ5K0PA53CP+pLwsPeLCSVHZNhGPfGQdNA
         7WkM/8mRRPDUlrJDxb0KAQ+eeFuk70vftn4izvQ0BlDLXwcPH5WpuIHFfllnYqN8rViM
         XzvvK8C9ETDxOHMWMM8s3W9ULbmhC1eWs5rqdzA35Mp+7bAa9kRg6WWhTTauxOtijEoE
         UeMiTeSvA1Rm7T/i2CE5uIoIRoKZbhYv1iRObBLTnmk8xUV8uQuk9HmGUrgsDGZtRPKi
         o3mjwGCu2DmaNAhS8aKWOFDeEpWn6IC1Q2b5g/DpgiJ6RPE08jvqinYq1Uw4Qm9LrkvH
         cFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999257; x=1792604057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NA2euEzeRdMqsgpTzmLVhgxwMW/bnldVdN9i+bZJu5Q=;
        b=kYK/yrSY7OM30bUV6sHNh3S37nyHfZRpLmhsB/3rX6wHurRsq7xBGAzExb4rlBXWRQ
         IZUOlXmLlsRerW6ujaFwPtFNMq1T2Mt0hXUVswxNDuuZgQONtWP3vMCcOi7e6YO9LElI
         p7YXt1w/xJ1p+VwPtR0MN/pw5HaNmwiboo+DRArwVKGIbnYK374+PNlUb2O9bVVu4SFR
         qb7uOoYOUq4DtThbMEeQVr8D3ekCFGI5DpAG0DjjF0N8UF5Btm1XC/F+LBZLLksok2yH
         SI8EX/evB1WxW867Ivxo3OJly8StGnYqYbfUs0OAbpObO9qfVRtFuMHaksf3zcTckdz8
         YQ/A==
X-Forwarded-Encrypted: i=1; AKwUvBxikR0nN3THMdeFcgmtfxnm/ggNzTRIUT6nv9dU2R8guap0PG6uESz24pF3Mqmv4x8oaoSlUxQY+Z02/uo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbYNCX0TBBcdUsVv4+yjp7TksihuRlkSiGGXI3YRMa+y2L96ct
	8rRUK6qT15byTXUwzGO4bBC7+diQmlut3tBEStDfR6eTgnldH0ZN12Jp
X-Gm-Gg: AYBFou2Mel7ViSRv6xyfelwgsPibrHow611sBWvh2C/iG8ZYZEh+p3yaz79B3bpk82E
	XVeDnoR/VT93jT/TxF8mRZr4JcBfYpx50nESpPzLhQm0uHn2bqz3RwsleuGGCmyOBTaeMQmdJKi
	A+3kgFT20et9/QDsprvYPoNOkrccgrWs3YDxMjsseCsP7ukF/carUZW2ATdz/R5jPAC4wYNN2Ov
	inyvQNTLQIq0DVcY9WWOmejGWJea1rdZfPsyQ81J19siET9fG+XLP9webL2BR8Ijy6yjiJcoQtk
	4rhPiS7XVDReEqZnU/JNYJI7IlHMnnC/Pbyl7w8Id8+xfwAZfyXmvI5GbmbmnNjBJuzwi8ps91o
	+TQmP6yAKQra21KDqO+7GAeS0lQ6Hvhi7rQMRJnQNOeR0f5/NgDntTswFJTwxV6cqizGDmy5H2A
	MoyJV1Kwm0E3P0dLDBLVTff+eTIzeIJzm3mZm9tI6QdV/193xOV+gVtfQI2JiiCbtp94ZsLoyFe
	ZwxqjwJg7r7uQGt
X-Received: by 2002:a17:907:c613:20b0:c31:be58:5dde with SMTP id a640c23a62f3a-c31be5860ccmr996157966b.40.1791999256915;
        Wed, 14 Oct 2026 10:34:16 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:01 +0200
Subject: [PATCH v3 02/11] hwmon: chipcap2: fix off-by-one in command mode
 retry loop
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-2-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999252; l=1031;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=HCCwccNtMSECrm+qSwkwcmxAaGpiINoZ+NAiQVr2tpE=;
 b=RsuuwGFjZjAk86aU3zR+Su6CJq9A+d9YVxs5nxpy2IuZ7mTpx8NWpC3NRaXYhm2iBTd/+HIra
 Ewht0SziE/dAF+3iSsIK6/BV12qi++CnXirSFkbLJhf/8FK4xAx4xx1
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

i == CC2_CM_RETRIES can never be true inside the loop, since it
only runs while i < CC2_CM_RETRIES. Use CC2_CM_RETRIES - 1 so the
last failed retry breaks out immediately instead of doing a useless
disable + 80 ms power-cycle delay before the loop condition ends it
anyway.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 855057892852..8102b6851d3d 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -226,7 +226,7 @@ static int cc2_command_mode_start(struct cc2_data *data)
 				     2 * CC2_RESP_START_CM_US);
 		}
 		ret = cc2_read_command_status(data->client);
-		if (ret != -ETIMEDOUT || i == CC2_CM_RETRIES)
+		if (ret != -ETIMEDOUT || i == CC2_CM_RETRIES - 1)
 			break;
 
 		/* command window missed, prepare for a retry */

-- 
2.43.0

