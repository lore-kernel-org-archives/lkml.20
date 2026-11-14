Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675395;
	b=g7g/3WZ2w5dzkClzbGpuD47q9M7Xzy/iUSobRBA2a0pyZGlPoapBfYPWTha6x3nLzece
	 XY40nnYt3KEr9PIlgtC3+TFV2YjL7iIQRtia/pzy55tKlXxQf/0T89PC434mdyp6CAnmN
	 3JDIzgehdSxzATkQvcJzbF8zwLQXOkUemxKgS0f+umpr1qpNQouHXvwb/ZANKTYbhgxaC
	 rlEETacaKZ6AKJMsbBgofYQsrza9rrGLuei2vqxcnjoTvGqvKCglsc5zUrI+aq8SFb1Pb
	 2XvXC0BXNtpUhDcGQGjKbBVoZUpazvMzVeVeBX1WtGB3H45Q0mGv/WZCweJJMD37fAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=miuoSL/LBd8VdaEhsVpor+K2eCCoRMvUB9RQN3OlqTI=;
	b=4vYDAzWhig9T1m1pXhzLNnTIJiXQizoDrxws0nVt4s6RqUrAXR5vd9XzOVTDn1ye4Geg
	 KkaguM7DnCOQIvU1zsjRGdS27n5+c0XG6DSDRiiRwJFZP2taeM+ZSLDqA5zPiNZU+JPoO
	 9fpbtFOUVRGRXB1xKFI4Za/Z1ml+PREGAjoNpl75IpCYfPlLdXp6CXUGXQDj4UZ9CPEAR
	 inn+EEdkZqG3YlGzDDZLcoplqUZ6Xnx1IhZNK7mwNK5iScLwt4AAhDXmHXUt31GlYYerp
	 DYTxcDkCevIMzrFSSvaxyahzItOqG6hwOmvOIGwZKQ36XjyR+Ku7aVM0TsqlCcoqKww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFN3yaFj;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BB3606A33D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38BB3606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFN3yaFj
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c1479a959aso1843719e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675392; x=1795280192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miuoSL/LBd8VdaEhsVpor+K2eCCoRMvUB9RQN3OlqTI=;
        b=zFN3yaFjoYZk43JsQHrwvNZTX+RFND4fYF4eTxe0XhSlDwvLGk9cOO8JYD+y6WX9Xp
         cHoznCbpu+xDgTLsrA1qkOS7dJwKqGjSXkOAxb0pImnKs1Tt4DM+yxxP+vcrbB/BJjmO
         NQK3PFgjZJFhoBj7rMIuMqFIt8M8ZAmMVmFU1Mdn1aHOOISdgqWEz5CSxMjIddwAME5I
         Mwbf6WZ58yiq1pf6vQ2S1j2m8dTLCRr1tOZ5aBsAQESzdVicEJsinA3o88GxNxzz9U+J
         KSyQRwgor3iCH73G2aPM07kEsk5ntSK0qQEL8k8Yo7FkaKMJGlkLwjSBXSr63YXmC+F5
         Zz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675392; x=1795280192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=miuoSL/LBd8VdaEhsVpor+K2eCCoRMvUB9RQN3OlqTI=;
        b=UeIbTQFBSZb0vam8nhQjIcbj5B+8XY+2ZCLLHYb46SIVg1Uc2K+sUxgWX2WRIrOfRm
         sxrvicCSjMD8qLg/d6KNQMMKpf0oH68o/+8UZLGzkG28i/hnokcdsWznPqyyqAzEp+DT
         GfGFH27lE98uu9Nn5sDlnBAWh/lEuzzCIk+bmS66b20kHRCUd41O8RD4D78CBxXtgROU
         PHUeArpRNoiItbxRgkAokZMXjzgC0SJ9LdBaVn4akcQjU2Sd0FGD/7L2UDrLS3W1B0pW
         +1oWFBrmoUyxr/J8um1iqrlNzcFC6TvKz1OIhxumU4Sk7hUYaAedUN0P07RSjXCjsgOp
         0k0A==
