Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4759B3644C4
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719998; cv=none; b=BDGFycGigpKt8qavqlWZEonNd1+/+SdpMaW+LqsD7pEWoj0nE46B/ctVbzv4wfgnlFYPSrOeiTbTJrLz+Sc+bzErIEzIt4T79W1MAAWmpUDeYk90ili1+gDNFpvZHac/ekLrag7LvIr9IZyMQfLVBBdXa26DNXJc6zbnxbOEUVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719998; c=relaxed/simple;
	bh=jEpIA7bvLTdzVcsHeIeLL/AF/RITcLl/fBmqh6A01Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y4GgWFWtez8Giz0tqhgBVMDFzyFFJtDf0ZSO17DJ7ai1mbJGdF3oaiGIbLSHlKFlrfPTMAtAATsTM4vx9WFCH0VKoyNib7T5/hIx1A6P0ROi+T20EgnwW1N2w7k/GPyBBv22YSvoCp7Lf1CdhyfwzWPIyDbQ8rDOTJ8P7w+ayd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSy+/20N; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSy+/20N"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b8687630fso23225315e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 11:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788719995; x=1789324795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pvfPoOEcmC8/94abbwrhnmtr6QM09GFHkRqzmkwOjDg=;
        b=YSy+/20N9Imgg8W9BJeMrFvoUmElIdfKy/lQBCXDYU6ezsYYMAm59PDE8r6opqbmMw
         uyqoVQJW1/0u0vBsCdIUFHZ3SP3N/aCZs8O6v98cYnNTKzf0W4R19GaTJdWq8suSpLm5
         6P5a49ZaWZBsOymFt0GSx8LDO5AecqGhqu73OXu8lNJb7BDzFCMVw5KsHUwZ8bnwTiau
         0rz8Y0KKte8fvn/oZZbOIEra/8o0V6QnhqHmQDN32ifOKSE+UFAXS95pHQRBoSlOIgvv
         FSGKzwLEIJWk7LGCNUKcW/ZVw932VIyNqCIjjTXUMZTzRtqmioRbM/noRDw91oyS8NBh
         fn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788719995; x=1789324795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvfPoOEcmC8/94abbwrhnmtr6QM09GFHkRqzmkwOjDg=;
        b=TZnzwO9ss+0bR5e3QTrDwAJ3WUNgSEly8hgApp5imA2GixHCR4WXDFGq+3hMnVnyvl
         b8cbgjYgbHwQdL5fCzJI//UtKxWQ4bhyL7IffmrJae7fCYCUx2XThC9BesZpQymGHG1M
         HWRtUaXgJkiVhEDgE/hbY1yqZrvtSzXDk2aTbNqmyzsM1RZDRHFZ9D83F9+UAUDu/lFQ
         hwi7jZTcB1CWhECbH4E08M00IHQscDG9W67N+I7K3RCcu5yCihr5n/DVjyFtaYpu2YZ2
         KUY4drvWaTDlXzSbAz0QjTsFqCw02Q3U2FcTcdKHDtRVt3D1TmpkQ7OigRuUW88oPPJu
         EiLQ==
X-Forwarded-Encrypted: i=1; AKwUvByKeAT26+vMdIZ2ClwgQOChkJgpMQnj9jZb3ncBlPOBRF3VDjjQgRU6Z4Z39/ylOPhHa/MqGGh+FamZ1Dk=@vger.kernel.org
X-Gm-Message-State: AFuF++mGid7awk9qUsxksRSBgHKmr7UlIj8Kj8ywZxqFtQftOFfIkibL
	HAJCNYg5B5yRq1063NObszN2oN9TNnHhoGd9WIEsESt+w76qTtQAEVsPsKs7YszW
X-Gm-Gg: AYBFou3qHYZ4wVjxV7nMDyj3YCjMyWyFrtAurGKqAwg/qjut/ZQmaUdib6ELiAl1xIB
	mLBrqHuqjDl6XWHsOXKqgtMCqDfGdGNK/JphfK7y2KJRnUsEzzZGyAp6LcwGcD1Dwpj1ZUU3bR8
	sfb9ih36GbX5MhH/aXj0j/uTYMecvpZ7ZAZ027BdwS0gzgcJSWixq+VDzOedQsMMkuiahNW3ej7
	ik0wS/WkdxsPwQKsu5YE1s9Q5Fwh0guzejkXdK/QQZDCD1EWxnzVWk2sCjEmvuAZszzrjkibAiK
	R4l0OKlGNl1vowyyUci5UY2+J6AEm/xxwomCY0VLiKEm/Pv7LrGxEDsG7prPHF2z6ZZdSFFQZcl
	OJYG7KpgWduwAdKFWo1iSlCKiqQ3g1AHjhC/v7al8jgAEo/f45hByO07WSpuEK+v+9jXNxMVR15
	ZJRuuCAt8Q2Oo21oHNxvp44x+c5ts1+qeEErgbn5fg9jmwT2LsiIs3puHP2IEE9F7dsfJaBogBQ
	E5Sz9Z+Mgqx0JwegSWutj/5UaY77c9juDgka5PsXqgexScK+f/zLrEIU7yODEkkCKhzKk7U
X-Received: by 2002:a05:600c:3b99:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49cf81fb72amr200414655e9.1.1788719995087;
        Sun, 06 Sep 2026 11:39:55 -0700 (PDT)
Received: from fedora ([2a01:261:818:9401:46b1:9fe8:a5e3:32be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm435571905e9.1.2026.09.06.11.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 11:39:54 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RESEND] x86/kexec: store segment registers directly to memory in crash_setup_regs()
Date: Sun,  6 Sep 2026 20:39:20 +0200
Message-ID: <20260906183942.103011-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

crash_setup_regs() currently moves segment registers (ss, cs, ds, es)
into pt_regs via a general purpose register (%eax). Update the code to
avoid the intermediate register and store segment registers directly
to their destination fields. This reduces the generated code from:

 131:	8c d0                	mov    %ss,%eax
 133:	66 89 84 24 a0 00 00 	mov    %ax,0xa0(%rsp)
 13a:	00
 13b:	8c c8                	mov    %cs,%eax
 13d:	66 89 84 24 88 00 00 	mov    %ax,0x88(%rsp)
 144:	00

to:

 131:	8c 94 24 a0 00 00 00 	mov    %ss,0xa0(%rsp)
 138:	8c 8c 24 88 00 00 00 	mov    %cs,0x88(%rsp)

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/kexec.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index 5cfb27f26583..ad7ef567452b 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -106,11 +106,11 @@ static inline void crash_setup_regs(struct pt_regs *newregs,
 		asm volatile("mov %%r14,%0" : "=m"(newregs->r14));
 		asm volatile("mov %%r15,%0" : "=m"(newregs->r15));
 #endif
-		asm volatile("mov %%ss,%k0" : "=a"(newregs->ss));
-		asm volatile("mov %%cs,%k0" : "=a"(newregs->cs));
+		asm volatile("mov %%ss,%0" : "=m"(newregs->ss));
+		asm volatile("mov %%cs,%0" : "=m"(newregs->cs));
 #ifdef CONFIG_X86_32
-		asm volatile("mov %%ds,%k0" : "=a"(newregs->ds));
-		asm volatile("mov %%es,%k0" : "=a"(newregs->es));
+		asm volatile("mov %%ds,%0" : "=m"(newregs->ds));
+		asm volatile("mov %%es,%0" : "=m"(newregs->es));
 #endif
 		asm volatile("pushf\n\t"
 			     "pop %0" : "=m"(newregs->flags));
-- 
2.55.0

