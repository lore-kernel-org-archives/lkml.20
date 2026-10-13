Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078FB3A6F11
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877587; cv=none; b=dh3ncSkDJEBrzdDnByHWpiAG16Q8Zd3obkgEyVQqq6wyoMFq3mGFwDYfvCvexb5q25jxLc4+6MQ4IdjXkQ2QljuvTX6oQme74nMDNtGFMQPJTjO/G9PFoJy8g2CxYDWFoi+MNCsJglDRG3Oa9+2f8MpjlVKmme9fgxt0XZJP/kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877587; c=relaxed/simple;
	bh=mveVOZV1cqSe9kjwGcpsqB9hQj8+IumH5VgQu3rUViY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B5g2epMRV+7aMCHR/OGe/Vfri8NEmI8Ijtywjl299+7EZx0xfDttrSOPMTAeJ63J9vNUKvxWQEfz4k7q4J6dDKNhN1Y05EISI/h3kn6DwbmYJkKJgQrmcg1RTLyK+F4VvNeIcYxCL9EVPDAGnj4P6EFJ8dSpkvhJCJ8cutK41gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Foa4ZaOt; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Foa4ZaOt"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-88746bf1ec2so156910b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877585; x=1792482385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JtNaVvMG5Mqm08sLDfXPlT2jXVN8JsJ0XyUmmjwX9a0=;
        b=Foa4ZaOtjGmm752Nl1EoDO8oetROn17FzVIA/1RhB16ziwI3UhaKj91MOxBSwj5tjr
         udMlwKOccToHShpdPGeGP4WCJ1lVKXCw5NaQl6gvpYREZF/OYjNR6modWV70bnAncZN2
         fKG5EnTX8mt49rNbErCTI/9cKvwCVTFmXpvkLKWvwMz3Il4PsF9puVHwsKR1eF7YqWiU
         8SEXuxd9Hrr+lia5fCLIUrcwnfKWmi0540G70CTSy8ZektouRx9aGFgP7qHUkLo5xT97
         jnVFfYQbiczrYwdsC0y07+2a/VXEqFSa6zS0XtzqsvgM0LNxOLLhLAapbKDoeZqh7/1P
         btuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877585; x=1792482385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtNaVvMG5Mqm08sLDfXPlT2jXVN8JsJ0XyUmmjwX9a0=;
        b=Ek+O1EGR9kDgk2vIMfHdSjmEwv42YalJJ0t3M02maHhX3ThqX35nu7rr7BbLbeoCAD
         UlAiQivX0d4tKC0x3tREeqRGS6Uo2RMGT4DTwNlAtktb3lHo6LudNihTdOynJSAICcQj
         b0sHLtA+8ls4Hj5ppPqiqq226fUdyQSXcCPVJAU+usYMduzVcv4yY9TTGQCtbSxGS3t4
         pc7dvOENTkasJvbLt6lU+0OABlcHJhzrjbFDK8L0cIQpjeHUKvxEb/RtIBD9+Du8pn6p
         e+eGy7ahkdsFf/mAFpkdFr/9c9NTl6CbMcgysUpvQjnJwN3l8FVTC5tbTm1bc8eWsPvm
         gYNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTKWPCUnxsvKdogIy8pW0XciaAor0tCs7nWQhsfQlYXD5z2O6B/wgv3XwzT2CGd3Leg1JT3YdOIdvom/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKM1OH/lFem26ajNrRbcNnizYxvT9vambv7dmN+Gjmaeiij9mqI
	ogJ1rBZ9aPBeK8gc9lbpRnvajOGNL0hbcHRIudHIt/9B/3C6zYKho8qq
