Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E0F25A2A2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957479; cv=none; b=j96QuzfiLPXl3zUkeXkrWwWLdoFor/x3w4+eMmYZLm/DbTj+pwFLUJ1LJ/LHfow1cBov1WRDGtC8sufRXxl2lB/TZmUBufFmyRiKt72C2vgfJfsct+54tm3Rwci7fu/spA6iHe6pvZ7Xkpr+5vTCVNzYOHO9RnELP6u+SW/59ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957479; c=relaxed/simple;
	bh=KCvhB7YvJG0+GzJac32x9PTIG884sVxUPYeN79PySU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YwVUq766nnVV/fS7qfqYcD4+byMxa89WtXBWc3/xCCoZU7pjecbvCPjQQ0NVvQNAG8hV6Tulrn3ml3JdlbjHJHQUQrfxA00GygJF46LT1Z86C5pACnT+zpOb0+GC3linyJzGuZwU4HXbheZ5q0upR8+0p8YnW43Ns/HAhnNMj7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nS0Jyaoc; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nS0Jyaoc"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso2162302a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789957478; x=1790562278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T6I/ak/O4eJcZiU5KKh1NHL3Att+jlc5ir7kUQuvbMI=;
        b=nS0JyaocSHg9dMNVYp4ghojIHEEJVDjHE0+gJhdaVcws2US2VM8oK84JXsRMFFpQ12
         R9t9fB3rN65K+PKdjHQx3qP2S2Rg28sKul6S5fyd+7Mjf/Lql/oitZo+n55IeZQQgP0w
         yZ7Rb1ptaaL3CVCp/4yl1YNj5iJS7eYoI4NYzb3YkUEePuDhO+B0zo2oECPez/hbdOFi
         eF0w9m2tTgFAHpWFTULhsrymQEPQtEJ4kHquh9ws09eEh7bN2RSjxynlzNL5zvlrM4c7
         GV779wYp0i8LtUxcyZmkDZEtQI7AFi14EzmL7BPLPoZ85sjat3qrzbnwtTgIWW035iz5
         2Vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789957478; x=1790562278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T6I/ak/O4eJcZiU5KKh1NHL3Att+jlc5ir7kUQuvbMI=;
        b=OJ0rK4wKPmBbaqfCD1R6xB1Eqgy+OnIeZoRnewG4b7zY4Y/d9BqK8Ee9dZvqiHA343
         mFSV928Njsd2KXjv7spbiCSh8DuvaJAstUbfW2Kbdr3ca8sgtyLknu30IwmCbr7AUEVT
         /cXK6RH7SfWSPxDU6JAq+44l0h//rYp6Iup/HxutQVAs1vhqFZ6DvWPHWSI4G8YyLBuc
         jCjNWbW+4nRh2SY1k1L1pAbTbyeQJZq5TLaB/kHo6FF00INf6INIzYQKttJ4l7HVLy12
         hD87vfI+d+NXFSRFS5p+Ak5fSTnJQTiS3bER0wDBpX215ERMt5wi/zC+CqBV60fXE2ns
         8UfA==
X-Forwarded-Encrypted: i=1; AKwUvBztCT27fmahqM7R5igKCY5WsHgnRtR++7vVLtX/4pVuX75e17IoMRgVyuK3X/QN0f5AYzqaOyxzLBdjhy8=@vger.kernel.org
X-Gm-Message-State: AFuF++lhXmdyz/s/gZbMK6WjYBDIqRDALd9G8UDKHM8b4tI7Uaf4sacs
	KvTzeXS7HL07HjXlIgeMVIQvVGx+9eTInYGV3QLfYtr9StftgxxDNqyk
X-Gm-Gg: AYBFou3BZO5JlfZdCTlvTM621pazH+TvytOaG8oRGdR+s1cmkpdOxEU3VEFGAfcZKWq
	QhP3xsQ/YPHN4wvVV0iU5Con+hoXC1mFwJ6wT0DOcyV8BP6e05cfBgDpCu+SyF8On8idWWQNrW5
	OS5AYF01Y4B38Xr5Vj87DcUXzoWMF1Rcw5Jc26YmCnAgfxdIfyQgTiaueh+OaI8mkWScAjEARMm
	E5Fmz+yk64ESJDrg/zQ+/u7dCVvruSa2+lb5IwFvYhQtpn54ruUrKXhfK/EK9tHpa+fya8lXdVe
	HqeXaQ1B47UK4p2eAHzSmrbG+Z+iB+D1dfR9i5XTrkeg16mA+LKGj+j0YszpkWJRy/rMhGReCTE
	hqycp+FxpLGPdgqOyK7xYwrski/oRzfW8OL3xKbKwabPAv2GE4bLd+OHQbQJ1i1jvzQYkG2FdLe
	Pd+h1NSJb+rOjX6jXFBYFIfo/CW6C8M5VpiAA038524dNw3vd1ChNhJc1LAIndmxmWwcJhGI6E8
	z0LIS8GXgzfshHqcJd+Y41P7rA1h9bj54w5hY+D8slerElVpXY75DxhcUrX+dsqqSdDWQZCSdhW
	LhuI82VOAAMcZ8I=
X-Received: by 2002:a17:90b:1845:b0:3a0:42a9:9c7c with SMTP id 98e67ed59e1d1-3a042a9a00fmr2802948a91.39.1789957477758;
        Sun, 20 Sep 2026 19:24:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5ccf8634sm6588087a91.2.2026.09.20.19.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:24:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] driver core: Use pm_runtime_resume_and_get() instead of open-coding it
Date: Mon, 21 Sep 2026 09:24:25 +0700
Message-ID: <20260921022425.10134-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
error handling pattern with pm_runtime_resume_and_get(), which already
does this internally.

No functional change.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/base/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4c0c373998a1..a54cfe48ec80 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -817,10 +817,8 @@ struct device_link *device_link_add(struct device *consumer,
 		return NULL;
 
 	if (flags & DL_FLAG_PM_RUNTIME && flags & DL_FLAG_RPM_ACTIVE) {
-		if (pm_runtime_get_sync(supplier) < 0) {
-			pm_runtime_put_noidle(supplier);
+		if (pm_runtime_resume_and_get(supplier) < 0)
 			return NULL;
-		}
 	}
 
 	if (!(flags & DL_FLAG_STATELESS))
-- 
2.43.0

