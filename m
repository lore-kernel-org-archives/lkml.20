Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818740;
	b=Lcn9G2bTfe6c+UFQXWc0G/jJhsoX2LVI9YMAv7XmfyXWyi71qMeN6mfbNRbB7kPNUetr
	 8w8TZjDJWr9VZBIuZm0QjGd+Bwer4G9VpaW3oTfMLftMuOoAYjfHF/wi7oEzFYaOqULPl
	 X0v5tmeBPWKZbw7NIK7thu47ulMUcNqb/4xICtctpniiuOtbPQnfSv3YYt1o52q59vKXL
	 j/91nHz+966/qoR9uWMmeQgRFk0Oysh16LoCn1blQCRBR/whX/S/y5BlYV29XpSYQ/jGp
	 k51CWp1c+W++OrdyClTy4GYdMAXZsoY6xwd/fT0MwjMBev6cuIsNp0aEIzW3vgD9KIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=emDL7nORVU/zbyIvHyGwsh10d6MuJhOn1sH+gqeM88I=;
	b=vCgbUUcggZsrpJxcbFwtunPtWjgc5mb9S/QjrvQyG7x6Q2YAJnSgLqwFuLT8Xl5Bld9D
	 yjsCwbkz1ZMjEBQcGNoWUGwVS/nFpSYiaGnvYvVwzrVxWlmR92DS6PzIhdpZ0+HaMu2v/
	 XROzZxQE41Dh9X3zNHx2jED7cZ8/qYOa60uIlCFs5LElwc9Z+uNmqUSqAtBG4hSuo/jGa
	 WiJGt1618x91gM+TTuQwxDaAKyZSU/6MQZOh0RejokM6fXeY64Cb6EuUnhkzMOQfF7+qk
	 8OXY2f1g4TKEFKh/PzQO/etsDvAezxMYZj8A1sq6SIbM+BGjD9Q2JuBTM+684Fw/rsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V3iAl4E2;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93573606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93573606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V3iAl4E2
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb61185057so11300305e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818739; x=1795423539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=emDL7nORVU/zbyIvHyGwsh10d6MuJhOn1sH+gqeM88I=;
        b=V3iAl4E2hXEYSgvA/XvsNIrye2gOhNXJVwQl80U1wTT4Vz8QXLkc+4DmZyFg19+Jjz
         Phyn/8RJ3fClE4rkvKT3dKYpHMpicSb8+DU7KmzRNFipKaCuIdjmd02aa8LG2P252ZF1
         sm3QiVsa2ZS/JsKZWckvd+HnASbHhutJwJVoJJmx6MXoKVO/oZcd8n6UbH8p1ejFvbxs
         lzT/BDbPc3LfFoupNjsuChL0BW0/w+4goGmLMP9Eu9prqOOHJqVWUvc/j8qgZfVYQP9E
         hYFPkQ6qfofBwAIDZ/Z/GIwJuj5WV7Nq8bvxdX0yZRsVNKwLhQIiaiExyqIIpxULcWZz
         kXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818739; x=1795423539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=emDL7nORVU/zbyIvHyGwsh10d6MuJhOn1sH+gqeM88I=;
        b=tTpwtDP7yBBtW5O37jbyjgvVpjZ7E543SeKe7kT/UAZkE0yfXS1CgObva4jmFD8oZu
         1Hs7yM+SRVfkU6+Ia8uKwzFz2M03GcWc/i6O4Sh94JOeEfNGGBnImNVcV8bVf5VsUrKt
         UpACvqoRRU4UDYtegSU6DwLsEV5wqUWCbV12XUqDx9jLpsWa9v1Rhg4zqk+XWhdKxhn0
         HfRAcoSijDiXcKe7lrdj3CLs/uwkkMqwk0+DdhvAotAbzis9LitjC+DoXa5gSngliAy0
         mrbAISTIkB9/96xzU7dllBOMcghqQ4wrpTYgIzLpx1ovvYrvfkMD0nWe8qxiPe0l6/UY
         +XaA==
