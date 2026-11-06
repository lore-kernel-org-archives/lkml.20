Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998334;
	b=Mon83w629A2nAOQbWQAtuUYKpd37RzgIGZew9qgicP/SWtAWwJ87357XDM6h77Oshu/V
	 8mvTBI2EZTwpDiJ/nuESMjr2xWHHbj4mM2ajYmjFWBV5Tf7sULN7aKknhln5/doHqDBO6
	 4M+3PNPpbfIYzuj7wNmh6RY4u/LdLs1Lh5bxnFs5d4e8MwLxroZ85J5khJ3EuzpH18llh
	 +6a1NkUtxLwnWH1kWBAbhc5udmCr3R6qROaetwrsEpRLtumHziHCh6kw3FNIdpxdwUw0v
	 T5VWK6+FDCoh/+4MKrsmUGx89/qRPqHvDXvPr6ULTAzpjQyYqtgdMF/ydVWqdeQMvrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iPNiV1uPKKfIye6r/jbhbX/vFYDAqBTFEyVAJ/rz9gk=;
	b=ELcBIJv8bhRD2aBsFQyI7RSg662m1iVqHAeKfmT810rmOl2g9Jw6GURbyZvaqmgvh03t
	 unFCag+3MP2PZCBHIxSHQsouVTwLRDsvdDNALI83KxQxA6J/m4dcImlOGkrD7th8RMH7F
	 7ZeWt02Y9ScAWBXcI4gP/u7Q1Io3oc+YF8F/n0mNCpON4XC0qMnSjwb2ePZdq/veEDe2d
	 FADsltr29aFgpiTMlAY5kJkB+WMnFF1grmokyTyqvU9tGX1bRJ91ULo8+B4o8KhN8BNNr
	 FjGkQa9xbSaINAoxtDuEn9jtCHFq/Ikx4sVjHSqCmD0XkakUVMp0aSIf4vGj0FXk06A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RFnE8of0;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F5F606D82B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F5F606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RFnE8of0
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so11122565e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998332; x=1794603132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPNiV1uPKKfIye6r/jbhbX/vFYDAqBTFEyVAJ/rz9gk=;
        b=RFnE8of0AyYvafReVhwMFtYljsLB+asWLYlyl1NPRclb62TaWeirKTuawqZG1NlZtx
         yikRAkjuRB4QuXcNSN1o9Ykp4P1T5m9vkIUTniPYpDvNNaNYX/vJxJk3tHJSyk4HJHhu
         +DKbcwhs9m3i6RkIAwg7aQQQXoMnW7kqbj0E8+GE4hv9M203Rl5SuD1idXgkEpEK6stp
         BajnUYMLXs40ykwlFnqmGBhIZT+SwpXjhN8qYHOxD6mshamnIEcFmf6u9Oq8Y0Kr028W
         KXoaQBHb046YLuAgoqBYgP+ZbQRi4WYcjAJXa6fov7YFDWyXKdBqZjjF4E1m/SW/c0Ec
         ufLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998332; x=1794603132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iPNiV1uPKKfIye6r/jbhbX/vFYDAqBTFEyVAJ/rz9gk=;
        b=cu6KIaq/bCNq3lKJUEvvCU1TxKNq4htpqBvYNwMjyiFt3yvkwoQXYcCI0EeR2pRA9D
         vo/HUDTeJHkc2cM6SJehwaep8GiUL5Afpmh4QIZb8oCdCZwNiBop2mF8DgJoyE+zAvML
         taZN9KNH6ELrfLbyEHQtKRXwvG/CBdJ67q02Czi3fRSFFhfpAMYG/xnbbcAO8xtUZgeS
         rAyP0lUp51TtwCatZR+W2wjEq7WtlwJa2iqQVE7fbJiXUqYV57NlNHCRspuqrHBfQN2t
         w0cOqFsy9CpcGyeCP47sr0lTXjpWFz8j4h5qjmAPO+Yo4ryBIsUqPdk1OWH5ndt2eNDc
         xFtw==
X-Forwarded-Encrypted: i=1; AKwUvBxvfDUHXlbnzCf0pKxOR7w9lo66qnpDS+N/rcCxX0fKNf+OwqxxxptkrFjskcchlZM8CqiyGlFVABRv5F0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1G88N3txQgQd6nDwUOGEIn2pYEqOugReQzS7XRUTdk+nYBOM1
	2bfSmYvRaLc/jp1/KVo3n/qNc18HI45JALSVcOead9kxLugs7U2NQbbK
X-Gm-Gg: AYBFou1eq9wcVF2CcTiU/+h55l1gPmO7suBV+9SV74KpIZfhlPj4Wi2aVC69uh667sm
	GzaDlX6wWRfpHaiAe6ecBhT0YU2oWbQ67LC9XkZsiTCuaeIsXt7ykhXO4vdAvkQUUwQBFLtqSMb
	6+g1oDgGdbz//c0KCKuU3wS4ImDCgrnhxilJ4hLiNljQAxmERxgGWvStSd8hIT/wIWUHxKnNZOK
	oLa+qsOYlwKsTU4x45Vzx5c/Yxg3mQNeuw51Xk2WjPHOkhWtk8Qc540b/lDbjOsFRQzAPppdDtZ
	Mje/U6Ru9dZvO5ey572Qe547YEd0eoBqUWYQQeUCDxMrPQWs/M5aWmvbj9vDdfMMy5AapaxezA2
	8ilT4/iwxa+y1sGauD0901pcP9itm1t0HTxw0mxtgV50J/LI0VaLrX0G1ViHs6eOfbxCGhipRU+
	6bsd+HHGxMt0MvfYau5Q0ntBEioejomyrNf4jrBN/Hcesv0ZvDZ/2/Fb5tCKDWFq3Upcj+2+l9q
	/LmjHzz1ax7Z7eVrxyj242FmCTImuUKFMfsV8ZnBy8c84rFD1AkSr84DIc4bnDEzhf++8Glnbwr
	EcRQeqCaGCxYBKr4cYdwPlXkugb7h5RlFWm8HsItKdV2b0Q=
X-Received: by 2002:a05:600c:1991:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4b6dc30adcamr59154265e9.3.1793998332182;
        Fri, 06 Nov 2026 12:52:12 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm9075425e9.1.2026.11.06.12.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:52:11 -0800 (PST)
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
Subject: [PATCH v1 bpf-next 10/18] bpf: Allow writes to private stack objects in bpf_scan_ir
Date: Fri,  6 Nov 2026 21:02:59 +0000
Message-ID: <20261106210314.1767267-10-a.s.protopopov@gmail.com>
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

