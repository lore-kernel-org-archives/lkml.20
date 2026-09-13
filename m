Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EF7F507
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789318863; cv=none; b=kRfdSO7EjT0295N1Gyj4FyP7kLRgMKBw2KKmhnZk+7ApFwl+KxYe3/6+M2K1inrSmhG4Tdhcs/gDx5fYLw6hwUe3bGPvFm65FsehrbG7KILha2Sexp0G6yagoenuZ9YLR8RMESLM/zyAeUMCyRBzzVQs3pzCc7AeJqViUR4Tlks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789318863; c=relaxed/simple;
	bh=7DgbvlbCd02qKU0KS1hLZb7EbbfxrDTS8po6opySNg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B7cCKn5HG4PPfltSE4DWOamelSn1KI4mLT9BjX24I5oiDMF1DObv8q7EoEGkmZJAxazM+ZThcJudAIz3ce1fZvvBew3OmTR4H4L4OLWXh1mjOTEGZMiuTPdlf2tSyvWSulDuovyzuFuq777YQ3kTo9NyIN2lTHtAP6BYWxhVQM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9U5ly1T; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9U5ly1T"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c664b8c3f3so2861161e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789318861; x=1789923661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9NtJYAzJYW3fn3NhvoYsgWPrvoKK0OhsussspvBBLKs=;
        b=N9U5ly1Th02kTSn39vJQHu1sK0aR6X6FaGnar72df1K+VUl3/PfEqPgE2shKPTANXT
         d8jaWlTlhwh5VAee+hCi0/j/MI9hacYLygDP/ARSTZrBo0jGz+4I68wE9Hu7QnoVR00l
         MFi4g4TTXdB97c2YjKcujT74I+uxtusG1ySuN3JByif8OWUfIL6zT7PuEVgYYPfZYq5s
         8WuaaXXXbMk+W3WFyVg2K6/5U8EhkCEdSIdSfavzy8S2H7KTOJl9dmSbdxj0L5lWL88I
         H3DjZBmer5pPeKKl4Hg6Z+bjFe9brb+fVfZnzKOyQkrvh2sQpOv1O0bI8pw2jy60GNqF
         cjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789318861; x=1789923661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9NtJYAzJYW3fn3NhvoYsgWPrvoKK0OhsussspvBBLKs=;
        b=rwZXmOiCQnPKEBYrL8RUg6oiBikmIjmfQWKh1nyc9zbOOfhJgiIT2RDR9348SC+3Y5
         t048L8KUfpYl7nnBdBWA2KTa9oIxYN2/RvXbzbs4DJ48Tg74X8xqX58AXjxC6+sQ4z0B
         MzrrgmXumVXt/kMCspU8U6Xqj3LKcjGqMbtvOZzULSOqTMR6OZSfKOw/lhpCvm2u2k+T
         e9CfIjvZsBEJPvIh/gnBgTMGu/7yYme02MvZNM+XS3dveat+zTgkn3uHfXBBoef7S2js
         MbMrBzCIxIT6ggref4eV+IlxvIiOhVl350bA2mvbeQ9FsLByquOYuTpd87ok7ypmqrgn
         APhg==
X-Forwarded-Encrypted: i=1; AKwUvBxVupKNkLvBJzSFYTLbqgz1gW/rmIkitzstr8kqhes6oUO4Z4gi6mrGsHKxf+CtkR4O5pYvA1Pr8Ap4uSA=@vger.kernel.org
X-Gm-Message-State: AFuF++nxdOZWOS+7c7uini5AjaEmGENG0EKtNAR9cHQVfeQuDc+hfmED
	UY7meMkfDxhMOhbSN0+WQop5bqF/Kuv9SfDHzNUaADgQcLEn0mMUyhAH
X-Gm-Gg: AYBFou3xsP58xRdPQCSoPx9s0/araHWb/QNhnKD1jS9hWQixzubkIHiXe+0XXPewo22
	PTTmG48fJt2wHGDuVRMkIG+uBqFuX8iNrvO1CYKbe5Cmd3cFazG7b4mNHpx5wUkhUKVOuHpC0Fd
	EeT2wqZWNTKO8cub/0r3WbYy3Y8tLE1WJL/Me7mxxo5putScbkACHF89MKPdWeJV46MHVmStlLc
	M1P7WaNrXNFKpCyrJR0Zu7iGCcZT0NHodX5T1GBr9ylzKV/Fgk0kIc1/i7zvZ8l4Cpfy4gR+HuP
	oTbbgUoN+gnUiEPT8Tgci2wFfKPO8aAzTd4pXD9cOhu1GsCZ+E6UJNwcTD0GtvidEnKFtnL2tOF
	NEEAZWwPE0zVZe9n+9pGwaJC4SDbO/SikHlMGWmE+mkr6gdAM0s4CzdnvrqYajf2CbOP+dnt6Bu
	bZbYjXxoJ09GVZyU6WwPiLhyoxiLSP+LRq9Co+m2M5kBkbFu0KEsUNn3q7ArDN4MhjAT8zf0YSM
	450h4+Hp6a/p5Nv4727OiEb+T7A+4tPfbR11NCnFHLDp8etgw==
X-Received: by 2002:a05:6122:1827:b0:5c8:228:5ea6 with SMTP id 71dfb90a1353d-5c8462b3116mr5987367e0c.5.1789318861094;
        Sun, 13 Sep 2026 10:01:01 -0700 (PDT)
Received: from kernel-dev.servicos.capsula.corp ([177.105.242.194])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c847153919sm9790592e0c.16.2026.09.13.10.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 10:00:59 -0700 (PDT)
From: Ricardo Barbosa Dias <ricardobarbosamscg@gmail.com>
To: shuah@kernel.org,
	valentina.manea.m@gmail.com,
	gregkh@linuxfoundation.org
Cc: i@zenithal.me,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ricardo Barbosa Dias <ricardobarbosamscg@gmail.com>
Subject: [PATCH] usbip: vhci: fix -Wformat-truncation warning in vhci_sysfs
Date: Sun, 13 Sep 2026 17:00:38 +0000
Message-ID: <20260913170038.119463-1-ricardobarbosamscg@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a compilation warning reported by GCC when building with W=1:

drivers/usb/usbip/vhci_sysfs.c:474:67: error: '%d' directive output may be
truncated writing between 1 and 11 bytes into a region of size 10
[-Werror=format-truncation=]

Although vhci_num_controllers is bounded between 1 and 32 in Kconfig,
the compiler performs static analysis considering the full range of a
signed integer.

Increase MAX_STATUS_NAME in vhci.h to 18 to ensure the buffer char array
can accommodate the theoretical maximum length of formatted status names,
silencing the format-truncation warning.

Signed-off-by: Ricardo Barbosa Dias <ricardobarbosamscg@gmail.com>
---
 drivers/usb/usbip/vhci.h       | 2 +-
 drivers/usb/usbip/vhci_sysfs.c | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
index 5659dce15..2c09fcb61 100644
--- a/drivers/usb/usbip/vhci.h
+++ b/drivers/usb/usbip/vhci.h
@@ -88,7 +88,7 @@ enum hub_speed {
 #define VHCI_NR_HCS 1
 #endif
 
-#define MAX_STATUS_NAME 16
+#define MAX_STATUS_NAME 18
 
 struct vhci {
 	spinlock_t lock;
diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index a7ede6fb3..d870e2c27 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -454,8 +454,6 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_WO(attach);
 
-#define MAX_STATUS_NAME 16
-
 struct status_attr {
 	struct device_attribute attr;
 	char name[MAX_STATUS_NAME+1];
-- 
2.43.0

