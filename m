Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197332;
	b=D6yYHpD+vuxhx+849e5lGifOXDEMZd9PVDfWrhDLiEYErI7Nf8CD3TuBRWvea774lnux
	 FK5mTAs6mcKP/Pi2E7L6GobvwwmqW7XOq6b0xAGISyN2TtaBs9vAaBCw6LgW0izhK10SM
	 gyzsK29S2X/ESaEnUhQuLTRoc4+lUTYfmn2YUJoj9cZgpBGCSN2Mk+FczH4cbiYia9CZg
	 k+mbpCniy6cLd0xBmEuVdfa6llIkYHz5/PnZBzn7/HR7QxAeOnecpKq96AllsuXeWEFh1
	 i0xKd+O0wwqZKNje2/8cYmUm7pVXX0xs5AVluALEoIYxvpyoB2QCJbEEqI7WXpYvCyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gqJ0WlZJEjY1WtT7hIbPxHW5FniZwK8mIH2WvTpStXU=;
	b=MXpjJVvr7m9D2aGerdnbUXSs3xATFYfPInAfhNojT2hj27vcSiKIVih4KqV8o5iXB/13
	 I4iqbrFARRa0A/QB3CR1Huh3qTVPBGwebAOXpNPXMRMr7RavGunWqZbX2P9d4NBAL0hgH
	 2jO++9I92ThNpHvCbHApsZyGVN3jFwEax+prrwp9+x8IpGPlCx3dI/KLYvTLlj4FMxwyx
	 zxmzFrKBozOKSPNlAMDxZtsaoWG340pFon8BDv+E7N/L5TCpU4ZSMt0+XnyQdCavnHThe
	 PaDFntEcKJ+BnpVjXNIVOoQbRjMYTX5VBE5syo81w2jyGjBAyePRqFAsmHPegYsvDJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGN7imdB;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83572606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83572606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGN7imdB
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso488784a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197332; x=1793802132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gqJ0WlZJEjY1WtT7hIbPxHW5FniZwK8mIH2WvTpStXU=;
        b=zGN7imdB9l7Z90ZT96iLtDTKw947mg/cpOB45lxUfEVaDUFTM15+26LDyBrTG8G/N4
         XdVAT1Gs/9WdN8gWJ+tJhsk83hT4Z2zuFu5GxOpwxbEEv8vai3TPJ77IJDNnqhYiOGEm
         WfREZDMWnLsKTdRZwPndWNaF36kJQW4qMKwndesuARyGbx/qSejFAi2ia7Mqo2+2ABKI
         Q2aZbDqsQflidZ2Q5vMYfILZBubAtIBuouRLnYoVZm8n7CbgZe0V2JUrjwTOMREL9zFh
         kHuJfmhVMhFC169xRuIhdGd/JPQFGpG72OrE7XC0fvWEMuvDwaIKlkDODQjzWxs6FmK/
         vqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197332; x=1793802132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqJ0WlZJEjY1WtT7hIbPxHW5FniZwK8mIH2WvTpStXU=;
        b=XR1/ZfuntOJm5hOZ3BhpPFGLuzrNHqiQyNo/KCQrd9YO01G2ywWtH/VwvbRqVhHKKU
         A5gvdiIuIzbKs0sOd4szaNXM7PhdgKQ7hia7QZkg2UDu4KFmXeY1vx/Oetxnhy0tljQE
         qBQJSedNvEjA7YShfiNMUbgLLGQr70ob4yvmuVMwYkaTARTaym3A5tlD4M+KjjsInkkL
         0JD/L4zhl57w1MS2NXdf64WjFHN+Fx04j7djGHSTyrOIz4utbPP9us5UVoSQUBUwDJUu
         0BfXnetYMaiopAEiTxW2u2uq0gESvnq0T0rjxtLBJL4PCOIKh9h0Y4HThTmkUJTVWgsA
         5jhg==
X-Forwarded-Encrypted: i=1; AKwUvBxjKi2BXNXkGkodNm785J6vm92HXy9C47h5syldQmNTxz83wSx6/TB5bpO69jaVIgSoSKCdudqb6NI+eNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCtH/8DBHF1LLKXQsbN+hiSXxJG44MNONGfnVFYH1zeVBBUY9k
	qRPjLBzQVh10gjFTC5WKvjxrqsKIGQOsiU3m3YdZPeSCTSmNjaC2f5UY
