Received: from mail-lr2-f32.google.com (mail-lr2-f32.google.com [74.125.230.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DEB4D2ECF
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231274; cv=none; b=WsisIOCOov2ldn6o/Xu4BtqigOvf1JrFhGLgCaXbUsMihl+26rQBUArOsamh47oQgE55AvglD6jJ9zLbAEneR6tXbrVNjkMNVZzSIb6PQ46TJNw0SRhXjqz7dTRDPZ1bo8WgYJq6N0xklBAq43i7ZhM8urmGoVu3zo3t5Lahmnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231274; c=relaxed/simple;
	bh=AKX0VGDDb7hHniNBSadlltPqnJTVaPw4u961bkdC47U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TNCPgS1Ni7+NK9LuQA/cGBtGEY2BU0/p2aMiTfnebM3zhtCc8FocoE+rkg3AUyAvAuxIaBAuQFODaMMNLLzGSeBsQ04/ijDU5yK+0fec/r67EHi9d6zAR80m4yqZxLoue/9PGL+n9A2gzsicOPH13yQr8EeYwjCrcGvbApErTgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvdBdtrI; arc=none smtp.client-ip=74.125.230.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvdBdtrI"
Received: by mail-lr2-f32.google.com with SMTP id 38308e7fff4ca-3a981d6c5b4so14717321fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231268; x=1791836068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VttY61a3a/Ies1XvMZgIWwrQFAm/hAwJAXLrgBAs69g=;
        b=mvdBdtrIb6zt7SInwQ3JgWLoMQOs+Hp6s1sl9Mv7NxZMItUqjgg9ZATpQrWNJPX7Bk
         x7wr5pgztIouWbJ3jnfdeEQn5o7tM3N4J/LqdjNvLRYd851LFiWHnuQa57ZkTPtvDD1Z
         veXmJuAtAo35m22Q2qVLDJ0jndJDAOkCyGDzW/kqjRwjN4SsNlgmVNRNtr04zK/nkX4r
         Z6IEBvqTjXRVt2Vz50UR4TKNNiptVYKXjVNL1TvWWkeeCSLk9ltDTHeRLRTBdy3G9T9/
         R99cE3jnXz5e9NVfWn6DAnSa84+6IdtymiDLgkhfnvZfXM8pxLeiRagsuh3H+tvzXrUI
         uXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231268; x=1791836068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VttY61a3a/Ies1XvMZgIWwrQFAm/hAwJAXLrgBAs69g=;
        b=Fjs22NDpGp3DHMBcOUqdnjyrPN6XOzUq8L/Jh9M6Wln6/NVb/CPIPYUVIwWRMr8ReQ
         XAAPJDXSAgcd5am12XHEwx74aeAzyEIrozfVpRpktuw4WrpVF6XWLqqsv7zIK+bv8mSa
         aQcv4B/lIliEz+levyb8BYg1dWydtHHOYrWrKPetPZ7LeHEVXsKWE6YUdQadiRn/1X5R
         jNZrQ+M4ftFYtTGndQ8qvp16oJR9V+c1Rd1o3eny7uM5MA//hQMPAV8wHRVhGZCtS7fa
         kePI+4Iyr9KqLgQwt99JG0lA17ft6no7GqudAV9jBywC3MZcsa79OZtiAI7PliRwdo8j
         ReZw==
X-Forwarded-Encrypted: i=1; AKwUvByFjs0TfK9W8rCvrHXc0xQod32/uuMSV5ufpM/mWlRcmr2ccXrym8j6ynd4fuAvKmmRwThSWhYzSwEh1Zk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1iMwai5fjNLD2K/DGmn9UGbAD7EZUqApCspLom9/Ivqrsa9bZ
	rskUc/fM0zIiNStsZCv8lzEWF+cowK/UUmrL1AcNsdz9A9/XtOf2Z5l0
X-Gm-Gg: AYBFou1I757jBZ9maDXfvRfFuQrcurye2d0OAYfRrp5RFWi6+aNv+pziHM+U0y2Eg51
	iMfy2TLGEuBVHPhFkXuRejtT0aLU5cyfDz7mni730FLy2dKvPR4JyJEK5s8rH0fTloOxzhimLMc
	X2IQP9vWo+7G07d2DI3cCsxPDRQwnwFG2B2gnJ+UzZeJw4iTxsfx7nPi04DLurbzrM4/pD3zIKh
	pxmvOfrcUSOpuXFTLAoXWyRkeCwp7w4e1Vh0lR9QxJXNc5p5nOg0UFvoxHf6RwP1wqsfk08EQCg
	2RJFKvOh1y5Ko4nHn/jehTQJnO/XLpxFuK5HmRv9qGpBCextUpXnY8DIfFExG63+1nV+MtnXqBx
	n0HgE4LKRuq5nZuRlZuYbLocFObPTnYIiHWN5Cd4i4yAgMKd5NFD9JsHRxClp9lDFIIydmq/ALv
	e9FzQiyaggW3f5rnGHjXvyJdjIiLTT2ayzZvnuuyKKYSzfX9GmN5W/td6LIZUA3zG9HNecvyPqC
	5FoxNMsElJ04zkwumar8x3uyqgQKjapRBJemkj1lQ==
X-Received: by 2002:a05:651c:19a8:b0:3a8:d34a:dc64 with SMTP id 38308e7fff4ca-3a8d34ade19mr31459901fa.1.1791231268379;
        Mon, 05 Oct 2026 13:14:28 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.161.1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303889sm43114681fa.20.2026.10.05.13.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:14:27 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/4] vxlan: report a circular route as SKB_DROP_REASON_RECURSION_LIMIT
Date: Mon,  5 Oct 2026 23:14:17 +0300
Message-ID: <20261005201417.906344-5-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005201417.906344-1-littlesmilingcloud@gmail.com>
References: <20261005201417.906344-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

udp_tunnel_dst_lookup() and udp_tunnel6_dst_lookup() return -ELOOP
when the route to the remote end goes out of the vxlan device itself,
and vxlan_xmit_one() counts that in collisions, apart from the
-ENETUNREACH of a failed lookup. The drop reason does not tell them
apart: both are reported as SKB_DROP_REASON_IP_OUTNOROUTES, which
describes a failed route lookup.

Such a route would send the encapsulated packet back into the device
it leaves, which is the dead loop on a virtual device that
SKB_DROP_REASON_RECURSION_LIMIT describes. Report the -ELOOP case with
that reason, and add the tunnel case to the description of the reason
as an example. ip_tunnel and ip6_tunnel make the same check,
rt->dst.dev == dev in ip_tunnel_xmit() and ip_md_tunnel_xmit() and
tdev == dev in ip6_tnl_xmit(), and can report it with the same reason.

Assisted-by: LLM
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 drivers/net/vxlan/vxlan_core.c | 10 ++++++++--
 include/net/dropreason-core.h  |  6 +++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index 0d98e29e2d72..7c94a630d184 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -2547,7 +2547,10 @@ void vxlan_xmit_one(struct sk_buff *skb, struct net_device *dev,
 					   tos, use_cache ? dst_cache : NULL);
 		if (IS_ERR(rt)) {
 			err = PTR_ERR(rt);
-			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
+			if (err == -ELOOP)
+				reason = SKB_DROP_REASON_RECURSION_LIMIT;
+			else
+				reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 
@@ -2633,7 +2636,10 @@ void vxlan_xmit_one(struct sk_buff *skb, struct net_device *dev,
 		if (IS_ERR(ndst)) {
 			err = PTR_ERR(ndst);
 			ndst = NULL;
-			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
+			if (err == -ELOOP)
+				reason = SKB_DROP_REASON_RECURSION_LIMIT;
+			else
+				reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 
diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 40a27d8887af..664249924219 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -613,7 +613,11 @@ enum skb_drop_reason {
 	SKB_DROP_REASON_PSP_INPUT,
 	/** @SKB_DROP_REASON_PSP_OUTPUT: PSP output checks failed */
 	SKB_DROP_REASON_PSP_OUTPUT,
-	/** @SKB_DROP_REASON_RECURSION_LIMIT: Dead loop on virtual device. */
+	/**
+	 * @SKB_DROP_REASON_RECURSION_LIMIT: Dead loop on virtual device, e.g. a
+	 * tunnel whose route to its remote end goes out of the tunnel device
+	 * itself.
+	 */
 	SKB_DROP_REASON_RECURSION_LIMIT,
 	/**
 	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
-- 
2.47.3

