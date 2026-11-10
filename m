Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328177;
	b=XEpOiHDEiZUK2PAtGm0vpqqq3YDtwZCBSfBVPBjsO2IWrZFrOk48hS7eJw+qfMrhSWli
	 OEy+zXrMOkr3rl/p98XzPjZ7ld3u7qApijHWHGP4VaMbA1O9zmFJdgDoFN25mAj1gmd3M
	 AnmyD6TV9r4EPvH6JtMZgtHyi5BucfAkZIpxSnKUx+0Fi36r4lazZB/61/K/Tv6DWDJzP
	 RTxdwj2mjrfLnmhPxGHAFYDOTdoWhpf0aEHfEnlgAL/7DAFoNJ0rKPU8+7rUUwpYTWJgi
	 zm/f6rXRRFiUWmZ7ao1n0D3VO/Snv1MlaIR5dauqjAMHFHwbzPnJ73z4P/evWOY3gLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gpwg1YP2mQgmQICmCEtUBpduhAkgOFMLRku8rx9ELSc=;
	b=Hd74d45vbaJHgCenmAfdpNCulLx+fo9jsCI2l80AdrNvUdw0YGA4ho2/1jRLg8mC8q3P
	 jhr7L8tQZRQVs0K3evtC8HU0FQ1ql7TiKkbIN9tWyNekiI8yHqLOpYLHiSUaID35Yxg6G
	 xPzY6CVvDvGtgAqc1skHCNer1OrWpeqcaS9CjP/g/wN5zLZPb0QZDGFnT3Vh7uFIOpAPk
	 vd7QDHBQ3oUittIbcBsOICe8Kwn26yyVb08DvB/uR6Ah/5bkL0xL+wltHT9S+7EVrjifR
	 uynXDR4JpoVK6RiUSua56uHzouDFI8b5iB12f/JP2sb6ljrEKXxFiBpd59iemf+MSVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mg/iG5RZ";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B032606A898
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B032606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mg/iG5RZ
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so19322845e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794328176; x=1794932976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gpwg1YP2mQgmQICmCEtUBpduhAkgOFMLRku8rx9ELSc=;
        b=mg/iG5RZ3k5L17FwDK4srbtZUnw82HRTLNQl9edXew0yLEVH0EhWVkHFlIFGtpoVHL
         9FOezbNtYtYNKSWjZ94Bd8riW0Jty3rXghj6DXWrsnB0OHmn6boWPobW0tSy1rPg7qKt
         wZRrYg9uO8F/gCiopOMgQTQz957O4o5PAyKk+wOy1nYIXvagM7LaKmoNf69EQKTX0g45
         gMf/HkVf/dr8/3hdQ7xyEQY/WutjmRznj97Ly0v/+0lC/BbkpJp4j39tfpMVG1szsIwN
         PxW4ynlU/g5RLBm8OAM4sM7lqPVADPZbBZa6tEp66wBt3XiHW1QvYhZL45/Pug5fbv35
         B2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328176; x=1794932976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gpwg1YP2mQgmQICmCEtUBpduhAkgOFMLRku8rx9ELSc=;
        b=So1fAVpFGxnMnPJrHkzTP3xV6ByQZ5xE2SC51JPqKbLNlOJ7bl8VWQc1f7HBcoEZ/Z
         jbhwOc7UFO9iO2aRwkKNngYOsTWQMApPnEYmeQtNdGNKf7cpBJPNS15tA2rXheG+g0sb
         wll1GqDRAcPs4IMeuVuzrPNTz8EtG433Cuz48VbTMgwAg6RjvH7cdPbuKc6lNjwtrpH5
         +8+LeW5BdLivb7vt0xaub/mcMMMsEysrm0FinDfkeyn15P9F5yf0upYdM6Tc16Q6/YeQ
         bOmMKhx6QXC/uG9kZ+7XkgGfD1micXlsII2bGBlm0fJuFesPe3+jVNFHIyQ+5kBfNjHM
         pgAQ==
