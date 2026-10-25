Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960026;
	b=raJ7hPjmT3pTPJJ/O9Y2uoi+1remv8XqjUa2mDBPngp8aNxfUfQdnLi2Q+M5ZdroY/rf
	 QUrqQbjGSoiARRL1/T76Q5lIDJff47Lh0UHv8Ay+7MMpJTcBYj4ipl2qL6fr3LqEWVbJY
	 4nEi0lIhF31yPq+cViZH7A2GGRYLZF+YdAFjyJw9XxFTkCFOhitRXvuke4rQIEVn7w8j2
	 40u5ruKwjeuA2CWXBbb4cFsNd7bBSEXh6r+ndgN4RHOEtO5BGOpmLB7lWVhAKXQls9wkc
	 XbB7IvFvPIG93j4OQCD2xf0oXKuO/6LO1EPrNSkKkPTz6UGelvfvKRyYxvXiq7cS8tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8sYUmjJXh+5g9W9rBcPWe/gvdOEiK2sbnLcw/CdbTc8=;
	b=zbXcskd1llnySoheywZA/NxttmcokyUua6aOHIxAHGj2tyQn4BNc5QmpudLdBzLW1gJl
	 UQgTeOvx/ikjR3sIlVZLtIan3KW8oiDgkAH4vGAZQk+ncjQhaZ5sSqC9OSiLehmmHoGM9
	 yLRFGQAbwoUJRjqENJUq3lvlqOcOSDjR6Cf+E94AE77Orzh8k+03RYtY9hQRsksgfNtD9
	 efXyaPwySi4jd4+eW8RxrX2k2TZ7BGahhQWzRuHS/IqXTiRBk07P4a/D9w8aB0G9eAme2
	 vB4CgjqcAYUkTZrGgLxn7pt5/+97tucOQzRQnwNP3uFYGj/hHyw/WS5C5dJuSxRtFWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b8gs2huG;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DFC606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42DFC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b8gs2huG
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a215e64962so16073395e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792960025; x=1793564825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sYUmjJXh+5g9W9rBcPWe/gvdOEiK2sbnLcw/CdbTc8=;
        b=b8gs2huGNtbu8k2ZNPL5mkgJ2Laqx983J6efsXNA4u7Vsc5PYraIv6MxdGUBeGsafc
         KQi3VS/CgX3w183o1vzlMJ+yiyuJ/zAa5RH2PQRkRI1J/LFtzKtHk64PUHane6cvBZ1W
         SRzTlSLYxIlNu0hL946XPmDWabkA9Giu+XUM+DXiAngrtpUvsCoI82nCwaEwS86nDExH
         RACXSjOqXqoI7JT7IfjLc/U9fj6tZWefxP9yPE20ErQxcfkfqTn+0hDMIn8JU+r+IBos
         LGMgRg8KcU88DGV/K67I9rAzhDuEkkW3WPBJfO8aU94hccI8ByVc3AW8mfyhip6VVcAZ
         aiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960025; x=1793564825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sYUmjJXh+5g9W9rBcPWe/gvdOEiK2sbnLcw/CdbTc8=;
        b=OGTCtmWnFtJ8oAetS/3iG+yxzRuJH4k53+h0MxiRjYRgJS9koeYnIp8LshOpzmUX6x
         2OB/oeOTCswpn1S+AAUcKxDensBq5vyClfMqF/LOoX4jJi/DenObZ46oL0WxaKQhsJre
         w/1odefcaOpNsLGhQFNSqleCtdCfdJvOw2GXGG6SaXoJ6QlmHQTyAuQGYLs/pV9UTPIV
         SwtC660inimK3Cro5UIVz789UqkK/7wUsvyxIea+pKs/zlxDJvFi90m4BUjU1x/OmiPD
         QxvEGZKTjFvaN9asKbsQNYrK5q/ycSd+jQdvrYtkK1JKEZ4sIO5SVGap4cs8ieVrzwbR
         s/Dg==
X-Forwarded-Encrypted: i=1; AKwUvBwZlkHiUHNv3yLMlaerUBGO0W98xa6sPxgra6inu2lfnokrVM5WrGmn7nMUlpStKtQhoexDsgd/DFat9Hg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq4ZsPghf///05BZzWjS5dyeqxBjyxzd5VWFeZ62jF7dXrWUAa
	Q79kD+SRx3eOFi2hiEdFG+3MaYDTIVgSDtWktGqgkZoMThqIqhuUFXDS
X-Gm-Gg: AYBFou2bGucqNQA9hBaZHEI1v3o6jk2dq2gnHn3pjwzjcy4e7Mf57WJIoRHrrjptxVz
	XcAVElxJDfJQlqNJa6oxhUFn2BP9hjqJklMplpuHaCetEmoHlGUc7wl65P8AcMYiKYjuwmR8cBv
	2/x2GwxXGI0sM54HN/0luquJNNhKU5HvRKz84GyJxDmHVyAmmcihnvVnM1IWSiNKQyMwbyhJuO4
	QrwUc1DpjNvu2pc+AuGGNIPUV8pdtVGx37bIRx02fZeTAqp3aZpF8by5+XCAPEtQB37jg/bT/5C
	+VsHPf4TDmtcJ5GNUu1CmxBbWy4R2Vkour4POlYG2vNWXx7SyyWvbnNlnqUnUrt50wRTeGAjAIC
	Bj74G3Zvxzc+vEFZua2eCdnvC0dnOHr+gDelx+rA6U+KLtIn1GUbPEJwMQ5rEb8bmdQuYsz8tNL
	d7BhyWGs9dCsWhhJz4WAOr3HSCEZ6udz4nl6i3jPn7aatHmu+KmakKB4yH019W7B0XHK8FtBpW2
	+mbj5f/XrA/Ct8B4/7k9T/mYO4zzwbgX0SiBHmDWPS+Ltn7a8pCwTcA5P4mQ/utXmfbK2AUAnxB
	M2BavFD5+P1YhHNHFw==
X-Received: by 2002:a05:600c:870f:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4a35ac9d1cdmr82312895e9.17.1792960024499;
        Sun, 25 Oct 2026 13:27:04 -0700 (PDT)
Received: from Ubuntu-vm ([115.186.50.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a574088sm129197415e9.9.2026.10.25.13.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:27:03 -0700 (PDT)
From: Haasham Khan <haasham93@gmail.com>
To: sudipm.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haasham Khan <haasham93@gmail.com>
Subject: [PATCH] staging: sm750fb: remove unnecessary goto
Date: Sun, 25 Oct 2026 20:26:37 +0000
Message-ID: <20261025202637.9274-1-haasham93@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The goto exit statement jumps directly to the following label.
Remove the unnecessary jump and label, and simplify the conditional
block.

Signed-off-by: Haasham Khan <haasham93@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 21e310274330..66b015959963 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -815,12 +815,9 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	var->vmode = FB_VMODE_NONINTERLACED;
 
 	ret = fb_alloc_cmap(&info->cmap, 256, 0);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(info->device, "Could not allocate memory for cmap.\n");
-		goto exit;
-	}
 
-exit:
 	lynxfb_ops_check_var(var, info);
 	return ret;
 }
-- 
2.53.0

