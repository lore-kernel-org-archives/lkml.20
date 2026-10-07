Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746F73B27C9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373275; cv=none; b=RO46eINbDfYVOoNEalHJnSviazYi+gbeex5Iw6msKwCQg+LMlokTL2xS1hYo/rh2sLuXxKSxuwOx5MY7CQGHGsAeqhJmEtBVww/nzr/obN/PGHROkwuyPhcq/U904lbQUQpL1HjcLVSXK3h6tzrmKoxSHYtsD6wDEwMDLDdBcv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373275; c=relaxed/simple;
	bh=HrHOxl8vU4NtC3eVjUlc4i27OUvjn5hRvuvP9BpLLW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g2k+sFL2WJWbmbANmeR2XSDg28Yt2Kikq2P6uFPtxGQ4CHbRJQHmSZsLz4J1aOhpYIzVQdoKxs4A4/DjJRVdJOPvpj/p4HSKW3JPTyaQWUAEKC4eVia240el+TjdCXwzY9Ba14rBFas+5RNYkKHA1Kz+hnpQzp7+V90WCpFMRaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKxsODvu; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKxsODvu"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1685312a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791373247; x=1791978047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1S+23ZtOjWwrYVTwNmNORRFxt1wYzNyVlF7uFakN9wo=;
        b=AKxsODvuOCo7ST92k4/L8taWX/E1wKOTTRb6x0ZB2HOUxt522M9TVesw4/Qzz0s8Nm
         dASR1xMiOGb49376DEEs8Ot9LkRYUDKnLZ53vj2nQvLFEm7AHQCREyTTaQDM9Uel9mJu
         8lC1l97sHDtn8LBtN+nqpvywHMOOIYOxkAgv4zIgkXnHOPWXzkSBpp76z3OevDpLLw8l
         2chpgwxN56yiTX5/8YhwivEogDteeRZvHeJzfK7QQwBQJXRCHyP7mWgBXWJA+/0LyNIC
         hLk6ti1SR385ghDQu6jyTfO1O/0YaKwNcKXyV716MfHnZABTubxB+n+8pIe/Nt52bZTG
         O61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373247; x=1791978047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1S+23ZtOjWwrYVTwNmNORRFxt1wYzNyVlF7uFakN9wo=;
        b=H1r5NgqpnEVAViu5u/c70CNpXaPc9ph7+lk0uQayXV6b5hROdBuLbO1+CXcOnjHduD
         yZunwHT+TqBCP0IV6B07Ju633cJg2wudyiem66Wh4U3nf8HPtMAETh2fqshVVXsHClvW
         1/essHnIjDy6vGGzzmhA+2pqoM6QvfhIw4YF6D1rPTWbr9qfAtzV37fL3TjqPfTt++RT
         YJIfxj0eAO5SIjPYAQ0tu4sx7LDtJE8S+zgwuebk+tgQkKoOZJUd0CYnO0Mo7wKqVvYH
         VbxxyxLzGLi3Tq5xOR119XXmTpTsYBdKJ3buUYk0ppDYVhOgqV5nAQfMQktClY07ZbDg
         Pmgg==
X-Forwarded-Encrypted: i=1; AKwUvBzA3svVKOLn7xJDCYbphrxmcV5pB0/+tAvKim6G9wgjyytRZ64tNDzSpe+zZr9FfGZzYPXexLHtvRN2elo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkSMdu1ZNGcgqIsnsaFnC8Wr/Sgwi0H3aOh1DjMgn4Lj1VqNaW
	5j/PM5Dm+PkzeEJio4XSz1+aMln9FPHPcSxlnkggjToAdJfko3/my9yx
X-Gm-Gg: AYBFou1Dy6mWFzyGK4zrNr5xpessJHvUiVZCNjQfcQPa/rytpf6szhsvjfZRAoQILxx
	20XPyxGgX+JN0TVV2jJMezVJBgSxhw7MwY1YnWeewN/FCRCLFyjgyluBM87wMMKMm7kRVKoGHEx
	bcLHsc4HKIaaI/llXUOv6l6bhnOAS5EajC7MbCKkTuS217+mSN0NwpNCPrkugKEXsw9BQx1onyd
	PKqYpZUnXfYW9yenzBn+l+Cb/AQu9noWCHaWrZVfpzqr6Zb6B0B1oyu5OkHQJvjSshN30ivrowR
	Jn/mikU+2BZfnrI39Z8ayzP3seKvWQ/QNT0ymZkvovJOIZciol3roAIeaSp+inBRJPAyr7ycCDJ
	hSJO2rZ1tcYJSMPqk8QnJdqrP3quWVZsBE6XmFhs8R/Vx2oyA2YJUr/AH4cIqcF2N/keffhmsb7
	N3XG0oKYoaMu8Wdfd5XrAGGkT4SgdgwH5M8nQ8Xx4PkOT4OHHkeGAOVQ==
X-Received: by 2002:a17:90b:384d:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-3a8a1553dedmr1695567a91.61.1791373246732;
        Wed, 07 Oct 2026 04:40:46 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::8534])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b5c5d9asm4127072a91.11.2026.10.07.04.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:40:46 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on probe failure
Date: Wed,  7 Oct 2026 19:38:36 +0800
Message-ID: <20261007113836.115774-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hidma_mgmt_probe() calls pm_runtime_use_autosuspend() during probe, but
the probe failure path does not call the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before pm_runtime_disable() so that the autosuspend
setting is properly undone during cleanup.

This issue was found by manual code inspection.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/qcom/hidma_mgmt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
index 4805ce390ffa..d8c56af5882d 100644
--- a/drivers/dma/qcom/hidma_mgmt.c
+++ b/drivers/dma/qcom/hidma_mgmt.c
@@ -310,6 +310,7 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
 	return 0;
 out:
 	pm_runtime_put_sync_suspend(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	return rc;
 }
-- 
2.43.0

