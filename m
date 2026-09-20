Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB741DD525
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789877793; cv=none; b=a91DJrJifX8VjyW10tyJpQUonXPC9TlTfudX8WOXaYnUTfJT+dTHvmQijir6jt5vLmhxdbcpQ6YuPv/ugKlnz/O6+kpzWkLW+IwH2BkrwndXeqXi79XUPIfiVo2rZpYdONFwL+qncVo0unVGB8/xKFkUGYoJN0q0QjnUnmwB/hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789877793; c=relaxed/simple;
	bh=5i/xrXB05pYpB7Y/jzFUA4x4HQXReMiHhsF4dRiUhF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XnVX8TEGac0m7CIRgNAcu1pIFb8P/FAYfqyHnjvWNmwE8b3Dslv+P9fBfNUmPKYVhOdR7ubVt+AnpP7EWwv2FbNfIfQsRKI9nylJGM+285hAEqT5YynYkDw3LjFHDqtiPwCi24hAODPUMOA2QlNXrb3c57Lo9Dlm1ts/RWg3BIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxnfrBK4; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxnfrBK4"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc1cea4bfb6so843394a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789877791; x=1790482591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+PFKba1M+eQHsH9jb2Yf4iAy2Pla/AL+6DEGCYNYE8=;
        b=AxnfrBK40LxkI/APVw21uuaAwQYTTiz9x7iarwxv+D2AVOSIGdjyA0vMVOfzQuUNOB
         lzAK26rCMJAK1+jOGNAXqMSTmiFH5IauIL7CWN65MWXF5/f9pvF7mkcbvswixd6XSxx3
         I4I6F9E7dohqbkFsodt+TVRSoNYLbWVoBNL/fanCvYA90ni9fxuY7Lmeg7OlE5iqydY2
         1lxuvfTW17k2rN2087p7Nm5tA1P3lTZyoY/L2sE8IM5xjRELlg9S0TyNf2acWTZETlNo
         nrBBO2SexocMDSDm4Er25r0J6yu3EzQ2mpUAVLqI3wEKdFUx0S67F3yoO/rpzNsLV7gv
         hzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789877791; x=1790482591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+PFKba1M+eQHsH9jb2Yf4iAy2Pla/AL+6DEGCYNYE8=;
        b=yjuR/KEcbDMW9OWmxIn93tEaOAprRm+wO8cz3uD52D6cgYnMH6dstolEDT4JrdhTue
         c2Ad3ouwllEVmQnypMVzPaGBnxkgv/lxugfhI8po6juL3f8Hxts0BRsM9nHs2DR3gM1D
         d8/FbU7Y6Ex0gIHTlI/j2npuOogesQRcclw+G3b35uTKan+jTn7BmrQencPn3/kzA1Wa
         zmykqjacGqajX4LVzfjXiZkzwwOy0wCZqFsEPKLAMAoyUaWPbQug5Orh/XM+nsfyzkUE
         /c6IIpD4Hb3tpEwuwkRKPkY/ad5op21I1knrTCc37xBfs+C8rQ2gRsMNtK0zLVkjwp9V
         go8g==
X-Forwarded-Encrypted: i=1; AKwUvBwBHlvmVL4riOSmHCOJP/QYtG+ZZNl1ZmzOGsPCJYEOePb0cnl455RbY4hd0n2RqblG5SnAcumDQ8YMevU=@vger.kernel.org
X-Gm-Message-State: AFuF++m8jMzPEbTOlw/v9n7bORaNe5t4J2CVob97khHJpDZOLKwjL6HP
	qi/Bmw9Ld00KyVf3tuhhy2RwraFSBXVQmzyNPNFphfKeDGcyoMRsSxKi
