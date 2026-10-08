Received: from mta0.migadu.com (out-82.mta0.migadu.com [91.218.175.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2294756A8
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451646; cv=none; b=P81f6GVUO2aFPx7ayLQ4jUm9BGW7Vf8pGjbdYTK4AM2dQ/wBcyKkYtt1BB2CHRATKqpz9RxVPoD+Re47DXXwZ0IFfCxTugGp4oT+j6V/6MX7QhsABg/PgsqQTdZdH4KulNS7B0J+fodFsRVJyn1bq4K158I/74XiEx+8R7xqtkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451646; c=relaxed/simple;
	bh=o0VTqgIyZCD+9GVMsVKJUHZRKxr5nJ6fXBbEmzJYmFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KKUoQUEPFKAzWl0Y8orJD53ovR1sWRkPsQ/mCMN+1fOtplIHDL1a+lcnisJdP/sHIo/WWW1SCITUT5sATTIB1wR0wyiGHWQLqzYE3tpZPMXF7SHoa8T84D/iX0BCXSt1QpPcfdm1Gq2Wx5mXmypWJ0x+WZl823huI1chqMctQfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=whlQeYAh; arc=none smtp.client-ip=91.218.175.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="whlQeYAh"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=o0VTqgIyZCD+9GVMsVKJUHZRKxr5nJ6fXBbEmzJYmFc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791451642; v=1; x=1792056442;
 b=whlQeYAhRhNLPu05igblBhCMMRA5gnSbg0UihIGbnqYcTMm/FT6VEIQ/aA/i3Cp8tqb83Fdu
 Rxv+ApT7N4QeGV5BP3pLmOU0Y+1k03/xdMtGMX0qi3eq9gp5uTQ/VjcTKXbXPF1S1v+LD7OpxjI
 3qcmeUnmW0PmHMNjttMEX22Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 05b0d16a1c1ac1cf;
	Thu, 08 Oct 2026 09:27:21 +0000
X-Mizu-Trace-ID: 05b0d16a1c1ac1cf
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 3/3] tcp_cubic: fix divide by zero and endless loop on bad module params
Date: Thu,  8 Oct 2026 17:26:36 +0800
Message-ID: <20261008092641.140777-4-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008092641.140777-1-jiayuan.chen@linux.dev>
References: <20261008092641.140777-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

beta_scale and cube_factor are computed once at module init, and
beta == 1024 or bic_scale == 0 is a divide by zero right there. Other
out of range values give garbage: negative beta can make beta_scale 0,
and bic_scale * 10 can overflow. Reject them. Read beta once, as it
can be written through sysfs before the init function runs.

A small beta also gives a small beta_scale, and (cwnd * beta_scale) >> 3
truncates to 0 for a tiny cwnd, so the TCP friendliness loop never
ends. Rather than testing delta on every ACK, make sure beta_scale is
at least 8 at init, so delta is >= 1 within the cwnd < 1 million
packets limit this code is designed for. This slows the TCP friendly
estimate for beta < 512, a backoff harder than Reno's 0.5, which is
not a setting anyone should use.

Fixes: df3271f3361b ("[TCP] BIC: CUBIC window growth (2.0)")
Suggested-by: Eric Dumazet <edumazet@kernel.org>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
(cwnd * beta_scale) can wrap for cwnd >= 33M packets, far beyond the
1 million packets this code is designed for, so no fast path check.
---
 net/ipv4/tcp_cubic.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_cubic.c b/net/ipv4/tcp_cubic.c
index 119bf8cbb007c..a88e4bf86150f 100644
--- a/net/ipv4/tcp_cubic.c
+++ b/net/ipv4/tcp_cubic.c
@@ -500,16 +500,26 @@ static const struct btf_kfunc_id_set tcp_cubic_kfunc_set = {
 
 static int __init cubictcp_register(void)
 {
+	int b = READ_ONCE(beta);
 	int ret;
 
 	BUILD_BUG_ON(sizeof(struct bictcp) > ICSK_CA_PRIV_SIZE);
 
+	if (b < 0 || b >= BICTCP_BETA_SCALE ||
+	    bic_scale <= 0 || bic_scale > INT_MAX / 10) {
+		pr_err("tcp_cubic: invalid beta %d or bic_scale %d\n",
+		       b, bic_scale);
+		return -EINVAL;
+	}
+
 	/* Precompute a bunch of the scaling factors that are used per-packet
 	 * based on SRTT of 100ms
 	 */
 
-	beta_scale = 8*(BICTCP_BETA_SCALE+beta) / 3
-		/ (BICTCP_BETA_SCALE - beta);
+	beta_scale = 8 * (BICTCP_BETA_SCALE + b) / 3
+		/ (BICTCP_BETA_SCALE - b);
+	/* bictcp_update() needs (cwnd * beta_scale) >> 3 to be >= 1 */
+	beta_scale = max(beta_scale, 8U);
 
 	cube_rtt_scale = (bic_scale * 10);	/* 1024*c/rtt */
 
-- 
2.43.0

