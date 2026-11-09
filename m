Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243298;
	b=ZW6XdD1+Oor8/OS1F1+/aGrz8FKgJtBMmBzIRGmcQjbJ5ETzxrq2d74gCqnlbMr1yNXA
	 O+gIFAnM7QGDsxLqiV7AgNfRnoqIFkUijp+qI9T2ZzyfmMGR+c6A8wLvPUBSqIjNa8NY4
	 JfrTmT5seyrkrckGZEkYEzO5hTfM5D8wEjezZ7cLsi2WE58DcNDWjfD3oS/rhFZS1I2fa
	 lx11sgBw8Rb6ZYfahkKdHkzUbK1X5zZrU5ud7IvhZs71wG+peorDEVT35RH8Fr9RMCCfS
	 buSwbuRivlJudBNqQn1h683Rvk2Jn0X84vGi7X9pp1AQC7ucR0golY6i2KDbIHbbsgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ilvmL95xJlpNSKLk5utHXZ1bIs/yE6trPAs8lvP1p2U=;
	b=itQLtrQh0ABtOO57TmZySDC2JirC6AKzI2ybFPsT7ScgL55AnfCA/XmIyvt+ApdGYvlV
	 FNIVjtlt3Imj4ppwykjMmlbeCgQmxlJu0AeWCW/zC7VNubEy2F+fV98X5SirbhkK23ngW
	 q/aC4a7b8flQF50qHEVi8ACVZ+/ET830xeZIU+vtgR+5FLwbk6RhB6jY5lN5dbm2C8Fvq
	 B0ZkjuISWqqhQkx/yK3PthY+l1Z0K3ZBVXqfWzAu0sQEn9r0Rh/tpNcYPaywZrwDBViOq
	 eb+hc2hOtVotPp6PNSOrytB+/vas9mD0ii0nuVpJbVn9P1u+1Xr8WP+kLlNgtnt+eFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wLEpFTx8;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E937B60A6F76
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E937B60A6F76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wLEpFTx8
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4922dbcee23so587155f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243296; x=1794848096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilvmL95xJlpNSKLk5utHXZ1bIs/yE6trPAs8lvP1p2U=;
        b=wLEpFTx8Q7bDBbLEqKvn6LXr1ciTiCO9eaB/5CyiWkOI/4qthAM7bvwvYaT4FDXltq
         qGo8P/D2hcSG9ZZWLJS3VJhibPT+AQSTipfDZSrKhwRv0aJqCAgMUCUcrmALpbURDJrD
         0lS8w1YOdMtV/MRrZ3YrQUhbZYeMYP/hmQDQzoQrGKu4fRnJNCMZ1jdhypzq+rIGYvze
         f2WNn7IVEPVeWLIqEj5/ygoQQ0vy/aydkb3TzFTGYR/y7pohBg+t3lO1Tcky5MzZdYJb
         HBb7ifPVevhFJRWBjzsKMMReD92H2a/W2X7GNhQI0UQe543KLFz1ZR/Ww6Yndt3h6qlP
         Y7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243296; x=1794848096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilvmL95xJlpNSKLk5utHXZ1bIs/yE6trPAs8lvP1p2U=;
        b=2rlnn6yHIrWkWrMVVpfNyiMXPlAwna2IYxKwP0tUcM+9ftoWbU6dP2hveD9u9yceYZ
         u1m9eOC1CARwZ8ahDd/rZcY0xt6N9tQBf/sToDs62/6TZrQX8hku+Tkw6vXMUr617hRT
         ryUVyh98phMo+X0MGIe7ryjfmqtSZp9nYT8ziBGAxmjDq5XZ/zKNKHmW9y43SoTmihc1
         Ckb0UOzAw0ODKnwSUsE97UsgBEM08A3g+UQsODU8ZRcoBwooSTPHVvelj5RYGxeXsZ3k
         xM3G2ISRZ5kyCatFBnDDbKobN4Hn3BGP/L6g5RWe58+6UwM2UkUlNxWhZZCxMvg1LPpV
         R8xg==
X-Forwarded-Encrypted: i=1; AL+hErGOa1cgSqNJYNwRxOP8ZnbUVs35h4Xf06WpNjiWf0nfF+zEhCOjdEJUyDuJV9ROqVCeHsQZFbLsPFnf7qc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cmtbmq3HF8wbsxZR61sKjyOhBwk1Pl54t/0SF2vD4+NuH2f3M
	Gl6eDCachG16o7aQ/AB7C4tYqk4OlQcLuFPb/G+mkxCsZZpE034tt/Wa
