Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532011;
	b=AojvDmhxwU8RxyqqUy4dI4JvwVnzUomzYg5CY25WYLN+NkX7qZuFD+C9PC8H/QTuoKdr
	 cPJYLmeTkK8K/KgljSDrxWIlt3E8eE4CLVVMEyEjZfpiNWO60WepEPxH11ugHwuzsY5b/
	 ec3N7Es7V9zpJ7UNKVP0ctdKgNhIjgbNEgCSz3nIP7R/cUJ7Xe5TOmH0VuoOIPQzNt0ow
	 Ic1hrQ7zYL3jNn0mKlbapq1jNQN8eqnyVQdQaAZVcaqm9nqjtMNja06JOCHY/33jZdV4j
	 +dFoBivzr5ckZoLMa3dzD5f0Rxja77/3gY6kzK2YD0eE6f59ONAFTNWTl0LP537xe5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qsRcq006kznSbODYyPr37a0gzcSf2O+ljpuPup5IPJ0=;
	b=5Qmy/ma4VTt/LPx+CXmrQNrW4Zft4Wu5lBRB6apqWIfkV5ZdkJu5LCsnr4hCAAGT1FaI
	 xpuMH51unhMWx91L/xsTDstb3aQMhHyCuBrrpvYNtC0qJP10aDzrmSuSL3cvg1uVYibMa
	 ZnA31b/+f52RG7rcZsXyr27a4m9thpSPWL94BoWSDfJ5lGj2o2kahv2MMUbAAjCV4dZv4
	 ZYA5y6SlE740YiqT4QaaYy/oY61y5xzenQtHblxkyKJcPvaECkXnbORrlox3KNtWOlOJE
	 ihIaMh4psL1jttjLv747WStc0t2LKt7SLFj1NDN6nu5UyK1J8xrQc++LkhL9Vixj+gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUs5Z2Pc;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA66606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA66606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUs5Z2Pc
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so3841371fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532009; x=1795136809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsRcq006kznSbODYyPr37a0gzcSf2O+ljpuPup5IPJ0=;
        b=dUs5Z2PcWekw0bytilGUjpxAefF9gWqB0a64O2qBknbzWt3gaYFEOJcx4eLSclNTbJ
         D5QrzxnP2bNhcnqo6iMAMOYIAQual3brYLaiIKo5YOnwXJUUu56UpEtdbqt0dqtGumLp
         bG++fykzEQ+wQxWac08+0ViEVsZy522grqD2B5BaoQKXeaVlsU4Zv+Y/aKBYcAnqsVyI
         aA/aVFue1JDTKOp8L21gNxfNd8R3FZg+i2WDXSUFCvbsBNyu4Tb8OwvX/D+1cg0ixNIP
         u/X1DyRcCaqLNkOelSoaExcNxWxCk+rOvarjIvdr0jAWuVUTZh20tgefJ+aOzlMjcuM0
         LDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532009; x=1795136809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsRcq006kznSbODYyPr37a0gzcSf2O+ljpuPup5IPJ0=;
        b=dHUta+iAnyJFVSLZAh5k40L80yzGACq5dvKF0ayDPOw+J98P4LgnOyfEsjEeerPYHs
         RfVpUuOd8Tkg9vobob948h34y3tILZybqVxuKej+PJFcQosOt595hNPr31PKnx6+gZp6
         7Ju/hf7fPqvy8aAZP5qzQpg4efWNMgUYDEWxMp5liin+NS5wtGZiR/SXArSvGMIxPzwW
         YHd0+DfFE3LGlvsxz5wsb0Fdg3tYWjhWfpv7oRmvrEBHRgRthwC3sQkJkXQWdJ/Sj8W3
         4GN8zhvaKwb/7ZYVmcnKQ2kDAq2Qjb1Vo59t0mWgeiG3MtN8QxTu3BQqwWmJoM3OzroC
         RKcw==
X-Gm-Message-State: APuU4Z/V1WudLZcnhPj4KYYmZRdvncKtIo2EfKRNQxI4TpfxV9lW+OPy
	vVKMKJL2cF/YZsVjzsGI8chb7ryJTzOBbla48aJOCk7XZdLnWWJF4rho
X-Gm-Gg: AYBFou3KbZomKVi8z4Q0xxxyAgsB0lfs5bpGs+Rgr0QLktASB7oWaxNbPJj5CDSgadi
	zabDAhVj4bVfT1W/GZZau1R6IJf6laaxkyMN8hSjphMTC1Ts7G0qC0ohUXu3oOS5umBWgP6P2qd
	Nh/ISYuP70vW53a34gHtj9LkJC+t9ES+JnZQNmGhI79KVzGBtWvggba+jEvGmpnNsl2uvRzVcBr
	B4r/0yxWsQG35O40TN87fMkpFtHDbME7Hx5qlp0sOdffLPGMQsL27g30tr1IpOEtNcn3tOIvz6J
	4zT/+LBDMmKDFWOc7+6GSR50TLRjr5bkZeqdka4IrqSzCd47EU/Odh6Bl9PQoS6uWxqqhkey1ru
	neN9fxtBytdO7kE8+RIlksVGeolWItFLng4f/ht6ggitm7uStfXokP7iGoRJUlNqM2/EPzR4Gfo
	dq6uKloB4E3T6l7p1zrbZF1axfw1mV2IvF4JR2qGia++FojQ4xNDNEMtA6xKDCAJoL2cVeDHKGw
	eKf5Rl0xR/ayAm1ofMOX/V4NSHJtIxAccMMPGgxJYQ5544gnZcTyfO+5QR3atPKclt+T+dO+JXE
	rtQEtZ+r4qizXJpCWph7X/dKik8iS6G7ClMp25c7L6aoB7lZqyZCICmg79elqWBIj7BO7uEBHXl
	CyLl2+xM4PQ==
X-Received: by 2002:a05:651c:41d4:b0:3a9:8167:62a with SMTP id 38308e7fff4ca-3ae2b53f3d3mr4406631fa.28.1794532009135;
        Thu, 12 Nov 2026 17:06:49 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:06:47 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 01/10] ARM: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 05:06:06 +0400
Message-ID: <20261113010631.139191-2-safocl88@gmail.com>
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
 arch/arm/include/asm/bug.h     | 2 +-
 arch/arm/include/asm/opcodes.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/bug.h b/arch/arm/include/asm/bug.h
index ba8d9d7d2..985857d65 100644
--- a/arch/arm/include/asm/bug.h
+++ b/arch/arm/include/asm/bug.h
@@ -82,7 +82,7 @@ void hook_ifault_code(int nr, int (*fn)(unsigned long, unsigned int,
 				       struct pt_regs *),
 		     int sig, int code, const char *name);
 
-extern asmlinkage void c_backtrace(unsigned long fp, int pmode,
+asmlinkage void c_backtrace(unsigned long fp, int pmode,
 				   const char *loglvl);
 
 struct mm_struct;
diff --git a/arch/arm/include/asm/opcodes.h b/arch/arm/include/asm/opcodes.h
index 38e3eabff..afa29833f 100644
--- a/arch/arm/include/asm/opcodes.h
+++ b/arch/arm/include/asm/opcodes.h
@@ -8,7 +8,7 @@
 
 #ifndef __ASSEMBLY__
 #include <linux/linkage.h>
-extern asmlinkage unsigned int arm_check_condition(u32 opcode, u32 psr);
+asmlinkage unsigned int arm_check_condition(u32 opcode, u32 psr);
 #endif
 
 #define ARM_OPCODE_CONDTEST_FAIL   0
-- 
2.56.1

