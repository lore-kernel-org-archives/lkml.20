Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC6A4AA593
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150571; cv=none; b=LW7PDfKw1wvveCCeLlRpL/bOqDd1QoJVmuKOkCiwuhL3UtZ0TMIo7r7XPpzI4gmJbCdCvyzkVmx0rifJq9+GZxCXM4mkBF7gvkJgl57ZPIt72gsJnBm9ZCOapCBOn2vvl+Tei53IOwhs31sVzZzquATzHG1ykdPZo261eP4Y0sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150571; c=relaxed/simple;
	bh=/dXltKE1uWt63xL7vxgzBA2r0GARK1HXIChg0CjL+YI=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=V2A/EWC60RuuG+Zbbl+fLJ10snW54T0ucJKCk4oAOHfF5M2n/184ft48VogBWiTYzsikXKwpXSDJgADeJNG3IorKTxGUW049rSLiDq2HoMzUTAzYXIYZJdfcIlHFGsOKvKNl8/YDsj2B1MdOLaQPTDH9WpTrkkLtlbXF/zIJXeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxHeh5+2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxHeh5+2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B971F00893;
	Fri, 11 Sep 2026 18:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789150567;
	bh=XWcjwC5fgxx+7KGLp4IBpaCrJA71ftjVcULn4yY2ecI=;
	h=Date:From:To:Cc:Subject:References;
	b=lxHeh5+20Ra4eAAryS+uDTVknwiW3IWpZegteYBjJIg86NopfTOL/2GKYxpGTFdeY
	 ri8H5dfnNV4Jbx179V9pBuMeWDCPpEuSCwhdCjCEY1XLQcBbPZKtEb3g2XClRXjKUk
	 lsVvyS68T0F2ApH2RXSI+dGNHf/2SrPCbrS2D8TsEU51CYNWcbk59LoagxxN7KhmlH
	 HqfbBYT1ZjtRiRoX3d8pKPvDnz3h3oR9Hx5eeERtH/DGpiKsjt1k8h8W46GWhOPfY3
	 k2KULYucO8L5HXZgq9r0Ix8J2RzKNx1+EJcXBbyJN8OAuK1L9R+fnliu78f1Nz7aR1
	 ilN9+HQ4Wz3Lw==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x55oW-000000094w7-43Fb;
	Fri, 11 Sep 2026 14:17:28 -0400
Message-ID: <20260911181728.762216562@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 11 Sep 2026 14:16:39 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [for-linus][PATCH 03/20] fgraph: Remove unused FGRAPH_MAX_INDEX
References: <20260911181636.485043797@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>

FGRAPH_MAX_INDEX has no user, and it expands to FGRAPH_INDEX_SIZE and
FGRAPH_RET_INDEX, neither of which is defined anywhere in the tree. It
was added in that form by commit 91c46b0aa917 ("function_graph:
Implement fgraph_reserve_data() and fgraph_retrieve_data()"), which
introduced the current data word layout under new names, so anything
referencing it would have failed to build ever since.

Remove it.

Link: https://patch.msgid.link/20260905211922.1196366-1-donggeunyoo.kernel@gmail.com
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/fgraph.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index 40d373d65f9b..ed455b53513b 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -143,9 +143,6 @@ enum {
 #define FGRAPH_DATA_INDEX_MASK	GENMASK(FGRAPH_DATA_INDEX_BITS - 1, 0)
 #define FGRAPH_DATA_INDEX_SHIFT	(FGRAPH_DATA_SHIFT + FGRAPH_DATA_BITS)
 
-#define FGRAPH_MAX_INDEX	\
-	((FGRAPH_INDEX_SIZE << FGRAPH_DATA_BITS) + FGRAPH_RET_INDEX)
-
 #define FGRAPH_ARRAY_SIZE	FGRAPH_INDEX_BITS
 
 /*
-- 
2.53.0
