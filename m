Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491150;
	b=LrUNb5k+P1TTZ0DYYmOA5sQL/ftc6h3lMbc29ncYa+2MjApn1mTLv+yPQzN1Ju1+eDJM
	 5yo60/AH1LvOiWF4ojH9GmzwxOxcQO2kGUcNzjooOTWRHTy1+2KnbuECHw9UpGbL5gsn/
	 KPIIvEa5pJV7t8zK3SyK3aZuRIg9Z55N9WTUHMFNdZkshfaw9SAWVIcr1cUZggXkQRP3k
	 AlyWFZrnQ83GoTzdZzDAUpu/5ktLXJfbq3q3QKHlM2FvyUQ+/nvZyMNuFo71n4LWrWcAW
	 QTcWDq2F4hQJ4uHtbxAmR2Gvp6uoc/hjszjxfPk+c+OYZw1aA73NLLCrcqzi8dC7Jlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Tic+MEYPom4wGmvGcpAFFzdY5yD2zqiNNiMUJA9W8AU=;
	b=5OxL3Epq9GJ7o+1SIPE+NZBde/QzvBkhHhY7RYk5dzt1hWWbZiMZeDPx5WJSvg/sfhgB
	 i7eBjHHHcmYWBVGPrOH7+Y8Ut6tB19QLiErWbY4U4a/b+zGOKjoHJUttMODO9IW6Gm2T2
	 nNQyyLO92vORa1Gs/RUxEMCEZU4805iMNXnWXYalSMrhcPGfDTu9B84sF+jG9g/NXeU+c
	 Ak31f+l6hkLptB3uzneYpIgptP7hsyScvygyhZ9nHKgGtMwrZHFtqhpDxploAkeSOLClM
	 +t7lgSi8T1wDckgtBrKd3PihKf+xqNN5gn66ZJXq8RMePaLIjMaT2zOZ8rL3CKQJD7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pg2Yq7uB;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7708E606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7708E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pg2Yq7uB
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so31193645e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792491149; x=1793095949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tic+MEYPom4wGmvGcpAFFzdY5yD2zqiNNiMUJA9W8AU=;
        b=pg2Yq7uBwZ4rLYgg0bH0kNv1+PrYHJeCxIyiBlszinCVmWsIoa4XmSfARmmFk4/8/e
         BxRp1cdWr4P0eoUCXo0JRA1iTRT8U0WvTlq3q/9StEYFqqxGTzbDMqQVF6TAZ0pu/l2k
         /eifg8tG7I7UUpmO0iN17UgfZcfizWIqdnLRgHwxjxsfcaU2nkyEeEN39HbJw6gTE3pn
         bgH1aTxpKXVWOBggescUEQHhHdWEA4TqSvt7LBONIraubXCJ38E9MpqNMdviYkORtj7f
         XBVtw9cDNYUJh1lFFYRukTqa/EbTG+bQaEgaap8Tzy/B3n+VxQlQ0gY9RW8yosPNJsgm
         QPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491149; x=1793095949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tic+MEYPom4wGmvGcpAFFzdY5yD2zqiNNiMUJA9W8AU=;
        b=Mab3eX1ttFQ0D8gXAC6zmEhIiya8O2MYe4YJp4A6rh751zMvW1tQsdBYgclgJdwr4S
         oQN+aIryCPwcoUFOBzbZ3iOfGZ9g5zoXM4bU2wynB7BuP6krwQuF45a7QSR/r7dERn+J
         JLVov60MNVbOQiVpbs4A0BKTVdt0fyrrYPBeIGJ6H2oAgogF8yq+40xRPxDEX0RLCGv5
         0xJu8i20tNNvSf7E3k9fhniGsiPaG7ZGb6ROaS1ezRQTLnZEVZ0nSW7kvkQwyQKdk5yi
         zaNZIW6C3mDGHAz4L5oS93VyYn48BWjvDTm23lfaMvNgpyzbNaPDeCGkKApHrRThsSXP
         vTTA==
X-Gm-Message-State: AFq9FYJdmZdZ3lTco3GXdbZH1q5VdC0jSupEuVr984IxfeQN1MNgHPOu
	UeYiMCHNiIVMIo784/dqrej8HjDhEXqSS0P47cql1FMIvaHHceytKieQ
X-Gm-Gg: AYBFou3Dg8znkse0sf+CSE19bXOjhS9V1R5hvIVqBarnmX2D3ftnGEk2SMUIF0XHRb6
	CTo0QRaBk794Cy4dQm5e6YnL9FnSOqDPRHJhhWbo5ggEW6L9bi23KUgBuOd3vAHNVI1FM4UD2wQ
	+x6Xp2jf0LDIQ5mdw01oa4BodMOHZ4uaDplyY3/oC+oByXy5SasM321wnSai1/G4RjaYRXN13J0
	48smu76UzkuGpm5t+SFrxL9ivTJ26GbQ0365ihrulQu+eV0GiOMFg6swnKiwFBD7MWVyiZJ8l8/
	uEh3GQEPfOKZyB6t/lMK8dhM0vANpYxdTfmFrjiwL+fA4uNOqw0GCCHiOtxEYAnRG2yJkVeOd/n
	wXr0CCZx1z7HMIhRwkCYdKJJejEXr04XjHcOaDlGfA5xeoJSfVSKZYiRNJt3IzKaJAY/WQGtYZx
	XqY5UQWuPsC/uduWT+TiocU8Og/4m+8BtxSXcsYGsAmIZpWE6Nmf5mWzz4c87LGGa5rtzhfD7IW
	pBvMJb0WTRQXpg=
X-Received: by 2002:a05:600c:83c9:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a1d764145cmr197044785e9.33.1792491148597;
        Tue, 20 Oct 2026 03:12:28 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:9306:24f1:3e60:eff0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818c59sm5315447f8f.30.2026.10.20.03.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:12:28 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] profiling: fix sampling step on 64-bit big-endian systems
Date: Tue, 20 Oct 2026 13:12:24 +0300
Message-ID: <20261020101225.917959-1-thnkslprpt@gmail.com>
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

read_profile() stores the sampling step in an unsigned long
but copies only four bytes to userspace. On 64-bit
big-endian systems (not common obviously), this copies
the upper 32 bits and discards teh rest, causing
/proc/profile to report zero for normal shift values.

Cast to unsigned int so we get the correct 4 bytes, while
keeping the shift calculation in unsigned long.

A small C reproducer under qemu-s390x reproduced this and
proved the fix works for prof_shift=2.

Fixes: 2d186afd04d6 ("profiling: fix shift-out-of-bounds bugs")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

 kernel/profile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/profile.c b/kernel/profile.c
index 1fcf1adcf4eb0..e7defa90a34c9 100644
--- a/kernel/profile.c
+++ b/kernel/profile.c
@@ -156,7 +156,7 @@ read_profile(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 	unsigned long p = *ppos;
 	ssize_t read;
 	char *pnt;
-	unsigned long sample_step = 1UL << prof_shift;
+	unsigned int sample_step = (unsigned int)(1UL << prof_shift);
 
 	if (p >= (prof_len+1)*sizeof(unsigned int))
 		return 0;
-- 
2.43.0

