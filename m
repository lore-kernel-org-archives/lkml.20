Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D656348F03C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331806; cv=none; b=PzOFt2trSpP3KGwwXjMIzvG5nMwyyEie5a9+vaRgKFitm48FTBJp0mcMP9drHuj0OJvwdy6ksidUcq4s3r4p+VTHdhqpF69kZaibfY/SO9tQ5YMIXKuc9hWGDs/7MTLrwiBJELZBL6JOqKjNDUCoev40l281vOkBoRwo9Dygy0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331806; c=relaxed/simple;
	bh=ss9x0WU2j/c+xzIZJ/8qgI2PPbg6n5ZEhjAEZb2gjjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q/t5EWUlPIvnwmrJNolqKLrKkXKk9bUnGLxVl++Qk4a1yNkHvfR4p8iA64Su+UjL7LzsZsiQv4y7Vq6GE+YkO9JdnrKkmPQMACt4IvERujZkM2S6FO23KDi5ce2JtFy+wjuKF9pEJK692OqqLt36Za2V7B3/gO8GJvZAc9pyRfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NK5nNVqk; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NK5nNVqk"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342568a5b54so15601eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790331804; x=1790936604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uW231pxPejCLFHQB8hEMFrYd8ElO3hrmEO8Z67zsYhs=;
        b=NK5nNVqkpoOhumegUg1+zFk/bZjLBRomqAeMv73LLz85vEoY6S84Ju2TN5Btb2ljBa
         8vHcWCqOQ7agU5Dgg2zbr2o0piIwXgySLqCuTwWqf6rgQMG282Msp3Cz7plJld7rDfWu
         D6xPKgj2W7FbMd8tzSNM2oAL3tW9tCeimUAj38PCeEGM1Ef6zwlzVEuGmZrd9uI+PNlw
         yqKECqmaAo1ep1NddUoVCPaV+IeqSuDK3C7tPlUWnxC7oRbZHAEPPLuGllZFFCDxofrE
         USRrvpFS1Dr75o2aHCZEbitSjGBvaHXBG5OvrrEfJjsZunqBeH4oRAt8zbO/sKkkJson
         lZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331804; x=1790936604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uW231pxPejCLFHQB8hEMFrYd8ElO3hrmEO8Z67zsYhs=;
        b=n0F7ioUE77UZMwkgPDTJekfh91Fxwe5zrFM7ssfFMAdPNrBUrtXmaR42pSVV84ENPa
         0k76kH5K/qXvy0WNp09K2x6U8iNDHd4/K7UZ9nPiXethJnowVWg8hioefaMQMcXO/CT4
         3YSZ/ef+kF8pY5pqcsUHarEKLAh1DeKQPnkbcnyE3VUcVQASROvrtLZNFNYXLhNnzfM2
         vKuTNdAR2ij3809Prq8cN0cBg8Bh01Vh/MG3eBlDLI5DG/kEpwm1gNU2BOKA2l51rjyt
         aqRN5RzO6yu/Ng6psEE0/WDpWfFtTD/DeQtaebQdW7bu+i8P83BXftDfnSmWc3ezDGtM
         vpYg==
X-Forwarded-Encrypted: i=1; AKwUvBxAnfL0PBeNuCV7BzwRj5hGqIJeFcDc+EuYmFx0c7QoB1ugPEEPkuUO298t+HUZeFLQEWgE9VQZgxfCu+4=@vger.kernel.org
X-Gm-Message-State: AFuF++k/ib/SZxsMzBXlDZQU1aR0I42efedzz+wb2PridpgcOtSpyH64
	JlCyv7hTNGRZHnJuu1PO6h7tzjOoC6mHS704LUr5ffaiT6/xvp0JzKzrrVZNDDdm
X-Gm-Gg: AYBFou2L/pcmDZJFspKhpK34E6GIrmDF/y0vreHuUpLgqe8CrNSJIXwPsjZZWHPv8n0
	npugv3WITdOoHIDY+erslX7YpAFuSwo7YOwZZ4OIYMHUS08r+H0b7v9LCk+Wo2kyWSMD9ZMYXWJ
	rDKsboFnZGwsh8VGsKmFMU9BIDWHg3imq/spXBiET72x7rYXi+rbIlu0WsPXdcPdRSp87PewR2J
	hzdIh6tWvGWsX6BC2qVTXs/ZOTvpa1pdMmrJ7t3ANbhN7acCwQM9LwKHvGcU7Bk50faje3jtAvp
	e5lL1iobQS9TxRja6FqDRulDoCV3yYRVGRXBSNCkbx1G+2971DRdaKepBn9Dks6tIBvS5wFtygg
	kvd89BRm3fkqp36GltHCeMV6CJ2QHM9ioJ/KXpmi5uC+JD0lmpE5znKxLpgwaoVl4AFvndb6u4y
	FjysvyDso9H22wTPvigUqNXYv+OdP6ugPmSsPhMv36kXWZejrxG7V2HXHA6tbMmHGeweUX4vguD
	OhpaNGtmI3nZPahE/bdUYALp6Nl5dFLNCfgbi993FX/YSjPMV/gmZ7fzMAX791rKgW125hUSjpY
	w92hm2O+JBREQWiLqJNWq6p6njeJgEDKbgYChY6MLeWjy0Zl2g7LnMkPwgWxjCOzf3kxaOmm+Iw
	b1RGBDrR9
X-Received: by 2002:a05:693c:8942:20b0:33c:987:7581 with SMTP id 5a478bee46e88-34000737ad5mr4052959eec.26.1790331803832;
        Fri, 25 Sep 2026 03:23:23 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341463ec3ecsm5927610eec.31.2026.09.25.03.23.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 03:23:23 -0700 (PDT)
From: shashank <jain.sm@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] bitmap: test bitmap_parselist() with text after the group size
Date: Fri, 25 Sep 2026 15:53:05 +0530
Message-ID: <20260925102307.49513-5-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925102307.49513-1-jain.sm@gmail.com>
References: <20260925102307.49513-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bitmap_parselist() cases where 'N' or 'all' directly follows the
group size of a "range:used/group" region.  These were accepted before
"bitmap: bitmap_parselist(): reject trailing characters after group
size" and must return -EINVAL.

Assisted-by: LLM
Signed-off-by: shashank <jain.sm@gmail.com>
---
 lib/test_bitmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index 35bb18f6e326..f316a82840f5 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -528,6 +528,9 @@ static const struct test_bitmap_parselist parselist_tests[] __initconst = {
 	{-EINVAL, "a-31:10/1", NULL, 8, 0},
 	{-EINVAL, "0-31:a/1", NULL, 8, 0},
 	{-EINVAL, "0-\n", NULL, 8, 0},
+	{-EINVAL, "0-7:1/2N", NULL, 8, 0},
+	{-EINVAL, "0-7:1/2all", NULL, 8, 0},
+	{-EINVAL, "all:1/2N", NULL, 8, 0},
 
 };
 
-- 
2.43.0

