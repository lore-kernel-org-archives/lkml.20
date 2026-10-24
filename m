Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874379;
	b=MrSx8OWp50IctKqALSRgEUA8IEca65JD4l/4egHCKlkSt3W3ZZLaH5JNkqh7Ih6gyQq0
	 YVyqPE8cDE+IA/waua82o09NFB+ev8N1UE+WTbeUSz95+//pU2kemFdGdKa7UxmTGr6TS
	 SZHQ6iDm9x59ZO5pi5VabvXLBgVz/B5tYB8sXdyCalPwGZB6n14aI/cRafWqSeRQNPBci
	 3BT6kz8xafBU2PID+F97UAQlkwpP5B6Z464DY4ZUGbkZL/bAEF3QMDXeZvEjatAWopzDI
	 /Q8it2wtr9Fgc9Z2mee/zaVlUYiW2kadVn3a8dIGO8VTEZc03Ns4BJwuJkwdhXU4zMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7sCcp9GVaRxjsnZJno3GxOc2KDrFHpoSBIpls8ghdgQ=;
	b=pofmRCbKeS+VRbR5sXGaBMyxRh9mkh2rr0dXwQ/SJUraNog9t7XXqZkdWbv4uccOtgyK
	 k6ZID02QytP9qWog2mrLUeM/GBfV2K6gRCWbk7ysCga4e0ubGtiXChzqFZI/MBLQqrTmz
	 8j6L0R2KZBUNmGU1YkCpp5eKAVX4ChAgmZEf1+lh3DDOZGvdeA2i0cn9g/wyaOcUocDUa
	 Rjl/FYDXKp7/zp4a4BTd321MtFN+fSrZ10M6Q4+o45lOXQwSrIO0n2LGqhFLpHu31Vqqo
	 SFAolwUkT5cokNz+8meHydeMpRe1RAHVuxYTCaM2jsD/hbwB0CATiV+H9hCi/Cu5PzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PMy7oqnb;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494F9606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 494F9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PMy7oqnb
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35c76e9614aso2965201eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792874378; x=1793479178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7sCcp9GVaRxjsnZJno3GxOc2KDrFHpoSBIpls8ghdgQ=;
        b=PMy7oqnbMqRkj+wlnM5ZI1BakhZ+3ZaFxEmgkOIziba4zAuFu8XH0mG5P5Yyai1H/x
         +QH+oK5OGdRNCa7sQFJV0r3uwyCNlybfzetfkXQCdSXhtWwMIYN4XSsw2/ehCbjHMx61
         /lUzF/kdZF8nGIwY8qI4yJ7YkI0kEqIe9gJBG9mvSHmV4lh34Kx9egnyECo+L/XAkAKs
         fcUAX3Fxrmtl7mnFyiR/AZrquRq8Om+TudZByRYZm5QWNl88CNw4UQ6U78BcJTtSRwcr
         b6Y3DoAYYNwhyJ69Q63fCQlrJaywk1UXgeILfti365/f0Sm1qzpquWykLni/Hq8wBnL7
         /oVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874378; x=1793479178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7sCcp9GVaRxjsnZJno3GxOc2KDrFHpoSBIpls8ghdgQ=;
        b=cwULDCz3TYRKI4BP7ABA6n0cw+Ruhu/GUerU1Kg0xvAV6vYRsKrUHhqlueY19MdS6P
         y4dK8xGh+sJlhODlLfwcWLQzDtTqRV/UGe5rLg31kqiEHqBLJtscOa0Kii2KL2+xQFmh
         0xcazFMJLfZ1VyqCzXD2XzLYzbr/js7ocp8WW+H32ELOllaub4sn0ZW2zdbQgaS2uwOY
         u9PXSllV1fhfuDGv94buYO+XvV4Um+5zmr3AxkrJHbFj4iK/850SUNo6RiPMYUEn65Vy
         +JZOJc6/ZcidleeU4cVPH5uoSJNqV0HtuCCLJfk7i2+LSH4j0m12pMrm8ooKoPBD0Qgl
         0r7w==
