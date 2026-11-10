Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328182;
	b=LDX7aLZK5sCMWWuLBUmVGQkZAoRRTw5kg5ZJV8lW/O6qQ3i9P0/T7ajNr62DauimaPAA
	 xjjO5VY/0hRVOvxs5kPFUJLbqxSH5nydUHAPNlirj1E6K89u0LLP52mJzCJy2Kj0hHk4S
	 lN/y2AkyIlu1+Kw3UFs21Iy/npIqhrGb+ZFQk88J6BCJCOooWHGFRl/98NR92C9F05MwH
	 kvDvuYguut3s4Kgyf+qqpH3wBDdhiy1nZV/2RPU+Rgrjd2SiMVqRnICCd9QijscRXHTVB
	 250y4oPSJxXKFnPlLuDAkMrsJ3AawQaihK3XKwKFhpsLH0nPwOAJ3uDEOpSLmrtVKZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Dmo0SCC1hsyDkcqfuk8ZgPnLRXSLFF5HrSA/2dOLpCQ=;
	b=FB4TNxfjywCeryMG8jt53X+bebjWeTLMgKsdplC0NXNahIbQ1G4jGHaI88bFhWdyxcoQ
	 Be5Sv74GM4yCTtQd8/r7/SBJf9Aej6b8Mlklg5FGt5rmzoIPXK+BI7Qf9HDKYcgZvBFFX
	 FsPzTU6kQJnbJMjslJuLyC/oOORE9X0Vsu+O+Uq3ImAo7mAzUZyv6BCxmzkFaHbE8Qr9f
	 3OZDGwran4wfR3TGAfsIqcSBWzF9OrR6FH8RSzkrlT6kZ4gctqtSgyoWaSHQbmusc36aR
	 Ojz51GwWUAgDZ/7EEdR7a413hsk48GLoGfBYtA7bFL/e4Arh/EWya3LefcYFEFHMVeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biBjUL0K;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AABD606A8A9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AABD606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biBjUL0K
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so22213205e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794328181; x=1794932981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dmo0SCC1hsyDkcqfuk8ZgPnLRXSLFF5HrSA/2dOLpCQ=;
        b=biBjUL0KHeiAbFA471IPAOu7lQVloW19wDpOLN3aBDQV2rOF07IxpHD7oBD98Fi+z7
         C+GCZ295wwApF92/TJz2e/y3/Lm+NRogurBL+hrrh/OaQ/YJffMd+3poKLgVnIlBrT4z
         SsDKvseUE+AXf2G8skO0lJYOf6Oxp3uZt/cmllzErEKIN3u9EwbEyBiR2xHoVpIe+S7F
         Oy0FeJPlV5yturzRret5tRULMOV67Yup05m9ebwLtSBEil9qzNrVQVeg6PW/f59g9qPq
         l7kgQ0IR2dSUyhCIlIt+Rkyy4iY8rjrM6CGJAiiVbfsV3LwyL5vRuOjvzxgv04XLTG1i
         wjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328181; x=1794932981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dmo0SCC1hsyDkcqfuk8ZgPnLRXSLFF5HrSA/2dOLpCQ=;
        b=f1hxY5l1QCqhS/GkmIv1rGaEuNkWvfxRWVzdDI9xSTsOLvjt71lLOVb+aozWMxCiUA
         hRLWtQrhPV5nrJLP9qulD+1vJ/1BMP90ZFb2fzli380YX0AgIOZkFJnx5Flp2FQdGjeL
         EPVNfMfy7i6aW8rUk1ywkEunb0htpZpCZfg8DY5VOoBEqUbbg1+dVghQwg2hcYP4hJeO
         nCj7iML9rPWBhYu8QsU0NOP8RQjXFQWkAgODcda5PFMJn36ur/jK3Engs/uIOjvgV1zg
         /yJ9q+pj5KNUgVvo0nDf4JMbPL0s4SRHRDa9m1DmieFh7AIL+9YReu9SFV47Ln/VkdEc
         UDpA==
X-Forwarded-Encrypted: i=1; AL+hErHJP5PchDyTSNZ1A8an3nNpyO1e3NCh+TKqDRMP6wA/K79FsIE+Ka5oSkDHATKsGDqn6IBhU9ugjWlA+Tk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nWk+vXjwjG5FqoDHeqEEv4w+UZPwh4XxuQYUdBaQYDOOpVrbi
	wdQ8ZMkPD2vqAiPjD2u3/Q1IDqDFiVgOOhy9UngGx8BWDcMrCFBdPXUn
