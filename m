Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C915D3939D0
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789850892; cv=none; b=f9B2O7IEwifdlH5nwDeL66Vyws12l8+v3vMaRp9DtcQVsmRne/8pRdiqemelBC2DPdVX1R4RCReXMNNauHWol1Es0d5wLleS8NdwMJ6zGG0jB2ncIWuStbrtdteG0Vg61ivi15sQ6WK5IdRMeQz6gu9qUNOJID9ulsxMV13Gjlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789850892; c=relaxed/simple;
	bh=WHFKCdJIxJZts25V574gufTxt/e+kvWyiWNqWg4+FaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jku2IwFysjhDc5R7EahepfT6b2W1r24RWlwg/0i+b06M5u3zP0PtXWDRjYacW3dNfaVYkB4CIIUlz9a0F6LxHKHMCd9kPrc++EjnJWv448DOpizyAfJVK69YDbTGP+zdg+L9vOFSE9DZr9alCzqs9LVAOJ9/V3lMo/jCjHTxpdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cb0SpgOk; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cb0SpgOk"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca069c8so18618335ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789850890; x=1790455690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UklQyeMvhqLuej0je0ggi0hTj3VJTG/i2EoA/FxL8jY=;
        b=cb0SpgOkmSpx4HbI+vXW9P+Sy8sbUPwjOyXOs8dOCOqmceKIRpPDLumdTUjeuMK/Lo
         EDPOvc2eISYzH0sl8SQ35AGjeSqBz6FIbbKf9xh+Otc5xr7tqoo+HtTtIPIDM2LxK4Ct
         +J9kLPVG2pOyxFnD8hWZtW3JtY1Wo6t/oddpt2SJJUEWTAko0MKS3KStTcf0mNe4aP3O
         HHKeAFE+1/3Elb3vT05k0XiHZYHZ568cbiHHPOQER4GljuNlvNPSJEBjSVMktkz2EqjI
         FVOTyOrTImqq6fUvwB9vTHudhQvhBV+xTJ7sShb0/VrG0pkD1j9n2acXsX6E/tH18XRW
         e4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789850890; x=1790455690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UklQyeMvhqLuej0je0ggi0hTj3VJTG/i2EoA/FxL8jY=;
        b=ZQywck6bk50fCyxDVf4CWx1HejSWYmIGgipdpZ5mZD0XYMrPciGd+X1EX7cntslJ15
         KBft/B8ZQsuEfKCrJ2O76tp6bhiQ2fp49UALdn6FcjJlVsru4HvLJy94CwrEM95RYGik
         2O5S2z5Yzh6DDh77MiCiG4bydj09QNDlpG/tJUrseImsG54FMx8GcHfDuSI/MH+LTTht
         ehk2FrJbg/Vr9E+ofanEYKrhYTtZUK5yZhmysnup9EyaomZU1zBQw57SQp6TCuSpbkOv
         ktfmqoDzdYxFZBInbgroIdYTcTzst8cFLk4X/Ag0w6A3FqvEsQLQnHWUht4tw5oaaMjJ
         ipPg==
X-Forwarded-Encrypted: i=1; AKwUvByZ5qSg2J38ZaXliO+aOlIdEfns0Ek+6sGD83X5b1CB14BUG/4rrfZq5HAOFOEYNH0qbdT6aARIcrulzYg=@vger.kernel.org
X-Gm-Message-State: AFuF++kuWD8JStZZkqYGoRn8Ga8jCZ1M3Abi1yPxCZGv1RQTJcMlq8tv
	xI7/jWqHKKJwExVH3BHSFmzfUPzqxFXb7axQAr6xn5Q0bOcBEG6ml8FE
X-Gm-Gg: AYBFou1tFpFLKfwUfcZx7wAZr/uHWsAjpqmy62nrKAflk37juaegScV7jrYRVEjtFkv
	Rt/ajcRF32ViosAe+9EYrzfiHFoxYB9fJqU9IPREaIUUNz7m2KCo6A+h1ZDStM1ercJbH3VfHwk
	sW8v/+UiwYDiwqy3MbuDa2ozt43S2Zdx9KaUkyeC7pYK9iPR7T3Q2YI1O4y0NBsWV5j+Mzm5wLv
	Zx+A8TCbv2r3cnLyMCavSIX4OQ+N+tFKWJxPNUn5Dy0+idF/BbHined5Ksk8+toQom+z15aTt59
	g1qRM/pQ8ACqw7i1oCETuTljmlusV65UJVdKUPiT8noswzWvaRxHelUstLaJdugYhUDJwIHP3+3
	f9b25ddkt/3hZn67l6UtGF4GtZXibqMr9/0v1IX5MrdOwmPYj8fJpTYj7j6MABIif8FCqXw6wBY
	QvYntXC0X4MT1OY0S0QNvO1qsZdEYlC+4yJM+kEcOCoQMgTy0ZZOklxDYZwaiDJGG7sNBtAlVaS
	BOqdNdeUIZUP8XwOsns79yjwvkT3muPqxB83FFoqGUiKgSNsAp/7HjD2THrxp7nxiPLG+N4bdZ5
	vkHvtx4rAp1C0bHxDarL
X-Received: by 2002:a17:90b:4b45:b0:39d:f7dc:61e4 with SMTP id 98e67ed59e1d1-39e54b204c5mr10849177a91.9.1789850890079;
        Sat, 19 Sep 2026 13:48:10 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6ca50694sm6848858a91.2.2026.09.19.13.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:48:09 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Ian Kent <raven@themaw.net>
Cc: autofs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] autofs: fix sbi->pipe file reference leak in autofs_kill_sb()
Date: Sat, 19 Sep 2026 20:48:08 +0000
Message-ID: <20260919204808.2812930-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When autofs_fill_super() fails before clearing AUTOFS_SBI_CATATONIC (for
example, when find_get_pid() fails on an invalid pgrp mount option, or
when an fs_context is closed before mounting), deactivate_locked_super()
invokes autofs_kill_sb() -> autofs_catatonic_mode(sbi).

Because AUTOFS_SBI_CATATONIC is still set in sbi->flags,
autofs_catatonic_mode() returns early without calling fput(sbi->pipe),
permanently leaking the pipe struct file reference.

Explicitly release sbi->pipe in autofs_kill_sb() if it is still non-NULL
after autofs_catatonic_mode().

Fixes: ebc921ca9b92 ("autofs: copy autofs4 to autofs")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/fs/autofs/inode.c b/fs/autofs/inode.c
--- a/fs/autofs/inode.c
+++ b/fs/autofs/inode.c
@@ -51,6 +51,10 @@ void autofs_kill_sb(struct super_block *sb)
 	if (sbi) {
 		/* Free wait queues, close pipe */
 		autofs_catatonic_mode(sbi);
+		if (sbi->pipe) {
+			fput(sbi->pipe);
+			sbi->pipe = NULL;
+		}
 		put_pid(sbi->oz_pgrp);
 	}
 
-- 
2.43.0
