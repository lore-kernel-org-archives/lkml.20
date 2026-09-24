Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B3B3B9933
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790215897; cv=none; b=ldAofb/VjaY45+hVqQ6lEcupZHsal1+WzCPoN5qQdHESdHz4GE/4HlYHkEvRCoRtxcGwGH7z3lVXUo+K5/V5jAIXjjOVhWaVqh2jYzTxibpYxyugWUsNyydojVNv6sCSFXnAX6R+Zut2YTN7iw1pMncYAjiYijs9XWbEbQrDqDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790215897; c=relaxed/simple;
	bh=7b/ADSaReuQTQwBkmyLAC7pxMKqOhBKzXmzfOg9M2gM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwCmeiaoT8PkcSWoTieA+a13x7yIhizBjJU5EFS6FfoR1RTDvmyBE/8z2wdmptH1FHEdgP1McP0+PAOWMvl1NEr/KzWfWJx7BjltMq5us5fHhRZeLsyJCdE8kxT6M3zMONQiXhk4OJdqgGFU2B31Alf0KAO8mrTHyIOPt6tXgmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRo1yBsX; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRo1yBsX"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so835752a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790215895; x=1790820695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFGPofwCgq85byA/f29LOp+A2iTPFkrVNt9PFIECI0I=;
        b=VRo1yBsX9EUaCRPM1jFh9mcDCfywEs8MxM2ywRPLWDvyIQn/DqJ0lJ4B3ejHMaOVFk
         2yiLiUhXus6zUa3OG9YY9PSINQQMhooLQLdmUcKXeylibLcE+VGjtUjwI5B3ye726u0z
         iLziAtgzA0rEPcOiEl8l6kuQxke0dwmi34AQjIFN/Qi0RcJAJrF/4K/BsG/zMo2M4Ksd
         IyABA+gUW5ynZoe/Cce641BjsFk6O+nzb3xZ0RayJcZSbjd2/Q4jGg2zlTMMNmkLqyLf
         W3BCAy6mFrPAF+wR5uLiuXhQQM53PxyECs4DSHhhrhnXR5BOjotaRa4SrqpiKN1bUAHV
         XqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790215895; x=1790820695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFGPofwCgq85byA/f29LOp+A2iTPFkrVNt9PFIECI0I=;
        b=c3AKyEgb3dDXkxq/2ojssskotOo0MM7g2aUdRb2khYxtuomoIx8shYmUttcbVFmkiK
         R1G5OhTDQIZIG/AWWeqXVxEGHcYL0fHNScHd2Nd4w2lh6d1AtjJCZnOAzI6mPLsodOIv
         TGWzeAYlSx89iKrMfiVZTTTkL5Ssdq5wpxPbKP6DgMA/N1bRhltuZWA2l1piqtyIt9xD
         4y9H/k5NSjPqNIa9hrERh6tnl9qgCckViJueo0zNT8cCHuwTEUYUiXxsm/Kmp9/oMpPl
         dTJYqMAEUQpLAmDRGPu4GZn4CvLPl+H7+qrAh0plj4b4U4MTRwYMb3hB/23DnJ2gyfI4
         wcdA==
X-Gm-Message-State: AFuF++mWQNkYYi8yUrTSqnM+o8bdaJOL5QYaX+7A8tbqCeBqmWpRsxRC
	MjGP9ndc02T2JYUQani0Jx65HElaXQ2pcICMLzWTLPw93lJur7tlfk1H
X-Gm-Gg: AYBFou1sHaZanbdAT8gkv9rI/Qs1ntQuyYJp3LVuiSfm2PWOA2uiQAi/zv8C6IpKyJW
	U2cQf9LhobW1+xVxHDGrRdcphiwsgP37AyKA49esS657rhTfegEI8VLhuHTZLxbkCZCO9sNk+JX
	ZUJ0za59WeyNftEutTcLEoEsbHf3/sShitFBp9OdNQ+LK9WiNjcP151CYdxb85RGw9u4qtetR13
	v1s3hNHcxltY0ezvrNXgR97fGwsrKFqXC+h10rCdAqh8Wbg00jo2TF0eLyACvnYiukwH4N+d2/r
	E2nyJHPQ71tD7W6ppUTF/gCsx3j4g5F2K6cHEMMGMhfNyZ4oiJAyUFa7GvLIS0m1G+Wsmd/59jD
	/QoQQPOt+7fmmKXc9XHc0X2dg2Lx5OmN7CsAAjWiib+hb4/WQ29TBdSrEirKXX4AhUK0JXlg8sX
	QqYTz61r0NT77sKbg+D0N6c2dCD/R8YxZgP6weUSzci82FAK7ePc0D4O8Tox/bdlP1d5phAPZbm
	cEUsiuRkRfwx3TwOr2Ln0326m2My0A6Tfyc9gHg1SX7xgLMXQElS4VVhGv7IXIbeeQcEm0GMxtV
	ZMbWpj4bYb7wtKpeTZ5XzYUA
X-Received: by 2002:a05:6a21:468a:b0:3dd:85a8:4c62 with SMTP id adf61e73a8af0-3de0e77ada8mr942278637.41.1790215894690;
        Wed, 23 Sep 2026 19:11:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3d6954sm1790647a12.16.2026.09.23.19.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:11:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Johan Hovold <johan@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] gnss: sirf: Use pm_runtime_resume_and_get()
Date: Thu, 24 Sep 2026 09:11:17 +0700
Message-ID: <20260924021117.6534-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924021117.6534-1-phucduc.bui@gmail.com>
References: <20260924021117.6534-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
error handling pattern with pm_runtime_resume_and_get(), which already
does this internally.

No functional change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/gnss/sirf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
index 79375d14bbb6..4a68055a237f 100644
--- a/drivers/gnss/sirf.c
+++ b/drivers/gnss/sirf.c
@@ -103,10 +103,9 @@ static int sirf_open(struct gnss_device *gdev)
 		return ret;
 	}
 
-	ret = pm_runtime_get_sync(&serdev->dev);
+	ret = pm_runtime_resume_and_get(&serdev->dev);
 	if (ret < 0) {
 		dev_err(&gdev->dev, "failed to runtime resume: %d\n", ret);
-		pm_runtime_put_noidle(&serdev->dev);
 		goto err_close;
 	}
 
-- 
2.43.0

