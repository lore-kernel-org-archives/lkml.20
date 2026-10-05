Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6385C47CA8E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196886; cv=none; b=cS8CnaPy07YHPsp7CNglFG1KQZc2F3ayhUF079j8p+lCt9i33OCJg6HOHngmMy4xCCs0ljPqt7f+pOXKCDDydNfAm9omnpANQZOF+8Pc4iBpASEneTvFtVmDeoNG/KvBL0x6+Wo/Ys5fN5dMHA/vZyFVZTwzLkTSrGz0cyTCDwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196886; c=relaxed/simple;
	bh=0rh1tGK65GgDdKhLNrne8adrsKWucIOf+haXj8nRc9M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e13V/+xOJQVa33cJf5IFmTla9LR7N1A4vnlDAza9/7DEvij0qKaOQUDqOB4pXdso0+b5jwZXQfr8MivgDPIg884VRfKDk1ssOf1BUq7dnzoeKma1OI5w2GaUkCw2ElbJvr8GujOEcwf77XqW91LalWsqbyJ9hLrK9N0RejMTX1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdDc3ltI; arc=none smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdDc3ltI"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-49e4ffa5a7fso641230fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196882; x=1791801682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9NCXgXEU+eTnZrwsIgbW2+ZLBzY0l64Gt7pEinkNuQ=;
        b=IdDc3ltI1zysuUGj9aOokUy/4mmj1n7wSMK9SjlTIzefDI8/oAEBVU6spJ/Tf5WX0H
         boX3l7imUW2A3pSZT/MWeU+UZc/v1Lemnx6cIgW7V/sEYtA8HbmYrTzmSIRojdw6SiJ1
         FQGrk/1ntL1VVkYoJl3JfPhBAregemT5djrd6uyVtMBJHPmhZb65C4UoJ6HQiGLg1JKP
         txZqRxvcRTuUjYIZNYCOpmz4e7It6ulrEuBE7TxE7InisRfCcDg6cuTUInKA8GO84rvN
         L3+vAWCoiO0FNYv5VW0JbEwUTLNTEPxIbT2rY0VyPAeaODnZJlww5c+AUJ7T4JzgzgTe
         OJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196882; x=1791801682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O9NCXgXEU+eTnZrwsIgbW2+ZLBzY0l64Gt7pEinkNuQ=;
        b=gfIz9AsowrgQ7Oh+7JfoRNqfbLM/OEDXFOPcpXqLGoGvlryll8n48yfXTEggD2nib+
         9Uu4FYVDczsmrIZQIS0tslDRNvsN8pnp+91pVSfoD2/hw9s5CZ0yethj4sluW69L1+2J
         RqvVxubrwmwO0ubRwdF++HYIacvKgn0PN3FMiaGQU8/B3gRfRcrk+M/RJ2kcla5SVs4+
         DXPlqEbOEN0PSI+BVR2k/NwjQPGcuqERtYB/P2b/dkpWRRNKpmtAdk2PAHWRLw/Gk3Tb
         4W+xdpBYA8PliXSMRzVMsOIDW2Ia7ZaALAFuJtvHRe46QNAzogtFb7QxqyANEZskGcNg
         AGMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtwrCYXk+72N/Fo5XMlvgjyEVPoSyMOFj6erfLzV/lKs3fH6saauHnEnzpzLmsLZTTi05/Ew3p9aBOEwo=@vger.kernel.org
X-Gm-Message-State: AFuF++muSjWLrJN6OYVZJYrFjzbn9cbuJu8qEXdY0TDTfReTHs2EphRP
	SfVJUQzlNGYgbPzbd6VFEb9swV2o/fn7rDGjk/4vT+pgeoaTDHTqrsTo/xftNXhm
