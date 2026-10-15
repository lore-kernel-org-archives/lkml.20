Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0A65208AF
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068083; cv=none; b=lelNgF7/a2igwp+hxwWcLqF44+5JUucfUMyQdoPKx5K8pakL1u5S0cudaEoFyQJkiVwONJOlVrfpZ63AkGWm0M4R01m1HSvSeHVr0yZy+jZ9aHeLVwzomGVRQTbeoM459jIe9hvzfX+xQxnocLDEHiFQwnyAK3OuZE+BpFjePiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068083; c=relaxed/simple;
	bh=ULFAxBtXFUyYxoYoJoEfrtH9PizTTVRo0tYPLbXLjgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nwfRWF7mvSLnMjTKi85V3JtLJXgjQvr5pRvTdwEU40UTS0KFEvIdOt1WkZevSv+saApJiIb6hOqBT+0FH/wyDEDDdo4YCqHpn7Yu+s4V591Egf07DvMyW1W0Jx6HQwM8mi3vI4qNE4191pAUK2hB4Gneay15QHr0DLVmhUoFXcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HIpn2tBr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KEZZWyc/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HIpn2tBr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KEZZWyc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792068079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6+E5kAELX03rlqVLLUN+DuDipBZlXtEdhg/J6E2iFuo=;
	b=HIpn2tBrAY95ypcZVMIKk268vqtjZ4qJI8xEsLnd6ayxF6mWpENTS/8foKaXnm1E+/4m13
	RAztzDnJWEelQXgT4twAyhP+AIaeLylBn99AuSwhn1dNjxG12aFOWulkRb6Zfkm6Bf+Wo4
	aTG4Lg0KOsMVSm4MIblHTDOw3gXkusM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-NqMkeSoTMdGWvT2n_L64yg-1; Thu, 15 Oct 2026 12:41:18 +0000
X-MC-Unique: NqMkeSoTMdGWvT2n_L64yg-1
X-Mimecast-MFC-AGG-ID: NqMkeSoTMdGWvT2n_L64yg_1792068077
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49febef74e3so56681165e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792068077; x=1792672877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6+E5kAELX03rlqVLLUN+DuDipBZlXtEdhg/J6E2iFuo=;
        b=KEZZWyc/0uRR5Lh7FBRSpCcSpDlBk1rbDS5fAGCU5S5ejlTlNnCb6Pr2T52clLLxJw
         yE7DPLAEc352ayfIAxXFfNxHr3tR+WC6C6Nf5W1gEWJgTSxp7IsolRplQKdx3rlV2N60
         qy0AIm3u+ZHwWITeFbnsdSZxLBhWVRLpVBTq9ZnbH1G8NmOEUU498LBCN18/Ai4u1MCL
         6/KoE9KwOv/94ExRUcx8XpAvnQc+5a27B1zunQNwJlVZqzJjTga4Z8fpeqkqYjVpIAf1
         3QSMG8GkldUzMQPABLsdWqu/cyFDFLCH9/smwvgjslPJ3I7NirWv776ImOstTuolTYtm
         HFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068077; x=1792672877;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+E5kAELX03rlqVLLUN+DuDipBZlXtEdhg/J6E2iFuo=;
        b=Owztr/wLK7SI2GKcsjNY0+HucBga+LRv/La0GcQ3ECuU/xCcV6D/tW/WUPt5sdSKz0
         0TOG7UtDEAay4g9jTkfJIKF/nvT0L8zLE2b9UZ2RmxFzmgvu197J125wh1Tn8n7S65gD
         8WX2LkzsTmLfJSNFV3630unHIg9hAYVnOPHJO5R9Z0hmxmVUI7JDbIrPFMJUHagE94Fv
         oF87D9MMzLBtpSSEXfn8DXtkrbctsh0se4tpJlVS7xNJnpaOBsfE2pNePUNg5Lm7qzDo
         oliBRByT61NnxoIMpG5zdBYIyWlbXNPl3mHsh4yRLxnr7l+hAqHsx/Lj45L+cmNce79q
         HGwA==
