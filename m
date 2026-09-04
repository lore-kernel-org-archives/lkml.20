Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBCE4A6CF7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519504; cv=none; b=MSR1OVNGmV3/KSzgsyAUSB/t4PYrp0R5Zvh0HtoukL4FquckVk/ax/G8HoNOSohG98WDnI5e2Tk/jTDH19XFWS+fNzmop2aVLrRhKItAfHahA6dlgXI3UEH3pgfBV+Afq/IGtX+H2CwrnNiNaM7Aa3FxsTjiqKquTdbDoBKfPeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519504; c=relaxed/simple;
	bh=UErhiAlzr8WjMoBRENwt/AEHPbueyU1pd5tdq23Ux3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csL/EImw+KKIgeEjrkvfM0ifW1IrC+WL+sOUYtBmbmkdKMKSZ7RTJmpkUTegVVMCTrNGKqO6Oi1fcvoU46q/Hk6v4WolmG0CL/qsU9qGqmsUAqNtEe+UKsYEbUphbMnFF1J+IhiKnR3wLQF8m8jfzmM+tVKPb/rfxKA+0WWCBZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFIB7euh; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFIB7euh"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso7530565ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519498; x=1789124298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3KV6RuBnnb3kSlImB7scYqnTaYm6MjcG3VOHCy4kfM=;
        b=cFIB7euhW/DhRND+ISPXgptzdey+XjnRWiEP6Cm7kIE9Hrpfez9VwAvWG8xanG7BjY
         cGNCFO4UgsfEueOALXL+tlA7r3z5i5bJ+LRxDmeKql2VNWtbDrC1w1Itl5/Wp9Ye1Dk5
         NQy3cTMVZ4Q4G2btulOSvL5ro52JSBOjW6tAHM70XO9Sj5yUidh/V9VfEtihIYXuQFJQ
         VF23nJsM1j6Q6WH2ELTHZgdDNOD3sa4L+D/CDDqQZ+hVfNc+HeoVFqYwaJ8wB/qDcK+F
         HJ6x2rs1h+U2elj0ULb1tycJ1NxbkvgTm3QZwWYMr2Hwv1LisWwhbsUth/Oey555LaiZ
         OV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519498; x=1789124298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/3KV6RuBnnb3kSlImB7scYqnTaYm6MjcG3VOHCy4kfM=;
        b=ERDKinGWgRqSOITmuoaFZp7WyezEsudWqMFPD57YqNbB2cCE+8p6ZYKjrNIJo/C0hK
         N2g7x5uRcws3E1UFy7AKs1f/EIQUU7S8Ag35INgGj1j5XSZCvIcYZhJCMayLlHvsz5mW
         Y/L8zAGmy8l1XqPlkcYwDUkq18umP6qX79sYG4XfyrowU2Nwv1fAPiS+3Pb8PfC1e/JO
         um/9iAoXxUR6DB3sX79D62UxKMg6Q11ekhrvs/Q+jhBqVZgKgw9gYURBZCCVU2PaATLu
         1ZR8ztFn60jQVLSaAcEX+KwbT17UliBTFViLbqvUxCgw0kULAO0/aZ+LhfSTq/tiJcLS
         0gnQ==
X-Gm-Message-State: AFuF++kVeXruMKXjaDVHzUElQUpQTatIS2LDoa814pckIw17kWQTDFfC
	4pQLCqEyvQLPuZ15Mg/S3hrYeqiEjgOwQSG/43V0VfSeDaL9hWgct4ji
X-Gm-Gg: AYBFou2E0VxdyOVwB1fywJRy44PebVdkD/EmJvTqY3NnSXmlChGc29xSi6wu0I2vr4S
	RGWWfke5+f0mNE6kR4Hc36XlGiUDSMz//0922QWZ8GyO3x4jA7pjgf3+hvQnz4vLfJqbmQwdZNX
	WjBXpOWbL4mZhurAffAZ8Y7I0Z8gK//doAZ3hfPZb3+4BbxsUx3jiCDsLA/pRIHmsLn39eOz54+
	e2WoeTtqU7t2K1AFhSOxwuBgcYdlPHfDNkzA6JxGq26sC599fx624/KKjoIIWKOOyrHRohmcVrV
	KWVzw/uZSxD5fINvGfk8SkRYswsrs2qvUch8pFSizxwrCjcAXrQFZbeMl7wy1O4YrYh2SmUmU6L
	aayT9J5MpWSYkPQ/9G79VhZrBPorZ/8QVi32SkM2cPK9CsohoOwgjdy+5aZM+RmvIyCMKzpUcT7
	dyBhR8/RkqD97LN9hJ5jnXRhenX2dQgVm6wGKt9oA78vKbrpYRZy7Te5W/luiUQTqj9/VpWmGD3
	MHgLToOtWj+OpsOTQD2wInlsQ==
X-Received: by 2002:a17:903:37c8:b0:2d9:50:a91b with SMTP id d9443c01a7336-2db12667eeemr81520455ad.16.1788519498125;
        Fri, 04 Sep 2026 03:58:18 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm5523091eec.18.2026.09.04.03.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:58:17 -0700 (PDT)
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
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 5/7] sparc: net: fix typo "evalute" in comment
Date: Fri,  4 Sep 2026 16:27:35 +0530
Message-ID: <20260904105743.39799-6-hemanth.selam@gmail.com>
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

Correct "evalute" to "evaluate", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/sparc/net/bpf_jit_asm_32.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/net/bpf_jit_asm_32.S b/arch/sparc/net/bpf_jit_asm_32.S
index a2e28e0464a3..81430f065ac9 100644
--- a/arch/sparc/net/bpf_jit_asm_32.S
+++ b/arch/sparc/net/bpf_jit_asm_32.S
@@ -195,7 +195,7 @@ bpf_error:
 	/* Make the JIT program return zero.  The JIT epilogue
 	 * stores away the original %o7 into r_saved_O7.  The
 	 * normal leaf function return is to use "retl" which
-	 * would evalute to "jmpl %o7 + 8, %g0" but we want to
+	 * would evaluate to "jmpl %o7 + 8, %g0" but we want to
 	 * use the saved value thus the sequence you see here.
 	 */
 	jmpl	r_saved_O7 + 8, %g0
-- 
2.48.1

