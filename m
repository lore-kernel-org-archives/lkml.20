Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243302;
	b=ETnX3vEB9R5TT/byCH1G9UEMyZDz9UfJBAqX5RW1/90GLeSZBoOaO/iI3caRBEizaC9X
	 0waUXGw+BQMVkicYDBeRAjOeVFtlgnOLckRsO6tScOxLaE3sbOdhIMkP+I/Iv/SO1I3r6
	 WttsXSoGnjoggoUgaTV2vbS7/R0Myy7z93XKzcxlSqKqLPhNXQZbolwNhxan3BeifGBmj
	 u/DTeKCT7Evsp5lJxo6bz/R0YGxjFVJlLlXg9WxyJx/yp3TJkrJgdkvTLglhAkH0Bv8/o
	 m+FYNCHJQ4CV+igSmH2Lyprrx9n7+2XMeNwbSgNHbktjiIkIf926GA0DmoSEe90qlDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=slXrTo8Cr/NVx1W/On0les0MlfgDaZcylgwq5f9qHyY=;
	b=Stn9NfxZUaX4RsiHzwlgD/kMdPgkXaX9q+KyC8CsxlygIH0tflggwBEBiknfqpaqECkO
	 Xadc+wMQIr0FosvZ7qM2NsHpKeYnfXBpHa3hHgyevRMiPQ1NG6B0TuMlGebH+i+I51rkl
	 lygsVo+5a1k5JlhLDxm4vzJKTOwuQPNaIEoFSTm/g9L7ADqqPg/2H0CszL5tlPVug6H5o
	 MYY6SdeWDOfsSEVy1SdOGpS0mzvywJB9MdiQPL1Q6U2ca1q4QdXyoYJx7SUA1hsSmf6MN
	 WRziv/1pfG2uVGkNMLqepit5Pi8RwqJEFu1LZtunpobVNYQP/KXOsHBs7+x9EMb4ghQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jC2F0Srs;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E91606A8AA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E91606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jC2F0Srs
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4918c2d727fso574720f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243300; x=1794848100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slXrTo8Cr/NVx1W/On0les0MlfgDaZcylgwq5f9qHyY=;
        b=jC2F0SrsgYJYG0UFwBYmwNmg/vftlPA1YKYx1EbhdJKXsH6xummx16NFAo8wMmco6W
         3f9qOMkEaRnkjXLoomqJXG15K+goeiFZUr7Z1QCMubYlXOANxseaf69wE4qsak4nDIdP
         j8/xUpvdIBOL1//qt+2wFoejdnVhhvJc8RyOdoRDDLnpOx6bQDY+zsRevrJQ6RxRNLJr
         VJQDOJINtfgmJ0s6QZjKM7rGsVciWoIbJlXSg+obKGCy4bfQ82v4SI09zBPOksBzVVlV
         rJn6AH7IB6ZRUBYo32cEKcC4ndMpqiWS7J06MeaDrI2wsV/ILPZVc2Rt530xNHQLiKM/
         vmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243300; x=1794848100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=slXrTo8Cr/NVx1W/On0les0MlfgDaZcylgwq5f9qHyY=;
        b=mr/nRj+pB7RnBF0BhSWOCe/HPsYZ/+j1c3tlv1Pa+b7oIqEuS4sv9Lx/Hpvok50Egp
         NWTNN9IQOwreYi9yonp5+Dk/PXsLzvKjHPiOXcYP8Za2rRFb5lCzuIxL0c1Jjg4VNEqs
         7tUP6u8a9nPgM0gmicsnQWu8PAOQgGVbiC3/Z3MmS/7/LmHy9FRAiV22ZhlSfjN1uhJw
         8LW+aKWvZSWdV9wyzZbAw86Ux7C+Jy8NdMWu4grguV8U+ypcCbjK+m9tLMRFDCSCZ/Rw
         S1KYcxzVrSo1hF903oT085916251pAcV9mRVyVkmrw6b9A3E0dRu36j2dVTAGAE6qMec
         AV3A==
X-Forwarded-Encrypted: i=1; AL+hErHQo9g+1TUjoiA1VcluarsjfeZvOQeRPQMp3UfczBu9PlHzvNJIOXvx4THOiGAyK3L5dVssyDSUPrzFLYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q5uVnRT4dLQ7ONEslOHE2ryTBLT8k1AZNeNWwSB4CpD0Y+8Kp
	y4l34K6acP5/uFVhLmstRJqt0aJTamhiRcnZDR3lUB3mHjRnKsKHGfzS
