Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691678;
	b=rzB7qFE9wNvRIosIu8Qnfg9+73qH/WNW46wte8dAfMu1jxvckJHRwuFwLw4ZUMQCX6p4
	 wpMJTtYXIPAkXXACJ8CtYQSG+ER10CuL+R235S3O+6A7HYrla6cpIM//kQTKiFIC6opyz
	 p0NdjixsQGYPobrthAXrSKz5wCBC5j4fAUNnVBycB2nyvPNV6UVFifOixE4gaObbwPIVG
	 3fptY6pu6GNMV1901iIehg3gcH5cbi4AGcpu7q9vrenT6Jqiqz1VW/d3qSy2BM/H1hbPC
	 weCxpiD11wCO7UcLsuIQ2atcrXpQW19En/k/e5x5KmpzCuzkVQNpfwedZ7KgkiBDuDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=e2YlE3a8sEe/lSSTI4eekpIROK5ojeg1ho/PymbBpoI=;
	b=MDkNLLWI1W/70gGUdqZmID/mLDfzl/yRJQy2GnLwc2i1TkL/2/wGP+32ed4eZV41YAlx
	 RCo7sj2dOKUf1759s5i6NWnvy45F+y5Om3UHD8nFhrkvEA2owXHDKB/QdOF9HHQHTfavw
	 cgbbXmun1ufYtpizvi6mpGCcE9ge8y371UDgBj8BMs7/w/lFEaknUgS1cGem9RJmkqELm
	 EKBGYZLETELxOPndma9EBBFb/+dAlxgc2/LqhzVMbn/jD/73Kf5sUoun9EtTKD1B3OlQC
	 Jn3hhCu9DjbixXL5HPf0+2jiAgWfFRU7f31gJt3KfwZ2M/dE3qqrfKo3xloTwc9jbNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=H1a4b2OF;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85F1606A330
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A85F1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=H1a4b2OF
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-48ed0b68895so55934fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1792691676; x=1793296476; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e2YlE3a8sEe/lSSTI4eekpIROK5ojeg1ho/PymbBpoI=;
        b=H1a4b2OFFYCRiw1h6natqv6aY2lzZhUVieVGIIhqHFof6GnEFEtfp2YPVWsQeXX6jk
         GQe3pCZw1WGUD5S7pGM1rnS1Z5c8e6wbb2nSJkaBzCscpjcnAnYmv0qA8sRoM1EeFsa6
         zqiXcxt6q329RrmfWzo0qa5J55GctjQGD8zIKKADsSuonWRMWvIO9X6S5PBIkFIPf5Az
         LGU3FEhUi/q7MlnIBS/6qZ4w2Hbca28bol8/KiOyskrZ4/fUU62c4r9OZVPz7uK4ZYnL
         Fxu1JH5uHm9jG9mHQ9+oJX8B9JP243UOpWRJvWL9com0vP6j7Yj42dRDlW78bwSveMJM
         e1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691676; x=1793296476;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e2YlE3a8sEe/lSSTI4eekpIROK5ojeg1ho/PymbBpoI=;
        b=s7V+/1Adzb4tzBPydrq0MfgoKgw4F5KWP+WICGHaB2GCIdHD5YaimZcAMIayP3HI7J
         mcIt1yngSm0VzQXL6wFkxlGQQ+XUS4H9Lx6sFfgEt9er5/AqGj2z+RUHFOCIvSx3wcJe
         pmykrjmfk2d+B6vK5G2z2g19MpvO3smNnTPwMr3sUBt4uNbVDzrsEt/Y6gRyRKLZhpCI
         owdPYlpCGz7cdqD8R63Sf/YPa33IhI2VWTh+vUztRND4RfkUasmh5JkrM410JOByDVtG
         h5tzvOzJlRgyjrym5xpiPnuALEEEwc4Ia8QDOSZJ7yCrIBU5O9Us7uBzHZ4N+T6zMdZf
         mQAg==
X-Gm-Message-State: AFq9FYIFX1FVVENgQxf/Tvorrplzv3Se3QZoC3Ysklr31yDURdbnqe7J
	wxJXCJPcfjM6E+PshRAczhRhPYtLPgY5qlvEYhVHOafB4RjoJ9M+QSpz47nmWWgZCgo=
X-Gm-Gg: AYBFou3MO5rSg6E/fc/5Dl1p9aBdRmFzHT6vmvlrXS3dQOIOR853fKG1in0ne9qabkU
	FtvlLZEg7Eveb/r97Ub9AzuZ4Dys39tzbBTXlEt2vdeQIhDf/S5z2kwO91s5Q6jcstzQEGM9bJ0
	LtdTZKP/9LZe07Lu/b80rwCKRdfQCcDSYzyZHLQima+0DSmUbggrRo0i1HyZfid/E+YHd82VXho
	/XoGf7aPYoul9jrafaZHZCoUyUI1HOJZGsFx6bEw8KZmfPZ7LWcAkNOM3qSHBqlFBpSYr5GevZq
	LcElTnKjoyBnBqKallaokwWSIOWvYz3dDwwjOe4PgOR4B0CidxULB/rmN2D3tSKoHAwP1Z0BAO6
	gu5knuK/cYMwpCk4cyOJrf4shlW4i3R/Mt1Pt5/DSMVQ1cqoSUo7Cqrv+cY+0t/AXs2dU1bXNAx
	z1IhMul+ayBNuU2xr/fmjMHA8/s2bDXjBmh9jSzv1SuaNfmruHaAbTnW/YKPaI5DFtPwR4MsJX5
	Vh+jo7ATcExZr3ZJXebnmx4x/keYHAcF0hgo/g=
