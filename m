Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437841;
	b=WfpBoTk7vH2F1U0QVH5jNUfssY3PSVomJshkygQ45hcxl3ty6IR0C4Jzh9/sNyqVpSzW
	 Ln4yhF0b2cqTM3AB/16xPso95vT21kRmBFCLRBuQIDFNIjGxdtqyIH7Z0D3rM/0o6EbjZ
	 CVMdu31cr5h+05T382+/eCOKcy0+9y4UlT64kxFc9l4mRASXxV333EQgf00v/OfY41quB
	 w38RNBVtxL5BZQMZJGdDX6kgcSZwJtilM9mIxVNbJIM2K5tQS0kN1XafnM7tvEyBd5POx
	 OM2adFbFndfELCZDG7+88V50+WjribdOnRNAFLzZYd+aFBQQSGT2Bz13LJaIMHE+mDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437841;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=BhqVhERLNGpcKm+IlALhwWHGvlqyREkzX/qkkHuDSlw=;
	b=B5P5TlN3Fo1otMeQgWdjOpf6WGHUce4eewam7eCelzN5vmQ7D2a89K5RgBx4XjUOxrOE
	 B0REdNtiSbj8QIDzIG7BEjw0oc3sZnN+etNtiOrJSt7K1muzc2nV+8dhtPRWELP5dSYxD
	 iY5BMukNUUfmHM8FJv5DnJ7SMhmM2VoDv2ItnqtC28wyT7y97IwVSXkOVPnSWgKkBj3PB
	 dC+Uux85Yf+mKX/ipGlSYWnZTOPcgraV+MkjGlm5BxZsbMGJ513m1iqLPlIIlUn/bXlfv
	 I+B/KREwNGUYe/in/Ns/CGmeAsg2pFYPzgO52DZqu/BDwnnP3lpIbVfo923EHLzZX6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWhnF+U6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88AF60A2604
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWhnF+U6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6851F000CC;
	Mon, 19 Oct 2026 19:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792437841;
	bh=BhqVhERLNGpcKm+IlALhwWHGvlqyREkzX/qkkHuDSlw=;
	h=Date:From:To:Cc:Subject:References;
	b=JWhnF+U6buK6nv4k5HkzWpToMwzG6zR1xvTeGJtjNWkk4PQqTKvo5wo2by/hbvR3E
	 LySxcDqgog+TPVCJIFaYNx+7hVMa8t4R81Ie3Bs2PEHWH32LWNCUZZCGtCdSi6c7I+
	 Fu3atJrDd63FuiA2SdmjZfg4PGDfip6VqLV1b7/8huf2x6dCoO0J3X/wWKPTgWewDA
	 nIEsHA4oGAALITFJcLTjiPjjlaNhgyUFINhk09hnotU0XDt0GX5aawNaObhOpxyKic
	 Opfu6Fue4Rt8yM9CrczCHP8NdHANa90RJPA1KCaDRVVaQblEJp5GMqnVZ3SRMT6KTA
	 47xgF5TBfvveg==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xIsxk-00000001eJF-3DcT;
	Mon, 19 Oct 2026 15:24:00 -0400
Message-ID: <20261019192400.578677776@kernel.org>
User-Agent: quilt/0.69
Date: Mon, 19 Oct 2026 15:23:52 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ben Cressey <ben@cressey.dev>,
 "Florent Revest (Anthropic)" <florent.revest@linux.dev>,
 "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Subject: [for-next][PATCH 8/9] ftrace: Let ftrace_call_adjust() reject a patch site
References: <20261019192344.004592683@kernel.org>
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

From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>

When ftrace_call_adjust() returns 0 for a patch site,
ftrace_process_locs() does not skip the site. The NULL test runs before
the adjustment since commit 6eeca746fa5f ("ftrace: Test mcount_loc
addr before calling ftrace_call_addr()"), so the 0 is stored as the
record's ip and ftrace_init_nop() later hits the BUG_ON() in arm64's
patch_map(). Test the adjusted address too and count the site as
skipped.

Link: https://patch.msgid.link/20260924-b4-arm64-callops-kcfi-v2-2-587865b6d991@linux.dev
Reviewed-by: Ben Cressey <ben@cressey.dev>
Reviewed-by: Florent Revest (Anthropic) <florent.revest@linux.dev>
Assisted-by: LLM
Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index c8f8dd1cb92f..b2597eb9581b 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -7707,6 +7707,11 @@ static int ftrace_process_locs(struct module *mod,
 		}
 
 		addr = ftrace_call_adjust(addr);
+		/* The architecture may return 0 to reject a patch site */
+		if (!addr) {
+			skipped++;
+			continue;
+		}
 
 		end_offset = (pg->index+1) * sizeof(pg->records[0]);
 		if (end_offset > PAGE_SIZE << pg->order) {
-- 
2.53.0
