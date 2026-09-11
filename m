Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1143D9DC0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789165771; cv=none; b=pSCWDxY7bebJq30GhrOJywvJKRdtjzdvx6MHLwpZ9SamlkOWOgOZSGakwkWHl137P++xR1pdcxFxKwfORJjWBmBVFCO6VP4jrDO2b32I6OnlQSkYFK6nnnjR9opNYlFOUVsGsc/h7+byrNYDYyjcjTZuznoTOZoO8tguZ2qyk/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789165771; c=relaxed/simple;
	bh=t+t6u6ngJonj9OBAxJrw59SOLZx4FTIPnexJCgVZzhg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TPFCeNmIE1tLKOhED/J5v6Nt1xSdhZ+eCZ85natzLRo1CEpbQ3wQr+spJPz5CfMpltCvTqCfugEGj88RlYlaokoz6L2VDMsr7WnqdXKtNc9HDwIt+zWCBR++yx5su1fb5wn3fKXjbykjR0pzx4dP37Plb+w5hUnMJLaiOddYNoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcrShjDC; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcrShjDC"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so1999105e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789165768; x=1789770568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cvg7rKHXCurAjAcT4pFGeE48nZRdVOEueuK7tlHO9AM=;
        b=bcrShjDCOK8YWyBRjVYcXgeBjBybspB7wz9h/BQPnD02D/oDpSEjUcMDzBCzGB5qTp
         tkJHzKO1ft8uQWOKmko08sGmYKA41YCD/3kEb4LLUp4NMY5h0aWtFat4aKuGnSQIFQbw
         aO5zEfeDQnUgb+yeH5/pENT0DMTJIff9204v9wMYg5U3f7d3ufXrVyT6vTP7VcVei6fF
         Wwpf6zeVzAawFiKtw43BtJ8jHk2QYgTO1pabIQfAKDWHPa2Ng0dpdHfoCXUzNFPao5oe
         vx1DowqRwwBWXqRYG5puQW35zEvKkg6cbfsgyiWpGkJoavZHodhcuzMZcnrptXO7qQgK
         TrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789165768; x=1789770568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cvg7rKHXCurAjAcT4pFGeE48nZRdVOEueuK7tlHO9AM=;
        b=WelwHOE49KVfkeZu4oiDUkQ0dtNPxaH/RELcMhrvGbNLU+/hz5vd5km07Z9dwiH2No
         /2MiDevoHKy0UEDFfkTMHHdDV3HRzWVHHEu1DhnzvQJUqU5RdY8he7kZGPHAH3rLCPcQ
         d9h4KriUdaT942AsxA1zF8tSc8ywlz0YH6CBWfCjPTPt60jJOsuZUSiWdxtPEqK3a2Z8
         YR9XvqWrLWU2wQG6e25jnf+L8x8RujpbedNXUGkyGgPl9afLhMKykIWE6p0hvmnLGk8i
         opq0wcsi6sDq56O6ZCv/5/zOClu/oh1n4gb2SBlO27Gy/y5Qxh3wwvBK9UFkGanccS7x
         owiA==
X-Forwarded-Encrypted: i=1; AKwUvBwEWXSXbORQtXKOo7432jvMASnKx8N61ARbQObb1mi0rSjmAxCZK+0ogFc26/UcgA6juvTIou5gwMs/HIA=@vger.kernel.org
X-Gm-Message-State: AFuF++lcGyn6K6TytsZErrGylwJ3dSFzxb+1KDBPjmaCZ/6LnGLpW7+Q
	uuf7qkLtinnMdxqxEmk0Cxg+0pj1Fn5FpA3bLkzMErORYh6zcj6XHyf7
