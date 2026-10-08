Received: from mta0.migadu.com (out-68.mta0.migadu.com [91.218.175.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024A8481AB7
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451624; cv=none; b=M58N6RF3FmQ/XPOzeQpr2h3I45F53Clfxb4P/dge29DvA+DdyAtPMbUKS99EnO+tPKqhIVvVVyVkUTmoPBRVrJ0kRBhpd1UO/o5UHkCCol3G5+nT5dfLN3/8MTB1ylW/ni9IKAdPMX1jm8ASME7ht95a7EnOMcA2Emfk3QlMtT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451624; c=relaxed/simple;
	bh=7yL4qrMCuyL6ygaKf+SrIIVVAH6fByn5OEDJoKtVjU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbTb5rpB5s5BDsrxpPiS/NumsyHTsvLxeXs6nvEVJGfGBGthIdAf07ZYAcD/r88iK+QBvzDMXPVhvPdAyALpSbLVhbr34uCqyof2uw/EoA5XjhVMbvSrPvATLFcHNqlC23bPneFSkMalWBq3xIcUJe9EnQICMDSjSyAcGFRpYxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Dz+hUEOD; arc=none smtp.client-ip=91.218.175.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Dz+hUEOD"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7yL4qrMCuyL6ygaKf+SrIIVVAH6fByn5OEDJoKtVjU8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791451621; v=1; x=1792056421;
 b=Dz+hUEODUJ/3Y+1MuOMH3ZTtZ60SISWgxxmBitXL+rJ3SM/uiDeAezrd0U9F2f0bFXnkCWIR
 6RRMw8dPKhfM7jJxIej64Em5Yj0ZTxWp+WPIWDFUecwSlAwPIShoC0nzH7pjAhj5ivsP4sFLK0d
 B670kAXeAcK74VYBJmKUILM4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 200700132b88561a;
	Thu, 08 Oct 2026 09:27:00 +0000
X-Mizu-Trace-ID: 200700132b88561a
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	VEGA <vega@nebusec.ai>,
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
Subject: [PATCH net-next v3 1/3] tcp_bic: fix divide by zero on max_increment == 0
Date: Thu,  8 Oct 2026 17:26:34 +0800
Message-ID: <20261008092641.140777-2-jiayuan.chen@linux.dev>
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

max_increment is how many packets cwnd can grow per RTT, so 0 makes
no sense, and bictcp_update() divides by it.

Reject values below 1 when the parameter is written.

Fixes: 83803034f423 ("[TCP]: Add TCP BIC congestion control module.")
Reported-by: VEGA <vega@nebusec.ai>
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
No __MODULE_PARM_TYPE() on purpose, same as dctcp_shift_g in
tcp_dctcp.c. It only changes the type suffix modinfo prints.
---
 net/ipv4/tcp_bic.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_bic.c b/net/ipv4/tcp_bic.c
index 65444ff142413..27d2e38ff7932 100644
--- a/net/ipv4/tcp_bic.c
+++ b/net/ipv4/tcp_bic.c
@@ -27,15 +27,25 @@
 					  */
 
 static int fast_convergence = 1;
-static int max_increment = 16;
+static unsigned int max_increment = 16;
 static int low_window = 14;
 static int beta = 819;		/* = 819/1024 (BICTCP_BETA_SCALE) */
 static int initial_ssthresh;
 static int smooth_part = 20;
 
+static int max_increment_set(const char *val, const struct kernel_param *kp)
+{
+	return param_set_uint_minmax(val, kp, 1, INT_MAX);
+}
+
+static const struct kernel_param_ops max_increment_ops = {
+	.set = max_increment_set,
+	.get = param_get_uint,
+};
+
 module_param(fast_convergence, int, 0644);
 MODULE_PARM_DESC(fast_convergence, "turn on/off fast convergence");
-module_param(max_increment, int, 0644);
+module_param_cb(max_increment, &max_increment_ops, &max_increment, 0644);
 MODULE_PARM_DESC(max_increment, "Limit on increment allowed during binary search");
 module_param(low_window, int, 0644);
 MODULE_PARM_DESC(low_window, "lower bound on congestion window (for TCP friendliness)");
-- 
2.43.0

