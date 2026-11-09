Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187282;
	b=guAbPToJP9ZHERAl9Yc52Si8sL5fAgXJFRsdLRYpEAr11caXxmnMtoQhMgELcQfQu7Ej
	 +8NY+wrMcDMkyhcywF54TKiV3FJ7/ocQpOT32zdu/LHgTFTE6331sdnEZoB5HSwz1fuh+
	 UE/sYVAB/gXYBuSXbMZwFO4Ka7HkBM9Td80Z+mrK7gPoKNCSl/l22oFbJ+6pxhud1XOsS
	 AaO0cKYlLJxeoNc2l9n6I9ySiwnR3zooSH8euy8MvT5wy9PHMFL198LeWzIPSiptip41/
	 4P6aahBO4ldNz7NYkAIh9rKe6Vh8BljdiG3WL7cwhgHHP+sEtyqroWyFYBcT+ewV8bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JbaGCvN2cTvM37NE17BDipBUuFaHtKV8fH8i8HWWLkY=;
	b=n2GuAUeIi+cWY3Qd+yczZHFb9CckuasVUeo5hM83kDuKKCNiL9a3y2Avnl78aiOnXtnj
	 UNEd+3+SuoOyYachEaIowH2t/nQtXkqKo8s6IXVstAKH1KyRAzNNxX8MuSCFK44vH2SHO
	 mHjnb8GYfTTBnxUjOaz5jdrUQgZDuHZ+l54L1W2NmIr8PXlECqwOVe2axOVJunPjvDd1O
	 0/38Dsra6XsvXXXmwv5TFqKjE4heVQoalFjtB2DPwKYuwVu+fPFsYl+hs8vY+MXxvpfo0
	 1OHBIQOb3RDXU34KRKXfzFzb0cLPh6tnvq/QW5ZrUpIMffSmsVhrogNHAN7BC33Lkog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZhUe0uCS;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B81606D831
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4B81606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZhUe0uCS
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso266290a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794187281; x=1794792081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbaGCvN2cTvM37NE17BDipBUuFaHtKV8fH8i8HWWLkY=;
        b=ZhUe0uCSDNhuZ+9kVOhTRmUbH68NzwI72Us2qWegQ8cxGqa/QFhKcnVYWamSHE1bCG
         evu1nvplRDDAd0s+udWtXyPl1cp4klrvrOagVDIO+tWRb0Gty0xU2peaoG5mTjT8U4M6
         hbN+v2u6JrnoDyCCH5HEoOM7tKzLBc9pG3NyFkkhjmjd9Lis/TyD5Plx6SOyfdTicQ4O
         Uvz/q57pmSsUzh7FXmRF5tq3f/QFnfqXf+SF1SWBYHg43fr4g2XMna/UKEBGEMC1xwIO
         MaHlzRKZNvfIjtdenizWqwzr5WWycRvsjP1HG2F/F7Pfg2Zd4hdCd5HYlz9brCiLeuDv
         AY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187281; x=1794792081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JbaGCvN2cTvM37NE17BDipBUuFaHtKV8fH8i8HWWLkY=;
        b=aSlDqi9yB50MgZcGgfNtBW4Q+6x9ew5MMPBRaI1AhRIjWGT5OzBnT5EF5it4UmKilD
         03cIqaNnce9/Tk4s356s1ZBggE1dREkt4sfwdX6pTXxXs81VBchACQtWT0bjXM/bmH8X
         AIF5wrlozr7wv0lVj8cCZkiyURsB1jEUEqtFe8mvOHBXDj0SCBX5oXK7oZzHyWiwM+nS
         VW8otMRbaBhn3aGUB3KLldhgn091IpAWbC16Spt19Wxl2Ye3+z7yk34fO3tOea4AyW46
         /GeeXt+UlNT+6X2bSr73S3vCeF0bvg33aeol8nRfEVmNwfdWdlAHRct2W2ZkicGwSwJl
         +ZDg==
