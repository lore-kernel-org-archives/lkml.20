Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794726784;
	b=QLZ/NberFhmyldJAFoTg/xm1NXMAeTyDOQJNxfDnuqm/TAEhJvf6ocdXGkS1ZUw7aQth
	 WnKu08Rnq/zil/gZ/MozA1/PftrT2V0ixKseRSFRgTq2d9mAs5HFQAX3V1XO/RPhaDcFd
	 KFkx7Ih0qpOfyC7L9RNr+D4W3ro4FNGgSy5sCWH1U+gGJY+RJM6jaYarDv2YeiUUeZpRv
	 dnTD+GgcjlB8sDtPXC4JGXxIsRhsChus82BDYhGYR3CkIKRm0olh5qmBoy5rCNI4QzMp+
	 JsMoDS73MFKzcjchedobiG2iUr8wDTctChtbLuppGRlh8S+VbzcLYxgsxlpF+Cmceww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794726784;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vuZUVGeksjaM3h7mHsO4bBjAJIcJ89o8RP3K8dhbMg4=;
	b=D4zEOrjX0vsZJtsWIx60oMkNj7j38bHPqhYBqUkGGz7VxaC04cio/sJH5PmgDu4f7Ddi
	 yxZrMWwHg0T1iJOZHZC2ZKABg66TOPy0UMWI7P4n5Ptywp0D28Pu08KdLyABebCeY4ow+
	 GLf+6DoxBX2PDkmkxYNkI3FiLt6Zs6R/HSg4a4jD9b2WechwK/Q9iBirOz38uwhSdiTPE
	 fxP2RmO1TlAXY/W/gImdm3DeGXOLEvJefaAbklsbWZqyYgPCRN3MJdWNX1IEQHxKfx6eq
	 2PvNpJUv/cQwyT2N9WIwjfniKIf2rGvKVW6x5mOI1Yz3d1gEl9TjYmTt+ax6+GB2xAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=mBVTxcPk;
	arc=none smtp.remote-ip=43.163.128.54
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.54])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B045E606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B045E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=mBVTxcPk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794726776; bh=vuZUVGeksjaM3h7mHsO4bBjAJIcJ89o8RP3K8dhbMg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mBVTxcPkx6OulJnjfnyG+r2L2/+8bRLU2mNXRXKcPitxfzKbOwpSmKA8hVO77wJR5
	 a16vcluzuBL4Zj9O8i8hA+jcL/6XyGTT8QzouzskAAinoSJeLGBI0B+jqdDiQnkCWD
	 a+ghOdSss4T6F9aJCdAYYwYYAfyNnaBqMA9qbGD8=
Received: from ubuntu.. ([112.3.92.91])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 331A3A28; Sun, 15 Nov 2026 15:12:49 +0800
X-QQ-mid: xmsmtpt1794726771tum14ob3x
Message-ID: <tencent_E27D0F1CA04EE58A5873E5A4EBBDCDF8C80A@qq.com>
X-QQ-XMAILINFO: NMiAo2azIaDAW5+IjjMFFIGcEI025b2QqjSkDGS1qobrC5TTKyHeKryYKOwjyP
	 NY/THjFavgpatcaPuUgURuMt7obA7DSz/ePWu9ZMrsgbdpQfRH5IJfA0+0Ce6HHsB3oFsc29XneF
	 XYws71zQ3BpFyRKsrLJj2PhjXVAieTBBDpCEMd/CPiDHB2hlwyvwvxoqpdghLXBx/B3H6bw+c5zj
	 yzN8GQsGPanVvB6XPswtQkQHjhtL36t9mA3EKHHOVDp37h39w1H0PA2W+Vy6ffb3jp3vdI/ZWS30
	 nBEhM+F5IT1FlJkj7X4smYFhOE9R8fvGejJ172M2NT5UehuUF3otjIsZVtio2cjJlJVxA9SV8gDI
	 Ndccfh7WMHGpsDWm3YTV/1VyywtPhR6JOZjkacEhNaTjtqcbxZKICyCdrZBYCX5DORjsIbBOBYlP
	 /5aIn/Iqjv9rFAgqKCQFgH8FUc7dNJIOaBDkstFLDr/fepO+P5FAtHvtaa1yIag9HHbg6fFuahkR
	 L1chNaRHZvbhOFSOeNnIKUCrYtMwPVf53MdmNoT7upUSodVJK7kh1nCtOXqoITU/zae7+kArP2nF
	 w8FdP+PShqt8HLohscN3idXLuYCCbVcOhcXVMPMqa6d/7Pbs95x9VhgksHR2fiMxx0q/K3vPMZAB
	 /RdhGwtcRB3m5Bgat2FAl8OWCqHPMcW9PsxyD8gG+kC25/wlDj/C8hmnNhPI5vjU50pq/IRqeOux
	 P0CrTzm+hG8AMdUdNtDsMN2iNPc2a6fKZ2OQAXagdBfYjCM9dWdx8s01BHgk1/1dsb/RHEDtkHT4
	 fnQ65hreK1rZh2kF/mlAA5+MU86aRlm++KRt/WbmwJ1S/UhiH5PJBOBUY30+SBuo4gInOZeCffqt
	 CQaPjoGonPa/68mOhkMt27H80UvQekPhiGXLF2U64HP3fg8jK4HOE5ncrYgwF5YLu4AWz31KlHI9
	 lWLuh/JmDRQNdQ5CtQFZYXA7vwOF7++2O4KIuabJNSDz9Q7su3Gbo1GqU8+Gtx7VGw+rgc03PbBU
	 iFdTcjTp7EgS3dZ7JJEQmhhqs+WiujuGDqyOa1YAASGoSPfmRUTQ+9BHThDiLuI02Anuk/0Ecc32
	 2iesHRoQY0OzynL9Y=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Congjie Zhou <zcjie0802@qq.com>
