Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569028;
	b=bsL4MG3ofHhDd1C/mmpUqQnHQcCvYTFsVZi4hyLHJttg0RLJSyitCdYwxuZx3bs3rinc
	 ao3UkpobVO+72rwOogc2n5fDJfDzCRt3Kwe5frxzIuHj57QFJqqHR3kphwIIBfXtp7oTZ
	 kQPFeDhPnuZDxFvJym5B97urCcoqbm7RwHTaoZn7zLN+92Z1jRXhsj4UbLM8/YnGOe+2J
	 3ne7+1cfgZHjCsObAayNdA3d93Bt1WcIGLZhT8HTqzDTiHrIXWX7tIPyBibOcFq7MlN0G
	 S6tycTLma4bwb6aycQKj9iBRvRZohVhK8G6IE36MwB/0/uSZL8tDrntXnup9ga5XdzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569028;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:X-Mailer:X-Mutt-Fcc;
	bh=7Dqv2gwj0/nv5UbdQEd7aSrqQef4tqCqRf4kiR9t/Hk=;
	b=Puqbq9Aj2wgIBK8FO7ZTV9XnXyBs7uuFfWNl5/6dqpNM/S1EGpbgOeXgqGa9bUeIyYOz
	 Y8gev4qJ8tK+2LxVHQw5+pASbXis1XnNBGPzWqCnkt0wf4fSi0Q7VOPhT/VqQiIW+DdKC
	 mqkKpawp2ArSHsepbPzXg7CD0l1mZXKfSNyZe+KA8YMaU1LE6VHpiAQawWlKzKNLM+Imd
	 Eygi/xWmr8CAQ4Hzz3GtV7aJ124He+g85AwzSv8BNoK5KFmijxiTQuSXmThqTMYSZnS7/
	 AUsJmECcqg5TMQNnAj+7wjhCfNpL3gKb8UklR9VCoEcTrD0MFFQsODhZ2mXC6YRVbAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K5wRbpWD;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=k927zveU;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7D8606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B7D8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K5wRbpWD;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=k927zveU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792569027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7Dqv2gwj0/nv5UbdQEd7aSrqQef4tqCqRf4kiR9t/Hk=;
	b=K5wRbpWDIy4Zwef3t4dNZ0POIUDIlwSCrrDyz19IWw3dobn0/ah/1WhDNjPR3F2It0wN0W
	qgpV9c5AmRWF2XjnX14rYRcd3h6O4IypUnimAqGJFJ2TRv9QkQ1RDrTqhCBxO6apbUUfHW
	aVYNjPdoOQmJku67dFYawEW+vONuArk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-J5V7OCfPP36Oo9Y-9NphOA-1; Wed, 21 Oct 2026 03:50:25 -0400
X-MC-Unique: J5V7OCfPP36Oo9Y-9NphOA-1
X-Mimecast-MFC-AGG-ID: J5V7OCfPP36Oo9Y-9NphOA_1792569024
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c430f0f01so313799f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792569024; x=1793173824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Dqv2gwj0/nv5UbdQEd7aSrqQef4tqCqRf4kiR9t/Hk=;
        b=k927zveUrj3AVmkoz3+yU5ZDePHzdl5hMgjr6Nw+ypjcoCiE/DM09LtSKeSeifXojO
         QNmhIukskGMLwMnFKx8D1wjwLf+c/lomEfdsi0yKRur8mII9yy2B0w9Cd0XBHwLkxm4F
         STs57jKDTmUntXgN7Sr7JJxRVgJfZSO8cytg0DhYAVo56r/F3jClaLh7rtpv75N/1v44
         E8hOe83PyaIz5uWz5xD9T8rjLWi7MgFPodIiAHLh+pKOnnAmdj24b9QYjCgJHOjXUFqQ
         tDhO/NUencvuhJzgNx8RHJaZ7Pa35+5IMTabshioyoZf4vq4+myCliBbGUBzS8bKX0Jg
         IiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569024; x=1793173824;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Dqv2gwj0/nv5UbdQEd7aSrqQef4tqCqRf4kiR9t/Hk=;
        b=yKp1FLw/oTQBUvdx/Ak4PUALN5SZmCjhE2T+R7EleWRrb4uNOIhMIRCkmUaHxojcCR
         swe7RPXtb3dQwdj+mt4Q4GmE5ZgqDPNaLvoO0YeyK3xiLILjJJXrF7O/s9OpwvVhikBV
         qf1ziQzS302mTeeDaYPKhMoa3/DuiQhGvtk8wO1XvebYK1gL/BwL20GIAapwLuELH655
         UlLfkZAeJkGX3xgICW53OCiv4IpppMRKVP+Sp7mtUaDko5q8k7LwWVFhLRulHfsBUIqF
         jBC/qaTDKgmI75iFzf96RVlmmVDnASorisTH+tCB5DUXNo/iNKifkRpmfyKQE7CI5o+l
         ufdQ==
X-Gm-Message-State: AFq9FYKJSYSJ2e7iTkXd3EHvKAsdSpyQOuy4mNsetol5gYCPhkn+qDyA
	E7i05MrV/mfvGxwvdrtme98a3hs0gpqGmSDnRgN8V2anEHF/bRcMOpBgLVA9Vph3zxpfvy3x7Fs
	qLaORuwyo6x5l/OTHlcHJovqIz58eIK10A7n6vwP7VOkesMSVOtFh5eGHmESjvhutZ77ObcjXRy
	KbNscDSKIwpOGIlL/fsZ8diKNhh0M2dnUBd8xbDL3G1+w=
