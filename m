Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327274;
	b=5g/4nyNKtwOGcHxJe2HszHy9RwaVFH6bhWbQHF+JABFjTYrdjo87G3TELEIHrwJx2n/9
	 8R9poRuSAWgNJRyf5AxPGAC7JE7uyTXF5jGEAWOzZdNBoNt7xI9AYvxz385DGC4Ca7jFj
	 KtoaGdHB6VVKjHuPpLDJtVNIUMkZK6LgWPw4G09mqKWF/ctVRTTs5G4SGCCa/EEA35XGW
	 mq6der7j1svohcDlWfrxEkKz+0uoUDgCiMkyW7pytKchmII+UckJWd0jm4xqYfL/ZshRB
	 /qi9CHk+YZMhd33SDpyEnmcxlNZh0RJraU84TfP/zPdA2B/reB3limgA3Bi0zsPLRcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=v9Q/EWwiGYuJJkjQiR3cjpmLENNTVIh5BhWTJNSgmuo=;
	b=3h+3n2kL3hOSZ9oTxYU6fMVlJ0w9dq2pHLNrcu69Wv299KjfeXMzISU82bB0jHSFKih7
	 siDEqb5sjsGz3ICWzmcVPB2313VzMruoCVpnm+CP3KUyjLcbY9xdMZ64capgYerARqalz
	 sQO4TyveNcNDmo+Z0gnLKFqZbfgj1Xjvn2pgQ2/6ucIxWK5WOedaCjpWAQVeTJLegzd0y
	 ix4QNcbhdliPlRblEILqbEBeAy6DHmWbSzxegzS9eYkw2i67xTdmbFPqA2ORlXi2/+D86
	 fo8SKufZ8mdEX8wvhaXD4278Mtn/Q9iKEgixt4Gyi8KaaeCMqKH/N1/ZGoEdrEjfaQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANrbdB3G;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEF4606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BEF4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANrbdB3G
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a59ffacb51so2437535e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327273; x=1794932073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v9Q/EWwiGYuJJkjQiR3cjpmLENNTVIh5BhWTJNSgmuo=;
        b=ANrbdB3Go4OWSCgoHQhcZfpH3ER0+YbD7LsUE/pK48Qm5h+NUSsTOLmM3gxO9NL5lA
         ZKVKd/YHPpAq8U2GunH7+iAAl3JnyP2anpuIP5Dz8Vp25s8Wh3Nv/kFc2+0TVRX75dQl
         sFCRn9agjqsTk/OuQYnMHIMrVTOAsz+Z+AlmlCAYm9XL/H3lABFVa8SEi0jPK8tWcURN
         9uBPBA/45vdVFshrAw3AB8cZ51b3zWOOE52cRxP9OjhibwQBSqt1SmKg6SGqMPuaMyxo
         0sOtGeotvCSJxzlgrgYyzFqWTIxo11MrWjWcOKa+WyCFmC9L24N3rWc7d3x7EuEAsPLE
         85rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327273; x=1794932073;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9Q/EWwiGYuJJkjQiR3cjpmLENNTVIh5BhWTJNSgmuo=;
        b=ceHCFCXLo1aOJVOs8gcBmX22wN/ZHNl5Zd1Omz0JVB5qVM7tjDkECrdUaS2IkKBBLd
         065M+2WZl+ioyNZ3D6FEN4Wq0ScOlWqT7jmFX/iz3ujgD2s8ZhVL29nwAw1RL3oWcQNk
         b9QBnBuVa6g3cVQ/Y1YzSMmEX5CoOFJ0UZ7wrHt/Xp9vAIpHBwBmEDELWEB4s4z37g1D
         u3lRQ3dUoK9tuuRLTrxcPpzWpYniKzdIq4Qo5GK5Q+G/vxD5CEVl/EFmtywhbtL968Z9
         auUh9awBGQj2iXG/bFtEph0hHz6lXTWL2RyEfSAgeqWGwCF1StDeyNM77MnoKT/UWMop
         b8iw==
X-Forwarded-Encrypted: i=1; AL+hErH3BJJyrIq4tpUXiqrihknQOXNZNzjWrAstHQ05iqTUNcc8u7Pvb3i97zB21VHa0Z8eacdoubPWsu6ZGc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YdOEgGhRFeFKby5tMkv/CilU0NJJjW8Yqp26UkhQyoJ59EGdc
	kGeswbSsy5okGUbZvMpvskQHQZQ6GJjMXCRqMO2X9R6oQWrkyVm8QtG2
X-Gm-Gg: AYBFou0V5iLLdbhgyZ7GS72VIawDHffAEUTroebCg1BUbUnrIEllWzRL0rHN1pDZpb5
	hiATBLRq9pwzuzrOJoZ457/ND0BivVae8dOQntRGGZt6Ll2qRQWCqgarxVYoxcLMVzretR2JqPE
	8SeE2cwhVZ42MP+ZegOmE8sektf2RvkUrxV5K7EiD+R6VURlYQWa8+weXhF9fQveIsbCHLa9V4Z
	2X7fMFDwhKUE1xt4f2SciX7VCcYhQk4muT0JNIxUPja4zrKlEKD00Osz5gVazQp/yWrSJ80Q3n+
	BvZAbSWrotec78D6cgg/eycv9WeMfF1xMrFum/ROElCefgBZq2opEQlDClpaisFMTyrYhm31jWU
	zFPszrrOuzQl3ehrB6diyoA69kRtIrOiN4Ca5zxrBz+xQYroQFgc5psO8MhiP3MWWSohrd+O+cX
	3sHn8R10gHWdmgI9eswT1hHvUqbGNAJxD6HNh8cm+K0olThlkWqSh6cTLy2J9HBbWNREyFY9+nO
	ejLbXPw+bL0TRZsK9w1x0syD3cwQxL8xcjGbVGUJG/pdgrcQlbzM7f5Rsp6pjqYceW2zmiDjfM0
	OY1qZRqOr0qe+tpeqZPHhBxsk5aNZCmXY4NAj8TyycFUBQZ1CP7M6CRJftis3GNxkb/ZH0fl
