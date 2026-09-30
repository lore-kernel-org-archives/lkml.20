Received: from mta0.migadu.com (out-167.mta0.migadu.com [91.218.175.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57A53B14A8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763020; cv=none; b=hxILPIq/Wq6HcsoMEfuCAt35Uw1u0KaP2tUTOUJ1A/alsJtSoqQCpee6Wt7fefSSgaHHOIgKL38lpgoOW2FfSAbYmoKnyGrO63/WhGgoFxlLXxAJS1Oq+TfIuDHxrc+cxjNdJ06ilUdZFvEO6M4Ot69xUiTedgWmvHaBnOJQo88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763020; c=relaxed/simple;
	bh=Q5AkoNztmUhqfq/M4oFXRdYxicGteR+QcwAAPrg1Geo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uUeE86nqtQOdjCXi+xpge/YiQentlygHA0osoiNdFKOS1w5M9YmlLhteQykTAO2m3GNu0CaTzTiwK4+WrQbOcWddatEk8bCHwoNMPDn8nb5zkpEBD3dzZzf9L7mJXac8C6YN8zroa0066GfoYsyk2wGLxbo6nuSMQfgRJZihwL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iMaguGyr; arc=none smtp.client-ip=91.218.175.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iMaguGyr"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q5AkoNztmUhqfq/M4oFXRdYxicGteR+QcwAAPrg1Geo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790763016; v=1; x=1791367816;
 b=iMaguGyriKG7Kt7vMghsIPLdHQkYbha+Mf2bkViIDmMO/HqeHrEJ9zmY+D4j12tls+QvMjFr
 J7PMsfQjaZrTyZqx0tV+AFpn2/1K10QyJJ9ZY3dvSzHoMkQUUiRjt6O9Ffh5NHnrrgy2fA/a7MR
 dWZsKwxT+tBfAjPc529ajRDU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f03b88fa8acaa0b7;
	Wed, 30 Sep 2026 10:10:13 +0000
X-Mizu-Trace-ID: f03b88fa8acaa0b7
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	VEGA <vega@nebusec.ai>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/3] tcp_bic: fix divide by zero on max_increment == 0
Date: Wed, 30 Sep 2026 18:09:30 +0800
Message-ID: <20260930100937.206377-2-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930100937.206377-1-jiayuan.chen@linux.dev>
References: <20260930100937.206377-1-jiayuan.chen@linux.dev>
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
---
Target net-next since it is not a big problem.
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