X-Gm-Gg: AYBFou0HV0aDpx41lZfslj0Uo3oUAF8HHtXjwKNKa8MQ4YviHpLeYKgfinypI5ErLPT
	Gy8aPO4DdKcjsPDfgnH4xMC1hhV9v/pdIbAY/epKbKXA2vxmZIp3lJ9Efs2VUY2wJmE07U+wWMw
	2ZkZzqqRGDmbej2qID2VU3cFfFs5LXGJ6OTxYuy+BocMuKVE6/PR66j3+aKm5YyzqoV7REQSsh9
	x5CvD7v72lbOqmH3K9jivpWeNx8x6loKXRaQqAdEc2EeWZ6FwrhWekr1wkctafocXKocnmMFiti
	OX3xAHL2/ArNYH+bTq7k8KK5AHnlAuSLVwavn6GfpB6Rwl85V6mEYmW4W4cY+rjoruxEVsCWIbk
	g+KVM46jWNin/RlTCHXRIWcUlgKvhX3da1QCdST5Q1/tXvj7gG/WiBBLxmklcKfsTIPNR1F1ggS
	mgskNEFAYPc6IWW8Q4lW6rknXjvz0hNDux2fLhzTFiE8f/PWEDS8a3drH3yrB409wM/1jO73GNW
	427js3H35r3OnP9CeyPiZx7oERTJc9xueReVdQarYQb343UkT8le5P+sUKUssRE+Z9lc6W30FCJ
	es/VNLCgLOjiMzaUqT44lZMpzB8HsDDWGJZAi6WC8TywRdI=
X-Received: by 2002:a5d:64e4:0:b0:48d:f470:6b3e with SMTP id ffacd0b85a97d-4982f77eee1mr88084f8f.13.1794243296305;
        Mon, 09 Nov 2026 08:54:56 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm11392369f8f.47.2026.11.09.08.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:54:54 -0800 (PST)
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
Subject: [PATCH v2 bpf-next 09/18] bpf: Find fmod_ret candidates in bpf_scan_ir
Date: Mon,  9 Nov 2026 17:05:29 +0000
Message-ID: <20261109170550.141443-10-a.s.protopopov@gmail.com>
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

Find the functions which can become fmod_ret targets: functions which
return a 32 or 64 bit integer and have a path from the entry without
observable side effects (a clean path) which returns an error. A
fmod_ret program which returns this error instead of calling the
function then behaves like the path. List the errors in the record of
the function, sorted and unique.

Take only the blocks which no dirty path reaches: after a dirty path
joins a clean one, a branch may depend on what the dirty path did. Only
the block of the return may also be reached by dirty paths, as it
returns the same constant on all paths.

For now an error must be a constant returned by a clean path. The
following changes find more of the errors.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 scripts/llvm-plugins/bpf_scan_ir.cpp | 117 ++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 4 deletions(-)

diff --git a/scripts/llvm-plugins/bpf_scan_ir.cpp b/scripts/llvm-plugins/bpf_scan_ir.cpp
index 6700896749d4..6828fa73717d 100644
--- a/scripts/llvm-plugins/bpf_scan_ir.cpp
+++ b/scripts/llvm-plugins/bpf_scan_ir.cpp
@@ -3,11 +3,17 @@
 
 #include "../bpf/fmodret_metadata.h"
 
+#include <algorithm>
+#include "llvm/ADT/SmallPtrSet.h"
 #include "llvm/ADT/SmallVector.h"
 #include "llvm/Config/llvm-config.h"
 #include "llvm/IR/Analysis.h"
+#include "llvm/IR/BasicBlock.h"
+#include "llvm/IR/CFG.h"
 #include "llvm/IR/Constants.h"
 #include "llvm/IR/GlobalVariable.h"
+#include "llvm/IR/Instructions.h"
+#include "llvm/IR/IntrinsicInst.h"
 #include "llvm/IR/Module.h"
 #include "llvm/IR/PassManager.h"
 #include "llvm/Passes/PassBuilder.h"
