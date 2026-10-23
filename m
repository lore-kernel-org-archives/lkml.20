Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768168;
	b=CvTh9fmGVHxHYZHuNEEdpq/CxJLjmGLNAMkoSmg19YU/vHlLrp6a/JX9P2StBQZm8c4h
	 yqQDt/0Hvt25arLLKBUANFS/lTXNrHLkprBY1n+7iMPqPd+pK0bOHxznVClg6xswu2Rxj
	 dyJ/f6jO5xwlhAGBem8zxyj780bAHYxMigmtIse00qpJj4Dm76KVdFuHveX8+WC7glV/L
	 YWpmk3kTrqyNflpml7ZfU0dWtyKmRrJFpMjIm0sMCqyK0S19eqaDzey8WqCrDe80Iu3c7
	 K48YKDlRawFGwHcn3dBkLXaUsdVCOP0NPELPx80hiO4W+gKh4I3Qs/Y/TH78EvubMjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768168;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:X-Mailer:X-Mutt-Fcc;
	bh=6rh8t+ieIZ7gnLjDlx3Ddd6qZJAChVB6q5mpHU4/pfk=;
	b=O/VQHApaRYteNUIDYx0SEnPg+LeUdKiTxoZyd8NCun8OG/DaYU+KdZV66SD2gwvRrQqS
	 j26ViZkpPctbhE8QmhlHuK7HSm7H+H9EEmWVExhkwgKOhojtl99zROv7ifKaCqWybE7wK
	 23wJvbkhn3V1fwvU1ZYkjVlUGE24yTVVjVjn4+8HtGwOzyZlfnnSxZRdAlz0di0m48R0K
	 WGOEawTHHc4Ht1xwo9U5iHcGSv2/eZjZeTbKeLcb+LPLc8gMAiPMAz6Zpz2TtsmiHZ/Cb
	 Z9q7N8LTmYSVS4jWq9NvM+F11eyAZs/vcxY226XBF+eRud9lVOHLt2fOOwW+elCA/Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="G8Bq/eXH";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dDY4doNX;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD84606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DD84606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G8Bq/eXH;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dDY4doNX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792768167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6rh8t+ieIZ7gnLjDlx3Ddd6qZJAChVB6q5mpHU4/pfk=;
	b=G8Bq/eXHEqFOK803Kc223ZyHThkTwfARiyIaTtQGDAPlzoay1eQvvmxpJLRlmlhtls1cBX
	PZO5D+huFG47r6e1CpA/lrNT8FGcn+dU2YSRKpymdAJSyLIiPWofAv7LmjlmtIvObaOMBy
	3BXmtP+KiwML0/GPrYxeUzM4vrXNpEE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-8hTfFLtMOkeQltdwhxwmcg-1; Fri, 23 Oct 2026 11:09:19 -0400
X-MC-Unique: 8hTfFLtMOkeQltdwhxwmcg-1
X-Mimecast-MFC-AGG-ID: 8hTfFLtMOkeQltdwhxwmcg_1792768158
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a2000d5ebeso7743115e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792768158; x=1793372958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6rh8t+ieIZ7gnLjDlx3Ddd6qZJAChVB6q5mpHU4/pfk=;
        b=dDY4doNXFjNii+YB43UuZLBlZuNsbo/QozyYIv8+DXLGCDTNfGM+jHpgpyxFUKkqqz
         emtJLJtMhHr9rDVt3x3TudUIErWEY1s24cKnDvM8KjhJEEL0tr4PwRX9A/TaWqTSP62l
         YfXKfKni2t2oZwou2lH0ToBIH19WW1eAo5WvBOIzi13lKJTKYcdw0VMFbUQ42mbf2rmi
         Ah3K2PIluBasrBYc3PMQAthIp8dHsXIlXhu1Je18LAkh/oazf5zNDkXXUxV5wlyE7GJL
         3gUcNUxY6q1H7pKnsyTzWIXk2bJjN/AHKeGRtc7oUrWgsjOvt4wJRoyQOTXRlnpysDFT
         O2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768158; x=1793372958;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6rh8t+ieIZ7gnLjDlx3Ddd6qZJAChVB6q5mpHU4/pfk=;
        b=AiBtFKZ0ib54Y+8eZkPWG+PE0mlkDP5jzo8zj7nA0Em1c+t91DFka0yAJulHqa5Kwm
         F3i4hI2vIxY/WXpis7SMMNun78bDkGME/8/Ftqh/lo3zQTj2TBsAz5QhnZv8v5nxhFF9
         kr1zDRANjR9hZJux6I0kWEBB5zIIl8i5cjnl5lBsiOb09WpdFzePA0NYQZvrqzMuz8kQ
         wTLhccW6BN+yQYfWd8Y6Ujnp3BaL0F77QTXCIKN9cIE+Uzo0hAOnPh37OGf0U15KRP7g
         9/HyFl+5xnobNpbIqi49bBPhbkPSoTARQWSv/D+kPZkAb2ycGTWsqmLLlKmUCYAMJRIL
         kWDw==
