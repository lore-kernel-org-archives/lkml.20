Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3DC4A64E6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366405; cv=none; b=rjLer9ND7Jp9cMSCkp6cT3Aa2CdFh8H5DCxXlCuTxYwF2LLimksU2npZ5wyRNFLc82hCbJtvtmuz3P9YA3k2d4X5pqd/9wJgCGnjto3YLYEJQxejj0Q0Ss4Gb4PJVp5oYuXrkqNl2DVfG+plbcVUl6zwPdNORWmxBUp/WZLGu0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366405; c=relaxed/simple;
	bh=Viu3wNV3BMSr6b/InJgVRJi9CeKezTYBdRaQ1gQPW8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pw8Y/1R+6SLL4LraQv2oXeMU5VnjGRoJvSx2tq2diY4xzqi0bBsUTUpd5ZmVOmyijptAEcrTNW2VFs9VI0v5s/G2DVPLjpR8l9wDBIuauz0A/74/NX5zy/EtQl/nULj3mg2D87hrTcLwwv3OTXbv3QyEKw2EgtNN8b6RI/ZDIoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjvLvuOu; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjvLvuOu"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482e4998d28so976858f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788366402; x=1788971202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t06qVtjri1fJJ7rLlIaY/3pLLtxGChskI72GfqIm8sI=;
        b=mjvLvuOuwBMhhRFmsoTodwHQUq3Cc8JZJ94h+xKdrKYIPP/b/j4FEl11xX1iltQjGG
         6lvcMuYbP4beq4YJBRwOandxT7Ld0fafERkEHWhFZbb+NxEzcW1eRz0rQQbHpdky3bgM
         yhuyFZY+OAxputzn7d1tmfXlB64/YerzHhao/GOxb1xMjTSZs7cT55Wtgmy16diPIBjQ
         Zbq48Aa7HvguMiduOd1UmMB1gTWfhLf/m7QLyNswsbtnfxpDZYX3erNqLGw9rVGIoTMI
         pxIBjdhZ+OEfTn4xbKxz6UsCYF0bjn0BxNT8SJG47y/sq/6hjG84Z8cRHbEXMmBmC4sS
         5s1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366402; x=1788971202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t06qVtjri1fJJ7rLlIaY/3pLLtxGChskI72GfqIm8sI=;
        b=TkpDUozAIkSKHw+0oyi9YjF0wxIWfWqxt3SFlty8/GEKSqKo+5AOkGkMbs5ZiYWTYn
         k0zf1LEFr3WAoWEvGwNZqiLg9bzq62gBlLVeFu1XmEnAzKsHlQGqrRoaIoEbroQ5Xo7v
         tOFU4WMpyXOA7uGPQX9vWa4+6oJ6jdx/TidL/jqnP5t5ghxu9C2Pf5oLOAy/tAoY9AoU
         JReZVXd3GpDdPTq9Lv3QbuqTcK5mmF/folFM+9mES359kGYBQ9SM5ZsTwLWA4/zUbJRd
         T/b98DqbU3T3JRpGe5Tr0RiUKghAQRcVBFQvq07xA6xZNwIxFCnqa/bmwTB+DkORKX2U
         iMUA==
X-Forwarded-Encrypted: i=1; AKwUvBwStuhpdWVegh6Fj2t24jOEqrOpQ0Q6o1FyAh1RKSpiCKQ4vLNnSilvOiHE9fxXT9jJyXABJ69PadCfItw=@vger.kernel.org
X-Gm-Message-State: AFuF++mfBYordn10ji3jSlOLz1QwIcq4N0yP8W5SqtUhHhjIz5L4I1MH
	jpr1p8dzoqa0UD5UeASotYIbsGkqB0tXc0KWvT24voaH56twkIuxpI21E9nSCRus
X-Gm-Gg: AYBFou11GWn6pkrmEFBx7UEtx0+/8nfXP9R7fctYnQ03Qz9iVvi+n/NOyx6G4NV0/Iy
	DCOoXG9OIvlRuM4ddvl/7DlAfET4fIb0HoXGE/tfJTUJwnTEK5BpJUJUkGk/qZsevgk06d3Ttwj
	YVeE5exetHiwMHZWnZBrQxMJXwDmZ+bdxw1e6OwncT5eSGS+mnE1IMPOsxbp71kmq2PsBKTPQ05
	3kCi/U2qtdY2pPnXMKXt6gVSD45pQurwmimS/cvbrWOrw1fmROwBApjrBw9NTgMGNXJ5EErlju7
	9+ZVCmcz6Oj4gNO0H0gF8GoWPRDb+3UyxRgwzlZpzVRpwA6OeYja6Utfwx41sSky3c5BkGbewzc
	wMB1ETDL4m/kyRwrRzGGtPG5LpMijdrr9JPvu8eyxIiuzy4fLZPar/rxf4F22jYU7JBxzO6PK1H
	y01ZAmQWKuCQjyA6iN2BkBygBDFocjgF6PsbGe3SnsEORCsNaG89oKp9cwWPDeBooSKMLZ0TGaF
	e2wutuqOw==
X-Received: by 2002:a05:6000:2212:b0:482:e2f2:19c9 with SMTP id ffacd0b85a97d-48488decc80mr12007278f8f.2.1788366401674;
        Wed, 02 Sep 2026 09:26:41 -0700 (PDT)
Received: from fedora ([93.107.91.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80798sm6996004f8f.13.2026.09.02.09.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:26:41 -0700 (PDT)
From: Paul Dolan <paul.dolan.dev@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Luca Boccassi <luca.boccassi@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/pidfd: fix PPID values in error message
Date: Wed,  2 Sep 2026 17:26:15 +0100
Message-ID: <20260902162615.11531-1-paul.dolan.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PIDFD_GET_INFO PPID check compares info.ppid against getppid(), but
its failure message prints pid and info.pid from the preceding PID
check.

Print the PPID values being compared so that a failure reports the
correct information.

Fixes: cdda1f26e74b ("pidfd: add ioctl to retrieve pid info")
Signed-off-by: Paul Dolan <paul.dolan.dev@gmail.com>
---
 tools/testing/selftests/pidfd/pidfd_open_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/pidfd/pidfd_open_test.c b/tools/testing/selftests/pidfd/pidfd_open_test.c
index 318e6f09c8e0..c6698b7cdb47 100644
--- a/tools/testing/selftests/pidfd/pidfd_open_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_open_test.c
@@ -168,7 +168,7 @@ int main(int argc, char **argv)
 	}
 	if (info.ppid != getppid()) {
 		ksft_print_msg("ppid %d does not match ppid from ioctl %d\n",
-			       pid, info.pid);
+			       getppid(), info.ppid);
 		goto on_error;
 	}
 	if (info.ruid != getuid()) {
-- 
2.55.0

