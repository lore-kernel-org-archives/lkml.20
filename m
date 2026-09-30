Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453BE3D0934
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763008; cv=none; b=RSGWKKeIzNuSJ4f1o/vjBSOK+syw6KS3rZ5XHg2BBw+K9UvF15gNzyZ/bXs4q8Su/E54aU1OgnX+tLq3SCfq6u4fcu/eAjtXYpoF1mR7PJmq0L/z0Jd0BbYPa8TaX2s03BKt+GfNu/JsK8+jPw3aDM0nnyLEapNAr3g3a3pFhOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763008; c=relaxed/simple;
	bh=zzHGT2R3BW7k3aO3wSCDgQFJA2FVGOFJd9tzgfsyXjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NlVyWPF12DP3TqaVWmV6Nz5CosFjPGGTWd8lJ8gWt6WV2DesQ8gdpZJRTBphrELEOgVYbR0q65lzKq3UWZ6O8WmWW9Q7kHFBxdvrOsRQK81YW/GyyIZu/w5tQPRqgw/bGDyh9+2PU5CHFBCP9zQWYzPVkvIG+dxTfW0314IDj7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=k0ybU/Cg; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="k0ybU/Cg"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zzHGT2R3BW7k3aO3wSCDgQFJA2FVGOFJd9tzgfsyXjk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790763003; v=1; x=1791367803;
 b=k0ybU/Cg3ScFVSfMqhySLc8kZwwk/a9zhyL2t7hDfDxtSO2SouilUwOePv0hVdC1LZAWdBbd
 IdhaKMAIlS34etR1pXXCAulK55CgO/u2ThUbuWM70lT7C6EGdkEfAP+RlLT4M9AMobejcwdFK1n
 txi18T67gubqsP472jwEkwAg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 31a91eec084b79f3;
	Wed, 30 Sep 2026 10:10:02 +0000
X-Mizu-Trace-ID: 31a91eec084b79f3
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/3] tcp: fix a few divide-by-zero in congestion control modules
Date: Wed, 30 Sep 2026 18:09:29 +0800
Message-ID: <20260930100937.206377-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 and 2 were reported by VEGA <vega@nebusec.ai>.

Patch 3 was found while reviewing the other TCP congestion control
modules for the same kind of divide-by-zero on module parameters.

Jiayuan Chen (3):
  tcp_bic: fix divide by zero on max_increment == 0
  tcp_hybla: fix divide by zero on rtt0 == 0
  tcp_cubic: fix divide by zero and endless loop on bad module params

 net/ipv4/tcp_bic.c   | 14 ++++++++++++--
 net/ipv4/tcp_cubic.c |  7 ++++++-
 net/ipv4/tcp_hybla.c | 16 ++++++++++++++--
 3 files changed, 32 insertions(+), 5 deletions(-)

-- 
2.43.0

