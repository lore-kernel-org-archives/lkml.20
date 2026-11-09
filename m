Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243300;
	b=xdhW6XAjHWpO1zT/YdzbRCdMuu5jQjPMPX1MpjusxJyezzB8L6658sWA9A8wRVBXeBa+
	 sDCqX1G5Xbg1r9hhY26QERWS71KDghLh/jFXcg1cGwl7PlcmApPqB30JVucHhmSQ9uMLi
	 awqZ+te/5pJj+0TjaaJ1NY9ygsjIMS9Ninle7QP4Oop2rAn/XrHiBwFTXOrK7TKUsd4+0
	 PGGoF1l8vGx6QNwaJJZdi8y5KLVKQqeOIiHNo5AeedA1kYo2IJFSmwhDdvWZUp92aPSA1
	 dmbFSaTej/YH7DrlEpAIJkAvVnUxeXSujfulg42/supjQiK8AA2Li0LY8R29f1mryPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iPNiV1uPKKfIye6r/jbhbX/vFYDAqBTFEyVAJ/rz9gk=;
	b=G1dunr08K9F+7H3bmYiOPGGaN8dCbfQr8DDjAkx8RTH0izN9QN14z04ceKUmyUBmAb5s
	 EDsNx+YUHLeQYrq1pjg2M7cM2ziqS8Xy7kfScdwuMGyv/xCHTtvkog9kw/Q+Ud6q7QDI1
	 Kip/3WpS4LGCso6fCfBZSy0eEw2WOHvMCcFBtwGA3eb5RxD1h4zzYSNbL76NFHYhlFrGm
	 S9XJdMIKmdiyXqJVa2vsscBvYd8Y2KlmxbM7PFEPmXu7/+m67RRdANKWEdn/jjT6ylfE6
	 Zl7fYLauISWgy3aTG72CMoFh71vkVz61m1DidA4szsdf/IVk6D1A3+FFlc5wQdGU94w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WUIQd0/l";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EC9606A88F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7EC9606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WUIQd0/l
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4918c2d727fso574687f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243298; x=1794848098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPNiV1uPKKfIye6r/jbhbX/vFYDAqBTFEyVAJ/rz9gk=;
        b=WUIQd0/luTYLe8Ggt69gFM6z6g6qQUmytj+dYC6qJ/YPpgvXu6ndfJAS3PXmaYbiHG
         UZ/xF0Q4W0y5lemQoaO0sSkeH01t3561NkTayu2WLTe9naDzv4cU48sH0N2CC8lZYEmn
         G7r7teHUBG70N6aA7qK+50ki/b0nO9NRSMu2P//q+A5HSTfH+Pcka0RH97Ex8ysUJLUL
         5jL9+hHlpbhfHfwsqVJsvZwcnQQZn1q6AqT5W7OsztfOjHSjUDlTmW0OeW17JkGBB4nH
         pDuBYIUnZMnNBtDnDIxVbQvO0NaZG1rPdmEg6NiQ7YGp2Tx9MJqiYP25RKpBWixO/qCc
         UxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243298; x=1794848098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iPNiV1uPKKfIye6r/jbhbX/vFYDAqBTFEyVAJ/rz9gk=;
        b=1pMVmmIM7dZmonkl4C2LdGtiMm1XXmVqlWHEbEtxEGd0ys2vDdF4sjgeLNjyXcnfjM
         9RiRIkFVhNhzvkr0cKqEZVO2HISY7YhHGWJKbYmNhrlULW8hK09x+9yg32KoTA2EDVcj
         cTSY0k8VsSNnKyPtOsS5zbN6vusvdU4FGTQK4bDd9c/ZMhavZxmZpmR+Ve2iGha0v9St
         HRZkgGr8Bsdhx7XtEknA+a7f8ceC/KUgfDpYSP39YAT5GjsqnahsGhZmiAMJMSkSVANa
         xY7+iKYuJJFlDq6YNb/1lZ48mk0qI+s3yFTzyNS//9xuhiSKNUAF2HwULfixaW2ESg2O
         tL8A==
X-Forwarded-Encrypted: i=1; AL+hErEsm3zXI+th9VtG0E+xfvRmvxbgDhEdM2hN5tN5iT7sQ1OLKrKSpi3wr//veXF8yOL2T7bfnsD9hrY6tBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x91DbMBBXrZWXaFadIPavbwmt2EFnwpf/DHtFGRLqMrx8rOoO
	4XQF+ZX0/KH1oOoBmRXH7dF+jDUKeZAWLju/Uf751u+bizFrOrEcwsJl
