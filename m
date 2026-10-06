Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AF13BCD17
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304311; cv=none; b=h4baNgWGWicgg2L0x729BnOq3YvXYI0E5RbfYRifeZ+Wsxz6FAlleC6kFMr9/VyzzfpGdwYgbSuOtmI563mNf1ISZB3efOt9SxZ7vcrj3gkTVNjQeh/9yiOH7XMikFjEtq5JRkHeGkn5h1PxlNg/KQlCUWezIK1mrrrkkiRqwrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304311; c=relaxed/simple;
	bh=W7Rxhq+/Kyau/rHvDlBgPfh6oA9jJsVr+B/7Dat+95A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aLU3zpCUrl9bmcG3AQnS/gnwuCCB3ZhVNtXnj6PNWRpi4tdMJNQyUYtmZVe7rWBXjhVrrvg/sHmRghKREhI397a88W8o5CKB+F2ItuJYzIm7DnJR6mXKSZct424CP37XkEj/mXggXat8iXqHC48kl8CakpYAtkKcNInwJfLufFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzrH6XL5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzrH6XL5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so29405915e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304309; x=1791909109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eP166MuWD/CcjIGW1YMpwcO4qWyr24CPI+SXn98l56c=;
        b=WzrH6XL5URfEZoWjCf77L44kya84qfwI0E/OgyAnVmUMRgETSZ9OBoVoBs0kKGHDtE
         0ukeoihk284FHtV1hnv+Eqe6Zc6f0dE66CkAOWAXE5pAABH95SxxprW7lGd1RhvWevu6
         6RgheEqPk0wyBsBQ4RqLGvo3Gc3uIh0BdqWMpVdzpPSfB+PDHDRog++kS25Yb6hlSiu4
         6OgAbupgqbmr6mzfq9c7KDWc1OfrofXgW+sRZLP2vRJJUv6QrkqsR/AQa9iMLvixtL0I
         K2OmhyLL0xOWl32s5xa7THrZkpCJZZk0cdZsynmXsxSUUS2VFHie3qbNgSO5R0yqIreE
         +VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304309; x=1791909109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eP166MuWD/CcjIGW1YMpwcO4qWyr24CPI+SXn98l56c=;
        b=1cTVE8VdJ+SjPZHHL82x+pL69SE4qNkR7cRKJIwYho9tYZifVN7mDSlIfE5rOZPp3S
         Kz/DA1VeDORXbuskvp6kyePobCrF4OUEbQ+tslgK5vPS18gPcn+9HlKevvrGf8BC6DUz
         7tdvNI9dqZfxdTK8bphM99KWLdtEkYmaoxvSk/rsgS1YyK2veSZKHMZP93DF7+N9hLmd
         pxdowKi3fW71C+cXBUBO4a0wH6/DjAV38mZDNKKLprKDkb/GLX+q+xpY7+xqwcC/mZkS
         Pq+Mz0SXKjh9+X17XBTQBalTm0v7hyzcXj3auj5vdu0DroWYxmWCV5KA7HYRXNYRATiT
         DNzA==
X-Forwarded-Encrypted: i=1; AKwUvByPIW0M5z/zAtLEluZXDudHynOlSwpCTNyj+Kpyj+OwYr1lb0ICNIv+WfR30ofWUR2wIzqmHflSv7r+keg=@vger.kernel.org
X-Gm-Message-State: AFuF++mY1YtyfV/7NLkSj6W6jsASbGY1Mv+tDL6NVuxSikGs3pP5wcUa
	kwrErVgLrGp8zlRUMsgRHjNa+LpEW8ZV8ksYCw5+ARkEMJWJpyJ+x9OY
X-Gm-Gg: AYBFou1pUU9ePYeS3CY0DuKew8pCRaXUlfUtUWtkZAOwxsZZVOsk3dT0HjsA8wEYhvy
	EZOf0KALRbxSRIPUzTV9QKKE+SRPoVjymuDlg3SbA/FiX1VjXEFrHKkBww7C/+tXE4cMNJu0R3L
	WvuHv1DGwzuzdLSYD+oiPKtC40JK8zphOuMwhnOXu2vi74MjsgPUKFjXvUP1HgMDG4tPLQ4RzyR
	Q/4B2MU08Y5pc2G5agzgyeVGHjPWhhhKlAdYo3Pnd4/ytR+I1RluC/+TMDyDSqiJdM87EF35BOu
	QXBYGYmFIXLgwUR4MwqYCOpgMfTh85Q/jZlmy1NVAbF2+gSmgMFRYNeRWq/KLJe8z6sVW20AyIv
	+mYQwaRdqcliuPXTLdPhiVBHcu0zNOWUX+tgIq3DZeAJ8zoPfcyb1lAhoMsSoINUGeRqcCpAjXv
	MoQBZQ0f2P0xylwFen7oygHnll0aV+y9R8EKRq8laGA9Fs04cTBS8CjpqtUQZKwMZmysOpnAtw6
	ZU80h3l
X-Received: by 2002:a05:600c:1395:b0:4a0:a34:6e7d with SMTP id 5b1f17b1804b1-4a1680eb564mr183390005e9.18.1791304308583;
        Tue, 06 Oct 2026 09:31:48 -0700 (PDT)
Received: from fedora.domain.name ([217.218.153.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178caf832sm93839125e9.4.2026.10.06.09.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:31:48 -0700 (PDT)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: pmladek@suse.com
Cc: rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	linux-kernel@vger.kernel.org,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH] printk: fix kernel-doc name for nbcon_write_context_is_braille
Date: Tue,  6 Oct 2026 20:01:41 +0330
Message-ID: <20261006163141.304554-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 kernel/printk/nbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index fb1b37741..6f9735f4b 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -2005,7 +2005,7 @@ void nbcon_kdb_release(struct nbcon_write_context *wctxt)
 }
 
 /**
- * nbcon_is_braille - Checks whether the nbcon write context is using Braille console
+ * nbcon_write_context_is_braille - Checks whether the nbcon write context is using Braille console
  *
  * @wctxt:	checked nbcon write context
  *
-- 
2.55.0

