Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.188.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271372;
	b=j8fM+CvPl+UfY5DQC+ZkzBi0EBNkqOEGPiJuwGokUAg5R0tBuNTAzh7zHxXdypzNTZEB
	 kvY4a23qVnQzM5g9nHbbsMX9JesrxTkEoELUQlvcKFQ9EcGOWz8jCoP+7cYBIpANCO8Be
	 eQFxF2dSlFZAuZS0OMm0vq1OB/SqN1x+N+iR3l82Ci9FNuB+guuKm1QBfhpF61sXiJuBx
	 w8pjBabuHAl93Z1DWfwTmCxdgzE+3G2TFCu1nGUZsPIWtfhQqbpA2UYxz8rpofGg3vEY1
	 dIL1DJC0U915ucqnzSsf3wE2I8XIVSE9UkhYYX3ruKdxPSbcf7Vn79ZSphM4xmhq/Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271372;
	h=DMARC-Filter:DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
	 Content-Type:Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Get-Message-Sender-Via:
	 X-Authenticated-Sender:X-Source:X-Source-Args:X-Source-Dir;
	bh=EXqNzBB5vpavjyBNQAV3mjvkLPwAjt6dir4BzaGhbIA=;
	b=v9XigITcnTVFeExpSxuGgi/0pOH45SO8uUE8bL/NFBmZZX/qMObL7Q5LM8qMOxbBnM20
	 zVSZTIGxEWQhN4WaprCvKzZ3jQY7ocmVs8diLGAIDJVgZhLDiNvCnb9enNSYy1ir2w09X
	 rqaUCpPqGv1IXTPmhX59eY2zYNKNTXv1oKtVRndlQA8olUZiqcZ+kvzbBO7Frc9K5vsnf
	 BIkpGTsxLwfKhbRtdf5nh9e302+c+yaJ76olx9X+ijblu8ntW7Drcyhx//VJNNxgxbaFb
	 2q23n3FgB2ul4i/W+H5ttyY7EuQWg8T4ieA8OU8pVF4TgsiDlDMQmc+j06UN7MSybyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cyber.gouv.fr;
	spf=pass smtp.mailfrom=oss.cyber.gouv.fr;
	dkim=pass header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.a=rsa-sha256 header.s=default header.b=bBSykGGu;
	arc=none smtp.remote-ip=51.159.188.251