X-Gm-Gg: AYBFou3KRI8J73PSwGh1cuDMI9nypn6lsjYaOy6227aZ1GXFPNNPGBnmLSK09uF+xBY
	fhIl1B610DQZoNzq5qwGvnk4olYtduW05aZ6KnqwS1H+GbJ/CE2kSry/ThJSaersYtaJt9q9itj
	NJFgckHXk67Cz1x3rCmOoew5FtnNuPiKcO7n8YVidkn0qQP4EhUF0qq6NYhpgsQ8kRGBkNIu0XN
	jcK//HWGPkSGldVfaArhM/ixD8MxSQ1wse7a515Sbij0XZajNJ/Z+LRror7pUOwSGHy+N4GvAwR
	eFPS8/0z6QCHupPlArvi/XVsYwk3KxzCCbMB2nDWVamSCgnGE5gPlmfCVah+uOOtEJRn1WLfloU
	X1PsC3W7cZdxG4ScniRr+5xb44fGwXsYFWww0afq2O7D+jFh04tldGlG/W54Q/K7iNJiX3fKUc+
	D4tkUnKaQN/y1G692GpT13qDTCxZhqSOGVX2HLtHBZAeyw2zN7vSvyMsp4pKI+fUsKjC7oOAg44
	/CZ5nfEgzY8Ae9fyKf/+b9yiNS2j+ut6c9intyUu/sngK2ameA8v8i1CJCBcUd5VSyR6vQuzELF
	R1AANyHMYsLQu+0OxvvL0LHzf2XxR/QqEbONROvALr/PYPo=
X-Received: by 2002:a05:600c:474c:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4ba0234f937mr58508755e9.25.1794328180589;
        Tue, 10 Nov 2026 08:29:40 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm71287485e9.10.2026.11.10.08.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:29:39 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <almagui@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH v3 bpf-next 12/18] bpf: Follow integer casts in bpf_scan_ir
Date: Tue, 10 Nov 2026 16:40:32 +0000
Message-ID: <20261110164046.454431-13-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110164046.454431-1-a.s.protopopov@gmail.com>
References: <20261110164046.454431-1-a.s.protopopov@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow sign extensions and truncations between integers of at least 32
bits in the block of the return. They keep an error, for example an int
error which a function returns as long.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 scripts/llvm-plugins/bpf_scan_ir.cpp | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/scripts/llvm-plugins/bpf_scan_ir.cpp b/scripts/llvm-plugins/bpf_scan_ir.cpp
index 249412194766..7fb40a6c0189 100644
--- a/scripts/llvm-plugins/bpf_scan_ir.cpp
+++ b/scripts/llvm-plugins/bpf_scan_ir.cpp
@@ -71,17 +71,39 @@ static bool errnoConstant(const Value *V, int64_t &N)
 	return C && isErrno(C->getValue(), N);
 }
 
+/* A sign extension or a truncation between integers of at least 32 bits */
+static bool preservesErrnoCast(const CastInst *Cast)
+{
+	Type *Src = Cast->getSrcTy(), *Dst = Cast->getDestTy();
+
+	if (Src->isIntegerTy() && Dst->isIntegerTy())
+		return (Cast->getOpcode() == Instruction::SExt ||
+			Cast->getOpcode() == Instruction::Trunc) &&
+		       Src->getIntegerBitWidth() >= 32 && Dst->getIntegerBitWidth() >= 32;
+	return false;
+}
+
 /*
  * Add the errors which V, the value returned in RET, is known to be on the
- * edges to RET from CLEANBBS to VALUES. V may be a PHI in RET. A PHI in an
- * earlier block is not followed: a later branch may split its values between
- * clean and dirty paths.
+ * edges to RET from CLEANBBS to VALUES. Follow the casts in RET which keep the
+ * error to a PHI in RET. A PHI in an earlier block is not followed: a later
+ * branch may split its values between clean and dirty paths.
  */
 static void collectErrnos(Value *V, BasicBlock *Ret, LazyValueInfo &LVI,
 			  const SmallPtrSetImpl<BasicBlock *> &CleanBBs, ReturnValues &Values)
 {
 	int64_t N;
 
+	while (auto *Cast = dyn_cast<CastInst>(V)) {
+		if (Cast->getParent() != Ret || !preservesErrnoCast(Cast))
+			return;
+		if (singleErrnoAtUse(Cast->getOperandUse(0), LVI, N)) {
+			Values.push_back(N);
+			return;
+		}
+		V = Cast->getOperand(0);
+	}
+
 	auto *Phi = dyn_cast<PHINode>(V);
 
 	if (!Phi || Phi->getParent() != Ret)
-- 
2.43.0

