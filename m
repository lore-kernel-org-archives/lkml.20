Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7D43F1ABF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 23:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791588567; cv=none; b=HYtQl7cyjfH6CSDFGjrhrYh25n696DlZOXRQzYitH1OljL8cEh1k29HOHrRzMa46mOu20WdRYXvwhXBNajRWLu8BlZDJyWpQ/aUAfSDmG9y7SqGE9TpcJ06B1gk/oSUct5h1K6fQpzrR+NcIQUKayo14uW0ouqUEW+qQzwJmJ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791588567; c=relaxed/simple;
	bh=kMMHsn2tqRp2ZEQ99J7niLvGSpZcEMfzZzrLSnYsy5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lsUCWpUDJUWS3IKDpObRbZHV656mRUWexG8Rp25/Mezw7tL55GzLHvRSGLuulJWajkoYpR4g5ZGRb/5UuzLQ4S43iqNn0N7f2QPu6E3bNfkCfExoOm6LZJRja2pQYm2uEzxDQA4juH0b4jupQdQaQeEHH3H5St5h0eOG5R/GC3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMI7XJOO; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMI7XJOO"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab67ff8f16so94604a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791588565; x=1792193365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UvHiLUfan8B1R8Q9EX6DNQFDDmfCS3njUEGk4UoDUoQ=;
        b=HMI7XJOORKE1MiklM4HC6FjaF9gsceE4KBpl3bVL0wsSm8D2T1vbAiYKUO9XC4rKbc
         jTiwMtAZNd6L/qksIlzzKIUDdn9WwqqCZ/ugBOAqX8z8cFx4b/CvFAj9p7SBXffgIVsY
         7QEsjGZ+deFDSu8LP/PNk9xL1ml7LBgHi4mNAlBHnjoXp8dSc791AfsG6nD5eXM3WlS2
         K5RHitQ8D9ojkZcqvoz3hTApXpfgCoOclo0YEjVgIB/yVsRwi8Z7yuCXPz2mclvq2w6b
         E5DuEuzQpkAhnQldt8teWVIyLXuWj0rREAgmhlcrHYtwT686cH+urE2jGdHrwD43w6YU
         ckMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791588565; x=1792193365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvHiLUfan8B1R8Q9EX6DNQFDDmfCS3njUEGk4UoDUoQ=;
        b=U3Uug1znWK0E18Wdy0+DDG0dn8mwmVppJVyVLLASptKu0KiyxxeSrXcr6UZSaQvOlt
         YF2UULYhIqYur0BzDxFg9ENM8wc8duXSNDcXKXBDc9EReAPCaAvR4oKPx/hONxB0WZ9n
         72jnBzqH/2TquOsaz2Fc3+8n1aJSscorf6qGrgsWjSlD+zMZC2BySjdJZB8YMLwfhEmh
         PG84Jcn31ENHDTz3dCZSU2eRew+pqAwPPcolOcyJtI1xuPwM+XA4J4Z3md+56CVWZ/tE
         lq6pRzfU5N0QiDT2v74fOy3df+IkAxlli2p/zEdR1lldN2kjux6Si1VEsS05g3l93PZ/
         PXVg==
X-Forwarded-Encrypted: i=1; AKwUvBw+9NGO/6qI0+5v02IJLkPXFnaWowQ6gSdr1Vi56EiFkfV+hpIt3THLeQ2Uw3/1wcsAhKd/ySJrBC4tjdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqsx5rTpWpg3BJecLIwr1Nwim/l14UJzm9QL9S2OgVNOZzv4qU
	KC1es00qkNPB6rxMDs/k88OWv7yHrV189X+jUS0Is5JDkD15VTorsR8O