To: netdev@vger.kernel.org
Cc: mst@redhat.com,
	jasowangio@gmail.com,
	eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zcjie0802@qq.com
Subject: [PATCH net v2 2/2] virtio_net: mask callbacks before releasing NAPI ownership
Date: Sun, 15 Nov 2026 15:12:46 +0800
X-OQ-MSGID: <20261115071246.9096-2-zcjie0802@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_AA4F39DA7ADE330C721C03AAA832B92DD608@qq.com>
References: <tencent_AA4F39DA7ADE330C721C03AAA832B92DD608@qq.com>
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

virtqueue_napi_complete() prepares callbacks before calling
napi_complete_done(), then disables them if completion returns false.
On the hard IRQ deferral path, completion can release NAPI ownership
and arm the watchdog before returning false.

A successor poll can rearm callbacks and complete before the old caller
executes virtqueue_disable_cb(). The stale mask then disables
notifications again. If the one-shot watchdog has already run, no NAPI
owner or timer remains to consume later used entries, causing a
persistent RX stall.

Use napi_complete_done_with_irq_mask() to disable callbacks before
completion can hand NAPI to a successor, and remove the stale mask after
a false return. Keep virtqueue_enable_cb_prepare() before completion:
moving it after ownership release would reintroduce the RX virtqueue
race fixed by commit cbdadbbf0c79 ("virtio_net: fix race in RX VQ
processing").

Fixes: 6f8b12d661d0 ("net: napi: add hard irqs deferral feature")
Signed-off-by: Congjie Zhou <zcjie0802@qq.com>
---
Changes in v2:
 - Add the Fixes tag to patch 2/2; no code changes in either patch.

v1: https://lore.kernel.org/netdev/tencent_74EA7A2E8BF5758E9C5EF18C9B1CED401D06@qq.com/
Bug report: https://lore.kernel.org/netdev/tencent_AA4F39DA7ADE330C721C03AAA832B92DD608@qq.com/
Discovery and validation: https://lore.kernel.org/netdev/tencent_4DBDF69909B9FD811F54F2DC0E6BAC1C0507@qq.com/

 drivers/net/virtio_net.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index dd2c41ef6..0de6bd95a 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -727,19 +727,23 @@ static void virtqueue_napi_schedule(struct napi_struct *napi,
 	}
 }
 
+static void virtqueue_napi_mask(void *data)
+{
+	virtqueue_disable_cb(data);
+}
+
 static bool virtqueue_napi_complete(struct napi_struct *napi,
 				    struct virtqueue *vq, int processed)
 {
 	int opaque;
 
 	opaque = virtqueue_enable_cb_prepare(vq);
-	if (napi_complete_done(napi, processed)) {
+	if (napi_complete_done_with_irq_mask(napi, processed,
+					     virtqueue_napi_mask, vq)) {
 		if (unlikely(virtqueue_poll(vq, opaque)))
 			virtqueue_napi_schedule(napi, vq);
 		else
 			return true;
-	} else {
-		virtqueue_disable_cb(vq);
 	}
 
 	return false;
-- 
2.43.0

