Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC13393DF9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083372; cv=none; b=jVjzXfBiYSm7isrIL01p3UzBogdMaoEdvcVEELl+HeT69E+5zARoMBtHtwjw9H2Y9yY8vtwF7hROKMmTiZPCFf5m04XaLNQlpypX4erIC38AY7q/LJpLDShPZtMOfOHnrDxiBbK5+S79fJqFoEeeBbb/XkQymRzAKbKv/hLkl1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083372; c=relaxed/simple;
	bh=JJzwW/RBzy0my3indWcgFQ7zUPKPqzg47+erEtgY5gc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s1QfUYbl4xzXthRxnoAH16m8s2uBpqxYkWS0EFhu5yFHTPhOHHiCsgYdmW9HwVLmJb9IYqHDLNRbVCLl4A/tV51N+XLIv34z3Tga300PusO6S/vAWq5QTTHWEo+xxn5iL5Ye9eeYvoDb7t/HXcGIldEd7IfRV31YN6sjFeXOdoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NsbqqiDA; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NsbqqiDA"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so363038a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789083362; x=1789688162; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zz5k/vH8alNEWC+Sg5nx473Mm7iwMDhzEALYTSQS358=;
        b=NsbqqiDAsRXcjshBza/wJH3KzYhAO84IOU5oFThdGpHRW7cRyl8dZIZmFajZqw29/b
         uX5T4QlL6/vYQMRmjNtdiXOKnQvRzXRohpD1IDl1HUs+nHVLRfZ47b/urNqGQPXfuPOB
         Cw0jeJZBuU3qS2IAAiJt1YYB9MikNIlFKA1nvQLJV/xJCg4ADJUxXKwwq/0yUJ7eVrGC
         x2mLWbRQp20Yi2RXi4WQ4lThkHZ8gi6KEHymGjFNAKpMchVHDBkak//vsIZASENfjITb
         WlaIeIyHth0qVkR4sarfQFB1WJ+pzs9156nZFtwc95WzIIZjzPSQUJmfZxs/7EKk5u9T
         VUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789083362; x=1789688162;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zz5k/vH8alNEWC+Sg5nx473Mm7iwMDhzEALYTSQS358=;
        b=X2j/0Gkn7uh7oKw2HLpExGOjVzIcFqKOmMWqloYWUAQjkpwGtHXwR4BjclbKz72WGk
         LQ7w8N6KqP2nOW9SyfZS1TvL/AaQBXtbmjUv7uSvWht+uJ/kkDqMqygygKq7EUsHWwfF
         hsJpV69zmRuTwnWKfFwdV0nThnOxFOlCXF7KGIP4oXzfot2WY/5uqXvdNj+88UIZ8yZU
         S3T9zdMprTWr3bL94nAp73nJfV2EhJKnDNpq/9UJQ9sLrlkAtpi+rWT0vop9iUSQ+K4G
         9Xftn/V3eBd2Cpb0yCi3Oy6ZyDj5AZTBR7CQxR5PYJYwgPfuhNV/ueLEK7zkRew4fLX5
         JxQg==
X-Forwarded-Encrypted: i=1; AKwUvBxhomQOFjjCULJiOZ/X4f4xjBhRnKDr89VBLPSxiKF6y+DqU6aIHNcFrGZ5K+ghFflw9IFdPEbFlf5gCYE=@vger.kernel.org
X-Gm-Message-State: AFuF++mhbT+qGr9dO+FYaL+bLMp2VnpyhqfnuG0oNY7DSKvtChcX5Tv4
	KK9jXjMv11rPKLM4IuTdeh61K/i4xu4ocSP6wYkxBvgZs8tZIJOcznfq+2/y0g75b70KuWONkXS
	zsLhv/A==
X-Received: from dltt19.prod.google.com ([2002:a05:701a:c973:b0:143:1093:eb5a])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2ec4:b0:395:4de5:1054
 with SMTP id 98e67ed59e1d1-39d9c0b705fmr2010365a91.16.1789083362130; Thu, 10
 Sep 2026 16:36:02 -0700 (PDT)
Date: Thu, 10 Sep 2026 23:35:53 +0000
In-Reply-To: <20260910233553.3477055-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910233553.3477055-1-jthies@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910233553.3477055-3-jthies@google.com>
Subject: [PATCH v1 2/2] usb: typec: ucsi: displayport: Check CAM to fix OOB
 altmode array index
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: bleung@chromium.org, gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

The UCSI displayport driver indexes the connector's port altmode array
with the GET_CURRENT_CAM response after checking it is not 0xff. The
port altmode array is UCSI_MAX_ALTMODES elements long. If the PPM
returns an invalid GET_CURRENT_CAM response above UCSI_MAX_ALTMODES and
not equal to 0xff, the kernel may crash with an array index OOB error.

Update the UCSI displayport driver to verify the current cam is less
than UCSI_MAX_ALTMODES before accessing the port altmode array. If the
current CAM is greater than UCSI_MAX_ALTMODES and not 0xff, return an
invalid error from ucsi_displayport_enter().

Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/displayport.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 7067f2561b84..572da7bbd29c 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -71,11 +71,14 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 	if (ret < 0) {
 		if (ucsi->version > 0x0100)
 			goto err_unlock;
-		cur = 0xff;
 	}
 
 	if (cur != 0xff) {
-		ret = dp->con->port_altmode[cur] == alt ? 0 : -EBUSY;
+		if (cur < UCSI_MAX_ALTMODES)
+			ret = dp->con->port_altmode[cur] == alt ? 0 : -EBUSY;
+		else
+			ret = -EINVAL;
+
 		goto err_unlock;
 	}
 
-- 
2.55.0.1007.g17ff1f9808-goog

