Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94A1493D4F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411390; cv=none; b=Y7Vxc12mRH4lnDgcOvjBiUC9c1QqqzRpEvA7m9VoipKcjodZMXMZ3jAHhOPjDhzYWN2OBSAe/KkAx1JsH+TgXTIeBRMdJ8vcg6VUrFB6EHZICFg2UbbjiTUnsqbt/MrUZmDssNdcy6YuESgZWkWUQgT/StCipwEmPAlvskobx4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411390; c=relaxed/simple;
	bh=JfVrdU9i2N0Bpm2VJnX1p52qBM15ob8/6fn81bBvHrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MXxicYSnHecCGPrKEgHzlFrk0i+ja8/tBCkHchs4mrHQp7qHTy77tDlZuZ42RKeRwwECsbA1pKhOVWAkXWE8V6t1wShmXeVirao02/zwwn8Z0LFisilaiBhUIDuUXOX1Z3378rWWghQvcert2EJ3WKOHVpqmSIiXjkymdTpjUDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zfw0dh5M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gE/puqOM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zfw0dh5M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gE/puqOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792411387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MWgf1JLTlMs0FExF6oeyiAd0TQJNBBUWYDr7aW2ZUr4=;
	b=Zfw0dh5MV38dtkqpDZDacsjkipLGOk+ls99Q28c6CtEUrV90V5q3/BzCmtuN2R/SrYUvxv
	71TDn7+1YAaO4+6/MBLpPm8JRh8avR8v8MM9qjDfVPdDr3wBMmUf+cCYYgs0zmY9XF7XRO
	5O71LeWViKQNk74832StinJZQrRrTq8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-Hz1O9aKkN3S3U44AkyPWKA-1; Mon, 19 Oct 2026 12:03:06 +0000
X-MC-Unique: Hz1O9aKkN3S3U44AkyPWKA-1
X-Mimecast-MFC-AGG-ID: Hz1O9aKkN3S3U44AkyPWKA_1792411385
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0c896d05so1432732f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792411385; x=1793016185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MWgf1JLTlMs0FExF6oeyiAd0TQJNBBUWYDr7aW2ZUr4=;
        b=gE/puqOM2KRpV1p8p9SiyjkkRayKOfb1KqwUP9/aC0vw8+K2p0CvYuL9y91Vs/pBrz
         kFHUFRCB81dRrnXQS8Oe4HxgGoN8jxDNZ5VqHZsb6WEz7PPNqYCLCo8ty4wx/Cj1DVrG
         KXOit3aCrEwugRfQt9G8q+HVgjnWjvdZTYYalsbM46VPHcVmc5CTj1Ln4FgOeS9fkDXa
         p6B2ksz3NsD+kjZS+B5XbbY/iVUssKSGdqFlsv94WpNiy+u/NpxXmktmzftb6Hui9dFr
         iiyXUCXclZazR8oCUjuSREEw4ONr3p1Ms29SLb/6rBizAHFpLvrjPzmczibLEMBAjDFF
         9I7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411385; x=1793016185;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWgf1JLTlMs0FExF6oeyiAd0TQJNBBUWYDr7aW2ZUr4=;
        b=mgM72yK/gP8y0vByKoCdttFqw6Po6rUOcltyqCEssptoOiw9NGe2IVbRsqIGWhMKzB
         aPY0PIJ67seS6HsOAVNPYwx3EHHusFPfafcVJfESaoXDh959mE6xQeCU5p/O3VEy9IIf
         g4JuPipmjJlDlR9XQWVB5N7qBhB64TgI1u5kCm3FqYc3nyqd6MIqdNQib5d+qP2VCCr2
         puK7lyTRgfMj3e8c0buDg6R7/bAU5tnDQjLtgoyd9FpOkLNdu+RH3xJnC8db0n40VWd6
         dl86h44Ix35uHuSE8eRoGzv/iplSQOXAGy0kf3a85yOdT02nWI0mTY4g2a6bGAwzJbG2
         R8mQ==
X-Gm-Message-State: AFq9FYLJ3uFZxK3ch9o4Lk124MNeOYIynzJrHDKAiLSahc1Nyif2wjyu
	ovhheSRS2Fdrtr6iOZBm6JYCE10fcCK4tUh/DrDysgBCWRcK6pgW2GtYYw25TW6cdxFW1DhKokc
	h08keng/j4ziNDac/qWr3RjOUreOlOKlItyKC1i0vn6VKUyLZui5eZkOBmDKwN+ntbe3q9BOOap
	1unFUhJXyClcjLCTAQG/+TOEwE1JvuDuvl4AscJi9ok58=
X-Gm-Gg: AYBFou0pAgX8KtOYJNLZV01y/f2RXUOTyiCxKwCp5m82ZELXH6wJzPfzEWhyKbte4Kg
	nR9QbhylG9nTrtbSYpDHV5XKZ2psK/ZIW8lM+q5hNld7qA1l1K6dyUlbqBeiJpMli1DI53GsV72
	a8+QD5jJ2yotEZunCuKqURjVJFPrfY5w2RfC6DJFee2T0jFgHqrjl4aHqrrzWsNz2WyCG6Ns3bT
	bZkhziTPdZWoRuhb3S34FDZp6pXomxph9jKezAI8AFdO+p+udXfgA5cbFLVfg5sHt7koQjIfSAt
	fnSLFAlBNW0ZmrmcF6r4J0gsKMurOs5WgPPk0yi5YA8+0AAlUxsu+eevStQPaX741TdSMQ==