X-Gm-Gg: AYBFou0sQ2XZC+glfHvTzj8aQQdiW5q9ULSnK9XBqmCwTEj+WiGFofM5MjW6IgfMTI+
	E0i1fPBEBXPCJgiv8bqig6veqT5ThAwGGOOgVczhmt9IngkZ0MypGO/d8nUVoMr54jdoLwbgTXu
	jCNm7te1c9O6phO4dp7t0FM/boUiYHFT9oVehHz7aIRs7Hms6BZW3VYdG9vwzfyHfGgg+/E1Jmo
	//yQ8dJ9T3tF0oRm6En7BtCuTFgcTRkJVBkVG0FJIIEAxkZc0f6vcwThAzTaY/EsWPKEoivHIya
	x43RvBsdioO/Xzb39SWtIuwyAXGfkx867tfY6x6bWXP0BQn7vqx99J+XeqkoQjguLfI9kNen1+/
	TVk5h6AfBsdGCl+w02Q8aOoJ8Xh+08XaHo4IXunaWUdqiivJZMYocrLYjxz8ePA9xCCrKCmzP8o
	LzsvJaIOMeHLw9r2+3MJHDpQesHlmEWJXGyhmeXNBZSY7fQcOVlJ/lb96p54Ec5c8lRJS7JR6XC
	5G2ZKvPNyNSkEKmi7RS0ZX4bFknMuPFwK9zX5lh90ZE5dM8J/PlVKIJS2o+1MzQ0OkS4HU3fSXP
	vHtwVR9UJ5Jaq3zehhes6Vfiuh15z8wM/eb0zLCzWmTi8GKQ
X-Received: by 2002:a05:6000:230b:b0:48d:fdd0:6ce8 with SMTP id ffacd0b85a97d-4982b28a797mr184972f8f.3.1794243300486;
        Mon, 09 Nov 2026 08:55:00 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm11392369f8f.47.2026.11.09.08.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:54:58 -0800 (PST)
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
Subject: [PATCH v2 bpf-next 11/18] bpf: Follow PHIs in bpf_scan_ir
Date: Mon,  9 Nov 2026 17:05:31 +0000
Message-ID: <20261109170550.141443-12-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109170550.141443-1-a.s.protopopov@gmail.com>
References: <20261109170550.141443-1-a.s.protopopov@gmail.com>
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
 scripts/llvm-plugins/bpf_scan_ir.cpp | 84 ++++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 5 deletions(-)

diff --git a/scripts/llvm-plugins/bpf_scan_ir.cpp b/scripts/llvm-plugins/bpf_scan_ir.cpp
index 0fc60b2130b1..81de8f941568 100644
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
@@ -34,9 +36,40 @@ namespace {
 
 static constexpr int MaxErrno = 4095;
 
+// is Range in [-4095, 0) ?
+static bool isErrnoRange(const ConstantRange &Range)
+{
+	unsigned Width = Range.getBitWidth();
+
+	if (Width != 32 && Width != 64)
+		return false;
+
+	auto L = APInt(Width, 0) - APInt(Width, MaxErrno);
+	auto R = APInt(Width, 0);
+	return !Range.isEmptySet() && ConstantRange(L, R).contains(Range);
+}
+
 /* The errors which clean paths of a function return */
 using ReturnValues = SmallVector<int64_t, 8>;
 
+/* Return true and set N if RANGE holds a single errno */
+static bool singleErrno(const ConstantRange &Range, int64_t &N)
+{
+	const APInt *C = Range.getSingleElement();
+
+	if (!C || !isErrnoRange(Range))
+		return false;
+	N = C->getSExtValue();
+	return true;
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
@@ -49,6 +82,42 @@ static bool errnoConstant(const Value *V, int64_t &N)
 	return N >= -MaxErrno && N < 0;
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
@@ -111,7 +180,8 @@ static bool cleanBB(BasicBlock *BB, CleanInstructions &Clean)
 }
 
 /* Add the errors which clean paths of F are known to return to VALUES */
-static void cleanReturnValues(Function &F, CleanInstructions &Clean, ReturnValues &Values)
+static void cleanReturnValues(Function &F, LazyValueInfo &LVI, CleanInstructions &Clean,
+			      ReturnValues &Values)
 {
 	SmallPtrSet<BasicBlock *, 32> CleanBBs;
 	SmallVector<BasicBlock *, 32> Worklist;
@@ -154,8 +224,7 @@ static void cleanReturnValues(Function &F, CleanInstructions &Clean, ReturnValue
 
 	/*
 	 * The returns of the clean blocks which only clean paths reach or which
-	 * one of them branches to. Dirty paths may also reach the latter, but
-	 * the returned constant is the same on all paths.
+	 * one of them branches to
 	 */
 	for (BasicBlock &BB : F) {
 		auto *Return = dyn_cast<ReturnInst>(BB.getTerminator());
@@ -168,8 +237,11 @@ static void cleanReturnValues(Function &F, CleanInstructions &Clean, ReturnValue
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
@@ -237,10 +309,11 @@ public:
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
@@ -253,6 +326,7 @@ public:
 		PreservedAnalyses PA;
 		PA.preserve<FunctionAnalysisManagerModuleProxy>();
 		PA.preserveSet<CFGAnalyses>();
+		PA.preserve<LazyValueAnalysis>();
 		return PA;
 	}
 
-- 
2.43.0

