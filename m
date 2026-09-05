Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4C53859D3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636589; cv=none; b=bXu316Efg5LKk9OnxTwYWFBBcvdRQif42GW5/iVANbsZanALUwQxdT8qFd/l6bhKj5Ky6su0te+6WEZaS/jXEiPTIrYw6Zjh0YSAqvRFDf3gPVqoG6a9hzRxs6Rx7TEapPoCO3Hw6SNFgaVW31JbJpMelMLYJ6F0dIG4v3aulj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636589; c=relaxed/simple;
	bh=scxjr4+0cYn4zmGgf8pkKMv/1ZeiH25c7BmJTtd/n2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Io27JaG+H2vB5vCSB5IT3bnCyV2Wwelw78vQou+UDl9Ae0ttTZd+1geLzXtGvORtLVoFo7Fe6wUBdxBX+d2jC7/JxkjuiPi4lKcE9LeqDmolE865fulRvbAuiphoAFry3GmScYW6jVm4MKnPcHoV0tRbMuiRfinOPgKXHFL2s0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7gOzHuu; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7gOzHuu"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66de7e0bc85so1717883d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636584; x=1789241384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oQOZf/UCZxMofDCIIROU3yxUPUPagAz2sXWLsnQLLc=;
        b=E7gOzHuuvaNjxqbr9XsFuy3WnKX2W6teY0j/bPvDX1ubbPYkFAL3Y/94NtOorpqr27
         mXlv7Es2ND+mE8I3Ie2pqVFQEhYXspPlOsyGbTg95S3SlvP8focx1qvxcpOWphtJtsn+
         u9p10XFryN0eXGb4YduYlWTzmTuGVuMh+JQXrgrIw9GcFT/gKXbQ1WyZoaDa2B2zxvgE
         XsKwMCPbLRXf7CtWr6rav8k4ueiJl3rrYKqt+Oqt97gqz86GFKiu5ui2vsKGqNuB91GB
         SWYOzmUS/nLs6LZxdXyiqBXVIoC6XlBtBXwpaeZOl7HVpi+OZ6/2c+xjUENqZ7xtuoyA
         JWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636584; x=1789241384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oQOZf/UCZxMofDCIIROU3yxUPUPagAz2sXWLsnQLLc=;
        b=Iuuwi5ECnqf0JdZjWC/SQNLIeDsKh5mFsJCCJOw6aURFpdIgpwhtlcq4t9os1s3Opc
         tciVzo7TyUQZYc/1uyFTfSISYBxHbwwAR5i6Akbs3GZN0FJJ115xvo/AU2MsYPTCoRRR
         df/jUyQLSzeCJxZNWQobROsr4CwYIlHjpC8G+3rNKLJeECIR0j4cwv2pZAogrx+a810H
         H3LpqYXfMz2pGeJmjkk8tZOQhvWgj3uIsONsbN8LLaxL1SdmQcbhtynhVum371R5epMi
         C/9dOYcSc4USSRs3/H5Rs7sLAkoJXWnDHLPoEDNc+i2tNAgirtOsXWe1qaHnObfRcUtI
         mcJg==
X-Forwarded-Encrypted: i=1; AKwUvBwLuVOQhPDxis5RBRHpZyt8Czc38X3HbIWyaVa1RqOOmX2qPB3Hhg7/2rPbCwOfw/Wwm6LTZSz0QiJHq14=@vger.kernel.org
X-Gm-Message-State: AFuF++nu2IKB8do2X3pCZXy5ao6apPCpdgdMRJcAiP4gLIBWBMjb0RMH
	NpXb/YSasKDWjOOgJlChBPLTgMSxfXktJfaUarBdmBzDfaMInQ9aOq85
X-Gm-Gg: AYBFou1kxftuexsgVqQ01KdW24jhS2aRhQL/Uv20fC7yyuYJLsBgVny2+78PvwyU15z
	U9tFzgkrpZwuc2TxGv/agLfGvfYLRmR7ijvSSR3U14bf1ODIwMRzeFnKKwKisGbAwehi+SWFiZs
	vio/B1mAk2hcA9UOLF9TNfU6kfyfNoHjq8Z5TomJ8fk8MWEUKnXiRqriIr/SG+FafN2ywYuOw1q
	mVH6PGoN7znsGZiDRobW17UXm+SKvmXmoY0KXBXifFQxclHnrUiTMmgM7iY2x1t6sRzlYe5rspo
	QYfywCgfVGAogg0Fx71BsjcebWaC+JbJnMV4A2a81BkCdnPbD4ZGKEzwu7hp4xQjuTXRH5MDoXk
	A8unDoFnzwxX5oXXxSbPzx70Xtsz+Pl72xq5EcyT6AbnzwkPK4hGVOx8ohyB1/4GI6Gtiz2sKq+
	tLmYoeVZ1SfolN7c8+L+gaUHaEvLyH/aLjbo8wt4pjmTyQGCpCw5rsR6TyuUT1MA==
X-Received: by 2002:a05:690e:480b:b0:66f:c1be:3168 with SMTP id 956f58d0204a3-66fc1be34e5mr1631449d50.63.1788636583656;
        Sat, 05 Sep 2026 12:29:43 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb49763bfsm5029782d50.19.2026.09.05.12.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:41 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:29 -0400
Subject: [PATCH v2 08/22] alpha: select ARCH_SUPPORTS_INT128
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-8-83e8245761a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=926; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=scxjr4+0cYn4zmGgf8pkKMv/1ZeiH25c7BmJTtd/n2U=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E7e9zn9BVPjPY/rPnynI0+9ZJ8osni52LobYt/Sr
 T/L72/u6PjIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhrghMZ/ofucApZt2
 Blp69wr8vLp/LLmvZ9cNyaXbNAlulCr1X1rmSGfypvb8UbfV6bbpcSVDDTKMD2ztW9Klfn3O/6u
 fa0nMjMCEYA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

gcc supports __int128 on Alpha, and the 64x64 to 128-bit multiply that
the users in the scheduler and in lib/ care about maps onto mulq/umulh
rather than an out-of-line libgcc helper.

Gate the select on CC_HAS_INT128 as the other 64-bit architectures do.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 2672971b83f3..bed3f1c8d9d2 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -16,6 +16,7 @@ config ALPHA
 	select ARCH_NO_PREEMPT
 	select ARCH_NO_SG_CHAIN
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI

-- 
2.54.0

