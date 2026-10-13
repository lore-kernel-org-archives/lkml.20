Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581C04078C1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887959; cv=none; b=SeU/bTwc5cIri8iZdKfkNfwokhxuJcmjJIF7/oRw9vogojvUg7o1uWoNvWKymRs45NAfOQDKHnsxEZRklKWAZjBJvcM6HwC9N17OgoT6MlFcZ5rmiWZ8v1ZcLWZbABpxCDtA8qOg+EbMNEDX3UqnLo73S6vPg8RKaFcAgCBY4eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887959; c=relaxed/simple;
	bh=0uJ+kESm1PwiYPBfflB5thPfi9nQFbOwnmyUiLZ2SEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcmsHBvqapX5cQwp6wEccOwYKwYBErC0HK8Zqx/nk8yDTlKDFASBHeOXzxbJX0oza4+QGzBlyru1RXPzlWnWcWxe/ozO9kdMGgAewO5px13n0uJ3YK7Jc6ELzuMkUj7J/PxKO0q2/Tq5+Zazxf/xRDmCX2Has9N63hp5gTDcEh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=ditXe7mU; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="ditXe7mU"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso3272501a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1791887954; x=1792492754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0VR4BhwU3dfr1tgwz6hrqGOWxE0skLoQ18O/+G4pO8=;
        b=ditXe7mU39OVQwRxu9fO4NaNK4aubND8FdlfmCwc9eRIdMullVnmwMQI8qg7C3FBiW
         DhCfTTNwfEPh156povT8B/8OMoLLQwl994tmfoO5ELuq4xE6sWALN+zJqx3CJRSx0KHT
         Efk/CvDJCm36lCO6kAxjy8c1zZMxAMg3DJV//lj8OYg+U9q83oHjsxYIsyp4tSKyJDoM
         RjVeDbDm0FIuBGNpyav9d+95qGv35YKsoOBM/6KAxZLbY3Y3UXCVJFx9PLAlpNHULADR
         CYse4/TZmIm8ZfJBH0K+BWE7XhZrH2JtLeLwz4v9yzFvghbxkvR0SZAvKxJTxJkw8T+Y
         U2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887954; x=1792492754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G0VR4BhwU3dfr1tgwz6hrqGOWxE0skLoQ18O/+G4pO8=;
        b=lYvPV3CtpZ/u9rqfvt6zD7wJ4g8Tgo+fDoRvTevg/vNjN5384LEasWRlkMe1sH5ItT
         y65Ls0jcm2CZPBm/qNmnl52s0/kvtzVnYbo73JQkRPgFldIrK2GCwTqUsTyDRQDCyRl2
         grsRmrFuCmam39kfiapnPum2zbED7vasoFQVvSahoET2i4wilGMPewAnelMC6Q49Wqfi
         dUovgrcwQm4lVDZq+Ox4kOAgBRE/RbtpzfAlGt3ixiAQt6NkECAelu8nttGpUy4urHX/
         Un0fAzx9daYEE8+WizRoZ+g3X3NQyqNuA6f6/Cr7Wxyj9+v+3dcr18arJdgraHRyPmX0
         N3XQ==
X-Forwarded-Encrypted: i=1; AKwUvByb1RY/hWZ59FXLx7mRcCWoYcjY/1OPr/xvaLTxD8jULgjJfLl0q/5Lyuj8/8kfYlFkilHhX5qS9wmBIj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDtZmJK78JZNfGslrHVyedAif39vUyrOR+d8GjlYe/E8P/XDdG
	qCTYIYWUEUcTrgfqkmHshHl5JRXM8pkMoakVUJtIatBB7B5gw8FeBOhFpmiahm8R6Gk=
X-Gm-Gg: AYBFou0Pv4qz/KGLCtNd4pVHtoii71hCuENxF/M5NMNr3fMYLJlKVs6S66w5IcFavdN
	uBSRg6OKayCzlKHhnmvVi94wkxG+SUoq67yIw7IemsBli7Jzcfjn0hnMYhrAkniI/4FOpygIzxr
	cF4YmW9dYmxdcTHxzTwJEkFgBp6o3iz3ea0SqPNep/25je8qoxZQVXoTPCn3dJrZ+MFDevbKUwk
	ZzKq/pkqPmPzhYPkYo1xSPZ0NDwijvNyTp4JEShgZ1lc9Otoqu6lGDDV2N42NEuqdwo9dFgOigb
	osoPm3gs6DIpeqvuAiMlJOQdzcNm/nVzBVciD5S0J3DAWtdif+Us+2Xh5S4r1Dlkp6N28riDcSN
	M2KJA9jiBlKtCdelZDixhOKOXT3+Oh1gNwvdc+eCtZMlexIskyLQJvfOu8TyLKxHH9nQmKShyWB
	T58gkunAUQMHuLvyTQ19tCugNaBIqSETJM/zoGUiLhGJt4O3MVfh/JaI/YyyT7mXMqgaBVyoDRz
	7q2qSDuDyDaTtZHF24b3fbQCg==
