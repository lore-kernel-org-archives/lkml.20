Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772083;
	b=ggTME9PrErOEoHXn/rogiavAjGYHLNi54I/AEClJaMkHbFxZ7zLHSYE591INCpu7q8pz
	 UC363wo1LBsPHVHGq9FitnAq3f3eYA3LE+UJ9LkuebiQmM01ndDNHcQA5nnKDj+NvYdsg
	 Kn88DziYGkw8JtVYeEGuVNduh1cR0RCZ45rZh7ch4dhb4Hqz8Dtu2pbkP+pHUwy4o60Ip
	 c3XG4DR7lbunQN/pI76Vp1DzMn9HaUtHpZZF4puKZ/Urbcy0Zvxm9GcalptX3VQnlLb2m
	 LeGozyBHB7p0CpJP1qSS0fqwoOSmHgdXeoBgMuX03vZxe3qHor4wv3+Jmsz8L9M+c2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KPiMJGK/qkqqpPjkKhHWZSeBQJlH0saPg1nQaA1kC5A=;
	b=2PP1i8vawSsLGpgZrh0t8MIT0z5DmBSLMaMNbC8bli5C4rPeVUzZ8+Sr9KLmyMU17J6g
	 pcZeCqUK1MEauaq7MbBlJYc6yPyA84yYWrWpQ5u4NHRVlzjV0o1iDqTkIchM7Dwat7Y3Q
	 ft/UBnnYXYJ6QdLmYTWmvidacXObP3TiLBiEQIlWjwFIWuFzG0F4WkZ/faaBF8JIpoDUl
	 q6/bBQ3is55VSkCaEVcA42ipPCPBU8wXyXoltFYeKoo9jU3rXO4TNUy1lUMMjkhGXKdHO
	 EtEigs775ybpVpOxXjLR81+bys5WpR1te0o6MYbRqYZQBfRQR1FOc8F2q1vpyC0oplQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HRhYBU9J;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2165C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2165C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HRhYBU9J
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9cf928dc9so10136825ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792772082; x=1793376882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPiMJGK/qkqqpPjkKhHWZSeBQJlH0saPg1nQaA1kC5A=;
        b=HRhYBU9Jv3NTnOl7meAG9ivKhTXFtTM8B64mSzv4hcI/emok/cqoTPzVdQgU2PJmVk
         GJTdhRdnuvdMANoHLARugskAhbooktiTuAklamMfL18cZqxy8kakgDEXPPnHiaT0zFWi
         2cxMPmQ5HhL60TjbIzyGR2ST5ukqKUwmbeW38Xr77URkG5V8LufOfsDN3BmWRhWT1waM
         vR7+4/0DGsErOxZLLdKVAraYs4g00R4BghYKsikZL+HWUhHTnQA8WoXkY5GjCjstPgYv
         Hm1sTrM5rpjFT5+1JnZ+DlabHQrstZipyElaDWYXyAtEeV+rifjBWNkRydCbYL8z1NcI
         zJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772082; x=1793376882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPiMJGK/qkqqpPjkKhHWZSeBQJlH0saPg1nQaA1kC5A=;
        b=RMhUreNVjZMBnu0eZhmQtIu/4JFPr2t0+u99Vc8dLeNA5KTYKOH7OY0IcgMaAAB04I
         ukKqXa8ap5ipHFRC+MxyG+Re66aMknFZ9oEgaySiOBH7UDeIx8EFyyOiu9mcDVFAoz5f
         otj5qwUx10R8o7BHNh2K3kAyg62lsF4RR4oo/VjhzXcaN+zMAtVYrb0tTsglIe27H+/O
         kajZQhbMYN2umRqwDbX618TMpD0BpqXwIkDKDYZnooquXMIYsJeYOOZVXHRlWFfVlNhz
         Ww4XYBnSDtqgMGfw9DBVHQPLoeBg2o8iEHYLtlSU0B2S1HG34jZ/+V62a4el20w+NBwC
         yQLA==
X-Forwarded-Encrypted: i=1; AKwUvBxxp/8zzNqxY4RUIzskXuMhRr00jr0m+t7HKjqi+qCNnDyJ9jLI21JOeOT0h6aT5dRi0/1R6kEifxrlQMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlnv7oW8qU7TnvXkDsSouU+bVNs+u1WvuuY8rkwoE/YX/3v+6I
	1f6i5K3PDRHzm/62xwVYaBD7EAMyTfuE8R+5R8/I4YfXrXE7TfLKmKwU
X-Gm-Gg: AYBFou27TE+VnaN1NJO+4slFYyvVMlKUKRDkIE4WSoNJiLOd11BVHlxdZkPMJoTjTNS
	SdPDWfCpFIJUcSoKpd68PtDJ5PRzqKqYkEyuuBWUb2MrcNn/4EEF8zwgN2a9fMa54UUTxO4iU0q
	LApiZ5F74U5P0a6ByaWbEvegn3jcbIDDyZoBLp64DBI3Zu8BzaUFndVJdZITo/F1iHaVz+mivyI
	BKXmOUZDHsZkgltLJuPx7zedhJYvg9/lxdnsGEBZbAc6tBRvnA97iN+yfyuebSyfaGyuwZdPbgV
	6rEiDhc3tQpB6JKcY6FDvXIKUMpooagoi/nv/ycOYqAioO+Be5Vd3xp9hkmpY04BEZsm5qExU4u
	Trl+NIxs3vm1WUAH7HVWmZVE9HBXSJQbly2J6YL8iBF4JrfcCxKzr8NvjjW4HOpNi5FwG1WVPLT
	+gvrXU88IvN49CbE+QLsRbw/5Q4SteDHN6e520cnsxlnclL+pjrv4ZO7/BK5nax4RMhph00LI+W
	WkT2HeVPMCAVbmLYutfpbNINC73eKXtNRhJKlEscnialyJpR8QvIJyTBDz4NrrdGWpbrm8SzZrz
	g5QmTEsyTiA8JQZwYD/eskPJsN2B
X-Received: by 2002:a17:902:c947:b0:2e5:debe:cb4b with SMTP id d9443c01a7336-2ea627e3aa7mr39781775ad.10.1792772082355;
        Fri, 23 Oct 2026 09:14:42 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9467752asm2563375ad.1.2026.10.23.09.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:14:41 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	kgdb-bugreport@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kdb: remove redundant memset in kdb_initbptab()
Date: Sat, 24 Oct 2026 01:14:14 +0900
Message-ID: <20261023161415.61051-1-ekffu200098@gmail.com>
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

kdb_breakpoints is zero-initialized and not used until kdb_initbptab(),
which only runs once during boot. So the memset in kdb_initbptab() has
no effect.

So remove the memset.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 kernel/debug/kdb/kdb_bp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/debug/kdb/kdb_bp.c b/kernel/debug/kdb/kdb_bp.c
index c0c2072f5452..d3a6f865e953 100644
--- a/kernel/debug/kdb/kdb_bp.c
+++ b/kernel/debug/kdb/kdb_bp.c
@@ -582,8 +582,6 @@ void __init kdb_initbptab(void)
 	/*
 	 * First time initialization.
 	 */
-	memset(&kdb_breakpoints, '\0', sizeof(kdb_breakpoints));
-
 	for (i = 0, bp = kdb_breakpoints; i < KDB_MAXBPT; i++, bp++)
 		bp->bp_free = 1;
 

base-commit: fdbdd0ccb30af18d3b29e714ac8d5ab6163279e0
-- 
2.43.0

