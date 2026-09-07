Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EFB45D19F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782465; cv=none; b=gDgOJTnINM9J7H16neCatoLCVLWVFPdm5XTs7j0stZ2FpX7sb60AyF0SIOEpLnotlqojo7PBKQxbl8egSRLuetfdXrlO8RKGM12CZP8pY/bKidZhMAkZ4meYd85YlekH069PDKnwJRgK1UulGdJ7SF+6ASKnnZYGBJV6kevW9MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782465; c=relaxed/simple;
	bh=pXIKNBJZ7VpWZJHYVm5d/JqZ2uDmSW/zMvrAvNFtAkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iEdsU6gnIYb2+8mcaMibf/wXGLpgNpDsTtU+xuOeUfgK69+vtzAaCF/Lr/1AhKhFlUEp1wtH/9u6Kn0LgyW+umg3TpohQ9TQWi1BXBU7pWvwFS6Ok0B4YOCVNOw76ezi/txv9zNOG3B3N06mXTr9Rg4jWH5PLut2Iv4ndTwXdiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjXhYYma; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjXhYYma"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d91ff7d9acso29000925ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782463; x=1789387263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjnURsU06dXJhEmQk8UgpVeNwhEKlwAdFOshlqNlRoY=;
        b=FjXhYYmaEauGGLqYWyyOJ4/1TC8ANJ74Q6/9Nj71oEAfnQSQ30dnWvkZjY+AfGgN/X
         GVkwV7JSgmUdMLSbloQ5YCnjkxV3M7QOceat8zEoHXxL1dWbaiEGcCMHEXmgKWLU7Gvj
         ThBbirWM4mRg6IibmJC77Ei3CVlRAiQ023ZDyk9Salpi2uhKjiBkXgc0LL3hSA979aO7
         y44od5gCv39+fodKg7VIdSVbnKgV/ZsxUwA0xPGTWvHd3qEicirEmRI7jwyf+VNFw9K1
         bTsRz0qnE7Ai24oH3GaTeE+RsTygeF2XX9eCH+KrKq8YdMhdKbXuyirTLwZvGqOMO9dN
         62Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782463; x=1789387263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CjnURsU06dXJhEmQk8UgpVeNwhEKlwAdFOshlqNlRoY=;
        b=JpfUnNh261MjwrczmRx9r/3mh0e5H7sWtb09TgDoxjnnabEM1sIsIojsauIGOyB7wS
         VtAs9WhWYSXQ+03TbbJ2rkG7YmJa44UdmWdB5svbE2Gx9OlEth2c8syUgd+97POuH+1Q
         p94vxqumuiYZ+8mwRJ1ovJs6shBpg60cZf8ntzIUO4B9Ov+341GeYUcSIaWKN6Du3VEP
         QrP4YraZfSKFVXexigL7XSq0RKvnfnsHZBrhHhwmIyNe9ScHQb7dF9hx4Js1Fg4ljrY0
         xFrU4FBbWyQLkWIJq0vXbMw2IvY2SrNmeqOS2IRzYDU3+pkjpCsdRlqtqrvfjH1813gO
         TPxw==
X-Forwarded-Encrypted: i=1; AKwUvBzVMHhODXROk3pLQz4EHjyvUz4IoyCUYsvnrk6v/SfOgUPKa8fy4UL2Qt+77RalyAQrtoJJvwLhRrpOl24=@vger.kernel.org
X-Gm-Message-State: AFuF++nDocHVLO7Q2R/t8Pm5t7w66Bo51kW7GqtGxmHpBFNKdGHCzlnk
	IVvVaL84W+Rylt9OeQvWkIsZe8GEDNRWeT1ClH4tUGjkcRbplpanWBq/
X-Gm-Gg: AYBFou2Bx/QiVw+dsEjRvooXY3H3Gp1t3eX+utGS2/iX3692Dq8ms9snGG1sZqzPYKy
	VWgF9NcHiF+uL0pHk4xbsx3BdRVsEUpTPrxV7hfWStEO4VAnA2MEmKuZS8xh986oztP5GGVwnHi
	PBLYKw5y/JHo6VDavIQ38HS9zzhyQjLo96r5broS0Pcfxj7emX/SLDvDqIKIwwfXudc59AyNWiQ
	kMbhFNK1boeA8WLDYF81qRS9MAANxBx0AFzmVWV0oh0cDv/GgnqBYCiTiFDvp2Dy8HtOmOWArb7
	yVsUVB6nlgJ5FHAK8lJHmHiBOQDmZbVjSatu+cN0ZZs3qgoADPkduwQaqrFkxzMaJ4rf8HOnvoF
	C29l2XtG6Ajo4ug5/jTT9eOOY3408kA2BZBwWsZAxlJfxqTw9AvVlCxY6uAV/qVCdsnreXxQB7T
	3IKsLWLZXwbM0NStvoR7y3hyXdo/xh36nJbj0nxhHEtvKNIeEMRU6XEHeQdIVf83iJ2ore4Qh9N
	8rNFPH3mAzMrA==
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr35003952a91.1.1788782463059;
        Mon, 07 Sep 2026 05:01:03 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm31244462eec.1.2026.09.07.05.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:01:02 -0700 (PDT)
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
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH bpf-next v3 1/7] ARM: net: fix typo "arithmatic" in comment
Date: Mon,  7 Sep 2026 17:30:37 +0530
Message-ID: <20260907120043.36894-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907120043.36894-1-hemanth.selam@gmail.com>
References: <20260907120043.36894-1-hemanth.selam@gmail.com>
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

