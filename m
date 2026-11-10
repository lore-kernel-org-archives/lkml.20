Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328181;
	b=MTAIxDFGk94LCGgO3eEhaEU8UcPOc9dlWKkQQAXsbcPKdPybfq+zKtA4CwZhnixY6y6R
	 fLIXMOhhZppgxHp7BGHvQPjPhKByReRYU726Kro/3Zf/rbuFyj6VreVYVwYVEaouuNbk+
	 he8ohcH3YOlc673wvNcig4Of84cL2sqOnA1pN+tPwYik6sz773UBj1DvIaF6gmYKgx+Z6
	 g1rRpxWddL4FJtNwgx6A2znrokUKVGxqFK5e7rhKbnKNZ1GDzH7m/rglRVNp1P6LLdLyq
	 YGTDnJFacF8BBIv1z+PTYeSerzfc87w9aiJ2eXhmHSVPXz/ITzEcr5vJXkHVdj+xSAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bwd1wdoXEErbMb3reUq96fn7OlYms8ZVerVffjZDvbk=;
	b=LMVVUnsA1RO2vHtshruDfLCJROUaeRU34UFeLLaCsWDCQ25uJSKdpO71QCWVmKo48AL3
	 yt8WkGV7m06GF9nqGAL10pkSv6flKMwvho1u6ZT2HBk/LqmCyOS7byLe3XJUbHuHt6+Bn
	 NXCY+I45d7kiQ8+o/XOurN+KdGSsi16hNgL2+cl7xqzyVwLkWryMkuh7Wslx/pZmiZ8vx
	 TtsIvGcX81HqGfwsEh7Hh9xkqHT+Fha35y2fYj0Kr8ivW7NHpNkukcBnVVh80lqWjQosg
	 A31mTXbTvumTfvuMayDMxpWoEMH8c7vtZ/YfAgP/dJ6RdjnoRcUzdnBWaQyvK+o8nkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vbu1U9BY;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B1D60A5BE7
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1B1D60A5BE7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vbu1U9BY
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so18456645e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794328179; x=1794932979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bwd1wdoXEErbMb3reUq96fn7OlYms8ZVerVffjZDvbk=;
        b=Vbu1U9BYVlhceF6dAQsh7jHPMyrSyJk54jyyIvq/haHs4WBFo493tuqqRPn68DkujA
         uBnFGQqUMYuOLq/kDRLcIYtfGm77WVyPy6gCArMURg8XVGJquASrcu+yddnVGkei/GuZ
         QeRE//ZQ4hF2f+rXiqHNFA85StZVmKTaHWqivOV5vaQnA5TlzIDJvnLjBWT5y4Dsycr4
         rl8HkhntBZ1hkLoc6Xf4fckJtLaV9JgvXQAeqvYXyPH7boXSVkQUWor85HsDudLKijq5
         E3ya5EHXP3XCTQ+PlJkABrF4gb3Y6wQzDg4WYHVVCh7G7eX/6NrysIzFpj0ERwOtlvqV
         QNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328179; x=1794932979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bwd1wdoXEErbMb3reUq96fn7OlYms8ZVerVffjZDvbk=;
        b=Rf/qgnXH0XaAxlkgKe725rm43Y1LZz2wWVEY9CGr/s/wGYMxX4oi6q5/3wNudq3thG
         COYhVvX1VyxQSlEbREq0jxHbaZRVUjUAgEi2Y3Z/QS5Ywl8GS3w4s/eUn/v6NjGzu8f+
         /l5Hpqdf4PZK+PIrPhSr2vgl6PmDMYz94X5WebJHoKFe7OcRCVVymRtQ327cO5JSrnRg
         mApsFxNvV02/EoOWq7nnvTGe5LSGx0wPGOMhG66QUiAheD/utBjq8C5hsDFQ3YJkkcNZ
         62Y5Mwsd2jwaFPksaUyP2bP2VDTYHq+6GSYq0YiWQTBM6jgOdxZnXPth62Y1RglqxLBp
         gmVQ==
X-Forwarded-Encrypted: i=1; AL+hErGL3b2/idYv3QbZE98daBD8D6eZqY+AwOzeAzHdeR2HMvJHMn+JXYel5sXIc1OoAZbGx5mRRhnXpIAx5vw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0eV2QOcmJyg2w6Eg9qIFKpO7cwZNW6Cm80PeYjyLS72iJa5Ev
	ZM9rIQzusq3QSsyQPlqYsU5JwpiIxPg8e9JU0x4KD8eevVSFqvQDlUvmp6iF+w==
