Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619629;
	b=Vo3jekGnNkOKedRc3ewKqOXeD64W+qzPTtoIq2oPrHDJ6Lde0mZQ2EnIcj3vSkiqANM3
	 7my/mvT79QzvKteDC7cUCH+LmkLVi0FIK/iETP9+5okilOLueYxTw7ZPuUB2EdypSvOX+
	 4g6v+IwPYF5kjtKBE5Q+xl28Zx9rWNQ5PcYk1rejxgSFgbfxnPJeYXhMBkXaYZRD7zPAJ
	 9fsf9X8xgg/yQEplcWsiKSasYBZyuUOVcyqt+t11n3CLzh07OrCyZ64RBBi1fea5W5dOp
	 N7dmAab8MoCzpx8X2Q4tDbdLLIa304jnzBEUr7LjOIVBGWINw1pH8guTDodFU2Lue3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619629;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=ewRYouSxvIWaazZi94wp2TDVLWbDFLbJK7EsISBWy6k=;
	b=kqP8NX6id+017iEQmP8XM+w82GGolJbEiklmgZ1B3gWj1I/+f4tevYyjQ87uj5gGo9v8
	 MVioFD1BhkP1k3qu+aokhMT4y19NHLB0SwzK1oZSdIkBjs0d4DIYUpRjgk43nb8lUkj2Y
	 c1O5wojA3kkdB41lBEfwEY8eFXN+Ue+tuZKS1/TIUmBrS+qPksHEi6ojfvdYHbrTlC4tr
	 9Ed6l8mvbwE7tODYa4s5v4PRyW3EP3hzFwQ+Neu/2c/AmBDWLmOqtVHgs67PomeUbqGta
	 +uo96qCjlSF1XCVB2gyVzYex9X1YdubcUBv14XyqHyCt3JImHX7Iw4saFy/cRn9/fWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=dzqBFdzV;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EDF606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3EDF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=dzqBFdzV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=ewRYouSxvIWaazZi94wp2TDVLWbDFLbJK7EsISBWy6k=; b=dzqBFdzVLDCocW8Zt17zvdukBv
	AeAK1sYB62UO6UbIL1cF/GxCb1A6InzpwUtFQ9xY/hGRkokoURgwsJ+Ea3zF0OrXWPVNhUVDBzXMr
	2ZrlkTZZMzFc4ATcOy3NGyPcF2eUKxFPOLeAVLxmNIwfmKOekMq0rVXNpHeGlTK/VA9Fz7hzJWZu1
	/PEeQFXz+BFehxTh1VBFt2LKrw9V3ysPP0Xsx3tbUAc5uAtNNB23wkeMNK6rWd7HEnbgMcpaGmv2G
	ovcFPUAyttRThyUDEJnl3LYcPSSyG7RhDFLmgOyjNan0Pu0JV8cHI09Zss0VXUXj+CgEeUuTRbTYd
	8wIPE3iw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqOn-00000002K7Y-1r31;
	Mon, 02 Nov 2026 11:40:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 7A5F2302FFB; Mon, 02 Nov 2026 12:40:24 +0100 (CET)
Message-ID: <20261102114000.552033727@infradead.org>
User-Agent: quilt/0.68
Date: Mon, 02 Nov 2026 12:25:51 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 jpoimboe@kernel.org,
 leitao@debian.org,
 keescook@chromium.org,
 hpa@zytor.com,
 kernel test robot <lkp@intel.com>
Subject: [PATCH 2/6] objtool: Add instrumentation_weak()
References: <20261102112549.714541309@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

The strict pairing of instrumentation_begin()/instrumentation_end() gets in the
way of tail-call optimizations, since it requires writing code like:

  int bar(void);

  noinstr int foo(void)
  {
    int ret;
    instrumentation_begin();
    ret = bar();
    instrumentation_end();
    return ret;
  }

Introduce instrumentation_weak(), which is like instrumentation_begin() but
does not nest and does not pair. This way one can write:

  noinstr int foo(void)
  {
    instrumentation_weak();
    return bar();
  }

And get tail-calls without objtool getting upset.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/annotate.h            |    1 +
 include/linux/instrumentation.h     |   17 +++++++++++++++++
 include/linux/objtool_types.h       |    1 +
 tools/include/linux/objtool_types.h |    1 +
 tools/objtool/check.c               |   17 ++++++++++++-----
 5 files changed, 32 insertions(+), 5 deletions(-)

