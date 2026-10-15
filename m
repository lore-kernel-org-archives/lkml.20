Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A2253D0B7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077516; cv=none; b=XAvDeduH79sDTO+aQpzS2gnlMNK8UjLDippkR5OG+H/lH86sK4mBdbxv2VAeGglvdZWF2Z3yLA4MFq/IvfXjhw9ftwPiWzlKbyiP0FaWXBKHtu3PijTXiv686dzsnrJiaHrUVnAV/b7WME0dPjW36r0BluqkuCqa5dmQH5moxJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077516; c=relaxed/simple;
	bh=++Q8Z0PhbUqNHVck4+ce6iBGWIyeo/ytKAm2vgGm5Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LOfPhtKmsVD3JWHGgeyDT8YanokgxRXTvGbY/rq1boq34NYTAIj6HtCOJvdy7+vDELAj3L7KQFfLpNFRqaE1etnZNCSCUnZvnQt2eE9YmsBfI0uJz0fkeeOqaYJ0rH3Y3ThVDxE96R+lhQaOhVuUYH46aTo3HjcEk3A3zBPxz9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ln7aDGWI; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ln7aDGWI"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-87ab6e5f91eso39460297b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077512; x=1792682312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=657leYWjF62i3dCYkjoGlICrtXlQe1Ifza02V7u9nf4=;
        b=Ln7aDGWIb5toLh2Caalr47AHVFoYeIwJPW9d5+Oat2c5+wX8+batc8moxIAdGylbbw
         Pso0QApZQrDmBDoLBpNi1a1V3QI5Z7ejAEk8Xp+gJOf9LPyNA4BBJrJih8kSia/Xph7s
         vEKLHrI5ff6dvVbdjPovCRpAfr9SaxSpH7fLO1DMddV1pcoxXO4EdVhvdMOpqgyvk2Qq
         4Pu2BqDTMfXA0LA14xCF8r7xLgWv3fVJp6RXOoEfd0c+8Ty6x3hSZ41GBLA8roiks6kM
         1IDIhZBLbG4RYuOewq0GO5aNIAAXAq8YdQRvSRHGdkdO4FV4TiBBLYVc6ESzWSxB23vf
         ZD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077512; x=1792682312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=657leYWjF62i3dCYkjoGlICrtXlQe1Ifza02V7u9nf4=;
        b=IpA+MBATM3iK61yBAC2U01AU54FdjWnhar+zmwAgaYmP3oDaWxejWMfOHDKfLYPO21
         M+x8LEK2s5pbsNkTO6PGmVt2Hm8DHJrNnKWz8sgZ2dUeniPtQfiRitPRpni1IaQwwu9T
         X2wfC1apQpgwn678UCLytgvkXX/1Rcer2LkGynU0k2ASgEcmxA9QgRjtbQYPr+ZwrzFE
         kg6T1i+dEF9Nb3QvnBDUgWuceA4ypoDa18jIzWj8jW+dHIh/ftTz9veaiWUip9PoA6YS
         aBA5/pn7JAtFLtK51svM/AkShDKW4fZB4T8k3aA076FzfIZfG8sRzwNt3rm7jKPX1D5t
         DSJA==
X-Forwarded-Encrypted: i=1; AKwUvBxA3AHhMjrZrOujtkfq5j2641DurD/VxgvBzHo5DyasO1ky62gbkFXaWY+DWlT8ObTkyFDbwBupJIAGxZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0BsmQc4mQgqmYJkRyPsjJ7RpdZK0j8lchPNto8rColYsYZU7E
	D27izX7MQVXE/kAFTxORoYxUD8Fh+W6PPxDtV6MjOurosqAmolSTGd1z
X-Gm-Gg: AYBFou1c6+OKBL3H86MWc3SOgiDeGp4wEX5OqyqFXjHGhqy7pjf7DDo7IBgMSKPNRTM
	y7af7SDBLZWF6WqwHKthOzZ2LysDzDEYh7bpFS6md/7fkXFt7iuAl5sgjDsN6MV3t2sgF3rNy3e
	lljqO9KZNoUc8jnBVLHrdIFoBhth2yFH4u6cgSRCVCNa6+3zgi9qd+Y5/tlarytP6OIvYr9vmVD
	9cCspXmaAl4d2pGBJ8B8JpMLTbUx+riLaARcuTqe6FvuqvWgbSGXf25CM8pvTyLqUxXsG6p1uYy
	Iqe0On5hEO2lnSBx5DrIAZI5emgjTfI75rBntXoBnqXJavcsun67LRZLLhnbczlnOw/TogT/Ry9
	jPU7by1ZU19LCUpuD9fNrl8fXYlXmNRsnlVhdkIzrdkw+2ssXEKDbeTlBWmXsIxf32nWkhxv6CN
	y4wSoT3cUgPD/Kz/iuJQx2WHPN9ZiL0W4SHrHHk1/d/5rtTLrzy52t2bwgelPIrjo3oFmEnmyPE
	ZypNi0yUM8Z9RwCxqhMq3oOZnEoa5TcAPdJY6opcDGtPdS4DACV9hTn4jirlji5mjpXKGE=
X-Received: by 2002:a05:690c:4003:b0:8af:1f4a:21ae with SMTP id 00721157ae682-8b07ee1dd1emr53956717b3.65.1792077512318;
        Thu, 15 Oct 2026 08:18:32 -0700 (PDT)
Received: from tux ([2601:7c0:c37c:135::8803])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0c1d50766sm23093017b3.49.2026.10.15.08.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:18:31 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] wifi: cfg80211: Fix error pointer dereference in nl80211_dump_station()
Date: Thu, 15 Oct 2026 10:18:01 -0500
Message-ID: <20261015151801.348976-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__nl80211_lock_held_wdev() can return an ERR_PTR on failure. If this
happens, 'wdev' holds an error pointer that bypasses the non-NULL
check at 'out_err' and gets passed into wdev_put(), resulting in a
dereference. Clear 'wdev' to NULL before jumping to 'out_err' to
prevent this.

Fixes: 599b8a3c549b ("wifi: cfg80211: support unlocked station get/dump")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 net/wireless/nl80211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index d790e204aee3..739283404531 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -9031,6 +9031,7 @@ static int nl80211_dump_station(struct sk_buff *skb,
 								wdev);
 				if (IS_ERR(wdev)) {
 					err = PTR_ERR(wdev);
+					wdev = NULL;
 					goto out_err;
 				}
 
-- 
Thanks,
ET
https://github.com/sponsors/ethantidmore

