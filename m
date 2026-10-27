Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102642;
	b=38EE6zcduk9h/jpfuU6Z63+oXz4vd9t7xt/A99eEAF7dBTuFrDXJ/qZoe+LU49Qn/gJD
	 jZMWSUyBjv7H9qXCRysBonZeEaCP0xxwRDTNZyC3eDOIAoE1n/x2i8kPj8smIOT1WHnSa
	 vaR5yqTOKmUhOi94VZSrM9+qgKeo2da1O/SJbLQGXupShmG7A4OFzT2DE47ILGlqGrkaz
	 MelugWm35qng8zCkfiFov8gJ02fxkLUQjMPVhlxPRtV3PuI7MKli3wzsf5dsUdEHYXAeM
	 +Iyauy1XfAQdjOgEd3+JYzmyoAHGWo+tWeUMYZkj60//fh2cviGnT7rtNPsz0sZqAfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
	b=J2NCVN7D1OKtwk3PeAyddUKgiqy5BIJlhmLg3RM9g7T52XP3J1G94xtnFAZx62AVeHeb
	 y6Pqn/LTJ8dMVo4JMGb7JOEuKoHu3R2Qywz0T+e/XHE34id5Gni/Qbw8Po1QK4/tWyxrh
	 X2FWhVsHJGRFycsx5UnsfsUUX5gzJl9rPte01utPjYwMhUV/x18fl+tBn1L3snXVR1sUo
	 urTjOLIgx5ZF/xk7WllPgLWHY/hc2XCgc0iMVrFwmk1eUz0C9MM4lah9Alwk7mj0mvuST
	 Ukud7KT7S65g3RKs2DRbfiAv812m7goa9pwOKvDBA1eS3kaKpIDwYLXz9AHl7Llxi9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="au/YN+L4";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2641606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2641606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=au/YN+L4
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e0d1da913so853759f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102640; x=1793707440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
        b=au/YN+L4CFecuROR0YI82Tvz2pkZylIrDL8YwW9NtU4+3jsh4QWyv8z6uqc1EUzfzE
         iG/ZH2W7aufP/NMaNuXgRltWRVvjQ0DvBqiUkGqfNla61HyCTRhFftAsNYkhq/D8MTC5
         DTswsMkQ7LrO/wRtYInO3f5ZJIeTG/b6BCihNpv44OEJT+dLRveCzYHfjPtOkHh1Ajhz
         cupyIl+JfJljMriZFpul2Kn6pOuj724gNVfLzYz0QGRFeiByhTWgpXnEZno4zV/1VlS5
         GUMH9aUX/q7Ceu/2zsAmTgB6OS0Xmogkp47dK10YWxZxPy8fKQYqfwJKCC07qDO3YYgV
         psQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102640; x=1793707440;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
        b=oe5sivGdTO5yuCwfqY1fAPS8G4rcO4M3nDrq9mgiJ2ISznhn1AZYAF6Oa1/+dkEO4/
         Tls9W4T6NfMqZWJBxSXwqdjw5z8Jg2tNuj6UJRs16hJlJLsib5tKzvZdKfs5LfLaDlyc
         VOfXNmMTXQCJ1XL1KmJKi7H8WJ3G3lr3E6QqyT/uZgnxAeFJb62mkeSjlpJR2CBOL2OU
         AUIDdVsyvlkDjN1+wS5Ur3sO1L7ZlOuvmfcaZ9RktKeDUSQyfdD8Tyn3UgKb7t8z+HWx
         MYt4PAYp6fIQW6h0WZijVHNQUnSF+ukXNI97YK6ldA5rpkVHtNbcpdVmGDOGyZhQGVW7
         WPGA==
X-Forwarded-Encrypted: i=1; AKwUvBxTRcvztKR/CTMA6uw+221smglGwZ9fzN7Ft11ZXfdzlEj11b5k4YjnOMxxZwfsfX8ezmEKtWahNR+ridU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfZfWHyYkcwdOYqSwGMPEoXV5fOEVr9UVy8S3oqooYiegWew+/
	8GsRk+SygG9NNid/dmy85AjE0rFis711k2IyQN9EKv8WuZ+1lem/aO6G
X-Gm-Gg: AYBFou1TwwC8gpfsT6WiEWanhePEG+zCZBkFu0jN68sK/aQ7I0u8Hu+aUQZATDGV2TP
	QWl4h0bZJPbjYBh+zR1Ex0jaTlxnv/yrhBCU62nbxy9CQHaTWLrxYbWVn01bUD1hzitS4xhDVRo
	YLVT/Z9jkG7TisUdabD8xs8EnAOlynx2ZdH+zm+lP+CLW4el0BoR+/5rTktm6AvowDcqCrmUTdK
	R5YqcbOHw67YJznCMyywYsvA7g7oLj3K4NZrIQJKrwX+LDD/rU79lAbKfKMWDBTsT8V8fjjgjU+
	rsRUPSdkcIjDzls0vcpT8IBDitiVwYOgFtqKTI/Yxi2K69hnxxN0Vm2KVmRJ5Cx1m/3+fosKSYf
	7V20BA1Db7Zx5TpunZCMz8G/PfyKeFIIqF71MVPrQZTMAhrrFYnNRBqbHwJeL01hwKd3DdtwQ8Z
	5fDoy+b0pLkQYZ9/d9UL7MCEww7BIIjtvDg5xHHTubPIbiv9uF0MnC4cfKQ0lMwsQr8M0LwEHgr
	XIgXPq2WXxrn6wVI0PmvFbbNCTemAQRlsbzRGcndxzZMAPTNe+rMaCRLXUM8MeSoFJ1/xzvn+S9
	EIbv
X-Received: by 2002:a5d:6d05:0:b0:48b:226:839 with SMTP id ffacd0b85a97d-48e55a150f9mr4623479f8f.14.1793102639863;
        Tue, 27 Oct 2026 05:03:59 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm22977554f8f.46.2026.10.27.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:03:59 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v3 1/5] media: atomisp: sh_css_mipi: include assert_support.h directly
Date: Tue, 27 Oct 2026 12:03:36 +0000
Message-ID: <20261027120341.2305533-2-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027120341.2305533-1-vladurares@gmail.com>
References: <20261027120341.2305533-1-vladurares@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sh_css_mipi.c uses assert() but only gets its definition indirectly
through the circbuf headers. Include assert_support.h directly so the
file does not depend on that include chain.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cdb58b..83424b6ce1713 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
+#include "assert_support.h"
 #include "ia_css_mipi.h"
 #include "sh_css_mipi.h"
 #include <type_support.h>
-- 
2.43.0

