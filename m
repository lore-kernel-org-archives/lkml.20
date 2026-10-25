Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792970595;
	b=0E7UCukDtFE7UUJBshashtB+Fo9NXEC/9PUhfgt4uE4AVlgF04GVMRr7TQ3uz/r88d1C
	 wf2OHgErqbWxRX1+3Xn7FQf8UNEcuQMUkV8sVc4iQ4+wy3A9yxPNtOivozi+DVqQTSNYf
	 789+RaQ6urHj4qKbAIAHYjTpD5MBrU/9bxcDpS7nmLA4umjaZTxAT3GXnky7lF7VK05mD
	 Y67sJa2sdS9A8CjACsUPOL4cPVY7YQ8pvxg9ekCFviaGwTErawdSH6yCtdJj79dTxRdRW
	 CvYiIXEQ4Pr+mT4fz70N9TR1DNhAyRspIZh8HjpK9+cY+n6HfjTHK7wzwjQKWhkUEJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792970595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rbxeXuBz0HfqP0KO9f4xM0kuKsTU2zW3nybw3gTAZ8k=;
	b=UfHQ4WzgJrirbuXENsns5v7/FS6pILndMEk8qbc5AlZw9grADR03P+7qm74/ffLxq8y8
	 x5vPnv3Uj56zrNPwhITAGRBHbR0JvuAAs7HHIkIUrysCx9VSdf4pvJARdqW37nkWpEFge
	 qdenpwdD9iN8ViggrMuH7w8G97bxexjpRht53lX8WAN9tdHNuOpnOm8WDw4fXKoQAP1Bu
	 FQ6U8TGDEa9knePGwJySze4xrKTtmo1J91tH4Idr7rPXp2zGEhp15PQ6iKHoZXG+QOA+b
	 6LgPOKVa69QSXbzE/kA2Eg+NsW8xtZnhXVpMTWOoiGbs+pew6OL7GbDTvNmUcoehMrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wis4iWFU;
	arc=none smtp.remote-ip=74.125.82.196
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D0E606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D0E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wis4iWFU
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-35829219da8so4374213eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792970593; x=1793575393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rbxeXuBz0HfqP0KO9f4xM0kuKsTU2zW3nybw3gTAZ8k=;
        b=Wis4iWFUKqony/2nLAbnNxcXFaNVTFQODKiBbbtoENDWsu32+aupxpQjJD9UUG+NuR
         Oghoo9542qR6F65e17KWCS2HHrQSzM4OXo7iQBna3zw90l0IxaZXHG8W5H/3kBaOzo6O
         DUhGgX+di58mLwtx/Gzk71vykUIRgLzuOft1b+MqLFfDJV5GZ/9xflpbFaa1n37kh+q+
         fl8gdjfea50eIgCwd288k80V7W4qLnrzXUjYtDikkS3vgzwoqnmB+/msDR0jVXxVc4Kc
         5fhzOFxvwlHZR9aYDYYUibvLs/XoP9f+BxRfr896ek65JJiIi1fHrHd9UxclX6ZoSCH7
         FqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792970593; x=1793575393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbxeXuBz0HfqP0KO9f4xM0kuKsTU2zW3nybw3gTAZ8k=;
        b=xpzjkWGbFhFAJKUyBF7MhXRsl/eW8fsoOXCtOpUYG7SDR0sxr110CclZ0zc9D4OEdv
         D4A5c6WiT6mdWpdIfPfR3BCoPOnneOyME5MTDzTcmZHJkPsslDQGnfyXQD94jYKeMib1
         +2Fb6q5fl+iGhq+MQ8dOApWnizHk8GNjzQUs7v02vY/+D1dT768s0ECEVf47AAWzBndB
         T3QVoRuiQH97G9lvzaYSkwUuzgVWmbxyYHby35O3Pjs+laYuET4GAc32HV6vVebniNsk
         NSGst8+vpUZmCXwEe86jGtNVdaqPFB9eN5Dgi4AdD0QDe+PT0O5LHqWzRsbtcJ8IYzUx
         Fd3w==
