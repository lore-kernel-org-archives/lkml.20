Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C05542EE8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081238; cv=none; b=pOG6KaQWTX3xtTBcQ6Hq8Pi37exCQALtT2/lyzRmBSktL01tShZxS6/ZZIBzlYUDUV1sBC00DpCFC4jTbm1hXNe05QOpuJnZxhnZeguWWCEgszav//5O899jPutm/h4qK4iqHgVMX2mzStE7LbhgmmT3OOGop0ouTngK2Fdu8uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081238; c=relaxed/simple;
	bh=jbQUTCe0ICwWOioxGPSxPQ50mAT7yEYTFcxWXz3Ogj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCDy0N1uVYANNB33yPZXY8u/2IynycptIovdhNjXOCtV1uB9JE+FLOx1Ep29m2GKtYRHNDm1IPkqEdaJdNneeH1aP6tAlAqdejElc3IS/FRcNHMWHLztrgx5D/AjV3fwOFNuj9fT3MEXSkapeYgNfEwyQSTS1Ahx1cAvu1LJ/yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G1zuI4YW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WiNXb+ES; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G1zuI4YW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WiNXb+ES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790081234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cr6ub0HQ36E9YAIRyboF6gdXSYsRFPX75mape4tZPCw=;
	b=G1zuI4YWw6mbOIMfoky61H1svKlnni6e4/1Gq3JeNu/QrxM5tjwnG3OrcxRulgIURt4fLv
	/7vrtJ/xebvHnBDzVfqI6E+p52QJgn7fo6Ryt3XtUZtXira4RFlVj1kcWTcL8WR2csMJQF
	SLv0metlTnU9h/WM8joVruQU5n6h7zg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-sRj9fMY1NiKR2imNba28JA-1; Tue, 22 Sep 2026 08:47:13 -0400
X-MC-Unique: sRj9fMY1NiKR2imNba28JA-1
X-Mimecast-MFC-AGG-ID: sRj9fMY1NiKR2imNba28JA_1790081232
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e6862e924so30154675e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790081232; x=1790686032; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cr6ub0HQ36E9YAIRyboF6gdXSYsRFPX75mape4tZPCw=;
        b=WiNXb+ESh7LBvwsIza680rzB+zFHa7gc/0cTuukeQdYt0ABzTXxxzisRaGYDatYxiU
         fPeIlX28/SebenXoUk//nQE1Dhg+SJRcCDtmQI58bUctsHWJl7Jromx75nBxW2speHi/
         OHR8BF3f05PgU2GuuSIyIxTKm1MTMPkrmaQ9bPXrq2gXeZQSJyROvd5YB6+kSZZAKjnB
         lvLxGuSmBThCFuzg3BuhnLrdeUe7dosrFeGz5wq07en2aLY1SfzuNFAnNtjc1nyydQ5h
         82IPGJJBh0LRu3JSGX/8A6W2tIgzz2Ivq/2d8b9kajphQ7okyjN/s/VepIF1n/71nuZv
         1B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081232; x=1790686032;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cr6ub0HQ36E9YAIRyboF6gdXSYsRFPX75mape4tZPCw=;
        b=D/O8/PyNihxzYNOtzeqaxY8JUp6gRT9riG6xfel9ktLvtO93HmxSV5quE8DtdA0BDx
         cQyDwVVSszakSSXnJmgkFtkSZTPPzo2Y4X9jQR1LgLHGUk8vaS4t3CKqWg0YrGpnzDRx
         9LmX6YHfQp3M1xgq0Bo9AeFeIkOPUoNyG/lOM8v8EqWlMkGvJ+9NEZCTLzaiaKgrIlBq
         /dHVE/WXNEWKKFBMEysceBFQSxa+YvgIXe/hMeOvQTAGfrnFFjx1hMNsqrMs7Lia0PLx
         YinS/v5kazKuhRa+hNFl85ddmAYbKGxRWPC85eI5mAXl3twrkeAMAif3KUju0HVocbX8
         X5cA==