X-Forwarded-Encrypted: i=1; AL+hErGV1DgCT76bJDoV8hi1aooE2gt5+IG6cj58U8+sRJ0J8UZEMQoGOjRCBVdQUFOej4eY86qiOiF3O7rrSsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JclnSYc0DpB5M9p9DzkaXHPkoHbWi9M6bx3PH+O5H/GNL27xG
	6FhOnU5xjPYKp4aQTz0U/7KXk8umaJnRWm/GOUZ7YefV0tJZIpztU7qW
X-Gm-Gg: AYBFou155sh4t/3OlDovdyDlwHAGVckb0E4nh7ljQtuHaRkqN2ADWzMuYf1b69YUKi0
	CGexr4S9Egz2Dj1/3LR+QxlQfj8WVHVIZYGSq3PCJc8ZDXFnGBbhRj9n9uve/AYhlBvQmiKJ8cW
	BZRTCrcLZpECiggsLfefkkQO/cK+ne0WutptDaq8Ldw7yUYez60h8HDOBH/oIDcvxRzbTMyZG31
	kMPYJ2K4S2K7PobRa9xX9LgZ3kWMrlfBlJQL0m3uV6BMNW94DY8PWfLQzNKY2yYyxtJQtbnE2fb
	axZZxzy7rdHumKelj6bm7NXv/qfuAi1nXYSNb4oOx4E2zUGujgnQDl7yALbBhXukZ7rTazO2xAo
	NLENr2CgoEtEq7R28aD3CAgkcDVfoM8yjC3oXisE5NlZezdTrTKC0ysuf8T3rRtjmraFoBO7FXD
	Gp9m96h0JnTDF+ouCJuIcSfK3qod+5XVf4wqVsynhcUo4nqhPxOEpN+vFrRuasfwRG4f+SDhrpe
	flrLLGReqa64uTTBjnMe8EEhl+n8tKC3EKPmNr1h6dWxgkpQZawp4KJfhsR+ItmWfjVkxKMZjOI
	+Fcoep8FrjjQ5Az+aN3bWksPhLbOl3xAUrzRlQArER+8cas=
X-Received: by 2002:a05:600c:3b2a:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4ba0230856cmr53465545e9.3.1794328175765;
        Tue, 10 Nov 2026 08:29:35 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm71287485e9.10.2026.11.10.08.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:29:34 -0800 (PST)
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
Subject: [PATCH v3 bpf-next 09/18] bpf: Find fmod_ret candidates in bpf_scan_ir
Date: Tue, 10 Nov 2026 16:40:29 +0000
Message-ID: <20261110164046.454431-10-a.s.protopopov@gmail.com>
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
 scripts/llvm-plugins/bpf_scan_ir.cpp | 122 ++++++++++++++++++++++++++-
 1 file changed, 118 insertions(+), 4 deletions(-)

diff --git a/scripts/llvm-plugins/bpf_scan_ir.cpp b/scripts/llvm-plugins/bpf_scan_ir.cpp
index 6700896749d4..3684918eb7fa 100644
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
@@ -22,9 +28,119 @@ using namespace llvm;
 
 namespace {
 
+static constexpr int MaxErrno = 4095;
+
 /* The errors which clean paths of a function return */
 using ReturnValues = SmallVector<int64_t, 8>;
 
+/* Return true and set N if C is an errno */
+static bool isErrno(const APInt &C, int64_t &N)
+{
+	if (C.getBitWidth() != 32 && C.getBitWidth() != 64)
+		return false;
+	N = C.getSExtValue();
+	return N >= -MaxErrno && N < 0;
+}
+
+/* Return true and set N if V is an errno constant */
+static bool errnoConstant(const Value *V, int64_t &N)
+{
+	auto *C = dyn_cast<ConstantInt>(V);
+
+	return C && isErrno(C->getValue(), N);
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
@@ -86,10 +202,8 @@ public:
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

