Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0D559481B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887471; cv=none; b=feYKEz++MgCxWInrJpET3wcY3BoheRzZCdzHDn4kHT0ePPcWASTfYFWoL2YN3vKz9FzpAfC7LnUFwQG4D6TXyXLfiRaZMuVXHs8ebfOnqP6gar3ig5otbqT8OYJzYqC+w8qr+lss5tJ/z4hmWoNimCqkBH7E45XEfvlX2iUgOu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887471; c=relaxed/simple;
	bh=b5T8w0cEMi5RkJ73x3+2rqv0o4VB9b249w35/48vZcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YbEfF7IBtqdj5srYb19iMHgcrHBNabrCvcEGq3x2X87QzgxgQP3gFsbi2IpQ3J5S9gQIOMGzs1+uKDQZLP25zy2DaoJ2V40m23PiTSnxBgDSNudfAXhpDlJdu+4KI75OUgRDCrhZjX+UQxsPO8yIgUKsO821aUkn58ENhEusqNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAC/l/Yo; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAC/l/Yo"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38759bcd877so5104379a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887469; x=1789492269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r0Q7JOapEKemMn1ZeidqeX9LteZhFdWNHcdSif7FK/c=;
        b=ZAC/l/Yo1Gy/9Dl/ztbirl79wYt0pUvTTYFb9Z2/oSbF6Dm1aKpbVlL1UHLYRfbit0
         Da/lGRoYap1TheXoLnPGz8f8q87tCRQ3CiFzZvOlVHHJlFTnsx+xr34CnS81FgSWZaY8
         7DH6/FxHnjpNVmm7vbQr/fIGiN0AFZSdErTQivLlczR3tphoJ85UmEWTqDKIfV50yBUd
         xgxY7N+XLCXXL2IsfjpKmIh7FgIQRs8fN0mDtt3/PC8CA+6/Q1MnmD4IeiLfQxA+zzAe
         /4FnnqSYBuQldWzdAEz9oqfcfFCyrc3heJXjw30/XHHAVcfYvZjxnrEJOh9QX39UP5eP
         nSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887469; x=1789492269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r0Q7JOapEKemMn1ZeidqeX9LteZhFdWNHcdSif7FK/c=;
        b=GfJOcfliYU2ySQEP8YTsUo4b7r/cpzTo2Tbqs1fQfNYz9zua6dt2Q5tfVOz1geisba
         K6Pw0UmDD8xnOz9DSyIA/wuqh0d7m+sW7LjaOP9I+RBJ3tdI54yQNl8ZxiYGfpmWcAN0
         41ZcC0S53KIiWhDRlH8cGVyN2fHqgdR6u8QEgn1mhiNw/BDX2eg0lmc2KeJCmoSNSoGT
         hsoLpyGpM4XgCDoCJrkamznOP4tz0pIxOH+KoT/wbscGXmpGdDUZ0ECwn/uvuCPDaG3N
         1vKefUUcvv4gbu6n+fPqfycflPhYg3UUVFE5ghJRVX45bhz+tTB7RS4/7HDUFyb36xWK
         vxwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzlmpjxmVLzd98f3FFVwK7vHp/zNgAarU0dP17j3jP3BiHHIwlmO7u58KSaooX0yNmJSzDyY4d26/q7+4=@vger.kernel.org
X-Gm-Message-State: AFuF++miLnUYJzJSyhtWEPuVLbf+t3Qav2/x6GSXcIzBrUJJ35AVv1b3
	S+V6b2fds7WOItTWfm0Y0uadkshHv0oYLgdCKnIUGgw93umw51dNLbgL
X-Gm-Gg: AYBFou2F/eIHUxJTiAnlypTE74b032HFipaWzgZZJQTWZCe+aNoLlOYYaJEJA7cnSrF
	XkOW+3fwF/iiV8nD4L2HzWv4tuajiLNLCdGZREQnK89+wnCVkMHrtLPQ27Lip0L5ggRXFxc7dHm
	Q3o8RfCH4oW8tOu/A9cfwmAP+SHe3z6yge3w+6NZbpjGci/bxxt+THHtwY9Z8IlO6XkkNWLNivU
	Ba5RlnOdb6HfkpxjJY5qnffKg0D1P56R8zAw8Lx9LATaDHfXZ8MRt9hUQdO4enzXub2/iN2J0mV
	tbw13yI3kEOGFnychDC0pVG+iFsjdKDg1P6my6Ek9188s0+ZGtRlOX9/vCVVH2IVB9oD0VFomhT
	QQWcyp00LADRVEbztVbyB1bbYB72GfH76TgpA64CL86SSPEWXqCmLBPYVEIJ8rJmATD0XLD0MV6
	NUoHlMF5Gd6KSCLpqJ9KpY4d+I+JBidj8qmXy0MTOQk+MwI5nFdhUDqzQO5bijmZ3Ah26Gdk6W1
	DtALSP9Jw==
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39b261323e0mr48752029a91.11.1788887468550;
        Tue, 08 Sep 2026 10:11:08 -0700 (PDT)
Received: from tarun-lywait.mydebianvm ([49.205.203.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm34852512c88.11.2026.09.08.10.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:11:07 -0700 (PDT)
From: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
Subject: [PATCH] staging: greybus: camera: Fix function declaration alignment
Date: Tue,  8 Sep 2026 22:40:11 +0530
Message-ID: <20260908171011.4122-1-tarun.k.lywait@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style. Reported by checkpatch:
CHECK: Alignment should match open parenthesis

Signed-off-by: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
---
 drivers/staging/greybus/camera.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index 62b55bb28408..9853bd60ff27 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -263,9 +263,10 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
  * Validate the stream configuration response verifying padding is correctly
  * set and the returned number of streams is supported
  */
-static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp,
-		unsigned int nstreams)
+static const int gb_camera_configure_streams_validate_response
+	(struct gb_camera *gcam,
+	 struct gb_camera_configure_streams_response *resp,
+	 unsigned int nstreams)
 {
 	unsigned int i;
 
-- 
2.47.3

