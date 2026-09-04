Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4937E47FAFE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519475; cv=none; b=CYT6+f7IkSqvHgIOJRjJQqZqScMTrv8Aouti/CT00F1kRlk0TIjlVjAFlMvCgSJqOSw78Oogm2nL/hNrj9PNUjIXUOB86af4reWZFj6lwHB4qs/S9/DfoyWK4/k1L9gX9LDyhD1lUfNHm7Oa16EUZ79kYQInpH+6/IRiVggUDBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519475; c=relaxed/simple;
	bh=pXIKNBJZ7VpWZJHYVm5d/JqZ2uDmSW/zMvrAvNFtAkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=anKFZ8/sBamvPGyCdmuPFVNHsRi/mhQ32Su33c1Fee7q7NFe6vllh+BvEz/AzsOGvCk9D8Sog4pgGydAJYdbnm9BbFIbrLyRBmxO8q3itul97OyEu1gAddhQnFmQzaksSF6lHQX36bAOSvkOSLGj+ag98asms7OprPzyAF+Ry5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IArX4aRH; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IArX4aRH"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cf452def93so18818145ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519474; x=1789124274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjnURsU06dXJhEmQk8UgpVeNwhEKlwAdFOshlqNlRoY=;
        b=IArX4aRHUF7ZH3gol+dETzxTV/6IBuM+H6f8/aWPNjpJN3Rk8BBsmrNDD8zZ7wDmsv
         hGIoSDi1Gt+2xn27Uyuwxh+YCHGt2FWDkvg2g54JpTdE48SUrzqb7jqZ3T6xrWiFYUrp
         hrt+PCqwYOXeA0YC5uEsvqv5tk5ghXsmnEsHVOhViHmJzUH6EUZ1MwC9JziX/zRtlawa
         6p0m6pqW6lZ//+giCtUmOIe+cx4U+lkRBWWwtgWwmTIAphWXeC9OyeQzPc6esYKT0Nbh
         XXWVWMR0CSJFQ4Qd8DxPEcwII43oRNRyGzvBOfM2K/NuO3VUvKxG+g7Qd/lFb/xJ2FX2
         OchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519474; x=1789124274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CjnURsU06dXJhEmQk8UgpVeNwhEKlwAdFOshlqNlRoY=;
        b=aZjw0rHeWS/TVnsRJVpObJkN0/TVJ2ElW+4W3/QHjA2sdWlGKghYtRyc+GYZOKpXE9
         nRNDZZY+rLzFSqVG+e/QX+INSR4IJi0qZA0RAzT9lVeVYztDBWz0CyFfGE7aqWPto6CE
         q2xquNbzTpF0c5NcxtRPLKrRVV/3SEpC23c4gB35MyT/8Idunr3dm6xt7hBscGeNMsSj
         2uKUBxGvMB5hL662l5a4AczE4TVasJfoc5eO7/7cjfM3XiEvhtBnrFSayIGQ6mtFd8dX
         57T3juGTfUdlkYCeidIS3WPEbR5yqjnBJ/M8RiBhpP7+aphQgC6FQylrXX4ALO8YlcrQ
         5HMw==
X-Gm-Message-State: AFuF++kxDXIUBQ6ePCRyfmJ3hjGm2Cr7uxGZLUlojKJBbX3/3uake1RK
	y2LOsD6N2z1nlf30hMjocemTjZmGAKc4/1svhEDHM1N0W+Akm1IUskQg
X-Gm-Gg: AYBFou3B8BTcyIfU1i50pmvRZSBE3dSZvQ7o3Ad7r9ayhfFJQg5xKm8++BR3VsVw/yN
	3N1Mx2ETi40NHOhAHB+bWVHx1ReE8Tw2f7OUMKcDsT+8MSi0J79XRikzmngEFiSzox3rq5D/7dj
	QvvWnMqorfZEFVsDxaxZ9YukZJo6elGUI8I2WHbZM0G7jXOu9iXSFf4mLWz2fqdgs+ACXrLD/H3
	l6rrFJ4gwX30U9KZjVVnSzDw9qyeyUa/DLHcMJ05uNengInkMWjCzZUZhjdBF9aZ2enz+6B4cWg
	iVHLzdc23VS6Zk+MR4fsQyuyXnue0l1MTbjPTNacSJtReLM182H/JMLvM79IldZUaVHk8IG6Q5C
	EYDNsBGizO+xpWVvecA45qX1o0cPr8uwC1gBUMYsWzv+S5UBPntCRgE9SMeHYS4ZAcJqBR07sjs
	2KAmoqlsp8jT88vuo9DW9exwTO1GjEVcKHPry2+ZA3zIStbO9YndzUlidCrP9M0WynEW3z43gfK
	gXE5y2yMyNUxv8=
X-Received: by 2002:a17:90b:4b90:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-39b07f2f31fmr13507017a91.6.1788519473607;
        Fri, 04 Sep 2026 03:57:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm5523091eec.18.2026.09.04.03.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:57:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/7] ARM: net: fix typo "arithmatic" in comment
Date: Fri,  4 Sep 2026 16:27:31 +0530
Message-ID: <20260904105743.39799-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105743.39799-1-hemanth.selam@gmail.com>
References: <20260904105743.39799-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "arithmatic" to "Arithmetic", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm/net/bpf_jit_32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
index 9ede81afbc50..b1c21c014c9c 100644
--- a/arch/arm/net/bpf_jit_32.c
+++ b/arch/arm/net/bpf_jit_32.c
@@ -1346,7 +1346,7 @@ static inline void emit_ldsx_r(const s8 dst[], const s8 src,
 	arm_bpf_put_reg64(dst, rd, ctx);
 }
 
-/* Arithmatic Operation */
+/* Arithmetic Operation */
 static inline void emit_ar_r(const u8 rd, const u8 rt, const u8 rm,
 			     const u8 rn, struct jit_ctx *ctx, u8 op,
 			     bool is_jmp64) {
-- 
2.48.1