X-Gm-Gg: AYBFou02fJR2kFiS5l0BJmm1v1JMSiO2cRIvHxPQCrdrp7p6v5oi6hp2nUwOl6J/Jij
	2hvjmfbhPp/KEYpsxfq0YAKoxIgo2j/IAE+6F9FWmO4SGW/Wlpq6gpO/Q6jY4I7RTGggSnCP7bt
	t5eBswwVm8i38/WAEjerHOuW/MXRKWnHiUnonr8ZtfYi7d0Y6sSFbB9B16E3m7Bl1EX3wIp4xD9
	b+cfw5fTRDtQwflcu6Zx9XClbZ5hgibsHZ3eiQCn7Iig4ncYIYYWIqSj/l7mfTHe2fmFLg8/kL1
	xg4WNniVf6x4uc/Z6qU6b3NuH9BfmG+j+TQol6tmkUpFnot/xCEQzWb8HWeZlwvv13q+W667AaM
	0xY9xdfhX7O9HizY6lXvti2Fs51WQ6g/EsQq6bJdrj9U0gbcWvIfZfrk2vCU1gqtkHYLbFIgvUv
	VLkSzWjwJD7KkC61rmN56MKaAP7hMG9bNCaQDZLpngfjDO+BGnaRlU4pobve50KvMXC5jpgSGsi
	wLEzBWYhEoYcQ/NbvyzZaTjQ+GuT7ifuT5YKZck0rlpt8o/qIKXujEXQ3L72Cf3nDbrpHv4vaDo
	1YCcopZBXw==
X-Received: by 2002:a05:6a21:6915:b0:3d0:cc29:ff63 with SMTP id adf61e73a8af0-3dd8c2ea2afmr10710958637.12.1789877791485;
        Sat, 19 Sep 2026 21:16:31 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aecaa7fsm1613635a12.21.2026.09.19.21.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:16:30 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>
Cc: Bradley Morgan <brads@mainlining.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2] seccomp: restore knotif->state when SECCOMP_ADDFD_FLAG_SEND is interrupted
Date: Sun, 20 Sep 2026 04:16:29 +0000
Message-ID: <20260920041629.2453290-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <202609192050.D1E0CD96@keescook>
References: <20260919203514.2580997-1-benquike@gmail.com> <202609192050.D1E0CD96@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In seccomp_notify_addfd(), when SECCOMP_ADDFD_FLAG_SEND is set,
knotif->state is transitioned from SECCOMP_NOTIFY_SENT to
SECCOMP_NOTIFY_REPLIED before dropping filter->notify_lock and waiting
in wait_for_completion_interruptible(&kaddfd.completion).

If wait_for_completion_interruptible() is interrupted by a signal before
the target task processes the kaddfd entry, seccomp_notify_addfd()
removes kaddfd.list from knotif->addfd via list_del(&kaddfd.list), but
leaves knotif->state set to SECCOMP_NOTIFY_REPLIED.

As a consequence:
1. When the target task wakes in seccomp_do_user_notification(), it
   observes knotif->state == SECCOMP_NOTIFY_REPLIED with an empty addfd
   list and zeroed knotif->val / knotif->error / knotif->flags, causing
   the supervised syscall to prematurely complete with return value 0
   without installing the file descriptor.
2. Any subsequent retry of SECCOMP_IOCTL_NOTIF_SEND or
   SECCOMP_IOCTL_NOTIF_ADDFD by the supervisor fails with -EINPROGRESS
   (or -ENOENT after the target exits) because knotif->state is no
   longer SECCOMP_NOTIFY_SENT.

Restore knotif->state = SECCOMP_NOTIFY_SENT when removing an unhandled
SECCOMP_ADDFD_FLAG_SEND request from knotif->addfd, and add a
kselftest (user_notification_addfd_send_interrupted) to cover this race.

Fixes: 7cf97b125455 ("seccomp: Introduce addfd ioctl to seccomp user notifier")
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Added kselftest regression test (user_notification_addfd_send_interrupted)
  in tools/testing/selftests/seccomp/seccomp_bpf.c per Kees Cook.
- Collected Reviewed-by tag from Bradley Morgan.

 kernel/seccomp.c                              |  7 +-
 tools/testing/selftests/seccomp/seccomp_bpf.c | 98 +++++++++++++++++++
 2 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 86cf4460d69e..94c7ba80a8f7 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1808,10 +1808,13 @@ static long seccomp_notify_addfd(struct seccomp_filter *filter,
 	 * We need to check again if the addfd request has been handled,
 	 * and if not, we will remove it from the queue.
 	 */
-	if (list_empty(&kaddfd.list))
+	if (list_empty(&kaddfd.list)) {
 		ret = kaddfd.ret;
-	else
+	} else {
 		list_del(&kaddfd.list);
+		if (addfd.flags & SECCOMP_ADDFD_FLAG_SEND)
+			knotif->state = SECCOMP_NOTIFY_SENT;
+	}
 
 out_unlock:
 	mutex_unlock(&filter->notify_lock);
-- 
2.47.3
