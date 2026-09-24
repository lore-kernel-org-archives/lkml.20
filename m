Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2602E43C7B4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289023; cv=none; b=uc16RimmX3NoHZrdj3TvKFuU8fR66FX/aNnsEKHG3v2hLhWwao/QraRv/GMYbf5iygs3uHP1gyjB4eAJxxu8BOB9wZ5mMaY1WMV3isiz1yoWxfjIT2/ppzN036eQzcCvtkp6tSfRj4j8vwAAPIobJcvhwtic5CbMSLiceUt9zM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289023; c=relaxed/simple;
	bh=jIHNOhnZqKFeigrgnl/r1tydMDT+Z7ehVwrTHpKpmDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kOo1Uh61GPjqXTd3JeifljQs4UWdVEPCvWHU+7BfZmfbgoMx8/fPJr3kDqvDH+phxifzGLQkxSfg6vu60dCZOdw7M0Q2L89w3zwFYyFwzeJiYmzEPwmx8Z0R0pGXaAgOy3XfIVfLR+0lpIzDMUtGeYO1VJL3NYtcwuqQSowV5wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaZ57Lvh; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaZ57Lvh"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bb1a50f6fso101441eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790289021; x=1790893821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cozV4/8wTUyiIDm9eEhgveY5oFC26qagUPsjNmsT48k=;
        b=TaZ57LvhBR7DDr8dnBpjlz7nyGu5vAmHB4i3C7L4NtdE7BfDpqC4fsmVCCf/UHt9QY
         dfXVtgZwjw4dlDRkhLTrC0oZnI0a73e7hOVYuHs9f4lnqavt5fqGJQcStIq9kC4mtqng
         aJeAZ8CsrjyQWazshqoJ/MCT9jdX3q6AcI4O7P7rHdkQ0UMgDW5Qk0BwE6IXNZ/fZUGm
         Bhb2iYyStFrX7GAuZu2yIQ7VGBt0seJrz2sDrTBdmvoxO+E4cGIEE5HdN6rHfAC9KHv9
         /OHwDUXxQ87+HumInJ1Vc2i6/++SsYjW7vZLdl8wSVNrUtIqXHiM8Gb3usprW7ppRcV1
         52Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289021; x=1790893821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cozV4/8wTUyiIDm9eEhgveY5oFC26qagUPsjNmsT48k=;
        b=TVicUmx6iNqdfjAt6UKf+p2TnY8rVFoy8Na8rb+bjvpfQXHXjnbM0/QD5DmK7DHl6v
         x4AKLuAaEZQ4gdG079KgJvQELx88USiBAtM/HfQdOM6mVUOqOdVeEk90OcOLDmpWaOpg
         v9ELJT5rKIN6NoKoTmw9w3CcTtfU0B3y8ZYidN5EGljBsSGtB35ykuXu31kn6583L4rK
         lnuie+LRn47PF3dz+Oj/cW1LaNE7mFgW0iz8GIqagOhL0veZmP7xSfHE8Fr/YobX6X8W
         fw7lpH497BkwOf9JSVPqFLl00FHiwACyAsirgEbctqEqI3e6c9uuQthFeHBwEoFTkriW
         8pNA==
X-Forwarded-Encrypted: i=1; AKwUvByRrUcE02ie7hocsD8swSjZhNtRAF3EfBjXIjUfC/BlZDKW7exIUJgMJKdnVZejleOJ5NdLeHR1e9BiSHU=@vger.kernel.org
X-Gm-Message-State: AFuF++mO3/M4y95J/53kD0DDzLCQmYlmM7eNm5M67lDhHg4ZbDzdZk0V
	14ltCXJiW58A+Fao7p3gpUwzJND4foRX3shdN+BNzX8aRZCndZBqSQjS
X-Gm-Gg: AYBFou2m3H31YpykvBq9ahm+dunKr8KdAtEEjglkbJTKmT4pqNMmMkgERvKlKN3WX9f
	snQOsOXLgBNMyAjtzy3rL5epTiOkhAFSE15fbt3Nc+Pj3PetENpvxZrY1oga6Z6Ovsz1e4sxAYJ
	M3j0Qja16nGou4XMxP3xq4djQtJtUtPu9cz40JAXuYAP8yqMGOzBUUcePu+0hlFeySUFhr3hTsF
	q95W7OmhEDzewq9+hygOwEsJOKk1s9NR2lArxuaYqTUhBMplBNfb26flqi85Y2ByRGdiD4lBLf0
	XZNCymNn2ytzvfOEu3NCdsbUWt5yCVmSe6gqQrhPz3uc6I8jmkMLq6/oMchW9Ir8m/9KCmXF44y
	xLxnT9LCqQsNIG+V06SzNVzKXSIv+Qoo8h4AXr7fHZR+goYpgAjK0zu48cphb/X1wEQ9qEqjTyp
	b/WUj3LVTDecJnGQnlxkcmxAxHBy1bkOH4IUlGIqBO/zqinKDpyLmQ1okBWJQoVjNRCslr/wygc
	qEOsSaH6/7ZSpO0L6YemPiWYlldJiwM7WIRHR7DEQ==
X-Received: by 2002:a05:7300:7b0d:b0:33e:42ae:ad7 with SMTP id 5a478bee46e88-3400647b653mr2983932eec.32.1790289021069;
        Thu, 24 Sep 2026 15:30:21 -0700 (PDT)
Received: from pop-os.scu.edu ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm1541989eec.19.2026.09.24.15.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:30:20 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH 1/2] seccomp: allow addfd to transfer O_PATH descriptors
Date: Thu, 24 Sep 2026 15:30:16 -0700
Message-ID: <20260924223018.564548-2-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924223018.564548-1-xiyou.wangcong@gmail.com>
References: <20260924223018.564548-1-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Wang <cwang@multikernel.io>

SECCOMP_IOCTL_NOTIF_ADDFD uses fget() to acquire the supervisor's
source descriptor. fget() rejects FMODE_PATH files, so injecting an
O_PATH descriptor fails with EBADF before the receiving task can
install it.

Use fget_raw() to acquire the source file. This takes the same
reference while allowing FMODE_PATH. The existing receive_fd() and
receive_fd_replace() paths retain their security_file_receive()
checks and preserve the file's O_PATH semantics.

Fixes: 7cf97b125455 ("seccomp: Introduce addfd ioctl to seccomp user notifier")
Assisted-by: Codex:gpt-6
Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 kernel/seccomp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 86cf4460d69e..4ce59be6d89f 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1735,7 +1735,7 @@ static long seccomp_notify_addfd(struct seccomp_filter *filter,
 	if (addfd.newfd && !(addfd.flags & SECCOMP_ADDFD_FLAG_SETFD))
 		return -EINVAL;
 
-	kaddfd.file = fget(addfd.srcfd);
+	kaddfd.file = fget_raw(addfd.srcfd);
 	if (!kaddfd.file)
 		return -EBADF;
 
-- 
2.43.0

