Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325C437418C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636586; cv=none; b=MOjDbVeW9y2n2W6TFyJc0EcBrGGUwoXW/0rpX4FBZ00NUKx6LWcxrqPoXIwo3YthwplCNB/C356CBRn2E2ooDdjNbOYKEuiV3KR4pI6YPt5RxnSq7Y8QPkECo/kdleSMpcQSsSsFNk85FwwjM6d1iYipeKl7mf7Ryqp33O9d1NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636586; c=relaxed/simple;
	bh=q2x0WUHz2r8ueAKqk8Cn9VqXFBZAzyHK+DfKvxu66yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LIH2WmMk9nyW8ZVzlMey5BJjpW3JKsd45cvUWqNndA0Cgkydg8KaAQvjGZ/UA8QAwRRjngjEkqgrp2HgRAVEmmpe8PexrmvrTuSFLAlOs7LUFdCr+MulB59xRFhfpBlk1LWDMwMUskndrK/sUG2ksOQy57SRNG4vz+HURjg8GKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSyIAuxL; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSyIAuxL"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66f79f58123so1874621d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636579; x=1789241379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEzo1WzJ1Uxj/TIFMsQEInVmXuxuHLlSjkdBUICH5gE=;
        b=LSyIAuxLxlYC9L0DE3AP//fA9jN2EYDhc/0H7nzEkLAnCv/6T7X67Ziuaw/X+UyEcK
         H35KkuST3e1f+AIyr2I/Ur7xi7Ah3SlkWgogMNwc+ndijxh03aUC9WPmB5D1YH4lxQnA
         JgrYDZSUOsgIONndh/NWfcaZwZeBWpOoeV65+9bo+u0xjnw3esm+AEZx5OHwdkZBVw/I
         A+pBNHUqTh/W/WdJJOtbsd1voYjSfw2Kgbm2Jq2aoMlHsr3YrlXBVMy3YK9ve3Gir7lN
         mPMy2G5MYJGSfEi4S8IiRrIr4/M7kYnxUmFx+8ljy2IiEibAlC1uYsArtbg+RF0dKVNZ
         RV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636579; x=1789241379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KEzo1WzJ1Uxj/TIFMsQEInVmXuxuHLlSjkdBUICH5gE=;
        b=N3EJj0rdyofr3pIC0K36lGzJNvErqxXRPGCfdWpMj+/mveL78w+2F8a+k20zg1cNOy
         slQxEMjW7MGvB3BjuIVJWh+0DNPNwD9uCOSLefQ/rGqmE3eLt7o8DP5m7lj1Wn7jhvBe
         cvpYKXQ55nIdzIqizVYxbAwTW/SaEzNEO5Bp8f9WJMpWwiqW7xMs1b0y7uLts4B1vn5J
         lToxDPiXu8w5H8VCK78oAINBapmTSl5j4LcoP1z0mmgtgNLAYo/lclmYCCs1I09b8Cy5
         8PwSZII6c4jrFMhOH/eQcPP+gT+QkEnMGd3geWTptZTyFCnb4uSbnLZo04mWo01G4kJp
         LMlw==
X-Forwarded-Encrypted: i=1; AKwUvByE0Tn+XKSeeEoJDIFPVuRUAThgf93dzyExDYFRqdIChCLmpGoYeZIyz8UMJRvC+HaJLt0jlwXxHY4agXo=@vger.kernel.org
X-Gm-Message-State: AFuF++mEvcE+76loS6jbJPClZY5gukKlUTnMzMttpX1oR/a6+FO1KrNh
	dpMBk+fou51UYjS/4PEv72wMk0xIQvVxPT883A59yFDl6vhYWn2vdNz4
X-Gm-Gg: AYBFou0krBg00HM9SJ4DubS0oPjwNDR30QJTrkuvZo1FPcyoo5763CF2/R/wdNTecFD
	Kf0SB2Z7fZN1av88bzu8NTZ/vlblBr38BawU5AQcWeHvLKfLAHVZ8VlDygA6S5ZNDKXO0AHFniS
	0VEvRJWtMoZdlNw9bH1x47kYsxFTs9Dk8hHTQfa5ApoFaafFJ97lkbvI+ePj36p2OckaJHLw/16
	jTzMLqD0jEAQKwMZGoyazM/xRsDR6G/cY+tpR+2sIKe9UAIyELBKtufv5b5fxdj3vi2guHgliJS
	HYKAeM7zkJTMt2AhvplDBQ3pO2ijdUx8fg9fG8bOaGMyJ59bqlHtUltNC/XKHYL4e1HlCC/y3BT
	XTgeuGvLBPTqH2xHz+ttKwCOtZSPQiP2aPSL7/H5UfQWsnzmcN0j/q2z82q8rYGRls7ugxqycWo
	Sy7ngws0t1ggblE1mQ7+L7Z90TnlZubSo611naelExoi9TIt/7R6PJlSGKhBTJ
X-Received: by 2002:a05:690e:14c5:b0:667:5cde:6f36 with SMTP id 956f58d0204a3-66fc1bb8014mr3388782d50.33.1788636578685;
        Sat, 05 Sep 2026 12:29:38 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb47a8894sm5071491d50.1.2026.09.05.12.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:37 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:27 -0400
Subject: [PATCH v2 06/22] alpha: select ARCH_SUPPORTS_ATOMIC_RMW
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-6-83e8245761a2@gmail.com>
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=q2x0WUHz2r8ueAKqk8Cn9VqXFBZAzyHK+DfKvxu66yg=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E6WtGqS3pvKJfx1ye9TR9bu+rTb+tTCMxrC0+Nqr
 zmERf541/GRhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXMB1g+B/0deOFT/
 cfTA/8meDMFqTk8UHidPbMADf35Qc2X5RSue3EyHD2pv70ieHKQsd6TS+0Cqa5n4zMteB/1iYnt
 Z49VK/yAgsA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha has native LL/SC instructions (LDL_L/STL_C, LDQ_L/STQ_C) that
provide atomic read-modify-write capability, and already selects
ARCH_HAVE_NMI_SAFE_CMPXCHG.

Selecting ARCH_SUPPORTS_ATOMIC_RMW enables MUTEX_SPIN_ON_OWNER and
RWSEM_SPIN_ON_OWNER on SMP, allowing optimistic spinning on contended
locks rather than immediately sleeping.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 032c23f979c4..d039b7135d18 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -14,6 +14,7 @@ config ALPHA
 	select ARCH_MODULE_NEEDS_WEAK_PER_CPU if SMP
 	select ARCH_NO_PREEMPT
 	select ARCH_NO_SG_CHAIN
+	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI

-- 
2.54.0

