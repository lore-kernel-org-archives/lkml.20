Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC4D3F4827
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818081; cv=none; b=fcLgNkqPs63RFrGkka7iYZop2uc5WbiUYjWiIgCEw0tgrHinycrBS4YwS0PqcNw3aoRYd6o2z8di89/ELJXFOT/2iENnM20EdWxMhjIQ+6TdLE/AXOsn/5PPA205MdKCLrsM1AQsRuN7hiOw1HtXbRP8DDGQ4kCAR3xY79j/4Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818081; c=relaxed/simple;
	bh=ATzllCN+dDw5CaRunDgFMLiOohABpMDjBm9gAA2JbL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=txpMYPeEbnQlMSceOQMC6X7GbZDk2uXkJHwIPVzhakScQCa7AU5+H8IGjHp4tVM0BYhAiD2coVsIm1+zDPgb3Di9pfK0AxF4wCg8VEHh4uBy6CV8X87PvuwOAkLQ5HEnBvLJFVO/cVABGdA/+2IbtdKK/cvf7So9pS/unKMpO0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=kRu5icKf; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="kRu5icKf"
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4149D3F322
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788818074;
	bh=fRpckaKOwl0Kgs7K/gM2OB7RO7urUAj94CqnshB8/I4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=kRu5icKfUEUcmvwaKio7cmGGXWebNI9AbOdiVcfdEc3UeR4Hvbq/QCmhfLjI5J3Y1
	 7BhNDcg4dLCwQzoIVntelMxGictKU1hIg2ouclc1olE3y168lrQPy78R8faOl7kB00
	 y9MIS8bM6prt+jJBpChPHCQBDA3XzyIM2KefFXmXJcoUQ+xvIDf/3smoyEDItINtxT
	 DEjecywl0Y7ijg0gi59NlebztCgnbEP9RF6QhnDx7M/fvLhnKm+zsfatzIEhuuXshi
	 xh2dTgg5tPmA3/7tOb/be78LMtGonA+UKSDSJCLV+s+5UCjgPAEBQJ+iZit5d0kN24
	 mDTr9bwUs0c/aPOyTFj3CfRvAZd/scZbW6OT/w3qccAgiRo0FtrOtyAF11Oa0Pmrlq
	 Q+1rPhoKxmePEZPSt1p4MuiQ987Rj0hcP391N3DITApRl83kJs0kb9EseUWFbkyDhC
	 3unbhfNJsPmfOoNR/mlQDvmc3xdCdnIjZ/IksvMRAQyRDpd3xbPK8IWEOpUBK3wQ14
	 As0NXAWoc7Ic+DwqLokvCsr8Jop8NI2yUK4IVgFyh069MW5P4WvRsQXIO2RcC2V5PJ
	 VBkzNbhV/lvX0ERDXWzWYYfIUpU5x59anBAdn1jTbUfG2mHuUjDvIkGpDfpuKUpTjt
	 aCmfwM/rneWl3aRbec9rhkjI=
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-853a9c4c99eso30576727b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818073; x=1789422873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fRpckaKOwl0Kgs7K/gM2OB7RO7urUAj94CqnshB8/I4=;
        b=A2/ZpBkofwyA58oWf1UiseeohiWUy68iwabLhSRCthK6I+jfTf5WGD04Qs1GE5lroU
         VV2U8dZ52MvmH42bwoaaQxqRdI918N4swSQe41v3EvVgQTGLskCQ/Q8/anaXGKrmflBS
         z12Csh0uNb+I86AgjXCF3oMPvO1W0KkOBwnzrTvwTiHfJbSnxrG+21FtH8aGvXzaTqAQ
         ZeMar5J9jgLVVJSH0PwtbaVNJT5mbSBVo/uBdtr8rrh3O/05sp96xsFq06kcvsAHCThE
         cK74oAvxHIak6WrpMUtMYyT5LLeb4nNPoX4LbXs2/QpRmvkWtpuiFnEm2EOLko5scRbC
         0Xlw==
X-Forwarded-Encrypted: i=1; AKwUvBx5DBFeWUlk3Gw4KWBwZcCL3HpJ2lz3oyblp9gfqN9oV3YYHPM2Ca0YRBTDGn8X+Kz8LrFwfrIuO3kH+nI=@vger.kernel.org
X-Gm-Message-State: AFuF++mcGb7V0Bb1Fxe3sS1Ezgu4yAGbVgw4Nr6LLW5F9Jo70eD9ZMeZ
	RziBdBYTdOqZL/EbU4aPfzRw/pX4F/IAPILAbWxiSQgIMPNCICQyUmGrzbM5oDgVU1cmxujNUar
	bbdDOWvwaCdQUq4b1/xjK2i/UvybBgTG9Yxfetyve9jE36AAXbGpkGNPXirvy05ypLV3tR/pIyo
	oJOxvFsg==
