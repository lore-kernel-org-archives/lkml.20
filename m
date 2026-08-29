Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F65136F911
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 13:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788009720; cv=none; b=Z2uEkTmIEx4rAGriu+x3oo0IQ0U25B1cKlQ4F+JuCJU+SqXktCReKT06/4Ym9nXIGp0e3rx6meaakZ9eSX6ibIuSj9CKYVPJloqWcYK/Ltsxdf1q9f7hkroVeimCPw6VOJFzDd2zmqkQM5dKIBpEn3/OJSNTSZxyMUJemXm0Rgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788009720; c=relaxed/simple;
	bh=NS4/QUjL68zLUBCHeKxZrahJl6PjtvFpClsfvHXpPzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o0+3U6Ht2LApLNuNAM9rwllbEurPjVpMKELafvOZOVjnyBrm9eUe4jd4VRdFoney8dRGsPH8HXxftSAj8DnOn4ProjmggpU0D51uOkl/EHLiKIDqFcgCmcAH1tUizi4mECvPIjYS7C/upSRIeSWernmdnbRRUSSwaptPyBlNJ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TG53lVJe; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TG53lVJe"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-853c947bfefso1590655b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788009718; x=1788614518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2mC5OZsOJnLy47+jnfxfhBCcVVpyNHiIDytrP83Hm1I=;
        b=TG53lVJe8y6n2kgi7le5W+RA0Ydv7Eb6n+0691wnBCAWQkH6MU/rDKw9OCHp5HvxLj
         Kg5JMWYCgi+Wj6EYZxIetiCuau/OVCSEyuYmABmkAO1Ehf9OVrCvUC39JNA8IL3Aiwgt
         QzD1ACQ37KUO+OVF4i+qOdWnnylL8YVoszc81Mo60NF0dzvcLq0Sp7A+0Jabs6rUOuM/
         NpVRNwVwRsrX+nYWmGhEVSOK8VdFqr3WSUcBODKfik/vCY0LC+i0fFfshqaoQCxIvJ+n
         198EaQTor6kC7RpkV63hYhodsuen37ls1ItYTH0qFSbMxJLrklpdBGu++h8ZyvQKWrNs
         +qVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788009718; x=1788614518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2mC5OZsOJnLy47+jnfxfhBCcVVpyNHiIDytrP83Hm1I=;
        b=qJcYwnJDILUvCMxD6UM1QVDxw0ffMjlkcJ1pwhvANrnZgnM8RsNDYbM4oDhipTyqVK
         jcbpNXzbBs4e7pcDVfw8y2VcCU0Ryxxh8454xZJxJpPN6wpVKjc0ytPCxazly66+OHHU
         yZdGW5PsIj3Y+gIxCH8vwxK7FXZNKnrZrZdpg42XSaUhlx752WLlLlKMy+im4seqiMwY
         XPhIhkb8D9bsZtnZ1sPjJvK++noRbE64RHtwfOmVqA4JNTzUfdUI1cbUdXX7JGo0JdkD
         EjC/qzC4j6KUVZA/zR/XYmC16oZQIQnC/3QAu8nrxkrKbH1+PetdBFg4DzvthkD6qo4p
         /HCg==
X-Forwarded-Encrypted: i=1; AHgh+RotuhcHf7ljet2URaGn5PkyLzYDdV0Qo7xmVcLEGyvfaMqWjBOUEp/9ByfwbMNR2Yqz+2Qrh7JBvlUcQ8k=@vger.kernel.org
X-Gm-Message-State: AFuF++klx7MUIWSk7Vz708IFAp/NpzFaC4pb39yF2znpCl14O/fuE2I8
	jtDAxoEqFm2bgtV2Yw9Ossw6uVbh5heQ92/hdN4lCAC8hycZX7+dD9bg
