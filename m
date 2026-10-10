Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822FE3D6CC5
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791659439; cv=none; b=FHHiLHSOl6wHgVRsE/xn/XRq4lzSDTqhftycsWWcYw+Y4QkqXgqjBkZNG0RYLRly0SL9goPsGB72P5S9EGmc+NqCxgkVX04L8giDgJitlgNEU9QHma0SQYU3WVOa8iST5oWRiFXdLDXdE67Vo5GBcFTrXryKfDTyroQG+Y2xifU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791659439; c=relaxed/simple;
	bh=nq2M5xW2fxIZLcvXpCROZkWVmTxCmiexhtFVPMX+4E0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZHJJ+AvDSZT5wgW/RGAEbUZ8ZZAcoxjuY/ScuX18DCUMelajuoYVKDJTyIQa3s/1iBvj7SOnN0P5LVcZXpX+5BU3Dy4GxAx+RkIuZTaa8WXvXFFlzkRqTs8/EjXf/FuLVcUvm6JP5PFf1xtAyECfJqCnaOtkwVhp7jNXINjKD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net; spf=pass smtp.mailfrom=voidship.net; dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b=0PWRAhgE; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=voidship.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b="0PWRAhgE"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e706a6ba9so103232085a.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=voidship-net.20251104.gappssmtp.com; s=20251104; t=1791659435; x=1792264235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NC4wjVkYj33ouDrpIw20yvXN7Xm00WRsU6XHf7agKPU=;
        b=0PWRAhgENIhtm3y7JAN/pxCXiLSot55w+AN0BC4VmXWnTKePswJiGJ54j2LE8uWILO
         LF4odu3qPT3aTEEnYWx2OVK+Sr5ayUSrn+3Te4UGEbAIhitMtrpS2uYKoN32kKReL2Lf
         1LfN03UgoP9TvkJ6cyoWl8ZcUhJAQp4jLrLpOAb9T0fJJrDpMB5faxVfYJ44CImPEaXN
         ExpZ+dLEeMoSx4UwrLnDf55ls82aqmH/3oE+PnhXmdn99WhD88UjAM8m/OlVkm9GI5ep
         BrJ1Ta5Zwxu5T50HQukblQCh2eDD1V8F6io/IKW4ILJAEvxc+cU1QMLpEo3G+pRS5XKR
         bI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791659435; x=1792264235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NC4wjVkYj33ouDrpIw20yvXN7Xm00WRsU6XHf7agKPU=;
        b=hwlOXY5og6oyQaP34mCJm1UMmTPFLKcMd8xrsWwHbKxcBd6C95LZyW4XGD8SsRZaP+
         C+9PZWRdt2DvS2URW1QJFdmSeU3SK7jTzpOoa3sbxB5I8C16+zQX4aq7ayTya6jfOig+
         IpcHwJoxE26TbJBmOwmy7C+6uqKJ9oS7cq2rMfJnGbHRWNM2Yix2A/ltmfx01BfgOHup
         ET5gHiowYIXIJ4PAZCW24X3jfhwILhQTXMcn4PdBBuXWkMMXX8zHav4zeCDOzJtkCCC1
         NUUQFayoPT3z8z3PEo2VPI44stSodsMO9lfmnq+pRIbl3zyl6nhS8LBzCuocnDn6v8ry
         2jbA==
X-Forwarded-Encrypted: i=1; AKwUvBzzToW8SBrEqE9KZ4BmGTYOeydP6hiJvHm+RzypN65FAJwcNK9ayuGeiY7a5ewdDhbz1OLIU7mQBVxx2k8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLd3Ukj4lXOloKMKOHPiOFs5hksmlPzL8m7V21Y0EZ/RP8B7fyc
	4bn6/kxEtx1CDxYcq8lJjDxhCaYktFZGhOBC5EqV02hsQUsjkJ2+hFNXPDJzbEEpV2nqmasNfC7
	PQ9GcYZQ=