X-Gm-Gg: AYBFou3eTuO2d0ymIDsMi/IOcTOsV0G9/VxbuN6xMxfoQSDh9wY89QiEpKFcx6ZyOLD
	EUHT4bANtXrs+/d0Io4d3pHUQRNg8vNfjZuaIy6C5ASzasfTPsmA/raOh53naohuJEjtf08g4qC
	NKJY2wTcxCNIjTabYswHfVN+8gtxerufWDR5olnh8ypjzSshzA6HH+RAcyIxXrNWDtyHO3vcCqM
	jTv6Dc/UCNQdvrWZk39C1IRRNeSchxkZO9oRTL/ZkwubrCWRHJPK+3T7Ktq9AF7tWvmGicQg2Of
	F7+z/XHJ46cDrm8uk5E8AsVqy4O3zhPdxEJqso54CFF3imtdmnNIgzum3PFniGWtSn7iXEFupxq
	DiMl6q3NNP2kOa7mdrJk9KFibJN6vtHpmrGQv7KzTPg==
X-Received: by 2002:a05:690e:2581:b0:66f:8797:8721 with SMTP id 956f58d0204a3-66fb591c4b0mr6436218d50.10.1788818072950;
        Mon, 07 Sep 2026 14:54:32 -0700 (PDT)
X-Received: by 2002:a05:690e:2581:b0:66f:8797:8721 with SMTP id 956f58d0204a3-66fb591c4b0mr6436205d50.10.1788818072556;
        Mon, 07 Sep 2026 14:54:32 -0700 (PDT)
Received: from Q58-sff ([2a00:5884:1118:0:ed91:74de:df2:6b36])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb47a8b8fsm8977708d50.2.2026.09.07.14.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:31 -0700 (PDT)
From: Thibault Ferrante <thibault.ferrante@canonical.com>
To: linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com
Cc: mpe@ellerman.id.au,
	npiggin@gmail.com,
	shuah@kernel.org,
	chleroy@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/powerpc/tm: Fix tcheck() reading uninitialised CR value
Date: Mon,  7 Sep 2026 23:54:20 +0200
Message-ID: <20260907215420.1258678-1-thibault.ferrante@canonical.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tcheck() is used to check the current transaction state (active,
suspended, doomed) via the "tcheck" instruction, which writes its
result into CR field 0. The inline asm declared a GPR output operand
for this result but never actually moved the CR into it.

Every caller (tcheck_doomed(), tcheck_active(), tcheck_suspended(),
tcheck_transactional()) has effectively been testing bits of an unrelated,
arbitrary register value since this helper was introduced.
The "& 4" mask discards the TDOOMED and TS_lsb (suspended) bits before
they ever reach the callers, so tcheck_doomed() and tcheck_suspended()
can never return true, and tcheck_transactional() degrades to being
equivalent to tcheck_active().

Fix tcheck() to actually move CR into the output register with mfcr,
and widen the mask from "& 4" to "& 0xf" so the full CR0 nibble
(TDOOMED | TS_msb | TS_lsb | reserved) is preserved for the callers.

This bug has been present since tcheck() was introduced.

Link: https://bugs.launchpad.net/bugs/2107442
Fixes: 8e03bd4e70b6 ("selftests/powerpc: Add TM tcheck helpers in C")
Signed-off-by: Thibault Ferrante <thibault.ferrante@canonical.com>
---
 tools/testing/selftests/powerpc/tm/tm.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm.h b/tools/testing/selftests/powerpc/tm/tm.h
index c03c6e778876..6024ce4ba6ff 100644
--- a/tools/testing/selftests/powerpc/tm/tm.h
+++ b/tools/testing/selftests/powerpc/tm/tm.h
@@ -105,8 +105,12 @@ static inline bool failure_is_nesting(void)
 static inline int tcheck(void)
 {
 	long cr;
-	asm volatile ("tcheck 0" : "=r"(cr) : : "cr0");
-	return (cr >> 28) & 4;
+	asm volatile("tcheck 0;"
+		     "mfcr %0;"
+		     : "=r"(cr)
+		     :
+		     : "cr0");
+	return (cr >> 28) & 0xf;
 }
 
 static inline bool tcheck_doomed(void)
-- 
2.55.0