X-Received: by 2002:a17:907:3da7:b0:c26:2fc8:4e91 with SMTP id a640c23a62f3a-c31a9d579d8mr1148888566b.29.1791887954405;
        Tue, 13 Oct 2026 03:39:14 -0700 (PDT)
Received: from 8951987238ab.arnhem.chello.nl ([104.28.187.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac62a7sm552462166b.63.2026.10.13.03.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:39:13 -0700 (PDT)
From: Willem Ferguson <wferguson@cloudflare.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ncardwell@google.com,
	bpf@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com
Subject: [RFC PATCH net-next 3/4] tcp: add TCP_TS_ID socket option
Date: Tue, 13 Oct 2026 10:39:05 +0000
Message-ID: <20261013103906.2660384-4-wferguson@cloudflare.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013103906.2660384-1-wferguson@cloudflare.com>
References: <20261013103906.2660384-1-wferguson@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a read-only TCP_TS_ID option so applications and tests can see
which TSval identifier, if any, was assigned to a connection. The value
packs the identifier width into bits 8..15 and the identifier into bits
0..7. Zero means no identifier is encoded.

The option cannot be set. The identifier is chosen by
BPF_SOCK_OPS_TCP_TS_ID_CB when the SYN arrives, and there is no way to
restore it onto a new socket, so connections that carry one do not
survive TCP_REPAIR. ip-sysctl.rst already documents that limitation.

Signed-off-by: Willem Ferguson <wferguson@cloudflare.com>
---
 Documentation/networking/ip-sysctl.rst | 3 ++-
 include/uapi/linux/tcp.h               | 8 ++++++++
 net/ipv4/tcp.c                         | 3 +++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index ce669f282250..d5e992623326 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -1123,7 +1123,8 @@ tcp_ts_id_bits - INTEGER
 	often than this interval prevents it.
 
 	Progress is visible through the TCPTSId* counters in
-	/proc/net/netstat.
+	/proc/net/netstat, and a connection's identifier can be read with the
+	TCP_TS_ID socket option.
 
 	Checkpoint/restore is not supported. The identifier is selected by BPF
 	when the SYN arrives and cannot be restored onto a new socket, so a
diff --git a/include/uapi/linux/tcp.h b/include/uapi/linux/tcp.h
index 03772dd4d399..5d7f37b6f8d9 100644
--- a/include/uapi/linux/tcp.h
+++ b/include/uapi/linux/tcp.h
@@ -142,6 +142,14 @@ enum {
 #define TCP_RTO_MAX_MS		44	/* max rto time in ms */
 #define TCP_RTO_MIN_US		45	/* min rto time in us */
 #define TCP_DELACK_MAX_US	46	/* max delayed ack time in us */
+#define TCP_TS_ID		47	/* Read TSval identifier and its width */
+
+/* TCP_TS_ID value layout: identifier width in bits 8..15, identifier in
+ * bits 0..7. A value of 0 means no identifier is encoded. Read-only: the
+ * identifier is chosen by BPF_SOCK_OPS_TCP_TS_ID_CB and cannot be restored,
+ * so connections with an identifier do not survive TCP_REPAIR.
+ */
+#define TCP_TS_ID_BITS_SHIFT	8
 
 #define TCP_REPAIR_ON		1
 #define TCP_REPAIR_OFF		0
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index af994edde7f7..5991b16396b9 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -4711,6 +4711,9 @@ int do_tcp_getsockopt(struct sock *sk, int level,
 		else
 			val &= ~1;
 		break;
+	case TCP_TS_ID:
+		val = ((u32)tp->ts_id_bits << TCP_TS_ID_BITS_SHIFT) | tp->ts_id;
+		break;
 	case TCP_NOTSENT_LOWAT:
 		val = READ_ONCE(tp->notsent_lowat);
 		break;
-- 
2.47.3

