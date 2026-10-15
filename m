Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E50B524B14
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072312; cv=none; b=BH9gbmp6tUZnbzcE+MlVL2r6yyjv+uzTQa0CnAiit6sAnFdNj/k1fMFlUGhOZpjSCw+16OgUq1z6cAXHKevTSXyaZ9kWXXQkfAhfUh7o6QJydXtl+F5NAZytW+/IKZcUstDt4AwqGhkILZ6rQAnwjNkisgXJLV2vE60N/T5cnuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072312; c=relaxed/simple;
	bh=Z+OJuFFHDzvfnaKn9iMIyx6qF6UFBBKir1ZIYGD1ltA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j0Zaonx5lRWVp7qnpLQ5+lZiNOGvlC2bKUhzAFSV+6MqQ5CMTpLa/51NUJkEnA0T/lmYmCrzLzc69HZuF5ETvbKrU/z1WmTOXQgBTxc4sq7fQDg7Pvd1+1wy9BwITNWcfxOYkJ0dVDe1pB+ZhyP1W0dBgIB38R8jDhUwojp0TUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArgaeGGf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArgaeGGf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so48484695e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792072310; x=1792677110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pb2lT+n+6HQvd1ljvbTw9518TzY0iE2FdURBlgBDLT4=;
        b=ArgaeGGfGLqxMaL3QsugRHTgEdU/lTN/Y2N456hsVw/5INHg3AK6zzDDCWUVsCUN28
         XxtcBxGl+QRd48HxT728W0RzTeTceUyUKh+/W1bsEnzEvaVEtnIHjDcK3YHLY4+BtTS5
         7YJJZEXDl2JN6Ra5lLCVy1YlZqfrVaO9NKxayGjwy8DLQgh3g3b+ohES5C7c7ouCOcHa
         x2fP7zBfC1/Bb1zk7sdE25wlmai/ePpHEiWPEhQo8QCRmawy/7r8Vudx6+7jxGbLKKH9
         5EfeE64sIJR+BBkHN5WonWFC2WBApfMA0sYt+s6zj0iocQqdFVpGjqe+m/ZOZsvXDC7i
         QCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072310; x=1792677110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pb2lT+n+6HQvd1ljvbTw9518TzY0iE2FdURBlgBDLT4=;
        b=vJQ1qSKIkp+/Dzswz1Cj35ayrWjEEwStJ85w490AFWZmKtJlx4yRmF6dBFk6L+I9wd
         llGoRaOjBZU6EyFsDnmIcQ7hveXjv6GFbDB6cbmmQPfPubG0Bls7SKl/V/evqDFyokrj
         +ARvaxFLkY3rZG+7WQwxHE0m7iQ0sXKdi4mnwvSl86quaFWCM12Eosq26hawG+9a/QTU
         F7AB9PGqVyQpr7amo9HETocWq816EyF/8df/b3Xx+8d0Hun7Ewl5DWlAttA92Jf7W2Fv
         Fc9qd57oK4DmLrHOYvCGBnK2B3sUaq5e9jdAvyxhW4WFx7e6knomnjh8jjcMkTWe350p
         bmmg==
X-Forwarded-Encrypted: i=1; AKwUvBzA0Lbhuxc+B6J23k9pf50Cl85nDZE89k+53JKM1yuYj1Qtj6vKGgWshv9u8+e8DmIW4fegFyQi7eK4jNo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdcAXjlqdE/uk5SGmd6rTgPwVBZWJmIPcGGM2223ustSs0vavU
	yzW4TsxG9soMx9SGniTWJmwVt5pOhlE+g9xoPK/f5robF2HYrS4M3C0=
X-Gm-Gg: AYBFou3hx8WuZc2rLbSsaYtO4BCUL7TGwuH+8jaEjw0KPzySrx4e0NFhW3biLAzSc2o
	X5EA60e6CMbLWHEGUNpVO++pVrn9y6CLVx8j2agVgESEf4z4zccg1nzyEQE8uy2aT8HMUmo8Zfp
	hUMMZS2B4ffKsXdWPXW3E61DUjZDfhr1muoQXeNCgK21s3PHlP1bVWvnBQxh9O+7s/lhciiJmIU
	BSrtAXh32QIeBziibhEy4/l75BJw7vXCGRB45BGHZinT6J4l5iborcd6rKWHFMklKzo4wn9t3Oy
	PKLFZ4K2r3ooWGeFa8/NOEyqdXbWFFmHer4jxtOtY0hkiDaUDHz48RpbcbkCsyMmYL8EVi5vlLq
	SXivqLlr5dRNfqEw3mg77N6w7ynMsVublKqaQImI8K3+fG2ES8Es52slddY/BRZ3q4upu76zZTK
	6eHU5znAg6XQMr/1SbFQ67oge8x93rsILjBqsBzKLyuQ5tIyjTX+ExajWx86/tywW/aHVLbh/DL
	CIYfaBKBzmtisYUE8QzNvWBh0TFuzqrCv3RN2BpoHNPtFCkDxMWlJd81/RqCdx5g68M9JsvpuFd
	2HGP2cSnGb8EWFVq/B0tdMxT2AKZ0Ve2mNwfSzVLVfVXfooxJW6MC2WKHHy5U4XHVuMe0xbGlrN
	FIHM+WOAlDC3QR5p9mA==
X-Received: by 2002:a05:600d:644f:10b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a196611aa3mr240527545e9.29.1792072309564;
        Thu, 15 Oct 2026 06:51:49 -0700 (PDT)
Received: from archtop.localdomain (92-242-248-5.broadband.mtnet.hr. [92.242.248.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b303csm69642565e9.8.2026.10.15.06.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:51:49 -0700 (PDT)
From: Jakov Novak <jakovnovak30@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jakov Novak <jakovnovak30@gmail.com>
Subject: [PATCH] drm/drm_exec: fix kernel-doc string in drm_exec_retry
Date: Thu, 15 Oct 2026 15:50:29 +0200
Message-ID: <20261015135029.22698-1-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building the documentation currently with make htmldocs gives the
following errors:

  WARNING: ./include/drm/drm_exec.h:159 function parameter '_exec' not described in 'drm_exec_retry'
  WARNING: ./include/drm/drm_exec.h:159 Excess function parameter 'exec' description in 'drm_exec_retry' (did you mean one of: '_exec')
  WARNING: ./include/drm/drm_exec.h:159 function parameter '_exec' not described in 'drm_exec_retry'
  WARNING: ./include/drm/drm_exec.h:159 Excess function parameter 'exec' description in 'drm_exec_retry' (did you mean one of: '_exec')

This is because the parameter is defined without the underscore in the
kernel-doc string. Change the parameter name to add the missing
underscore.

Fixes: bba175a2d4be ("drm/exec, drm/xe: Avoid abusing the drm_exec retry pointer")
Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
 include/drm/drm_exec.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index cc2937185a9f..ae1d074ade5a 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -150,7 +150,7 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
 
 /**
  * drm_exec_retry() - Unconditionally restart the loop to grab all locks.
- * @exec: drm_exec object
+ * @_exec: drm_exec object
  *
  * Unconditionally retry the loop to lock all objects. For consistency,
  * the exec object needs to be newly initialized.
-- 
2.56.0

