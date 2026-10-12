Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5806236D9FE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785566; cv=none; b=rz4vSpibOcrKBDbEUChQfAyhTAuGZStNjf8WEnkT4D2DujGhzmufVr6ApSJDymgN278Tnqqpa/bEnqFJFIBAoQsp9VPSGslbxFWEYjGORhEnl6MT/EL8iWwriIuKzuL0rZPSRxKFbfRzw5MJGfrnzVxDEbJiTYUCQEOhTDl629E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785566; c=relaxed/simple;
	bh=X0rSsrNnOjjGYUh8UDAFaoAJukwKXknvLN8GJyYXvGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WroSBX1EgEltyYuOHZFilcXQdgvcQNpYxHrIv0EhtXhrum/G6NSsiLzuNn82j/qS308OnrKOMcIinK5acm2vwaXCSVHXgrJxGdpXw8ZbtSvuYN+uu8K/7vFTAncsoaFJqTDIRHKLVEZpWbIkdB4opKemTXBAn6b2AkeDrQXytiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iurKQw5F; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iurKQw5F"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so3082951c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791785564; x=1792390364; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEQGWV8V7BfjtX2JgvHQ1LpUH2O138OrGdI660UjUjA=;
        b=iurKQw5FnTizzHcSHNiQhz7Ch2LRXP7OWURc3YWGvVFSmRxSFXgOO0dzLls735MhWu
         vHmxxGmuWUfgq8oYsCK7Qo8HFcOaVz5SJYdly4RM7TK83GVumB0kqZQFGkke0FWtiu5C
         dWZH04gdVw5KauVIjwVZ1xff5tVY/zPygLn6pQ8biC9GKw10qsj8PEucP8p0tmRoamVJ
         RemTecPvdrujB/PLBfCrmxuE77uXDtRJFEOJUEhY8j1MFOJTZBhU7hinLxcNSYWwji+6
         ZL8zlxgX3BWv/XUgAp3X6cYtMfD2iZqJO6Zr/SOh0sOwQWBJwWFC/qnmEj2Gyow7s381
         WgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785564; x=1792390364;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEQGWV8V7BfjtX2JgvHQ1LpUH2O138OrGdI660UjUjA=;
        b=1eI3V36gO8wwVWAavYO/kY41OcDjcA7GmH7PYOiUZZZ71N54nVlTG9D+BOSFcaH4SJ
         PRLxc7rKgtRCtXwf3phPNl7rCuIpyb94dIW9QFKzxr9qJCuCfSjYKvIxIzR3KOIUXAfe
         ohd31F/MR/hHHMZbYPpeZ8mX+FYBIkyYRaFtZiPacg5ZnmGKwWkO2LDq7Gym3qpVq1l4
         fEgkUKH12Nf7Km8AH4FJ9fSdShUoX0ahi1BeAtQNYIga7ObCwKEMXpRFiQO10isYl7wv
         kici1qlNsFQWmvCtZPWt8fYrMwIzc6g7UIJEj7ayCJjvat7kLmpN1Pc2/qS9lQV6q7wE
         ZwgA==
X-Forwarded-Encrypted: i=1; AKwUvBz2nPMPyS66XbjcsxRVLBUDGEI+EXe32848/lVEbIzUlXYBrbFnSYsVtDsi0j/8XzZ/8fE1XceKbpIyImc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIegfVK6mmZeuiJqEQ3jA/ff3PVcWkfkTmTWUc9oI4Q0C6gMg0H
	02BNibBkfuJO2CG/gpOfmh3lGzilEUh//4eAn7sKYfMNO+rntC89Ce98
X-Gm-Gg: AYBFou05OX1mZwRu2CJkIBsSiKLIIrPEdidWpXrXhNN2nmNyYIDTrgIUkzpmFjbLnH7
	wIqeRcs+5+CM4ltcQa0pB/vRTqQfmwQNHQrmE2o8Ia+gixULIZaNXoGpShQoMOo7H4Q83+PWswV
	b+oYwpIRxIesvlN5J+L2gm8VvelFqsemwqguZT/eM1FyQOaUsu1BxkgyLSmWhtaGCHUFvSfx2Zs
	sA78gDqgh0m3gOKEA53kziMPfvkrIt9CirzRbzXBtFmOwLPirHY8I4Fkjc3EyGiijM4xAcORR7F
	rsqHxMFwNgdAbwgfVwIOkJ9DcnmfaPgnJsDjgcSMOSFBKp7qlY/iI86L/v3NeiWXA2UiWMAH8dq
	NcJzYqY6KkhPUsNsDx0NUuJJCIA7wUwpulaL9OgFVieh437xmBIeowPvhWfkIZtH5OSPsTuldga
	3n4ExRBX1jRhNmGngRPfHvvh/hC59iGIB+ZKrBjU9Y6KcZVD7i8WU0oViGHCgc5QIV3w4xKBsQi
	AKFVizT/51MvIdmRgeeqVaPAZKeCfu/5qjVI4OM
X-Received: by 2002:a05:701b:270e:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-16a5c5f20f0mr14463358c88.13.1791785564234;
        Sun, 11 Oct 2026 23:12:44 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:8999:e631:ed58:366a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a3f6186fsm27719200c88.14.2026.10.11.23.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:12:43 -0700 (PDT)
Date: Sun, 11 Oct 2026 23:12:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Karlos Abel <kabel@voidship.net>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>
Subject: [PATCH] Input: always accept EV_SYN in input_event()
Message-ID: <asx50uz6iafsyAd5@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit 0cd587735205 ("Input: preallocate memory to hold event values")
moved allocation of dev->vals into input_allocate_device(), which caused
input core to accumulate events reported while seeding initial device
state before input_register_device().

However, because EV_SYN is only set in dev->evbit during
input_register_device() (and some drivers also overwrite dev->evbit
directly before registration), any EV_SYN/SYN_REPORT events sent before
registration were dropped by is_event_supported(), leaving those seeded
events stuck in dev->vals until the next SYN_REPORT after registration.

Always accept EV_SYN in input_event() and input_inject_event() without
checking dev->evbit so input_sync() flushes dev->vals as intended.

Reported-by: Karlos Abel <kabel@voidship.net>, 
Fixes: 0cd587735205 ("Input: preallocate memory to hold event values")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 76ed9ff40584..fae508d280db 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -452,7 +452,7 @@ void input_handle_event(struct input_dev *dev,
 void input_event(struct input_dev *dev,
 		 unsigned int type, unsigned int code, int value)
 {
-	if (is_event_supported(type, dev->evbit, EV_MAX)) {
+	if (type == EV_SYN || is_event_supported(type, dev->evbit, EV_MAX)) {
 		guard(spinlock_irqsave)(&dev->event_lock);
 		input_handle_event(dev, type, code, value);
 	}
@@ -476,7 +476,7 @@ void input_inject_event(struct input_handle *handle,
 	struct input_dev *dev = handle->dev;
 	struct input_handle *grab;
 
-	if (is_event_supported(type, dev->evbit, EV_MAX)) {
+	if (type == EV_SYN || is_event_supported(type, dev->evbit, EV_MAX)) {
 		guard(spinlock_irqsave)(&dev->event_lock);
 		guard(rcu)();
 
-- 
2.56.0.385.gd3acb90ef8-goog


-- 
Dmitry