X-Gm-Message-State: AFq9FYLZ8auhS9gD/E0bx2f5qZ3NwMjIaL/GSN5GWjAwSZvwiYKJl7K/
	7VC4Rijmy8THXdKq13f4TbIFaga0I5xB6TPqp17Bc9DT10QWl/5A90sU2qCqW9+u75rGBjNRlWI
	/597oDZ7ewxz6NJG5Pzp71kXT8M6oT8jsbvcRCbMyE1UP6VeJ0XcOIbdGxaVKZSsmXOM0L1vnAL
	DAMd+xF7P+VUQPdVV9B0inaCWr6oX3/a5FuIJub8y7jUM=
X-Gm-Gg: AYBFou23L8fUXCIqDF4ANvn/ZyIepmwkRHq7lwzNzox4PVQeOjYh4eVmXZH0/aCu00N
	ajzBT52jthDRmygL8wqS9ERhy8fN3SSqZHotnGSgVMGr5hjz++Au+3mAbjyAkDpkJLIXAmA/zR0
	jryT57IxDJtYTCkatYmzgNPqtR86+LcuRIFE2JeLGOWQEyy7jpS/Ov4Ud7AOUJWXDMSHInhI7+9
	gTzaUCQVuOK2kPBNvnQwaK2KMivDejR6qw7WZJu+bYGwZMhGWGdh8RQJ7F/P6BMeEAKV3G4T6Lr
	/VpL92Pi6tH1+xeTBx/x4/41GKzw3ujsYVp+bM67u70fGlr+ehQ56dHof2g2Tj5ugRTt1Q==
X-Received: by 2002:a05:600c:a011:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a18e447d8bmr371387065e9.2.1792068076630;
        Thu, 15 Oct 2026 05:41:16 -0700 (PDT)
X-Received: by 2002:a05:600c:a011:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a18e447d8bmr371386275e9.2.1792068075878;
        Thu, 15 Oct 2026 05:41:15 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm78912855e9.11.2026.10.15.05.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:41:15 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:41:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Rusty Russell <rusty@rustcorp.com.au>,
	Max Krasnyansky <maxk@qualcomm.com>
Subject: [PATCH net-next v2 0/7] more virtio-net csum hardening
Message-ID: <cover.1792067836.git.mst@redhat.com>
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
  net: account for ingress-resolved virtio net hdr state
	- accounting, not the fix itself, dependency of the next one
  net: resolve uncommon partial checksums at ingress
	- fix itself
  net: add a sysctl to opt out of virtio net hdr checksum validation
	- reducing risk of the fix by adding a sysctl to disable it
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


Michael S. Tsirkin (7):
  net: account for ingress-resolved virtio net hdr state
  um: vector: honor virtio net hdr conversion failures
  um: vector: trim skbs before verifying the header
  net: resolve uncommon partial checksums at ingress
  net: add a sysctl to opt out of virtio net hdr checksum validation
  net: add ip4_parse()
  virtio_net: cleanup protocol calculation

 Documentation/admin-guide/sysctl/net.rst |  15 ++
 arch/um/drivers/vector_kern.c            |   6 +-
 arch/um/drivers/vector_transports.c      |   4 +-
 drivers/net/tap.c                        |   4 +-
 drivers/net/tun.c                        |  41 +++-
 drivers/net/virtio_net.c                 |   2 +-
 include/linux/ip.h                       |  24 +++
 include/linux/virtio_net.h               | 249 ++++++++++++++++++++++-
 include/net/netns/core.h                 |   1 +
 net/bridge/br_netfilter_hooks.c          |  15 +-
 net/core/dev.c                           |   6 +
 net/core/net_namespace.c                 |   1 +
 net/core/sysctl_net_core.c               |  54 +++++
 net/ipv4/ip_input.c                      |  13 +-
 net/ipv4/netfilter/nf_reject_ipv4.c      |  13 +-
 net/packet/af_packet.c                   |   4 +-
 16 files changed, 404 insertions(+), 48 deletions(-)

-- 
MST

