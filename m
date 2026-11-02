Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655324;
	b=s0zeyi1oT0tSUDcvmkv6VCmKhLEWCLdMAFxPAfCgG7ZaktsUN6Oyoqq3o2luetI5taYO
	 6Jvde1SjTSVUXlk0T64yB/cWB7+H3BxGHh9C96d3fiZaZTFCpKPk0wuOFBtv+Df5sI/xf
	 LI5Nt1SwQV+ys7rgCKsM5lcTKiGtHRZY68hzx+776adcoag/hPg1f5mv7gXxfKQH10w1p
	 5wZ3c/ZVNTEsvKydgT3SmSwl1fdMdXFzVAwsS9iDDtiB6MSzWiR1PKJ8sdaw1rwmhjQFY
	 GcYYG/EE64cs1r1fLTPYBsHgQKmFgQ03SsbJfg4kTMISKq5TGJLCnMyIVb/AKaLGQlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=5QwQx03h+wjrVvTZTSdn9Uhg/gvtzJw9vZpNUdm3/2s=;
	b=bNzxH5FwdzMgOY+fvMpj+qYI3ZHn2j1+GCnaptzvqO3ej7evq2jq6TpbulsT44bpOMQI
	 PwBw0Yjm/jXSKf/00u+tGzU59V+UqhUF6s3cmZO9EdZzgvOwJ5C38KS2QycOTMKZpLuya
	 L5cyAnmwDuHTQSyQNgIvQyjtmsNopg+6nLZKS9Iyi7naA/YQ3DLFlVliXZm1oBc/pvxJO
	 im+GUBoPmw9wUILrLmupsywkUlzE4gj2764e5eVeXJp3S1ehJIRuE69vN16Occ8Og0jgw
	 Ebxwzxlg4qtTfpsolIy/FyZVaVSxpDpmogGb+5lQWqR1pFzLUaVMrv83kMtsWRL4ocA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=zK0nfpaE;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50909606D81D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50909606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=zK0nfpaE
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJQ3c0Zxbz1XLksb;
	Mon,  2 Nov 2026 21:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1793655321; x=1796247322; bh=5QwQx
	03h+wjrVvTZTSdn9Uhg/gvtzJw9vZpNUdm3/2s=; b=zK0nfpaEj84RO3KvSC4US
	6jurkN0iiIPdVW5ob8ffkpASsYgjFqJmevpVCJOriPS+xODmRAjOBkNhpOSwaM+s
	6a0BQQGE02gN6EM5vXcMWk/W1oCpZoWBEwErJ/qavtK8lCdGz06GfT44vnBoUT6j
	BSp20BMMFFYVhymUvJ3MR9Y/X8+DSnLwjRlpQP1AAtikI3Ec2Yc8l75bqSga+zjo
	jdwdI+gJKrIBXKeNV04JIgU3c/onOrXh/J6Jk4h8210eF1GI0BaYp+DtsQRUxZCH
	UEq515BZEEcr6EORg20ykZk3iTLeCHJwpYSi0Y0XsR0FMAEsNhpbi0kQ+RtLmlw9
	Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Tdl9OVzV7Xfx; Mon,  2 Nov 2026 21:35:21 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJQ3V6919z1XLkrq;
	Mon,  2 Nov 2026 21:35:18 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 03/14] tracing: Disable branch profiling for COMPILE_TEST builds
Date: Mon,  2 Nov 2026 13:34:33 -0800
Message-ID: <10b4ee6816847c61b4de8ba13c6b784577df9aba.1793654853.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <cover.1793654853.git.bvanassche@acm.org>
References: <cover.1793654853.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

WARN_CONTEXT_ANALYSIS depends on !TRACE_BRANCH_PROFILING because branch
profiling instruments every if-condition and obscures control flow from
Clang's thread-safety analyzer. Make PROFILE_ANNOTATED_BRANCHES and
PROFILE_ALL_BRANCHES depend on !COMPILE_TEST so that allmodconfig and
allyesconfig builds do not enable TRACE_BRANCH_PROFILING and instead
enable WARN_CONTEXT_ANALYSIS_ALL.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 kernel/trace/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 35d043b19332..afbf17099a68 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -687,6 +687,7 @@ config BRANCH_PROFILE_NONE
=20
 config PROFILE_ANNOTATED_BRANCHES
 	bool "Trace likely/unlikely profiler"
+	depends on !COMPILE_TEST
 	select TRACE_BRANCH_PROFILING
 	help
 	  This tracer profiles all likely and unlikely macros
@@ -698,7 +699,7 @@ config PROFILE_ANNOTATED_BRANCHES
 	  on if you need to profile the system's use of these macros.
=20
 config PROFILE_ALL_BRANCHES
-	bool "Profile all if conditionals" if !FORTIFY_SOURCE
+	bool "Profile all if conditionals" if !FORTIFY_SOURCE && !COMPILE_TEST
 	select TRACE_BRANCH_PROFILING
 	help
 	  This tracer profiles all branch conditions. Every if ()
