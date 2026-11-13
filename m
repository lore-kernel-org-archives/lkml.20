Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528905;
	b=BXd2qTm/sWJqltlJEAizKevzK6U0i8tmeOjSVcwmAlWJSc4bow7Ycc79ryRE8TzjAvr9
	 ovNS6ElNB70uT0I7GJwEnEM6bAaFEZggskZ+jkPY4SNIya2x6fb/0twyK5bnEdGPxYR6i
	 M3Hn381Nt264OLNXdDDRjvcW6TpDq1bRoO6uiuJI6b7f2GKeEuIAlVD1BpiL4bKRqmJN4
	 VdZh+sfKjEcNj7TXAEkCCm5v+SWQPzlPVg3THAPLcdLJ5p786I/DdAZc/Qc303BOJsRxp
	 rMlCostZOwgHyQ6u0O92DtGtYox9+yRkm+Abk9bm0VtGJytRa9nisEkRhguTuEwsRXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=C0NwRK6L86ei0geUzY72MeQ4QYzIRdqu97OV6zihIF0=;
	b=XCO+vIhZAH7y569hsld9OS8weuVgpepFnMOrguEB1wvIwbOBu7OrFySc86yF6+PxYuWc
	 qXOCzT0lYeMdKo4qeYT/LIShlOBOMFWIaQuUgTRhKXGltrODgrhQQRK7JToJIdpQEyWWU
	 x6AXDyqVL4CiQkg7NjjYDuGAGFX5AhqTp0kkB2g5hU1pc2TSRTgAiY6mHpgHZM3uNH2Xr
	 MGRE+hr2TP7bocN/Gkp6/CSOG4nk8SHxtqEQsF53JihQiBs1NOENYsKfhfBC9IirJ/jcb
	 tjuUovcKqL4wEjp/y/tNiYWGtSBycNo31AdK1Nff877Qm7/nvIvLiOdxd5nv+MweubA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="c/NDYBhX";
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF39606A882
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FF39606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c/NDYBhX
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso365931e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528903; x=1795133703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0NwRK6L86ei0geUzY72MeQ4QYzIRdqu97OV6zihIF0=;
        b=c/NDYBhXSZxGIgvjeDXwDXCMBbHO+4vHQsBlPup37nnRPmnVqc1ggdmOQCBc4AMEiC
         vH45d/HXrwBli44TLYk6g/FvPDvRwFyptLkkBcxkRkLTINSwueOPRuxalD91kz9gRNai
         rLZ9eVXf+G0pBS1APPfBg+CAO801tPJI5me2DKNZUJYgBuTOH3r1/m0U9MUFXjYj0lUa
         +ESQXoVJxMFuZQqH5PvPDtffQ9waD4AvDvnV5su3netQhsDsYTz+mSElnVUbvRkhwVXH
         1vAMIOo7J1yHglBneFyeQUClH2z5NmMY9ZY1WSUGYPSz2ex/5L5iTL3ARP6z2uvOtWEK
         HOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528903; x=1795133703;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0NwRK6L86ei0geUzY72MeQ4QYzIRdqu97OV6zihIF0=;
        b=joWjAf+Pf0IZERRj4h9nXJZJ87YdLToyQ4L5slUL7R2C8RBZcmzvTw8VCqJX3pr9Bw
         +Il/eaTOR91dOEZUXFQn+tPkbEvpmNMg4vPn+z/NqcrjYy5ynjOyQPHJO4P8MQtFIyaT
         vP3cNrRIlvaVd2VAF7U8slKNRRD71fsz8gHPNeJbhCEoqEr7Y1vvTXrfDuSTysxquuZR
         JS/ZEIOj1JtQ7rzPRhNrC1ECVcpQiAqUQ0fNvbmIGt+1SmgFCvGObYLpJmaUlJr+9bKw
         itfn7uO4NeqGxU5X4f/8DQ0AcLv9OFhhFanTCQvjDJlzR469Xhrx9b30qu4LUErhpMcm
         tEGw==
X-Gm-Message-State: APuU4Z/1v4dC6L2dVHQexnw55KSG2dIS3H909f0k8TxCqfBbhaasslhL
	WTv42FxuPNUgWP8mUOAEKHK5ioI7olEyPZsqOM2Lxscxed4sKytB9oFf
X-Gm-Gg: AYBFou2/xAhuAXuk6NytgVR0zD9prZgl+9IgZRFc0drLoaHuizHlSLmEtGGdSv2OWSy
	SFQy1QIDTepYBlzsr2oO4aFfBbkUxbO5aInKRA+0aGWqBpGSApt1eckfuigC/yxK8vLahPhP/CF
	AXvTeelHmIjhoOWmyFKauJeDgmdyFeYjVRpEBpYgbfPsWsFCK+2UoIajvMZirQ30ZUha89J3cQy
	7BZYuq+iq7sZnqGoO1Nf4ld8R+Rv+sN0cKvZ3xXbBQj22CD7PIJYloSzasoZYk/s21fBKsESGZ2
	6ejs8zpymBMXJ9W5k/6ic7aM/2DeeXtrdqsh1sATATu05ig7k1J4Yo0whac2ME4gfmyTOLG10OS
	SU/oHQVnjU+dfvFSXSkr+N93vGzhXjwvXezqfOfR9StNYG3Ju3JoUENzSHxRSNFvKc/XQIzpYvM
	G9YLOWCFUxN8pSXFhEVcFdMYVlJaIW7A4uz5GU/+T1F6/mbMeVc+FE9RcibJJfTZOxf3VUnit6m
	OgSCLlw81aq0pPT5ex764PApsYeUsKsDWH+UgQ+i8HqBo86gyXiYoqWwTPs2ThwUVImQGFeZjy4
	deL9zacM0f9zzgUfj/73EqwY2kYPteEv4goXel2hNyKdUtXpNRxN1M6icJNr65bntaGz83562BU
	cHgrDJ8Jesw==
X-Received: by 2002:a05:6512:2302:b0:5c1:4974:c150 with SMTP id 2adb3069b0e04-5c1709c44admr353851e87.51.1794528903101;
        Thu, 12 Nov 2026 16:15:03 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:15:02 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/10] ARM: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:07 +0400
Message-ID: <20261113001432.128201-2-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113001432.128201-1-safocl88@gmail.com>
References: <20261113001432.128201-1-safocl88@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compiling a kernel module with a C++ compiler results in a duplicate
echo ‘extern’ specifier error.
This occurs because the code contains , and
expands to  when processed by a C++ compiler.
The  specifier must be removed.
https://bugzilla.kernel.org/show_bug.cgi?id=222257

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

