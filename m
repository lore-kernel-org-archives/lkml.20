Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998336;
	b=Oz2rTWutx+XV7nCCK/sRec0B2gMK4odyTYXqmIlzeRroVQrP/4q6BOWqBUeNNmFQRSpP
	 GyHSyCtBLZ3FrLuDUjD0B3U1h8Sv5DgIAkpxOBMsi8aTKK2ua2cUW5sJzb8+KuAHEnhR9
	 8LyVpmAw191UOZigOvwYxE7af/tJR68+t8CR+TQFdf+NvBly2BRRRstZaBDOQ/6gh2Qc3
	 0A2N43x7W/+dmKEkePXP08E69Oj3s3qr7ILUIrJA/Ao7yrh596/unVxU3nAUMzftFsO7a
	 6c0ip6Ov46IwTdR/XeA9ez09OiKtdBCSQ3NxRZYxHgDO02gseBMX075Ndq+NpPI4mIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NiYqsbiEHPYukFA61TqPRmCuyZ7fxceskxzXhkevg7c=;
	b=5bf25XSMlP6JPGf+QYuX5i3JHl/09J5/Fm2JwNF68xXwrVGNy+5EgrS303SqiMli2Pwz
	 NefTpsSexc6cin6qWJEtf4lRk0zhci9NUAwxROGJcOeJ6U8rXfjD5TQtBMVE8iDGMpONT
	 vGzYNTxYofxeywplNiwCcjTjXhoefZwubFZlasr2+DchO0ssWjnfWkoRQNyCmTnUpa6Gk
	 X16nvnkORfaF3nhPEXNa1NA8a+XPExKb1yO2EEidi/EJqmZCCB7yil6mDkosfN1WHguVt
	 Bzax49t6f8F5l9ofLO/bR0i/+SaH97RTyFi3my7tNwoJj4DrlYDjnSeJ4bbzqbUHXtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKs4bXTM;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29CF606A33C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C29CF606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKs4bXTM
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so13624645e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998334; x=1794603134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiYqsbiEHPYukFA61TqPRmCuyZ7fxceskxzXhkevg7c=;
        b=ZKs4bXTM0qdJSjqdefloVKdrzxsYXIIon4ivxBM55Pp/pG7RQ992vmqqh8YdTCsND+
         VZ/mDkkcZ1mchev1h5LAMjazf2uIhvX1DGykPMs8GYc8ALKSGBv1Ubg7Xr/dNSbBymPp
         HxDl07gnaPUNMCd5bmTRsFp5t/vjeV+gEQ1DOK/BJtOhhjG7EHDIUkNSM81X68Aoa7gc
         VFROOekgSIWWTbez+IdZJtlGg7mhNwHuQ5VMkx6symVuhiRGvO2nRWo1O46rwFgDfTcv
         ox5ew6jFMgZDz4diaz5KgcVvl24q7m8gUln7V8stk7lVMQSzOflKlPJlN13KlqrXldlH
         3p6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998334; x=1794603134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiYqsbiEHPYukFA61TqPRmCuyZ7fxceskxzXhkevg7c=;
        b=MR82fmqlGLBU46dg5PnpowrnPxK1H1sKMwYqQTTrIcPFOs2UNrpJ1SylBi+qZzDIJm
         HGRS8Z7cHH10q8KOUiWr2TggawVahphDMB/miSZ2OM51G8y2/s6TSUQ6QqFq6FB5pxBx
         aWWwVQuGrSn+Nzn25rkZLmnEPAt/cmtpnUvaLjk9cS9Q3wEfWp0pYSDWCQ7Gs1vs+bZE
         9CAsAekaS3k82UZHIuuWPD8TDjnvyVVTFPFfhNQWGzzjtgBn85PeuVSPewYRpNCYm4PT
         +2D9Mqn8cWljL1sgCnBOdv1ofL/BS7Pr3q+Ae8Q2tF8EedbRZLN/H3c3f3EAhpb7eKbB
         y8Vw==
X-Forwarded-Encrypted: i=1; AKwUvByoFwvgAIDUJBdVlsyKCourHljLy1vFMDGL1j9dD/U5250+VH4gF29rSWQLscZrm2zBXt/va0PftqLdsfo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+UEYhjbEXF/9RUbPh6pvTZ3m7ZJxEz+8MKpA/EE0W2nM7J7QN
	XP+7ntFDLNo1OmtKS92oAtZ3UUXlxaR+2P5TYXEvStyANUPRl0tg2TCH
X-Gm-Gg: AYBFou2lWNtexl/9TyaDDezYIyLrts+k8VK7BXEz2oaCJS4ZZKmI+2pN0nd7Xf8Y0iX
	bOFIxZt8CTB8y5q349x4o82OXd78ROnGMTbO4Cs8nTuWqEFScMcAph5F3ZHJyOg/d4Df/DxaesF
	4VQrpQjP9DclsQqkFsKZK/fASST6BemV9Eke1A0etj7P+drYUYFMbecle4+4qTAteTkg7PJbjpf
	IP/O63cBSiZBVyY1gavaT210IU0oT73Bhh7SdDxXfsmud+cOVrPW29cSKAX5bnU8Q3GLPt+ThS9
	4Xy0tUwtLZzZTHpNE25CAvrGnx03LDLzXtXtgZEdmUbqHdiuZqCarMUs46Uv2cP5YPJs67WuIZL
	ADTrsRkg63rFwB0jUQZN0WXPeNa/9ydGs/PFWXtmS8cHqU1f+bv2evX6wTgWnKtK0xj49AcTzh2
	iSNaj+6sqtXzdA0pUulzY7ZAmQ0GtnZxw3/BuX2c5TO1rGeZogRmtEMBuWAtuL6iMyPrvnlJwcz
	oeTjwLv65UaFY4oJ7BhSYhEYxlsTvQBwVyVQMBrm3dAgeU6PwRMaUkvw3+xoTyblu+h2y/v7amh
	//2nTj9waxbFNz0bgivUKb4dVVyKybic+vW+wfQtGhUdFus=
X-Received: by 2002:a05:600c:37c9:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4b6df8c9cbbmr58263025e9.21.1793998334195;
        Fri, 06 Nov 2026 12:52:14 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm9075425e9.1.2026.11.06.12.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:52:13 -0800 (PST)
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
Subject: [PATCH v1 bpf-next 12/18] bpf: Follow integer casts in bpf_scan_ir
Date: Fri,  6 Nov 2026 21:03:01 +0000
Message-ID: <20261106210314.1767267-12-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: 20261106205523.1765622-1-a.s.protopopov@gmail.com
References: <20261106210314.1767267-1-a.s.protopopov@gmail.com>
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
index 81de8f941568..a3c6336662fc 100644
--- a/scripts/llvm-plugins/bpf_scan_ir.cpp
+++ b/scripts/llvm-plugins/bpf_scan_ir.cpp
@@ -82,17 +82,39 @@ static bool errnoConstant(const Value *V, int64_t &N)
 	return N >= -MaxErrno && N < 0;
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

