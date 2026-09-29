Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5643E00B3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790655295; cv=none; b=C9Z2Xv0s/qPUfCxvnaTYrgj3wlXficC7HpqgLLW2qMHg0/U54sdNo4z4LP64sZg61kx3IOOJFYpZ8VmqcThuxwzDATtWsPgycpZpRdivCK8iorG2vzZWtbW6dd7mydZ2yf4ahymYnVRwctd8vII9PsGIUyp32yAOZrEeI00nRtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790655295; c=relaxed/simple;
	bh=cFXjq2JXCSfmvvjsjl7kaIwIGpfd3uICNYyzTRRVr6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RGtskiMPN38n7FmjJuVEkNotp2IhBcA2Q6JQJxY3jF7Dc4Hbsn25uCj+dJ0f2t2DM+NGOXHXstefhGNiSSXFNTmRqcqFV1wKF27x/P24eZTdrLmBUCl1gTPIbkB9AUAgAhPR3vTXJaciVxg584q6G+pKthBPWdrgGx9K69tLmD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=U2qJSkGL; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="U2qJSkGL"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so22510945ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1790655293; x=1791260093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/00Ko7gZUPuAiTpJB4dBnk2KXfjE/uS38djV/L4NvE=;
        b=U2qJSkGLwVHNC75N3D7jHJg6yXV34LZXxTC1qYxxz2WxEbXt/G4Ai8Sb6x18hcbyDj
         UJWewIbqzQCXsom078jmIevHvMWaTLYNWnkPBGzhxEWYl8ozBK85lzx77xxTxo2O7aUS
         axhS7hTfDqSp1CLVlYUw0ryWS3cMozc7uD+iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790655293; x=1791260093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/00Ko7gZUPuAiTpJB4dBnk2KXfjE/uS38djV/L4NvE=;
        b=tXfiXTM+YJFLsGBPzvzoL70L8gIYnxJi7obzbBI/9IrVqibWMBNuaZ3AexCyE4Nsna
         jXW1Se0hI2ZmPwgylh7cjThj8K6YvDsCDHKt8tOUenIhhmUszV/V+yhhOvN3Gmdqyr2S
         /FddibFoLk/Ck95qiIPhfKZmK9Qfd6eeHgbhUTW7NUwSQp1IBkX4ffCX3hb/u1mQErko
         Qqbw0x4GfeW6gOO6cS6lmpAWjCnYVD0KbpAkf6UsoZFX+iRhxavxQLjRyDehqhjF3OUa
         6EGd6ygraebPGyVje8IRJFQmrbCEuX79QV7VCyA3vCD96tvK51bTlMLPaumzTSmgBQjT
         AgpA==
X-Forwarded-Encrypted: i=1; AKwUvBzRSys5KBu3r5Wvx8XNEnwnN8rie8cHv1Tk6bfI4xxrx+DThzr3wlxl+DrLdkmwgOytUWqUYvQep3OpAZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3eRg3t0UBJJ0/1iKZf0v2cG8vC/KjkfdCOZhY+r9DshVd8Oyz
	vikv94JND08uPl7c/RBW9APT/20LJ1u7SIZhdwlM2ddF6wB1wMar4jpmS0tcDi9NKT1hCZGfZV7
	GtocC
X-Gm-Gg: AYBFou2OpGeCItHgWLNIXWEksmGHm3Zk5AxWcu9EyODmvb25zGqPC/xQa5VZqZKEx3t
	viLxNwmR3eBxomDy+X7f5pNgjAvTDiM6BrChEnRQFIFtn0zgoosJUQspHfyZ6VrbQqxr8vmbV+/
	FECmGt0r1i9uWVviDLIADvG3yxoC2O6jLStzSqS/LZDn45JRmFm8f8nWqv8syLVlXqEqj/sm5/G
	jWscPEsFtnJ5nbf6/Nhn0/GKLE0Mpz3LzIGKfVZv+n90kkwx0Ol0dcg3lIcFEA9FUaPM7ctaH/2
	Lq020c4xV5EpzE/uW0uVIwKvcbjg6CXfrwEjoc/BD8FepeN+Bl+lOX62hgI+5utCrYF64RX9Hqa
	1BTUGAI2SeOQkxw5FzzlYNnEbLK131mSqX7IMWsdnc/F1qUWluLjPxjfTHKYx0TaT5g9ofNa7ia
	VOnrdYAZ0XUb1OhidbRLLr/zzlL8ClopI/raHf+jJXytchDTob52kXC6Arl6EA/Cmi6Krwo2ONO
	8sTeHoxOIMKHIzJTkg4cyTIhELrdT+uOQu7jZXxZmtARqi1lCLpg1NMJiDu55QCz8uE2/8myCB1
	XzteaTTjQ1K8lHHRgAVfWAvr3BgUxcDUioilhXWWUXvIg11hqtuGRY3eaY1SkzcTEMhSPO9nlCe
	+fN4FpmF+jczSBuyvVD4DOzD3kGLeXNeGUbaupOjboG0=
X-Received: by 2002:a17:902:f544:b0:2df:98a2:a2e2 with SMTP id d9443c01a7336-2df98a2b3b0mr90144685ad.30.1790655292825;
        Mon, 28 Sep 2026 21:14:52 -0700 (PDT)
Received: from aegis ([175.158.243.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2c6f46976sm3192895ad.22.2026.09.28.21.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:14:52 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] i2c: qcom-geni: restore tSCL with 32MHz I2C fast-mode
Date: Tue, 29 Sep 2026 12:14:43 +0800
Message-ID: <20260929041444.9837-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit cb97bf3d4f91 ("i2c: qcom-geni: Fix hardcoded clock index in
SE_GENI_CLK_SEL") allowed GENI to use 32MHz clock. This changed I2C
timing, making the Yoga Slim 7x keyboard (ITE 048D:8987) unusable
on all boots, and touchpad unusable on some boots, resulting in:

  i2c_hid_of 1-003a: unexpected HID descriptor bcdVersion (0x0000)
  i2c_hid_of 1-002c: failed to fetch HID descriptor: -110

With this change, t_high_cnt 3 and clk_div 4 gave a tSCL of 375ns
versus the previous default of 521ns, however the I2C spec has a
minimum tSCL of 600ns.

Restore tSCL to the spec with t_high_cnt 5 giving a 625ns tSCL,
verified on Lenovo Yoga Slim 7x X1E-80100.

Fixes: 506bb2ab0075 ("i2c: qcom-geni: Support systems with 32MHz serial engine clock")
Cc: <stable@vger.kernel.org>
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 6a39e21d5ed4..1336a09ca183 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -193,7 +193,7 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
 /* source_clock = 32 MHz */
 static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
 	{ I2C_MAX_STANDARD_MODE_FREQ, 12, 9, 10, 26 },
-	{ I2C_MAX_FAST_MODE_FREQ, 4, 3, 9, 19 },
+	{ I2C_MAX_FAST_MODE_FREQ, 4, 5, 9, 19 },
 	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
 	{}
 };
-- 
2.53.0

