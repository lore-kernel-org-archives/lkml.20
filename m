Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC433E764F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820620; cv=none; b=Y1yDpp7+ds/7NxgFN49NI7u8+P7o31M5rBUnARzwgAgfE8Bqe4+XeaUDFto412Unj/fxcp4TDpH8njpKLhHCZEBPfu5yC7iDBfss7rc8FJOBa51RMa9zu+X4AC76mD+B4zgQbYCQhlwU4+Qx/FwLUi8MsVFbaM5CcSpkPfIZ8Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820620; c=relaxed/simple;
	bh=UUtg24uMtezL1PSnw3eID1209ibYhnVW30qSpuB9m1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kuXPuqrY+afSEYLg6s+NS7cxVch9L2nWGFvQnEeLVxbtvQQX9tDqCl4uywZmN78d/SV3n/ookzljzcFLV2qOBt2zeggpnNGCnyIER9LYEKU2UYjeniRQfHrs+Z9o1jXvHOXK9x9Pu1tIICiTTdcSzz+0DB23eIw5TWOMSRPGl/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=AMLWuMMT; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="AMLWuMMT"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so638224a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1787820618; x=1788425418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKZ6u/wqQ8d3u6q9Lp+QtNXkUz6sKkb9jejuBTbsvrw=;
        b=AMLWuMMTuQAPK9C07bK32Oi8yMO2w03jnswK2aX0naEpSb3nuvce0CdTuAF4YrAqeg
         ocZSy2HGJjSjmcyrCPFHwERSrYR7DQ8JXW47RzZSNtRVA6OIkQY/iuOQ0BEYOxfDAjKt
         9gIweFIs+s88BxjudGswn7J9Flfb8n1CWphSssuew2LgE6vzI/39b03m5vYEMnhg5Jz0
         YiWPMP5Awpm2cZgbjnQl5u4OPB2n/8A1RnJDLglCnfyrzYLDww3fOK57zy5n5fnMjS2H
         73fFA+seEE3YEt4itXfftUc855RPrKjToc0BTJ3uLVWsrtcRG9/nc+sRWSB2htA26y7j
         EZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820618; x=1788425418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xKZ6u/wqQ8d3u6q9Lp+QtNXkUz6sKkb9jejuBTbsvrw=;
        b=pd1iJBLp1BHJYmWsTO0uGFJKkHjDd5gCjZD81OJ0KVYPW5mnMs6VdsN0Zm4AsR6jMk
         NuQny57Ma8ewXulahsGtQkz6/iX46/uEDhhmhHgstP0fyRxlI2NPkGynQxoLT3W6hx+m
         tFbyIKod3OtJvSYrhwpkiwvvt2jXL3BYhfNi87ORxNlGwBBOBomuTtoskr8WeeAl487E
         fZPi4/xV9+tjUa2YOjGmT7JUJDrpXop8ahnROKmdID2g6VgA5lE56IEzu2iOaCeFvm2Q
         ilKV80lm3KS2mJAs6Rz2+K4QEVAq+RNeO81sSnVS448oCXwBn61s0cvMNcDYFzx4q4uM
         29Mg==
X-Forwarded-Encrypted: i=1; AHgh+RpXmgN9Y5638vhuzZVqePlq8udwgHWbDLk/eOCJp3Q8bTVehLbpuF/lVnpeDHELpthE3EyU3EoqfH0HyxY=@vger.kernel.org
X-Gm-Message-State: AFuF++lJhH9OL1AtAHBBMN24J8V0PTzyPaKH+bubFVR6yiVOGpeO+OZQ
	ZWLCUXrBJO1kvsdlg5pWAONzPZNBieB/7rHIqe8N8KLD8ZmGTaTRNEyWZAf5y/LaoiRO
X-Gm-Gg: AR+sD13R52FiCSWTI8bUa9A/KoRKEtqI9BERo4qs5FJzzxEJZBVdO65RHzCLVJpozPB
	aqYjX63XlG3PeKXqF5ozoTCDKzSNeOrAC/tJfcDxWm3qtux8NPPLOh/5xb8UihxgLpexskioELv
	AGGD80SKzYtQrZ4j9iGzB7TcCX+ziZvjIxYdpIkIoWKmbl7jh5MTPvi/AojwKfuhJF2aRzeabfK
	NrMLUABtoGctKiuPqBTaW5tt29xjOPnZPOtiqjPMomqihUPFXM4qUuESmJ233VRlgimQHN9VWKd
	eSQhGQtLIEcG1Tuw9b1xHa2idgccpNDKJVST0aFHXCAJx7EJYYQAnnfss1rBCFPveghLYaVlSX3
	4LyZJ4JqhS79rRoD/8dGVWhshdjlIF+jL3kr5OfpJw/OP79pnSEuilvqFOxkKWtUPBvX0aejqGg
	bHN3lh9/suyXmOGph4yVVeBxvAGrbodJCvw9AZu+T5qR9vkju8T+1R0U0bZcYUbHui6gT4oXNmv
	Vz7qA3aohk=