X-Forwarded-Encrypted: i=1; AKwUvByu5xv3cHYnGkLyDKai0v9pMoJX1QrxcHukN9Il0PklzZF083l9B78RfGdLqG26IIPKJ67dQyygTTvkLxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ41PsFyMqfiRceefuv1eyBZf19CVe/nz9fdG1OuQtEBjAU465L
	tk9EptXvMHAqKTLSLB/OvkLDAV56wCb1ghZMGv9STcW+IrWwSDU6BKOIg2Dm2IinGRI=
X-Gm-Gg: AYBFou2RJV5R7FmSzWw3zxQUT2i2454cZw9O3EP8EbBTICCfv0KTcgBaL6TVd79db1O
	fskC3qo6SgzGg9+Rf4YbyHQjlh+xBEaIARBxBULmZsOaentp44bbyjKkcbMCC85SCJXT0ayVMYq
	nG9PfoYCEh9d5eLJ2bM6v5M416Ubk9pm7/ts/EVvFU4iUY1sgD5WjUv6c2zSpXMKqTHQW1uaUxM
	Glw3l5tIlo+23MpLPl8TFvQczOag0ivD7bzqueY69bnXAu1zGF1GBhv5LMyIegnX/ttLEikY9/I
	LcHi3qRZfLpWdbmI6AIhUKk2b1ipBtd7dtpul4hG2Ezs+uu4Vdarhh7DNCiM64Cf2+LzC/c+HDc
	rAKhzfL6I1yjSTZ10WsVGM8ZMFEqJO6PzAM1DnUT6Y/R+KgetQSkv6x++CFoLeqGtEfdd10Se6x
	ASpdBqUSk40+D8GPTYIjQhA7sxxU1q6fnV1n+sRtcXg7wuFRgplFx7O3nvHFnLBzE8E0hACoSkm
	/6wc/p02g4NszHE3W1UCo5VKSTBNy2fbuYFNqoh56ZwwTe6ZspGCJo1tfdokQ==
X-Received: by 2002:a05:7022:204:b0:188:ecb4:489 with SMTP id a92af1059eb24-19937307a0bmr5814234c88.34.1792874378320;
        Sat, 24 Oct 2026 13:39:38 -0700 (PDT)
Received: from [127.0.0.2] ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm9764737c88.14.2026.10.24.13.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:39:37 -0700 (PDT)
From: Farid Zakaria <farid.m.zakaria@gmail.com>
Date: Sat, 24 Oct 2026 13:39:17 -0700
Subject: [PATCH RFC 1/3] lsm: Call inode_init_security hooks without xattrs
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-landlock-created-rights-v1-1-77c8db3f6bd2@gmail.com>
References: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
In-Reply-To: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, John Ericson <mail@johnericson.me>, 
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Farid Zakaria <farid.m.zakaria@gmail.com>
X-Mailer: b4 0.15.2

security_inode_init_security() returns early when no LSM reserves an
xattr slot, so the inode_init_security hooks never run on a kernel
whose LSMs provide no xattr. An LSM can then not use the hook to
observe inode creation unless some other LSM happens to label inodes.

Call the hooks regardless of the reserved xattr count, and only skip
allocating the xattr array when no slot is reserved. LSMs that write
xattrs still need a reserved slot, so they are unaffected. Landlock
uses the hook in the next patch to track the files a sandboxed task
creates.

Assisted-by: LLM
Signed-off-by: Farid Zakaria <farid.m.zakaria@gmail.com>
---
 security/security.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/security/security.c b/security/security.c
index b284e24e3771..bb94c94d97a5 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1353,10 +1353,11 @@ int security_inode_init_security(struct inode *inode, struct inode *dir,
 	if (unlikely(IS_PRIVATE(inode)))
 		return 0;
 
-	if (!blob_sizes.lbs_xattr_count)
-		return 0;
-
-	if (initxattrs) {
+	/*
+	 * Even without any xattr to provide, LSMs (e.g. Landlock) may need to
+	 * track inode creations.
+	 */
+	if (initxattrs && blob_sizes.lbs_xattr_count) {
 		/* Allocate +1 as terminator. */
 		new_xattrs = kcalloc(blob_sizes.lbs_xattr_count + 1,
 				     sizeof(*new_xattrs), GFP_NOFS);

-- 
2.55.0