X-Gm-Gg: AYBFou0CqTbuGUWTiary7zZviBSAqG7nsErEscAy/awasuaMj93fbPHDjmSxysPvBuW
	YknYd8gJrGKlWPErZ1XX3HTsWYrqCWDQj68OPfT2E9MJwOtml4/k/hZx3uEk46UQsatGdyiLpe0
	7cCOsnPqS7+cxfGPxO2pwol/66jG6vGa9v8p2rogiPk/Kw14CXU9tti2+ZD+F4g7GAW7p8HJhP4
	RbaHrU2f4c2+lfib4CfzbzrtU8tU6fpoAIFMwh514HaE3/iwND3fzLi6MoUQ3bPc8riW8CyNAVL
	lO4TK0uLnLhg/npPh60x4T7q72CA9XZCYwcdk51hDzcLqmbfG9QyaA7XbjwNJGSpz5QUPgNPZMU
	Cg59l9p5ZI9MBucmwEz1GEk7C/z5CDfjhl9TMxM2El7scT+1XPyc3swOMaraa5NIIvcK/ut0vb8
	aP5YR+fMiAyHAfzNXlmUpJtkn2Hc4K40zU+oLCuhf7GAbAHPHCGKrS2PVGBjTFk+sW+IM0GztSe
	JubIbVWumV2jONFGdmZxWttLVESiGVkMxEv6czBMUTy18p1CVHXG531oIs3Mf4XXz6gPLDKf9Px
	WtkXVtjcjump1q/9xR3L9X8GGJCtBlKLlI3ssfx+33lzcNnqihjfGNtBb+vimrgB0n/LOJTs1y5
	FLYqI2k0yFDK2ow==
X-Received: by 2002:a05:6a21:4784:b0:3e2:26fc:2e06 with SMTP id adf61e73a8af0-3e9023072ffmr1926419637.26.1793197331584;
        Wed, 28 Oct 2026 07:22:11 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a7b786b4sm1271966b3a.57.2026.10.28.07.22.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:22:11 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Felix Fietkau <nbd@nbd.name>,
	Ryder Lee <ryder.lee@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: cfg80211: preserve mesh A-MSDU lengths when adding mesh headers
Date: Wed, 28 Oct 2026 22:21:49 +0800
Message-ID: <20261028142149.13834-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A malformed mesh A-MSDU subframe with a declared payload length near
65535 bytes can pass validation against a much shorter aggregate.

ieee80211_amsdu_subframe_length() adds the mesh control length to the
declared length in a u16, and ieee80211_is_valid_amsdu() stores the
result in a u16 local. The sum therefore wraps before either walker
compares it with the remaining aggregate length. The decomposer then
splits and delivers the malformed aggregate instead of rejecting it.

Keep the computed length in unsigned int in both the helper and the
validator so oversized subframes cannot wrap.

LLM assistance was used to find the bug and review.

Fixes: 6e4c0d0460bd ("wifi: mac80211: add a workaround for receiving non-standard mesh A-MSDU")
Fixes: fe4a6d2db3ba ("wifi: mac80211: implement support for yet another mesh A-MSDU format")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: A W=1 module build with MODPOST passed. A QEMU
guest using the real validator and decomposer accepted both malformed
mesh formats and emitted two frames before the change; both formats were
rejected and no frames were emitted after it. No KASAN report is expected
or claimed.
A reproducer is available on request.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.

 net/wireless/util.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/wireless/util.c b/net/wireless/util.c
index f2464d2ce0d5..c510fc62d819 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -822,12 +822,12 @@ __ieee80211_amsdu_copy(struct sk_buff *skb, unsigned int hlen,
 	return frame;
 }
 
-static u16
+static unsigned int
 ieee80211_amsdu_subframe_length(void *field, u8 mesh_flags, u8 hdr_type)
 {
 	__le16 *field_le = field;
 	__be16 *field_be = field;
-	u16 len;
+	unsigned int len;
 
 	if (hdr_type >= 2)
 		len = le16_to_cpu(*field_le);
@@ -849,7 +849,7 @@ bool ieee80211_is_valid_amsdu(struct sk_buff *skb, u8 mesh_hdr)
 		    __be16 len;
 		    u8 mesh_flags;
 		} hdr;
-		u16 len;
+		unsigned int len;
 
 		if (sizeof(hdr) > remaining)
 			return false;

base-commit: 25e73f1d6868c759c8eb56cad4e411692c5341b4
-- 
2.56.0

