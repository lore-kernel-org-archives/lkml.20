Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792865376;
	b=yh0UTRfGl7vn2HEeyQZDxZBNcV2nAVUdSPN4WkkZXmVzFR7wB9vqFQ6z4q6YMrdCp7Ep
	 j0sbyZNmoybgwwrHkvL/pZm625h+h3vxmtTE++Pzl88+XNd9nzXZrSWcxFJFE6u/1vm4X
	 WtPUU8HxOIAD7faTdgCSbd9hebr36q/oEbu8xVv7nalDrJerVWvUMwuyPLqihiG4v/NNI
	 zAEa9j0DqcbiX6atfxBE7QYrIW++sNUh47uWh2x4cPV2el6H9OujJLctI/mCnSADbnKFa
	 EecL9kM+5/t/OX3j23FhVcKvdphKPIr35d69JCA5SxFtDDE6SeWJ6ShsB4ymMijr+4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792865376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1do5SZCsNsXFNjC3kteHvHno5OZSZlN4oGD9w4JlcOk=;
	b=M6vB6RnnBPadcaGxMsWwPm7nyv3ZklZUL9S0miIOrZ63AiydYuHCynySCpOFMDdJ7swf
	 xJtGz4Qh6a1FaJuuwNbwBOkKr4TQXCQbjKv+kNa2E9U34VUgHGba/ww3WFA8cIzh1ichc
	 SBYPczoDcs+xB4T1qNd1fiG6tKJ01zwAanFwIbCa673uAQDrKlFdLf8CBQtqvVn0vM8hT
	 8LYygll4DAcA29Y5JdvpAt9oG+jwGr1zjpmKzg2RXa8AVjmu5j+V6+7dZoDuXpqyO/zR5
	 0MhFtcJQQN/oJNw0K0skw4mvVPoAuvbMp6grVZGYfI3EiYfoFOHBW12FMXtIZfY/VTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CgLabGsW;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C3A606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83C3A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CgLabGsW
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so2999192eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792865375; x=1793470175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1do5SZCsNsXFNjC3kteHvHno5OZSZlN4oGD9w4JlcOk=;
        b=CgLabGsWu9Qgfc/Gq8E0HEFES6Eek5LmDQjn1UieZ4EaH1/W8ZFpZN79PY6RXOsMIn
         KJdkHykrbj90WNV8V8B/pSBMFjKNJp48N7C27gAPL2HN0VbY89aLHA+DyVA6MifC03f6
         R9rDF7YAyppLydwDG5M/z4DOh1VT4R0ZDcOceJfTTtY6ybczyJ1JdSAjPT3UuTyoWG83
         xm7DVN0Wq+/3jjyqToq3XeomaFVG/JVaq40aaSs9oSsF40x9MNBhA9bWZW5Xby6cZhBP
         nrFwygbFocDLCsFq/l1fokooV7WaV3eFJJu0XrTt5rpI5/Axr6o9wnKQteSeyv2bHeHl
         vbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792865375; x=1793470175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1do5SZCsNsXFNjC3kteHvHno5OZSZlN4oGD9w4JlcOk=;
        b=oYFFzNAu0aaNa5UNHhuBZv4gyQYzUxXwGgHuVlnIxoo/GiLTgS4mj9e93McqY8agk2
         +BwjQnhSIaS8/GfKkYaVqbY2bPL2MHudIoa2lAL/c9TUpaYk19LGxYCphnGTnPVtSdR/
         aFpYhTWOmbz22j1ezQaVVV44l6eq/SIqhxpVvCREf1XBm9symsmVCiF9B6d08fupzMCX
         ys5WDAklJOXei9ZsTs55Sftidcx1uo4pXpYzUhQ0JF9X6/LStyZHQ2KfNSP6p223ZfzV
         3d5dvjaxdii+wVZDJxoa3D2cnxuAmSpkqS1fCduaOvvTUrnXXYvrcBE3F1y7ofpk9HoV
         1gbQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6aI2TCMyjs3OWwky2WwyjNZRJV3mMS+WhlUC7aXGIg77RNczrQ98WZlNbDncBxPAOVInXftROqHMzixY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+/QGX3ejzR0iTTeUi4kvk/KfAt2QjumYUCSiBZm+kXChtbbcE
	1CzaG0OZMrVdkNVKhyOd9GAIy/OUm46yYe2Nj2oTRPV3rna0hZiJu6/G
X-Gm-Gg: AYBFou2ozPJex4YsfmA3669L2wcLZVACaWwg2xOU8aPiRW/h68jNX9XzIwhheqNHU8S
	FKteE7NaoiIuXUFunspe6oLjmkG1015VQIWTOq24JHSmB3l2eqR9EAuapjRGBGjci/f+XmMETvu
	xHvnxbzKM78pzCgxOxwz45STvXDU4ECCONuVvSD5P/DOuEhOVRuHq9hxDawBFm+HIEYH8FDFmbn
	Cb/pFSU+zFDSPNHuB76OnRlEn6raSkBF994qk7bZoyfssZFZccJDEfTFn9L44cAXgm2ldsPBNOL
	v/GQWslC5lhOrla+zcpGfPkbOWlRdqmxicxCb/UCjthDXZ6Y7LgfZ8sBkX3jweZpW+ejHnivVlb
	OL0SrPxYP2V39CaHkIMp3XiA7V1Pt9CWtDUyzIQZcAL2cc5FfMYxlNYMFDmq0ie/eEI/tJa3yi1
	zXSPqod7b5A6BCNtZJ3Mo5Tj3PQ1LXKxr8xzKnQRatBkbX/sX68qB+qiQ7nLxeDCsuzYAOcYTAA
	NuDIRHxNNkk+llnJEPOlDPIm5/W408CDGlaJb5pp6LzHgR/fqfKdTkuFqIVi9wgppTc7hOLep4=
X-Received: by 2002:a05:693c:62d2:b0:360:8a6e:640f with SMTP id 5a478bee46e88-369e8625854mr3682464eec.39.1792865375371;
        Sat, 24 Oct 2026 11:09:35 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c9b:1c1b:d646:355d:1105:8655])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec865esm8020891eec.26.2026.10.24.11.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 11:09:35 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH] staging: fbtft: Fix line length warning
Date: Sat, 24 Oct 2026 23:38:03 +0530
Message-ID: <20261024180803.108872-1-himanshu.bakshi478@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

Split the line in fbtft_init_dbg macro to keep it within the limit of 100
columns and address the check-patch warning.

Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index c7afb0fd3943..fd7f8fc2afba 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -424,7 +424,8 @@ module_spi_driver(fbtft_driver_spi_driver);
 #define fbtft_init_dbg(dev, format, arg...)                  \
 do {                                                         \
 	if (unlikely((dev)->platform_data &&                 \
-	    (((struct fbtft_platform_data *)(dev)->platform_data)->display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
+	    (((struct fbtft_platform_data *)(dev)->platform_data)-> \
+	    display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
 		dev_info(dev, format, ##arg);                \
 } while (0)
 
-- 
2.56.0