X-Forwarded-Encrypted: i=1; AL+hErHqqbaoikY9eYDSgTKFgY/Z8rWU8hcAwRe7FEvU4Pb4/m4itOoTzNlwmusqYCcbvUgjycV+O+PH9XxQcnc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SilR09gAXH09JIKJcXjGCJWjoS7vp+J6JkcJUPtrqdc0Qup4v
	+kTfa1ibnX6sEKVOes4wPjNW0rTwZq123oGj0bW+b3y7h1Lj7XH4naOf
X-Gm-Gg: AYBFou1gWoCU7zF8QB567vdtxNLa/RPPG4/ZuWEVOFF3AOp14Sq6gvxrCLVdOm/4Idn
	CN88A8qYYZrFrszTx3nA9Iypw5HJmWSkLRcZFWb6RtX3xFxK3Y8x9QwqEqO3aml4gDLyV9nuNg+
	7zJQBXvZXkfXSlBPIWEO9tzJ7EySJpVDAHn1S9P8loJER9czDTNXQhTziWid1Q5EC0ognu5K3qY
	1h9h8bQzi8mi2HlfcVNFIze3T8z3Mgb6GQ+rA8sbSuX4qmXA5kSTQ6c5Qtq7cPlUGXwMT+2Etb3
	sRcZcoCwah09inOboJvnaFsw+iLFS6KGmP8zrMgjBJDg3o7exMBSXvYOLk4KDKSPLroACKvV2MB
	pNkJFWdX6fhJiBj5OiSjtE/URedHKk6yntpPSWrY1GfKjGSm3BwwIKy4uE6BmDzn2FqAuy9OF0j
	167yc+fDKOUMaFJRwSpfovLCgMLWB7Yvq7bjAXQrgTBeXKdOxgRARuqnxw+MFJBQ0hZPVIDft63
	DovtQOe470ZXcgBEYJRSZtRH78JOCp0x+CLGq3A5lfTMPbDt3CfbSo4sq6+wc9r6OA/aWHq3XCk
	PP6ExawK4ycPycTMOPAZt4SurOWjBb5nOA==
X-Received: by 2002:a05:600c:190d:b0:4bb:69d8:3e92 with SMTP id 5b1f17b1804b1-4bb69d841bamr93333585e9.29.1794818738636;
        Mon, 16 Nov 2026 00:45:38 -0800 (PST)
Received: from thinkpad.lan ([2a06:c701:474b:1700:73a2:10bb:45b8:8892])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm22404536f8f.40.2026.11.16.00.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:45:38 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: rostedt@goodmis.org,
	gmonaco@redhat.com
Cc: mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] rv: Fix empty tail container detection
Date: Mon, 16 Nov 2026 10:45:30 +0200
Message-ID: <20261116084530.87088-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.53.0
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

rv_is_container_monitor() returns false for the last list entry
before checking its enable callback. With CONFIG_RV_MON_DEADLINE=y
and CONFIG_RV_MON_NOMISS=n, the empty deadline container can be
last. Enabling it then calls a NULL callback through
rv_enable_single(), causing a kernel oops.

An empty non-tail container already enables successfully: it is
marked enabled without activating any child monitors. Preserve this
behavior regardless of list position by checking the tail entry's
enable callback. Keep the tail check before list_next_entry() to
avoid accessing the list head as a monitor.

Fixes: 8d7861ac507d ("rv: Fix out-of-bound memory access in rv_is_container_monitor()")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/trace/rv/rv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/rv/rv.c b/kernel/trace/rv/rv.c
index 29f155c6968b..a142e877e940 100644
--- a/kernel/trace/rv/rv.c
+++ b/kernel/trace/rv/rv.c
@@ -222,7 +222,7 @@ bool rv_is_container_monitor(struct rv_monitor *mon)
 	struct rv_monitor *next;
 
 	if (list_is_last(&mon->list, &rv_monitors_list))
-		return false;
+		return !mon->enable;
 
 	next = list_next_entry(mon, list);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

