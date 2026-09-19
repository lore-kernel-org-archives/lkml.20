Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E627A328B56
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789815653; cv=none; b=IAMu+eiCVbn1ZNcl2g5NfaP0Yp+LpNoserR2TSVzW/q4mUxAhzm+QwpN2Pc6KwKrqDprJmCwJ39Du9pGbhfr8nsIdrJt/tJEZV5E0KR1l52ZbGOQc9kNXNOb1SOxuIDeZwZX9nCvEIYoqQ6GHNeu5cJh12kPaq7VihVTEkS024o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789815653; c=relaxed/simple;
	bh=GaNsUI6mLKnZnKPZDTu4pKadGE4T2gyK26dsZnV3ZqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hx7x1aAH1N2EylCsOWNcerS9BTS17BKtCOHNCSJhcVzFHKgU/q/SY0zerLFaE1uXVJokv4LsAUU11a1bkhkN9nUS0VyfvOYMQ7YB+OqYqlDKmMvZ+KyV6hPFaiaioOQ6mWf725l9aa6ozvKRp/erOx6kot56li92v8kmTcbxJcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oar8Zv3n; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oar8Zv3n"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso1301257a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789815651; x=1790420451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mksE0wAvqIYvQmkvPZ3MVjaliUGSBIc9rXg00mvzn3o=;
        b=Oar8Zv3nf79P6rmHbd/Ge6B21eyTeEy1EYUlLAfVDdzlrX4PWVU8wzj10Rf0oVGN2m
         MHKest1NloP9zsU1g1UpN4atfC+SjlUh5qQsmuktckYCtguyMogHBEGCFLQyPFQ5p/3H
         Il8hWjKz0uRUjmUabcN6XzubTCJhDGJRPjapwD1EZ3+QMN+kkWP6ikljKs5ouWEIZEd5
         qOxY0jOWkp0luRNnPWRe70SFTL5RlJGZD2UhlYC8I3k2RpMOomPqRTdZv29w5AJHppjY
         JRPA+XjTwk1zO5uobHpqvSQk2aVxoP692hAtqSdauNS1KmLbEsVChfqrMalkh/uqV6MP
         FZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789815651; x=1790420451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mksE0wAvqIYvQmkvPZ3MVjaliUGSBIc9rXg00mvzn3o=;
        b=vYWCP8ySMFCYXLioLMWflz7ikcyENB7OYJNQsjtA5EvtkRZrokzc73abOhsGQuDMXW
         Nrxnz/twbsp3qegShbpcxblKQoT5tpv0qPAvqXVBdyGIpiXNeyo+8G5Spz/+AqwHyaGW
         jeXKNvTuwkPgUoRVKscHzgYoHl/WyzrOzS0vstqSlAQ7uWflN3CEQ4gz6RXhAo+jSVvT
         04279F3Snzr7dQbKjDamSbcAJ93ArHTuW+v5fKYN/jsSIUMBA702ioaHJrG7UNzNLKG2
         TYzM4xtEjgraIw3GlKhCCi6VHxJhS9y1tP9X58WMVYJiK+YMhmZWyT13U0f8lFMw8RUX
         VPsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDKKOGIjFRWFbS+c/jvjSgQGygbkYnJ1ajUOWrgDrzJNGDfBF+pnblqhhfqVfq+U4EvpLw1LuA/Bz4GB4=@vger.kernel.org
X-Gm-Message-State: AFuF++nLoeSUzZwSRq15+YmNHynLyXJdX4TPsaOmNx3YznG6QpSHYHcY
	dtEeI87PNr2sAY0R8XF4pLcWL9VKGdPEmWM7JPbFEoLxEUtgYVoq+0Tj
