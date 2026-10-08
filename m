Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEFD3AEB35
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791429860; cv=none; b=n9MS4fVVwXrcrPt7FVyVa6JbU3y7SH+oKx+6UNVBfb1YmFA+/Av5t6jQcWzdi6pSKIjK4hq0Oy8Gug5wVwKN5aam7UxyUOGIZdtYZVrTQYzTj5NvnoHPmldyfUjtzlcUtW/wdlk7LS8BE3I4wH23gmOvBZeYPHAgC/1nncuBMTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791429860; c=relaxed/simple;
	bh=V0j0CtHFz14eefLCzb5WnjuHMOvELhvyZG5FMWdbC7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aTuTI4VW3dDtrcVURg3V/Y0v+7wvm+Ltkr7yw7k1CTKOExK1Q9dQbhdaBg+X78VWMA1+/RfTpTQwVOQdqnmKyaxDC0hRNZNj804kZKXGzR1p/7QGYQsx3vNy21Sh0wCRQ2etG/9x0KBHh53E1q9iSderC5q+m/A03gY/7vdIrPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTgva39x; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTgva39x"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ab8d96d02aso27255167b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791429856; x=1792034656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MriHKHAtVmYbxeM3VmClVTN8DjjmybwnnSYqZ6iKPxg=;
        b=gTgva39xVjhw+WoFtBkTT6j+o9VRnBEUpO86VNKJNQi4347Ff7iVETALKA3SOicUwD
         VduU3LHrYH4PuWALsRU62mKoGGbHciLQUjACI5PT0X2AAO6nXmm2VHGv2C/t4v+1/YRj
         p1HBpfkjzbmypvSgeWrqaU3d6D/rMCMv1XetcYK2WEHM8DyyOxhcvSjQ8hugNfKlDNLg
         pFunD39CZR3WN1W4WJZ8wSSAc/c9+qxcUf30sPwY9mBlqDdOwuNb1kxfM+ui0DcptP5E
         s4tZ7R09z2aMlDHU2PBN+8SXiqZk3yeAhIUDe5obAxbiGsxkLQen9FhTX4jX2vWvQYNB
         342w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791429856; x=1792034656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MriHKHAtVmYbxeM3VmClVTN8DjjmybwnnSYqZ6iKPxg=;
        b=yt6MqGygZ64xq1BKt3yhsUAcrh7hP9LCwD4M0Ut+f7hWi8v1Lfad7F95MPrflvTq5O
         EWVAX3l5TzefTNXlZcVEcpyrw4qh87ztMe+wPVg6OA0Lxq9ij0cOzDujeFxbpQf6u6ai
         yi5gqR4uz1+yIrxWso+og+X5SRAyCQFN3fbGqiTUK0vts5K5pasttWvPAcaJMe/VQhx1
         5nNyN69S8qmo6Iw9GzA+MfYn4ccwlfaBD+qrdagbG0FFLFJkDWAqgVu/hTUkYGyYcprE
         z393WwArIQLjtkxPPwUNGrnB4KjDbSmFztXUWxW9zPUTUoqhLFhmo+0S+18Vc7uQ/fIi
         JXJQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1tj8XcMBW5bvhKW9vzKo5hxaERLkKTauuIKlIX72JV0j1Mn3Sx9A3ihmKlvwBFTb39yUzt5fy8ddF3xw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKoJu2grQQFZVljAif61pCs4OFSZBpLiyEwyN0iwCvVYEvuWEM
	gmeXbjypLfRrL1uqQueMZcqcwUJg7OkyCzNcd59N09Xne24wLlsOzNZBOvitsQ==
