Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DE1455176
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774780; cv=none; b=ro4oeVvSL4/+j5ewBrc/ZEs5fCCZGNRTOOp40Cl1DbwtGS7FQY9SZkBjBOQ5pgeJQGKI0CILBcQpx31qDu1IpRfl4MxiWGgpZnqT8fiQ2eRRKsowHkvmlXOSxtBwxEA9jXCV/dH/RzOfL80AqEQty3AO6QoxUwzDa2Xfi13rrjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774780; c=relaxed/simple;
	bh=hBg3D/J/ocDdblowAKe4EaRsTJDtpQ8JcltIc+PaO7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sp8/wu4m9F+SBr+lrqzyaCofY6Qqr0lxmQUP9K88LEOQQBzLKzvoLa/zUSGYoRonQjKfF7/BNTI36CKTb1zsYdNpgP0BeCWaxoUse/ljLjqd/yX9INMIR8F1iHzXYHNMae9udqhot22SxzImvA/0Jr5Q/nkjfJ0opT9dpEemnk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohjgjEDP; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohjgjEDP"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so2962305a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774778; x=1789379578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TmSlKz9c4FGvbJaD9XV0mEk6m2YQk28BnycotBtjlRc=;
        b=ohjgjEDPyWVFXL/YvsUNNYQm3/kg9LXFVuhuqKsFDsQRn8vGwq8OKn8nLjYJSwgYU2
         AqBsIpi3EufW2MKZ+2s4mpF/ue56b/AohW/M1HCQMd8KDsm0mPLz5diUqbwLDuQYi23e
         ilVCH4bD3kOixD+jc55SD6HCuQVfhuX/+SbR522BaY3PinHCbN2JVzHHfKJk04xPGqCm
         aQ729ISMO3khxm1s29kj7hjKeTsXBZ6y9GVK66j59Oepl5ju9xSmNj5f7M1x9yhenmG/
         DwEhWwG9Jxc7PsdIN4Vkhr1JoJpfKohD5/qIY8HFpk8d2hTzLF3BwH4wDyf4C6bO2Axc
         RQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774778; x=1789379578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TmSlKz9c4FGvbJaD9XV0mEk6m2YQk28BnycotBtjlRc=;
        b=V51mfugnPUTuW07Qc0lgdGPaK7INY1OLZHdsgw6ly3IGQB1smPcIrIULkr0PFCfVh6
         Oi2jVifa5S5ihM34h/9q6WGCur/0Xrfu+GMWSEedhIhfbUCq2tkfKEcr9tfMBcahbJvn
         98IT9ZjKkao5GcymJDrSZL8w0McGwY5GEAVWjxERb7nqr8qffgMIgZ5472Io5y0jKs3J
         BGXtRyxSoww2xkyGS5izr7zyx9LghJ1N3hjA/OZgmS1HM/Xn9yB8nFKCRRQjIT8I+8Z0
         5cNXjMJFQLVIEY0JbDNnbzHuHn+7yJmWceBC5nnpcGQ4kNugRnbnK7h1BrngLjXweeoH
         TROg==
X-Forwarded-Encrypted: i=1; AKwUvByRXtR9axozOL3dKpa9rdRn5GNrRFDTdAH8BpVPQl41f4JcE2xsbujN3u2smNIYbazNHwhY2E6G4zL/5E4=@vger.kernel.org
X-Gm-Message-State: AFuF++m0qqWb5FLa002hwqQrtR7JH0VhaSsWP9PDh9yNL1z+4XTHXV3S
	JvdgZn0xuebC8ygZYmHxxZuEQGMeRfuCO6G6yeo1sYnN+Rgs5HgDFbg+
X-Gm-Gg: AYBFou3fuzqNHAxwLHL0daDp3Gf1FciRVRE3WfpVgVnkZtotpqlMJDHXQh30OX/em2K
	MjC0/4WiA+Sc5iXw3whZSHpQ66+mS6+7eTWJ0SmgNlV0adBZQ9N5acrxD0Tc3f9brvJ3TByLXb8
	ej7UnbVXq/74+qJoy2Raxu70leDo+e3mk/VeJ5aJJGopt1kjEw1RI1zHiewvFig0WUQZ4/9PWmJ
	Qs2xOmog3YM+6iaJYyfNVttHEjZk7a8moLPePzaj/Pmd0xKTfEZgMuSYVrpXM8XJ+apklG2IlwV
	Y34AgOz6I+uvKN8FcZr37Z0Uuge5Ek6lsyTqqrBLPQEQQeJS4wlxsEx+UROJcg6qAZZjpkgu5GP
	2u8FvvMNijwWDiLQ28dQsqEhXpFsv0D9R23ngkbvxTuI6+lEXRbcpungi9jb1OqWLsVUj4qxdY1
	gIAd+lvIFeo4wLxCCEGqHU44uSizt9/Y+wZjE8WOT6IEUSXhi9K6SzcMPKlLMFXlF8Eh7oSZNP/
	8AP/t6EJ6bPzA==
X-Received: by 2002:a05:6a21:6f12:b0:3bf:49c8:f7b with SMTP id adf61e73a8af0-3da39fdfe0cmr33889558637.13.1788774778035;
        Mon, 07 Sep 2026 02:52:58 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm18924258c88.8.2026.09.07.02.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:52:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH nf-next v2 2/3] netfilter: ipset: fix typo "artifical" in comment
Date: Mon,  7 Sep 2026 15:22:40 +0530
Message-ID: <20260907095241.24441-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907095241.24441-1-hemanth.selam@gmail.com>
References: <20260907095241.24441-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in comments, found with scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt. Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes:
    v2: designate the patch to nf-next and use a subject prefix naming the
    component, as maintainer-netdev.rst asks; v1 went out with a bare
    [PATCH] and a "net:" prefix. Rebased onto nf-next, diff unchanged.
    
    v1: https://lore.kernel.org/all/20260907064239.39910-1-hemanth.selam@gmail.com/

 net/netfilter/ipset/ip_set_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/ipset/ip_set_core.c b/net/netfilter/ipset/ip_set_core.c
index 0a86a170ba90..4aeb767088cf 100644
--- a/net/netfilter/ipset/ip_set_core.c
+++ b/net/netfilter/ipset/ip_set_core.c
@@ -1426,7 +1426,7 @@ static int ip_set_swap(struct sk_buff *skb, const struct nfnl_info *info,
 		return -IPSET_ERR_EXIST_SETNAME2;
 
 	/* Features must not change.
-	 * Not an artifical restriction anymore, as we must prevent
+	 * Not an artificial restriction anymore, as we must prevent
 	 * possible loops created by swapping in setlist type of sets.
 	 */
 	if (!(from->type->features == to->type->features &&
