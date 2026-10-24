Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792846585;
	b=1efi8BpeECLHRYZMoYmuSthN8at5E0FiFN6YG0lljKgKI1tusKv4FKZEEddPYW77o1Q7
	 jYE30dKz3BG8YEMC3SHhEFR6nTBn/YbzxwEooobj1PyJtkMJvaf+AiXqRKxI0eM7vD0c6
	 UlIMZrxZ3xtb1WQUB1r/1o8EYFIiVAEgwHuH5syT6yUxXLLRt7j4aHzHTBo+/EN90q0w3
	 PSUm9NDsRyzarTjyi5uaZfpeKdMq68T8setv7WOYsMMqPupzHV3xyBj+mLj/L2wrM0ju0
	 hM4TkgyvYf97GWyxidMMOOmUArj2ziH+a6va0Poo5yc2R2+JugJuO3/iz0dvwoX/prQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792846585;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer:X-Mutt-Fcc;
	bh=FAwVFsHA3boYKoM4iIUg3Eb+bwbA1VvDycreO8U2nGo=;
	b=GngllAeSxf+MFBOiM6PkJCyqnDfDHhU9eBHs3L/2cIHdKZ/3YGYpBfAtDjhh/GqaJEWB
	 NLmYiKCvrpaGNUzzH1a1Jl9Asqwk8rTwVuI1wN/w6r48sEVgBxrMdKYcafMK1hIiu3SAi
	 CLuFP6JTJ7xGk9CH5WQDRPnDMdVn59ewZ1SsOs1EKwFTkO+RxGt/E2nDtPtOYHCrkrnyx
	 Zijp7m9nKa9cDNjy6CvDYWRdXfZi84pz4YCVMCijsqDydn0MLP6z7mx529LVafbZC+0MD
	 TE4iMN0WdwQb/iEGVSwX8kurzuRqP+J9WBDLtODh42ULEZUrTp/wCmN1Y96krRZnY7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dzLAvR+r;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HFEIYrjm;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3781606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3781606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dzLAvR+r;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HFEIYrjm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792846583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=FAwVFsHA3boYKoM4iIUg3Eb+bwbA1VvDycreO8U2nGo=;
	b=dzLAvR+rlhfovf16i7jIbcdZNgiQ/M9/dVKl8qxWSRPSvvzH7lc1Br9xBgJDySbvb0mrVW
	A3vjN9em/gB7DhhaMpCc0LyjxEy7/gcUxcAbZYwHwSgTkHpd60oWfZB0VgfbqDl46aCQQp
	FPqftVXva4fyFGoh9FPEYSwg/nC4SUs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-klVi2Ti4N-KzKVeeueXIEw-1; Sat, 24 Oct 2026 08:56:22 -0400
X-MC-Unique: klVi2Ti4N-KzKVeeueXIEw-1
X-Mimecast-MFC-AGG-ID: klVi2Ti4N-KzKVeeueXIEw_1792846581
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a20a40d3e9so8849185e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792846581; x=1793451381; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAwVFsHA3boYKoM4iIUg3Eb+bwbA1VvDycreO8U2nGo=;
        b=HFEIYrjmAoypit5pRSqL7CjRmZkloNqhYQ0EHM90TilFC73jLOybSsbwLgrsv9CZtS
         9YXqn9LdbRfrjHuefJkp/772TV6EPe260zQX+4MQdda9t8UZKqLoFwwM8OAsSillxqyn
         1DL6+R7k9ZPQ3jr2Da7qYekXuyUi8nZpvLZXLirNfZiN39okLmU10Q0mPEJPOKi7+dsb
         cUME99I7flNcRUhrnanZb8Kl57uyr2/upLkzwjp2ST3OEE0NLrPazN4rQkgKa7AQjeqB
         L3EUg0plhCksxNp+hQidyfdoKi+xW9njoTEi8GjiZ8kiZQbAIktGeSQV3L8Bz4flOHTw
         OCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792846581; x=1793451381;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FAwVFsHA3boYKoM4iIUg3Eb+bwbA1VvDycreO8U2nGo=;
        b=wOc/sW7E38QwFahRIViReIWqT1jd1Wy7EZAPbcB41Lr+48gHqUYgjW8qHBc92/zP4d
         qVxll6P/foEAFeAdTT0DuLrc1WQOPMjW1FYkkeIlYC2p8xAbByJC5UhzyUnQa8KW7WI5
         2fN265Utv+OZlwz4/3ok8uCxGcV7MnBTRcTKYFaBNvN3FZFqWtqN4ODbhS3Kbpegxn0s
         v9t8wSrtpYIQ02DBtk4FBtgiO+ifCmUJVvaZGObCQFmTWbyBzFeJSvU7/6idHtxYHLYb
         X6EXQAwaCvTQzoOq8UaayDFpt6q2kJfK6icRJtt7aEM1/tRVxBE+oms0/A8OFJLQX2lk
         qJwg==
