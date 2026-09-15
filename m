Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ED33C6A38
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477034; cv=none; b=jtAgSPdMtKpnkz3JnOou79pChqCSv3uA4rChABWOvdQoZkBxT5cqJhigFB2fVQaMgNTJO2hnksqZUqquDRfLsW/MnhQa6rDUQEf6a/FG83rOU5I1x0ForaCmKXIMaTTZpkLd9cWDfNkYEZlveo/0p8W00gX6l7e7lH4SQ8z9CWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477034; c=relaxed/simple;
	bh=oqb8nvlmmS3V1q8DiP4hXJCF9W9ruyOD2JpBI6MRZaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=brZWhnw4Jaxb4h009gkx5Y/K8QhZ4TU0HVlUG27/7UBDEFp/IOGfq/OgbAwFAbKJ7Uzlj7uTIYC0RtgQwuFk1jyS/vjiuGZJezxFtVbzGVV9FbMRsnkEKfDElVbfYIjek5J+eeAvRfzypWuHWcFi3dPEQcFRl5q2UQWM2tYM9ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U18zBuLn; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U18zBuLn"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78a5e045187so1390421137.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789477032; x=1790081832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L1JcDlshcJnjTO9t6bNJvx2l7c6AJb/4TmbKI6h+KKo=;
        b=U18zBuLn5Rbn7oZ6ar0E/kAW8p9VpgPj7hxgxSxntVl8HqDoLbUDHYZDIvwxUyW6z6
         1M6WQQsYViajEf/NayrzSSACOEMWDqSoDx5UuYVm5JEwQrc5xHIBNdHwlA9ceIoDieLa
         fbcV6QN3VL2jA/8bYp+FGrAeNtz7ujjTO/wvbQ1Kn5t7ROCEbSAbvp/MgnaSy81wmRh4
         jotEnw1UOJaMmketpKW4uM4nBbpD6QIeWErZ47YC3+msAgW3lp1CgmK1huM+dkDDfLAj
         Ufvn7GiSxw++BKBKtmcfYqwJtLfrNmbf2EZcOafLBNxi5vfgul0kHrxt+L7wxyWqNx3U
         CikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477032; x=1790081832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L1JcDlshcJnjTO9t6bNJvx2l7c6AJb/4TmbKI6h+KKo=;
        b=AIwKep5F3AY4VCa6LFaz1CtPUJGP6B9lO91Fp8v/gCM/25X0VKxdRuxy6Zg5LJF2GW
         a+tvbCbCRLvA7Ki283ryPweKcGq31Z/fm5C3ajnj1oQPbO4akQUUsTM0Mi+LVp9Xd6qu
         INeiN969tTJiN2Odokk93mCTqjBqC84ZfWOwBYorqdQ3i0evXMMFA5GahbU/QoY5tPWK
         nD+lpPOjx7Tmgwz96Pc7gnWaZ96vT7pMvO0o7rfvZw8zcdZrW6PmazOcDm0BzlAUveOk
         GmXPzBB4CzXznQKxv+PCgFm7WCIzoXq+A/kYZffpb9QFNOuI16T2dT5aGcl0pld4xNFw
         G/kw==
X-Forwarded-Encrypted: i=1; AKwUvBwBJKg6BHYt5j1GztiAeWV1ZiunesixgWL3ChJMe0mkoIaPWftBNtJFHVx+1zGtfOuPRYzCbDuPeCa0138=@vger.kernel.org
X-Gm-Message-State: AFuF++lXkL+WEBs83iomXhYSf/Xmm7DzmQj7P2PdjW+vKpkcFcluJ+Ii
	v95yqhrZtI6pqBYMiXRolb+uBFtjC9RSpuE+gaZG+AaTNrOoThgyLSj79hH+jkjYd0AS3Q==
X-Gm-Gg: AYBFou03MAGzOCYaQB8cs1wK+jlBPA1pe+Db/LdFiXDD8fzgWeu9x/e3nEmiTIleNE4
	Fsqh2un6ix+tcvRgCm99J8sib8N4+bClZvJufnLMVJc0t6AMrNt92tgF2zwL9wQPH9UbHSVh80t
	mIIiiIuvHeJ8q02oHOXyJGv0Ip14k/Tj8ZC9sGpPTWLfKrpizxE9fUiKJjWK63QlTJgXRTvm/cg
	dOk3YZOJZEhTEvnnWcIL1KwE0tMDGU8Xra0qWZRkgvjhtZrdxDJdPkxyfTEE6uufRwnxoZs8cEk
	5FYAlLb0SHbYL8QA7r+BYeJbAMO78+v4Rcb72AWoI6Mf5/jphQsAj1S131PyLbtZhLqK5RPsLvs
	sZXtKgKpbgNRut+rhc/f5SHPzo8PRMCoJvpipjeXGnVzylfWQZkiVFH20ow7lej7q6EJ5hpf75R
	jG9W8wa9vi0eY/GRe0pfOc0ZCudhF8jNAAfkF3uMIEfLO16GvRH2ZX5ttDaJw/ZqHD
X-Received: by 2002:a05:6102:d89:b0:79a:62cf:2a50 with SMTP id ada2fe7eead31-79b58495f25mr7239387137.7.1789477032124;
        Tue, 15 Sep 2026 05:57:12 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7927cbdf149sm13113951137.4.2026.09.15.05.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:57:11 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH] usb: gadget: f_printer: use the active RX list in soft reset
Date: Tue, 15 Sep 2026 09:56:57 -0300
Message-ID: <20260915125657.2849779-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

printer_soft_reset() tests rx_reqs_active in its second draining loop but
retrieves the next entry from rx_buffers. If rx_reqs_active is non-empty
after endpoint shutdown, this operates on the wrong list and never removes
the active entry, leading to list corruption and a non-terminating loop.

Retrieve the request from the list named by the loop condition.

Fixes: 25a010c8c1a5 ("USB: add Printer Gadget Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/usb/gadget/function/f_printer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 1857d78611..e3dc5d810a 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -940,8 +940,8 @@ static void printer_soft_reset(struct printer_dev *dev)
 	}
 
 	while (likely(!(list_empty(&dev->rx_reqs_active)))) {
-		req = container_of(dev->rx_buffers.next, struct usb_request,
-				list);
+		req = list_first_entry(&dev->rx_reqs_active,
+				       struct usb_request, list);
 		list_del_init(&req->list);
 		list_add(&req->list, &dev->rx_reqs);
 	}
-- 
2.43.0

