Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDA14F68B4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895415; cv=none; b=AA31jbc/zHvzPTpRpjsFI32QyS+spBpSURhC+szr7YZaqhvKmq7ihKJunjoGCX6MQjpujbCoPoGeWbGxbJH4SfkMjJqSmzJquulbgYw6ACllueDEwO0kK1xjomYLtNgdQ1q/t9PkRLA7nxrMAQvDAW9uQyRexxB9vW7mkqV5hBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895415; c=relaxed/simple;
	bh=0NQ5w5tbcto66/4GcTTAPB4tFFMCRjM8/r2YcYTPB5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eKLE1udwNHVsLvH/QYCjE8crtG39nNSWt5v/xRJqYczzrCztTU3y9pN45H3v46+wwapXk0W3pJUjaZCbhjGPC+ZXScjaBGwid9ix+lTmtBCaNrVRuB5i8kzjk4VBVhQlE9z44fFfMgp8faVlHTwQqFnPgMO9NCJ+5ZXMGEiLeZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ei+zGzZm; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ei+zGzZm"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so1794362f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895413; x=1792500213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ld/rflLmJTpQA28xoZ6zpNKNM3ooqYaquEt3HBu6M58=;
        b=ei+zGzZmw/yYVihEsPN6QjKvXkRROYtRQ/zBsnpWEi/o3R6lhm5CvRHF5+bd+k/+OA
         v6vZNFGIWJ4tAvKDCer6jSNVJyQYRTAxsAmUnqCpRyNdsGogwfDTpO1fQMd3nwtqc+Ow
         kSFh2Dk3STZhN0iyUeAeuWRr8MDbKDruk8Mftw59dLQpIsaugWOw0tOmqKkhPjUn06Td
         drlOs5PWrwrfyKUiHrCepUbPEy8crgzehXdPR7hjcBaynjDgam7O4z9hx8pZIjOzf3ue
         nkxExy1SN8uikDxDEVYDNSH3z3vUHHR1eqq2wAobpSO+Btv9H29i8kTl2E0GVXjEcTvw
         VTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895413; x=1792500213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ld/rflLmJTpQA28xoZ6zpNKNM3ooqYaquEt3HBu6M58=;
        b=yeyZbt8Ku+wcHuQgpA+FO38IkXFBQayc6s+RiJnW0f9lrkQePVDt7HewQxJFnhl6zm
         FMXXIeMJgCDT5dDEpMj0VzfvH4HkoFnEnH8awu4UrZ+qj/u0avJp2VR345ssS6SQmo6l
         L7BfEwgI0Lq9YFUEISlSFk9TP1KAPgFD5PJ9umL+vtH/Y0o1u5gAHTUylOU1+pH5fp/U
         m6eXKw6i9Opvhvit+LwkN/R2WC6o+uVxmRTRGi3tzA9RJpAhNSKZQh0uAkSnOeG9Dw2N
         KoaVpfa2oyLpFxk+cCvHajiroRFUxS1qNLuoUPm1ZJ6ewM0KYl88q+Qh1qy8CcWVZQZ/
         jFoA==
X-Forwarded-Encrypted: i=1; AKwUvByLU6pI8I5EVxpb+zZtQDsGNpIVLCDgEGyqbdXpG3nWPgImezjcy1Y8CgsO0v53Ggle/ymKUAJyVceDXGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUDABYDkKQ7vAqBfdru1j50D8XhTWZKhgbGpJCQpZQdwKen8pB
	2s39IzSoFY5TGGzaLE9qb/fyuf7ihiwSNdf5wqbYwAA59DEf6PZDuNiS
X-Gm-Gg: AYBFou2F+dR6ZgFbbD3Pg5W+a4/LuBq+fibEisA4eMhM0VrVpZ443sA1ji8YzFv8rh1
	S4CAOyTtvo6P5nAXDXByIr+8ZBO/snS1Y4qaNpvciM0ljYtcwwlBS+On/GsWc5WTGCTyH6dXX47
	OZqd59su9YCdkz69LSrhaHIKEEcThWNfkQaiRlr0LWwMTDiobPndVt2ChG1aI+MCK7v6A78wcsO
	koVEiiim9d4jWOlPuH87KbcFOHiLGJiU5aFhU8NEZWPvBSdJhUkWafURFe9mr0VJFaHfJ+Gultq
	j8oIde/vqECjXBGf/2XZicJU5UCzzKG3Un31P5PPJY97jBz8IJv6R7I6lpuPHTyyE/csCAZk3El
	uBJWMwfZPpMxEmI4suVZ+BTTqW5pBGaxH7EPEpB6FIsNR7+PJgImoa0r5kQmhKrI1McWdnKu6jR
	uQXXx6JU29YY4H3PtBhxg8IsG+91pjdeEJb8NYquVwnv1Zey0qtAxNBBRr7rXCl0hJWCnqmnuq1
	6uBdoxy4k8oCkA=
X-Received: by 2002:adf:e007:0:20b0:487:8ba:8aa4 with SMTP id ffacd0b85a97d-48dbace50e3mr17346014f8f.38.1791895412619;
        Tue, 13 Oct 2026 05:43:32 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:f28a:73a4:9323:621f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4053sm4493729f8f.21.2026.10.13.05.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:43:32 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Arun Kumar Neelakantam <quic_aneela@quicinc.com>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] rpmsg: glink: smem: preserve IRQ acquisition errors
Date: Tue, 13 Oct 2026 15:43:28 +0300
Message-ID: <20261013124328.1273340-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_glink_smem_register() passes the result of of_irq_get() directly
to devm_request_irq(). Negative errors are converted to unsigned IRQ
numbers, causing the IRQ request to return -EINVAL instead of the
original error.

Check the IRQ before requesting it. Preserve negative errors and
return -EINVAL if the IRQ mapping fails.

Fixes: caf989c350e8e ("rpmsg: glink: Introduce glink smem based transport")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
A dev_err_probe() diagnostic can be added for IRQ acquisition failures
if preferred.

 drivers/rpmsg/qcom_glink_smem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 35bb03e67ae8..010a7da64906 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -312,6 +312,11 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 	}
 
 	smem->irq = of_irq_get(smem->dev.of_node, 0);
+	if (smem->irq <= 0) {
+		ret = smem->irq ?: -EINVAL;
+		goto err_put_dev;
+	}
+
 	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
 			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
 			       "glink-smem", smem);

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