X-Forwarded-Encrypted: i=1; AKwUvBx8FzRlLEjN/UndOOjg7vCIXgwmT7sEQoUumBvPn4/ej2hqb/PCVLTLt5iR3cHd9AT+rSYoSp+hfYWtg9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYfcZ7zwErFh+CwnJJXMWYWo8oyIXSnC9wPyxWvbjHbqHJRRl/
	ClX/gZSRwfFZoZchPbzDPcrPOHzdOXjuY8lzxIUAJPwo/aV4bv4Ygbm8
X-Gm-Gg: AYBFou1p4cie9RNXgzXYdi2sZVMWlSj72v6M434tKs051D3PYSL6qrPwjotcWC623D5
	zhoOOpuwmLRYvp83zT7OqasvwxHIvPI/5ufGgKuMInbdqTCB93L8ZsIWOjwwHw5f2WuOriOphN0
	RjeilhOtOlw0MGNzhoCSxSd9G1snXFJgiZiyG7ymztz7BZVoiFVb8rfH69mTZERqyz5v6gj0aIW
	hLkRf1qO0o8LsswHn4QAavKuLw/MMKK5S04+1K/prig3UzG7NqLvEsXR5F73j0jV7DxXdfd+d2M
	1mQbzLJVY188aB6OoRZ1Ahc3gerdyQbd5HHB9DIrtPVrokmDr5iVBaUbubwVRgRy1CEuyZ+HKnx
	awW1RQpjAj/cVaxT118BoRSVAax70E7dqKX/IExBBoYDXR8i9E271mru7gBm8Ac1jPNKjqkwQPC
	ik3WytTWStRSRmS2QaILXWHTlQZdTJd42VnTYmEFH4NNvk7DLaUQvZTtEWk0B2+8q748nUMI3yn
	FV5FNikWXtVj1fGdFDarWYn8Y0gmNnxVehK/roYsWjzUCuTkAQskddKzHrr3nrCkZVxW8/JJcP/
	Uzfr9Gc=
X-Received: by 2002:a05:701a:c919:b0:187:5a5f:3b27 with SMTP id a92af1059eb24-19935be804amr6867724c88.17.1792970593173;
        Sun, 25 Oct 2026 16:23:13 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2eefbsm20118741c88.7.2026.10.25.16.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 16:23:12 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Amir Goldstein <amir73il@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] inotify: do not coalesce events with different rename cookies
Date: Sun, 25 Oct 2026 23:22:51 +0000
Message-ID: <20261025232251.58252-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

inotify compares the mask, watch descriptor and name when coalescing
adjacent unread events, but ignores their rename cookies. Distinct
renames can therefore lose an event even with IN_ALL_EVENTS.

For example, prepare two files in an unwatched staging directory and
rename each onto the same pathname in a watched destination directory
before reading the events. Only the first IN_MOVED_TO event is retained,
although the two renames have different cookies. Similarly, coalescing
distinct IN_MOVED_FROM events can discard the cookie needed to match a
subsequent IN_MOVED_TO event.

The original inotify implementation compared cookies before coalescing.
The fsnotify conversion lost this comparison. Compare sync_cookie as well
to preserve distinct rename events, while retaining coalescing for
ordinary events with zero cookies.

Fixes: 63c882a05416 ("inotify: reimplement inotify using fsnotify")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/notify/inotify/inotify_fsnotify.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/notify/inotify/inotify_fsnotify.c b/fs/notify/inotify/inotify_fsnotify.c
index 7c326ec2e8a8..6456d9c0e408 100644
--- a/fs/notify/inotify/inotify_fsnotify.c
+++ b/fs/notify/inotify/inotify_fsnotify.c
@@ -40,6 +40,7 @@ static bool event_compare(struct fsnotify_event *old_fsn,
 		return false;
 	if ((old->mask == new->mask) &&
 	    (old->wd == new->wd) &&
+	    (old->sync_cookie == new->sync_cookie) &&
 	    (old->name_len == new->name_len) &&
 	    (!old->name_len || !strcmp(old->name, new->name)))
 		return true;
-- 
2.43.0

