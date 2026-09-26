Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7045346E51
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419039; cv=none; b=gtlijktWyQqLk+ugGIE1ItX5pVAFXxHzhmfqMFM9P59mAo3CrZm4ZoFeHpxsu8AKPr/CmA+H03agTkwxGVwbjHzPXjLzK2zVPr73tn5kMUxp4kEKrZ6d9QewiMJBJRRH3LLVnpkZmF4js11Ho4GyclypjS9qrbQFYqLpNGe0R9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419039; c=relaxed/simple;
	bh=rkswUNiZSPjc4VbKZlUJ7+Y6XGSSNG9joDXoTxXxoPo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rslVh03PUQcnsM7RhwLFaY6xlAquG6TLOJZggIbFzfaTD+y+mtMnhO0/gPTCSzc9R8QzS5RVgmlsEo1FLNCifIUI21etTvowMaUoVGbca2+hexUQjvowxDH2F3ERlhYu2s3hbOQIK7pFyelQ9BA4Tb+424+DtGFbV8ifZk3C97g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4e778acdbc6so110265b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790419035; x=1791023835;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8mpQ3CPSq4oqRG6slsXq4GnA/FjdN3wCsQ3cD51WXco=;
        b=T3cTXUdUbLRx2t1vJLG4gTSaeGoPY/O5Pd54ySKr6TRG9LLgYNI8YWLzOjCefcZ37l
         AzXoMFsUo80EOVtQfkaCWd1aZN8w9RB5nV13USj6LUd8ty/Wzwix4bOz6e09Kl62X/sY
         kt8E6aa69/NCzQuNBE8SNN4teUxfxCCHBqdWNoM1sg1T2wLhs6G+TLOGLWF4i2PhTWuN
         27vUP5yzkXgZG/y7wnaThTyCPCSsFCMZbmYX8ESY50qfi5aLnDr3wT8KCzgOC9YnazDv
         gOKmePFojgRqn9gIUKrdWgqX8MYz/ZNBdhKcUDKisxcne4TQPAbh6hWsDk3r1nUtOhCR
         oK4g==
X-Gm-Message-State: AFuF++mjPKURO17emQ2L0mx2cmZkxtvLz+IVjUBS1FUp/Wm9zeXX1FmS
	YxwxsKgiAYwZDA6MlzftJxnjur8rWUDt+Cty7Qg/zRVHgl5DIM1al8RP1nOK4RlKGgM+58GyebE
	oo4SVmG/F/tUJTVbJwGXZiqNDM25oQkQOYHozrXrqpazya/FAI/MXhZ10UqI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fce:b0:4cb:f21c:a79c with SMTP id
 5614622812f47-4d72ac4ba52mr10888912b6e.36.1790419035120; Sat, 26 Sep 2026
 03:37:15 -0700 (PDT)
Date: Sat, 26 Sep 2026 03:37:15 -0700
In-Reply-To: <6a7a06b7.b50370da.49fe0.0057.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab7a05b.dc2998a4.2261f5.0054.GAE@google.com>
Subject: Forwarded: [PATCH] usb: fix memory leak in dev_set_name
From: syzbot <syzbot+87ce68d9f48eca96a84a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] usb: fix memory leak in dev_set_name
Author: drifabdelmalekmohamedsaid@gmail.com

#syz test

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c
b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac7ca..9c263950f609 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -327,9 +327,16 @@ static int gadget_bind(struct usb_gadget *gadget,

 static void gadget_unbind(struct usb_gadget *gadget)
 {
+       unsigned long flags;
        struct raw_dev *dev = get_gadget_data(gadget);

        set_gadget_data(gadget, NULL);
+
+       /*Avoid dangling pointer in case it remaining references*/
+       spin_lock_irqsave(&dev->lock, flags);
+       dev->gadget = NULL;
+       spin_unlock_irqrestore(&dev->lock, flags);
+
        /* Matches kref_get() in gadget_bind(). */
        kref_put(&dev->count, dev_free);
 }
