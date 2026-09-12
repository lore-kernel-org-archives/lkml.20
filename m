Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EA1345EC1
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789224095; cv=none; b=Dq+08aLV/7UaDHk6khOW8hrPjxoeXL3Ct1WXFwq0jT0WvkSEb68Hsj/7ZMQuGlz7ilf2PqQ/cuQqqijBCVHKGELr4aibi3Uo0NA0Cs4UVEMgrcUGyZ/8a7G+nGx9OBA3Mh9q2e163sl1x+k4XsukvzOXWh2oudqYVYJpjxzA9WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789224095; c=relaxed/simple;
	bh=jJUwvssp7BgAozkd0V89n4c6un4uRRFWxtfNl6AYC6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bacwCsDKVib1RaQXEa/vn4cMovm9Kl2Qg72I/Jhp8nwUI1OiXRabvwKjRvmZAqIqBeo3QuB1C624YGAuJgLB2POTnWvUa59/uUIuv8aYCST1UDUYRKmaxJyCirytoClQ9VKve/s56d2qwm9enhBcwKtD9aXKVgxNFBL43+14+9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQ/rLwO4; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQ/rLwO4"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb751so725325a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789224088; x=1789828888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iIsKkBRVqKHVlP9edUOYmG2b5QsoU5qyf6y8sJGrYtM=;
        b=nQ/rLwO43nAkQ9uAZK9C0K0P+lmIPrA9Y50Ghd+6vzT2l6dtVZzxA9bidBPftsb2a1
         QfpvaQBFddJ/mo8HKUxIhRltiqhZYKI6MxDF7aCUR8uHDU0VAkpqxudhlaUQjQe2mM70
         bO6Sli5m7RsEhB12bgDJSjobxDeVHMm/4QAII3beruf88NnV5j89VWo5aXAWpy+v10vh
         L6GihFzxHlzNiWU/l59EVkQiuOAJr0Sw2aXgEyzKcAyFzJbBKGKnzsmSFbL20oqaO7bC
         D5/aIvS6p8Y0QcuRaDH+KOw/emot6O76mZzv5+l8L5aExBx2dTpXl+nM9XMpJQWmmYmh
         LYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789224088; x=1789828888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIsKkBRVqKHVlP9edUOYmG2b5QsoU5qyf6y8sJGrYtM=;
        b=b1yHO68Qp9//4BUtoh6BWkfqq715xF6eQN1xhwXdq1pmEAUTlxSNOfM1kS8RtjH6xO
         ZzevLb2q7LcK9qPseDI/67RLQdP0xWFJQKbXzRyRp3Qur4Dp+ZoPoVBhTl4dXamPYcd6
         JAb9qQGCaY8k2eGyBSib7MGWxXqpfh5QtzYzhoViMaYu3KNny+werTrGvAq1YgDEObvq
         HDmXUh3AKRlGmP7C8MX/gUNmirKCHnCTQ+jDFCPlUrrsvIfhAJiejbnkUecI5pKqDifm
         HnO1hJR3hj2qT0UcrQQdWQHbpiId09fRbKeWTuRZMt2NAg5i59SctE/p+vlimXzjXBT1
         lB3g==
X-Forwarded-Encrypted: i=1; AKwUvBwdp2xqD3X/S5YGWYF1ZzN5KBS6l3In1ojW+Jdy2lHcXEjCF4tlMQgjPalLi82H4vMLwipf2eD+9NRFutg=@vger.kernel.org
X-Gm-Message-State: AFuF++lFd5LclMEPqib/JFW13YfwX8NM+XKNuy0thjzQpnrTqG8KmIM1
	MPz+NUiopgBDgo4+bkRPx9afficBGhFBOpr7A2m2/kcJvk7depKQzcfG
X-Gm-Gg: AYBFou2gck536f8USoMxTsk6y31DAWQlNObQhTjjs7Jp6uWPUn3xBypQ135hEC4yE9B
	/snI1f7hEIyzsDTN+llr/hnHoOStEbwVni6t8wM3QTXj2lJ1mmXUCIm83vWtIfWWs+L052LmQOf
	uMkAZTUCVql0hDTMChydCZPwjp8nqnJI9tdhpEHV/TksKGnYp5oK3Sg8kI4t+cvVRPyQhPCMm4Q
	j5HpUcaCg/8kmI640Tr4g2UG0OMBEGMetlnt8/B9nGWHN6e9/G0Bfh7scJ+IAExJNYqemxnPjpp
	p3qjhrfO/E7aFDpYFghTYxxA6O3nO30YRYgxCpSQLWU+LlMqNrrXYY3xhFndz8zA1TkEh1vRCAj
	Li9ZhoiV4BSThRGe5CLax7APRd7Le0WCVoHvlzw/zUBkyMjdxLAXrfWxjzfCM48JEr56HFfurnj
	rFFl56IdIVfgV6YBf0xRL3SoTD436QZtWO0jZTysJDdkndC8aFIlIBaw==
X-Received: by 2002:a17:90b:548f:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39d9c1db3d4mr16333966a91.14.1789224087801;
        Sat, 12 Sep 2026 07:41:27 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm10380257a91.4.2026.09.12.07.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:41:27 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] crypto: omap-des: fix crypto engine cleanup
Date: Sat, 12 Sep 2026 22:41:16 +0800
Message-ID: <20260912144116.993932-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omap_des_probe() allocates and starts a crypto engine, but the remove
path does not call the matching crypto_engine_exit(). The probe failure
path already performs this cleanup.

crypto_engine_alloc_init() creates a kthread worker for processing
requests. Without crypto_engine_exit() during driver removal, the
worker is left running after the device is removed.

Call crypto_engine_exit() after unregistering the algorithms and before
tearing down the remaining request handling resources. This stops the
engine and destroys its worker.

This issue was found by manual code inspection.

Fixes: f1b77aaca85a ("crypto: omap-des - Integrate with the crypto engine framework")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/crypto/omap-des.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/omap-des.c b/drivers/crypto/omap-des.c
index 3b7104cb4487..4b5a8d13f505 100644
--- a/drivers/crypto/omap-des.c
+++ b/drivers/crypto/omap-des.c
@@ -1082,6 +1082,8 @@ static void omap_des_remove(struct platform_device *pdev)
 
 	omap_des_unregister_algs(dd->pdata);
 
+	crypto_engine_exit(dd->engine);
+
 	cancel_work_sync(&dd->done_task);
 	omap_des_dma_cleanup(dd);
 	pm_runtime_disable(dd->dev);
-- 
2.43.0

