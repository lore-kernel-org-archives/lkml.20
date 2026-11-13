Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532016;
	b=qwHsR4n9OCl0SrW9uJj2NYOB338SJqExqbdMfKzBMzCIUmd9tv4jGfKopQJ+kKZEXJOo
	 rY83/9iPuXG2Q6lDPUxI/ln51UFngGpDx9kV/a4t8TN1pjV30l95mafTpyTRbfyQBIl2j
	 ZttXN8l3WYGBtgRr0+9EXm1Y2Qb6ezX2b+9tOHVua9R+t4KD9TCJHMwjArKbQaN/Pe4/v
	 f5ELKZUbmuf7pivzt2ZzJKUuRRutCDAYBaXLBab4tvN5lDhx2gvyAl8/HZamTnJRhoeqS
	 TQ2DjoWSvTC3uLYSTaz98fUsi9uwkdGv8OFxh9PY1Rne6RIqFMuBRQq/NJjOLQx1Gtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NKYkMYlyfAhnpmLGIPz+YvV5NZYvXGnBV/EqnVTYPBE=;
	b=AjAMK9j+FZ0oqdluIaGAXFUO9rnKRGSFiPAWmVRycOroHHrrEUOr526s59vymIC8Y8Hj
	 BVKmwNwnh0ZphzI1pc+QgQHrqnHy5XEcBBI4jkORi9Hs5RwXjKCMobPMZbsFHhU5JJhy+
	 OrErwcRSu6kX1IBJp+PxHjlQmjSF1rYyXOubGX24M0YMsPnvta/uUtBQcL5OX72/9Apqj
	 t5AwtIK5KYL1d7oB6r8iZJ9qWobcbfLP+PQ7mKVwD96ebosolgAIJRr+hn4vEWcVKKWKZ
	 mduk8HMdOGuvdVdn84vTrTYlodSjA88v2WPeecHXTRLNTF3o08TLZFfb2KYYAvXKMxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cr8fZ2aK;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D4B606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5D4B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cr8fZ2aK
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so4741561fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532014; x=1795136814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKYkMYlyfAhnpmLGIPz+YvV5NZYvXGnBV/EqnVTYPBE=;
        b=cr8fZ2aKKl+jX6+FGaoGgEqKP58dc4B5wlHuh6HMnVqeZ6kxGdLumjcHY6VWW/5Jm3
         WuIrnoQuajJaYyT23NkQZ9bQlZKXHJSTesWZV+T1Us7rECUU6LrkEmfkyfOywMB42aCm
         6F1tVH3Lgv8RN2TwLakGBP7c2FeZZUrnFoCLemf4PsibDwaQ+sldNgwy8m9Gli2pF4Hp
         8mKBITEG33tO0WG9YcHwwvuqF31ZxXkIhZhCQ63ruEDyArY1DQLOX7QPHAZgVGVWWbg/
         PFqpEHIkXIpRU5ns+TwYaflfmU/obqx1vljy9APhnGzcYX0AR+RdtL+2PJXO8bourh2u
         8vsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532014; x=1795136814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKYkMYlyfAhnpmLGIPz+YvV5NZYvXGnBV/EqnVTYPBE=;
        b=ajafENnMNCXnDJLTAtiyggvBX4Rpk8PpY4Qs1KYXqJnqazbnB+PK5cDM9voU8la5+d
         GXjBD/JWy9/JAnV6NSBjezEZO7xHnfv/5npWIutCO0mzSDCFLTBuEM4GVpjWqX/7hfkV
         OwpJVY8p2KAY6oFnAzINFawhcGdcUBsRbIRJC7B8qjygNk1bsbspqi0tvKEtstZnpunN
         4oJ7IW7/umA8Xzn/pu8iyWMzqM+/vbddQgqaz5Wvz7ohG5XX3xIZhkJX2riil6hXpTw8
         GjhLeeCbTIN29NhDS2XeyjOvE6FP6YwYwzyWPkpPpCK216vfnSe+EiNDKRr6kW+omRvn
         9k6g==
X-Gm-Message-State: APuU4Z+C2Jt5UkzipWZc4/qV1x/1Q43X4XJMeqouuD5JhIhswivyrVuv
	odUeQbTGPg/uk56zb0M+VxZQbmcNgpmeKRg+HVVWJVGwNLze2rdUYWNaRqoNqnP3Kr4=
X-Gm-Gg: AYBFou3jon1J0oS/WKaAsFete81PhEM1grXw1nmxrzW4lRjHdUv1ZhHrgY44lzBjzKI
	fFTWqdJ3XepNHrInPrtioM/aQe2mip+LvIsPL8rudQ3nyef5qVA+3xKPfkH7hSAWOmye6Oj/S07
	m290YoeMFAgbMhwguPfsmbocFraHLeSjbmWLUjQxwoz00GatSMzOPIHPvW/zKrQMQyU8Fv92e4+
	z0edS+TFQ1yvDcL0+qW9nLiDXkAYQSDRtc0VGN3/N7J6Mwb/+qVKeT4RVTYkBORg8nmsRNqNn1O
	3shToBF5NrfLWNy5hpKdDkyyuGyy2cnm/Ckpi9896h5XK94YrZt1oQTNKG5eEr59UYculH8nfAz
	86Kakl6nqIPGbmyHsmyYGSaZvj7J/vvhwNtAp+M4fMe5qAIbE+Rym6F/HMA/NrzajvSKc/NW15z
	L0/ilG2WIC9Dyc/6+q6mm4BX/nM3p0OTRdqM+vpXXnjB/As0mtIFwTMVjfDHjeA0vLf/o4taS7e
	75e8UvyzMD6tu3ekL2Z/medIxD1wSsnT2we5r+ZFMk0NbaiX+oRbQQEcnu1iZe0WTVa+Q9UjYi9
	2ow7kiyJYGXaT+JjM4Uu5TJ5FKU/fRmUPRojP8un+dg5eGdRxVRKmpxWw8lfWSPkfmnEd3wSF/c
	9YK7EXZUAbA==
X-Received: by 2002:a05:651c:b2c:b0:3ae:25c8:dc9a with SMTP id 38308e7fff4ca-3ae2b4b75c8mr3543631fa.5.1794532014041;
        Thu, 12 Nov 2026 17:06:54 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:06:52 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH v2 02/10] loongarch: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 05:06:07 +0400
Message-ID: <20261113010631.139191-3-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113010631.139191-1-safocl88@gmail.com>
References: <20261113010631.139191-1-safocl88@gmail.com>
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