X-Gm-Gg: AYBFou2d9AP8z6jWfH6S1D5i06GLYFjnNhTLUN+O4YjphrdaWy+OipXC9SN3XhmBhsa
	KEEEHQb6AzYUroUN3n++o0q7A2MRpMvF5lYP4XML4egHVx9kjXYpZo6Ghmv0Gx1CveFzk63s+bR
	yWPA2NiHOqySpURLahIbkrm6xA1l6XZPY+9NAY6apXR/30M07lj9wcvHEM8WuoyCJO4OjiTlT3Q
	giYC+tGhodjj4y7cd++znSNpUevaLxD0EPkk/KL9lKFKOP5Y5Q75kYTU2YfOzm601sYfHymEXnR
	pPhrMGF+pRz1hUmP0+zl+a2jB7rxEfLVdbHgl21wCwHXGEb7y9N56ibAAWjJkwO8Lwb9dw==
X-Received: by 2002:a05:600c:3f0c:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-4a1fdd3bdeamr20884185e9.31.1792569024194;
        Wed, 21 Oct 2026 00:50:24 -0700 (PDT)
X-Received: by 2002:a05:600c:3f0c:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-4a1fdd3bdeamr20883545e9.31.1792569023605;
        Wed, 21 Oct 2026 00:50:23 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm121013585e9.6.2026.10.21.00.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:50:22 -0700 (PDT)
Date: Wed, 21 Oct 2026 03:50:20 -0400
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
Subject: [PATCH net v4 0/7] more virtio-net csum hardening
Message-ID: <cover.v4.git.mst@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

v4 and I'm pretty tired of this family of issues.

Willem suggested more cleanups, but I don't think I will
be able to dedicate much more time to this, there's a pile of
fixes I queued that need to get tested and go into rc2, and a bunch
of qemu features that need review.

Hopefully if any changes are required this can be done by patches on
top, or if someone wants to take over this, very welcome.

------

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

These are probabably net material (and seem to be too big for stable,
or I would recommend backporting there, too):

  net: account for ingress-resolved virtio net hdr state
	- accounting, not the fix itself, dependency of the fix
  um: vector: trim skbs before verifying the header
	- fixes the um receive path: without it the checksum would be
	  completed over the unreceived tail of the buffer
  virtio_net: parse tunnel csum_start little-endian
	- bugfix, a dependency of validating the header
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

net: add a sysctl to opt out of virtio net hdr checksum validation
  - the knob is no longer writable by root inside a user
    namespace: changing it now requires capable(CAP_NET_ADMIN)
    suggested by Willem de Bruijn

net: add ip4_parse()
  - comment converted to kernel-doc format (Willem de Bruijn)

um: vector: trim skbs before verifying the header
  - new patch, found by code review


Changes since v3:

net: account for ingress-resolved virtio net hdr state
  - um: vector: honor virtio net hdr conversion failures
    folded in (Björn Töpel)
  - count on tap and virtio_net, too (Willem de Bruijn)

net: resolve uncommon partial checksums at ingress
  - walk the frame on loopback, too: loopback_xmit() runs
    eth_type_trans() on it (Willem de Bruijn)
  - return the mismatch handling directly, GSO is implied in
    the tunnel path so drop there outright, and fold the helper
    into its one remaining caller (Willem de Bruijn)
  - read the IP version through struct iphdr (Willem de Bruijn)
  - document the ipv6_find_hdr() flags choice

net: add a sysctl to opt out of virtio net hdr checksum validation
  - renamed to virtio_net_hdr_validate, in case more validation
    is gated by the same knob later (Willem de Bruijn)
  - point .data at the value like the neighboring entries,
    the per-netns registration rebases it, and the handler reads
    the value directly - no ctl_table copy (Björn Töpel,
    Willem de Bruijn)
  - check the opt-out before parsing: with the knob off, packets
    the parser cannot handle were still dropped (Willem de Bruijn)
  - include virtio_net.h in net/core/dev.c so the static key
    definition sees its declaration (build warning reported by
    Jakub Kicinski)

net: add ip4_parse()
  - add the missing kernel-doc Return: section
    (Jakub Kicinski)

Tested: full suite on the final tree, tunnel included.
um part compiled only.


Michael S. Tsirkin (7):
  net: account for ingress-resolved virtio net hdr state
  um: vector: trim skbs before verifying the header
  virtio_net: parse tunnel csum_start little-endian
  net: resolve uncommon partial checksums at ingress
  net: add a sysctl to opt out of virtio net hdr checksum validation
  net: add ip4_parse()
  virtio_net: cleanup protocol calculation

 Documentation/admin-guide/sysctl/net.rst |  19 +++
 arch/um/drivers/vector_kern.c            |   6 +-
 arch/um/drivers/vector_transports.c      |   4 +-
 drivers/net/ipvlan/ipvtap.c              |  36 ++++
 drivers/net/macvtap.c                    |  36 ++++
 drivers/net/tap.c                        |   8 +-
 drivers/net/tun.c                        |  41 ++++-
 drivers/net/virtio_net.c                 |  14 +-
 include/linux/if_tap.h                   |   1 +
 include/linux/ip.h                       |  30 ++++
 include/linux/virtio_net.h               | 279 ++++++++++++++++++++++++++++++-
 include/net/netns/core.h                 |   1 +
 net/bridge/br_netfilter_hooks.c          |  15 +-
 net/core/dev.c                           |   7 +
 net/core/net_namespace.c                 |   1 +
 net/core/sysctl_net_core.c               |  50 ++++++
 net/ipv4/ip_input.c                      |  13 +-
 net/ipv4/netfilter/nf_reject_ipv4.c      |  13 +-
 net/packet/af_packet.c                   |   4 +-
 19 files changed, 533 insertions(+), 45 deletions(-)

-- 
MST