X-Gm-Gg: AYBFou1Yp2BNiuRBtVvMeIC/lCeEBq3SUpBxSKN1v5ZjwxnXC/U2StGlDwJiWjWxy5d
	ausx3nWK3DfG5F++EjzBLOxXPsXh1r58fMHejGQY9fl07D6okusgtGQlu2a5V88dnwEyQCt++kC
	NOV5cl36MEEQk/FSoduSMcxmGqCRqZW/LwNI9Ug+F139IfCgfwgdaEgvBPwgcVVyE/i4tNYsk21
	hb2cNHRGbkRc1JlpeB9ruEY9M7oMUPwfKc2QbNe8N+EisvJxm038clCoFMMbKqUpFFV6HFLxss8
	pcWsPJyzDjwGwv/GB71JOH6pV/aqFGgswp/rwl0uKHE9mi1oO7QnhZep0zi3tkhc98Km3qhkJxu
	DbnZRm/8cmbXpeIuQ03wGZ7etn3WqZYlirCtSfhKVuAGCuwEXU3ajthVe7DOExcjp/VqWZBU8UO
	TndES0wPVrEGpOJyQGmtdOvgFlD7Bizf/LVyCCATSZiBmxmT3xAyxXV3LlHrwDpkkB/Llm9jENM
	nGb/5hvdXlmo5v3DJiFtR3PNpH97SsMmGj+Eq2i2HTZpkMAasCTeIRxRlFjVE5s8tcN9NnnElTg
	KpHtRRmrO+w74OwFDi0nXkfCpx8bjAziLzrw7LP1x6xyZxU=
X-Received: by 2002:a05:600c:3e11:b0:4b3:9540:47a6 with SMTP id 5b1f17b1804b1-4ba0234f7a2mr52146255e9.28.1794328179086;
        Tue, 10 Nov 2026 08:29:39 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm71287485e9.10.2026.11.10.08.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:29:38 -0800 (PST)
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
Subject: [PATCH v3 bpf-next 11/18] bpf: Follow PHIs in bpf_scan_ir
Date: Tue, 10 Nov 2026 16:40:31 +0000
Message-ID: <20261110164046.454431-12-a.s.protopopov@gmail.com>
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

An error often reaches the return through a PHI in the block of the
return which joins it with the results of other paths, some of them
dirty. Take the incoming values of such a PHI on the edges from the
blocks which only clean paths reach. Do not follow a PHI in an earlier
block: a later branch may split its values between clean and dirty
paths.

Take also the errors which LazyValueInfo knows exactly: an incoming
value on its edge and a returned value at the return.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 scripts/llvm-plugins/bpf_scan_ir.cpp | 68 ++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 5 deletions(-)

diff --git a/scripts/llvm-plugins/bpf_scan_ir.cpp b/scripts/llvm-plugins/bpf_scan_ir.cpp
index c45fb97d1b93..249412194766 100644
--- a/scripts/llvm-plugins/bpf_scan_ir.cpp
+++ b/scripts/llvm-plugins/bpf_scan_ir.cpp
@@ -8,11 +8,13 @@
 #include "llvm/ADT/SmallPtrSet.h"
 #include "llvm/ADT/SmallVector.h"
 #include "llvm/Analysis/CaptureTracking.h"
+#include "llvm/Analysis/LazyValueInfo.h"
 #include "llvm/Analysis/ValueTracking.h"
 #include "llvm/Config/llvm-config.h"
 #include "llvm/IR/Analysis.h"
 #include "llvm/IR/BasicBlock.h"
 #include "llvm/IR/CFG.h"
+#include "llvm/IR/ConstantRange.h"
 #include "llvm/IR/Constants.h"
 #include "llvm/IR/Dominators.h"
 #include "llvm/IR/GlobalVariable.h"
@@ -46,6 +48,21 @@ static bool isErrno(const APInt &C, int64_t &N)
 	return N >= -MaxErrno && N < 0;
 }
 
+/* Return true and set N if RANGE holds a single errno */
+static bool singleErrno(const ConstantRange &Range, int64_t &N)
+{
+	const APInt *C = Range.getSingleElement();
+
+	return C && isErrno(*C, N);
+}
+
+/* Return true and set N if the value at use U is a single errno */
+static bool singleErrnoAtUse(const Use &U, LazyValueInfo &LVI, int64_t &N)
+{
+	return U.get()->getType()->isIntegerTy() &&
+	       singleErrno(LVI.getConstantRangeAtUse(U, false), N);
+}
+
 /* Return true and set N if V is an errno constant */
 static bool errnoConstant(const Value *V, int64_t &N)
 {
@@ -54,6 +71,42 @@ static bool errnoConstant(const Value *V, int64_t &N)
 	return C && isErrno(C->getValue(), N);
 }
 