X-Gm-Message-State: AFq9FYLT4qfGPGJqRlE15WGpYKMAYNTmhePXYPAnWl/hpp01bd+JPX75
	IUtZfqbM8gQuDm6IYlz5dovdP9IS3GJtpZ0Zfdtiq9MKAIxIfcYW31sfwD6zSqZL/Taz5DPAr9D
	50E9jlWhjwL+AWoQJ0aVJvb7nIKZiwwpILfVC0z7Efr/NmIOzPXOsjrM3jKD+9QV0iyyGeQpp5k
	VA+pGk3a322uXQHVNmF7KaKMq4pewtoSVMbL6lFdDQeOw=
X-Gm-Gg: AYBFou0bzZGwyU6/FbNnfvGSF5pMc0ECMpIJs4n9+EB64IBHa6g+BVLqM7chCoN6Xr1
	ER78LUVH8p4CQBy9Bx6u1AIFGB4ixnFwjHhqxU6pwjYNTktx7lFcZq5k2OFY25ih57wn0wyl8zx
	QDSYPaAUe8cvQwrqvMhTwNEFcu66m+M2qp/vw16PJwvdNZjOxMCUOq8jdD2QLZtWzrQ/jcTj10y
	uoQveBbea8Xovm13ETa6rK6Ey5hymNzAJ8X/fN0K0Thg0d+GiuY3J9C4AzeBBDxo/Dn8IGMu3j2
	ixl5DEfzRw+VxZBKgfmtmbduDDOtzEh7Iowui/rUkj4W0IahqQ6NTpEwZTcpgBTp3t0qMdU=
X-Received: by 2002:a05:600c:3f14:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4a35ac8ec61mr28499035e9.15.1792846580958;
        Sat, 24 Oct 2026 05:56:20 -0700 (PDT)
X-Received: by 2002:a05:600c:3f14:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4a35ac8ec61mr28498605e9.15.1792846580338;
        Sat, 24 Oct 2026 05:56:20 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5697a7sm49765185e9.7.2026.10.24.05.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:56:19 -0700 (PDT)
Date: Sat, 24 Oct 2026 08:56:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Eric Dumazet <edumazet@google.com>, Claude Code <noreply@anthropic.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Subject: [PATCH net] skbuff: keep accesses through unset transport header in
 bounds
Message-ID: <0bdcbe2ab5ffc86ba7190fe25476bcebcb967310.1792844270.git.mst@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

Commit 2170a1f09148 ("net: no longer reset transport_header in
__netif_receive_skb_core()") stopped the receive path from pretending
that an unset transport header starts at the network header - but only
on CONFIG_DEBUG_NET=y builds, the idea being that fuzzers and CI could
catch stacks reading a transport header where none was ever established.
And the plan is to drop this for release as well.

Indeed, under KASAN, an access through the unset offset produces a
slab-out-of-bounds splat, which is how these bugs are usually found.
But a regular debug build has no such safety net: the accesses land at
skb->head + 0xffff, some 64K past the packet data.

I don't think release builds are exposed to oob in this way, but I want
to make the stack a bit more robust if yes.  While I appreciate a nice
KASAN splat as much as the next developer, making even a debug kernel do
oob accesses was never the point of the exercise.

Make skb_transport_header(), and its inner variant, verify and WARN,
then fall back to the network header position when the transport header
was not set. This way, accesses stay within the packet.

An extra benefit is that release and debug kernels now behave
identically if an unset transport header is ever reached,
avoids heisenbugs.

Fixes: 2170a1f09148 ("net: no longer reset transport_header in __netif_receive_skb_core()")
Cc: Eric Dumazet <edumazet@google.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Co-Authored-By: Claude Code <noreply@anthropic.com>
---
 include/linux/skbuff.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index a3ff380d43f0..cbfeb17d86f7 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -2993,6 +2993,12 @@ static inline void skb_reset_mac_len(struct sk_buff *skb)
 static inline unsigned char *skb_inner_transport_header(const struct sk_buff
 							*skb)
 {
+	if (unlikely(skb->inner_transport_header ==
+		     (typeof(skb->inner_transport_header))~0U)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return skb->head + skb->inner_network_header;
+	}
+
 	return skb->head + skb->inner_transport_header;
 }
 
@@ -3072,7 +3078,11 @@ static inline void skb_unset_transport_header(struct sk_buff *skb)
 
 static inline unsigned char *skb_transport_header(const struct sk_buff *skb)
 {
-	DEBUG_NET_WARN_ON_ONCE(!skb_transport_header_was_set(skb));
+	if (unlikely(!skb_transport_header_was_set(skb))) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return skb->head + skb->network_header;
+	}
+
 	return skb->head + skb->transport_header;
 }
 
-- 
MST

