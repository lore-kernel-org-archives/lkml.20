Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACF64E36CA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889119; cv=none; b=aLk8rkZf4HSmDQLqQ7x8wzsEVt6CHYvLc8DWGeqE1yunm4aJg9zkIFLKHSEObFDYXUJf4yIjdT5O3myruS990klU327ntePMMekWslYCOiy6AUnFYIZI9UR5+6ZdUQTIawj9kJHo1H4hJAZ9aogdkE73CVBIOq9B3j9SbTOKFuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889119; c=relaxed/simple;
	bh=TaE9Ly6M6reX40WUzo4n5oZ5FLX4vQyvLdUI7s12ZkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LtwGgt3PXIEJesvwhvmK/4OS28J+t50OpG0ro2qqUgZNpMj8pDRaOpz0XH8i4NVcgWeZUk6WhAF+uyC0V+t0H+ro8s4egLD1HwZ97U+KJsWsZc8F5tbRL97t0I6jWJb1uhL080anxdzrJL7j+wE2TEuh4D/gKYMcu9BLQXH+DHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KIT9pHGj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LQEHY4sT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KIT9pHGj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LQEHY4sT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791889111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=YIXLaYbJVEJiIPKxdajUtKwRlZKZGxRdqRquRKPiCJk=;
	b=KIT9pHGjvLAoJ9JDFodqmbXO24gwkY9a5INw0QvV8momnar2wDowYhnhr9QnJ7jzG3n8oX
	B1AD5Cry+vKy7LpjjyZKjLBctqluktySZP7vgP3MkJNVqgqT7RiMRnnHH3aHd111q3500w
	BZph/G68ieenAfPXg3EDuLgXHVSvL8c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-JIbk8jKkPcyDnFhlIDoVbw-1; Tue, 13 Oct 2026 10:58:30 +0000
X-MC-Unique: JIbk8jKkPcyDnFhlIDoVbw-1
X-Mimecast-MFC-AGG-ID: JIbk8jKkPcyDnFhlIDoVbw_1791889109
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48b028d93c5so2023241f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791889109; x=1792493909; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YIXLaYbJVEJiIPKxdajUtKwRlZKZGxRdqRquRKPiCJk=;
        b=LQEHY4sT0JuwfdjUu9rcTh82YrbRuj9uL6CzJc94xsU+ho6HuaUK9iyDliyBgd18H7
         cIVpEzw86B8PWPhJYpvZplULgTOQIksk+Ghw42uZMHb/I6cuHeri25d/YyECbHaI3Ql5
         wp0BTX/PeyvhljmePufuwfDoO5pX2bILxWlX2Zd8d9Alz6FZmlYFIoV8iMV0UEau/0LT
         78iEhHqCA2j7jAV3gXztjsvbxgrdp/rY8jikt2fH1Z1qEMBRkWc/gwe4aIvVQoLfK0/v
         KYMlQM/7GoQ688Go7qWoWyRfpcrOYnNlSckTy6sUeMPjTfoXazxeHh4BdLxKIoJZZwwn
         WbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889109; x=1792493909;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YIXLaYbJVEJiIPKxdajUtKwRlZKZGxRdqRquRKPiCJk=;
        b=fHfOXIpxnVs0ejBvW4WHh+QCeN2lb4kJgMhqtvxNgJBHDVWsGc7icPD8eQT8IJFv2r
         GiqeVJhb759oYeCrYrnu8RCAt1pGWF60Q/KnaCF7Ns9DtaKMajSiPBFjVXe8pGr3VEhg
         SIhr9O+WXGkxqJUhV5w6Pv2i0QwgmtCM+AF/7YImhgRQ11CkZXALLtuq6ycTkYE8yGhg
         Lst7eqP+1bzuUWGlw5SncZUNjCuUUmxErdN5w5OwCMt+1sa0Ymc7/IyVI48840MHCBpu
         54/hThmlCl6WhbaZeKKf75XeFF9V23cnuC5pfeRakxlcklvGxPdJ9CFcpEjRYZ9j9OS+
         Bm8Q==
X-Gm-Message-State: AFq9FYKlhHgNmCCgX04aVEKmtNug4loMggJMkkdjUqSeKKM60FSxioGC
	umAgEwcumpMBHR9mhhVVFF5Mfn2DN9uvwrm6mYyWs8FxNQMXOIrt35cLnUm7JGssUREsc8WJ3Zc
	fmh7ZkUGACFlDG3ZO7EWKQ/e37GudLNLwAUFsEGIPYC6k15aBPFN/0ILW52zoVf0EmOTuE8Gvcl
	T3r/J7uQiQKSDppD8ZvkVQj7yU5WYiJNCalZr+OepQp0c=
X-Gm-Gg: AYBFou1UQXTvmZ/gQTDmpjgZ6OJHgOHahzw2AlhrDQg0yu6VjWJQLP2lho2C95k+wj7
	DT2hwoeQa8wYk7Ycb2cUklg65ZSoFMWN3sWmapB63EmCwyb0S2K6xxZpC2CBx1oiaOBvEMD3p7O
	FFm0irsh0I9uHFO1gHKygxhAaBERNjqazEHmB9lFESQCsE26teEl7sN/W6hybslP1/C8wJ6FIXI
	xHAB98JPpbxz7HpC25YHS4CppG9fOZd73InetWsPmKwwTkRPuxRa5Ln7QZLOZG2TyWRH+Khamcp
	BCI8Xo85dS3pAtwxAwWj6afTVaB1gk4B6XQJPXiavvzkncOhqF33mFOjHQ0ElL2ldb1Evg==
X-Received: by 2002:a05:600c:3541:b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4a18e4e9ee8mr222632705e9.32.1791889109102;
        Tue, 13 Oct 2026 03:58:29 -0700 (PDT)
X-Received: by 2002:a05:600c:3541:b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4a18e4e9ee8mr222632035e9.32.1791889108394;
        Tue, 13 Oct 2026 03:58:28 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc6b82sm4518508f8f.51.2026.10.13.03.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:58:27 -0700 (PDT)
Date: Tue, 13 Oct 2026 06:58:25 -0400
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
	Max Krasnyansky <maxk@qualcomm.com>
Subject: [PATCH net-next 0/4] more virtio-net csum hardening
Message-ID: <cover.1791887415.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

Allowing untrusted hardware to specify csum start/offset for
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

This basically does this: checksum at ingress, except in a narrow list
of specified known good cases.

Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")

Michael S. Tsirkin (4):
  net: add ip4_parse()
  net: use ip4_parse() in receive validation
  net: resolve uncommon partial checksums at ingress
  net: account for ingress-resolved virtio net hdr state

 drivers/net/tap.c                   |   4 +-
 drivers/net/tun.c                   |  44 +++++++-
 drivers/net/virtio_net.c            |   2 +-
 include/linux/ip.h                  |  24 +++++
 include/linux/virtio_net.h          | 161 ++++++++++++++++++++++++----
 net/bridge/br_netfilter_hooks.c     |  15 +--
 net/ipv4/ip_input.c                 |  13 +--
 net/ipv4/netfilter/nf_reject_ipv4.c |  13 +--
 net/packet/af_packet.c              |   4 +-
 9 files changed, 228 insertions(+), 52 deletions(-)

-- 
MST

