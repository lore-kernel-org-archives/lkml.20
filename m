Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579678;
	b=hDrHvlG0ieqRZ060w7crJ0SFatTiKHh2eTawy8jeguuHNmSAmNCQbL2v99hmd0c2BLqS
	 2trsbQEEC7OHBN8LcoddjcnPgTnh2u5xsK5aoZwxuXdKUm5TAtIyBCD/yWpy/7djUPisf
	 P8QlZdWKLaIMDTITVyEflXIitd7PeeKgwlpVJnn//TOK5hJ2vqiUdJvon1do+6zEHP2vk
	 gQ8L3cVNOihiKmzDiIuHLKqxBrD2//yVR75/Hers016471LB+Pt2M6sUECywT9xuPNrwa
	 yYAtMGKwLKTcLXftI+xK5eioGCeODRZ4jNTQ7vfWwp871rnA1oLf4XEZi7r2OfbVfOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579678;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=WEyiM5jVzOlufAoK40II4YYcsd0cpnT1mchqY1Loq2k=;
	b=UI2VypejdFTAiuEOz96Uz8yuGagOET0vwDsMC2wc8BPTeP8H7Ra1Rt8vGn5bpJ+0gZCv
	 5zWdaarHzCCPBWLKFF/X+MEc0GkScxwl16CV05xo3/Q4YVM2xAwYFGNHvDevR5k6Yk3hy
	 GF3BKSVAoAzeQbwawfuQJ8cpSqwDBeMCuuUrb7Q1H9aEWm8j1i88WEukKWUbBA+Ss/QWU
	 BxODnHObP1HJGvCS/L31nwOJX0m2mi1F4Ynm8mIkaBIhOSDx+mqrRLrkAUwdtB8AyzdcE
	 B7XSLuFzImFgyOONRYo9ug6tPkN/F71CcpvZomYRc5koWmoGSiEPufcb2+4ZvPr1piw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=g4DWlf64;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1622960A2606;
	Wed, 21 Oct 2026 10:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1622960A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=g4DWlf64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=WE
	yiM5jVzOlufAoK40II4YYcsd0cpnT1mchqY1Loq2k=; b=g4DWlf64eSz/XX8BJO
	cjF0eqrLJPQnGeFJKUz+r4OCNsQ5qxNY4ET7hxRS0Gp/mWRd/9OWLbpJ+f0kx2mC
	6i3jy0ed0ancCdTSU5OEToKbVCgwKqKuK3BqcN8UXIOVVxijuxaD8+f8g1F53X2+
	kZ70L8lXYBm4rHx+I2uXqWlMU=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDX3xM5mNhq3MNSBw--.27855S2;
	Wed, 21 Oct 2026 18:47:22 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	John Youn <johnyoun@synopsys.com>,
	Felipe Balbi <balbi@ti.com>,
	Mian Yousaf Kaukab <yousaf.kaukab@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/4] usb: initialize debugfs command buffers
Date: Wed, 21 Oct 2026 18:47:15 +0800
Message-Id: <20261021104720.4106961-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX3xM5mNhq3MNSBw--.27855S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurWUKr15CryUJr48XFy7Jrb_yoW3trXEv3
	sYkrWDXw4kuFWjq34xArWYvayUua13Xrn7XF9Iqw4xuw48Z398Zr4kCr92qr15CFyUZr4D
	Cr1fJr18Xa42gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU85Ef7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BsFP2rYmDvdWAAA3F

Several USB debugfs write handlers copy user input into uninitialized stack
buffers and then compare fixed command lengths. A short write that matches a
command prefix can therefore make strncmp() inspect uninitialized bytes.

Zero-initialize the affected command buffers so every copied input is
terminated and the comparisons do not depend on stale stack contents.

Jiale Yao (4):
  usb: dwc2: initialize debugfs command buffer
  usb: gadget: renesas_usb3: initialize debugfs command buffer
  xhci: debugfs: initialize command buffer
  usb: mtu3: initialize debugfs command buffer

 drivers/usb/dwc2/debugfs.c            | 2 +-
 drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
 drivers/usb/host/xhci-debugfs.c       | 2 +-
 drivers/usb/mtu3/mtu3_debugfs.c       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.34.1