X-Forwarded-Encrypted: i=1; AL+hErGTdOVddy5tGT9xOzEdQnwcLVWiSUa3a6AaH/4g1QiFHK3ljQ3YH/JcBjF0S8SjUOfttmNi3tJCqxGsXWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ff22lQf8i9gefICwW454LAsqqjDVH6vaJ79Kg1Nq3WcdJ9fyP
	koPt2ZJ2wALubf6ObcDKMAMiZkENoOiwOQVkeWuQYEdmzFIS27SCBEFBvRJNScBTPo4=
X-Gm-Gg: AYBFou2FlgqoYalJ4uJIZXADD+gAWITfmpkObjcQwxLESX5ahoEKDQFQLc5O2jgPtHC
	SeI/UozVWE3hdSVlbWS8DidKH2QVlc0x7aVvQNNCgqv/o0fWgYSjCd8VGHmeDRD9PZyAE/MaQyI
	U4ROu3cZo1MnqyQsXx7W1CWQATEa4Xf4C7p9UBOL767ykmsY9V1rDuCFOVJ4PGHYagKnKnlaTty
	LHX7B+8ASNMNEjhVijaTnuBrRZNTLuW6QDRLGXRLnsYmsoEZdrzdlYRvXxwcuIWxAWeIh4vnXYE
	F6sxrF6XgspXnFjT+sDG/UQsXEJTEGNvzCtzFgmKJq9QS+XRpumxGpkFKKcbVfy+LotKL3F6Npz
	fVOV/YvYd1cvEi4d+7ubZKKI+LPIgTvqMtVYTaQr5+E7MxBH0ceTerzWo0VY9l9mSoJev2Y4pRb
	65413pgwIFDiQqz4QS3JulhhJsrItqW4jY8JW57SqkyL54jsPr1T2iRTzt2JH7+JhKPEiEXCm+H
	2O4+2QopTLpVnSsgg3+PYkOqAE2YcJ+M/Q4tr+Hef6xUBJsHdCldNEdTX86cg7IMh/dN4DJuckl
	zFUrwCuCocOyIj+te7VJvGSsTgxFo+dMsM0UMphePpPs2MRuF8sc/a8Igh3NQGbRKDfpjvxO9sT
	B2inYroDcdfPUdHGG
X-Received: by 2002:a17:90b:2648:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b12d3e7092mr2210079a91.17.1794187281287;
        Sun, 08 Nov 2026 17:21:21 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b103432e26sm4883217a91.3.2026.11.08.17.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:21:20 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] ipv6: return EMSGSIZE when first route in dump does not fit
Date: Sun,  8 Nov 2026 17:13:13 -0800
Message-ID: <20261109012115.11898-3-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109012115.11898-1-stephen@networkplumber.org>
References: <20261109012115.11898-1-stephen@networkplumber.org>
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

If a route does not fit in an empty dump skb, fib6_dump_node()
suspends the walker and inet6_dump_fib() returns 1. rtnl_dumpit()
then returns skb->len, which is 0, and the dump ends with NLMSG_DONE
and status 0, silently dropping the route and those after it.

This became reachable when multipath routes started being dumped as a
single message with an RTA_MULTIPATH attribute; a wide enough route no
longer fits.

Return -EMSGSIZE in this case, as IPv4 does. This depends on the
rtnl_dumpit() fix in the previous patch.

Fixes: beb1afac518d ("net: ipv6: Add support to dump multipath routes via RTA_MULTIPATH attribute")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 net/ipv6/ip6_fib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index e1d49897d6ab..1025267992f0 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -755,6 +755,12 @@ static int inet6_dump_fib(struct sk_buff *skb, struct netlink_callback *cb)
 
 unlock:
 	rcu_read_unlock();
+	/* The walker stopped before adding anything, so the next route
+	 * is too large for this skb. Report that instead of letting an
+	 * empty skb look like the end of the dump.
+	 */
+	if (err > 0 && !skb->len)
+		err = -EMSGSIZE;
 	if (err <= 0)
 		fib6_dump_end(cb);
 	return err;
-- 
2.53.0

