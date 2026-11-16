Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790590;
	b=vaaM5xOSkc7gQRcELw9ko6C+Apsnw7PeleUTgTuM3xxWO0/X98Qscx0j2QJgkb37yyKB
	 bkbxtOL+h67YndBWWvWJf0VxejXOQ5MxOaHTZTQfFNVwPZHu0n45ik2OBtbRH/F/5Caea
	 0UPAfa9biux/jzAQXqlFc4bsZWbc1aWlDjI0loC+ZuLOuTf6290eF7S7KrW5alT+gc0q9
	 oPecBBB7t/rt/IDMwLkf2vbEPt/Cknq8Aa3ydUfsHwdYzymaehWvoDaCbYt2i3TFTpsUU
	 Fmxresr9tbUsrsRuc1r2FPIC5Tenb+S70C8xexx4oOsQWVKOGvIVycvjIouL87zPoxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790590;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ko5kqGhgHwooBo9nYlQ3VK6wSF/SfHcCMRUqpSfdLdE=;
	b=arGFJ4kiMrs/xWw+aCAbqoHNtuNmB8ft/Zu/wWpSgW3kBFT15Iu2D5Qs612303Une9kX
	 uKsyKKqrTlHhpNcDl4cJAZ0TJ7NbODAoibvbpmMalTWOlF4PF37a7oGi1hj+IkrvDCNpo
	 Kc2Vkx0+uVWVwR0veEUpkBVxoX1H6KByFy8hlklTLOJqGku2xrRy3w5t2TIGh8WudcSLR
	 gwFETFcpFqJ+0jx1gtmNW9AYyoFzhwNlvykZ2b2qg7w+EqTEF/tlf1DcHxoHUicNtJANS
	 PomCqZsutgkb/tDAkronTiAmpA1Gp4mKskdY5tG5L2KYnbQKZWj6weuSEhrjvddxuQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=owGlM0jW;
	arc=none smtp.remote-ip=109.224.244.118
Received: from mail-244118.protonmail.ch (mail-244118.protonmail.ch [109.224.244.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D330606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D330606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=owGlM0jW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1794790587; x=1795049787;
	bh=ko5kqGhgHwooBo9nYlQ3VK6wSF/SfHcCMRUqpSfdLdE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=owGlM0jWwaqkpXgm/k1/8swIyyO346F5NBnAOPAAYs2fa2vSz6bMS2Tu18dJtF3/k
	 WXARs5Q72JWoNXbiRVjtcCVmLuMmOKbMYSOqfXAki7nLELIMCqPQ2CDhBIUAqWUU6C
	 x4v1Be9HLIFJpG/9YcHb7aPqhBqwcoKzg3oEdUpERshfYENh5T47LVl578mQ5pbNjy
	 2trSrDNXEKpjTqfxsyM4s6JVL8O4/nLXU7enr/LYKTD9BPPq9RrAKsF0cGR8NJEEzj
	 GBb9K5Nj8hSDr+ewB4JddqDOmHdH2q6vSmtmTlLFjT9I5JodLYqThd3M0KSFk8UJqV
	 f0/byopGGHZ/g==
Date: Mon, 16 Nov 2026 00:56:21 +0000
To: Alexander Usyskin <alexander.usyskin@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] mei: allocate client DMA buffers on the parent device
Message-ID: <20261116-mei-cl-dma-parent-60802f47@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 523e79637488fe821cb55ccabd4dbbaaef135987
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
Content-Transfer-Encoding: quoted-printable

Since commit 7704e6be4ed2 ("mei: hook mei_device on class device"),
struct mei_device embeds its class device as dev and keeps the PCI
device in dev->parent. The DMA ring moved its coherent allocation to
dev->parent, but mei_cl_dma_alloc() and mei_cl_dma_free() still pass
&cl->dev->dev, the class device, which has no DMA mask. The allocation
warns in dma_alloc_attrs() and fails, so mei_cldev_dma_map() returns
-ENOMEM and iwlmei, its only user, cannot bind:

  WARNING: kernel/dma/mapping.c:639 at dma_alloc_attrs+0x48/0x300
  ...
   dmam_alloc_attrs+0x5b/0xb0
   mei_cl_dma_alloc_and_map+0x152/0x6a0 [mei]
   mei_cldev_dma_map+0x77/0xf0 [mei]
   iwl_mei_probe+0x19e/0x6b0 [iwlmei]
  ...
  iwlmei 0000:00:16.0-13280904-7792-4fcb-a1aa-5e70cbb1e865: Couldn't alloca=
te the shared memory: -12

This was seen on an HP ZBook Firefly 14 G10 (Intel Wi-Fi 6E AX211, CSME
16.1) with IWLMEI built. It went unnoticed because IWLMEI depends on
BROKEN.

With this change iwlmei binds and the Wi-Fi handover between CSME and
the host works on that machine.

Allocate and free the buffers on dev->parent, as the DMA ring does.

Fixes: 7704e6be4ed2 ("mei: hook mei_device on class device")
Signed-off-by: Andrei Rusu de Castro <arc@empyreal.works>
---
 drivers/misc/mei/client.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
index 26d2b2742d50..a0f698b5d296 100644
--- a/drivers/misc/mei/client.c
+++ b/drivers/misc/mei/client.c
@@ -2248,7 +2248,7 @@ int mei_cl_irq_dma_unmap(struct mei_cl *cl, struct me=
i_cl_cb *cb,
=20
 static int mei_cl_dma_alloc(struct mei_cl *cl, u8 buf_id, size_t size)
 {
-=09cl->dma.vaddr =3D dmam_alloc_coherent(&cl->dev->dev, size,
+=09cl->dma.vaddr =3D dmam_alloc_coherent(cl->dev->parent, size,
 =09=09=09=09=09    &cl->dma.daddr, GFP_KERNEL);
 =09if (!cl->dma.vaddr)
 =09=09return -ENOMEM;
@@ -2262,7 +2262,7 @@ static int mei_cl_dma_alloc(struct mei_cl *cl, u8 buf=
_id, size_t size)
 static void mei_cl_dma_free(struct mei_cl *cl)
 {
 =09cl->dma.buffer_id =3D 0;
-=09dmam_free_coherent(&cl->dev->dev,
+=09dmam_free_coherent(cl->dev->parent,
 =09=09=09   cl->dma.size, cl->dma.vaddr, cl->dma.daddr);
 =09cl->dma.size =3D 0;
 =09cl->dma.vaddr =3D NULL;
--=20
2.55.0