X-Received: by 2002:a05:6a20:2584:b0:3cc:8344:1213 with SMTP id adf61e73a8af0-3cf83531791mr24545584637.8.1787820618112;
        Thu, 27 Aug 2026 01:50:18 -0700 (PDT)
Received: from gmail.com ([42.88.197.68])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1beeb53absm1836637a12.32.2026.08.27.01.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:50:17 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zihan Xi <zihanx@nebusec.ai>,
	stable@vger.kernel.org,
	Vega <vega@nebusec.ai>
Subject: [PATCH net v6 2/2] llc: reject out-of-service state before state lookup
Date: Thu, 27 Aug 2026 08:49:38 +0000
Message-ID: <8fa3c9e6d5dcf328979ed2bdc27817c11a5eff91.1787752861.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787752861.git.zihanx@nebusec.ai>
References: <cover.1787752861.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

llc_conn_service() checks only the upper bound of the connection state
before llc_qualify_conn_ev() indexes the state table. A socket in
LLC_CONN_OUT_OF_SVC therefore reaches llc_conn_state_table[state - 1]
with a negative index and can read and call data outside the table.

Reject states below LLC_CONN_STATE_ADM before the state-table lookup.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: Codex:gpt-5.4
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
changes in v6:
  - Hold a reference for children queued for accept() and release it when they
    are dequeued, while retaining SAP publication so tuple lookup still finds
    a pending child before the passive open completes.
  - Make direct receive, backlog, accept-queue, and listener-close cleanup
    symmetric, with bottom-half-disabled child locking in process context.
  - Keep the LLC_CONN_OUT_OF_SVC lower-bound check in its separate patch and
    use the ADM state boundary consistently.
  - v5 Link: https://lore.kernel.org/all/20260822082354.3109-1-zihanx@nebusec.ai/
changes in v5:
  - Make listener child cleanup unconditional so queued children are also
    released if the socket leaves TCP_LISTEN before close.
  - Serialize process-context child cleanup and backlog dispatch with bottom
    halves disabled, avoiding child-lock acquisition races with LLC receive
    and timer paths.
  - Drop packets redirected through a pending child after its listener is no
    longer listening, and release children left out of service instead of
    dispatching them.
  - Split the LLC_CONN_OUT_OF_SVC lower-bound check into a separate patch.
  - v4 Link: https://lore.kernel.org/all/20260814185843.4748-1-zihanx@nebusec.ai/
changes in v4:
  - Create a passive-open child only for SABME and generate listener-side DM
    replies directly for non-SABME commands.
  - Use an atomic incoming-child lifecycle and serialize pending-child lookup,
    backlog processing, rollback, and listener close with the child lock.
  - Keep immediate SAP publication for passive-open tuple matching, but release
    unaccepted children on direct and backlog failures and on listener close.
  - Defer final incoming-child cleanup to workqueue context so timer
    synchronization does not run in the receive softirq path.
  - Add an LLC state lower-bound check before state-table dispatch.
  - v3 Link: https://lore.kernel.org/all/20260805175945.10698-1-zihanx@nebusec.ai/
changes in v3:
  - Drop the unused llc_conn_handler() local rc variable reported in review.
  - Rebase the numbered patch and cover onto commit
    ede76849012e45ffb2193ad110b42027eec02c5c.
  - v2 Link: https://lore.kernel.org/all/cover.1785386749.git.zihanx@nebusec.ai/
changes in v2:
  - Rework the fix to preserve the existing passive-open tuple matching
    semantics instead of deferring child publication until LLC_CONN_PRIM.
  - Track listener-created children pending publication to accept(), and roll
    them back on every earlier failure or drop path.
  - Cover the original non-SABME leak and SABME paths which fail before
    LLC_CONN_PRIM, including backlog enqueue and backlog drop failures.
  - Correct Fixes to 1da177e4c3f4 ("Linux-2.6.12-rc2") based on the earliest
    locally visible history carrying the same root-cause fact.
  - Clarify panic_on_oom crash evidence and packetdrill selection.
  - v1 Link: https://lore.kernel.org/all/cover.1784725007.git.zihanx@nebusec.ai/
 net/llc/llc_conn.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/llc/llc_conn.c b/net/llc/llc_conn.c
index 885a5c33024c..4a34f240ad2c 100644
--- a/net/llc/llc_conn.c
+++ b/net/llc/llc_conn.c
@@ -362,7 +362,8 @@ static int llc_conn_service(struct sock *sk, struct sk_buff *skb)
 	struct llc_sock *llc = llc_sk(sk);
 	int rc = 1;
 
-	if (llc->state > NBR_CONN_STATES)
+	if (llc->state < LLC_CONN_STATE_ADM ||
+	    llc->state > NBR_CONN_STATES)
 		goto out;
 	rc = 0;
 	trans = llc_qualify_conn_ev(sk, skb);
-- 
2.43.0

