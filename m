Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977521;
	b=wQjWZ5q1plETHBrtPWgRb4NmNKgTyNXgAQpLQCuzFS2z2GpcIpDyfrLxBXn9d0uNc/65
	 GShj3vB9TDEWGV69z+pMa85LpYtW4Y1BwegEA/S/cq3DW1kv9RAwLiJuLuKNCYBsdkNmu
	 qGOa0iok/x3DnYoJPn96VkAJ5yXg25KtvcHUPq+dXhsJCWQf4H3DR7TX/G18fkx3zZXAT
	 4MMT+aiVEcp6wM/atEzWkAZMqkX/CNDKCyrhmDoc+ioVVW7h0OyzOdSFYAQGeNlO6in2E
	 5d0WmbB0zBsualc0UKnEHYk40A+vA4+/BVX/qsEroO8KMym4lbrkHv2xDjThbDvS+Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=U82LHASiAr83JwdwBGkkuU7MAKcYuAuWVXjLgmwYJF8=;
	b=mj2RUcih8d0mdAC4L527dkyxuAZMAV5xVrSHOpGcV/3PVR9W4u3/7pT6CWdedGToN0C0
	 7aepBss3u3miLHJCo2JGD9tv+AeoWzgFmi1aa4GC0AnrsxDjYnNjciWEV/PZ9i8pUquec
	 lfBLPXaYTG94O+gchzpvr2YoKD0RmNZGlmLFZew4pgC42Ook1ZWgfRom5RijApLa12iok
	 Y9969KEWiUCv0T/waW0PWkCVFgIgorhpesk141AhFcrQJbn4FQvODdd2SQe87bg7WGfXP
	 dVLkCVx6z9mRxaaQMtKNuJqADs47fcu8MO6iPZ9kI4o9QmvtRx+7S37GLu7D2XAIM9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wnMN4v8I;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96597606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96597606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wnMN4v8I
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1bc97805eso772905e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793977519; x=1794582319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U82LHASiAr83JwdwBGkkuU7MAKcYuAuWVXjLgmwYJF8=;
        b=wnMN4v8IicuRoOIY+cQIWmgkEU28aZVziS3NC9QX2/q9eLFG1CRwLpF9XQ0cTigo+K
         LzD/MAi6gvXsC0SV21woKwsiIVE8TcwjPXo+bRBLrA1LYpEG9dZTimRP0YkcI2ODKFhn
         JHsVyd278vsE/CSs3PdIbtZY9FDbzU9glU1/y0+/XkzBZq0jk4PEJQoU5LGwN5dm9Ga6
         F5xqrM/I/jsosBM3Rkj+kZKeDXmwCoziF4yMFBKR2SeMApHPIbh7QmI0qH8jN29/k3d+
         7r1l8upBf5B9nw+QB2Jd8ZLYyE4aLh/691SJ9UP/Opug284K8H4EoqLzZWuvPTJ7TUFW
         NYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977519; x=1794582319;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U82LHASiAr83JwdwBGkkuU7MAKcYuAuWVXjLgmwYJF8=;
        b=RIuemS5ME5aVgw1Mf7U2FN7rS+TRb+nm2/Oh7RmUyL+RFjLxSqk7j3sp3A+VZA15by
         UFJ01muqUJ5g4xfpeYwVlPcUykPaEubZa/pd9P6n68WM8/jxUTmhZS/jiSklKwWEbI+1
         kLviJUeLORekrJlKD3yqTxAMSov1Aon7DUyOBppO5IpcrhtIU/qcoVNt8u4cspB6jh8U
         RJx6TE/RRiP+vLCAxcIWc9dluq5xnvFXMKGOUmNaaVd+YH6Sh3hBUPPcE4e4tdayIEX5
         57NKFNfBBPVUwv75tTnxv/mYQCcehdJFbt9mIEg0VqLeS8IvzP/Kre1YRBrpcBGLHzHj
         kmhA==
X-Forwarded-Encrypted: i=1; AKwUvBz/00xvtzLBCfeAkU1WPHWKcQkzYNkbs61Qu8WdRrH1K2lop2bjWd+SgwBtbQccBkseHaWmypHDrQqLWHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8skl1p338t9ycevMiYpuGx/Rp2I1lvQPS55/l+19U/sjJfMyAw
	E2rcD1J5DVeUaqHRhhkIxG6EXltbnmsHIVAJzjxtIi/+OzXDYJ1BHu6k
X-Gm-Gg: AYBFou0nEp3gnwIshvPGmLvivki9IsF2/XFfDMwvecI7wR9S5p8p+Jud59JGyA0LBwY
	N34zvT9pdCZ07EB6PmwLePiZn8RtGl22GLZxMU070tN8nVh0egXzuV9YSrQsPT2TkaGwa1RStIY
	CUYL1ndyaKKhrYiVyj2ddXLiAV7dAiiL1LACd5q27LZG6vjKMrf3SpPMgin4ZscfW+3vBZzsjvI
	QpU0STIT+T6kw6vu8hLpcufEc66+Rn9YkqNSArMx1B2WWTSMd85Z1k20zCtYy+w03y5/dkYTjSj
	Tp0ew4jQh8Y0Sx51cz9iwr2P3TaC3aca6IdBHofzq6cXxu+hF8mTCCMCQFwO1XIbxfv6S0Wu8NM
	/BuaS5QL0l7LP6/8lboO/GHjjhE8O4pYksBpEfk9P+kI6E9Ld88yRhqJ+OgkLyUy5+1YO5Ty2QG
	m4Nnn4/PDdB+/c/8SL6onpqPdaOnZgf4OEX9i797all1f3WXBO1G9YK94Q+zWS3LpYV0eDkB/n0
	pIoL+5ic/po1BQ7BgEKjtfUY4s3GlsQu+mrCekqkXYKhvFKnOOOsbVhI02kCzIVppYH0171RpXp
	EHM6/b4QfhvqyIR4ty7MkdaSohxAtMBKM0R7TjR2G37EVnkTFylOtvPQl2EEON9iPn21XbdZ
