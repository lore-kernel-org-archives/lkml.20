Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98139426694
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301582; cv=none; b=H1/UWiMvi8VgvxhXPF5mgtACJCu052Fny59E5wTCJWectTTrR5nyfB2qmDE0FtmevNqMnrcIqHOXkwMwiprlWhORWFr1Tj/4TJBXJ9OCZ2V7oAjczWHtSz6UnWARSYeJ0saxIxE9W6KRpC/+O5fkxnOdN7hIejGtYpytp6xJrZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301582; c=relaxed/simple;
	bh=YgsqpuTm8PyDbe2cZPeEOP7o9Ffmmp1AP1QWnfnma8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YKmdTLIA27G5wYzcmAmIdXXP+d799h/6laPtd/GaSbKk+lD4cPzYZU8wNBGmEIXPqsjHyHxilgZaxoGVghgQzktJubqJxFBafPRK8TFFv8r19qbCOigYubEjVQjz951xb7xhvLksNogGh5vWymOFs5KLFWV4CZ1IY4QPQC3rF6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.b=iTExfl0S; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.b="iTExfl0S"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso26186185e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1791301579; x=1791906379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E7QbmXfomxVLV2gtFMANYlR3HCma/SUKYm1KNeV0yn8=;
        b=iTExfl0SJ0AmUBs56VpqciUtPYni57ipCjiz6+iW+1+rBXfEL1gDqL1slV/DxYpei3
         EPvziXA+kHk41aDYmejLuFZBV14+BV5BUBNpHNj8ytToah/0o2qL7xNPFfd3fTFasbdM
         tIQ6ua+xn5+t25ZDmY3ZnEj3zNlETJQKEmWIdkAxGx5xzgDCkBhrFHH6qQw1/RO1qzmC
         hofp2mJf3ilua2KagWT8/4SUSD8UJk2jVaQJM1PXSv2or/nDr+/pKgvkmGFMM3eGNqAC
         2L0PkP1fHhGOaZy42QtzdkCDduglfiX5x/CW9qdCyKGBAEPmQyfXT1IS2SEi/VYxy19S
         JfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301579; x=1791906379;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7QbmXfomxVLV2gtFMANYlR3HCma/SUKYm1KNeV0yn8=;
        b=QuTiWhGkYMklWpR+xzMZI+5VxmT7FhJmZcn/IQlygUEHUPwFVtSri3fCLOFaKwyyjq
         YOM1yS7FsnG00TsX2ynNn1YVakNsM66XqrwPHD00vsIizm2+XgQXE6XBOa1ItfL3N2df
         ujMLl9bQAdVBSJ0gQtMxgni33fuvebcgBlWydw54jCKCIApKD8tgF2Zzj7CR3AlfrB+H
         36/aF9UxicDE6HndOe3qQhD5+Umxhdkh89D6CSNDraSojw5iDSQZL3nHfKjevCoJEpkz
         OOzy2H42sI9eqF4gHfQjRn6Og0CJNbRdAK57340AtJGVxnMgUt4SVQn0X15XOoygskH/
         Ahyw==
X-Forwarded-Encrypted: i=1; AKwUvBwiSfiftJymJ7EHDP3FG6OfoksX5nr6UbSxU+TPwwCqEO/OSF2K/cUlWzG30RxCn1ylMpNhFsY+5roOJrY=@vger.kernel.org
X-Gm-Message-State: AFuF++lci/2kiQqIMTz+JnSmgau4RoqgCFGVfYaAvFGVaze78XWWs1fp
	zdNRdLK9ux7PBzLAZoINEh/dVpCgB6jzN+D2JY1wl8ETEfjwM3FdHEelIHP+0QQqRkg=
X-Gm-Gg: AYBFou04sn/5dsHFu3OrAjgCqDvO/9Lq/mgCWSXkw2eMz6k4d4wR/xlPg+Ssd6sKlei
	YlAGtFUOqmjUo805bUejIexJi9LYyDN+L9xyXa3ah4rTipyY3j01aJPsfHiUgcfKtgyUrqGVajq
	+w315Wr30gkYM4sfDzKRg/5jw373/El9bnNzKmo5JqjxlNDZURr1A6WCps57GV26SqonChhveR2
	iz6TrgtlUlfsbDHgVUs1rpkHEQJ+C7eTuLc2Akl54ndBQ3obWBP4xhGdWyi2JvJ9G+vz9sJRXCh
	x2SHIpSqIfUH6T5PM410wAwgOex8RleJ2B+q0fI7gpe1K6UBMchY2YwCjv3N/Q5IrlZtDdwaXwb
	lrXmIAxuLPCGsFAcJiO7/CzfnXyMxwxdj3vN2Tuvh6340WhqfnBA1PkNIgTkdeAfhtqdbOw8u9p
	z19tfFgR9mNF7jsdtQJfsmliIM/y+Ol7GS/JgQfeiiiQsugNamzOGyBRezC2mUFfWq4Ne9B0YdO
	0YlFPJ/9kwgf7zkYSZgu+XpKcTfzJNl
X-Received: by 2002:a05:600c:4f92:b0:4a1:6f41:9102 with SMTP id 5b1f17b1804b1-4a16f41937dmr138539205e9.9.1791301578649;
        Tue, 06 Oct 2026 08:46:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:4bc9:b00f:d376:7c33:9a50:ef33:f391])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c5b9d6sm72087205e9.13.2026.10.06.08.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:17 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars@linbit.com>,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH v2 01/20] drbd: mark as BROKEN during DRBD 9 rework
Date: Tue,  6 Oct 2026 17:45:48 +0200
Message-ID: <20261006154607.3936501-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006154607.3936501-1-christoph.boehmwalder@linbit.com>
References: <20261006154607.3936501-1-christoph.boehmwalder@linbit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Mark DRBD as BROKEN while the driver is being reworked for DRBD 9
multi-peer support. The following commits restructure the driver
extensively, and intermediate states do not compile. DRBD will be
re-enabled once the rework is complete.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
index 495a72da04c6..ab0bf1b7eb7d 100644
--- a/drivers/block/drbd/Kconfig
+++ b/drivers/block/drbd/Kconfig
@@ -9,6 +9,7 @@ comment "DRBD disabled because PROC_FS or INET not selected"
 config BLK_DEV_DRBD
 	tristate "DRBD Distributed Replicated Block Device support"
 	depends on PROC_FS && INET
+	depends on BROKEN
 	select LRU_CACHE
 	select CRC32
 	help
-- 
2.55.0

