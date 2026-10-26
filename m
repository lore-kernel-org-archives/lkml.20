Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009912;
	b=36DxEVJzky1tlI5Os0KK/JyzOuzUEmMkb0WtF2gEKousJT83ztgmrNIssNnH39/URm/k
	 zJ+0e1QR5XjJI5lPUSAkhwcHHhr7MJGwVNPT9pe18qblDckL2gMPtOf7v6Uho1U8+nUt1
	 6sW5O9LaXwIV9CGcLsh9uQeRuEAHFAOeSHjcdzRK83Hj5eod5Rm/nCPgCSBKhsojya0NJ
	 nZq9lD5O4Nyih+HGf1lqyRtGvlgzE0l9gyhcReEef0PLyzOSbEH1Mn6hG2kxoLXf1ScTn
	 ROoRQIvgwKLqAhQDHqaoWo8pX0uxZ0+cd3XsEhMMLmADMTRkwYqOVV2ZiyerGgWHyPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uMe2OrBlQbkfT3wcvRtHcAjQdCdPt+EgXnOa1muqk1Y=;
	b=xLU20lVRY71Jid05F6C14rje3Q5MMro3JKErpXjhPqa3WGYAGE/gIl5hpD+YyitbzJKI
	 NjX4u7l71WEqBx13e72sE/a8OxTJfP18RFXxV9IEYNajEv7hFkX+Wik/tlsVeJRFJlg/C
	 095W9SkS/Bz1fVlO9HBgKA9LiAfDQeFncNOqniNFHy9x69JJoEiXufpJn/+/i7cC5nJ5M
	 eYp1FV3fmctFc7O+KlDfzMK9M/8+9yml6RuGFLR0noNi7BS6Bupijv+TH3jgc5FhD54Qw
	 XEDDIZIn35gdTCXPBpLic4SXnuJS5ImpjWav3LR2DztBq+W0mis9NV6VKsILUxfWRwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DDaufxmI;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FE3606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30FE3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DDaufxmI
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso4741374eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009911; x=1793614711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uMe2OrBlQbkfT3wcvRtHcAjQdCdPt+EgXnOa1muqk1Y=;
        b=DDaufxmIVVO7pEUlYjncmUG+iyj3BLa/cJ0q8f6t/B7t21Y/liZ00gjvp8ZbYlBMbk
         vcGGt2vFSWLE1M1rAwdmk9mtJEp61K/4Gsbf9uX2CdrUuWQ12xBb2ldrdJa+cQzyxvdw
         qb0RHhGWJc60S8Z1fLctIOBWpBLMU4TBw99WwwzZC5hotDZhhvEAG50lm7G0DKPfRvmj
         LtnZlnyboBh/LIQr3OHgv7lY4X7EWy9elK+9+y2WYhet0JTpKaQcKMHYYLul30OLHCgz
         ZPa+aJhfs2RGoAbznC5P1Rk7skuWOIQvVZp+pKtkf0Yk8WNXsy0K44ZpFvy84xhR8xVM
         bjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009911; x=1793614711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMe2OrBlQbkfT3wcvRtHcAjQdCdPt+EgXnOa1muqk1Y=;
        b=bx0g05Dgli9MioS2g1DJ3RF1ynUixbSs3jXshMb5h0wD+v0/9YJS08EemlGGc5lBBt
         i1AD2GHE2AazGkLN2yJos/l87FwxI2KlmVULIM6oNuwLvDXTWNi+Nw7/U0/jTczxd0JI
         xy02PH0r44tzIiqxD0oFAUUDSpyyvhXVg4ObEvYEg5yRvwyPiWEV674GYR9346sEKgdp
         7dIGT94I/7RoufJZNCfZWX9yZH9JEM2VM12Xm5pd5PqzpgiyX79IyFaqXOeC+9ugEdUQ
         eW/aeK+kNozrEKvaydx9XSZ9DeU3O7Jo4K8A7djSxQ28Ue9OaKmsrnFL7DXPH76jj32U
         uj5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjG86FnACJkYvvqFcDacASj5UdE9wcHhhkCKDZPyOL9kex5/V2axfS3F5SLnVxqYYj2OAc2pqU/muYyzQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/nJzmrFR2rBCHlL+RMzSmSzTX8ugwmYvbMlyJNYovR/5/ClZk
	ZM7gzynipBxQJCGlsL35cPWC7HBWPG/6P5XabTSSQhH6ZgvE4VkVplnW
X-Gm-Gg: AYBFou1ofHEcTf0XQVihZiIZ03l8lVDTBH7Zww1OkG6LUprMuxicvvDroxJsuppmhzr
	goHhByv1KAJMVmijI/fMywuGd//iKMCep490Qs7MYi/3Fyk4iuI4lqGOMmX8B6LsprtFVDaUXEK
	PwLWmjNALVoWL+5Rm7PnbhR3Ywhk4ysrzCsjCKzR57j05TEzNRJNs2MCSLOceUijWBP9aXUOWtk
	EY15NpaDu+wzaPcz7nurhT7Qk8B72+GjLgMnD9VafYymXj5Wpagln6NL1DY+FYj13dxbqfXdlyL
	kyGlpxLlMIcPU59+wSBjUBBA1Ovlo9ZbJbj5ySVf8Tg6xThXWzT9GXxeaGFrbaAzrxx6P9wqPRs
	O65LhMD7PDL6RckMAVxVpETRyUiVze/0FAHFaR5teakU2AW32j10tvExI5q49P96hnJG+8FIAHK
	hhFfusBjJbBejlY29LiTx6GBnPezK/qmM0bsGMqnD3yXOX37//D1J0JQNs/yR4xP9ZcJc5NYUoP
	3OQmAzAmDjVTB6u28SDcW3L/SjKRj2EfsiKD0IPm5oSa8G1p0QpRw+XeSBbEH61XR866QKml8g=
X-Received: by 2002:a05:693c:8214:b0:351:31c7:ab1d with SMTP id 5a478bee46e88-369e8613376mr10271627eec.16.1793009910967;
        Mon, 26 Oct 2026 03:18:30 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c9b:1c1b:d646:355d:1105:8655])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec865esm22437475eec.26.2026.10.26.03.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:18:30 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH v3] staging: fbtft: remove unused fbtft_init_dbg()
Date: Mon, 26 Oct 2026 15:48:15 +0530
Message-ID: <20261026101815.73722-1-himanshu.bakshi478@gmail.com>
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

The fbtft_init_dbg() macro is not being used, so delete it.

Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
Changes in v3:
- Fix tag formatting as requested by Andy Shevchenko.
- Add revision history and testing details following review feedback.

Testing:
- Built the fbtft driver successfully.
- Verified that fbtft_init_dbg() has no call sites in the kernel
   tree.
---
 drivers/staging/fbtft/fbtft.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 40a7567df1eb..16459e4e0ba0 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -420,13 +420,6 @@ module_spi_driver(fbtft_driver_spi_driver);
 #define DEBUG_REQUEST_GPIOS_MATCH   BIT(30)
 #define DEBUG_VERIFY_GPIOS          BIT(31)
 
-#define fbtft_init_dbg(dev, format, arg...)                  \
-do {                                                         \
-	if (unlikely((dev)->platform_data &&                 \
-	    (((struct fbtft_platform_data *)(dev)->platform_data)->display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
-		dev_info(dev, format, ##arg);                \
-} while (0)
-
 #define fbtft_par_dbg(level, par, format, arg...)            \
 do {                                                         \
 	if (unlikely((par)->debug & (level)))                    \
-- 
2.56.0

