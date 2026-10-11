Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E324745C71D
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748671; cv=none; b=oCNISvFJNAUKbRAXJdRMgXnqJZK+e8CntC9z/AS/l1EJ88b0ptOFXytSCHD5/6POh9J4rr3X/KY2iVylQCXfM5+Ng/7AfKo0cYkOq7St2MlyVRKitMcpq7n06CG9bY4+o94awwmj7Q3qvSYmXO9FVAZbPvVvon4tjOwqRIWCnJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748671; c=relaxed/simple;
	bh=Le1SYPb2jPNj5MhF8OuGIlzFKKsBR2rEDTHPqcMQNeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dx5Q531ChHYpPYxhFPlEFHewlZkX2B7qgKlfYhgCULWZtQqu8730jkaOUHX7UwVSoGb+Rw0vbxzeDBCnOyXokOMWiYBLb+Oi1gI+5tZ2C89LUalMCAfV3r/E8O/nofUytkg2VXFLttcpM91yF36fAZ+Oxr8yDlGGcMz7Zp6CS/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1DXwjwZ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1DXwjwZ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso194563566b.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748668; x=1792353468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtyEZmwj0f19Lpw83gnqEqbS3r4hbHydMWKTWR/TdRU=;
        b=Q1DXwjwZx0ewCGYTzlldBhwAvBE5AFrZmnFiUCBx4qQIm27xdFd9CxirUs56NxYjun
         Ur4oHEYAn7SBy3slGVOLiEU1iGdv5fAE9yo2QbNaAkaGYMQIYpz8VA4+5jBObOTkpIbQ
         g1gf07nXLAGnZEFljdbRhALTcYoJB0TQQoFM/pwlVtJ2O4UW27SyQOjwy/Frb3+TMrpo
         oJVh2DRQkq4zP6IVGarJBh+/4Ij35cn2xEoJ1cJ3r2Fu2lo1+fh6h/Ci2+lF0iCa1sRG
         jwoE4rpvY+suqOtbQhOAx/jGZTIGKLOmg8PRDB+ZKrs+58Lrby/s4bixVTkt1OBUtfJV
         +bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748668; x=1792353468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZtyEZmwj0f19Lpw83gnqEqbS3r4hbHydMWKTWR/TdRU=;
        b=pHm0w9Bv3/KidsLApxgJr9ZM3sxtjd//1d9jDiUT/yYcWF48eINwW27O8bYCcKFbR1
         Yx/GTKiekllwhZuzN0Cuh+guv50PEoTwqH1J8l4OsG1Q+h1uXuiNihcjZC0QOT3CnUAS
         39I/rYfBX1ZVO9HdjaDLgoKwPcDhFCVZ8/7sN7AI9bD97VyaL/FcOaZkZGdtXyBvPHln
         a7s+Cs1XuIyuggvsTASV5N3S74LR3L0e1/4nGS4nCc+jNzu063TA/VefM4ZWe2gaZ7UJ
         pbeMVg7WguvsHD3C1SSmDqAk1Pq92dEzuVAT41J+8V+N/MB8lvionNQ8qiPvXq7i95PV
         fSdw==
X-Gm-Message-State: AFq9FYLaSLyI/ENy/4vK3LzBiml0FYGo2YeYgHcU2zS1zaXPRjayZN13
	HnEIoTFXz0NeBCbpLJsM5pavZ7hJ2nf3uw3N+c55cfm/1UdzgtKwTwh+
X-Gm-Gg: AYBFou0I7S+mC4Q7rVWWgxX73z5Q9RM7WzZeiWbt8ym31NSlx+mqZNq3yRyawMNgjH8
	vF846wLY/uZ2sxuD3HSbkMDiCmKU3f9bj1tICXNpeTKHV3rtwfeSc/LzK8wSTe6RbryiN2YTdxe
	+A3FsP7/YNmDSO5EzLXil5zirLMvj9UD/2tC0oJePfDAwl3IxrJs/tBsLV1ca5cU9PHzNO+JJJN
	nzo3FDLj/0Pe7tP+Dzr9fERm7OlKEA3qz/G9Vwjg6mcDToYTxdzsrPtCucni1dqEuuWK1hlXBmW
	aF+m1T+LSY8LFF0VkjHwtqRas3+TDZAekiPByXQ+FAKCpJ3ylpAh6wD7/oLOD+AqwZ5Dgieusw6
	WiLNh2CDpyf2CEpcP+Bw7IQHQzWafJXD+6oENjubIfnbX8sSJjIdDjHM2nF/xi7HMkA4Qe+mGMx
	mNW8oyRmp32U9mLqk5TFFHwBXZdBzl34CCcFe/8+Yz19Rb9O7rgTrkXpguqCZY2UA6SHsX7NWU7
	MEh7Y8KTNrbp/JDCPiwiumkQbPX1bN8FREjviP++4VyPFHwqGE=
X-Received: by 2002:a17:906:dc8c:b0:c31:8984:7fad with SMTP id a640c23a62f3a-c31a9feb114mr762553566b.15.1791748668114;
        Sun, 11 Oct 2026 12:57:48 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ae9fsm381315566b.26.2026.10.11.12.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:57:47 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com,
	sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	krzk@kernel.org,
	oleg@redhat.com,
	linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2 1/6] sparc64: return from the generic clear_page implementation
Date: Sun, 11 Oct 2026 21:55:53 +0200
Message-ID: <20261011195729.981243-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011195729.981243-1-linmag7@gmail.com>
References: <20261011195729.981243-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GENclear_page falls through into generic_patch_pageops after clearing
its page. The patcher then rewrites kernel text on each invocation.
Return to the caller once the clear loop completes, as GENcopy_page does.
This affects processors using the generic page-operation fallback.

Fixes: 6c70b6fc7b6f ("[SPARC64]: Do not assume sun4v chips have load-twin/store-init support.")
Cc: stable@vger.kernel.org

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/lib/GENpage.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/sparc/lib/GENpage.S b/arch/sparc/lib/GENpage.S
index c143c4d1de3f..6ce11108e143 100644
--- a/arch/sparc/lib/GENpage.S
+++ b/arch/sparc/lib/GENpage.S
@@ -48,6 +48,9 @@ GENclear_user_page:
 	bne,pt	%xcc, 1b
 	 add	%o0, 64, %o0
 
+	retl
+	 nop
+
 #define BRANCH_ALWAYS	0x10680000
 #define NOP		0x01000000
 #define GEN_DO_PATCH(OLD, NEW)	\
-- 
2.43.0

