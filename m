Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BE32EEE8A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789840846; cv=none; b=QJVEwRYynEmpiB9skTPXMYgdcl3oRmbbqK+VIZ/EzT3hCpsRWzc8Fbwnydzh8fzgDmr8j2dJ/fYtpYAfIveErqvk2XyX9gT1Bvgd8b5m7EXJiCOv3yduxGOhbk9Lh2g4GoVxL75Px+xIgVa2H4su3SMPNM0Zq+4mxkSvyKZPqjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789840846; c=relaxed/simple;
	bh=7ETlv9nXNwoOvbtzjNafBK4cLqGS/nbn+0/DV8rHnSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tv/OjxcyvbNZQxNwJGbqjWFCDzJhOv9XxtYInGFyWzuj0942TstnAksDMSpwM0kdTgyog/4c+MOBMMUVE5zmgAciT075Fs7/UZm+mdrAjbB9ib9wjD29ppvzL396sLwKoOdB/MXY2Ugj/fPmiQDGoJpHOLttDHwNDpn4YlwEX6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjAmNPHx; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjAmNPHx"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398beb616f5so736684a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789840844; x=1790445644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EN9dPGZ08VWGRJ+d5ue8KldWWOVO1gk1WNNgQHngEUE=;
        b=BjAmNPHxsSPpScTqJRlzw2QmL3aeD5TJxouG8FC6dJ0ULjWWwXFjHJ02CzkE5BooFK
         ihtgzlcRcrqap6n6noIJTgDFHIUX52+S1DZDqZ5M+u5fINmeec/zGNjYXJ+Sw+YaH5bF
         1ezPiZL1tdX4ZPnCnYPNzWd5wflCWcXVs1zb4fXaI4k2duxUyO+o6+O+C6VZzRv0VNnH
         gdwSP1xaa2jMiH3UiYqlWmYA3LCvmSLcbBdgy4YHqN7BCy5ccocABzaCKmbydz3HhFFU
         lKtMP4LkO0DIbcIZOhjMiDhi4huMzeIEohOU0VfIKri7PCdLFWs75OCShXOCI0UCOXwR
         GOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789840844; x=1790445644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EN9dPGZ08VWGRJ+d5ue8KldWWOVO1gk1WNNgQHngEUE=;
        b=xGSlbE3V1grwS6PJ03itOnFmG4MZSMprcaTEA4GnLCAAfS3qI8h9WVB89xZUe+cQAX
         e7gdq7zcoJNE5xDZ+E7Cw5WQbOploSo6VdrQsSAwOQm8ket2hIaXNedaP7R/h0+XGSQ6
         t6DveC6o26TJ6yrJtLVYLmvAcblhmT4fBTEEHmLwkjpzRZ7VV1PkMvwsvOLciM8Yt1g1
         EVgy1M0/WpDxqZd5pLLHe9xayogoKAK5cd9B9dWC8ugbIilJ76fUZcqPwuLtDmRwMz3L
         gIuPVqY81izH51g+3OkH5s0AtS9ofBHivBgTbysZaL6szBIOSD5Jm5oFi2Zv1ZxSNr2t
         pZGA==
X-Forwarded-Encrypted: i=1; AKwUvBy/O1yG6XDv2J/WlL91snF4McPtL70TiyQTi1DRt9OyQIuGTr5NW5iyKypXvLhvEH4+m1MresiPw/6cCxU=@vger.kernel.org
X-Gm-Message-State: AFuF++mo09rYQrjGzdKZDguSygRIwfzAUa/mjx2IRErqGlPu+apa2hFd
	8jClz3bEb2gm/ZeCtxQr2XmWlRua8+op4FnMXIH3/sSeBbc1dOXYMxVg
X-Gm-Gg: AYBFou1QyHCv6uFAOXvzvvbuVT3YfJbAAiM4KSATRu0Nc88W9S7GcMZYRLiCnQOMcmU
	9Zeh3gxoiJr8i17AZ805zuouVuCttRHqpQFqSKuJrOCvEurswYut7p5UGpHeG3IXraK3Zg2zpXl
	VEF6EvfHw1OXJeyezoKXJ2satHcGxLB4uayGr8RfMk9+7GKxJcH+Ek2eB8F0RVF5oFaWgebj5CW
	orxmtpC8D/V9M+K/2RhfSV9q2AUSNthhRcvSTIT12dtAePwbNdDPmVZD0hIpIq8Ea3DOupPMHFl
	9KxBeQKw5vSgivT2BkUQ7tUFd49FAtoCQ8mQor+rSPnKaLqwC8jHq8izw5Le0usxYC/atzkyeWv
	JbY0qKekTQ/nl6FnqF0BAICVftIPH14w/mDd//DE7U3kJQqn4q7uhmusUahmY3ac0x6ddIw7N78
	GSvZFUSopNo4vZnhp7/zXjUqtWZT+IW9bxr0NLUXqlqjBR+ugEgAUekA==
X-Received: by 2002:a17:90b:4f4c:b0:39e:6a7f:6189 with SMTP id 98e67ed59e1d1-39e6a7f6410mr3449281a91.26.1789840844085;
        Sat, 19 Sep 2026 11:00:44 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm5453190a91.13.2026.09.19.11.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 11:00:39 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Dan Williams <djbw@kernel.org>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] dca: fix provider device memory leak on domain allocation failure
Date: Sun, 20 Sep 2026 01:59:24 +0800
Message-ID: <20260919175925.3739806-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

register_dca_provider() calls dca_sysfs_add_provider() before looking up
or allocating the DCA domain. A successful dca_sysfs_add_provider()
allocates an IDR entry and creates the dca%d class device.

If no domain exists and dca_allocate_domain() fails, the function
returns -ENODEV without calling dca_sysfs_remove_provider(). The class
device therefore remains registered and the IDR entry remains
allocated. The caller may subsequently free the dca_provider, leaving
the IDR entry pointing to freed memory.

Since the class device is never unregistered, its device reference is
not dropped and device_create_release() is never reached, leaking the
struct device allocation.

Call dca_sysfs_remove_provider() before returning when domain allocation
fails. This unregisters the class device and removes the corresponding
IDR entry.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 1a5aeeecd550 ("dca: registering requesters in multiple dca domains")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dca/dca-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dca/dca-core.c b/drivers/dca/dca-core.c
index 583510850fad..57e41fa87cca 100644
--- a/drivers/dca/dca-core.c
+++ b/drivers/dca/dca-core.c
@@ -368,8 +368,11 @@ int register_dca_provider(struct dca_provider *dca, struct device *dev)
 		raw_spin_unlock_irqrestore(&dca_lock, flags);
 		rc = dca_pci_rc_from_dev(dev);
 		newdomain = dca_allocate_domain(rc);
-		if (!newdomain)
+		if (!newdomain) {
+			dca_sysfs_remove_provider(dca);
 			return -ENODEV;
+		}
+
 		raw_spin_lock_irqsave(&dca_lock, flags);
 		/* Recheck, we might have raced after dropping the lock */
 		domain = dca_get_domain(dev);
-- 
2.43.0