X-Gm-Gg: AYBFou29MC8ZtebGYPFFljxxh/TZ+pM9DcSDQ47k+TEaTBMPX5COtdKN7xFko5n3pBA
	M6VvJMFouITLeKIIHlfajcdc9JH1ZyA4uPyv5FHIpMN5nY/TKrQqBymmFUf106vFHZ+MLFAZ87H
	dFTXNw10jk3u5HllbtPHnnB4L4rGoriWLBw1PZ1EYT/0W2VeT7gvPgLcPJHIjLrs9mqKp7C+QuI
	IwdBKSjCZPSkOI9zVUCESZIxlcYSJR73siVzyMK9h38KYqpoTSVCq59U8PdWRqujeXg3E5SeHUv
	VyMhPlTBY2nZUIj4j5/6I/O/uICDT6XTK1O2BVCvpXISciWNxFgmXbT9Eu8HCCK8mRLP3quqXYc
	th70f4e66V61twiRLQ+yqAqdttktbS4OOheDdTccf0V5scPr6ZlrEHmTMziMgrs4M/1GfKjBdfO
	qJpz0FCs+1KOGOu2gPDRmTOFOijy8SSRArBJXCovNdgBZ/dzchvGZXSe0miqqJ60hNpJaT5d4J0
	fuMzlqTNrZc5ZNg6r9Y8Y7PKOWkZ7/d16dR7qAOwg==
X-Received: by 2002:a05:620a:28c9:b0:93c:b721:b10d with SMTP id af79cd13be357-93ebd0bf9edmr935613485a.8.1791659435345;
        Sat, 10 Oct 2026 12:10:35 -0700 (PDT)
Received: from boomzilla (dynamic-acs-24-101-237-49.zoominternet.net. [24.101.237.49])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb986c0cfsm489355685a.19.2026.10.10.12.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 12:10:35 -0700 (PDT)
From: Karlos Abel <kabel@voidship.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: [PATCH v2 1/2] Input: discard pre-registration events before attaching handlers
Date: Sat, 10 Oct 2026 15:10:32 -0400
Message-ID: <20261010191033.23577-2-kabel@voidship.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010191033.23577-1-kabel@voidship.net>
References: <20261010191033.23577-1-kabel@voidship.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

input_event() permits drivers to seed switch and absolute-axis state
before registration without delivering those events to input handlers.
After event-buffer allocation moved to input_allocate_device(), such
initialization events can remain queued across input_register_device()
when the buffer does not need resizing.

A later injected LED event followed by SYN_REPORT then delivers the old
switch event to newly attached handlers. This was observed with the
initial SW_RFKILL_ALL event from thinkpad_acpi on a ThinkPad T14 Gen 6:
an LED update replayed the initial radio-switch event after registration.
Registration can also leave a pre-registration timestamp attached to the
first real event packet, including when the event buffer is resized.

Clear the pending event count and monotonic timestamp under event_lock
before attaching handlers. Keep the switch and absolute-axis state that
was seeded by those events. Resetting the monotonic timestamp follows the
existing flush path and lets the next packet obtain a fresh timestamp.

Fixes: 0cd587735205 ("Input: preallocate memory to hold event values")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karlos Abel <kabel@voidship.net>
---
 drivers/input/input.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 01c91fec9..d59d62caa 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -2445,6 +2445,12 @@ int input_register_device(struct input_dev *dev)
 
 	error = -EINTR;
 	scoped_cond_guard(mutex_intr, goto err_device_del, &input_mutex) {
+		/* Keep seeded state, but do not replay pre-registration events. */
+		scoped_guard(spinlock_irq, &dev->event_lock) {
+			dev->num_vals = 0;
+			dev->timestamp[INPUT_CLK_MONO] = ktime_set(0, 0);
+		}
+
 		list_add_tail(&dev->node, &input_dev_list);
 
 		list_for_each_entry(handler, &input_handler_list, node)
