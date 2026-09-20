Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EF4429014
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789905075; cv=none; b=gLPW7cWhdB25fJuT9rDll/HtJX6qvymobPcDLTGVVSD49naIDDksyF/OvbyTXQVJ1pK0h1+jWSrsoZ6IruL1mo/4Kh3ZsJRtHXPP5wfTU7mur9ZLR8mypaiJdrwZVb/sMBVAaaSna2QB8AXsI8wghf/pZ+LXEdhHNyzFbsICMb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789905075; c=relaxed/simple;
	bh=pMbfx0NjIRyRskdHuH6lM861rKcUzwuGwYYxkIB5WEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HqZpPOQQCZ9fDaidaunwO7B7AM9sAwg55QOSyaPSdestWI9zJwqos15pLrnpAWW+J1oEBAl0LmnoqRWUozlZUWcZiieClzU7BrzeD1Z7BlCxsbe1uw8rD0rQK5soFGN4ja+Yg0aGkc77fH6phLDisfw2GVBgpf2ajCTpm2q00GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=smartx.com; spf=none smtp.mailfrom=smartx.com; dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b=02CKOPTe; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b="02CKOPTe"
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3965683e9e9so1659249a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20251104.gappssmtp.com; s=20251104; t=1789905069; x=1790509869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVn1m5BbAcLTrd543GgGtPm08/ACaaeHnQhjr+DsHvs=;
        b=02CKOPTes+Ch1feJ1RYD3fC7qLguOEqagMo2m7KU2vAFOYhPq/2keCkhF8panELeuP
         3amgJb5qeZ8w2MicYf1/6S2X2dxoV3CgbY999quQf9bExh5e/eYynB0l0rmBq0bfCxao
         Xz6s+/EJU0I/JsxM5wOMgmpuwQv0tstxUe87ZKCg3/70otj1Tzao5TwEon4QLsBwS5CG
         bRmer7haHbAC2uW7F/WVfdKkxaHzHbLd08MOptAgY1PTMtUSb6Qs9xTrbICxZwmdxQoB
         d/jd3Sn+xsMm+KLhOGPMfPkOAtyQSrDgf9ma8m4t//F/qESLaLKzelIFWv0ITbbHxGif
         4WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789905069; x=1790509869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVn1m5BbAcLTrd543GgGtPm08/ACaaeHnQhjr+DsHvs=;
        b=c/96w7/E4Ff+zFGosa6+VNEoWL+gwB7o4TzXWZZjNL+LqwgMBh1aC0LForoVrU2O6r
         u4rFpA5W62FbgoQazxwu90/PBF/uiwG3emZvUgfxjCk7SlOZccvsD3wszkpSOKB6Rzlt
         /SG4U342cCQEOHqDQ5NNFG+wKbD8atH8BfHJRZwjT4wd/ZaONVVtioIDOHKLstjO9w8q
         3FQCUmx+uVWp3MIDRLJKaNk99LCMrvE1OEAylCcgzkSv8edqUMYGLB7Ag19APeeNcGza
         gBcl6pbUngxWqjxYfjZKL2Ym+CL+D6hfVHzqnKffayO4kxLz253oMz1GLpZr2y2e5pDW
         ikUA==
X-Forwarded-Encrypted: i=1; AKwUvBzP/Xb8u6/q9VZOp1P/RGuxmxe17Dt/tGgOGkWRD7yCN8grtvMn2611uE5eLyKVpW4ABh909N3V1FGgVZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nHeXSZkSONX20L8KoFv3EhADMkVuXBZsQctl4Mxnv4oTa29rgZ
	r/NVb7j0AyyVBNiwmuHxBeiOVdWDn5h1uvNByoU7vq9hBI43olRRJbo5NmgPURjhQw1MrJ+oRPr
	2zob+kjZbgmnI4//pFZlnfm7I9/vFBxymm6FLj78a1iuZw0xwpqYv8uDd/ec=
X-Gm-Gg: AYBFou1hRu4MkS5O6EpLSEk4zV22ISvwjIhhs3gvwDSq6gw5qshBYQ6aJIb6xiSSJkl
	3FobMWXwjq0ZQuEkNAvPqMROZ6SZ1xsUzcwcZggmYWYg+uuvbyCmx8IWonUU0tJ7vHqinJOoKoP
	UWjl2RHpSgUhEul0lxsrOg8fHFH46Jc21FHFuHTU42pJN60SRMpzLZgojwkKbRSGJSXsyfJnT2e
	3BmlK+sFxLSfS7YtxEUa40Evfm8p4Lwf4J0gSWTaAA/Dx4YIrpnBA1E/NTpQl2LeOQ+/ZQSHbHa
	R1eP50Hscv2j9kzchaS4yxIM5hxlFFScMUw/PxuKaP4rDIwzx9iGylbB11iOdbm4zegQlzS5/Q9
	kk5mzxflZnhqqX/cEU81Cqr9B5ETvizJfA0jfZYPjxdCRrEasFhljr+kco2QA5QTo3St362HTuE
	tgdv14ATtGsO1/rGWXc2BBv53IgeK1I+OK5L4s3fqly50K0ZkoqBhdroQjW1ETNyErrg4/KAh0J
	CxF3pX64b4=
X-Received: by 2002:a17:90b:380a:b0:39e:6a7f:1dc7 with SMTP id 98e67ed59e1d1-39e6a7f224bmr6783683a91.35.1789905068691;
        Sun, 20 Sep 2026 04:51:08 -0700 (PDT)
Received: from localhost.localdomain ([23.148.204.241])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm14633990eec.30.2026.09.20.04.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 04:51:08 -0700 (PDT)
From: Wang Zhan <wang.zhan@smartx.com>
To: netdev@vger.kernel.org,
	steffen.klassert@secunet.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	keyong.sun@smartx.com,
	herbert@gondor.apana.org.au,
	linux-kernel@vger.kernel.org,
	leon@kernel.org,
	huyn@nvidia.com,
	raeds@nvidia.com,
	Wang Zhan <wang.zhan@smartx.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net] xfrm: free the whole skb list on the packet offload drop
Date: Sun, 20 Sep 2026 19:50:48 +0800
Message-ID: <20260920115048.3549614-1-wang.zhan@smartx.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

validate_xmit_skb() hands the segmentation result of one GSO packet down
to validate_xmit_xfrm() as a list.  The drop for a packet whose packet
offload state no longer matches the device frees the first skb only, so
the rest of the list and its payload are leaked.

Fixes: f8a70afafc175 ("xfrm: add TX datapath support for IPsec packet offload mode")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260918084651.3022878-1-wang.zhan%40smartx.com?part=3
Assisted-by: LLM
Signed-off-by: Wang Zhan <wang.zhan@smartx.com>
---
 net/xfrm/xfrm_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_device.c b/net/xfrm/xfrm_device.c
index f153bf695b9dd..0fdd10d29fd1a 100644
--- a/net/xfrm/xfrm_device.c
+++ b/net/xfrm/xfrm_device.c
@@ -140,7 +140,7 @@ struct sk_buff *validate_xmit_xfrm(struct sk_buff *skb, netdev_features_t featur
 	 * XFRM stack.
 	 */
 	if (x->xso.type == XFRM_DEV_OFFLOAD_PACKET && x->xso.dev != dev) {
-		kfree_skb(skb);
+		kfree_skb_list(skb);
 		dev_core_stats_tx_dropped_inc(dev);
 		return NULL;
 	}
-- 
2.47.3

