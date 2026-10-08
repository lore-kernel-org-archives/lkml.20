Received: from mta1.migadu.com (out-6.mta1.migadu.com [95.215.58.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CD5470E85
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447885; cv=none; b=WONkB7GbENdjYTHawYRmdNvRaIiXyLkcOBCH4j0t1WPTwDEuANt70fbQAUGqi7NWIqI3W486h2S9Rw/TU2Te7/cyXriPWXrk0n/7GGIyWFEwnQmfHml//udRTBjsDuOPEpjvtp9CbG7VDsJOtPaNqLt0kmflMW6DDzyMqLKZZm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447885; c=relaxed/simple;
	bh=cw86U5iiCax77Rq316UWZ4Sbgs4IceY2PTV6GBfrhJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cvTuuAPiojYUfJtz6WUU1Zw/9o7aVnrViU1qpzjD9rg76yvnMND1H9PEYQa92xPVkxuXsV/tKEx2YbbFWzpbdKxv1mWeOOgl2wlk9B8RKXKL7Ei2ttHalFUYn9RPSVeI5JcZh3WjqaH49uckH7zZFisQovLxgCLkHl109kGlp6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kZMTF5ii; arc=none smtp.client-ip=95.215.58.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kZMTF5ii"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cw86U5iiCax77Rq316UWZ4Sbgs4IceY2PTV6GBfrhJM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791447880; v=1; x=1792052680;
 b=kZMTF5iiK+eixwoX5qiPPOYg4YJwfP7HgnA/qEgB0o1PNE8837PJ41Z5baNT+m8Bb0GlILXI
 qkRTVxDvd8z/RuKIyVaorF9RQtrMP5HqmFe1nlTuY8HtsSGTaQj3oO8TqiCGChjkaKJbtiuiq9f
 31OV8FB9Yt1dt9+Ewom8E+ac=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id efa00a1600d99ccd;
	Thu, 08 Oct 2026 08:24:40 +0000
X-Mizu-Trace-ID: efa00a1600d99ccd
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 08 Oct 2026 16:24:05 +0800
Subject: [PATCH net-next v4 5/6] netlink: specs: rt-route: describe lwt BPF
 program options
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-ynl_rt_encap-v4-5-4ed2ccf7f949@kylinos.cn>
References: <20261008-ynl_rt_encap-v4-0-4ed2ccf7f949@kylinos.cn>
In-Reply-To: <20261008-ynl_rt_encap-v4-0-4ed2ccf7f949@kylinos.cn>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

From: Hangbin Liu <liuhangbin@kylinos.cn>

Replace binary BPF attributes with a nested lwt-bpf-prog to support
lwt bpf prog options.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 Documentation/netlink/specs/rt-route.yaml | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/netlink/specs/rt-route.yaml b/Documentation/netlink/specs/rt-route.yaml
index ea6711292c9b..82e59af56ecd 100644
--- a/Documentation/netlink/specs/rt-route.yaml
+++ b/Documentation/netlink/specs/rt-route.yaml
@@ -469,13 +469,16 @@ attribute-sets:
     attributes:
       -
         name: in
-        type: binary  # bpf prog
+        type: nest
+        nested-attributes: lwt-bpf-prog
       -
         name: out
-        type: binary
+        type: nest
+        nested-attributes: lwt-bpf-prog
       -
         name: xmit
-        type: binary
+        type: nest
+        nested-attributes: lwt-bpf-prog
       -
         name: xmit-headroom
         type: u32
@@ -603,6 +606,18 @@ attribute-sets:
       -
         name: hwid
         type: u8
+  -
+    name: lwt-bpf-prog
+    name-prefix: lwt-bpf-prog-
+    attributes:
+      -
+        name: fd
+        type: u32
+      -
+        name: name
+        type: string
+        checks:
+          max-len: 256
 
 operations:
   enum-model: directional

-- 
2.55.0

