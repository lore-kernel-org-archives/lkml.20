Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793376735;
	b=VvfSjk9lziKpa+8qyH3F1i8tTYaUAh+ZZgMmFBLZGpolZXaS48CnaazzrquSyTSCMGsM
	 Wb9LgoOJmZrl0uNVEFjyXwqW4E6bplkWA1Vnh3JoS2b4oFXpQ87lodpHufaCkvLJAlFKg
	 uxr/9FwhtLeV5ZjDp+fVsDT96r4mvktVFXVky7SQXqpw76lxe6ZtJt5sAk56LkC7hWyE/
	 tLoZFSXYndMPom08bsB3n/a+93CcVy7iAFb2prPOUsN6jspvY2pgMXtEqTrrjY1dKXtd3
	 ABJyVBCn50bPm/c8wJ1jnHmbbImQOJHHPpYSxjKEBtBC3L8O5TxWhh4T03pxCTfQCjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=eNGYBiGMglhPQnZEli3lO3EUz21PsnQzOy3maSp1K8E=;
	b=QjcAGydfflj4P+hhAr2YCikrWixO71IC5gbD8kopWT8jHIAKa+PrpGmobeuNOf0RjNcP
	 ijQQ4e/VXAlPbDRuNFjhF0uXteDXIsS1fLVGWjSigK6LowMjhmChlHBoW8AFAeurXAhlK
	 lYaJ1DJ3+pXlaKa/URvL2v45P+D/gP3tiuFloIMvV4eFRONWO3+zocJIxfOPih8vWaQXc
	 khGzBN/641XODrQA2sWJxZN25f27lZ0s+Et4WbSK3YpfWmAlVrLaZMwmu7YbmtcylRHUi
	 iWJiI31ujrzHeKHrcGxd2PRROC0ndg6+Sad+0iio2TKZigcR0ewrSrSE18zQ8cSybkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=R7G91VpJ;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D25606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06D25606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=R7G91VpJ
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfc346401aso682479e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793376732; x=1793981532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eNGYBiGMglhPQnZEli3lO3EUz21PsnQzOy3maSp1K8E=;
        b=R7G91VpJZO/V27isXGK073Q0ni7+dfJaQBx+kloxQrZjC+aUzgZhjMYMzhR/sxIPRo
         Uvcdh3l4vNND25xOjJemajP9PTCJSFruztsGi4DXooDmbZkjHs3f7CgpKYc1sjTPVqiE
         46O2m1UZ2J0QkdGYEX8ZKtU4MErQCPLMgZ82UFd4+mfXTSJx3IJ3CRNbvMzHWKRMveXj
         EVDhfMO8HQuIFGm/QctzsHzBrrQZstbtNB+AdXYguRYD1QYFHVI/md+icYWZvz0e+1Rj
         L/UkH/eplslkniA9KNdcTyyCMoyr6L2E+jwRMCK1hvSUCMwcrCymQssxy3jr7oD4fhDz
         vq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793376732; x=1793981532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eNGYBiGMglhPQnZEli3lO3EUz21PsnQzOy3maSp1K8E=;
        b=o5Q+7PGsdmxugidkzyaIiMMkiIh4uh55nU8WDr0ppa/sJKfWK5lRmjMCytqLJ1OHTV
         gZzOC6XDZpVY9QK757JnjDXra6cQd98Es1vMHH/XYQkQ6f9Oo+w3NWzUpTtauMosESUK
         IAw/8LrZBX11B7eh4am6l7C2YsDM3WsVvWb220ceo/nwxWsvPL5PGt0jvW4gwsk1iDvZ
         8jBTi1sbTsSd8UhmiDVw2Fn1K99gAX7TPXSySpTeTbnY0Jux/DjYgOsGJAcm0W/ZVtcc
         3R6P7/h8z53Dx6EYf1ZRwTZrGAYTPacBl6BW5dxYLwwj/BfKK7fadAXjCPB2iz92IJzO
         R7Dg==
X-Gm-Message-State: AFq9FYLJmM7OFaFLP+FXkJJ84N4dgNnyAPlbRGlJF0pYV1etIQyNnzcm
	lEY0wXEfHWSfvSUGGZDXrpuLKvFJBSEi/hJ68RuDR4KtL7HjSzUvq/mTiAYRdv2awBQ=
