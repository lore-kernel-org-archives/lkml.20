Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C62351C0B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049862; cv=none; b=Z4oM4HSeY0C1bFGg7UVMBXInkm2IoTJlxqwsZ1yOeoY/nGMHuQ+1eCnBT9a79KpeKNaS62ogwHnQGtLb2muOzJyi7zy+E2dxcrLG9wx0Ixsg1e6zxVIQBzV6LhJkBSI6As39FrsQv5xj3SSLqaRrpw6ERVLZsjWRYUCmvHBj4eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049862; c=relaxed/simple;
	bh=0lwap9DKEBiENCxqK7nP6ClnmKUmkNATd2fjK2J/Ass=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iMezjlSR5adPS03QadtSZLArlG7/EAQRP9UooRpbUxWdWpu3HFjPf5Bci4F46ajZmXvmQ1DIrmSzhaFguOdjn7X/Mogdjy5zxRt0vvqxT2X5jhIAyCvCsSGdA2cBUqmOOm47PSl+SuiHoDZ4NXMFBjeZU7mf6qa0JUi9iRjwfIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jq/jkgjG; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jq/jkgjG"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a3156692c6so6991921fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049859; x=1791654659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YA6hiYoF92Tn1xdU1KASH845xIvpyOszlv16DcmfFrc=;
        b=jq/jkgjGIWxZxSGRg+m6JDBjzcwkz6MQSu439zIHA3Yauv0fwdcgDHXuv1hEc7c3RX
         ewVU29KAAkNgkj7p9KQBqabpx3K+1j6vHfU8GsrC8zup7VleXzWLMUhwjhV5KClSdXw9
         2PAIsYc3NxuRthYU1CC6RetPYGNjAEKyIOFpbWI0Lj/uIX18duTZbUQkMv4wh70M54eK
         spWkFyJGsXTV7QxWza2+XgjouUNpau20D11qsNLoHR3wHBn7dDXZuP/sHXma/ZIHTta2
         FEBsOhPRwdpMBP3YybHy7htWj79iWDDzm0vrBDPDlCQWJQK4wqNlG9DNVscrki7muaeG
         ZKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049859; x=1791654659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YA6hiYoF92Tn1xdU1KASH845xIvpyOszlv16DcmfFrc=;
        b=jBR+OeR6rImWgYHjoMyYlPow/yNAkA7ii4aKT57XAVAHylzBgfysQ9Ys73Ai4JSMKD
         cwMFqOr2hhOX2A/brjxJKHiwvYCyYju9/5JaTt2/EfUuv8T0Ji3gGx7MpCBwPYCZ6MzJ
         SSaVnvcamJiNmZAEMIRn4ZshIm2XkxcMadeNHVlViVjap128US2LwTj45p4QN1Bhkm4+
         /Gzrahkm+WgvSQm5Rj1mCII/IBXXBBbkGnj23+XWxat1yqu9gOzKnfACVHL8VA/uHJ9Y
         n/jxs/b1qrYFDIQRTV9rUIJh75E3HnPv/6813wqF3UwbXGwaGAjoIMbxuMtP+Qz8pC6C
         9Wuw==
X-Forwarded-Encrypted: i=1; AKwUvBwDcW/l4FIiyRCmI8I9eX1tmI7jCvJblshC0ICjtCvgsUfoCpO6Cn8YbrgCdjMgakekcj+apnnNykW1usE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDNIpROkxCtksh1InSisaWQtE0qddEHg1bOawgqqra8La8gWhH
	fHt4r+W1S511XaKKuglvjKan/TpO89bFBco2PyuaRWEvzZG8WJOX8lk3bAFyVanlQ9c=
X-Gm-Gg: AYBFou0Qi6SK61eESjTiH4BQIbERh/XtIAbVuZrpyquxqffL48NFuo4V1sfr+zW6vdR
	shsCeGSOh+z75px7OYV6svAfQgNffnnWTdhjXUbss9HH8NtGOObrU4p7mIWnFbIQE0lW8wQaiEj
	NpbHF4pu/1N/Y8JtkYq+sNkq+iOTARv9vpYddG33N9WB54vk8oTCy3zDTBD/L/7v7ri9n9spIyn
	9WKu0D0zs8DDZFB01oIQY9wF0rRnXlatatk0W7J9+2pu0DvBKfF5tosZxm5rcBywMq68qnErd7v
	kkTMv7alzUM5IKhTu9FZMwU9d6c7yWU7L+h1RHh3UE+1GTjfghfqJshlULBOTGr0V/wix+LHXDJ
	PyS4lfCv321rvzFn02em//O3yHUEO5WAO1FtZLKQyv096Pig8HPg8mtaIJz5woMwGuHComTQSnn
	meWyq+RtZlHS0BUssIh0JcXEzTIvkNSO9+sCOeAbETj/r4lNh9YmTbDKoAlYLi3cu82cFSIYB61
	Uukcy1P0/HaUk4adK/QZddXJC5GrJKRwKH0
X-Received: by 2002:a05:651c:2123:b0:3a7:81c4:1906 with SMTP id 38308e7fff4ca-3a88767cfb2mr15478751fa.8.1791049858771;
        Sat, 03 Oct 2026 10:50:58 -0700 (PDT)
Received: from TimPc ([31.40.208.35])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e32c6ccsm21993201fa.38.2026.10.03.10.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:50:58 -0700 (PDT)
From: Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>,
	Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.com>
Subject: [PATCH v2] staging: sm750fb: fix resource leaks on probe error
Date: Sat,  3 Oct 2026 20:50:55 +0300
Message-ID: <20261003175055.1511-1-timofey.zakharchuk.research@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If sm750fb_framebuffer_alloc() fails during lynxfb_pci_probe(), only
the framebuffer structures are released. The write-combining MTRR,
the MMIO and VRAM mappings, and PCI region 1 remain allocated.

Call arch_phys_wc_del(), iounmap(), and pci_release_region() on the
release_fb error exit path to prevent leaking resources.

Signed-off-by: Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.com>
---
v2:
 - Fix From and Signed-off-by email mismatch.

 drivers/staging/sm750fb/sm750.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb2..456b3da86 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -1023,6 +1023,10 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 
 release_fb:
 	sm750fb_framebuffer_release(sm750_dev);
+	arch_phys_wc_del(sm750_dev->mtrr.vram);
+	iounmap(sm750_dev->vmem);
+	iounmap(sm750_dev->mmio);
+	pci_release_region(pdev, 1);
 	return err;
 }
 
-- 
2.53.0.windows.1