@@ -22,9 +28,114 @@ using namespace llvm;
 
 namespace {
 
+static constexpr int MaxErrno = 4095;
+
 /* The errors which clean paths of a function return */
 using ReturnValues = SmallVector<int64_t, 8>;
 
+/* Return true and set N if V is an errno constant */
+static bool errnoConstant(const Value *V, int64_t &N)
+{
+	auto *C = dyn_cast<ConstantInt>(V);
+
+	if (!C || (C->getBitWidth() != 32 && C->getBitWidth() != 64))
+		return false;
+
+	N = C->getSExtValue();
+	return N >= -MaxErrno && N < 0;
+}
+
+static bool cleanInstruction(const Instruction &I)
+{
+	if (auto *Intrinsic = dyn_cast<IntrinsicInst>(&I)) {
+		switch (Intrinsic->getIntrinsicID()) {
+		case Intrinsic::assume:
+		case Intrinsic::lifetime_start:
+		case Intrinsic::lifetime_end:
+		case Intrinsic::invariant_start:
+		case Intrinsic::invariant_end:
+			return true;
+		default:
+			break;
+		}
+	}
+	return !I.mayHaveSideEffects();
+}
+
+static bool cleanBB(BasicBlock *BB)
+{
+	for (Instruction &I : *BB) {
+		if (!cleanInstruction(I))
+			return false;
+	}
+	return true;
+}
+
+/* Add the errors which clean paths of F are known to return to VALUES */
+static void cleanReturnValues(Function &F, ReturnValues &Values)
+{
+	SmallPtrSet<BasicBlock *, 32> CleanBBs;
+	SmallVector<BasicBlock *, 32> Worklist;
+	bool Changed;
+
+	/* The clean blocks which the entry reaches through clean blocks */
+	if (cleanBB(&F.getEntryBlock())) {
+		CleanBBs.insert(&F.getEntryBlock());
+		Worklist.push_back(&F.getEntryBlock());
+	}
+	while (!Worklist.empty()) {
+		BasicBlock *BB = Worklist.pop_back_val();
+
+		for (BasicBlock *Successor : successors(BB)) {
+			if (!CleanBBs.contains(Successor) && cleanBB(Successor)) {
+				CleanBBs.insert(Successor);
+				Worklist.push_back(Successor);
+			}
+		}
+	}
+
+	/*
+	 * Keep the blocks which only clean paths reach: after a dirty path joins
+	 * a clean one, a branch may depend on what the dirty path did
+	 */
+	do {
+		Changed = false;
+		for (BasicBlock &BB : F) {
+			if (!CleanBBs.contains(&BB))
+				continue;
+			for (BasicBlock *Pred : predecessors(&BB)) {
+				if (!CleanBBs.contains(Pred)) {
+					CleanBBs.erase(&BB);
+					Changed = true;
+					break;
+				}
+			}
+		}
+	} while (Changed);
+
+	/*
+	 * The returns of the clean blocks which only clean paths reach or which
+	 * one of them branches to. Dirty paths may also reach the latter, but
+	 * the returned constant is the same on all paths.
+	 */
+	for (BasicBlock &BB : F) {
+		auto *Return = dyn_cast<ReturnInst>(BB.getTerminator());
+		bool Entered = CleanBBs.contains(&BB);
+		int64_t N;
+
+		if (!Return || !Return->getReturnValue() || !cleanBB(&BB))
+			continue;
+		for (BasicBlock *Pred : predecessors(&BB))
+			Entered |= CleanBBs.contains(Pred);
+		if (!Entered)
+			continue;
+		if (errnoConstant(Return->getReturnValue(), N))
+			Values.push_back(N);
+	}
+	llvm::sort(Values);
+	Values.erase(std::unique(Values.begin(), Values.end()), Values.end());
+}
+
 struct FunctionDescription {
 	Function *Fn;
 	unsigned Flags;
@@ -86,10 +197,8 @@ public:
 				Flags |= FMODRET_FN_WEAK;
 			if (Ret->isIntegerTy(64))
 				Flags |= FMODRET_FN_RET64;
-			/*
-			 * Nothing finds the values yet. A weak definition always
-			 * has a record, see fmodret_metadata.h.
-			 */
+			cleanReturnValues(F, Values);
+			/* A weak definition always has a record, see fmodret_metadata.h */
 			if (!Values.empty() || (Flags & FMODRET_FN_WEAK))
 				Descriptions.push_back({&F, Flags, std::move(Values)});
 		}
-- 
2.43.0

