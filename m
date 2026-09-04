Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699923B2FFB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515520; cv=none; b=l9n/ApMdzL0al2EUrwoRAqLIOaiK1p4kCw8TcfhYjx4wnoYZRDKh7/NXXmIIVEtwC2kaNfb7uDCGZCP5XJTQ/4wApwPE5ql3Bp2kE8ZaUQQbLv+aAMpCE1+xfZ49D1O8Msrogg1VMeJe2xsr7yAlsYsPWCyOkB49xHo4oPBuMhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515520; c=relaxed/simple;
	bh=y/jj7dj1XTBqq0OOBBoLIE+SYQ1wVIKfO7ZtEWa5s0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=elhVKFNezXckDJu7DkLD3sGpe9h7GCkZeQl4ZUowbMkm6YPNZqMMVhAQoG3Y5cpdAksNj0RHJ5sgeZEpWdJGqp+RBlPON7ClVX+BBwMuiRtF84SdZYJ4tTgeQxwIHsXosFy1TTauNorIHpeH0kX6wRKkSeAejqGtaAtQ5viUZNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StGNaEYc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StGNaEYc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so9348675e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788515517; x=1789120317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cDFpOOPjaPNPNg1hiGAqAAUm4IOc8XWZHx93rqnlN4k=;
        b=StGNaEYcdFYFcf+Cqihh2jA+KIpwjG5NPqqaxwHQnrMetjqPGMJzkzzlmUkqre66JA
         EI+4mpxRTR/TLV4X8KrkV2vToJn8l376r8NWoctnXlzMdPkR+JDn7GAus/pJgOx0uv9c
         N+rIB+uAU/ZApTSEMhysQ50zwglRI6zCiQVwI/ygD9G6KSlpIG3DUOaMkCNUUTaTIG8R
         1ByOoabqyE0C3+ga8Fjc8rOdupBK/2GSyUjHxnwph3NS1QII/owBXMfqvbxuCJnZCH8C
         NfTl4s52iAIAC8kHh1pS4NLCkd0JcSdLanpGrcEW51BEal5hsHN9HL5mdOy7ZMn4gkCb
         G8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515517; x=1789120317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cDFpOOPjaPNPNg1hiGAqAAUm4IOc8XWZHx93rqnlN4k=;
        b=LZks8+ZWlq2JllrnvyTVeDV3e1+W+XN6/sRebu7nSkbScw6zwN1iPDd4ZEpsTHlySl
         uxjf5kjvs5V1vETxRnW02olttGRufFa/ouaDWq+WkzBS6bQKBQWFCq1O+NK2LJBIgneh
         HOxEgTzgLILxw5Z9C7gO3o7qR91x+A8sQOW/n8ARbsTuOgOXb1PajAqpVcMVIR0a2roj
         NYoBmJd0w0Ia2WK+/vBg1HLKDlydof/4WP/CRqwtei9lJRNohVyOYSTyy0Imqydma/fs
         PY14NepP3zJvsxKDnCDOEcbJWPPhQymXcawf2KCNHbieR7V7NlZtEPTKzlyenSPSVNwF
         RWiQ==
X-Forwarded-Encrypted: i=1; AKwUvByx0RI8e4Gm3Q7btTLG20eE0wXeYg1pJUjiuUkmtTKSH9j49frusjaz8HUdarvD6RSFmHsOdYBmxL9eZ/o=@vger.kernel.org
X-Gm-Message-State: AFuF++lINzQbuo6yPQmQPBIOuuO/WjoXbUYnvV3IoaMZoDXhvKnQ2J/c
	S90dTw0UAWj2Z24nGUiInEhNja9xKQ63h84USHs/f6jVs9dlcGIWJhM=
X-Gm-Gg: AYBFou3R6pDFM9KSvY5V822QLb43EzHUCMi1rkU7L980BMo7PQbsaAYvAbJho0+7RV7
	z29SkTISwD0epTd4TtdEmr4PBonV8EvwPkznA/THZDG6d7yClOObst+q2Jst7w+59xcG4D9ilOm
	W7+jBkd2d85C4Ytsuhti3gI8R7Km0t9AKOuBKDoLVIbAlqCBN/bNY4KWes/Q54aOxwQ4tXCIf6g
	WabRVt+F9vNvutCMYS94PnovWA3bThMLSPdKVsrAz73PzFP7W9kRr6/ulLzbAQGe3uKNDYP2GYN
	ghGKgRZyiKYdUq8gRLqpAHx89IXK63T8gxRDPTsHi/VyL0uhK/RYLPbBtNDhGxNWUVePFpGd0q6
	c7ebIFcD7k+AYnDqHz+HxK/hk8kU2Qnd93N9I2Sy1FyBzJ2pewjc0URUxbiwxicoYVUkYG6fBSR
	Ebzp38ruJyl/yRokz9Izr1VSjbkF+6hNKBmQwUwi4o
X-Received: by 2002:a05:600d:864f:20b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49cfc6e8ed8mr15440495e9.33.1788515516566;
        Fri, 04 Sep 2026 02:51:56 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47b9817sm170369845e9.1.2026.09.04.02.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:51:55 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] ALSA: usbusx2y: fix in04_last array size causing slab OOB read
Date: Fri,  4 Sep 2026 09:51:54 +0000
Message-ID: <20260904095154.3905899-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

The in04_last array in struct usx2ydev is declared as char[24], but
in04_buf (the source for memcpy) is allocated with kmalloc(21).  In
i_usx2y_in04_int(), when ctl_snapshot_last == -2 (initialization path):

    memcpy(usx2y->in04_last, usx2y->in04_buf, sizeof(usx2y->in04_last));

This copies 24 bytes from a 21-byte slab allocation, reading 3 bytes
past the end of the kmalloc-32 object.

The comparison loop already uses the correct bound of 21:

    for (i = 0; i < 21; i++) {

Fix by reducing the in04_last array to 21 bytes, matching the actual
USB interrupt transfer size and the in04_buf allocation.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/usb/usx2y/usbusx2y.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/usx2y/usbusx2y.h b/sound/usb/usx2y/usbusx2y.h
index 6a76d04bf1c7d..266a3483ab81c 100644
--- a/sound/usb/usx2y/usbusx2y.h
+++ b/sound/usb/usx2y/usbusx2y.h
@@ -55,7 +55,7 @@ struct usx2ydev {
 	int			stride;
 	struct urb		*in04_urb;
 	void			*in04_buf;
-	char			in04_last[24];
+	char			in04_last[21];
 	unsigned int		in04_int_calls;
 	struct snd_usx2y_urb_seq	*us04;
 	wait_queue_head_t	in04_wait_queue;
-- 
2.47.3

