Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284EF59480C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888339; cv=none; b=m6aczhz8Dnm0SRayeNQlYFkAxSoblKCNJCT0BbSaZsdf7TYfbwBb/p12GOarFMurz3pyIeK0wEFEMRsGz1qT7Ma9vLMFApZoXizocTSlpgMBXBhQN0KN2DPwHjHx8HSjcqeLy3DT+RxClFQPImePjMErD8FXDkXdo5i7hBmnv1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888339; c=relaxed/simple;
	bh=lnMZlFsr2b7pcckby/9HTomjPCDw0OgChLIiwio7RjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=flVpYnfTvksUysZPx3LVGVVkviwT4g3xTwXVgV0YqKOajoU+80ATq1Rn66jsZI5YU3jBcxH09lMHE7Ky2H1qqWKWp7MHR4hmNFskuYuq2YMsW6TeYQKBDMwwzdGIwJf3ZNsOPmr5yhWfnyxNpAu5cuY1ODXBhffWTr+YEInMkEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYw8rqYt; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYw8rqYt"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so171625a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788888337; x=1789493137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eN6yqcpqAjYfvv8rc/zTcsykokPXr/AOywGzcoVI8dE=;
        b=ZYw8rqYtssNc0O0RM34kCCD2vqEhJk275t1Dnd2yI7JSmKdEHdn2+UM8gatQT0xCkj
         KzaVqiiEU/2Zl6YVy0/2moa6cpU8vdmVdROKxV/B3RGcAQFuc7OX+JvaMih5ThpY4wSj
         6ilEOm9w3ZvhHZZ7ash9ebwE+sH0dwkxoE76FUZuOKE/Cg2yVqJfZD4KeCPuK7xkW35z
         eFpbOMwDHElN8YGZQNzDydnMb9WRXlSpmvJImjbTir9dLtrSiY7XABr65mrjtXPMXyPH
         dOPigJewzD/VTp90LZU0SRk9eQyrYQqM4LkadGT4YI4zmIf7htBbM0IJSlhBxvlMCMAm
         NxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888337; x=1789493137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eN6yqcpqAjYfvv8rc/zTcsykokPXr/AOywGzcoVI8dE=;
        b=HEtb/y4hCPIvI2/OJl6WCGu9Le8P2FExD9LjL2IzSSWx39EvEMUD2wHy/etykMa60j
         CUg6aaxi7zYyTTa+v1RiQh6M/60//yksHKYrhOs59+g867l8OrO+bEtPepbpDhqZfLIy
         ZKwwZGINF0feqqE+KFmS+PWl5PgWKhqaVIjoIegbwxfuUav6LEiqPq7sm/OGGgpPwE2w
         C+9rrJ+tvyPamVaIPZm9rRKJrInG2GnpZfcGLsi0tcqsNjoaiGLIn3XiacUJXMg8x8PS
         MCyBFIs6zU+hBAY97deNyOJWcQt669SztFxW6D28eWtemU384ZK7AUfrmk4lYZM+64w8
         J9Tg==
X-Forwarded-Encrypted: i=1; AKwUvBx9dZOJ2SJU/QAmT1RSfXwdCeGjZOXyrrn7fkHGvvhAyet2VUxZHL6ljzzzUI7lem9BF/eJviVPgOXEYAI=@vger.kernel.org
X-Gm-Message-State: AFuF++nHmpsnz70N7E1nHc6VeuJs+2wMP5uZjk1lXsBM/L6fXXUlksaG
	zTLm8aCglkb4QU+9ltGwUGDCYRy41jFA0qPMSTjMV4jCwtp86IRigasZ
X-Gm-Gg: AYBFou2QbJqDoxAKM4VDUDZS0RrBbbh/8g1tRoP22XCUKWTvUmJ53uZGiCp2salNPUf
	p6WOJrpkHJwDGYVPNR5oOehv97RfajicGl+9gHkAMq1BaDRtA6HTIpJLbCFn0jyQR0g3mBQg/xT
	K6a3odQ4uVpdw6KSr7H+U05DB7pVPcCmg81aEXi2O3amBm6VjTFnBrR2GpmOnCaBNTTgi4hCF+z
	7E1sXo/VVfDiBfMzGujEc9XTvxeCpGf2wFlSoJkf6FG/Ckiff8DKdFsve1aK1fSl2u2/e93pd2C
	kuDyW2rgUW9P177J5w+vJKmfiV7S5E+2RDkqgilplo8DC0YiA31jALbdtOEPr49PWyMA7eD99ha
	376+fKl7ZTcOQrqMHbk3zF1nalQbKXiWFZVhpsWg/VuQX0UGM5LJ02gtzoWdQ4LRUQiuQ5+wVCT
	yIesrR3Y90MyRHvu0bNc4yZ0svg8zQaK/rJJvRx2knLZYIwTc7OawFmZt15d0=
X-Received: by 2002:a17:90b:2787:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39bac34331amr1274961a91.16.1788888337459;
        Tue, 08 Sep 2026 10:25:37 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:43ae:bf76:d99a:e5ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm19297176eec.20.2026.09.08.10.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:25:37 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v4 5/6] iio: adc: bcm_iproc_adc: use devm-managed mutex initialization
Date: Tue,  8 Sep 2026 22:53:58 +0530
Message-ID: <20260908172359.30003-6-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908172359.30003-1-mdshahid03@gmail.com>
References: <20260908172359.30003-1-mdshahid03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Shahid <mdshahid03@gmail.com>

Use devm_mutex_init() to tie the mutex lifetime to the device and
improve debugging when CONFIG_DEBUG_MUTEXES is enabled.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index ff271c7fb2de..9881a3104c26 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -525,7 +525,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	adc_priv = iio_priv(indio_dev);
 	platform_set_drvdata(pdev, indio_dev);
 
-	mutex_init(&adc_priv->mutex);
+	ret = devm_mutex_init(dev, &adc_priv->mutex);
+	if (ret)
+		return ret;
 
 	init_completion(&adc_priv->completion);
 
-- 
2.43.0