X-Gm-Gg: AYBFou3Y21ycbi2BjIa7wWaBA1K4ZIVEVMk86Gtx4GX7A/9rxtjTZiLQvYqmwGzFiwB
	UIkI9yk4Gib+0524v7/xtVoZmLCQLqdolmFT3PXWOwR1YRzyq7W+5tIiFe1migYkTWyMRu0RMPP
	WeR3bBmzIvhbaimMRyRbDryQpuDEu9ylY+iPz4/PoqcNshXBcIXI3dorpBoxdatd4HJqZ3Di6bE
	P/n8rmHgt0e5kDazSNdeWKBNDX1eT1BXJVOaD/uSNc63N05rP5XSPmSbzCYElcWt6H5Yc4oKu/l
	cwOmJjHIk/ia708phbd7KyavWEY9D3oXtuPBpZo3b9SmsJG30tSBH6v1xBFTGehvSKIrT0d3Jdi
	bg/XV6utgsBOw0qcizktWlT4BPk4vjpdJ+Z/72ty0o4/hPEX78eWUVyLuLYW/T2tADtVpF49iKs
	Ng/F0XC4qkvkAD3MABAyAo3h5ToHNAMF/69jO9MMOOh5cdsNJ7PIkVjSS/IqMEFcJ5WFkYLsQAW
	OfK2j74hjD/eFa++RK6908n9ZtA49LtQWbqbqNBTEF+CbylV49H7sBF/7YYHujbjf6sSMApwBb3
	lY//Rcrli6OZfM5PFChGuGNLXqkNZGQxOFYEXRFdH4hdYpqjsg==
X-Received: by 2002:a17:90b:3c8e:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3ab3ae696c8mr2375695a91.51.1791588564913;
        Fri, 09 Oct 2026 16:29:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f2f866sm7121939a91.10.2026.10.09.16.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:29:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: boot: compressed: fix the vmlinuz link with ld.lld
Date: Fri,  9 Oct 2026 16:29:23 -0700
Message-ID: <20261009232923.655907-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ld.lld cannot link a 32-bit executable at a sign-extended address. With
a sign-extended ZBOOT_LOAD_ADDRESS, such as the BCM47XX default of
0xffffffff80400000, the vmlinuz link fails:

  ld.lld: error: section .text at 0xffffffff80400000 of size 0x35a4
  exceeds available address space

arch/mips/Makefile already avoids this for vmlinux by linking at
LINKER_LOAD_ADDRESS, which drops the upper 32 bits on 32-bit kernels.
Do the same for vmlinuz. The address computed by calc_vmlinuz_load_addr
is already derived from LINKER_LOAD_ADDRESS, which is why only an
explicit ZBOOT_LOAD_ADDRESS is affected.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/boot/compressed/Makefile | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index e0b8ec9a9516..ee554eaaa18f 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -96,12 +96,20 @@ VMLINUZ_LOAD_ADDRESS = $(shell $(obj)/calc_vmlinuz_load_addr \
 endif
 UIMAGE_LOADADDR = $(VMLINUZ_LOAD_ADDRESS)
 
+# Like LINKER_LOAD_ADDRESS in arch/mips/Makefile: ld.lld cannot link a
+# 32-bit executable at a sign-extended address, so drop the upper 32 bits.
+ifdef CONFIG_64BIT
+VMLINUZ_LINK_ADDRESS = $(VMLINUZ_LOAD_ADDRESS)
+else
+VMLINUZ_LINK_ADDRESS = $(subst 0xffffffff,0x,$(VMLINUZ_LOAD_ADDRESS))
+endif
+
 vmlinuzobjs-y += $(obj)/piggy.o
 
 targets += ../../../../vmlinuz
 
 quiet_cmd_zld = LD      $@
-      cmd_zld = $(LD) $(KBUILD_LDFLAGS) -Ttext $(VMLINUZ_LOAD_ADDRESS) -T $< $(vmlinuzobjs-y) -o $@
+      cmd_zld = $(LD) $(KBUILD_LDFLAGS) -Ttext $(VMLINUZ_LINK_ADDRESS) -T $< $(vmlinuzobjs-y) -o $@
 quiet_cmd_strip = STRIP   $@
       cmd_strip = $(STRIP) -s $@
 
-- 
2.56.0