X-Received: by 2002:adf:fa49:0:b0:486:f856:1975 with SMTP id ffacd0b85a97d-48e07bbca4amr10754874f8f.22.1792411384939;
        Mon, 19 Oct 2026 05:03:04 -0700 (PDT)
X-Received: by 2002:adf:fa49:0:b0:486:f856:1975 with SMTP id ffacd0b85a97d-48e07bbca4amr10754717f8f.22.1792411383453;
        Mon, 19 Oct 2026 05:03:03 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ec8dfsm23766001f8f.26.2026.10.19.05.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:03:02 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:03:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Chris Arges <carges@cloudflare.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>
Subject: [PATCH net v3 0/8] more virtio-net csum hardening
Message-ID: <cover.1792411304.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent


As reported first by Paulos Yibelo <habte.yibelo@gmail.com> (after which
others, credited below, found more ways the bug can affect users):

allowing untrusted hardware to specify csum start/offset for
CHECKSUM_PARTIAL was not a good idea, because, if it edits the packet
outside the actual checksum, and depending on the setup, the networking
stack could be looking at the packet both before and after the edit, and
seeing different results.

Previously, commit 6785011f8b16 ("ipv4: validate checksum_start before
completing checksum") validated all known instances where this
causes the most grief, but the real fix is to make sure
that either only actual checksum fields are ever edited,
or the checksum is completed before the net stack looks at it,
so it is always consistent.


This basically goes back to
what we did before f43798c27684 ("tun: Allow GSO using virtio_net_hdr"),
except in a narrow list of specified known good cases.


Summary of the patchset:

These are definitely net material (and seem to be too big for stable,
or I would recommend backporting there, too):

  net: account for ingress-resolved virtio net hdr state
	- accounting, not the fix itself, dependency of the next one
  net: resolve uncommon partial checksums at ingress
	- fix itself
  net: add a sysctl to opt out of virtio net hdr checksum validation
	- reducing risk of the fix by adding a sysctl to disable it

These are cleanups, can be deferred to net-next, too:

  net: add ip4_parse()
  virtio_net: cleanup protocol calculation
	- cleanup resulting code duplication
	 (kept separate to simplify backporting)

Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")

Changes since v1:
	- reorder patches to fix bisectability, addressing
	  a comment by Björn Töpel.
	- code refactoring, different patch splitup,
	  a sysctl knob to disable as suggested by Willem de Bruijn.
	- fix a bunch of minor issues spotted by LLMs


Changes since v2:

virtio_net: parse tunnel csum_start little-endian
  - new patch. correctly parsing the header is a dependency
    of validating it, otherwise i do not know what to validate

net: account for ingress-resolved virtio net hdr state
  - make rx_csum_sw counter 64 bit so it won't wrap
    (spotted by LLM review)

net: resolve uncommon partial checksums at ingress
  - tunnel fixes to bugs noticed by Willem de Bruijn and
    Chris Arges
  - restore the csum_offset checks as suggested by Willem
  - parse csum_start in the tunnel header little-endian like
    the rest of it (spotted by LLM review)

net: add a sysctl to opt out of virtio net hdr checksum validation
  - the knob is no longer writable by root inside a user
    namespace: changing it now requires capable(CAP_NET_ADMIN)
    suggested by Willem de Bruijn

net: add ip4_parse()
  - comment converted to kernel-doc format (Willem de Bruijn)

um: vector: honor virtio net hdr conversion failures
  - commit log tweaks

New patch:
  um: vector: trim skbs before verifying the header
	found by code review

Somewhat tested, tunnel also tested now, um part compiled only


Michael S. Tsirkin (8):
  net: account for ingress-resolved virtio net hdr state
  um: vector: honor virtio net hdr conversion failures
  um: vector: trim skbs before verifying the header
  virtio_net: parse tunnel csum_start little-endian
  net: resolve uncommon partial checksums at ingress
  net: add a sysctl to opt out of virtio net hdr checksum validation
  net: add ip4_parse()
  virtio_net: cleanup protocol calculation

 Documentation/admin-guide/sysctl/net.rst |  19 ++
 arch/um/drivers/vector_kern.c            |   6 +-
 arch/um/drivers/vector_transports.c      |   4 +-
 drivers/net/tap.c                        |   4 +-
 drivers/net/tun.c                        |  41 +++-
 drivers/net/virtio_net.c                 |   2 +-
 include/linux/ip.h                       |  27 +++
 include/linux/virtio_net.h               | 272 ++++++++++++++++++++++-
 include/net/netns/core.h                 |   1 +
 net/bridge/br_netfilter_hooks.c          |  15 +-
 net/core/dev.c                           |   6 +
 net/core/net_namespace.c                 |   1 +
 net/core/sysctl_net_core.c               |  60 +++++
 net/ipv4/ip_input.c                      |  13 +-
 net/ipv4/netfilter/nf_reject_ipv4.c      |  13 +-
 net/packet/af_packet.c                   |   4 +-
 16 files changed, 445 insertions(+), 43 deletions(-)

-- 
MST

