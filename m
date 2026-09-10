Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C6F376481
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083368; cv=none; b=QXkzR9o4bIFCcd0pkHGpfoTGLB5V28WSPHPWdbp/YdTsFVmCl3lxW43KGOrUUT3NXMeK4oEMkpuVZqA1P/qHUfF8LSzX87SRFJnJcpC6OE89cP4D0lIp+zj4VPq+9SM8/dHOckyhuzrQbpTRESEAjsHZVCqsfxMmO5bAGgQjuOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083368; c=relaxed/simple;
	bh=xbQoCyxq2vDtVAGPi/CiFV4EVdzFrtPv9kkX2JiQXrA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uh3W/qpy/TbFO9Hie+4bYvD5pFI438SdW7sVkCOrkqPgS4HycKYozdWWVnVUcW7EZRiA8a7OZUB4WxAQtOIGYfxP/ScF/xwV1h6d+tTXl9e73l+wSfsNrnZpSfeBt8ssuwOwsZZbUgUpP/g4AUW5KjKcLcSO2SvcUR/3bfwNDcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UtpJAfoE; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UtpJAfoE"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so257799a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789083361; x=1789688161; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJwMurigxPdsSokMQdzc3e8H0y48idqyHey4xFC9msk=;
        b=UtpJAfoEhXtnu0Sj1LEPnBoCuSeOeWMYcUewP+vFmN3uwBwOePR/rRqcn6rKRuD8B4
         zLLpmRueCUr2X33kuhlFuXZmrtXBXFabeTst4cidaa7cuLYrnE54+6PbCwZMR7QSOeg/
         4+Nuj9cG4Xi3BuVmHDgZvlFjKwXzfmt+Lb3MtxxorHzy+0E5zyryQG8MXIymuvr1VFvq
         FiEv5qs0iAL8pxzm0Xe6K5t33M1/mLz57YPDPakPRmAH2F3EyD90N5XouL6ShiRcKJVw
         mn4hlA3hXofAGAc4ZpwDgUKsuUw9JYkroBpbwgxuFcpn61YFRAyF7cHgcAXU2rM55ElI
         +pUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789083361; x=1789688161;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJwMurigxPdsSokMQdzc3e8H0y48idqyHey4xFC9msk=;
        b=qyK0Y/e1A5wOru0RkGo1dmaw3WUp1O4O+ugQhrzKpqhzfHYUN4uf/2GrkHGuous9qL
         FhhKqASbaE4uPG97q4qAbX/MFOaQMgrNEAxMHP7QON5Q/R40U/40ux4LjfQwxz7QsLg4
         Y8IVyvj+Tmz9swDVeA2/Ix4FFUP/zIDoCprbrl2zhG9bAVsqxb0HGugWefPrsGEwoJC5
         RE62nks6MYALcS9E4Dj2Ft+UlBKwGMdmYR4GyHHdSliXfYxIyMRZiuHvf4jtdga2xJZU
         J+iWhBLcd5vP0FOuNl5Sr+aaG1/7Sf/uCg/y1wHqQR5T+CpcfaKzm6qLyTwYan2ct3eI
         7SFw==
X-Forwarded-Encrypted: i=1; AKwUvBzn6WyEg0hJSj9S70po6853UTiKkyyYFJ27mCJtKf8B+EBAWzARDzKQQk5ocmd9SJGo+f7uMUFM5uWaxEc=@vger.kernel.org
X-Gm-Message-State: AFuF++mhsZ6OfRNq18RjSUst9do/U++6lzAKoUFCrq2b8h04fMQ5YFZI
	VlK1ihnzd3jzLEaIYeKqo/fyLUKMfmHo/J0upv7/PQxk1TVrW0oy5Dp2sY9+jG913rQXf3ecCE8
	BlC2L3Q==
X-Received: from dybim52.prod.google.com ([2002:a05:7301:2d34:b0:339:7c3c:1ab6])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6f8f:b0:3d3:aed2:6f22
 with SMTP id adf61e73a8af0-3dad28fb2b4mr9018979637.22.1789083360585; Thu, 10
 Sep 2026 16:36:00 -0700 (PDT)
Date: Thu, 10 Sep 2026 23:35:52 +0000
In-Reply-To: <20260910233553.3477055-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910233553.3477055-1-jthies@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910233553.3477055-2-jthies@google.com>
Subject: [PATCH v1 1/2] Revert "usb: typec: ucsi: displayport: Fix OOB altmode
 array index"
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: bleung@chromium.org, gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

This reverts commit 04cec690b1fd9d1c4c314b91a10d8c68a3acfe18.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/displayport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8d2032d0762c..7067f2561b84 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -74,7 +74,7 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 		cur = 0xff;
 	}
 
-	if (cur < UCSI_MAX_ALTMODES) {
+	if (cur != 0xff) {
 		ret = dp->con->port_altmode[cur] == alt ? 0 : -EBUSY;
 		goto err_unlock;
 	}
-- 
2.55.0.1007.g17ff1f9808-goog

