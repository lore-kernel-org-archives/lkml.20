Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065838;
	b=DE5VnPv/I7sfFVoq2ZvwUnR/xhB36NbhULMNzg8qoF5ntslh+27Dtg1kFvg408bm6XYX
	 eKPZq3Tk19oTy4U54YwBtwTd8PcNY2pOvO69ygrKxdztG9PjQIDpiUMlAee0ymDpAnfH6
	 nRzkLREv4TRm8y82qfnAK6AW4Q8liOSaYed/CSbcMU9t3m+UG9d2RTIh8Bm3ti7KE+owJ
	 jUmyOMEixI/KBj8bNt8mDaXgNum4rVZdmxCYhLOGD9Ftr7+wCjvvPGZSMnstTWdZnXiPI
	 Q0AKLFODpCtJWrjCcrmNN1412BOIhf1lxp4AvuWjfOkgn1C1mbJoGC43yVVxyw8SPEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=pV+IB1n1BXqWgEv9HmlY7fFAWYiCGwOeQUGrvdEtK2I=;
	b=BKM62L8vGxEcvqyXRvJCeGqzTvXLEFJIWnsO5XHWZ4PcJw93eLDFuGYj1vs4tjNEio5M
	 kOTvYWbU42zJ7BrGa6SART46xw31FbvC8Dpa2OI/eEd6z57ntOLb0BoalAo5q8LyydkCs
	 f/sRxg1k+nzeMO/XoNPNY3rMqnxJTxfvsg1IIaJRQICdJsv4jHfQxICJKEZGqNkPjaa4X
	 AQKZXusLVwnXmBv7BQkcseJrYuhR6EjaKp1pGbP1cQPSus/JQxZCW+ITwgX7/wE9ZKSKP
	 z0FoFEvIS4RBrMsA8sbzP+811eevBsMDzx12X7FmJCeQV4EnQSJdhYmsc2D1DoKxw3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jj6PyKfq;
	arc=none smtp.remote-ip=209.85.208.69
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC8B606A33E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC8B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jj6PyKfq
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b706aec65bso460201a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065836; x=1794670636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pV+IB1n1BXqWgEv9HmlY7fFAWYiCGwOeQUGrvdEtK2I=;
        b=jj6PyKfq2kNUfnjM6ju8ll0Dfyaf0OfY6/KOnGvcGW88SY5UxPbjdik1xPDnSC6LGe
         fBuumWMVFt79TVduENQZ45QXrjeCgx/XQ7f62uxRrQINHHN5V/hMrhGdb1in1wXsLED7
         3xFLL7Ka6gSDfdWYkg8iLyLLKU+CX3R++AIzVwbTWP3J5Kecs8Wpg91Db1jypMCL0nu7
         GIQpIHfcJo5uGJQ7OKgh8e+6TcRvC51Inrx/bF2ltiogS16RVFDPIrZ0tEhRd7b5y280
         JvdgWXOJ7Af8nPK8bMonlG0COE6rOqNH7w+/6yH/RrxK6gbqn95XstYCBaOZAY50Kzke
         9b1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065836; x=1794670636;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pV+IB1n1BXqWgEv9HmlY7fFAWYiCGwOeQUGrvdEtK2I=;
        b=W3rPhYdDs9WOuTwQgtz4Vr3J6jJPWv+bMcdKWYosJzZVabboI1AmAhCig85xvlRRwV
         UFkr4WHaT4fb+TwvSJTabRjhluyRE6OD6BbfMLfAMmURn1u9nKCygw6ucDQanBd1T1UE
         UDPynyT3TaPKcnjUDVCFAo0/DxkT2VAXQ2vRKTS2cOKK86rTlTgPiwc93TpUBZeUA1tn
         0CsBshcEOWjhAuyJ00JsC6fO7zkc8S9m7Txp1OKbj/thBXg+ptpgXDJUCLjUNw8TptkV
         beHmsr/2AhUV2pNzML5MXYezR271N2SzDg5nVUGDUk+pXPOCsScGPr8GrQh0S8A8wkO3
         hBEw==
X-Forwarded-Encrypted: i=1; AL+hErEfo6DCGfn41/fphCN6ouiftu282BBsbEQoGzJIpj41f1JPhFQD2+9sitONegilO39QIrUqk/2jwMUxf2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bhEpfssJsldELUN4KgC5NWK6jZjv3NfoZJyErJDf6X9m1R/Lr
	45hCSCOKK4TD95wYzM0B9L6oV2Cn9QxlOGThdOXHKjwkZ0jdbUuL/+xjw8XhrpGmQ9qEqHekpOh
	acw==
X-Received: from edev7-n2.prod.google.com ([2002:a05:6402:a2c7:20b0:6b7:d74:97ee])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:916:b0:6ac:a862:d8ce
 with SMTP id 4fb4d7f45d1cf-6b5977d8c92mr3702096a12.7.1794065835799; Sat, 07
 Nov 2026 07:37:15 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:12 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-6-d84ea5f30f94@google.com>
Subject: [PATCH 06/24] arm64: Harden is_ttbr1_addr() on tagged addresses
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

When neither CONFIG_KASAN_{SW,HW}_TAGS is enabled, the KASAN function is
a no-op, leading to the check "addr >=3D PAGE_OFFSET". This is inaccurate
as CONFIG_ARM64_MTE=3Dy sets TCR_EL1.TBI1, meaning that addresses with a
non-canonical top byte would get translated through TTBR1 while failing
the check above (PAGE_OFFSET's MSB is 0xff), making is_ttbr0_addr()
wrong on those corner cases.

Remove the KASAN dependency from <asm/processor.h>, as is_ttbr1_addr()
was its sole user and include <asm/mte-kasan.h> from <asm/mte.h> to
satisfy #includes which relied on the transitive include.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte.h       | 1 +
 arch/arm64/include/asm/processor.h | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 83f3b05fc784..1d6113ae786f 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -7,6 +7,7 @@
=20
 #include <asm/compiler.h>
 #include <asm/mte-def.h>
+#include <asm/mte-kasan.h>
=20
 #ifndef __ASSEMBLER__
=20
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/pr=
ocessor.h
index 481f1999f7c1..510e3a3046bf 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -39,8 +39,8 @@
 #include <asm/alternative.h>
 #include <asm/cpufeature.h>
 #include <asm/hw_breakpoint.h>
-#include <asm/kasan.h>
 #include <asm/lse.h>
+#include <asm/memory.h>
 #include <asm/pgtable-hwdef.h>
 #include <asm/pointer_auth.h>
 #include <asm/ptrace.h>
@@ -366,8 +366,8 @@ static __always_inline bool is_ttbr0_addr(unsigned long=
 addr)
=20
 static __always_inline bool is_ttbr1_addr(unsigned long addr)
 {
-	/* TTBR1 addresses may have a tag if KASAN_SW_TAGS is in use */
-	return arch_kasan_reset_tag(addr) >=3D PAGE_OFFSET;
+	/* TTBR1 addresses may have a tag */
+	return __untagged_addr(addr) >=3D PAGE_OFFSET;
 }
=20
 /* Forward declaration, a strange C thing */

--=20
2.56.0.455.g6c5a503b38-goog