X-Gm-Gg: AYBFou3ESLJRK4QQtXQbtzlQm1YbNSp37VuS+1PWQecyj6V6GwevKzcEOCRjyQ194KH
	e4l2czEVg2bZOgYPynRYnhMKDPJ3SCCXBI/Mwo/rXbyNGNfAC40rQoFnkX/hUp4MPzQW78zLWFt
	gY/yGpGCKDXq/g1rr0NU2QyPt1xyHM0wgYJXW/8ChEEhriDJuMGPqmHgPfaHUdf7sRUgoDJolhD
	YCC3c4p4Sh37a8u0AwIm7TsxTLlWgCyL+qUnz5vH5eMtxSLvevKuvrUnLxy0k0T7fBjKzOem0bm
	n9Vq2EEVY6WGCSBfkJTpAlDRGmb0CdDJ5iijz2/tBzmEO/tMPo4SwgcbIHK74H7YdUxrOcKmFk3
	FvLwzaRV1iC+47N1qYj4c68fCJb4H5DDPegZnp0qrK6cRFxa+oKNuPAV6DxtgMyaxFBCEdONjMd
	Rpy7uicNRyOaTICw9Vy/0cFSm7sslFZyg1DlhcNFoteHO39UCa1Wf+9k5uMBZoHLDS3fck/rgG+
	RWkenKLW5bNIas4zT09Ej8PYxF/E5AthWmLc1f7hHr8d8aNytgGVcaQTwSz/g==
X-Received: by 2002:a05:6a00:4889:b0:89a:ee91:e894 with SMTP id d2e1a72fcca58-89aeeb074bamr4683767b3a.0.1791877585236;
        Tue, 13 Oct 2026 00:46:25 -0700 (PDT)
Received: from localhost.localdomain ([139.159.170.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89805c75343sm4459011b3a.38.2026.10.13.00.46.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 00:46:24 -0700 (PDT)
From: Qihang <q.h.hack.winter@gmail.com>
To: netdev@vger.kernel.org
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Christian Hopps <chopps@labn.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/3] xfrm: fix vti tunnel device use-after-free across async crypto resumption
Date: Tue, 13 Oct 2026 15:46:07 +0800
Message-ID: <20261013074610.17808-1-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This replaces the v1 vti/vti6 series.

vti_input() and vti6_input_proto() cache the tunnel pointer in the skb
control buffer without taking a reference.  With async crypto the
receive callback runs from the crypto completion, after a possible
device teardown, and dereferences the freed tunnel device.

The reference cannot simply be held in the input path and dropped in
the callback: the callback is not reached on every path (IPTFS frees
the outer skb itself, and the early drop for a non-valid state runs
with family still AF_UNSPEC), and on the success path the callback may
drop the last reference before xfrm_input() is done with skb->dev.

Make the reference travel with the skb instead: the receive callbacks
install the device in skb->dev and leave their reference with it, and
xfrm_input() releases it once the packet has been delivered.

Patch 3 covers vti, vti6 and xfrmi, the only receive callbacks that
replace skb->dev (esp, ah and ipcomp do not).

For Chris: patch 2 covers the outer-skb free paths in
__input_process_payload(), iptfs_input_ordered() and the reorder-window
free list.  The deferred fragment (consume_skb(defer)), the reassembly
drop timer / __iptfs_reassem_done() and the state teardown still free
the skb directly; I left those alone for now.

Changes since v1:
- split into three patches: the first two fix the paths where the
  receive callback is not dispatched at all, the third is the device
  reference handling
- the reference is taken before delivery and released through a saved
  pointer afterwards, instead of holding skb->dev after the callback
- v1: https://lore.kernel.org/netdev/20260930090813.73901-1-q.h.hack.winter@gmail.com/

Qihang (3):
  xfrm: set the address family before the early invalid-state drop
  xfrm: iptfs: run the receive callbacks before freeing the skb
  xfrm: transfer the skb->dev reference to the input path

 net/ipv4/ip_vti.c              |  6 ++++++
 net/ipv6/ip6_vti.c             |  7 +++++++
 net/xfrm/xfrm_inout.h          |  2 ++
 net/xfrm/xfrm_input.c          | 35 ++++++++++++++++++++++++++++++++--
 net/xfrm/xfrm_interface_core.c |  9 ++++++++-
 net/xfrm/xfrm_iptfs.c          |  6 +++---
 6 files changed, 59 insertions(+), 6 deletions(-)

-- 
2.54.0 (Apple Git-157)