X-Gm-Message-State: AFq9FYInH5QhiHLb5EcRmVT+x9nXcj5mVVvaQETWAsymUmaM7zE1yUF9
	Dd/tkhPM1MQAXgIrw8IeSHcOXabXz2kxmLa7DHyujUjXUyfTlu8lWP/6N4JtDcwHAvU6pl1W95Y
	/2CXqKdek96YNju9gU9/wafXAs/iqWLiwm098AiqVD0Tan2nPF+1OQ0choCD/9K/4PAe2KCqPmz
	TH2iIMb76g2IzqhyZGKLx6Ze7i3ucokXQx5fRoWJcudKw=
X-Gm-Gg: AYBFou1T/uJPJsFb/PEYqm7gzyn5O7vPTskb2iVSuWzMKoMd4wdurV1ZKRTHEPR66ML
	JDq/CbDd0WElLA6+FYQ3IkamTfqxrZs8nlq4VscmVZKEzxaYCLujRM/GTRC1izfqv9d9YpAHQdS
	Oo0FU6OMUHsWhzVZ+CSYhO4GxkUL2XjiXgRsqAlsLNDm22GRUZLcGMiCOMXKcj+JZzAU7pGTbUc
	JZFKbW34qJLzTl4I0kHB3w4e6W2ElIsAt3dnGXW4JHs6KXqeuhT+i+tcCLUt4Qq/qbLm3RFmUuE
	Rf3RaMkYRo6+thnQgI/mYRvCnTWJ3DW76ZKsme/AlnMUzI9v9gwpSXhP7hXTuE1hqMPnFJM=
X-Received: by 2002:a05:600c:a101:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4a211f2b694mr36183715e9.34.1792768157550;
        Fri, 23 Oct 2026 08:09:17 -0700 (PDT)
X-Received: by 2002:a05:600c:a101:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4a211f2b694mr36183025e9.34.1792768156891;
        Fri, 23 Oct 2026 08:09:16 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2b0637460sm10017715e9.8.2026.10.23.08.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:15 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:09:13 -0400
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
Subject: [PATCH net v6 0/5] more virtio-net csum hardening
Message-ID: <cover.1792768096.git.mst@redhat.com>
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


Okay this seems to be converging.... But sashiko did find some issues I
thought are best fixed. Specifically I thought of a better way to handle
short gso in a tunnel - just clear tunnel gso! As a side effect we now
fix up the checksum for these dodgy packets like we did before, instead
of a drop. Good. And more false positives that prompted me to write a
bit more comments. So here goes.

Apologies for reposting so frequently, I know netdev bot will be unhappy
with that.  But Paulos's report made a lot of publicity, there is a lot
of people looking into this, so I feel there's value in defending
against all this class of issues sooner rather than later.

The issues were mostly found by code inspection, but all reproduced by
me in a VM.

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


Changes since v4:

net: account for ingress-resolved virtio net hdr state
  - count on tun only: dropped the tap, macvtap, ipvtap and
    virtio_net counters (Willem de Bruijn)
  - the driver side branches are in their final form here now,
    moved from "net: resolve uncommon partial checksums at
    ingress" (Willem de Bruijn)

net: resolve uncommon partial checksums at ingress
  - no longer touches the drivers (Willem de Bruijn)
  - a packet too small to be GSO: ignore the tunnel GSO request,
    same as plain GSO ones, and complete wild metadata in place
    (sashiko)
  - document the zero copy interaction (sashiko)
  - honor a preset skb->protocol on ethernet: the stack uses it,
    except on loopback which re-parses the frame (sashiko)

net: add a sysctl to opt out of virtio net hdr checksum validation
  - document the netns lifetime requirement (sashiko)

net: add ip4_parse()
  - pull the whole header, options included, so that the
    transport header offset is within the linear data
    (Willem de Bruijn)


Changes since v5:

net: resolve uncommon partial checksums at ingress
  - read both skb->protocol and the frame ethertype: do not
    validate when they disagree, instead of preferring the
    preset protocol; same check after the IP version inference
    where there is no L2 header (Willem de Bruijn)
  - pull the IPv4 options in the helper as introduced, with the
    transport header offset computed before the pull
    (Willem de Bruijn)
  - fold the trivial protocol calculation cleanup, formerly a
    separate patch, in (Willem de Bruijn)

net: add ip4_parse()
  - the options pull moved to the helper introduction in
    "net: resolve uncommon partial checksums at ingress"

Tested: full suite on the final tree, tunnel included.
um part compiled only.


Michael S. Tsirkin (5):
  net: account for ingress-resolved virtio net hdr state
  um: vector: trim skbs before verifying the header
  virtio_net: parse tunnel csum_start little-endian
  net: resolve uncommon partial checksums at ingress
  net: add a sysctl to opt out of virtio net hdr checksum validation

 Documentation/admin-guide/sysctl/net.rst |  19 ++
 arch/um/drivers/vector_kern.c            |   6 +-
 arch/um/drivers/vector_transports.c      |   4 +-
 drivers/net/tap.c                        |   4 +-
 drivers/net/tun.c                        |  41 ++-
 drivers/net/virtio_net.c                 |   2 +-
 include/linux/virtio_net.h               | 319 ++++++++++++++++++++++-
 include/net/netns/core.h                 |   1 +
 net/core/dev.c                           |   7 +
 net/core/net_namespace.c                 |   1 +
 net/core/sysctl_net_core.c               |  50 ++++
 net/packet/af_packet.c                   |   4 +-
 12 files changed, 441 insertions(+), 17 deletions(-)

-- 
MST

