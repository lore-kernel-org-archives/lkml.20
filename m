Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D134E0216
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553010; cv=none; b=qdiEqfQLodusi0J+8ABiVn4xwXR+eNYa3hv04ieb0UA0LfaHt98WmeTEAuYJtZZbyVy+Ux96t7JM+l3bcECVhdfd6Nv4b5yizzQnp08VSG8l8DHtkwBzv7pQKfvN/CwFLzGpS0qvrLDkSA90MfCCpSTjaSjVD5LBVeRt80OaHlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553010; c=relaxed/simple;
	bh=C7/YgkaQNK/zcq0qIsUTnbAeXOmVfs5H3Xn4Tb3ZKts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AbJyEQCTZCOpTsnWr54T2sF0wAsCqt7bly+DItwLa+KlruN78GP8hR9853E6B53vjkDFIYmkdYFKmAORXHVDW9u4RfglPjObjEGKA5a+wSVSGh0JgG9zwy6ziFGLM2LrVpLPMkyM9fN8X76ui7OI7qqoNQ3bhUJbdhq1LfqZ+t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2dd76b1361dso41334995ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553006; x=1792157806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xu9qlzISdqBsfG/KDIT6cAt4DBaAq+fPmh/ka5nGnIg=;
        b=A4+Dz0b0NCRpDhkazIDWAWGMFAFXmexcvGDGEUX6oEXGepU1URQfvgSy/bV5RYuPrh
         aNvpzLBDgp/hdMcZJNRCqjDZYvppkT7PZFLtm5xHxbq0037Mj/SAa8UWXMW37MFIpcVU
         UEbYQbxDtgfMGftFkjlRJKrJVGyWr3N9BW7jOnRLkwvHKumsIwjS6JkZxzv8XsGFYZcv
         3bmw5aAeAvpxJBD/wHNEXOojo/5zb5zZ11Adi+nPTif+jpTrHWkQTHBpvJLZzZRj37si
         LGix+LSGgZRTnt8evs1ykyuKRK8M3J855bUm0GTiSuMj450L9LSGrXVR+/OXXPQT7rzD
         9fvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwLV5vCVH8JNk9YdKtuWxEi0WCW77HeJCVO6ZWfwd6InUlJ5vLP90mkApvDuaVbnLWaqcT70+WxCLKros=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeN++GxskMSyScLCEGq4GswfUCcOIJ8oAf4n30JL+RbeFWINs2
	5GYBFzGOo04qjeAODFqBIYmAV0tGJH7ACQDMEC/B60UOyRuAEFW405Z4
X-Gm-Gg: AYBFou22OQiNEvtyErDZ0ULqGvT0kel/s74SvOwm64by90j0tRgpxU9D46KLL/4KCJb
	aznFiqvn/ygxi0EKUXtOakmd1/McY5qinJQu+mCGudt7zwvh3j0sOPISqcFe9j9v8mF0sbSUOU2
	m2H+UQ83Pd0r5TXMqChdvAhJsS9WP1pzeVLY5ZniclvHrbkFU7bR6P8x8Tm+cUrHWc1RDenRkhW
	P+iaCPtd6NtxZvPcP6ilSE/KVssjmPUpz5IKZsyoMlgto6k1Z67vM9ONsVyE2pJdqefqpf9E84k
	KweOKMHBfSu/oI4fRnTCyeaELDhNPG3p1vMAA/DRqPXL+p5v56XQPogcU08fGEF3nrYe8xcMtsD
	xHlGw41GV/P/4RmwsC6PjDLhF1LRCsy5oIBsh+4bKph2Ubs+mk/3pZbKwMp7/nWNfvwVdVo1xZQ
	LlnUb7ZdYCqOimq9HFF0maBk1JB/yGz41rCTVComeARLAo+t11UOwjbrXISIQ=
X-Received: by 2002:a17:902:d54f:b0:2e6:1a6c:abd3 with SMTP id d9443c01a7336-2e8427f0cb1mr17510535ad.6.1791553006254;
        Fri, 09 Oct 2026 06:36:46 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a05f70sm9260455ad.7.2026.10.09.06.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:36:45 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: broonie@kernel.org
Cc: william.zhang@broadcom.com,
	kursad.oney@broadcom.com,
	jonas.gorski@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <code@aayushk.dev>
Subject: [PATCH 2/2] spi: bcmbca-hsspi: Use sysfs_emit() instead of sprintf()
Date: Fri,  9 Oct 2026 19:06:31 +0530
Message-ID: <20261009133631.579644-3-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009133631.579644-1-code@aayushk.dev>
References: <20261009133631.579644-1-code@aayushk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

show() should only use sysfs_emit() or sysfs_emit_at() when formatting
the value to be returned to user space.

Signed-off-by: Aayush Kumar <code@aayushk.dev>
---
 drivers/spi/spi-bcmbca-hsspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bcmbca-hsspi.c b/drivers/spi/spi-bcmbca-hsspi.c
index 5dc9e0f21..8c0147588 100644
--- a/drivers/spi/spi-bcmbca-hsspi.c
+++ b/drivers/spi/spi-bcmbca-hsspi.c
@@ -129,7 +129,7 @@ static ssize_t wait_mode_show(struct device *dev, struct device_attribute *attr,
 	struct spi_controller *ctrl = dev_get_drvdata(dev);
 	struct bcmbca_hsspi *bs = spi_controller_get_devdata(ctrl);
 
-	return sprintf(buf, "%d\n", bs->wait_mode);
+	return sysfs_emit(buf, "%d\n", bs->wait_mode);
 }
 
 static ssize_t wait_mode_store(struct device *dev, struct device_attribute *attr,
-- 
2.56.0

