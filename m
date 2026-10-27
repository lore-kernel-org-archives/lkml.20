Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078755;
	b=1pMTzd2wdVVfxurMRGUcdacEKiv3khY9ATUXLUaHEzeYAyxwjyjfQQkNwLBXctYyTshZ
	 aPT/ixF/Ht2OC05ECsYoFoKaZ9Dz6C5zmouEQo5EfFVm3ptgfwSFbCRIIKKjVB4xNt35K
	 N+sNpVYk1r0DaM3ymLZK39NxGGTdx/3E+kDPM5p7rxgGDsRcKHduwEX/zEGcgkBJMcX8g
	 JyDoGmfBoNOZqlLGkvyYBb2iv4ohsxrUEPPzmzQb5D/vHXIdVEjB0idYt+TisT969K7aO
	 Ys1D0/AFovGUzZ1hW5NANKVuBIsQS5nN8hMl/kNzoKEhguyAFkdhiXl7/Hgx/Djl2rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/PPCRJzYX/gkAYasFGf9AE1kvXx6TkVJOW81o94WTfA=;
	b=qaXdPb/EiQ52bgyRlbqLhlsLWkpvpRimSmqo3Rh1KW4cuaYl4zNI/pSZn1yDnUsSZDyV
	 swX1NuyryT3bXwQ5ZzMcBOzgTYy4Qr02t/RCFAlYSBi/pFTZMR/MKOqRtkBqVmBEAUYVG
	 ByUcKdn6BBqRpu4d2n/hQ+rmMYxQPlwag/3QoXtHD6kLlq5hPfr4heQdlRtdxxWmV6I9T
	 93Ohe8Uv0CUq3oHYWifTf1tH4fPinAOAx72L5YOW6bWkIFrLKRjEkqnTwlMQwV0vz7GRJ
	 DUlOx/F5MFB0MlxhRbQOcyBmokiVtI5cWiwRIBrOGMZAVJhT9QjHv2Sgr6X/4WCV2Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cz2btDR8;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A52606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54A52606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cz2btDR8
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso24313185ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078754; x=1793683554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PPCRJzYX/gkAYasFGf9AE1kvXx6TkVJOW81o94WTfA=;
        b=Cz2btDR8XV2eezXzWRlq7mbSvagoFv+4MtQfyrcCn7L4Haf3pdebXhwFFcMA+fiAoI
         nNym5bMFgAm6rEppUfIigN//XpHC9ruj35Ed6Ve+0Q0JhUswR98+bZorurlfG2FazHVi
         ziQibUSnNZzwIsS8pgeY8ZpwnqSMKD0Fcv13o317DItLWyEaK3e7sEHJEKlyNMENKuu8
         27AWXQByvboKoYM5r93nHfR9FwfezhgVBEPVE4oDs+ozM0O4fg8OYBmOHKwH4R8DrNka
         0zLj8jAwl/gpVw7mSunoRfESjwWHrwvwtm9EETHzkkT3Gi6N4St+LRscwDcyxk8bepH0
         un9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078754; x=1793683554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PPCRJzYX/gkAYasFGf9AE1kvXx6TkVJOW81o94WTfA=;
        b=cSmobKieFJkbpCj2OV53LwcDD7PwgvXYTahivR66SNWl2hORiAuYvpwVaeNnV6VPt0
         5+IWXHbHxlFtKmIWY16f/qs++ecJXzJuOcYLW9BHt6dOrlkIywG1dQo1Gc6mHsqibK24
         5rO9SpMVWjpWisl7Eg3ularXbF6bnaP00xbf5tAF+Iwbem2ag/R89GzUQGwTtiJevqNb
         LoU0y/9plQ2o1o6/t5/0p9CmHYGVYmxJ7u7/sC0GJEYQZYTQkhxJYETnXnBXnpobaWcj
         HtsyX00yu/vhu+4mKI6zjgwtsOF4snxma+O8TGsXcgOKXHlxq3EeRcLJ+CjN5Id7eGp1
         heiw==
X-Forwarded-Encrypted: i=1; AKwUvBw/vrlSgJLpYGIkH4dtHfYNGHyV4mRilkDigWnuFAEpi7oE+ulQYEufxEaSc5DrsjXPSpiYR7a605RPg6M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaGWC1l2OfsoYDxAV3rWlSyw2As+qWNcVHkoO13nbYf4/m2eqC
	v/Gks6HUVHb0p+RzdA7j0KQcIGYvctk7IMZE/9AXp1doWw1zzpYigT+s