--- a/include/linux/annotate.h
+++ b/include/linux/annotate.h
@@ -71,6 +71,7 @@
  */
 #define ANNOTATE_INSTR_BEGIN(label)	ASM_ANNOTATE_LABEL(label, ANNOTYPE_INSTR_BEGIN)
 #define ANNOTATE_INSTR_END(label)	ASM_ANNOTATE_LABEL(label, ANNOTYPE_INSTR_END)
+#define ANNOTATE_INSTR_WEAK(label)	ASM_ANNOTATE_LABEL(label, ANNOTYPE_INSTR_WEAK)
 /*
  * objtool annotation to ignore the alternatives and only consider the original
  * instruction(s).
--- a/include/linux/instrumentation.h
+++ b/include/linux/instrumentation.h
@@ -52,9 +52,26 @@
 		     : : "i" (c));					\
 })
 #define instrumentation_end() __instrumentation_end(__COUNTER__)
+
+/*
+ * A very much weaker variant of instrumentation_begin(). It does not nest and
+ * it does not pair with instrumentation_end().
+ *
+ * Its purpose is to allow calling instrumented code while preserving
+ * tail-call optimization, something which is otherwise impossible with the
+ * need to call instrumentation_end().
+ */
+#define __instrumentation_weak(c) ({					\
+	asm volatile(__stringify(c) ": nop\n\t"				\
+		     ANNOTATE_INSTR_WEAK(__ASM_BREF(c))		\
+		     : : "i" (c));					\
+})
+#define instrumentation_weak() __instrumentation_weak(__COUNTER__)
+
 #else /* !CONFIG_NOINSTR_VALIDATION */
 # define instrumentation_begin()	do { } while(0)
 # define instrumentation_end()		do { } while(0)
+# define instrumentation_weak()		do { } while(0)
 #endif /* CONFIG_NOINSTR_VALIDATION */
 
 #endif /* __LINUX_INSTRUMENTATION_H */
--- a/include/linux/objtool_types.h
+++ b/include/linux/objtool_types.h
@@ -66,6 +66,7 @@ struct unwind_hint {
 #define ANNOTYPE_INTRA_FUNCTION_CALL	7
 #define ANNOTYPE_REACHABLE		8
 #define ANNOTYPE_NOCFI			9
+#define ANNOTYPE_INSTR_WEAK		10
 
 #define ANNOTYPE_DATA_SPECIAL		1
 
--- a/tools/include/linux/objtool_types.h
+++ b/tools/include/linux/objtool_types.h
@@ -66,6 +66,7 @@ struct unwind_hint {
 #define ANNOTYPE_INTRA_FUNCTION_CALL	7
 #define ANNOTYPE_REACHABLE		8
 #define ANNOTYPE_NOCFI			9
+#define ANNOTYPE_INSTR_WEAK		10
 
 #define ANNOTYPE_DATA_SPECIAL		1
 
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2435,11 +2435,15 @@ static int __annotate_late(struct objtoo
 		break;
 
 	case ANNOTYPE_INSTR_BEGIN:
-		insn->instr++;
+		insn->instr += 2;
 		break;
 
 	case ANNOTYPE_INSTR_END:
-		insn->instr--;
+		insn->instr -= 2;
+		break;
+
+	case ANNOTYPE_INSTR_WEAK:
+		insn->instr += 1;
 		break;
 
 	case ANNOTYPE_UNRET_BEGIN:
@@ -3535,6 +3539,11 @@ static int validate_sibling_call(struct
 				 struct instruction *insn,
 				 struct insn_state *state)
 {
+	if (state->noinstr && state->instr > 1) {
+		WARN_INSN(insn, "sibling call with instrumentation enabled");
+		return 1;
+	}
+
 	if (insn_func(insn) && has_modified_stack_frame(insn, state)) {
 		WARN_INSN(insn, "sibling call from callable instruction with modified stack frame");
 		return 1;
@@ -3545,7 +3554,7 @@ static int validate_sibling_call(struct
 
 static int validate_return(struct symbol *func, struct instruction *insn, struct insn_state *state)
 {
-	if (state->noinstr && state->instr > 0) {
+	if (state->noinstr && state->instr > 1) {
 		WARN_INSN(insn, "return with instrumentation enabled");
 		return 1;
 	}
@@ -3646,8 +3655,6 @@ static bool skip_alt_group(struct instru
 
 static int validate_branch(struct objtool_file *file, struct symbol *func,
 			   struct instruction *insn, struct insn_state state);
-static int do_validate_branch(struct objtool_file *file, struct symbol *func,
-			      struct instruction *insn, struct insn_state *state);
 
 static int validate_insn(struct objtool_file *file, struct symbol *func,
 			 struct instruction *insn, struct insn_state *statep,