X-Gm-Gg: AYBFou0UBnGepB+tebQgFqKlw+XF4xvHo7Oqv5exGeXfNxKCScHOy11LqlgKSCDy9GV
	IsyCnWBXOOgW1QNFzjdT/jlrxWfnCoMl2AOwM0mLAVtnqCoNeyT4zOJRWflphyc5IvOxMq4yMHM
	3VzV99OwgG3u471lMJg1NT8Pq5PwrsG1l5uP+OcH9AZO8rHLH3aSk/aOGMTosTitiXWdfiLiyCi
	6nOk/pUN8n8tOQ4qriUV6wXFn9b7wXqGdzklHBVKLwZyuIsQwl82iobzg0ke/sSQXRpTZWL26kF
	m/2YC7d1VXCM4gCbwpX3gozKLjufYU9ytsVYSgcMviojmJEo8LqCh8M45wgyxl72ymol7SqR0ap
	BGwQcbRYRzoZlIjEvKcv90M7o4RFQznN+yFFrwQDQPKNkRiGb8USQ/MblQPO9Xhr+oYmLz3Heb+
	xRO++KDWuwLCI2+c8NKlXlCvY+y806SBRQwwvqdXqAOY441ylRp3uuudaX2o7lrJBgvn9DFnQno
	PPptfp8jLotiSfLbBf18aCvXkm+dFF2NzEJS1CS0R7/Eq+Z+9jyAN8DtuhvA2aNV1zJzfDtTEuF
	5td+WSF4V2fGy0yrn2AbIjihidZjsPj1Mc/s
X-Received: by 2002:a05:600c:1385:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49e61878ab9mr109894145e9.3.1789165768350;
        Fri, 11 Sep 2026 15:29:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60acff8bsm108970585e9.9.2026.09.11.15.29.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 15:29:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Dave Jones <davej@codemonkey.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Michael Kerrisk <mtk@man7.org>,
	linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: cdev: Fix FW_CDEV_IOC_CREATE_ISO_CONTEXT references in kernel-doc
Date: Sat, 12 Sep 2026 00:28:07 +0200
Message-Id: <20260911222807.7673-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fw_cdev_event_iso_interrupt and fw_cdev_event_iso_interrupt_mc
comments refer to FW_CDEV_CREATE_ISO_CONTEXT, but the ioctl is named
FW_CDEV_IOC_CREATE_ISO_CONTEXT.

Correct both references. The misspellings were introduced separately
with the userspace interface documentation and multichannel reception
support.

Fixes: 7ada60e36764 ("firewire: Document userspace ioctl interface.")
Fixes: 872e330e3880 ("firewire: add isochronous multichannel reception")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/uapi/linux/firewire-cdev.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/firewire-cdev.h b/include/uapi/linux/firewire-cdev.h
index 05e3aa8fa8bcbcd8e4981ef470d14fb9b941d51b..4f83d6babc92181ee969ef75b0b1b374616a3819 100644
--- a/include/uapi/linux/firewire-cdev.h
+++ b/include/uapi/linux/firewire-cdev.h
@@ -293,7 +293,7 @@ struct fw_cdev_event_request3 {
 /**
  * struct fw_cdev_event_iso_interrupt - Sent when an iso packet was completed
  * @closure:	See &fw_cdev_event_common;
- *		set by %FW_CDEV_CREATE_ISO_CONTEXT ioctl
+ *		set by %FW_CDEV_IOC_CREATE_ISO_CONTEXT ioctl
  * @type:	See &fw_cdev_event_common; always %FW_CDEV_EVENT_ISO_INTERRUPT
  * @cycle:	Cycle counter of the last completed packet
  * @header_length: Total length of following headers, in bytes
@@ -353,7 +353,7 @@ struct fw_cdev_event_iso_interrupt {
 /**
  * struct fw_cdev_event_iso_interrupt_mc - An iso buffer chunk was completed
  * @closure:	See &fw_cdev_event_common;
- *		set by %FW_CDEV_CREATE_ISO_CONTEXT ioctl
+ *		set by %FW_CDEV_IOC_CREATE_ISO_CONTEXT ioctl
  * @type:	%FW_CDEV_EVENT_ISO_INTERRUPT_MULTICHANNEL
  * @completed:	Offset into the receive buffer; data before this offset is valid
  *
