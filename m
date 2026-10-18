Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFC1448391
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363369; cv=none; b=hEtoZtRDfEg6yDDVbSKeK9mJI5FzgvJti8eknSQjiMz2KAiKl2e85N69YBmrcuOGJf9fln5SlODbMwliC0/zTDkAagYGkObG3lfVtDdCGISifuQD9CLPH4L4jSY33x6LOaFCKQH4TVaL43Xu6xhr6mybLZjZv7e2VSaEpDcGtn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363369; c=relaxed/simple;
	bh=LLL8YnAyUQxPSK7+xdsfZLm9pB6HUgKQPfbKvkRhwDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OYJcwDespMsIWj6226mZp7THjThBVE8M1AIfx2Ddtfg5rAuTpqihCMIYQWT1EwkWHRvFCZkwklNHs4IsiBvF9TGuvDw0/mZ5wNgaY3x96/Fvx2cRIwapuUmxNEHrYcpAl2au/yjtaT9dD7Iqwd5lYSgS2XexpWyL/ioOMgoUS4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUyHTmxc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUyHTmxc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so13077365e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792363366; x=1792968166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m1qlXxPCKnyZBMqZS+UI2tKQ3hqkztlpBKb9IkUQpHc=;
        b=GUyHTmxcQH0liyz7GPjeerzsIWLWVZB1x4J0rczvesfQqBJLpSlHartSquxIAO2m2z
         c8+o1OgFwyS18suYL5JldW/YZkPoevfM1yS3ou54d58NOh/7YABSBauhdTvRI3sueL5x
         pnXIluuvs8vYN1ASolU+6me/WQpcmJzUm7NuzZLpO2OtDOLz1ekXcYKmyygoclO2O7L/
         mc38EhCLNQEVCYL3ntuN88xEah3roHDSG4THAxJrjg2K5VpqfLJVNLbL41/kTadmdtAr
         aBgC6v47PnmPG8PeQMaRs1Bfk18TZdLd6DEZ6ZL0elcBUIUy5QP66XcLp0RO0fuKQc3E
         AJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792363366; x=1792968166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1qlXxPCKnyZBMqZS+UI2tKQ3hqkztlpBKb9IkUQpHc=;
        b=MBTIiZl/ix6lESBFiUG0xO+3jZ+uzRthJuz5vPUiJJr7T5VfYwAO1jlYpLn48QLX8M
         imFGAhskdI8HmnFBYI0K2cv3fzYsaLFwU5lAhaCjcSK4hSRKpkeI8yD6KdKss8K4GOv2
         Gwp+V1GOeb8k/mgezyHwNCWZtqIPj0190QwNX2dFdot6OMfvVbAKJ3gcSIK/JVecpq4+
         VcjWrFqKbv5ql3fKINY7gd25SyWOLqz0Y/lEZFZk9Ys5fOP0t8SreoaDE9rHnQQDxSWT
         3HWjjtxoKYL2pTQAAL85S8I1n7esd9iYRhd/va/GoCLJUj09VQFLZ2yLTdJU7DIaxboy
         S8Mg==
X-Forwarded-Encrypted: i=1; AKwUvBx+RlUksJUVEOubpT2nsjzTLkq5ED4hGah+wCox2vp3972M96nlM3R4Gdp6Y8S72kqoJintWdcsJns4J4M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJPpUPWDMrzz3a2iSkAD2Br5n8Ol6fwN5jMrU0vA47davp5aKj
	r2Zwcg+MOiksTQepsxBiTDZPQL8uTm4xniHt2WG06VD+xo43RpO1HFwY
X-Gm-Gg: AYBFou2XcDoc4tyoBIncokRRhzfUBluCnxeMUiIPzk1rjzTe0fh6Gta4uWFMp3Ygd7G
	/GT52XIg2JVEC65djsABrBERiPnKQvj0TWNnBcgCUhnn+qRS9CS/6SiwZa3lmbXxU2Q6dkNHwaF
	NQBxWvg4Lye8uKFCcJ/X6pscnfrS01qV0znT01qyG5gRS8V59pAbZOpwnezrvQuS9ODok1C1hNl
	rUCtthQ8iUT/z4QxSYqVm6O8J3r5VF7H0TDgHmUXTZkB3VMqAlCbLH+lXqjBTM84rrs4diVBnjC
	1EewqmkUWVA0dlj0woFklIYjcMO7/390A2m+auw4vJMenWjfS2H2JWEGrwugu6VexNpXnuzoh64
	p0OZyYYOtvGf3NAt2gRxIlUtocLDka93I5URY199hRwXn3nycNKaArOmPynD6CZzy4lmsEhOhHW
	o+S+MADRhJhCti+4UPwZ8mSyxTsocdB30ANPpGeJkY1YzdfLNaEmuG1Z8IQP3VQ5jOWAT/ltYPx
	N2uYfgk2B05W4vqHrFmx20/jvxb6f9R4lRKM2kp99Ev729yaH/3sup+KdbPfFit8UxE+UFY/uGt
	yaaaw2aaK6LlzBfETKVA6pafZCWRKUhqPfmxRrQr+2FGibrd302eRz4+bpa2CO7LYUbDsgWr
X-Received: by 2002:a05:600c:4f82:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4a1df523fa5mr94086665e9.27.1792363366271;
        Sun, 18 Oct 2026 15:42:46 -0700 (PDT)
Received: from localhost.localdomain ([102.88.166.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm140396685e9.5.2026.10.18.15.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:42:45 -0700 (PDT)
From: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
To: outreachy@lists.linux.dev
Cc: Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Okhuomon Ajayi <okhuomonajayi54@gmail.com>
Subject: [PATCH] staging: greybus: fw-management: fix argument alignment
Date: Sun, 18 Oct 2026 23:42:41 +0100
Message-ID: <20261018224241.46011-1-okhuomonajayi54@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the arguments of the fw_mgmt_load_and_validate_operation()
call with the opening parenthesis and split them across separate
lines to avoid an overly long line.

CHECK: Alignment should match open parenthesis

Signed-off-by: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
---
 drivers/staging/greybus/fw-management.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 5d01da6b6eb9..e20e9136c106 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -434,7 +434,8 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 			return -EFAULT;
 
 		ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
-				intf_load.load_method, intf_load.firmware_tag);
+							  intf_load.load_method,
+							  intf_load.firmware_tag);
 		if (ret)
 			return ret;
 
-- 
2.43.0