X-Forwarded-Encrypted: i=1; AKwUvBwg6/eILt4cVPmbs1nT7RSm8ujQ/EkbrazQGLBr5oBHzTI5qZCO9kyoYY5ogt61J6WufhgcqQNnkMgjimA=@vger.kernel.org
X-Gm-Message-State: AFuF++mdSHd+8MjhOjGH/aR6NI80QIfG/cAmU07a6MSON6f94twN9xyX
	idonqkuM6WTl4DcxhsSKH66VUvX2YRgaB+xE8PPbUnn55jDQy4Lx5qxlejZDHWEthuxseO8L5ve
	8ijgQbJS54em/nPgmlg9GjccDS6soWR1BhD3vtGDcyrmofhsO9ar3mWBJvSH/HvKUDw==
X-Gm-Gg: AYBFou37qgL/S0tZjKJg85uYAuIrkowdGGarl+oAm/HEFDrFwpWblEmHd3z9noXIesj
	BXba2hNYl2ws65kha8Vftf0JJQ/pzTHPBYoftmcKKpKal+KuEvHeRoGQj7Sq6y9HXqsyK7RmvVI
	ifpEEJR76SniIN7cQLucYCivPFCvypmByEgeo/v1QHQKhlJCwGssda2rdfjJGPTMNW7kEDpXksF
	dMlLNgkrtJXw4a8GRXwEwXxZ0Ri02VazQO9CRD7fSZIMFae8SAP6hjOKKOfRGmLRTQTSyzzmB/q
	pcN/G0o0L4GfdO8A8JXAkPmPHHSA8V3BPg4YBCQuc2fSnJm33I1LrO3N8wETDTY3F6V1GfjwmOQ
	OF+aP6wUgtTMLjZGRGTc4tJrDyWn8bej9zZat1s+Aq9CCRckUoNI=
X-Received: by 2002:a05:600c:4e0a:b0:49d:29ab:540b with SMTP id 5b1f17b1804b1-49fc5723f3cmr203501335e9.15.1790081231741;
        Tue, 22 Sep 2026 05:47:11 -0700 (PDT)
X-Received: by 2002:a05:600c:4e0a:b0:49d:29ab:540b with SMTP id 5b1f17b1804b1-49fc5723f3cmr203500975e9.15.1790081231215;
        Tue, 22 Sep 2026 05:47:11 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-131.retail.telecomitalia.it. [82.53.134.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fda8f3402sm37398835e9.0.2026.09.22.05.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:47:10 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:47:01 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: =?utf-8?Q?Bart=C5=82omiej?= Dmitruk <bartlomiej.dmitruk@isec.pl>
Cc: Bryan Tan <bryan-bt.tan@broadcom.com>, 
	Vishnu Dasa <vishnu.dasa@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S . Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] vsock/vmci: make the cached_peer dgram decision
 race-safe
Message-ID: <arJ3bKG7vRjMI5Bo@sgarzare-redhat>
References: <20260919123208.29032-1-bartlomiej.dmitruk@isec.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260919123208.29032-1-bartlomiej.dmitruk@isec.pl>

On Sat, Sep 19, 2026 at 02:31:56PM +0200, Bartłomiej Dmitruk wrote:
>vmci_transport_allow_dgram() cached its result in vsock->cached_peer and
>vsock->cached_peer_allow_dgram with an unsynchronized check-then-set. The
>function runs both in the lockless receive tasklet
>(vmci_transport_recv_dgram_cb(), no socket lock) and in the lock_sock() send
>path; lock_sock() does not exclude bottom halves, so the two contexts race on
>those fields and can return a stale 'allow' for a VMCI_PRIVILEGE_FLAG_RESTRICTED
>peer. It is also a plain data race. The in-code comment claiming the fields
>are never modified outside create/destruct is contradicted by the send path.
>
>Keep the O(1) cache -- it avoids an O(N) vmci_ctx_get() lookup on every
>datagram in the bottom-half receive path -- but pack the peer CID and the
>decision into a single word accessed with READ_ONCE()/WRITE_ONCE(). A race
>then only forces a recompute and can never return a stale allow.

I honestly don't understand this part...

