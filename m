Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998335;
	b=V51BGfIEJXAYxlKZ3T2pzbg4iJ+WB3794NiGZEwJvq1YHRQ0mfRY5OpQ9mT10pYfh90s
	 kj9Nxrtp8Ia0huGpHCVDpBSRqfYTa8jPrgCKkX6KWPXXLC46PQlT5TOVSN9nrduhyO6Qn
	 +qdubsSUuZxtpBg+xTiaG6VGuL4RvbzaVP3QZ5+5bmDNmrSx/0svqgNzbheYddvcmx/r0
	 2e+HuB3oAW+QSiRCfW4nqY8coCkL1hNxIkzZMIC9+ceoRxeihHDf1NusR/hNiHFAv2Sx2
	 JeZTENhjO0pSj7AQHKqyh5+e96qIhdDEMhQzBkkCDetHtkC3A8D9ZtDDPRXG8yzIX2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=slXrTo8Cr/NVx1W/On0les0MlfgDaZcylgwq5f9qHyY=;
	b=REWRrk7irdwU7n4F20fM0POWkIbzvpeaGh2BqtpeY8ek2fQ3sQBwGmGLlyNdzCYStbvc
	 4Aev6CcVV8ZgduGejkfKL+IWzg1ldicvgd9N0x0NpZS7EOKueBO1dusvN+dHk4+5/G3+v
	 6u7diIGE5sUKCTWeUEhZFOwxA8VIR/FcXTIZsaGWVMbre91RaG59TTlPM6LGiy4yB2DTr
	 Mql4foUG7xxxWlf05S3vHiuvy/MJxEWjwTnT2xXiBHuF5bw1JV96mBofCHYOqy/2IwLZN
	 XkUWhvX5f34XTsvhcqQLZPH2yV6WMG/RyywqYNRUWgrOV5jhh6NAdMu2Rx3CUiBDZ2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oN2cUmLJ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D83606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05D83606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oN2cUmLJ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso10246615e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998333; x=1794603133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slXrTo8Cr/NVx1W/On0les0MlfgDaZcylgwq5f9qHyY=;
        b=oN2cUmLJ4ji4eGxu1e2K38y8ZTix9KyS2u7ytEpENNLpzs6oPhn0btAcdyklQhZQwL
         kp4sF2tM7Y0tdHunTqnDc/25/13Jce39jCtpLO8P1JPqpNOSPkcSL0aFdLHqfGscoomr
         MnoHNKuxtuU32kJYrrAuDWnmy/D2NkjGcs0FUYEwkzvxmTRzDifyAvifT9som2rjL/RT
         EmqGawfqmkwte8yy4IMX7lYxl9Xzjcscbd0EJn0T7W7yIBWUim137ix+YK3jrNpjD0u+
         FYYVKifyqQvUqorwddH71vJHdTSvoNC9Rcy0/WihCfHjlowk+NeUiswkOqBBAvUelGRD
         CnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998333; x=1794603133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=slXrTo8Cr/NVx1W/On0les0MlfgDaZcylgwq5f9qHyY=;
        b=anWaAM/ebaVJkrd0mCY9cnqe+23iSGkPo56Ew8OBOCgo0bCX58ytzA9IllFDijl8sz
         0G6xa7YUJtuF6LFC4jpfzgGhhmjENUCgQe6JVN3+244juxcN0D0K8gaqjssapE+CjyTi
         Lm5RKmvb9HaAo6YD4O6JeMho/DA4NpC2fRrQg8ZvRQmZyGn23hBNolVxYTHnpOk2AzWy
         SSHLzFr3oJb+kL8/WzHg5zswIVjS9Ld4s93Lm7eZ7L4Kms+c3gNhhQxVGrOhW2vIz1+r
         MSq6oVF2hLjfdzvgxsSwgLSEcm9LlWqXStXB+G7eghXCXuGTee5JR4bttthqhlMMN+qF
         7W/Q==
X-Forwarded-Encrypted: i=1; AKwUvByZ+h8aY6VukAuX8hh0d+2L7l+/tDSxZywJB1UOPS0fjz4dYKXzRO7aRIgqXqso//zA4qbKq6vepbN5j1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lVc+L2qoWDM1t7As1oQARRpYszQbzdvyobW+L3On6+2j3bbgd
	j38PVhT1rTZUo3kvaXG1LBbyT5jA/WyQx7jkx/R9OY2R7sddhe5R1SkI
X-Gm-Gg: AYBFou2iozs7RJ64oKyOz9SowityQIqygiiddcS4gFfp/PjOTifRESEKknzu50D0Lwt
	CEWk9JldLxK6q+ApxzNDn1otVCXRigoUIFcxrIqS+WjVnvfkQw/L/Ht1GqpYXLmOJeJ1qvhOFmb
	n+CBohvMu4ZICzRSjcf5ynTAs5JPtAx+tbHcvAl5AzjlLGc9fg6Y1hvF8nB6jMacv589y0/PZvt
	82B9yQGEjEJJJ3hby7EHh1JSDvJfL1/ryFbkphgV+WI+PDFQuVJyMDfz3lErDtmEgdVDMb58hm3
	PXbGYuVdYMS+Ozh53ncvFhgzyFLLtt6Flx+U8dXvkaCOSIF3RDGHanKNNsWV2ns2mFyBa/ll8Tr
	FFvQGOqFOy7HQfCTA6bJUHi++XxCONwiEOnbeAgMQQYKyM6+ssVZsIhn4NeiGDfvKDKWgl8IKNM
	01zx0NZVG8bKlzr/6esKrzFF8vcSO9/0M6xZihkt5oM1PqPRXieaJRrfTx7z9ij516QLwoSpqIb
	ya8ilTm6/kkbyXieZzat+51DuDF/gwW42Ax2anHrEJyeUtpIDVAj01FoUgH+uNlF4L57WarwxTK
	ow9NUUEDqV3XeqKLjm0fhlL7Jf0/bivExjaVrPRRO8T6gYUh+GiW6mSEzL8c7RVqQvD4
X-Received: by 2002:a05:600c:8712:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b6df7d4a3dmr63330635e9.20.1793998333166;
        Fri, 06 Nov 2026 12:52:13 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm9075425e9.1.2026.11.06.12.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:52:12 -0800 (PST)
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
Subject: [PATCH v1 bpf-next 11/18] bpf: Follow PHIs in bpf_scan_ir
Date: Fri,  6 Nov 2026 21:03:00 +0000
Message-ID: <20261106210314.1767267-11-a.s.protopopov@gmail.com>
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