X-Received: by 2002:a05:600c:6d8f:b0:4b6:2242:d0be with SMTP id 5b1f17b1804b1-4b6d82b2c85mr38024365e9.0.1793977518886;
        Fri, 06 Nov 2026 07:05:18 -0800 (PST)
Received: from localhost.localdomain ([193.255.169.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm260950305e9.2.2026.11.06.07.05.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 07:05:18 -0800 (PST)
From: =?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	hmohsin@meta.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
Subject: [PATCH net 1/2] selftests: drv-net: ring_reconfig: handle devices without channel config
Date: Fri,  6 Nov 2026 18:05:08 +0300
Message-ID: <20261106150509.30458-2-ahmetbilalyazicioglu@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106150509.30458-1-ahmetbilalyazicioglu@gmail.com>
References: <20261106150509.30458-1-ahmetbilalyazicioglu@gmail.com>
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
Content-Transfer-Encoding: 8bit

Drivers which don't implement the ethtool get_channels op (e.g.
e1000e) make ETHTOOL_MSG_CHANNELS_GET fail with -EOPNOTSUPP. YNL
raises that as an NlError, so ring_reconfig reports two failures on
such devices:

 - channels() fails on its first channels_get call, although there
   is nothing to test;
 - ringparam() fails in _configure_min_ring_cnt() before any ring
   size is tested. The helper only reduces the channel count to
   speed up the reconfiguration, ringparam() does not depend on it.

Skip channels() and return early from _configure_min_ring_cnt() when
the channel query is not supported, logging that the channel count
was left unchanged. Other netlink errors are still reported as
failures.

The issue was found through AI-assisted source code analysis
(OpenAI Codex) and confirmed on a ThinkPad T480 with an Intel I219-V
(e1000e, 8086:15d8): "ethtool -l" fails with "Operation not
supported" while "ethtool -g" works, and running the test functions
with the in-tree YNL library against the device fails with NlError
95 (EOPNOTSUPP).

No remote endpoint was available, so the full test was not run. On
the same machine the test functions were run under ksft_run with a
stub environment and all ethtool set requests blocked: channels() is
now skipped and _configure_min_ring_cnt() returns after the channel
query. Behaviour on devices which support channels was only checked
against an emulated ethtool family.

Fixes: ecca75ae5ae6 ("selftests: drv-net: replace the nsim ring test with a drv-net one")
Signed-off-by: Bilal Yazıcıoğlu <ahmetbilalyazicioglu@gmail.com>
---

Notes:
    Note, not part of this fix: with this patch ringparam() gets past
    _configure_min_ring_cnt() on e1000e and reaches the ring size loop.
    e1000e clamps ring sizes below 64 instead of rejecting them, so the
    check that the requested minimum was applied is expected to fail on
    that driver. I could not run that part (it needs a remote endpoint),
    and whether the test or the driver should change is a separate
    question.

 .../selftests/drivers/net/ring_reconfig.py    | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/ring_reconfig.py b/tools/testing/selftests/drivers/net/ring_reconfig.py
index 6682d4badfb..baac20e8d3e 100755
--- a/tools/testing/selftests/drivers/net/ring_reconfig.py
+++ b/tools/testing/selftests/drivers/net/ring_reconfig.py
@@ -5,6 +5,7 @@
 Test channel and ring size configuration via ethtool (-L / -G).
 """
 
+import errno
 import socket
 import struct
 import time
@@ -26,6 +27,16 @@ MIN_TX_RING = 32
 MAX_TX_RING = 1024
 
 
+def _channels_get_or_skip(cfg, ehdr):
+    """ Get the channel config, skip the test if the device has none. """
+    try:
+        return cfg.eth.channels_get(ehdr)
+    except NlError as e:
+        if e.error == errno.EOPNOTSUPP:
+            raise KsftSkipEx("device does not support channel config") from e
+        raise
+
+
 def channels(cfg) -> None:
     """
     Twiddle channel counts in various combinations of parameters.
@@ -33,7 +44,7 @@ def channels(cfg) -> None:
     if the config is accepted and crashes.
     """
     ehdr = {'header':{'dev-index': cfg.ifindex}}
-    chans = cfg.eth.channels_get(ehdr)
+    chans = _channels_get_or_skip(cfg, ehdr)
 
     all_keys = ["rx", "tx", "combined"]
     mixes = [{"combined"}, {"rx", "tx"}, {"rx", "combined"}, {"tx", "combined"},
@@ -88,7 +99,14 @@ def channels(cfg) -> None:
 def _configure_min_ring_cnt(cfg) -> None:
     """ Try to configure a single Rx/Tx ring. """
     ehdr = {'header':{'dev-index': cfg.ifindex}}
-    chans = cfg.eth.channels_get(ehdr)
+    try:
+        chans = cfg.eth.channels_get(ehdr)
+    except NlError as e:
+        # Reducing the channel count is only an optimization
+        if e.error == errno.EOPNOTSUPP:
+            ksft_pr("Channel configuration unsupported; continuing ring test")
+            return
+        raise
 
     all_keys = ["rx-count", "tx-count", "combined-count"]
     restore = {}
-- 
2.56.0