X-Received: by 2002:a05:6870:8a29:b0:4a7:4730:affa with SMTP id 586e51a60fabf-4a7dc1d4bf8mr3955050fac.24.1792691676439;
        Thu, 22 Oct 2026 10:54:36 -0700 (PDT)
Received: from 20HS2G4 ([2a09:bac6:bf21:3737::580:4b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d61dc6ddsm5070888fac.13.2026.10.22.10.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:54:35 -0700 (PDT)
Date: Thu, 22 Oct 2026 12:54:33 -0500
From: Chris Arges <carges@cloudflare.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, virtualization@lists.linux.dev, 
	Max Krasnyansky <maxk@qualcomm.com>, Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH net v5 0/7] more virtio-net csum hardening
Message-ID: <atpNckkhSp0aq2Hw@20HS2G4>
References: <cover.v5.git.mst@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.v5.git.mst@redhat.com>

On 2026-10-22 08:57:54, Michael S. Tsirkin wrote:
> Okay this seems to be converging.... But sashiko did find some issues I
> thought are best fixed. Specifically I thought of a better way to handle
> short gso in a tunnel - just clear tunnel gso! As a side effect we now
> fix up the checksum for these dodgy packets like we did before, instead
> of a drop. Good. And more false positives that prompted me to write a
> bit more comments. So here goes.
> 
> Apologies for reposting so frequently, I know netdev bot will be unhappy
> with that.  But Paulos's report made a lot of publicity, there is a lot
> of people looking into this, so I feel there's value in defending
> against all this class of issues sooner rather than later.
> 
> The issues were mostly found by code inspection, but all reproduced by
> me in a VM.
>

Tested this series again (minus UM) and it fixes my original test cases. Added
one comment after digging a bit deeper into the code. Again thank you for the
work here.

Tested-by: Chris Arges <carges@cloudflare.com>

 
> ------
> 
> As reported first by Paulos Yibelo <habte.yibelo@gmail.com> (after which
> others, credited below, found more ways the bug can affect users):
> 
> allowing untrusted hardware to specify csum start/offset for
> CHECKSUM_PARTIAL was not a good idea, because, if it edits the packet
> outside the actual checksum, and depending on the setup, the networking
> stack could be looking at the packet both before and after the edit, and
> seeing different results.
> 
> Previously, commit 6785011f8b16 ("ipv4: validate checksum_start before
> completing checksum") validated all known instances where this
> causes the most grief, but the real fix is to make sure
> that either only actual checksum fields are ever edited,
> or the checksum is completed before the net stack looks at it,
> so it is always consistent.
> 
> 
> This basically goes back to
> what we did before f43798c27684 ("tun: Allow GSO using virtio_net_hdr"),
> except in a narrow list of specified known good cases.
> 
> 
> Summary of the patchset:
> 
> These are probabably net material (and seem to be too big for stable,
> or I would recommend backporting there, too):
> 
>   net: account for ingress-resolved virtio net hdr state
> 	- accounting, not the fix itself, dependency of the fix
>   um: vector: trim skbs before verifying the header
> 	- fixes the um receive path: without it the checksum would be
> 	  completed over the unreceived tail of the buffer
>   virtio_net: parse tunnel csum_start little-endian
> 	- bugfix, a dependency of validating the header
>   net: resolve uncommon partial checksums at ingress
> 	- fix itself
>   net: add a sysctl to opt out of virtio net hdr checksum validation
> 	- reducing risk of the fix by adding a sysctl to disable it
> 
> These are cleanups, can be deferred to net-next, too:
> 
>   net: add ip4_parse()
>   virtio_net: cleanup protocol calculation
> 	- cleanup resulting code duplication
> 	 (kept separate to simplify backporting)
> 
> Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
> 
> Changes since v1:
> 	- reorder patches to fix bisectability, addressing
> 	  a comment by Björn Töpel.
> 	- code refactoring, different patch splitup,
> 	  a sysctl knob to disable as suggested by Willem de Bruijn.
> 	- fix a bunch of minor issues spotted by LLMs
> 
> 
> Changes since v2:
> 
> virtio_net: parse tunnel csum_start little-endian
>   - new patch. correctly parsing the header is a dependency
>     of validating it, otherwise i do not know what to validate
> 
> net: account for ingress-resolved virtio net hdr state
>   - make rx_csum_sw counter 64 bit so it won't wrap
>     (spotted by LLM review)
> 
> net: resolve uncommon partial checksums at ingress
>   - tunnel fixes to bugs noticed by Willem de Bruijn and
>     Chris Arges
>   - restore the csum_offset checks as suggested by Willem
> 
> net: add a sysctl to opt out of virtio net hdr checksum validation
>   - the knob is no longer writable by root inside a user
>     namespace: changing it now requires capable(CAP_NET_ADMIN)
>     suggested by Willem de Bruijn
> 
> net: add ip4_parse()
>   - comment converted to kernel-doc format (Willem de Bruijn)
> 
> um: vector: trim skbs before verifying the header
>   - new patch, found by code review
> 
> 
> Changes since v3:
> 
> net: account for ingress-resolved virtio net hdr state
>   - um: vector: honor virtio net hdr conversion failures
>     folded in (Björn Töpel)
>   - count on tap and virtio_net, too (Willem de Bruijn)
> 
> net: resolve uncommon partial checksums at ingress
>   - walk the frame on loopback, too: loopback_xmit() runs
>     eth_type_trans() on it (Willem de Bruijn)
>   - return the mismatch handling directly, GSO is implied in
>     the tunnel path so drop there outright, and fold the helper
>     into its one remaining caller (Willem de Bruijn)
>   - read the IP version through struct iphdr (Willem de Bruijn)
>   - document the ipv6_find_hdr() flags choice
> 
> net: add a sysctl to opt out of virtio net hdr checksum validation
>   - renamed to virtio_net_hdr_validate, in case more validation
>     is gated by the same knob later (Willem de Bruijn)
>   - point .data at the value like the neighboring entries,
>     the per-netns registration rebases it, and the handler reads
>     the value directly - no ctl_table copy (Björn Töpel,
>     Willem de Bruijn)
>   - check the opt-out before parsing: with the knob off, packets
>     the parser cannot handle were still dropped (Willem de Bruijn)
>   - include virtio_net.h in net/core/dev.c so the static key
>     definition sees its declaration (build warning reported by
>     Jakub Kicinski)
> 
> net: add ip4_parse()
>   - add the missing kernel-doc Return: section
>     (Jakub Kicinski)
> 
> 
> Changes since v4:
> 
> net: account for ingress-resolved virtio net hdr state
>   - count on tun only: dropped the tap, macvtap, ipvtap and
>     virtio_net counters (Willem de Bruijn)
>   - the driver side branches are in their final form here now,
>     moved from "net: resolve uncommon partial checksums at
>     ingress" (Willem de Bruijn)
> 
> net: resolve uncommon partial checksums at ingress
>   - no longer touches the drivers (Willem de Bruijn)
>   - a packet too small to be GSO: ignore the tunnel GSO request,
>     same as plain GSO ones, and complete wild metadata in place
>     (sashiko)
>   - document the zero copy interaction (sashiko)
>   - honor a preset skb->protocol on ethernet: the stack uses it,
>     except on loopback which re-parses the frame (sashiko)
> 
> net: add a sysctl to opt out of virtio net hdr checksum validation
>   - document the netns lifetime requirement (sashiko)
> 
> net: add ip4_parse()
>   - pull the whole header, options included, so that the
>     transport header offset is within the linear data
>     (Willem de Bruijn)
> 
> Tested: full suite on the final tree, tunnel included.
> um part compiled only.
> 
> 
> Michael S. Tsirkin (7):
>   net: account for ingress-resolved virtio net hdr state
>   um: vector: trim skbs before verifying the header
>   virtio_net: parse tunnel csum_start little-endian
>   net: resolve uncommon partial checksums at ingress
>   net: add a sysctl to opt out of virtio net hdr checksum validation
>   net: add ip4_parse()
>   virtio_net: cleanup protocol calculation
> 
>  Documentation/admin-guide/sysctl/net.rst |  19 ++
>  arch/um/drivers/vector_kern.c            |   6 +-
>  arch/um/drivers/vector_transports.c      |   4 +-
>  drivers/net/tap.c                        |   4 +-
>  drivers/net/tun.c                        |  41 +++-
>  drivers/net/virtio_net.c                 |   2 +-
>  include/linux/ip.h                       |  37 +++
>  include/linux/virtio_net.h               | 287 ++++++++++++++++++++++-
>  include/net/netns/core.h                 |   1 +
>  net/bridge/br_netfilter_hooks.c          |  15 +-
>  net/core/dev.c                           |   7 +
>  net/core/net_namespace.c                 |   1 +
>  net/core/sysctl_net_core.c               |  50 ++++
>  net/ipv4/ip_input.c                      |  13 +-
>  net/ipv4/netfilter/nf_reject_ipv4.c      |  13 +-
>  net/packet/af_packet.c                   |   4 +-
>  16 files changed, 461 insertions(+), 43 deletions(-)
> 
> -- 
> MST
> 
