Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F7E4D487C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951755; cv=none; b=Ko1Uth+CQK6DziTcQ3u5O1FtY3aY1VGC4dso2qCoECTvCeMRy3Btcz+vzaeZOW0LsTTGeITiCHQD992Qc6Z/udfmz9PxRcFuiBSuFulqJhyOR3ZZHVGRGQh1LUgUUDjo5y/HsgibI7WjBz8tuKhlx8xDqQ0aj//4O8OwQS/zaxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951755; c=relaxed/simple;
	bh=sl/5SK0AkE7KgGawmgwiBrMyZ410mcBRygWLmXnAT18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mOHZl00Of7/KyABvGlAbIvsQWApj5h9SzXVEJ6pP8hxHmue6FP921C4JOHfg0aY83s0/BAj9OGg6jmlmW0nZLiteCAuCbG0dZq8fh2VsHe6I3GwWd4XkduIgY8t1w9gPVhprAIwWDz1Vea9XsGLW1+XAsWs9hPBM8sYadir454s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citymesh.com; spf=pass smtp.mailfrom=citymesh.com; dkim=pass (2048-bit key) header.d=citymesh.com header.i=@citymesh.com header.b=g9sEWNcX; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citymesh.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citymesh.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=citymesh.com header.i=@citymesh.com header.b="g9sEWNcX"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aff58e6abso1787177f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citymesh.com; s=google; t=1790951751; x=1791556551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k+YxcSkfcoEfck7Zuecwp5VWL5LwdnUB1Sk9JzZnEL8=;
        b=g9sEWNcX6iltrGeEB/iSEXsS/ONz/k2u9AyWOtXa3biN+bzuz4YKAjApdcTMsxVfJk
         KWChsbnahloS34Ofl/sxIoRnuqcdxrNwbpVmiGGICWsieE1dDR7wW1qe6cpM8BpKEX6o
         MsuCwibntLe+TEekbibaI91Y32NAb8dggeAu5MAPxOhD2f4RilGhZvUirOqSFh08g6Sa
         JQ17AdmlrCyg5qpxaRfgLNLuwF0lO8Gb4d4k32Zdb8JZsZneaH3xUUhGMaiivp0JFNSx
         l0Lr+vMURPovHcPi4k1MA9twiSeSpwKlF6ozOQ2PpLlK6kuCTYaDyzjGa7KqxLpmlIbe
         IQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951751; x=1791556551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+YxcSkfcoEfck7Zuecwp5VWL5LwdnUB1Sk9JzZnEL8=;
        b=PN2kCR1oShmuOpK+BkEWIHScU9RlmaSbQ+C9onD0yop3B75WTrXgeZgwB56+B63xhP
         XVNqakaeoKZMeahaiB6h7W9AdQCV9PCec46RRmFab4dbfAwR8eZL+j0Oys+Nb/OnpOpX
         ipyq6JArt9sBo9ePAia6nvoE+oXUT0yKeFTFdWGoIOZ2nBDqc4yDfKi+THGNraYrrG8h
         iGUYrw3d2YVA/4OY6gjezAs6O87afCKta5YivAOjV0FH2G+mKM4M8LMM5Yt2851VT+9Z
         Z1FFnUfrNbUO1U0ZeJhwjg9dAptxNvfqdpMKOpGs9S3QfJ6tRQsPHZd2CXh0PgV+HsNt
         PLTw==
X-Forwarded-Encrypted: i=1; AKwUvBwO/756y3moRCDa/dZCVT1S+TQrwwJ3BqXSVO3WxPE6OHvB4yO7Y+EsAk08VMA4G9xA+tnKERYUIdRQvl8=@vger.kernel.org
X-Gm-Message-State: AFuF++k4FnHvMOfppZGW3RLf/YowEe05kLrC5HYFQ/itRDEh68ZB54gA
	dmtLsmTCgXpcxcYFfiYTfNT7tcmy4xrAi46KDP1H3oqxuCJbzNvj519YUAoSozH7kSo=
