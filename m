Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792634249;
	b=Nc02/T7PJcmzEbtd3JaG5ste90v0GBTeGBKjkENADBbjK+wgmaMcx6lzEz7QNUTEEkYh
	 GxsF4FlcH7FbIo/bFkiO6PcJgUZZpXmY9y2Zh9jzrg1yT1Npx5CXDUldcwOTWJiYFhclC
	 aHyCj7tSbb9HTLOKsjvYc7qJmTtRpS2RiOBkOzgHHWxkKjmCyNogxbusa6jJCXz7IwzIC
	 npfk+ND2VzIAxGbjHteXr7md5p8uTAq/aFQbXaAmxwqm1ZlcUsDZpfNSe+uD+AMPqCbpu
	 j8IbyHS5XaFkKzlXyTlOzeALdEunA8ZFB70GnsNzjI8NMX69JWe1F2a3uXuUWTkBLpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/p+8Vl7+8PhXJMc34NF0xrQaeakIDsKG9S8+b35h8GU=;
	b=SxyWJKey//W/56BwJJLxTotOX2PHlOs69yXn5TTGcHFKpu+Odtjr8EihqN4k2Z8Ur9GK
	 apbT12yEt/h8yj4UWp25pHGPfPYqYL7AG4KDJxQS5wi/OxauxKfyG09A4omud0UERHb9A
	 XDemqwyva46SUK3xKXOoOOvhy1NJLXxyW9yyYCaA/c19dg45MNEPuy/oM3Wg54bDxbvbH
	 J/VpuwhlVapNfhQzZ6OOXMQiPRHHCXtfDgjzLDnm6QH0krTXTIKyapwVZB56k3s3Euo+T
	 kcp1rGeZJHG3gd7HO6hGojo3+nHrpxTaf7e+7bSVnSlWULDLOgsrTUNFS2rLty5E6ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hz7IhKS8;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23351606A328
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23351606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hz7IhKS8
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8246b13cbso10212755ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792634248; x=1793239048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/p+8Vl7+8PhXJMc34NF0xrQaeakIDsKG9S8+b35h8GU=;
        b=hz7IhKS8JnGZgEIexGY3I/4re8TbOOzx4dsaeiqtAUO3Mlg2//pA7KdBy10wHrc/WE
         oQkv3BwN0H+jxhBBiDVnqP7ZwfcFe/Dxi8cDyAm0+6qK3rEA+Rcl2yt2on5K7RkFfAd1
         JjfV/kqtvP3+GekJ86lvyfLCOfqfl6iFx3ByUKBSkZqqEkHrve8O51W3bDBcuvkErXuh
         /WNVdOyxsOBwIwnKzPKYLibS8H+/yd9dtsUyWlLO/PUUQdtPF++7YKthKoC6GJwUm/GS
         Qwb9Ec4xTK+9kEgeBXfzU4KRlJJ0yqpphEfA5EmlI19T+diFkzHeCGq7ZMN2TI0CTJry
         Z0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634248; x=1793239048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/p+8Vl7+8PhXJMc34NF0xrQaeakIDsKG9S8+b35h8GU=;
        b=0mq1B/c7S0S2LPVrTygffmm72LdwNJu/OlspOCHRFAYGRf7XbvgoZsdfjHm3zU4Wci
         0t9vFMrNB/FDvwiZRJhdZZlcQ0I1C5JXhfFL5o6Xg1WjpFdZZCoZEPPjUG8c3kf2J5jP
         TWxTI5g4GEP/z+UPU/2RwkEiD2oIphCYQpxHcBKyg6kZb8QT7aYQVDNQJ3j8Kj+JY+uE
         z7kxksZkzYE9Mq07RhtsgEVoW0Fas6mmUMh+JcSqONdM0oWKphkm3EJ1ifgdCColT93i
         5iWgvOjDLGVU5f9wbrI+DdZDi8V9OyDgFX9ipTin9/zQX17ilbTEZWVqKIDPqcAq5E7P
         n7mw==
