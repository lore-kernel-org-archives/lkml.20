Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F7A47F2EE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277896; cv=none; b=ddt0QhOcxX34uCiyWz+x2j7UR6g7onT/+O7mgu4QcTbmB0I4Uf/viDaUMUK3sN6kFCv9/rulV76TTXTA3MrpaVuSfm23UwWdA3PFThPKiF0ymwupuVaz9t4uExXK0LDumiXzo0f9Vhn33ARQqnho83VN8TjENyIybdYtUKmlJXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277896; c=relaxed/simple;
	bh=58EUbAW1MNlu65urN1g3z4QEvq46rAoNGdbCLIjROg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GHy70OaxA8W8m0tj/96sO+j5UNQFjXka7ZAFl1xxy2uCrwKn644zg4R5/Ze7feMsZTJD8JJn46sjRZtTj7UobvjeMYQsmqLa3Sr2TJnRoEaIk1tcLlEwmPYtmvGltEJBPjw+ZGJiIR578pkESZffh/eWSlpVn7H8jMlkv20yAYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKmxo5qQ; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKmxo5qQ"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-861feb6d61bso780337b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277894; x=1788882694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYpd3WpmV0q83zuG4LlVB9ab5azMP3BGi9fjKDmK0RQ=;
        b=hKmxo5qQ1oCxcOVtPc7yeIRj64krfGmwQYtEEyplnYsAX7Kq67Qd/VGNBQpgXAX5Uk
         lOiTJgQGPWZy4Oiq95BdHvHuMbUwimRLoQhlz8lruJs/vVeLLz0cekdhCYevD/XYx8kH
         Ijg3xPZ7VwfxARSVap096knQUMDvdyvOuaDbh2a4YNs8PEsJ6p4lshLTc8jZ+xqtoUUb
         5Q/ibAIhtrNLbscExBMvcbXr66Lp6uCf4FeAuammY2Lwxw2NWaGOk24DdBX2Da5DW0vU
         yo0afHqCyks1/IH7hlub57NedLMBgNZSxsO73wSO94ctYXGLAY+gOgonVeDySkM13qjJ
         XBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277894; x=1788882694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zYpd3WpmV0q83zuG4LlVB9ab5azMP3BGi9fjKDmK0RQ=;
        b=FFd3WljP5JX5FvP2Ro6/U3zLV/6Z0S/UySgQLwuf97ZGfvYJVOKN659h4kp7zlvLd1
         GC4dJKDMZks9buWr1thHLQYblzOBBYsTZ+l4Ks5ApcwEAhdDuQYIl0A8SLzNauvBACuc
         yj4NsxFyrSk242gDgVVfnp/qLjYgrgNRZHUBcsx0dM2ruSioHx2cvp3/fMo4Ougf+69Y
         r8AwgerDqmqLVTTw3SMDjSi4plUVDyfFbSVQ5fggUW71OUKtpStu/3dQZTGjCqAVVv/F
         CkhL+1r/z1UlNo2RMi524YCt9EUGeGcMLygPNdj01RFpULegxx4E0i/MC+QfJstaZEWb
         7JLA==
X-Forwarded-Encrypted: i=1; AKwUvBwtVNBYBBK09Rfqb3NLtUk5/uI+uqoMwlaBBnnRFLtXNPnSu8EEyhEsq48daaddBTHd+a33hVROXL+M848=@vger.kernel.org
X-Gm-Message-State: AFuF++nSd22R5qnFxTdt115lGvdnWe4Y4wTw7O52FfpU+lom6m7A3TN0
	tCH6vAFpNB6MrcP8gfJLtrrTLOAHdThwiklnNyRSevXbj3OzRfm/meA7
X-Gm-Gg: AYBFou0A5zcuzYZBsE5IR/tm5WO1UMLZA2VnOk7fBn+qTFld+8ubkta0bSeg0twrwUJ
	5G7WZtk+m8qj2+iWE9+JvzGz+/8TXVqRaXZTd9wsaCtUtpsHzc4s/ba9OjKdwYHExm1I1tOGWFi
	l4gYelni75F7d0gLh/R2u137s1mndD5jPD2nyVnNhTpWyla72KlOgSLDG/loG6psX7/sex4TR2K
	N7JzZLZl0zpT4Rmg6G6sukKnUjPxloavN/Khg7xGR4NKM6NU5JtVNVts09t4XZ9E70alj8JKdIa
	Xmk5gTYtUDapBvA6RYeIel5ueA2S4iFpP+JdM8irLzL+moU9U2pVpqMiC0Fec8lccWv13Xc1Dpy
	Sr+6xSdbUynNNSukyMOf8JUXRb1iMdVJMVPI19liiiZouIP2dgriGOct5jUBUmj3bHa902+cT/E
	RDOZcQtco7QPljxrbNTgSzfW6Y7UlN3yUbeK0VrTJLkTuCLSAOiyD/U8jTMAHaohHGMFjUGe0RN
	SVuykqKv/DZKJNGNsIajr3nmvXzloMBEFmXcdIB
X-Received: by 2002:a05:690c:e154:b0:820:1143:c024 with SMTP id 00721157ae682-8686ed6c46bmr39459937b3.4.1788277894091;
        Tue, 01 Sep 2026 08:51:34 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e66abb13asm76676017b3.36.2026.09.01.08.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:32 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/24] alpha: select ARCH_HAS_DEBUG_VM_PGTABLE
Date: Tue,  1 Sep 2026 11:50:28 -0400
Message-ID: <c3f15d6aa4553dca5c79a4c587c7df0da6cc95b2.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_DEBUG_VM_PGTABLE runs a boot-time self test over the page table
helpers: the protection bit accessors, pte_modify(), the swap entry
encoding including the exclusive marker, and, where the architecture
supports them, the huge page helpers.  Alpha implements everything the
test needs for a three-level page table without huge page support.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index d7e2859aaedb..87fe81bc4709 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -4,6 +4,7 @@ config ALPHA
 	default y
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
+	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DMA_OPS if PCI
 	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_GCOV_PROFILE_ALL
-- 
2.54.0

