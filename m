Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1015208A3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068326; cv=none; b=tt5xI8oN4DJb7o0ytduy/A9wIiRQHLkEBnpskuqfN13Z4ekAW4yQ1putxl/Y1Ot3Km+G1hnOqpEwS8LK7pjigzB4GyPCZmJ5P1EsM0Lossva1yE1f++zTeArP729JkZwTHl2CZB9GUEdouDrHQJ0XzBok3/3uiUF2+cKfBeLWR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068326; c=relaxed/simple;
	bh=vylKQQ/G2tNnnLYMwRsPYg1GgKjJI3BVMUSDP2z2GUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lHr6hezPnEkCEQ4AALinNG8oEOuWJpWlzwyvfEf4cLEF6U7eqJSm3IVcYAkTD2KZMxAInEZgDJ0eAa/d+kKvr3JFV/XB/Y5N1t74B0mkhPgQkZqucPEqAfgftkG+xi0CR+DDLDpXYbnYdKpkWIR79FuALF7+QgIqTWxR2OINz4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=snhSgmRP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="snhSgmRP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so25389765e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792068323; x=1792673123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g5NM70b1gJo1/du8KK7kg4ZTGntVLz97iWXJs9yEjyI=;
        b=snhSgmRPnsWlEjXREbKlA10vr1u4CtFlnG8j1WZx1UTUi6xIF5kxfGEhT6tPyFNqNq
         FrE/Bi+iA2P6Pns6d3xBz2aMvdTffRS/NzOGXb8Nsc065KgZcZUqO58xbpipevruJpeZ
         kebAW4hDpR3jZdITocTwe1xIK/Vf4iyon8Woa4AVr5DPTy6ilgbXaImD8ni0dwbuqsLB
         2ioJE1Xjw+WMgNuaSAQBwKsqfA8UiCP4SZBG10ep5TPXquT5MySmxDBWr+ReTy+8vlVA
         V2f+/ZASswo82E590GgBIl2GVkbe5K3Co0V7Q/C1fEazfNPzPhXjrHysdvlajK9ehw0F
         NwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068323; x=1792673123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g5NM70b1gJo1/du8KK7kg4ZTGntVLz97iWXJs9yEjyI=;
        b=ew//zTfAY5vO3+ZdOSGzhKCbbhRVyYiwK6V/l8Eu/HvKhu6VAgwVlo+UBEH8Oa9TfZ
         CPBXRiZEjjMF+QmfmCNBrdZeckXppC1qGi2fuxmmeU/qrdFcSPwnpz7gVMBZRd3nR18Z
         dZkADS07MBzlA/QQtOQcS5GF93BCiV0MdK3zRi5x0kXa2uNihtCxAd4vav2GOnKOhLKB
         ZXR7aSvSwmwUFhMTSeTlwVV8xG1KMfoIogm7ac/sHxnnnPyQK3cYfnzqmXp4fv1ldtbO
         RVTJqtR9VA+XA1niy68Rlp0v/kPlI4KlIBkYK1YBR7z6CVqrYGD7RBfaTbtsMvqGsU30
         jmVA==
X-Forwarded-Encrypted: i=1; AKwUvBw5N+rwKylqg2O/xxBZEt/bQ0BMOO4vev/Wbif+h/PFzexi8/QYkkKjBTQo0mbU1X1bSAX0qYhZX+Y4yXA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1rOzZAE3Mz2XTYNJN3vUx8cyLZTUgc9GiIziJQdb/VfN/Vors
	kd5NpEBFsLUYB9ksgZOnur1ltXwIdLfIfqxvNsFq5UXx4hUFrtGePbbn
X-Gm-Gg: AYBFou2dcAwmrP7EP1yXuU22Q7LUTF3i28/B9cUHnUmJ2A+hI6K/Uq23h4F+UArXerX
	BVHVIzTlsZHjU6Suqzoh3pX+N0MLTHucO3KGdFUiJKL99toP0rgRBl1VMeQlb02qIi1IsmsB4nK
	HOmwLHPzXgFoR1Ef6bftghgw8VZbFe/AqdwnV+2iVPbEREF8GaOhyaNZ1+0OOyp2xIQ+1hB0e/I
	2GSY4+LVWXb2bv6bCeXPhzVT7dMrNCKlnqBXEN2+/cTdtCPQV816Xtthio+pkyIWsQ0lwczlHKT
	uca8C1FxNNRf2B6KaRha4JW2w4O6viW3vMelzuFNMvoO18ErzFqvlblG3jVWKdPo4LuJuppKMHp
	9KIpTS+8rV9E5QkpjlGUnB4UaGmCdDQxyYgIuwB0e24/vfKdbGWK6g/6yaE1lPl6inU/aEGjnfz
	bw5xSEjPoJJOmIJDC2njnPfXXF9A+TodyPtIuFu9+LgvWa3kXbhO6maZjHYGD7Yg==
X-Received: by 2002:a05:600c:4f42:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a18e3ecfc8mr457506165e9.0.1792068322613;
        Thu, 15 Oct 2026 05:45:22 -0700 (PDT)
Received: from fedora ([2a02:4540:a7:16c0:b518:4b00:679:375])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd640be0sm52911945e9.1.2026.10.15.05.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:45:20 -0700 (PDT)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@linux.win>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>
Cc: keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH] crypto: x509_loader: Use %pe to log error pointer
Date: Thu, 15 Oct 2026 16:15:00 +0330
Message-ID: <20261015124500.53228-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error path in x509_load_certificate_list() prints an error pointer
with %ld and PTR_ERR(), which produces a raw errno value rather than
the kernel's symbolic error name.

Use %pe on the error pointer directly so the log reads:

  Problem loading in-kernel X.509 certificate (EINVAL)

instead of:

  Problem loading in-kernel X.509 certificate (-22)

The new form is easier to read and matches the convention used
elsewhere in the kernel.  Reported by Coccinelle's
misc/ptr_err_to_pe.cocci semantic patch.

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 crypto/asymmetric_keys/x509_loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_loader.c b/crypto/asymmetric_keys/x509_loader.c
index 0d516c77cc2..373b5106e10 100644
--- a/crypto/asymmetric_keys/x509_loader.c
+++ b/crypto/asymmetric_keys/x509_loader.c
@@ -39,8 +39,8 @@ int x509_load_certificate_list(const u8 cert_list[],
 					   KEY_ALLOC_BUILT_IN |
 					   KEY_ALLOC_BYPASS_RESTRICTION);
 		if (IS_ERR(key)) {
-			pr_err("Problem loading in-kernel X.509 certificate (%ld)\n",
-			       PTR_ERR(key));
+			pr_err("Problem loading in-kernel X.509 certificate (%pe)\n",
+			       key);
 		} else {
 			pr_notice("Loaded X.509 cert '%s'\n",
 				  key_ref_to_ptr(key)->description);
-- 
2.55.0