X-Gm-Message-State: APuU4Z/nWw9q1JwMKBUBR4AVOX43aVJxwwywbQ6Coj8k2OliBu7+lQJu
	z2vee59YUUNcTVTKHtMmrgOG+y0QjhsG6LIWsw3g/MOY1W68QF27RI36ruu9WNAr3tLR+wYA
X-Gm-Gg: AYBFou0x38H3gmGF2LfFBdn7LhXlmx6sYkEFAjxXGqLXiaiMcBQu+yVVFfGbYhVmLFj
	JOFgD/pn1/BA/tOiE8CMZrHfVoIJF41EIFkvn+B95gERWr/OtSKwCeDyoa84N+kcjQzNbKZc7hS
	W33X3cU4/54yHn1UWvr0b9xu1ezXVM7fxspKTduomJBXC774VI85HbwX8w89t97q9Sh918/65st
	t2rFnm3iPZw0jIcKpVqc59z8XvDN2/Wed2KkDsL3GFVnFHawBfhGS25wdWvwXOsPVIs90R66mrg
	pq//c6u+9RBqiCsPdUiboGxjq17kY9Fc8+sVu6r1/XLKdh1Z19Jl4QdnlZ6tYBkQkx8dXNgMPRk
	jf7Cdu56medVqXv/VXoesV6AM55+HceHbLjZXq5UOW64gLq9nFTXKFQeoAtTeR1fRmVH1YwDNjo
	YmjqsUXkVtCyDdktTztmn3kmwf6fFjEpXeABwsknIMtDA8J+qj6ZUV181/3651C6SAQSYDfmfuC
	u3QOeRfEGu5UmQo9llTAiy3a6cBAfjOxq2k9FHdppjBGnXwwSPOIQsxtTAAk65GKV6cCsWjUVM6
	4C3/8aa35LtMzbTfhHu1J/UTM/hkmkZr3fJ6ugxHB63jjdoelnGXddccEwKR+gAqjfPtzqa58Zu
	l0RMpd+jH0A==
X-Received: by 2002:ac2:51d5:0:b0:5bf:b93e:89f4 with SMTP id 2adb3069b0e04-5c1709fb9dbmr2101390e87.46.1794675391487;
        Sat, 14 Nov 2026 08:56:31 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:56:31 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH v3 02/14] loongarch: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:42 +0400
Message-ID: <20261114165612.368785-3-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 arch/loongarch/include/asm/idle.h      | 2 +-
 arch/loongarch/include/asm/smp.h       | 4 ++--
 arch/loongarch/include/asm/switch_to.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/idle.h b/arch/loongarch/include/asm/idle.h
index f7f2b7dbf..9913191cb 100644
--- a/arch/loongarch/include/asm/idle.h
+++ b/arch/loongarch/include/asm/idle.h
@@ -4,6 +4,6 @@
 
 #include <linux/linkage.h>
 
-extern asmlinkage void __arch_cpu_idle(void);
+asmlinkage void __arch_cpu_idle(void);
 
 #endif /* __ASM_IDLE_H  */
diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
index dd1457065..c21a5b60e 100644
--- a/arch/loongarch/include/asm/smp.h
+++ b/arch/loongarch/include/asm/smp.h
@@ -87,8 +87,8 @@ struct secondary_data {
 };
 extern struct secondary_data cpuboot_data;
 
-extern asmlinkage void smpboot_entry(void);
-extern asmlinkage void start_secondary(void);
+asmlinkage void smpboot_entry(void);
+asmlinkage void start_secondary(void);
 
 extern void calculate_cpu_foreign_map(void);
 
diff --git a/arch/loongarch/include/asm/switch_to.h b/arch/loongarch/include/asm/switch_to.h
index ab9e0292c..aa5d3da68 100644
--- a/arch/loongarch/include/asm/switch_to.h
+++ b/arch/loongarch/include/asm/switch_to.h
@@ -21,7 +21,7 @@ struct task_struct;
  * This function is used whilst scheduling to save the context of prev & load
  * the context of next. Returns prev.
  */
-extern asmlinkage struct task_struct *__switch_to(struct task_struct *prev,
+asmlinkage struct task_struct *__switch_to(struct task_struct *prev,
 			struct task_struct *next, void *sched_ra, void *sched_cfa);
 
 /*
-- 
2.56.1

