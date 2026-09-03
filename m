Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A254B5150
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447240; cv=none; b=Fg8VkFq5B2LRvWTG4BD3pkVV9GGes6Ibi0+Pom5zhaTJ7rnzFIJ8tSCzb5rXK6CJkMyFKsJCeE3IHddZm8VEQ6/tbn3Q1lYFQJmMGhBivqadPJlv/G1cRQFQzRI2WM7nb43eNNs3u6qKvxEtfuadYCTvmENTWTj/nD4SeB1qTXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447240; c=relaxed/simple;
	bh=YDztAxXFzz062DPQ0F0G4V3tU5HbxyJb7exw6We5bcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UUrGqYnhfXCkvlZUhU4W2+TaRwDF5LOCtrdXrHLvPuQ9sLdFDalG7yDtFfp+5emCyTnoHju/LUCaikYHsOc5E8dHDmYjvBJLun7FTT8pG7F2dh4+1dWhIzi4OJOKxd5ACVgVYyvUSMngUZalxnvPjLf4KIY1euo/fS1xpCEUucE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d20whh8c; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d20whh8c"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48433e9562bso574741f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788447237; x=1789052037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1+XyfzZPIbCKw9YCkSkEQGbEGyUvErmvY4wjUX5mpM=;
        b=d20whh8ceppgQLEo7C6rIl5+6aoAZepQCAMfHc3UgS4HoCY5mNom7mQ80k2YDch+O1
         Vwl4IVhhM1aBV49zaES6SijTDq4pDM21uQVxfblxJ3btOe/4DkXP/kAGdaKD6Gz0sRRk
         4rFMIZRXsuekIF5NC5rYsis0rkNybeadAV5FYepsAd3qmBiFgo1aOB1aTwaAu799zu3Q
         z5EF47lRitaQjTdudm+/XL+QdJ8EkaEtq0tGHkJqWIqJotlXl+CkXg2q2FXXWBSwsXaG
         33ujLFtoMEIEbhme+Pq4cqtukcYa4gZMoxhCYHX3w6d7aIxVVBskElOQAvWNj845SvOc
         QtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447237; x=1789052037;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z1+XyfzZPIbCKw9YCkSkEQGbEGyUvErmvY4wjUX5mpM=;
        b=r1mI2BwItmMDDy9rsmi2UW42ZM/vmtONUbRKdpzaKtIZB5qx8WlrjrMR6ks2uflHuO
         E40uiD/xlx8gM+RaitEJHfsW7dvMisRGX0iLPI70p3hRXSS2LaXgHan+P/yjEo1e1xyZ
         11xAP/nRgY5zUREI3E1I2UffoW7sZIrRBlFzBZMEuQAXIkOZJKFp7laUVgdNNeqe6hY2
         hUQ5yPfThjScKHUeHs0/HSkzIXHpjlgzg2bwh+Wj7K6pce91jx3pIcELtW6V54JpRkbj
         2L3wnn8rQOHRvkhbOd1KhxLxLKNt8b/S+doyTtG2OixpbZYeNzdgJ6iViVYSCVlqGXBO
         dj/A==
X-Forwarded-Encrypted: i=1; AKwUvByevZRPpXaJGf3Trix+erhkFEQCphLVITOGBGpKDkFVo6+PJGJGJgm6t2FMpejMuI6MkI57+b0pk8Mqwg0=@vger.kernel.org
X-Gm-Message-State: AFuF++mHdHIB051i1d+GSXDbAgM6wJyyhC8OnRr77rxp0cZx0M1KajNm
	/Y3JTNj8WlB6Xcw5fuAHoZPoRC5kvVF2GVFhfHAPJ9OB/q8XLGo0vDRr
X-Gm-Gg: AYBFou0YQzvVsjYU8NMpXcgRscJQCA3RgV2a3x3f+Bs3qTjwGleeDbp0qUa1WAGmpF/
	Hezs3g6ALr4ux3+pC1rzJGKNhGRmUarjTubcGGm76pwmZm6OUxJ/C08AMdA/9I4SWaKcD3Ogwxb
	TdLmQkwcXdWBL5SvHMpw0jXMylBdT0onfwOsHZxb41Z+9BoB0EK9KzwifKRP78dyvSgO37Q0Iyx
	bkwlpAEKtUFN7/pT12sB8k9jhG5teJscKD5NZjkpZJjGq5hTcGiBzgMWwER9h8SmGmbw1mCQLYc
	CjMqloJSZrVAaUzmtgWf2JitlqRoFqqQPstfOXGzUvGAxnLFK9FxhOyLaL7F57uM0mTTKegXBA6
	70wYf90EiMzxzviVbmMJzvcs/pfljR09pS3I1PaRMid9YPvhw2vm6Xu617VcKn5x+xHe+G0Hoob
	1HZLepOLf4RPUqUd97QmzE10gYlyN8JVsFI448y+hZGqzCDub46+86khGiPD+HUERO6oh4
X-Received: by 2002:a05:6000:2381:b0:484:49f6:361e with SMTP id ffacd0b85a97d-48488f1b287mr22241291f8f.22.1788447237227;
        Thu, 03 Sep 2026 07:53:57 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed3716sm15490761f8f.22.2026.09.03.07.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:53:56 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: "David E . Box" <david.e.box@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] tools/arch/x86/intel_sdsi: Fix spelling mistake "Licencse" -> "License"
Date: Thu,  3 Sep 2026 15:51:53 +0100
Message-ID: <20260903145153.11313-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a literal string. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/arch/x86/intel_sdsi/intel_sdsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/arch/x86/intel_sdsi/intel_sdsi.c b/tools/arch/x86/intel_sdsi/intel_sdsi.c
index 766a5d26f534..0e12b59976de 100644
--- a/tools/arch/x86/intel_sdsi/intel_sdsi.c
+++ b/tools/arch/x86/intel_sdsi/intel_sdsi.c
@@ -315,7 +315,7 @@ static char *content_type(uint32_t type)
 {
 	switch (type) {
 	case  CONTENT_TYPE_LK_ENC:
-		return "Licencse key encoding";
+		return "License key encoding";
 	case CONTENT_TYPE_LK_BLOB_ENC:
 		return "License key + Blob encoding";
 	default:
-- 
2.55.0