X-Gm-Gg: AYBFou2St7OgI+ALWbYAmaYZV66RqEdbpMybv5hs6nSjP7P8Eq3pDkkX4PvjqlPQ9oh
	OG0mbx6uOluDoMM66aKMIhJw4ve1H+8UifTdaxc33M/DRmht37NQfIqC6tgSLGWn14C20PxlHhk
	e+yLTz4VJg/KjeqclgOEa7MKXin3tRP5GNHgAAqbeXiuEDfeGdc/MVxC40Ex5nOIcIJpqhcshO1
	rOI2YCfEN73hnNSoGomD8wza3Ey3OcWNXL1HPo9yXYn3xsxfzkBGv4YtdUtQpxThtGAK8VWRuvm
	sd6vwrr6Gpvc2VAAE7g6anawxtzsTgZ579jAi9yqe4c3Yito0sDhPKkRSdgzM/HCHFFm3kNYkew
	Nt36RgjWycPCUxBamEomVO7BX3oaeaAyykRyW6FIBaPER8DCIkbyVV8UIgSt1H3Yx3ug2CzKuki
	L2W8tUr1odfa4IC0vigZGc+WJnGMIzG+/heHhZGaxa5aYsupdMlQfPPLHPj7pxcCawaPabx1H9V
	x6hPO5m3XAjfjIsplYPA6YcbYdR3h8I+zr1x2qqHPSqLlBJPYzY/JK/bpNd+Frs8SR8MHWsdoa1
	6ny2gpOr0XFGbD+21gtLBmYTxrFfB8GG
X-Received: by 2002:a05:6000:469c:b0:495:12e6:c5d0 with SMTP id ffacd0b85a97d-49830c8ce4bmr30798f8f.48.1794243298079;
        Mon, 09 Nov 2026 08:54:58 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm11392369f8f.47.2026.11.09.08.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:54:57 -0800 (PST)
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
Subject: [PATCH v2 bpf-next 10/18] bpf: Allow writes to private stack objects in bpf_scan_ir
Date: Mon,  9 Nov 2026 17:05:30 +0000
Message-ID: <20261109170550.141443-11-a.s.protopopov@gmail.com>
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

A write to a stack object of the function is not observable outside of
it as long as the object has not escaped. Let such writes and memsets
stay on a clean path. A write after the object may have been captured,
a volatile or atomic one and a write to other memory still make the
path dirty.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 scripts/llvm-plugins/bpf_scan_ir.cpp | 85 +++++++++++++++++++++-------
 1 file changed, 64 insertions(+), 21 deletions(-)

diff --git a/scripts/llvm-plugins/bpf_scan_ir.cpp b/scripts/llvm-plugins/bpf_scan_ir.cpp
index 6828fa73717d..0fc60b2130b1 100644
--- a/scripts/llvm-plugins/bpf_scan_ir.cpp
+++ b/scripts/llvm-plugins/bpf_scan_ir.cpp
@@ -4,13 +4,17 @@
 #include "../bpf/fmodret_metadata.h"
 
 #include <algorithm>
+#include "llvm/ADT/DenseMap.h"
 #include "llvm/ADT/SmallPtrSet.h"
 #include "llvm/ADT/SmallVector.h"
+#include "llvm/Analysis/CaptureTracking.h"
+#include "llvm/Analysis/ValueTracking.h"
 #include "llvm/Config/llvm-config.h"
 #include "llvm/IR/Analysis.h"
 #include "llvm/IR/BasicBlock.h"
 #include "llvm/IR/CFG.h"
 #include "llvm/IR/Constants.h"
+#include "llvm/IR/Dominators.h"
 #include "llvm/IR/GlobalVariable.h"
 #include "llvm/IR/Instructions.h"
 #include "llvm/IR/IntrinsicInst.h"
@@ -45,41 +49,76 @@ static bool errnoConstant(const Value *V, int64_t &N)
 	return N >= -MaxErrno && N < 0;
 }
 
