Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910832;
	b=FjBAF5alnnC+VfG5Bym2R0HcLv5fRprwQ17hplvoR+mDtPqOwRY2F0+TIYBwwNodHMyx
	 00o26v2E6KdWQAGg0rbClmNnkFQBXcdax63w/722cflPxa68FrIGNleGquF616Ain/cL7
	 JXaB7A+tGwIT69K2o3dVt8jqKr1zffeL6y1/OWl4KbWMNRhxlnCLJ5Nw2POxVFJe2Ymej
	 clGug5u2mUrSqcETYsO2s9izbJT1lpV7aaH6Luf4MG50Jcs0od+ljtDerYcfoLtTxot9i
	 nrYSOxDTBlKdM75Et6yk+OhRuFS2bgQU7stFHV1YmT+WgAxMru+NagZiwo71WxZjCGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910832;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=nByc1UaEqYQlkeBG4PECRqhOC0veVzWVRqV6EubGq+0=;
	b=h8jXIKcImoRgFS8sscla70Uic1cehtWQ+LHL8hU16ZfSvYhbbeUVMu6+4/sY9p/E4voQ
	 rdeExMXE4jwwFNUyv7oHYdoZ0UILTQTuJeaB13lzrDaxumKaYsg7aOWDSHccAYgj9dLqr
	 w+Nxq0e3Bw2TJpxE92YIHrlQZHO4ATYT72zk+kWWONZcQ4V9Y7oYSabvApjdSK3BogKUk
	 cDupSdnalSGdgfmrrmJXK2llf/Nc5z6lRqCg9UnXQVzsNXJBi8inwhz5qyofLIrESNxNc
	 iHZ11fSx3lPCpEI5AE+Tb9JQpXBih+v5RpytWQtfuNRZpdGcfFKZeyI6izajvPrY1sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=deGGMriv;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72CD606A31C;
	Tue, 17 Nov 2026 10:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D72CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=deGGMriv
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 14E311A158C;
	Tue, 17 Nov 2026 10:20:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB9155FC81;
	Tue, 17 Nov 2026 10:20:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3F6C11BC05B4;
	Tue, 17 Nov 2026 11:20:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794910828; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nByc1UaEqYQlkeBG4PECRqhOC0veVzWVRqV6EubGq+0=;
	b=deGGMriv2H9lophJNoGjvuEGR9Guj8B+RbbmSlWvGq6i+YSZbfesBN7brF52V4vXyiWcRW
	aOK125HBVrTwnoqP4qHi83ACRMVcgtRz26FNwcb2+jMSbo4hgDTj6zzOwuDnC4MpQIh7c2
	ynoSxFpTVh6bl76JH/MDU4l4/0GgfsMtwHt1KmS3hw48ixJrmMTuzolwaGl6gDo3km1gp7
	EhI/4olHYiWzAfdn2JubkAG7Q2p4clfRwFuraUU0Es1IZ1qdtIhGDMCJXnIljAAH4hNIN7
	chSNNbsaGF09giX1waDtl70Fs5sl1hLeX9uZ5mGMEC0aF0Bfie38zz9SQPBslQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 11:20:24 +0100
Message-Id: <DMXES9NC6HIW.14FBO92H3XSQQ@bootlin.com>
Subject: Re: [PATCH net-next v6 1/2] net: macb: implement
 ethtool_ops.get|set_channels()
Cc: "Conor Dooley" <conor.dooley@microchip.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Russell King" <linux@armlinux.org.uk>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Paolo Valerio"
 <pvalerio@redhat.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Nicolai Buchwitz" <nb@tipi-net.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261113-macb-set-channels-v6-0-5de59d9e7f02@bootlin.com>
 <20261113-macb-set-channels-v6-1-5de59d9e7f02@bootlin.com>
 <0d65e4cc9a68684cd69ffa7feb5b7440@tipi-net.de>
In-Reply-To: <0d65e4cc9a68684cd69ffa7feb5b7440@tipi-net.de>
X-Last-TLS-Session-Version: TLSv1.3

Hello Nicolai,

On Sun Nov 15, 2026 at 8:39 PM CET, Nicolai Buchwitz wrote:
> On 13.11.2026 18:32, Th=C3=A9o Lebrun wrote:
>> @@ -3351,16 +3374,21 @@ static void macb_context_swap_end(struct macb=20
>> *bp,
>>=20
>>  	lockdep_assert_held(&bp->mac_cfg_lock);
>>=20
>> -	/* Swap contexts & give buffer pointers to HW. */
>> +	/* Swap contexts & give buffer pointers to HW.
>> +	 * !new_ctx means that the swap failed and we keep the old context.
>> +	 */
>> +
>> +	if (new_ctx) {
>> +		old_ctx =3D bp->ctx;
>> +		WRITE_ONCE(bp->ctx, new_ctx);
>> +		wmb(); /* ensure IRQ enabled below read the new context */
>> +	}
>>=20
>> -	old_ctx =3D bp->ctx;
>> -	WRITE_ONCE(bp->ctx, new_ctx);
>> -	wmb(); /* ensure IRQ enabled below read the new context */
>>  	macb_init_buffers(bp);
>
> The NULL case reuses the old rings without mog_init_rings(). The HW
> restarts at descriptor 0 but head/tail don't, so Tx stalls after a
> failed ethtool -L? macb_hresp_error_task() reinits the rings first.

Hum, so you are totally right on that. Both Tx (txq->head + txq->tail)
and Rx (rxq->tail + rxq->prepared_head) cursors are wrong by being out
of sync with the hardware cursors.

But the approach taken by macb_hresp_error_task() is wrong: it resets
the Tx cursors and Tx descriptors in the existing context but by doing
so leak all Tx buffers. Rx buffers aren't leaking because
gem_init_rx_ring() sets RX_USED on all slots then refills.

Sashiko [0] points out the same issue; I'll wait for the end of the
Clashiko [1] embargo period before re-sending, to see what it has to
say.

---

There can be two solutions to this:

 - We don't touch the HW cursors RBQPH/TBQPH/RBQP/TBQP by not calling
   macb_init_buffers() at swap_end. So here the swap operation will
   have been as close as possible to a no-op where we just stopped the
   HW for a small window.

 - We do reset the HW cursors. But that means we need to make sure both
   rings are in a good shape (which they are not with v6).

   It isn't a massive amount of work, but it still is more code (that
   might be buggy). We need to free pending Tx slots or bring them to
   the front of the ring. For Rx we should consume RX_USED slots.

I prefer the first approach. It is simpler and alloc-free (ENOMEM is
probably the reason why the set_channels context swap failed when
calling netif_set_real_num_queues).

[0]: https://sashiko.dev/#/patchset/20261113-macb-set-channels-v6-0-5de59d9=
e7f02%40bootlin.com?part=3D1
[1]: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-macb-set-=
channels-v6-0-5de59d9e7f02%40bootlin.com

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