X-Gm-Gg: AYBFou39Yta60EDrmhPW6ozva3atbDQDV5zvLk+vALGLiBppl5qPeMkdS6QF6ri4xCD
	aHB+XaOj5I13FHZOzNVqu0gB/fTdA760TVGbXvPOBtBXIGyIPe4V3MisPWA2usu0S/7wXs6Yptf
	fEcfrq/dS/H5nr9mnBDe1NHibEL+takHuhqW5M/tpgLpIEMCQuDKRNFe8e5GAP2n6KZE4y88QPI
	phui/wkj9t7nPFyO8Jt2sl8Z4hET1Lvs0a6vsa/w59j8DUZvK0bZLafKGVEueBzV/cOhhxAG5o6
	/4yO/DQdNezoaAZ1OIYgDQmPlyQxXLG0PyRvO44H7UWx6bpzU/NosoZEG4iEe7sGPw0P5pEFEDH
	GZAfNOVk5uMYREzG6xjkwQUCDt2xlf+tCkSINrVOOom2FwFCGX+ZVg3q+T1ORA8UrRv8BnDMo4s
	6UeMFKA2AnHB6P62CPF/6axx82BR/o6XJ+ZWbRW2o1uIlcUR4iSzny79TpciuosF93bBlMKLYDr
	Nv5rCQfwR2SfwDtaQcWMnSa7NgY7FPqVS+I+YU0ITGCM2SdW/dvQPsO5ZBUH5P4UeG4+XHIig==
X-Received: by 2002:a17:902:da85:b0:2ea:71a7:7f21 with SMTP id d9443c01a7336-2ea9c6c245fmr69254805ad.13.1793078753628;
        Mon, 26 Oct 2026 22:25:53 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:25:53 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	alistair@alistair23.me,
	rust-for-linux@vger.kernel.org,
	jic23@kernel.org
Cc: ojeda@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	alistair23@gmail.com,
	wilfred.mallawa@wdc.com,
	bjorn3_gh@protonmail.com,
	gregkh@linuxfoundation.org,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	gary@garyguo.net,
	tmgross@umich.edu,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 01/23] virt: coco: change tsm_register() to use a const struct
Date: Tue, 27 Oct 2026 15:25:14 +1000
Message-ID: <20261027052536.1722081-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027052536.1722081-1-alistair.francis@wdc.com>
References: <20261027052536.1722081-1-alistair.francis@wdc.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

The tsm_register() function takes a struct pci_tsm_ops *ops argument.
This eventually is stored in struct tsm_dev as a const, so we should
just change the tsm_register() register function argument to be a const.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 drivers/crypto/ccp/sev-dev-tsm.c | 2 +-
 drivers/virt/coco/tsm-core.c     | 4 ++--
 include/linux/tsm.h              | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/ccp/sev-dev-tsm.c b/drivers/crypto/ccp/sev-dev-tsm.c
index 46f2539d2d5ab..48df8c579c74d 100644
--- a/drivers/crypto/ccp/sev-dev-tsm.c
+++ b/drivers/crypto/ccp/sev-dev-tsm.c
@@ -339,7 +339,7 @@ static void dsm_disconnect(struct pci_dev *pdev)
 	streams_teardown(dev_data->ide);
 }
 
-static struct pci_tsm_ops sev_tsm_ops = {
+static const struct pci_tsm_ops sev_tsm_ops = {
 	.probe = dsm_probe,
 	.remove = dsm_remove,
 	.connect = dsm_connect,
diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
index e784993353d8f..6b735ac2a814e 100644
--- a/drivers/virt/coco/tsm-core.c
+++ b/drivers/virt/coco/tsm-core.c
@@ -57,7 +57,7 @@ static struct tsm_dev *alloc_tsm_dev(struct device *parent)
 }
 
 static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
-						 struct pci_tsm_ops *pci_ops)
+						 const struct pci_tsm_ops *pci_ops)
 {
 	int rc;
 
@@ -78,7 +78,7 @@ static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
 	return tsm_dev;
 }
 
-struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
+struct tsm_dev *tsm_register(struct device *parent, const struct pci_tsm_ops *pci_ops)
 {
 	struct tsm_dev *tsm_dev __free(put_tsm_dev) = alloc_tsm_dev(parent);
 	struct device *dev;
diff --git a/include/linux/tsm.h b/include/linux/tsm.h
index 381c53244c835..6ac12de8c4d36 100644
--- a/include/linux/tsm.h
+++ b/include/linux/tsm.h
@@ -120,7 +120,7 @@ DEFINE_FREE(put_tsm_dev, struct tsm_dev *,
 
 int tsm_report_register(const struct tsm_report_ops *ops, void *priv);
 int tsm_report_unregister(const struct tsm_report_ops *ops);
-struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *ops);
+struct tsm_dev *tsm_register(struct device *parent, const struct pci_tsm_ops *ops);
 void tsm_unregister(struct tsm_dev *tsm_dev);
 struct tsm_dev *find_tsm_dev(int id);
 #endif /* __TSM_H */
-- 
2.56.0