X-Forwarded-Encrypted: i=1; AKwUvBw24YC1fyD1FrKJLCEQj20C3HoFfMq3zA9Z1b/N56zxxCc4fFYtvgQqPqsbxZF6VkExsIu7g9z4UfoceaU=@vger.kernel.org
X-Gm-Message-State: AFq9FYInOQIkagpCW8hdV6Dgusv8Svt/mTBaAaNfPPR9jq7ww3G3he+F
	ex+q2i+gdpJOxT2GubwU/2BdcB067RaDrLGoU6Ab9baOjPS9+VopsU41
X-Gm-Gg: AYBFou26SZeiTSX8a9r77kgH1qf3rQSHrbyJZuXSipl9wamTpBqON45MEp02TCkoOqk
	+JYBdM0kh3Ut38S4gIZnCBqlKDQxPTEGd242NGsjS69W9xLOh1iJHQOeBotBS3dOMZE1Za2w9OS
	1AtQcDQFg8eh1Q0LL1vxilBZZRcG9g7XUgJ/yG9dWqWJgKY6iAux1HS4RlFhZWllXNRuMrRrGOj
	g2eQXL/ybXOFJc/HGpz2ii3TSpYklxYbC7AeRQ4FOZwhOdg75d24/KY6GXxwinLXNdNNUViMD19
	w9fNDJWPDLCYuWJJWL8R6AunxC76ORhsUjrLDQ6I3xdOJG6r4fxHTaRdtvyIS9mNz3ILv+CympF
	V1g2JKplCQcDtnAjqepJJr1U2tDTGY1K5fRZoP6V4wBO6oMOX1vjdQ903y9McdgtLFgxXYDzwqj
	wfbD5c+dLHlBIwrMPDH1iQcC7g+6oxyA/q1koIP75S/+zo2syQ7x1j48IaLQsFQmasZI9AYDYp7
	3uK1jAgkBYZR8ENbxiWTn8l1KUbECF3IuoAhctLcjmrdFMzjo1sOU+xXRzLKrdT8bQfJobfQ/7t
	Ir9UI2tysEHzbPdapVw3YknWaU0XJR4y6f1UwNfC/qTXF8qgplT+d2yF2jjcquhPnk1uknlw2Ei
	cfnOX7PAFkg8Ng0CW4p6v9Ms5
X-Received: by 2002:a17:902:da8e:b0:2e9:5829:9b41 with SMTP id d9443c01a7336-2ea43e20647mr33495795ad.37.1792634248345;
        Wed, 21 Oct 2026 18:57:28 -0700 (PDT)
Received: from coder-ast-ast-dev-ml-0.tail2dda0.ts.net ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4addfbsm16725685ad.74.2026.10.21.18.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:57:27 -0700 (PDT)
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: bpf@vger.kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	oleg@redhat.com,
	peterz@infradead.org,
	mhiramat@kernel.org,
	jolsa@kernel.org,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	surenb@google.com,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	hughd@google.com,
	kees@kernel.org,
	mingo@redhat.com,
	tglx@kernel.org,
	x86@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 2/9] uprobes: Don't run exit_mmap() under dup_mmap_sem
Date: Thu, 22 Oct 2026 01:57:05 +0000
Message-ID: <20261022015712.1297331-3-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022015712.1297331-1-alexei.starovoitov@gmail.com>
References: <20261022015712.1297331-1-alexei.starovoitov@gmail.com>
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

From: Alexei Starovoitov <ast@kernel.org>

build_map_info() takes mm_users of every mm that maps the file and
register_for_each_vma() drops it after the visit. When the process has
exited meanwhile it's the last mmput(), and exit_mmap() of a large mm runs
with dup_mmap_sem held for writing. Every fork() in the system waits for
it. Use mmput_async().

Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 kernel/events/uprobes.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 7709ea882477..6792004be6fa 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1250,7 +1250,7 @@ build_map_info(struct address_space *mapping, loff_t offset, bool is_register)
 
 	prev = curr;
 	while (curr) {
-		mmput(curr->mm);
+		mmput_async(curr->mm);
 		curr = curr->next;
 	}
 
@@ -1324,7 +1324,8 @@ register_for_each_vma(struct uprobe *uprobe, struct uprobe_consumer *new)
  unlock:
 		mmap_write_unlock(mm);
  free:
-		mmput(mm);
+		/* exit_mmap() of the last user must not run under dup_mmap_sem */
+		mmput_async(mm);
 		info = free_map_info(info);
 	}
  out:
-- 
2.55.0