X-Gm-Gg: AYBFou3lbnPynUtSLuLlC2e3YkV7fZ4McsYJwjZTPKO7b26en5ezMduw+KFu9T7SO+O
	b/QvXa5aPJXsaY7QcAnDQnw61vS8GGB/jEFvmZVX4tsDTACaRcDeeKqsnCOgiq8vRUavr9usot0
	P1Obre46XpdktTi8CEzGiYS/JnWYEUl7uBDYBDKbIz6gcWrVaryOjcSnYkjp5CTqRwtPzy/0RWN
	R5jX+2IDHSbDlRbNU5MoRIZTbTi7UfDxn1B1LdKukyR8RhoBxBYRk/UtYNivr09lrhdg8BMS/Jf
	ggsA2L+50btGf1sFpZyJFYfyxWB8gDDUFH/HMYxwVWGUQkVpCi2DR3ftNHvQTTHckNpFuMEGP+Q
	4paGUXjMcHFDtQvBvVBMmZhNQDidejfemDCKvs0QXKmWE9MpRdcjnPK2xIYAqx/L0axId5bwfzd
	QGj+06Glrx7OZijupfmlwelcCgIOVXJavpD7mvf3Xc9SPB4FUl6nc3w65FTzPP7GEsCe3WtElHH
	hciJqgQ/r28
X-Received: by 2002:a05:6870:3928:b0:48f:e21e:1e6f with SMTP id 586e51a60fabf-49e15e70462mr8494216fac.50.1791196882539;
        Mon, 05 Oct 2026 03:41:22 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:41:22 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] tools/include: fix signed shift overflow in 32-bit unaligned accessors
Date: Mon,  5 Oct 2026 05:40:50 -0500
Message-Id: <20261005104050.1786222-10-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005104050.1786222-1-lzsx618@gmail.com>
References: <20261005104050.1786222-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

In __get_unaligned_le32() and __get_unaligned_be32() the most significant
byte is promoted to int before being shifted left by 24. If the byte is
0x80 or higher, the result does not fit in an int, which is undefined
behaviour. This happens for every kernel virtual address, e.g. in
sorttable, and UBSan reports:

  tools/include/tools/le_byteshift.h:14: runtime error: left shift of
  255 by 24 places cannot be represented in type 'int'

Cast the byte to uint32_t before shifting.

Fixes: a07f7672d7cf ("tools/include: Add byteshift headers for endian access")
Assisted-by: Claude:claude-opus-5-5 UBSan
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 tools/include/tools/be_byteshift.h | 2 +-
 tools/include/tools/le_byteshift.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/include/tools/be_byteshift.h b/tools/include/tools/be_byteshift.h
index f7d1d1698..2bda8d199 100644
--- a/tools/include/tools/be_byteshift.h
+++ b/tools/include/tools/be_byteshift.h
@@ -11,7 +11,7 @@ static inline uint16_t __get_unaligned_be16(const uint8_t *p)
 
 static inline uint32_t __get_unaligned_be32(const uint8_t *p)
 {
-	return p[0] << 24 | p[1] << 16 | p[2] << 8 | p[3];
+	return (uint32_t)p[0] << 24 | p[1] << 16 | p[2] << 8 | p[3];
 }
 
 static inline uint64_t __get_unaligned_be64(const uint8_t *p)
diff --git a/tools/include/tools/le_byteshift.h b/tools/include/tools/le_byteshift.h
index dc8565f39..e5c78a48a 100644
--- a/tools/include/tools/le_byteshift.h
+++ b/tools/include/tools/le_byteshift.h
@@ -11,7 +11,7 @@ static inline uint16_t __get_unaligned_le16(const uint8_t *p)
 
 static inline uint32_t __get_unaligned_le32(const uint8_t *p)
 {
-	return p[0] | p[1] << 8 | p[2] << 16 | p[3] << 24;
+	return p[0] | p[1] << 8 | p[2] << 16 | (uint32_t)p[3] << 24;
 }
 
 static inline uint64_t __get_unaligned_le64(const uint8_t *p)
-- 
2.34.1

