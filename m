Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251641;
	b=3WdE5yh6XfeigGXUYFw3RYt+AVfpGczYWri43G46g8NMyy6J1I6AkE6u7vsbQUnwjI42
	 4ucO8E75k2g2RnYh6zgaG2FCf/TZU8E4hJZSoGAftzuuCluuWIO5lMgI723Z5RRtkWmye
	 zx2nnOBNxUnaPQAgeT1wI9o1gnnorwp1sKUIO88LITOYVV8HXFHKbFM14BayVnJ3AF4kM
	 Au+W3ZN7S1A+ipfoUivMKAngj7gYgo/EMbgsZYJ1G0WIi6EOA6c32/LujsMfcjhaEyy+V
	 b6ks3CBBJSU+Jx6tQO0CAIKuU4nCB11nQNTqqTfM038kKMx8/CWkaz0jWrq5G5ATwHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=5QwQx03h+wjrVvTZTSdn9Uhg/gvtzJw9vZpNUdm3/2s=;
	b=n/I5uZenXMIAzJGNhdG7muSRDjF+JG/7ZEB9B52VnukPRlpzvQj3M/RXY5Vgn65QSDv8
	 YdNRC/ek9MSBq+TfVNnZzFYSwnHVJzo8ve+YUKakNPJzAwGQDoDfYs8HiFZQw6J1guVeI
	 sX7PXFHWRFoeO+8r4qkwe9PTouTSfMBduYs5aD9wU0xfSIRXGb3zcq6p79nI7fLpBbFh7
	 mO3/QXdjPr0Ul6tH8HvVWDU8mQUiMakLylTvRdCu5eUqttDVSnnIjrFZuHGnYegviFd8r
	 xIPDsWUmyTieZ9simS+RJ+PkbO63SeSR24XZ+x4D5zkzMGzbeGqzow0fJjSI6iiVSuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=MT0bGk23;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD87606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DD87606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=MT0bGk23
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jNfbD3h6rz1XM0nj;
	Mon,  9 Nov 2026 19:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794251637; x=1796843638; bh=5QwQx
	03h+wjrVvTZTSdn9Uhg/gvtzJw9vZpNUdm3/2s=; b=MT0bGk23iITipS8HW14mW
	TXy28TfhRqPb6Ov4+CFjnaggXgJKXFWO+gi39GMLSTnfs1N7ahHy+Rq51TbIipnH
	KT+ExwYPDvW6EUPDnnAD7vqj6W9gF0uNAVPzanUYhLVBZyez5L4w25uTOKZmtBFD
	jHHi71bEulsMd9f6er0Z6X9Wcxo8QiPYmEr5enWGpOyFPeDKFaQCaoqeeoqjfio8
	sg+oxLnIH1QnDNXHpKs//Pe1/N6OSABYQ8yW596H+Q7sNE3ljk3X9Vnf/B5QlMJ8
	yPYmtM015e7rVLpi63L3Vt6IAxRmX/WUCkhv4nDpnGoDGUzj1jrnlooOZh1OKmkN
	w==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Z2OhS-rSoQ0u; Mon,  9 Nov 2026 19:13:57 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jNfb845fKz1XM5kD;
	Mon,  9 Nov 2026 19:13:56 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 03/14] tracing: Disable branch profiling for COMPILE_TEST builds
Date: Mon,  9 Nov 2026 11:13:11 -0800
Message-ID: <30ea46a36f2985e32389067317977371e6776e27.1794250850.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <cover.1794250850.git.bvanassche@acm.org>
References: <cover.1794250850.git.bvanassche@acm.org>
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