Received: from oss.cyber.gouv.fr (oss.cyber.gouv.fr [51.159.188.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDB4606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABDB4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.a=rsa-sha256 header.s=default header.b=bBSykGGu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Reply-To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=EXqNzBB5vpavjyBNQAV3mjvkLPwAjt6dir4BzaGhbIA=; b=bBSykGGuUIhl+cO0nULg4GSnSz
	MpLSTSbKWFR3SmkvGa/YX11FWGBLyU1PfCurq9r3vZUtP85raWMojj9U/Uyspi6eMPmKykg3OGRYH
	sZr0felJYT27OP0/AUpBeIXyBdz0PA/iHWfOWbOXfsL6ZOi24U/7tkVLn5lchLBmUNatZUXyYlBrL
	qiiyz3b2RTvgfNJMnFr8NdjVo+EmXOE0Ow+DGBz0QSKIqXiW2ZhNbhHC3dxWm3z95vL8t84RuV6wi
	Dt1f0Fk6XgL5Ul0MMPnC8mLlsYbDsI42lWMETUgUNfKDTRURL13gsJIuvidBeowAXPQxbkIeDo3Mk
	BXqrb9+g==;
Received: from [::1] (port=39374 helo=pf-012.whm.fr-par.scw.cloud)
	by pf-012.whm.fr-par.scw.cloud with esmtpa (Exim 4.100.1)
	(envelope-from <jeremy.jean@oss.cyber.gouv.fr>)
	id 1xMNni-00000009KUn-08vp;
	Thu, 29 Oct 2026 11:56:04 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 11:56:03 +0100
From: =?UTF-8?Q?J=C3=A9r=C3=A9my_Jean?= <jeremy.jean@oss.cyber.gouv.fr>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov
 <lucho@ionkov.net>, Christian Schoenebeck <linux_oss@crudebyte.com>,
 v9fs@lists.linux.dev, linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] 9p: pin request under client lock in p9_tag_lookup
In-Reply-To: <auLejxGRgVLKlLuL@codewreck.org>
References: <20260930201357.590469-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <auLejxGRgVLKlLuL@codewreck.org>
User-Agent: Roundcube Webmail/1.6.20
Message-ID: <08dad2f67457cf97eedff42e57312bd2@oss.cyber.gouv.fr>
X-Sender: jeremy.jean@oss.cyber.gouv.fr
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: jeremy.jean@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: jeremy.jean@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On 2026-10-29 06:50, Dominique Martinet wrote:
> Jérémy Jean wrote on Wed, Sep 30, 2026 at 08:13:58PM +0000:
>> 9P clients keep separate request tables but share one request cache.
>> p9_tag_lookup() can race with the final p9_req_put() and pin a request
> 
> Ah.. Right, just checking the tag isn't enough, we also need to check
> the client... I'm not sure why I had assumed the caches were not 
> merged,
> they're only not merged with different types..
> 
> So technically we could add a reference or some kind of id for the
> client and check that, but given SLAB_TYPESAFE_BY_RCU is hard to grok I
> guess it's much simpler to just take the lock and be done with it...
> (in that case we can get rid of SLAB_TYPESAFE_BY_RCU altogether, the
> lock is enough guarantee that the memory is valid until we get the ref
> here)
> 
> It's far from a new bug so I'd rather not rush this just to go back to
> rcu a few weeks later, give me a bit of time to check how much impact
> taking the lock here adds so we can decide. There's enough leeway in 
> the
> p9_req_t struct that we can check the client for free if we care...
> 
> Meanwhile, if someone else has an opinon feel free to chip in

Hello Dominique,

Thanks for the reply, and I'm happy to discuss the best way to fix
the UAF.

I am not so familiar with that code base and I have a hard time
deciding the actual impact of the lock. As you said, it might be
possible to keep p9_tag_lookup() lockless by storing the owning
client in each request and then validating both the client and the
tag after successfully incrementing the refcount.

The two helpers refcount_inc_not_zero_acquire() and
refcount_set_release() should ensure that the client and tag checks
see the newly initialized request state after reuse. Then, the
mismatched reference could be dropped through req->client. This
should stop a stale lookup from mistaking a recycled request from
another client for the original one.

Below is a tentative patch that applies this strategy. I have
verified with my reproducer that it indeed fixed the UAF. What
do you think of it? Let me know if you'd want me to send a v2.

Best regards,
Jérémy

---

diff --git a/include/net/9p/client.h b/include/net/9p/client.h
index 55c6cb54bd254..a46187833cb8d 100644
--- a/include/net/9p/client.h
+++ b/include/net/9p/client.h
@@ -84,6 +84,7 @@ struct p9_req_t {
         int status;
         int t_err;
         refcount_t refcount;
+       struct p9_client *client;
         wait_queue_head_t wq;
         struct p9_fcall tc;
         struct p9_fcall rc;
@@ -333,7 +334,7 @@ static inline void p9_req_get(struct p9_req_t *r)

  static inline int p9_req_try_get(struct p9_req_t *r)
  {
-       return refcount_inc_not_zero(&r->refcount);
+       return refcount_inc_not_zero_acquire(&r->refcount);
  }

  int p9_req_put(struct p9_client *c, struct p9_req_t *r);
diff --git a/net/9p/client.c b/net/9p/client.c
index ef64546c6d52a..31e4bfa4901e3 100644
--- a/net/9p/client.c
+++ b/net/9p/client.c
@@ -181,9 +181,10 @@ p9_tag_alloc(struct p9_client *c, int8_t type, uint 
t_size, uint r_size,
         p9pdu_reset(&req->rc);
         req->t_err = 0;
         req->status = REQ_STATUS_ALLOC;
+       req->client = c;
         /* refcount needs to be set to 0 before inserting into the idr
          * so p9_tag_lookup does not accept a request that is not fully
-        * initialized. refcount_set to 2 below will mark request ready.
+        * initialized. refcount_set_release to 2 below will mark 
request ready.
          */
         refcount_set(&req->refcount, 0);
         init_waitqueue_head(&req->wq);
@@ -212,7 +213,7 @@ p9_tag_alloc(struct p9_client *c, int8_t type, uint 
t_size, uint r_size,
          * callback), so p9_client_cb eats the second ref there
          * as the pointer is duplicated directly by virtqueue_add_sgs()
          */
-       refcount_set(&req->refcount, 2);
+       refcount_set_release(&req->refcount, 2);

         return req;

@@ -243,12 +244,12 @@ struct p9_req_t *p9_tag_lookup(struct p9_client 
*c, u16 tag)
                 /* We have to be careful with the req found under 
rcu_read_lock
                  * Thanks to SLAB_TYPESAFE_BY_RCU we can safely try to 
get the
                  * ref again without corrupting other data, then check 
again
-                * that the tag matches once we have the ref
+                * that the client and tag match once we have the ref
                  */
                 if (!p9_req_try_get(req))
                         goto again;
-               if (req->tc.tag != tag) {
-                       p9_req_put(c, req);
+               if (req->client != c || req->tc.tag != tag) {
+                       p9_req_put(req->client, req);
                         goto again;
                 }
         }