X-Gm-Gg: AYBFou0659SchSMh5ZVcLXvQXGjiouERx3xPJt087h/8Ok4czInnT3+JxkVK1c6fMAW
	0iy/7KzSim0Pboi0ZCEVo5OxYi/L5G1U5H3KYFKEHhNs0tnWcw7xxXC0CD3FdJvJLAcSkORVyra
	9ZVyw8IfV1J7uShvmTEY9KKUwFu+YUxfbJMT/87fRzQJnuaZ9ZW4/NA58SpcenxnCTND3upVYYm
	EpN5tx6zPgimEx3wDvdguDsKY6mrq8y38fuc+/GVygf5zczlgOSwgxvwopiSOWGMpE9qqk4oc45
	knbUggLCWyq+Ze+A5pgfSSzLNOkR9WPgbD3b7ClvK8iisYOGtnDjoyUe2Zl6wVhSjgVbsgHzmXs
	XW/VkEwxg+5kA871VTmH5V1CaKBrusj7B37A/YGttWITKSDqIHtcPtjEXpmWQye3h+b0ekN5Uou
	zh23EwMrTc5s0FAXugjgQETLz5iTqfsFfPzJIM0RBecU2tR3GlfPc17UELWg1AzG304kxpxQpww
	PeLBL8F43sm6GEoW7QXMiqNoBwAzStGv8cBcEq6ERUEfB/P2bVqU+dj0gTY4ovQ4yXns6RdHt7Q
	6y7OBkSlkQ==
X-Received: by 2002:a17:90b:4a03:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39e54d38c48mr14713773a91.8.1789815650997;
        Sat, 19 Sep 2026 04:00:50 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb427casm4105972a91.17.2026.09.19.04.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:00:50 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	Chris.Wulff@biamp.com,
	david.sands@biamp.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] usb: gadget: f_hid: don't call copy_from_user() under get_report_spinlock
Date: Sat, 19 Sep 2026 11:00:49 +0000
Message-ID: <20260919110050.3764064-1-benquike@gmail.com>
In-Reply-To: <2026091905-humbling-swooned-c371@gregkh>
References: <2026091905-humbling-swooned-c371@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f_hidg_get_report() already copies the incoming struct usb_hidg_report
from userspace into the freshly allocated 'entry' before acquiring
hidg->get_report_spinlock.

When a report with the same report_id is already present in
hidg->report_list, the update path copies from userspace a second time,
this time directly into ptr->report_data while the spinlock is held with
interrupts disabled:

	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
	ptr = f_hidg_search_for_report(hidg, report_id);
	if (ptr) {
		if (copy_from_user(&ptr->report_data, buffer,
				sizeof(struct usb_hidg_report))) {

copy_from_user() may fault and sleep, so this is a sleeping function
called from atomic context, reported by CONFIG_DEBUG_ATOMIC_SLEEP as
"BUG: sleeping function called from invalid context". Userspace can
reach it at will by issuing GADGET_HID_WRITE_GET_REPORT twice with the
same report_id on /dev/hidgN.

The second copy is also redundant: the same user buffer has already been
copied into entry->report_data a few lines above, and report_id was
derived from that copy. Assign from the already copied data instead,
which removes the fault from the critical section and makes the update
atomic with respect to the list lookup.

Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
v2: Add the Fixes: tag Greg asked for.

    f_hidg_get_report(), the spinlock and the copy_from_user() call under
    it were all added together by a139c98f760e ("USB: gadget: f_hid: Add
    GET_REPORT via userspace IOCTL"), first released in v6.12, so that is
    where this starts. git blame on the removed lines agrees.

Found by inspection while investigating the use-after-free fixed in
patch 2/2, and build tested only; I do not have HID gadget hardware,
but the path is reachable from /dev/hidgN with dummy_hcd.

 drivers/usb/gadget/function/f_hid.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -668,13 +668,7 @@ static int f_hidg_get_report(struct file
 
 	if (ptr) {
 		/* Report already exists in list - update it */
-		if (copy_from_user(&ptr->report_data, buffer,
-				sizeof(struct usb_hidg_report))) {
-			spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
-			ERROR(cdev, "copy_from_user error\n");
-			kfree(entry);
-			return -EINVAL;
-		}
+		ptr->report_data = entry->report_data;
 		kfree(entry);
 	} else {
 		/* Report does not exist in list - add it */
-- 
2.43.0