X-Received: by 2002:a05:600c:4812:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4ba0233982cmr34471415e9.2.1794327272780;
        Tue, 10 Nov 2026 08:14:32 -0800 (PST)
Received: from localhost.localdomain ([95.183.147.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0235ef62sm46825525e9.2.2026.11.10.08.14.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 08:14:32 -0800 (PST)
From: =?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
Subject: [PATCH net v2 1/2] selftests: drv-net: ring_reconfig: handle devices without channel config
Date: Tue, 10 Nov 2026 19:14:22 +0300
Message-ID: <20261110161423.77910-2-ahmetbilalyazicioglu@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110161423.77910-1-ahmetbilalyazicioglu@gmail.com>
References: <20261110161423.77910-1-ahmetbilalyazicioglu@gmail.com>
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
e1000e) make ETHTOOL_MSG_CHANNELS_GET fail with -EOPNOTSUPP, and
drivers which implement get_channels but not set_channels (e.g.
vmxnet3, r8169) make ETHTOOL_MSG_CHANNELS_SET fail the same way. YNL
raises that as an NlError, so ring_reconfig reports failures on such
devices:

 - channels() fails on its first channels_get call or, if the device
   can't change channels, when restoring the original counts;
 - ringparam() fails in _configure_min_ring_cnt() before any ring
   size is tested. The helper only reduces the channel count to
   speed up the reconfiguration, ringparam() does not depend on it.

Skip channels() when the channel query is not supported, or when every
channel layout it tries is rejected with -EOPNOTSUPP; nothing was
changed in that case, so the restore is dropped. Return early from
_configure_min_ring_cnt() when the channel count can't be queried or
changed, logging that it was left unchanged. Other netlink errors are
still reported as failures.

The issue was found through AI-assisted source code analysis
(OpenAI Codex) and confirmed on a ThinkPad T480 with an Intel I219-V
(e1000e, 8086:15d8): "ethtool -l" fails with "Operation not
supported" while "ethtool -g" works, and running the test functions
with the in-tree YNL library against the device fails with NlError
95 (EOPNOTSUPP). The get_channels-only case was reported by the
Sashiko AI review of v1.

No remote endpoint was available, so the full test was not run. On
the same machine, an earlier version of this patch with the same
channel query handling was run under ksft_run with a stub
environment and all ethtool set requests blocked: channels() was
skipped and _configure_min_ring_cnt() returned after the channel
query. The handling of a rejected channel change, and devices which
support changing channels, were only checked against an emulated
ethtool family.

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

 .../selftests/drivers/net/ring_reconfig.py    | 45 +++++++++++++++++--
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/ring_reconfig.py b/tools/testing/selftests/drivers/net/ring_reconfig.py
index 6682d4badfb..c7491154d1d 100755
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
@@ -47,21 +58,26 @@ def channels(cfg) -> None:
             supported.add(key)
             restore |= {key + "-count": chans[key + "-count"]}
 
-    defer(cfg.eth.channels_set, ehdr | restore)
+    restore_chans = defer(cfg.eth.channels_set, ehdr | restore)
 
     def test_config(config):
+        applied = False
         try:
             cfg.eth.channels_set(ehdr | config)
+            applied = True
             get = cfg.eth.channels_get(ehdr)
             for k, v in config.items():
                 ksft_eq(get.get(k, 0), v)
         except NlError as e:
             failed.append(mix)
+            if e.error == errno.EOPNOTSUPP and not applied:
+                unsupported.append(mix)
             ksft_pr("Can't set", config, e)
         else:
             ksft_pr("Okay", config)
 
     failed = []
+    unsupported = []
     for mix in mixes:
         if not mix.issubset(supported):
             continue
@@ -72,6 +88,13 @@ def channels(cfg) -> None:
             config[key + "-count"] = 1 if key in mix else 0
         test_config(config)
 
+    # Every config was rejected as unsupported, so nothing was changed:
+    # the device reports channels but can't change them
+    attempted = [m for m in mixes if m.issubset(supported)]
+    if attempted and unsupported == attempted:
+        restore_chans.cancel()
+        raise KsftSkipEx("device does not support changing channels")
+
     for mix in mixes:
         if not mix.issubset(supported):
             continue
@@ -88,7 +111,14 @@ def channels(cfg) -> None:
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
@@ -107,7 +137,14 @@ def _configure_min_ring_cnt(cfg) -> None:
         # looks like we're already on 1 channel
         return
 
-    cfg.eth.channels_set(ehdr | config)
+    try:
+        cfg.eth.channels_set(ehdr | config)
+    except NlError as e:
+        # Some drivers report channels but can't change them
+        if e.error == errno.EOPNOTSUPP:
+            ksft_pr("Channel configuration unsupported; continuing ring test")
+            return
+        raise
     defer(cfg.eth.channels_set, ehdr | restore)
 
 
-- 
2.56.0