X-Gm-Gg: AYBFou2fHqT4jakCojPJ46USsuYmGbXw/BEGC+BvPd7+sgKBxbgqAoHBLSSWGEbAURA
	5/+hqdeiTSqOOspVG4da+CqHhiXUwZoUeQrREG4GFJDTd60+oJAjcnmIRclr4fy2cVVWJF0MqTv
	QsUgmFNtCuwA/LOLOohAvo9jBRGdGAznUrQXJu9gJ+L2M+c0A+4iKcFma31ras/yJACxprHgm3g
	goFzNhQr81xMKZjVLsFgNEbofQrhDq/BNYT05zfmZaF7v9/iahZIvU1DKSN9PC71CcIivZPXo2k
	z/slpQ2/5ONeAqZlQk9SgTkLCGMWMqNII/fPDJx2zb4CG3X5NwXPvnWNdLCxF5jqdxE+LVdui1x
	Uznx0sbaTYVN6Q6AM6hbIgdUxUKn8qXlpWrr0UHFT25BnDcQHMcw7Q3tvmC95+XYpwtwr7wWnBQ
	7PgwVgZ/JJFbHyrdzv7feSF9xNG7Um16rmPhnc5gKDZ/ZYkmUiLyUxLEXz8hbaP314HiiCFyw=
X-Received: by 2002:a05:690e:4393:b0:672:99e1:11ce with SMTP id 956f58d0204a3-6790a3f2c99mr1216790d50.107.1791429856466;
        Wed, 07 Oct 2026 20:24:16 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6791afa71ddsm748900d50.4.2026.10.07.20.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:24:15 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 07 Oct 2026 23:24:06 -0400
Subject: [PATCH v2 3/6] alpha: describe the PTE read and write enable bits
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-alpha-hugepages-v2-3-8e108af2d961@gmail.com>
References: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com>
In-Reply-To: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, 
 Axel Rasmussen <axelrasmussen@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2280; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=V0j0CtHFz14eefLCzb5WnjuHMOvELhvyZG5FMWdbC7w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKO81xp2W+T/zp93iuFqknnOELzavhWrbYrC9yzprL1V
 OtJeU2Bjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLlG2Zvhf0SiBfsqkx
 nTXnOd73uqYj1vmkTkHNOKV1WHWMpOt0/J6mH4p391xmmV/l05WRERtlMPK2U4LfPc2fnpWoecd
 FD0xMo2LgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The comments on _PAGE_KRE and _PAGE_URE said only "xxx". Describe the
four enable bits as the Alpha Linux PTE defines them, in Table 22-3 of
the Alpha Architecture Reference Manual: kernel and user read enable in
bits 8 and 9, kernel and user write enable in bits 12 and 13, with bits
<11:10> and <15:14> reserved. There are only two processor modes, user
and kernel (section 22.5.1). Linux uses the read enables as its accessed
bit and the write enables as its dirty bit, so say which of
__ACCESS_BITS and __DIRTY_BITS each one belongs to.

The names differ from what the hardware calls those bits on the 21264.
Its PALcode loads the PTE unchanged into DTB_PTE (21264/EV67 Hardware
Reference Manual, section 6.9), where bits 9 and 13 are the Executive
read and write enables (Figure 5-27), Executive being mode 1 of the four
the processor implements (Table 5-5). That is a detail below the PALcode
interface, and it is also the layout of the OpenVMS PTE in Table 11-2,
which is not the one Linux uses.

No functional change.

Suggested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/pgtable.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 8a175e0c2b42..d22e28b956fb 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -65,10 +65,10 @@ struct vm_area_struct;
 #define _PAGE_FOW	0x0004	/* used for page protection (fault on write) */
 #define _PAGE_FOE	0x0008	/* used for page protection (fault on exec) */
 #define _PAGE_ASM	0x0010
-#define _PAGE_KRE	0x0100	/* xxx - see below on the "accessed" bit */
-#define _PAGE_URE	0x0200	/* xxx */
-#define _PAGE_KWE	0x1000	/* used to do the dirty bit in software */
-#define _PAGE_UWE	0x2000	/* used to do the dirty bit in software */
+#define _PAGE_KRE	0x0100	/* kernel read enable, in __ACCESS_BITS */
+#define _PAGE_URE	0x0200	/* user read enable, in __ACCESS_BITS */
+#define _PAGE_KWE	0x1000	/* kernel write enable, in __DIRTY_BITS */
+#define _PAGE_UWE	0x2000	/* user write enable, in __DIRTY_BITS */
 
 /* .. and these are ours ... */
 #define _PAGE_DIRTY	0x20000

-- 
2.55.0

