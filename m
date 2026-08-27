Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1662D9796
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787868411; cv=none; b=Hg9AqCfvkmK4PHZg1wPjXjhEuj6KzjO6IupKNM7zyd5kTn4z+pF4AiDvamBFXnfbOSrWCHTd2zRV0MtQTJ/tgadRjs+/E7uhmRi8L7KMrBlDOOvKRh/u4OP8acrorZeY6HBOlkAwxGZ0R3MgzQN8b5eP1J8VBK9p3zuSsmYwDsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787868411; c=relaxed/simple;
	bh=iaHuxTL9GgUJZF86l4ALIIzy/p5FmBSH/AsEH222pSE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jF1oLtJLJv+V5Ho+FrIUTKzl+FIkIIWLgAOd+jmytrfvVSWDuqtN5RVATpH40S0YuHOMTLSFxlnf6vkb/el06dp+ykai6gLFC4D7P7vJZEfPoQtenA1Ei5BCTz14E6bHWYofKgCrui0lBBuOOQaiXh23YrPU2Rb95BE93CS9758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e0W+xDS/; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e0W+xDS/"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso4605985ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787868410; x=1788473210; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6GW+2Hhc2UcSsdCGhPp7Ouw0/2a2zcXh23hCHwGyqeA=;
        b=e0W+xDS/Np2tDy3zyJm9EVlLo58KFOT3yPU64sTUc2NOq+MudOuwy4dsnyIdTGNVQY
         XWNSmplb2pFe9xbyfV8tC2/f3tZTY10+zmf/dHr5VwI1VGdv5aIG1mK3Sa0kcfXfQMtI
         co3bn+b8swGeXelDpK1bUoBNY+0HjZmRkdUH6wBiO08aN4GcyEEucEKctq2RltyK5hie
         jHpzkG9xpvKdYCze1II93U/Fbc91GgsJ50Kt01YM/odZpMC5Oa1LtT+iywYiWYMNkWto
         +fjjJFUecNHiagp1gf5Q0LPsFkYSRpISSlZR0CSdXfBT3imQ6BAFzQqwJk1b/PDi09Rd
         RGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787868410; x=1788473210;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GW+2Hhc2UcSsdCGhPp7Ouw0/2a2zcXh23hCHwGyqeA=;
        b=qtKo7VlJg2sdQg1sE9P0N551Jesek8VOctlS7ephSk9NyOAov5KI9U7DtHCS0gzj6j
         R6CL0HCQnQjjhYhhfz0LyGD8HxUXxlvn3FrUonRiB6MGPHFMJeN5EqnFzeYURgW4ld6j
         72pZv8Rt2pvZ1XT1Wb5jBn5PX/Scf2heWURobaYdF+8uFAABC68YPBkcTrETmuQMVKdm
         KqtP0vOtOp3PIZ8Pm/ZqdAdw8WkXxpbB6YbrXjarX4o0TSocy40otn/2Zs8ZF9k2xGJn
         XWpAy8+RhVzhUCc76gyvlFEnJon57AcXuDJguej0WF8AcjVHchUdWwh6zYWsyLdRwvt5
         lQgg==
X-Forwarded-Encrypted: i=1; AHgh+RrOSuHpINvPIHe6T1xlgG8zswDi+SGCv6iu4Z5DrrHJoaUMUasQU6Dw4i7bdh5YzqF6OqiPbGO4FAoRghg=@vger.kernel.org
X-Gm-Message-State: AFuF++mtIrCzfOXrLLrjXY6ZqIHxJnI6GVNq6myObhWbrLiTbyetYeEe
	HE0+l27rH9az8xRXkmmD07yzPcvVe/4X40T6YeBTFz9ZxDFIqWsr8eUAvE8cz/YTQMLX2c3z+Mv
	94GWk5vEeHnGkiA==