X-Gm-Gg: AYBFou0fTxpsuoNgTWEfygbc6oyDQCjbiWkdo46S3f2F6FLQ8daf3bMJRPssgsoXafo
	QlYnTI0pAnsPo2tB6Vxc3TtedtIdOqVcNhVuDzP0zwXz0ninNP4yB28RRs3uzbpAHvLwGRm9sxb
	hzJ9/gggCqEZxgb9UdFq/9XgbtBwA9GbD+KWceitUnT9Moa41ijKT0khr9JJ+24J85zrtKnfcF+
	FtIi/Xt6XaWpqsaev8IuNfTeEoFK9Ipcq2l4hWSoRJAlSPzBIXhrsuQhvBMBovQ6L1dALpA0/LL
	jdACPmoNPHFktKuwJvwgT+Z8blCuWi6tG3kJHKGzJHvTwpUXuX3tLwyCIbMB/DYuWevVMOmKC8+
	c4eFTm/VzznRAEMHB8pebEAMb2uCKs0nxqpnCc/+Hi6zpKDMMWcU2s2xLN/AtcHR2Zht2z+YY8w
	v2vvCJo8v0v/FZViuXVC+M0EVL1L2DGpHtBz3YNujrQe+VyOr1BjfbCAmJbrsveoMwuoI=
X-Received: by 2002:a05:600c:8717:b0:4a0:2867:d8a9 with SMTP id 5b1f17b1804b1-4a02867da4cmr44371235e9.30.1790951751358;
        Fri, 02 Oct 2026 07:35:51 -0700 (PDT)
Received: from koen-nuc11.. ([2a09:bac0:1000:2ef::4e:6c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67cbfesm8715315ad.28.2026.10.02.07.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:35:50 -0700 (PDT)
From: Koen Vandeputte <koen.vandeputte@citymesh.com>
To: netdev@vger.kernel.org
Cc: quic_subashab@quicinc.com,
	quic_stranche@quicinc.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	dnlplm@gmail.com,
	linux-kernel@vger.kernel.org,
	Koen Vandeputte <koen.vandeputte@citymesh.com>
Subject: [PATCH net-next 0/4] net: rmnet: optimize hot paths to alleviate CPU/memory bottlenecks
Date: Fri,  2 Oct 2026 16:35:25 +0200
Message-ID: <20261002143529.3217189-1-koen.vandeputte@citymesh.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While testing embedded ARM platforms over a high-speed
private 5G SA network, we observed severe CPU and memory
bottlenecks limiting overall throughput.

Examining the rmnet driver revealed several opportunities
to significantly increase efficiency,
particularly on the RX deaggregation hot path.

This patch series addresses these bottlenecks by optimizing
memory allocations, reducing unnecessary payload copies,
and improving timestamping efficiency.

Test Environment

Hardware: IPQ4019 (Quad ARM Cortex-A7 @ 717MHz), 512MB DDR3, USB 3.0
Modem: Telit FN990A40
OS: OpenWRT-based
Network: Private 5G SA (n78, 50MHz band, 4x4 MIMO, 1Gbps core uplink)

Methodology

Results are based on the average of 10 consecutive speedtests against
a local speedtest server located in the same datacenter.

Performance Results (Download)

Before: ~318 Mbps average (Peak: ~353 Mbps)
After:  ~389 Mbps average (Peak: ~458 Mbps)

Koen Vandeputte (4):
  net: rmnet: use fast monotonic time for tx aggregation
  net: rmnet: optimize rx deaggregation memory allocation
  net: rmnet: conditionally expand skb headroom in ingress handler
  net: rmnet: optimize rx handler by replacing skb_linearize with
    pskb_may_pull

 .../ethernet/qualcomm/rmnet/rmnet_config.h    |  4 ++--
 .../ethernet/qualcomm/rmnet/rmnet_handlers.c  | 10 ++++----
 .../ethernet/qualcomm/rmnet/rmnet_map_data.c  | 24 ++++++++++---------
 3 files changed, 21 insertions(+), 17 deletions(-)

-- 
2.43.0