X-Gm-Gg: AYBFou0Nq9crsfgwcDFia3MXv48JNdqJJBSJFXHXAaDYLFbs8ar+dUspIRPk9PJCw6h
	addNXGtIWwGZt6fglABcDywFbJB4cmRFIerJ+o+aLlkj+MwhjoN5wfLtKawCGRNLstq3pi0RpNc
	lexP2onSdz6uLPOc8tRaKdE9sOtE3vSAw+CwJxr+xx95SUK/zI8edbkLWCDS+SNick+TMwQspKr
	IYW0rks9jCaztclc0waW3TGNQstz23+oaE+zMdJeP2HcmujUYSVmYJ5u6VjKLCzxJyF27xRbdDM
	NbrEjy0WrHPO/zPFWELqZVs3jIRF8zklFTL1/h5jMqJoJiodOEs7SWDk+4HtmXClwdGD0p/JEto
	reQOVcZyKqDxHP0ow58trZORlNOra8lo4gSCSavLeLVQxkasCK/uFBsUPP2PhpT/Tsm2uYARKx0
	sdVdCSqy3HF+onfZb6puLB43JJfEgDriTV41CWN9xIZdQIw+ShawOapM0CUqKZSBl/4Dlo4aV7Y
	rbT/YN67xDFpZxoM5XyXoQySx8GKrzMlin0jZ/oXN2zJpBm2Grsxz2RIWC0qRU425S5hCtO3x3O
	+T1N9tmoMb3W8CZG+zc6hnu/qwngVgelQppnF9vaRpNELmJmGCYtYDeDu1WedlfzTWg8R3fbpfG
	nKcbwHjms0rsGOeM=
X-Received: by 2002:a05:6512:1392:b0:5bf:c9c7:eae2 with SMTP id 2adb3069b0e04-5bfd9596876mr1035390e87.66.1793376731947;
        Fri, 30 Oct 2026 09:12:11 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbc07f98sm3944031fa.2.2026.10.30.09.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:12:11 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	harry@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mm/mempolicy: use one node set for interleave weights
Date: Fri, 30 Oct 2026 12:10:46 -0400
Message-ID: <20261030161046.1497894-1-gourry@gourry.net>
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

From: Andrew Morton <akpm@linux-foundation.org>

From: Andrew Morton <akpm@linux-foundation.org>

Switching weighted interleave back to automatic mode while memory is
being onlined can cause a kernel divide error on x86, and a panic if
panic_on_oops is set.

reduce_interleave_weights() scans N_MEMORY three times, but hotplug
can cause N_MEMORY to change at runtime - and torn reads on that
nodemask can cause a total sum of zero bandwidth.  A node that
was hot-unplugged and then hotplugged back can then cause this
loop to generate a div/0.

Record the nodes visited while summing their bandwidth, then use
that same set when scaling and reducing the weights.  This gives
us a consistent state even if N_MEMORY changes.

Fixes: e341f9c3c841 ("mm/mempolicy: Weighted Interleave Auto-tuning")
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mempolicy.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

 [gregory: recieved off-list, separately validated and tested)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 6f92621e9135..26a1a21be65d 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -207,15 +207,22 @@ static u8 get_il_weight(int node)
  */
 static void reduce_interleave_weights(unsigned int *bw, u8 *new_iw)
 {
+	nodemask_t nodes = NODE_MASK_NONE;
 	u64 sum_bw = 0;
 	unsigned int cast_sum_bw, scaling_factor = 1, iw_gcd = 0;
 	int nid;
 
-	for_each_node_state(nid, N_MEMORY)
+	/*
+	 * N_MEMORY can change while wi_state_lock is held. Remember the
+	 * nodes contributing to sum_bw so all passes use the same set.
+	 */
+	for_each_node_state(nid, N_MEMORY) {
+		node_set(nid, nodes);
 		sum_bw += bw[nid];
+	}
 
 	/* Scale bandwidths to whole numbers in the range [1, weightiness] */
-	for_each_node_state(nid, N_MEMORY) {
+	for_each_node_mask(nid, nodes) {
 		/*
 		 * Try not to perform 64-bit division.
 		 * If sum_bw < scaling_factor, then sum_bw < U32_MAX.
@@ -234,7 +241,7 @@ static void reduce_interleave_weights(unsigned int *bw, u8 *new_iw)
 	}
 
 	/* 1:2 is strictly better than 16:32. Reduce by the weights' GCD. */
-	for_each_node_state(nid, N_MEMORY)
+	for_each_node_mask(nid, nodes)
 		new_iw[nid] /= iw_gcd;
 }
 
-- 
2.56.0

