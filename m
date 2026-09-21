Received: from mail-pz2-f20.google.com (mail-pz2-f20.google.com [74.125.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB0E4F6479
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014570; cv=none; b=eokSqkbXCLgwT/RnK6/y6InPryIlOFFgKFHfB8brvfCA+/AJkOqlZSV3cQXWcy6ppnPN2fKY1pfIQcKGEnBwWuYxba39c5XVdfoBilnC5cUM0b8bMMSw0pXqeC4PxZeet13DBt7Oma5J22xlkxlDN3ZI0nQecPPhUw+tEBJlHjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014570; c=relaxed/simple;
	bh=9sO/C+Mw5RPob4eZkpAodclBSGa8oO5zecCGg5bgyHE=;
	h=From:Subject:To:Cc:MIME-Version:Content-Type:Date:Message-ID; b=iTRWriTsEl0zfI4IJorFpKNq31gAlaQWVhDDsRwsamW6gcXsgS26LbfIP6JJ++f6NI5lNbLzLuzShMWbJdU5TjXq2Wbrxzx7rX4yZkUAjscBG1YM4L/j+gODN9os1tijq0ywKiKQJH0aKAGdSt1UxAsLZUec7mME6cfui5WHvLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRcenJyf; arc=none smtp.client-ip=74.125.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRcenJyf"
Received: by mail-pz2-f20.google.com with SMTP id 41be03b00d2f7-cc1cebad4afso2379760a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790014569; x=1790619369; darn=vger.kernel.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :cc:to:subject:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ceJBvn0jVpw0gF/+O6f3OrNX6AQyTIdHbztQy6tYQ0c=;
        b=hRcenJyfl6YL7GXJLB6zn/9mI0QTlyKd4FdA7Wnyibu6RiTDeS1isKWA74u07k8/wg
         +30POYVV2PLOmGWfa2yS1AxNCG9nbHMfZkjA5tlkkTir8oNDHvOG6fjcC/ZfkMcro3Jh
         DcMpbLDOf6gOONDU8pOBSM3yaT9PsU4fhQ+i3dT35QSFORSJfUhjCV4aEhmVXN8goY0e
         hFwNZ7kdOzwT6KrbcGaSnl7GWAr6swFYn0va9luf5BCajvP/8/oy93RswQqAF0DZ+u9J
         LuwWDnsn5KtJeg84WWstLG31RFHCCIfVyvA0rJBwD8U+jKYfznPE+RrTLyQ1nGEyJA83
         VP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014569; x=1790619369;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :cc:to:subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ceJBvn0jVpw0gF/+O6f3OrNX6AQyTIdHbztQy6tYQ0c=;
        b=LeRlrEjC7TUNDPEe4Y0bt3oDJkgMezU+DCi3HN1L+IF9Isx07Qr3OgLgYIKJUVYpTf
         vSb8gL2WqzItyN/Y4j4QLVLvCArF2gRqeSz2eFYPfKcnpGNssyPk2C647X2ox7ROrGGM
         CJMeMVN+o88+ab0OE0ESFgA3qmBki1Ju6+PrPha20TUb+YyCBYIaeyF5c/Mhpnr36T3Y
         bGkkRKb4h414xh+jBecfDbypKq2zvpqyohga2Zby2NV+BmZEcO1NK8JRb5xkfD0ObHcZ
         KDZmIRGFPYv+qY1snvNNdYoA2Abpu94zIuP3O2Y7xyjVlLeXOYLojUcNA3ghGYB+cUSS
         4hNw==
X-Forwarded-Encrypted: i=1; AKwUvBxvf3mWPOjmrTYh3l3M/7wEuG2adEPaimpK1aenKXeHb1GP1bH468kZTKifVRUZEQ3dDKg0GUjpBFk3hd4=@vger.kernel.org
X-Gm-Message-State: AFuF++l7h5XenA9NIWu3dRXPbX5vpRJZos5IUhwwsbH2idWrZTuboTL1
	ZDuMQRZY3UlHeBzBebPZYgtpuz7l0UVEYoScXa3iQEApef02wfGeM+vv0UMhazzW
X-Gm-Gg: AYBFou39Ny4xxp/DMJ135+r2ZKdGL8iGmaSBCcUXzjCCRK0msbIw0hgock8SW1YGV+a
	EZKeDFfY7s4JcLfO9mDOsDJw93u+XzV2qAy4YZFPaK6HoJoWKkS2E5AtouEI2kmsK8x/4RKcD9p
	On3r8TMttcn1LEjpQhPtX7z+DggaKZeDjxrUQNiwZhfO7Z+gUICUqik8RTzdu/npP5QUo8afF8E
	u9hEcdAYDRVv3/cmRJnjwao+uGIPAP2U2kJl4XexvlxxJ7CCHCuNQbxxoxqGrY3Gx5kHyhFN12g
	X7tvujqN82ssEDlJIr09OOL7p86y32RkLD1aEmMid4GNBse1DHOYQf1iIyS1+nywpwVw9zkJbIZ
	51jVpSB667AWvi9B4dKqxf+in6eFl+Wpu8ROsSxXuRgFJuCaVC46SwRe2SfeVfVlB9iPfH50B5E
	13QscaDZZAiznB/mvG5nokxMRY2bfh1UmodWQoI1g529KdMUKpWnVCms98UOQZv0GCJStNHBBHo
	Obfa9frBBxy3iF0anqBUAw=
X-Received: by 2002:a05:6a21:3943:b0:3d0:8abe:9e08 with SMTP id adf61e73a8af0-3dd8c3f2338mr18188576637.3.1790014568927;
        Mon, 21 Sep 2026 11:16:08 -0700 (PDT)
Received: from SANGHOON. ([1.220.132.212])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae8eae3sm3902549a12.14.2026.09.21.11.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:16:08 -0700 (PDT)
From: Sang-Hoon Choi <csh0052@gmail.com>
Subject: [PATCH net] nfp: hold IPsec RX state under the XArray lock
To: netdev@vger.kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
    Andrew Lunn <andrew+netdev@lunn.ch>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
    oss-drivers@corigine.com, linux-kernel@vger.kernel.org,
    Changyul Lee <lcy8047@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Date: Tue, 22 Sep 2026 03:15:59 +0900
Message-ID: <179001455912.44752.17153022439349797877.idr-bug-92@gmail.com>


nfp_net_ipsec_rx() drops the XArray lock before taking a reference to the
xfrm_state it found. The delete path can erase the entry and drop the last
state reference in that interval. RX can then try to increment a zero
refcount after the state has been queued for destruction.

The driver queues firmware invalidation asynchronously; the delete path
does not wait for the command to complete or drain pending RX processing.

The XFRM garbage collector waits for an RCU grace period before freeing
the state. That delays reclamation but does not make acquiring a reference
from zero valid.

Take the xfrm_state reference before releasing the XArray lock so
xa_erase() cannot run between lookup and reference acquisition.

Fixes: 57f273adbcd4 ("nfp: add framework to support ipsec offloading")
Reported-by: Changyul Lee <lcy8047@gmail.com>
Assisted-by: LLM
Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>
---
Found during source review at mainline
5dd1818b15d98d4a20806cd00b1b40320b06004f. The affected source is unchanged
at 93f51579e7df248780214094418f205253383cc5.

The modified ipsec.o compiled in an x86 allmodconfig build. I have not
tested this with NFP IPsec offload hardware or reproduced the race with a
sanitizer. In particular, firmware invalidation and pending RX processing
have not been exercised together on hardware.

 drivers/net/ethernet/netronome/nfp/crypto/ipsec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/netronome/nfp/crypto/ipsec.c b/drivers/net/ethernet/netronome/nfp/crypto/ipsec.c
index 9e7c285ea..960d7513a 100644
--- a/drivers/net/ethernet/netronome/nfp/crypto/ipsec.c
+++ b/drivers/net/ethernet/netronome/nfp/crypto/ipsec.c
@@ -625,11 +625,12 @@ int nfp_net_ipsec_rx(struct nfp_meta_parsed *meta, struct sk_buff *skb)
 
 	xa_lock(&nn->xa_ipsec);
 	x = xa_load(&nn->xa_ipsec, saidx);
+	if (x)
+		xfrm_state_hold(x);
 	xa_unlock(&nn->xa_ipsec);
 	if (!x)
 		return -EINVAL;
 
-	xfrm_state_hold(x);
 	sp->xvec[sp->len++] = x;
 	sp->olen++;
 	xo = xfrm_offload(skb);