X-Received: from dybgj36.prod.google.com ([2002:a05:7301:124:b0:328:6c15:25c1])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d44d:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-396d0c15f3cmr4689966a91.0.1787868409462;
 Thu, 27 Aug 2026 15:06:49 -0700 (PDT)
Date: Thu, 27 Aug 2026 22:04:27 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827220428.2988999-1-cmllamas@google.com>
Subject: [PATCH 6.12.y] HID: uhid: convert to hid_safe_input_report()
From: Carlos Llamas <cmllamas@google.com>
To: stable@vger.kernel.org
Cc: kernel-team@android.com, Carlos Llamas <cmllamas@google.com>, 
	Lee Jones <lee@kernel.org>, Jiri Kosina <jkosina@suse.com>, 
	Benjamin Tissoires <bentiss@kernel.org>, 
	"open list:UHID USERSPACE HID IO DRIVER" <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

commit 63a694c51bf120a37550890b8e7736b4888985e9 upstream.

Commit 0a3fe972a7cb ("HID: core: Mitigate potential OOB by removing
bogus memset()"), added a check in hid_report_raw_event() to reject
reports if the received data size is smaller than expected. This was
intended to prevent OOB errors by no longer allowing zeroing-out of
shorter reports due to the lack of buffer size information.

However, this leads to regressions in hid_report_raw_event(), where
shorter than expected reports are rejected, even though their buffers
are sufficiently large to be zero-padded.

To solve this issue, Benjamin introduced a safer alternative in commit
206342541fc8 ("HID: core: introduce hid_safe_input_report()"), which
forwards the buffer size and allows hid_report_raw_event() to safely
zero-pad the data.

Convert uhid to use hid_safe_input_report() and pass UHID_DATA_MAX as
the buffer size. This prevents the reported regressions [1], allowing
hid core to zero-pad the shorter reports safely as expected.

Cc: stable@vger.kernel.org
Fixes: 0a3fe972a7cb ("HID: core: Mitigate potential OOB by removing bogus memset()")
Closes: https://lore.kernel.org/all/ahsh0UtTX6e0ZeHa@google.com/ [1]
Signed-off-by: Carlos Llamas <cmllamas@google.com>
Reviewed-by: Lee Jones <lee@kernel.org>
Closes: https://lore.kernel.org/all/ahsh0UtTX6e0ZeHa@google.com/
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/hid/uhid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/uhid.c b/drivers/hid/uhid.c
index 21a70420151e..d16667207b9f 100644
--- a/drivers/hid/uhid.c
+++ b/drivers/hid/uhid.c
@@ -595,8 +595,8 @@ static int uhid_dev_input(struct uhid_device *uhid, struct uhid_event *ev)
 	if (!READ_ONCE(uhid->running))
 		return -EINVAL;
 
-	hid_input_report(uhid->hid, HID_INPUT_REPORT, ev->u.input.data,
-			 min_t(size_t, ev->u.input.size, UHID_DATA_MAX), 0);
+	hid_safe_input_report(uhid->hid, HID_INPUT_REPORT, ev->u.input.data, UHID_DATA_MAX,
+			      min_t(size_t, ev->u.input.size, UHID_DATA_MAX), 0);
 
 	return 0;
 }
@@ -606,8 +606,8 @@ static int uhid_dev_input2(struct uhid_device *uhid, struct uhid_event *ev)
 	if (!READ_ONCE(uhid->running))
 		return -EINVAL;
 
-	hid_input_report(uhid->hid, HID_INPUT_REPORT, ev->u.input2.data,
-			 min_t(size_t, ev->u.input2.size, UHID_DATA_MAX), 0);
+	hid_safe_input_report(uhid->hid, HID_INPUT_REPORT, ev->u.input2.data, UHID_DATA_MAX,
+			      min_t(size_t, ev->u.input2.size, UHID_DATA_MAX), 0);
 
 	return 0;
 }
-- 
2.55.0.897.gb25b4bd76c-goog

