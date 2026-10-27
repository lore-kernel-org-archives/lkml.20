Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112982;
	b=PPOlCyLzMpgXId8EwC/0NhdUZNaJe4MUskAdSEdgtBlJgGynoN4DRnXS11278BrhOeWY
	 i2CRXofos3eq4UBaDVsRrNXEaCSHTxZB/WiQKoPO1Z6riBROg5qX9/fM2v3xF+vloCH6o
	 6bmwU0LQIg+teidvuU3hJDRHAzgowdwi4M9hn3XMQV3AEqoAtJQJeNi4PpLRyPsnO+veo
	 i/gyLc1DMXb/OgIA61U89IOb/EZg4pH8j6zSjVy2MUXC1BzVkSPElQJ1FUmmYnTf+NNQ8
	 B9D0kC/P+OU2lECvn8wkJvqpJHEjIg1PagwwhsMzC10MW7n152Zhe9m4oaSGJqw9qeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rqMBhOuLcd0EYtrlAFtP2bB91al7sLiRpTudFiQDAh0=;
	b=txhbF18ImuXxImu0lSvipdY8k+jOdUZ3C4jAKqoAowG5oaPUHh0/FBF/2lfvkkQ1LU0l
	 F9+LSC1JjaVzupywXaLNV4G1oaLoVo/8Joh5n0FAd/rK4fWlzxhNyzlgTGxdiWefMtl6o
	 5GhBBGTNmSJXBnd55xAqsXkYslZxxe92BxaV1hEKuafg3ZWJLYT5y73Sd7wfyHVnPAQ3k
	 29iwbPup3Lz/eVfma41hXTa3q6Fl85Fr2f/7Hu5KwTSqruDHiofy2ZV3jL+GdnNVk5jyO
	 B0jzdrdQjqhYDgX2QlV0Y6uD3qFaUd9EhWZcJjaRUrPtBvB74gAezrNKUkbW2YXRj/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VMU0571G;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66451606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66451606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VMU0571G
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so37580655e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793112981; x=1793717781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqMBhOuLcd0EYtrlAFtP2bB91al7sLiRpTudFiQDAh0=;
        b=VMU0571GUa9K8LB66Opi1wZvJpyhYe4GH5/naVDm3cEt1WH/llaaYgm/UHZmYSpM9R
         YHPanYLR+7QPNPh83UQutA8sPIuJ+nGAB0sXWhd9lUMuRQ0XWU6sDNGHHCS6bvm60Kd0
         b2AwC+2jrFDZGyy3dT2ZDqY1BZbns366kohL+6/OiXGLgsclzndrPRyHJMDOmiWzpozG
         nWch4EGItPYq19SaRWIa5udc6dSq0+73t0qbCOgZ5r3LV+K0II8qpO89DRnlWB6R3QKJ
         J3Gq731LUl9RS3z9bnzK0ZfOwjihWA18q53FIJ27Uj4Yy+ZhDYAZ0ao0v/q4bpxtb1pj
         cb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112981; x=1793717781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rqMBhOuLcd0EYtrlAFtP2bB91al7sLiRpTudFiQDAh0=;
        b=OLkzo1mzv8yI4TvB92F4D7yYdzquYruZWhjv/faXQysKl4YawUzVcI1kZ8Ja3Emr3u
         AlkJ0/7nrgP5zAZRa4XXklyWfDmoLvAleuWt3pirklebfO8BE0vIZ1elY/OwCHGyY0TX
         HgLfhHGfR4cHsqU7eNhLMfv+ajdPx4eMPJXeIiEM+hyprxLE6TucC8KPedc1ZjaFskjQ
         /f6/BPyRUHbwEyoa6ogpEVZuYzf1oarehadHDszXKkLTQRqdx/GJlq+EPhO+0dIZAYin
         idH9X4mmdbhsAa2oeniM/hfjZAceXXuZv+qMMarKR6rv/2MZwP9SqJ0cujeafFCxLtx1
         RUiA==
X-Forwarded-Encrypted: i=1; AKwUvBzTn9x+VXI5mJO+5q7o8pPTGFF+SCYbSG2n4q4dhiK18QFL2GkULRPda+HjLsRKhy9agauMQ8akaUfx1tM=@vger.kernel.org
X-Gm-Message-State: AFq9FYItDOhHfehQ9sVMih91rFJUxsRwLxsW/Z2UFzEwPHz9qCbwyhyt
	lyavaA/B/7RGDedQSUktdS71QHm0b6CZ0CrngKirhwgv4R2yb9mVWnTY9pHNyZA2Hyo=
X-Gm-Gg: AYBFou2An+OeahOMWZVO8J4R3I4Fr+lmhmS62T5yGnen0OTDFHnTGQeTWytwT1hvnaN
	Ryh1g6KJPII37YafShAq4/vvBiZQfaHWMGn3V6LtIIo9Mx2j+80cQ/WRd17Vm2jA5wQIN46G2rD
	gwsbdWs8VKGPZkvPmqmwT/uyWHF7sTJbTZ3Ork8KVigDjgGlbnKYuWDnR1fEu30EHnzVAPb/+N0
	3Il/Y/+dZrn1+c3xFKWSsHPM/QJt1/VUlz8YaR4zBc8z2AdDbnoLu+lbT0jZc53PVxFrg4Jl6KD
	dgtngj6S3OxyH57AMBG54kjkoGWw/UzkqNkPl6WqgT90BApo5GPSON5oMsrWLZhqa6hW48Kdzpm
	6opdf6MyU3eN6WIvdvPv49zlXE0hPkMuKE3qX5hHWvGsnUD/eDK3ntR/n5flCY/itQ49khiXuIc
	sUaE9BwuDHReeaQzimol7zr5RDTgXWUGAVQL7fZo4eBn+Mj7S6saLqhvhePosdNcpV8hBps/c/O
	rd7HL112Ch7GG6L8AUeW6xUExaCPrvWUsrs0n2f561WfHtfqFp0JPe4sIg=
X-Received: by 2002:a05:600c:c085:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4a78fe81333mr60898775e9.28.1793112980798;
        Tue, 27 Oct 2026 07:56:20 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm273188835e9.2.2026.10.27.07.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:56:20 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 27 Oct 2026 14:55:52 +0000
Subject: [PATCH 6/9] coresight: syscfg: Fix deadlock in
 cscfg_create_device() error path
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-james-cs-sashiko-easy-fixes-1-v1-6-db43c4668644@linaro.org>
References: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
In-Reply-To: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

If device_register() fails, put_device() is called with cscfg_mutex
held. This calls cscfg_dev_release() which takes cscfg_mutex again and
deadlocks. Drop the mutex before calling put_device().

Fixes: 199380decc5f ("coresight: configfs: Fix unload of configurations on module exit")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-e07a8e2f-c34e-4609-a667-9f294c6fcf29
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index f93150a1bee4..92aef8b9c734 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -1217,8 +1217,12 @@ static int cscfg_create_device(void)
 	dev->init_name = "cs_system_cfg";
 
 	err = device_register(dev);
-	if (err)
+	if (err) {
+		/* cscfg_dev_release() takes cscfg_mutex */
+		mutex_unlock(&cscfg_mutex);
 		put_device(dev);
+		return err;
+	}
 
 create_dev_exit_unlock:
 	mutex_unlock(&cscfg_mutex);

-- 
2.43.0