+/*
+ * Add the errors which V, the value returned in RET, is known to be on the
+ * edges to RET from CLEANBBS to VALUES. V may be a PHI in RET. A PHI in an
+ * earlier block is not followed: a later branch may split its values between
+ * clean and dirty paths.
+ */
+static void collectErrnos(Value *V, BasicBlock *Ret, LazyValueInfo &LVI,
+			  const SmallPtrSetImpl<BasicBlock *> &CleanBBs, ReturnValues &Values)
+{
+	int64_t N;
+
+	auto *Phi = dyn_cast<PHINode>(V);
+
+	if (!Phi || Phi->getParent() != Ret)
+		return;
+	for (unsigned i = 0; i < Phi->getNumIncomingValues(); i++) {
+		Value *Incoming = Phi->getIncomingValue(i);
+		BasicBlock *Pred = Phi->getIncomingBlock(i);
+
+		if (!CleanBBs.contains(Pred))
+			continue;
+		if (errnoConstant(Incoming, N)) {
+			Values.push_back(N);
+			continue;
+		}
+		/*
+		 * LazyValueInfo knows the ranges of integers only. On an edge it
+		 * also uses the branch condition, as in "if (err == -EINVAL) goto
+		 * out", where err is the error.
+		 */
+		if (Incoming->getType()->isIntegerTy() &&
+		    singleErrno(LVI.getConstantRangeOnEdge(Incoming, Pred, Ret), N))
+			Values.push_back(N);
+	}
+}
+
 class CleanInstructions {
 	DominatorTree &DT;
 	DenseMap<const Instruction *, bool> PrivateWrites;
@@ -116,7 +169,8 @@ static bool cleanBB(BasicBlock *BB, CleanInstructions &Clean)
 }
 
 /* Add the errors which clean paths of F are known to return to VALUES */
-static void cleanReturnValues(Function &F, CleanInstructions &Clean, ReturnValues &Values)
+static void cleanReturnValues(Function &F, LazyValueInfo &LVI, CleanInstructions &Clean,
+			      ReturnValues &Values)
 {
 	SmallPtrSet<BasicBlock *, 32> CleanBBs;
 	SmallVector<BasicBlock *, 32> Worklist;
@@ -159,8 +213,7 @@ static void cleanReturnValues(Function &F, CleanInstructions &Clean, ReturnValue
 
 	/*
 	 * The returns of the clean blocks which only clean paths reach or which
-	 * one of them branches to. Dirty paths may also reach the latter, but
-	 * the returned constant is the same on all paths.
+	 * one of them branches to
 	 */
 	for (BasicBlock &BB : F) {
 		auto *Return = dyn_cast<ReturnInst>(BB.getTerminator());
@@ -173,8 +226,11 @@ static void cleanReturnValues(Function &F, CleanInstructions &Clean, ReturnValue
 			Entered |= CleanBBs.contains(Pred);
 		if (!Entered)
 			continue;
-		if (errnoConstant(Return->getReturnValue(), N))
+		if (singleErrnoAtUse(Return->getOperandUse(0), LVI, N)) {
 			Values.push_back(N);
+			continue;
+		}
+		collectErrnos(Return->getReturnValue(), &BB, LVI, CleanBBs, Values);
 	}
 	llvm::sort(Values);
 	Values.erase(std::unique(Values.begin(), Values.end()), Values.end());
@@ -242,10 +298,11 @@ public:
 				Flags |= FMODRET_FN_WEAK;
 			if (Ret->isIntegerTy(64))
 				Flags |= FMODRET_FN_RET64;
+			auto &LVI = FAM.getResult<LazyValueAnalysis>(F);
 			auto &DT = FAM.getResult<DominatorTreeAnalysis>(F);
 			CleanInstructions Clean(DT);
 
-			cleanReturnValues(F, Clean, Values);
+			cleanReturnValues(F, LVI, Clean, Values);
 			/* A weak definition always has a record, see fmodret_metadata.h */
 			if (!Values.empty() || (Flags & FMODRET_FN_WEAK))
 				Descriptions.push_back({&F, Flags, std::move(Values)});
@@ -258,6 +315,7 @@ public:
 		PreservedAnalyses PA;
 		PA.preserve<FunctionAnalysisManagerModuleProxy>();
 		PA.preserveSet<CFGAnalyses>();
+		PA.preserve<LazyValueAnalysis>();
 		return PA;
 	}
 
-- 
2.43.0