X-Gm-Gg: AR+sD13TQqRgO6T9U0W80W7TrO+I/yUV5hJPg8Drv/WEdpvdhSaeUWgqW+O/4FJbFUv
	aD4Se4SQe1QNGzA7p9XdN0p6NifZtKf22Wal98X8gMubXGYwpXNhfWqyhOLdnw/BxdKI8pkZyu+
	0Cy/y76hmDOGCVpMlELvyuH5gP1fhmi+9x8ykkgv3293eorJzsX6P4eKYKByELfnuEIcVYmsL2a
	P3tdgt6GALhZ2RZHCZLZRv97JY+rn+VNO9mEzCLL0YKaigPtePPkYxnaHEJIAg5cSWgWapeHgFX
	aRv3AN9DATwqqaoQwIaMv2Vd1U/YJPyesKSHdLDZJ463wtRcJ50rLFXfaoHAdz7TouWD2AIJvRU
	S/tm6bwl630zxRlJinFyYX2HxjOiqyGG1LYmCyyHP2ff/3FdsU6XJyr4YXsP55C5MoRxr03oNH0
	d+QAcqNyizP0beJLXk6NdYEktRje7YYgYFrrI4K2QEposJLzKAuusuxK0xmcoll0eLb+OmrtowP
	w==
X-Received: by 2002:a05:6a00:1a0b:b0:857:73c3:4469 with SMTP id d2e1a72fcca58-85773c34923mr5441146b3a.24.1788009718156;
        Sat, 29 Aug 2026 06:21:58 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569f59a54bsm1537407b3a.6.2026.08.29.06.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 06:21:57 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Vladislav Yasevich <vyasevic@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] udp: revalidate socket family before publishing an IPv6 cork
Date: Sat, 29 Aug 2026 22:21:20 +0900
Message-ID: <20260829132125.1160893-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

udpv6_sendmsg() prepares the IPv6 flow and route before taking the socket
lock when a datagram is corked.  IPV6_ADDRFORM takes the same lock, but it
can convert the socket to AF_INET while the send path is doing that
lockless preparation because no cork has been published yet.

If the conversion wins the race, udpv6_sendmsg() later publishes an
AF_INET6 cork on an AF_INET socket.  Uncorking through the IPv4 socket
operations then interprets the IPv6 cork as IPv4 state.  The IPv4
finalizer writes a 20-byte IPv4 header into the 40-byte IPv6 header
reservation while the retained IPv6 dst routes the skb through
ip6_output().  ip6_finish_output2() consequently consumes the unwritten
20-byte tail.

An unprivileged reproducer triggered the mixed state on 12 of 10,000
sockets.  KMSAN reported an uninitialized-value read in
ip6_finish_output2() on three fresh boots, with the allocation origin in
__alloc_skb() through __ip6_append_data().  The same process recovered the
20-byte region from the TX timestamp error queue; one of three fresh boots
contained recognizable stale heap data.

The route prepared by the racing send is not published in the socket dst
cache.  An implicit send on the IPv4-mapped peer required by ADDRFORM
delegates to udp_sendmsg() before the IPv6 lookup.  An explicit native IPv6
destination reaches the lookup, but leaves connected false and therefore
cannot call ip6_sk_dst_store_flow().  Conversely, a native connected send
can publish an IPv6 dst, but ADDRFORM rejects that peer with EADDRNOTAVAIL.
The same reasoning covers the non-corking explicit send path.

After taking the lock, revalidate that IPV6_ADDRFORM has not changed the
socket family before publishing the cork.  The existing error path releases
the invocation's prepared dst, flowlabel, and transmit-option references;
there is no socket dst cache entry from this send to reset.  With this
change, the serialized controls retain their existing results and the
forbidden mixed state occurred zero times across 20,000 sockets.

Fixes: 03485f2adcde ("udpv6: Add lockless sendmsg() support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
Changes in v2:
- Add the requested individual maintainer Cc recipients.
- Explain why the corked and non-corked explicit IPv6 sends do not publish
  an IPv6 socket dst cache, and why sk_dst_reset() is not needed here.
- Note that the separately raised UDP sockmap proto mismatch was reproduced
  and will be handled independently.
- No code changes.
---
 net/ipv6/udp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index fd875908ac0c66..566c634a5a5945 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -1716,6 +1716,11 @@ int udpv6_sendmsg(struct sock *sk, struct msghdr *msg, size_t len)
 	}
 
 	lock_sock(sk);
+	if (unlikely(sk->sk_family != AF_INET6)) {
+		release_sock(sk);
+		err = -EAFNOSUPPORT;
+		goto out;
+	}
 	if (unlikely(up->pending)) {
 		/* The socket is already corked while preparing it. */
 		/* ... which is an evident application bug. --ANK */

base-commit: 2188569e7e1b0bc3f3b557dc97ab7a02befc11c8
-- 
2.54.0