-static bool cleanInstruction(const Instruction &I)
-{
-	if (auto *Intrinsic = dyn_cast<IntrinsicInst>(&I)) {
-		switch (Intrinsic->getIntrinsicID()) {
-		case Intrinsic::assume:
-		case Intrinsic::lifetime_start:
-		case Intrinsic::lifetime_end:
-		case Intrinsic::invariant_start:
-		case Intrinsic::invariant_end:
-			return true;
-		default:
-			break;
+class CleanInstructions {
+	DominatorTree &DT;
+	DenseMap<const Instruction *, bool> PrivateWrites;
+
+	bool privateDestination(const Value *Pointer, const Instruction &I)
+	{
+		auto It = PrivateWrites.find(&I);
+		if (It != PrivateWrites.end())
+			return It->second;
+		auto *Allocation = dyn_cast<AllocaInst>(getUnderlyingObject(Pointer));
+		bool Private = false;
+
+		if (Allocation && Allocation->getFunction() == I.getFunction()) {
+			// A later call may receive the initialized object. Only captures
+			// that can precede this write make the write externally visible.
+#if LLVM_VERSION_MAJOR >= 21
+			Private = !PointerMayBeCapturedBefore(Allocation, true, &I, &DT, true, 256);
+#else
+			Private = !PointerMayBeCapturedBefore(Allocation, true, true, &I, &DT, true, 256);
+#endif
 		}
+		PrivateWrites[&I] = Private;
+		return Private;
 	}
-	return !I.mayHaveSideEffects();
-}
 
-static bool cleanBB(BasicBlock *BB)
+public:
+	explicit CleanInstructions(DominatorTree &DT) : DT(DT) {}
+
+	bool isClean(const Instruction &I)
+	{
+		if (auto *Store = dyn_cast<StoreInst>(&I))
+			return !Store->isVolatile() && !Store->isAtomic() &&
+			       privateDestination(Store->getPointerOperand(), I);
+		if (auto *Memory = dyn_cast<MemIntrinsic>(&I))
+			return !Memory->isVolatile() &&
+			       privateDestination(Memory->getRawDest(), I);
+		if (auto *Intrinsic = dyn_cast<IntrinsicInst>(&I)) {
+			switch (Intrinsic->getIntrinsicID()) {
+			case Intrinsic::assume:
+			case Intrinsic::lifetime_start:
+			case Intrinsic::lifetime_end:
+			case Intrinsic::invariant_start:
+			case Intrinsic::invariant_end:
+				return true;
+			default:
+				break;
+			}
+		}
+		return !I.mayHaveSideEffects();
+	}
+};
+
+static bool cleanBB(BasicBlock *BB, CleanInstructions &Clean)
 {
 	for (Instruction &I : *BB) {
-		if (!cleanInstruction(I))
+		if (!Clean.isClean(I))
 			return false;
 	}
 	return true;
 }
 
 /* Add the errors which clean paths of F are known to return to VALUES */
-static void cleanReturnValues(Function &F, ReturnValues &Values)
+static void cleanReturnValues(Function &F, CleanInstructions &Clean, ReturnValues &Values)
 {
 	SmallPtrSet<BasicBlock *, 32> CleanBBs;
 	SmallVector<BasicBlock *, 32> Worklist;
 	bool Changed;
 
 	/* The clean blocks which the entry reaches through clean blocks */
-	if (cleanBB(&F.getEntryBlock())) {
+	if (cleanBB(&F.getEntryBlock(), Clean)) {
 		CleanBBs.insert(&F.getEntryBlock());
 		Worklist.push_back(&F.getEntryBlock());
 	}
@@ -87,7 +126,7 @@ static void cleanReturnValues(Function &F, ReturnValues &Values)
 		BasicBlock *BB = Worklist.pop_back_val();
 
 		for (BasicBlock *Successor : successors(BB)) {
-			if (!CleanBBs.contains(Successor) && cleanBB(Successor)) {
+			if (!CleanBBs.contains(Successor) && cleanBB(Successor, Clean)) {
 				CleanBBs.insert(Successor);
 				Worklist.push_back(Successor);
 			}
@@ -123,7 +162,7 @@ static void cleanReturnValues(Function &F, ReturnValues &Values)
 		bool Entered = CleanBBs.contains(&BB);
 		int64_t N;
 
-		if (!Return || !Return->getReturnValue() || !cleanBB(&BB))
+		if (!Return || !Return->getReturnValue() || !cleanBB(&BB, Clean))
 			continue;
 		for (BasicBlock *Pred : predecessors(&BB))
 			Entered |= CleanBBs.contains(Pred);
@@ -183,6 +222,7 @@ public:
 			return PreservedAnalyses::all();
 
 		SmallVector<FunctionDescription, 32> Descriptions;
+		auto &FAM = MAM.getResult<FunctionAnalysisManagerModuleProxy>(M).getManager();
 
 		for (Function &F : M) {
 			if (F.isIntrinsic() || F.isDeclaration() || F.hasAvailableExternallyLinkage())
@@ -197,7 +237,10 @@ public:
 				Flags |= FMODRET_FN_WEAK;
 			if (Ret->isIntegerTy(64))
 				Flags |= FMODRET_FN_RET64;
-			cleanReturnValues(F, Values);
+			auto &DT = FAM.getResult<DominatorTreeAnalysis>(F);
+			CleanInstructions Clean(DT);
+
+			cleanReturnValues(F, Clean, Values);
 			/* A weak definition always has a record, see fmodret_metadata.h */
 			if (!Values.empty() || (Flags & FMODRET_FN_WEAK))
 				Descriptions.push_back({&F, Flags, std::move(Values)});
-- 
2.43.0

