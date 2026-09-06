Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271953403FF
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 23:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788736246; cv=none; b=dJ4XDYxzl9iEhUXIau3t5L1oNMNoc0lc52J8n1mooEShE4uEqn5VkrdTaF6Vyn7JBTyoQ9Uth7bUZSamoNwhv1ztmVXotsWyA5LUzy17M2o/gcgceGCA4EQEVoi8Q43mao8r+ENbyW2JTA+1Tsy9rA4i1G3K2I0ahPBj2FvvnN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788736246; c=relaxed/simple;
	bh=E8CGbHSbxQU/mf/lTyLnFrYGNMP3sFNRv8Cj0jTPYUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rsbBRR8X4cLS4NzmwvPAwQF+ztU8PMKFycT/avN2JGNxR8urJ4P7uZ4+30ajFI/TCP8cB8lTZZ6HUu16qMYpEQQ1axOwCzLZa/IXlqrloTJSI6qRPzP6p6vgAUg2aRBxgoJfb7/JQQTlu6PQcRHYw1gcjPS/RW9Y8h+yLj75nZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAhjrHWb; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAhjrHWb"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4858be8b509so1146539f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 16:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788736243; x=1789341043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HmLppH/k9rc9BfUk1RX4KWoc5bDoKtg//l8Tl2J592g=;
        b=fAhjrHWb8YVgN7mo8TYcekEjXtaut3311ro4Rmkc3HLMheNxIz3U1kTY4I1d2W0tdS
         tk+01mbTX6MxvmtQvoFWg5SuvclfduWwqlVFQoxPpOhG+7yGtklMnvF6+DM7Lq4MYwke
         fDV6WUiG2GoKyvoulSrUphF73dbZiLWHtBngBlJ/P7x5bMfu9pL2vcwvvdA5/UzWjdLU
         0ELpI8OEODpT6A1Nyzo6sCfJCpvaNANxEDsMussfGJgp5k1cV2rfIDhfCSL4fXGrkamO
         9g2aXcnUPjjpYfwMLutJkuCb6RTUX4OKisltxUevowTWB+arSaAEZHDSirA4Joaz8WMr
         GN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788736243; x=1789341043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmLppH/k9rc9BfUk1RX4KWoc5bDoKtg//l8Tl2J592g=;
        b=CvqT4xEUgRiv0rWjgYaVLhSHG53vYzBaz3iLHXNhyLRyFhKt7FESitPcEBrBo8Ojtf
         ABid/yctd3LeGg0J8Tq5xW895xhRL6CRkl0a4ptTFlqlkouhCMCJfd0u148r73nF/jM9
         i6rmilB/woKJV1eHCVjh1zXc5EVwrO/dog5Z1BdSZA0e4Y/Tf9GwTwdNMQfy1La/en16
         XO2nldQdCqpYJ1mNFoMuYc8CzhYGgsX7hoN8x1VZ/WDgkB+SP03WZnOz5yeujze9Rjss
         tHq8dKG9Ruw3bcfAFs45n2GsiHNm3BK4oUMJTOIh5+dreG9mde2oA9AHwOY7uHMrF0o4
         KZdg==
X-Forwarded-Encrypted: i=1; AKwUvBxWKTrnV9Rien16VkUnp1cWJ3bMe4kmkxUyqCekV1QNLETddQQkbkSQgjxqilH8sVfjaI0CWrNylkDHqCI=@vger.kernel.org
X-Gm-Message-State: AFuF++kjtHSz43Ion1XyQkxf2T9JcpSSbhbMMUCUmldc/nNZZEOtLjp1
	0GlSd/2A1LGfdQJhJTVjaTPAz3wRCT/uaXSGfRVm+vl7ygHRPVAK9mht
X-Gm-Gg: AYBFou2nmF5W2EBj0nVuC7UwipFyKurKUUmzHek1TZ0P4w5Obop3lioLlbMWzkNyca9
	/jgikV1EE6x6oN5Cx+jEWI4bbBkCLLqYHZGhGVvZvVwnAm3scrvldlAh+CVGREzoZ+egl8H3q+F
	sVyRzq/HNXzh4Ish9xNynDNjMK5dJupCevjGMEixQ5FVauh/c2wka0DcKpafCyS5fyUywDb8+6G
	1Laa872Z4BkZEl7jGfiGABzAyf2OHqF5dpEM4KnDsnKiKb3Dbgl5JwTKeIuUtlSX/W/AYgRWnZ0
	O+505zZ+iDVQh3Ngq05U8zXUBm1Ba8dEticiBjAFr9zKiW72QuGOwLfMAKm5m1XyNd/cCdN+hSG
	hQ7co/IgeC6lPJrQEqVChk8yYv3oQjekvjIGszAlwOmvXjQhbfPbEZQhp8VAPEnVd2WyZKg5G5z
	jbi2C6QcawFq1FemYnDzDEBgNnsBMDatpBJo3kUZ/vRIi+mwZ60jpLTmgYSRVHs5dGfE9Zc51Wy
	kOP1rgNMNdWv0limFqurN3pHPgVt0LiVdy8uvj53KqU
X-Received: by 2002:a5d:64c8:0:b0:485:8c16:a342 with SMTP id ffacd0b85a97d-4858c16a84cmr17398660f8f.55.1788736243123;
        Sun, 06 Sep 2026 16:10:43 -0700 (PDT)
Received: from arch.home ([2a02:1210:2e28:2800:36a5:7f85:ccb8:1176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm28065057f8f.25.2026.09.06.16.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 16:10:42 -0700 (PDT)
From: Gabriel Windlin <gawindlin@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mashiro Chen <mashiro.chen@mailbox.org>,
	Luka Gejak <luka.gejak@linux.dev>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Gabriel Windlin <gawindlin@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused SSIZE_PTR definition
Date: Mon,  7 Sep 2026 01:10:29 +0200
Message-ID: <20260906231037.915883-1-gawindlin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SSIZE_PTR macro is defined as __kernel_ssize_t in basic_types.h
but is never referenced anywhere in this driver or the rest of the
kernel tree. Remove this unused definition to clean up dead code as
noted in the driver's TODO file.

Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index b6b1afaa9ab8..dd376072d1c7 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -14,7 +14,6 @@
 #include <linux/stddef.h>
 
 #define SIZE_PTR __kernel_size_t
-#define SSIZE_PTR __kernel_ssize_t
 
 /* port from fw by thomas */
 /*  TODO: Belows are Sync from SD7-Driver. It is necessary to check correctness */

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.55.0

