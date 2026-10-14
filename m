Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E241FF1C7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976510; cv=none; b=OVSZ156kcfi5ghWUTQS52Cg2OGViDD81BmmD1dW2j0dYfcWpbRh4K0iaHwhIXK1bBOV8Wh3VoPTWcQJJqY1usjsxV/Pc/OS5LpnBwmLlos8FpiqyNAb/pNZzpa0L/V0ufoGD265Ft1zck4Sm+O+UQqY458lvvy1kTxG5fVnP4BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976510; c=relaxed/simple;
	bh=pA6tK01gx4veEbIy4nNVNT4ccqo46lFKSMDcGlOgdhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dg7DrM89JmPTlOqRzsebLYXUXZT+00DtmufpEUI2FF6vZeI0wlf5o6SJbddm0+V0HwyLITW0nYFW4lu1rzAugjgh5PFr4q/Tx8N7wiP3RoxdpOzEB+36bH/nwUpo7MssUiWD/j6fOuILg2RNTOOXYgvZ1cmoSVU+TSHCjyGD6wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=docker.com; spf=pass smtp.mailfrom=docker.com; dkim=pass (2048-bit key) header.d=docker.com header.i=@docker.com header.b=Sy6R3/2h; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=docker.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=docker.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=docker.com header.i=@docker.com header.b="Sy6R3/2h"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c411d6615so2883259f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=docker.com; s=google; t=1791976507; x=1792581307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iikceBOXTZxD7Ya1iNZJ38IRluPVwuI4hq0the+RtIw=;
        b=Sy6R3/2hC5/w/AEoqqjSMwmh3GckVIazhWskC+9M/w1qRIToF3oZBO89k59mhP7TMT
         hcvj1wVoaWv82eQyOaG3ppuUeGOenHrPdvEe6RCdETDp6450GKrPrTLqjBqhyRdKx4iT
         ZDN4/qYYkPB35NyPQ2BBofiXGy+AAvOCfLy624rorV9j785evl1ONP19oduf2RZKFGss
         v2AwDt2EcgV/Swqv5Sn2ydlVOS5Oh73qXuTUEwdz7Jd7t3zvCMsOyotoIEkKzAEbJpqM
         YKnN2Gqi0M4tlpS+HpX6mbF9wOQWJ8WagK7fQjIQq26xUWgeS6j5OfKrRMWMVpMCOynJ
         HPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976507; x=1792581307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iikceBOXTZxD7Ya1iNZJ38IRluPVwuI4hq0the+RtIw=;
        b=WBQEytz2pkzj2HobCZspDxfcutFHhS7wkPuLwtljZjyqcUUS0scD4Bs0PDS5KEDQ3r
         zA99YxKVBE+KQFP/nTFPbkUZ0ocVSlEgwwUbooEONWnt/e6Gw3fbZa24DazrSmXew+oP
         3BUgtJcyOEgtJm2XKiyRXcYOL8hIEMR0aFF80Pk3XcMRjNrmz9lzLjtetEW40btcxOvv
         5h6jMo97yHBh8weX0/wA5fUAAq8ubxZWnRTY/zTYLTy2OKpgWJ9GN3j1UbsKMPzsxH6H
         LjWBCDAJbgwRYarcFqRl6cxw8afVPaqx1VLZnQLV2ez/LRdlbiHmzMsKext57zJuuIoD
         xRsA==
X-Gm-Message-State: AFq9FYLWktVYGYABKN5QHuCJlWeJYxkkCWvvtMZLgb5+dyO8fwwlaRvv
	zlCL+3yuZSxAXqxDb+MjqSEtOkjuYEuXoVWugCEQkvHC9bi0W2Wrn0ULKe0JMnPCzs0=
X-Gm-Gg: AYBFou3r6VLKt3yg7dLqSX5hr2Jpr25pxyCtDOufSX6HBeIh6c1a00IF46Mmcywq3kP
	jfQ7XGZQJlpPGZh85eWLJlhUYQ2H3EnYpKZA0v4aSIVt6Qzi2QeNkhWSXiz58Grdw3Cm55zMHNT
	VVkrwsF6nrJFUmgdihsYI5AAy+MNuvek+O1g5WC6wtlOcGBJ2OgJzCCytH/C0UhJ+X+6ip5o1fy
	dThfo8SyWUFAjyOAGXNqgSGrc4R1wWHXuKnBuYa6HvEl9Np/NrkUGzQnQnbNZPhibprGoRP5t+Z
	1JX4FlnSduzynnHfEkG0jvubQgkAEWmQJhq/vLVraKYwM4GykRkgU5Z0GLgEjggVc7MPZN/YEyV
	hkD58Ir5TKzymEwAUp+u1Moc04bs5GQvMn4I/BydXESEj9ZWc6/KQIlHmBhxHUNZFLfmwTF7Bth
	iGVDzAdceoRqDcjx96VOAhZxzhodGHReueBrwzSuMH7SDdrIUpGDrPjuUjuK3DaHS2gsPvC++lI
	12rIzovI+VaQxKqvkiJjbIX9s0T3Q==
X-Received: by 2002:a05:6000:2613:b0:488:7787:469d with SMTP id ffacd0b85a97d-48dbaaec58bmr28291468f8f.25.1791976507110;
        Wed, 14 Oct 2026 04:15:07 -0700 (PDT)
Received: from F7R9GP321C ([2a02:8108:f588:7800:c7:b27:5399:1c2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0acb1ebsm11643059f8f.44.2026.10.14.04.15.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 04:15:06 -0700 (PDT)
From: Xiang Gao <xiang.gao@docker.com>
To: linux-erofs@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Xiang Gao <xiang.gao@docker.com>,
	Xiang Gao <xiang@kernel.org>
Subject: [PATCH] mailmap: update entry for Gao Xiang
Date: Wed, 14 Oct 2026 13:15:04 +0200
Message-ID: <20261014111504.48355-1-xiang.gao@docker.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I recently got a new job; update my mailmap entry to indicate my
new legal work email address (though I'm not sure I will use it
in the very near future).

Signed-off-by: Xiang Gao <xiang@kernel.org>
Signed-off-by: Xiang Gao <xiang.gao@docker.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 389b94a0124e..55802b39523b 100644
--- a/.mailmap
+++ b/.mailmap
@@ -318,6 +318,7 @@ Gao Xiang <xiang@kernel.org> <gaoxiang25@huawei.com>
 Gao Xiang <xiang@kernel.org> <hsiangkao@aol.com>
 Gao Xiang <xiang@kernel.org> <hsiangkao@linux.alibaba.com>
 Gao Xiang <xiang@kernel.org> <hsiangkao@redhat.com>
+Gao Xiang <xiang@kernel.org> <xiang.gao@docker.com>
 Geliang Tang <geliang@kernel.org> <geliang.tang@linux.dev>
 Geliang Tang <geliang@kernel.org> <geliang.tang@suse.com>
 Geliang Tang <geliang@kernel.org> <geliangtang@xiaomi.com>
-- 
2.54.0 (Apple Git-157)