>
>This was found by code inspection; I do not have VMCI hardware to test on
>(compile-tested only).
>
>Fixes: d021c344051a ("VSOCK: Introduce VM Sockets")
>Signed-off-by: Bartłomiej Dmitruk <bartlomiej.dmitruk@isec.pl>
>Assisted-by: Claude (Anthropic)
>---
>v2: keep an O(1) cache made race-safe rather than dropping it entirely; an
>    earlier revision removed the cache, which the Sashiko AI review flagged as
>    an O(N)-per-datagram fast-path regression. Split out per Stefano
>    Garzarella; independent of namespace support.
>v1: https://lore.kernel.org/netdev/20260917220225.56200-1-bartlomiej.dmitruk@isec.pl/
>
>diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
>index 5549298c1..97968ac53 100644
>--- a/include/net/af_vsock.h
>+++ b/include/net/af_vsock.h
>@@ -39,10 +39,13 @@ struct vsock_sock {
> 	 * modified outsided of socket create or destruct.
> 	 */
> 	bool trusted;
>-	bool cached_peer_allow_dgram;	/* Dgram communication allowed to
>-					 * cached peer?
>-					 */
>-	u32 cached_peer;  /* Context ID of last dgram destination check. */
>+	/* Cached dgram access decision for the last peer, packed as
>+	 * (cid << 32) | VALID | ALLOW and accessed via READ_ONCE()/
>+	 * WRITE_ONCE() so the lockless receive tasklet and the
>+	 * lock_sock() send path cannot race to a stale decision.
>+	 * See vmci_transport_allow_dgram().
>+	 */
>+	u64 cached_peer_access;
> 	const struct cred *owner;
> 	/* Rest are SOCK_STREAM only. */
> 	long connect_timeout;
>diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
>--- a/net/vmw_vsock/vmci_transport.c
>+++ b/net/vmw_vsock/vmci_transport.c
>@@ -524,23 +524,38 @@
>  * only if it is trusted as described in vmci_transport_is_trusted.
>  */
>
>+/* Packing for vsk->cached_peer_access. */
>+#define VMCI_DGRAM_ACCESS_VALID		BIT_ULL(0)
>+#define VMCI_DGRAM_ACCESS_ALLOW		BIT_ULL(1)
>+#define VMCI_DGRAM_ACCESS_CID_SHIFT	32
>+
> static bool vmci_transport_allow_dgram(struct vsock_sock *vsock, u32 peer_cid)
> {
>+	u64 access;
>+
> 	if (VMADDR_CID_HYPERVISOR == peer_cid)
> 		return true;
>
>-	if (vsock->cached_peer != peer_cid) {
>-		vsock->cached_peer = peer_cid;
>-		if (!vmci_transport_is_trusted(vsock, peer_cid) &&
>-		    (vmci_context_get_priv_flags(peer_cid) &
>-		     VMCI_PRIVILEGE_FLAG_RESTRICTED)) {
>-			vsock->cached_peer_allow_dgram = false;
>-		} else {
>-			vsock->cached_peer_allow_dgram = true;
>-		}
>-	}
>+	/* Cache the trusted/restricted decision for the last peer to avoid the
>+	 * O(N) vmci_ctx_get() lookup on every datagram.  Read/update it through
>+	 * a single word so a race between the lockless receive tasklet and the
>+	 * lock_sock() send path only forces a recompute -- it can never 
>return a

Is this a real issue?

We have this in the code:

	 * NOTE: We access the socket struct without holding the lock here.
	 * This is ok because the field we are interested is never modified
	 * outside of the create and destruct socket functions.
	 */
	vsk = vsock_sk(sk);
	if (!vmci_transport_allow_dgram(vsk, dg->src.context))
		return VMCI_ERROR_NO_ACCESS;


>+	 * stale allow for a restricted peer.
>+	 */
>+	access = READ_ONCE(vsock->cached_peer_access);

How this will work on 32-bit systems?

Stefano

>+	if ((access & VMCI_DGRAM_ACCESS_VALID) &&
>+	    (u32)(access >> VMCI_DGRAM_ACCESS_CID_SHIFT) == peer_cid)
>+		return !!(access & VMCI_DGRAM_ACCESS_ALLOW);
>
>-	return vsock->cached_peer_allow_dgram;
>+	access = VMCI_DGRAM_ACCESS_VALID |
>+		 ((u64)peer_cid << VMCI_DGRAM_ACCESS_CID_SHIFT);
>+	if (vmci_transport_is_trusted(vsock, peer_cid) ||
>+	    !(vmci_context_get_priv_flags(peer_cid) &
>+	      VMCI_PRIVILEGE_FLAG_RESTRICTED))
>+		access |= VMCI_DGRAM_ACCESS_ALLOW;
>+
>+	WRITE_ONCE(vsock->cached_peer_access, access);
>+	return !!(access & VMCI_DGRAM_ACCESS_ALLOW);
> }
>
> static int
>

