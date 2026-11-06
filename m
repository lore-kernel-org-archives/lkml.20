Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793988218;
	b=jSJqRFeiMVa/qhqfEX8zNqlNUh99OnhU4nciTO9aXrp/qX2gvmuCbTi7/qqtW59uWALt
	 W/DRG37ZYoMG+x6zauoLvNKN/1PxrYr8dWB9DqqFYaGS5RHxFHSotifyNFVn+2PpQ8GGG
	 GnDKLsBcXC9jJZDdHmf6HEMWv+4g5cwT7//V/voEguI90GTSriA4Rv0Z4+ENOgCEWkDER
	 dz7PBlHDPtxhN+YNL6hAqRsNhhygUxUAGeHW8Xj8E5jNukTP3CWHDzQy8Bvlh9PhuYofl
	 9139Dnx7EjMQsNvyMWEl1RL2PKtImZRP+nZVBtiB4lAAoKh8qCivsIVTfEixcyWsD/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988218;
	h=DMARC-Filter:DKIM-Signature:Date:Subject:In-Reply-To:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:From:To:Cc:Message-ID:
	 References:X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing;
	bh=SiS3p1Pdfw5SumEsCCsXq+4z7US+NPjbCfUp1+4kB04=;
	b=eSiDD0HPbaVHTn+MEnpuY44ZaGrm1s4CvPeHtKmc6cJhv4EcS3VO24U5BXGJgewXe2Us
	 DezvvOtIUtj5JTB7OLOBceObxggF/596Ig0cJKOkzUK/o4PqkyR9pS1i5ct0smJzpbYaL
	 O7xj0S39L8hEmjaTl17Pu7bjObl1Ytyxdc0bJ5QhtCSuJ7uqwPncb4H1JDmBEdaEtM+Ag
	 FbIQHS5f3sahFGDrKvZUfobQv8izM89cBsjnZdz5AqEQnC/PrX9TnjRosY41/PjploISO
	 qjyMBW02E0p/IoOJYpBxhAuzVOQEESyttF7Yp4KQU9T664ra97yksdHcp7p5VTWVc5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=eldare.de;
	spf=pass smtp.mailfrom=eldare.de;
	dkim=pass header.d=eldare.de header.i=@eldare.de header.a=rsa-sha256 header.s=dkim header.b=KP2eeTp2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.170
Received: from mail-200170.simplelogin.co (mail-200170.simplelogin.co [176.119.200.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC1F606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDC1F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=eldare.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eldare.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=eldare.de header.i=@eldare.de header.a=rsa-sha256 header.s=dkim header.b=KP2eeTp2
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1793988216;
	cv=none; b=quUhJV9d3yy9K+FEApHYR7ciMbPiTamAADIdX2+IWOAFoG7ScE1Ey7OA0g88+7ZWx+kZhfyRwzgZixHUSvtK1ff24djauHJBmL5iAFfa9UqkxAaXfbOogXzzGnYZCFvspqgWcaQgMnEa95bOZociku871hifAss5psuD/ljg061ChH43L7gpcKL0onhfUCy3JPFfujuh30dHfbhV34O8KRJEtPXsX2nO5BJIEcsW3Cx2Ld+yIwYG8lZUXUW2+RCV4KpEXckwyzG2NwKuGm7bvOotgte/dz8rJ6anDZf5ok2lSAHCD9x/HQaelDLFwGFVwiQSTSPMdZXiOZpSacnsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1793988216; c=relaxed/simple;
	bh=TkX1EUPzM5jpig3x/0OdpL9Rw6sv05DAS7uiaOgULNc=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=oMEf2ZWAh8QklSavBJfY5XiNmvlpK26N8zBIarMKovoaAc0V1arnWFAGyWmIXkIc5Slne6Qux/QSDdDhdJvyGLFFgcFX6s2Ub1ro1+rSOIrT4GPFryHY7dlIoWDP1KXvfROUY3wHpMJR8LuihmC1xXGqtZzEuOT/QcrAHpzIOoQvFZXClOTMmskyl2IHyKgNBzln1jalomo5C6N4ZZ8IDWZ3eUKhvwPyxMx+Js9BTxYUzl6xp9jSM1lP3QS1mQOjDciehfQc7IDcFupOHSEQwqQjL/plzDnTFhUq4OqIOLdY294KtAeO2nq+SeXUZq9XKftoOs68hnzbfmYBT+uTQQ==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldare.de; s=dkim;
	t=1793988216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SiS3p1Pdfw5SumEsCCsXq+4z7US+NPjbCfUp1+4kB04=;
	b=KP2eeTp2OQJg+ZiY0Vu0S9rtbW25ahL3NatqAUvsEO9eN4t+z7WfnhRzAp2qbxATbvFjoX
	QuhXMtabjqBQ8Qa+WtFRo12RPXos+ta71hy5fCRdG4qtOA81XQ1LUGgPa7O2NMer4JomQB
	SqjwAUSsTvyB0rW9q/+6vp9+iCzbr7w=
Date: Fri, 06 Nov 2026 18:03:21 +0000
Subject: Re: [PATCH net v3] vsock/virtio: clear vqs[] to avoid a UAF on a
 failed PM restore
In-Reply-To: <auxVKMavkOw3Ia-6@sgarzare-redhat>
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
From: jrmmhm.kernel@eldare.de
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,Bobby Eshleman
 <bobbyeshleman@meta.com>,"Michael S. Tsirkin" <mst@redhat.com>,Jason Wang
 <jasowangio@gmail.com>,=?utf-8?q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>,Xuan Zhuo <xuanzhuo@linux.alibaba.com>,"David S.
 Miller" <davem@davemloft.net>,Eric Dumazet <edumazet@kernel.org>,Jakub
 Kicinski <kuba@kernel.org>,Paolo Abeni <pabeni@redhat.com>,Simon Horman
 <horms@kernel.org>,virtualization@lists.linux.dev,kvm@vger.kernel.org,netdev@vger.kernel.org,linux-kernel@vger.kernel.org,stable@vger.kernel.org
Message-ID: <179398820999.8.18191536850628408290.1752255756@eldare.de>
References: <20261104-vsock-restore-uaf-send-v3-1-d60d06488b57@eldare.de>
 <auxVKMavkOw3Ia-6@sgarzare-redhat>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1752256235
X-SimpleLogin-Want-Signing: yes

On Thu, Nov 05, 2026 at 11:19:23AM +0100, Stefano Garzarella wrote:
>On Wed, Nov 04, 2026 at 05:26:43PM +0100, Jerome Mohm via B4 Relay wrote:
>>Clear vqs[] after del_vqs() and when virtio_find_vqs() fails. Return
>>early from virtio_vsock_vqs_del() when vqs[] is empty: a second
>>del_vqs() would free virtio-mmio's IRQ again ("Trying to free
>>already-free IRQ").
>
>Is this an issue or just a warning?

Just a warning: free_irq() finds no action for the IRQ, WARNs and
returns without freeing anything. That taints the kernel, and panics
only with panic_on_warn or at kernel.warn_limit. v4 says WARN in the
message.

>>+    virtio_vsock_skb_queue_purge(&vsock->send_pkt_queue);
>
>I'd prefer to move this before the virtio_reset_device(), because the
>comment on top of that is related also to the next steps (detach unused
>buffers), so having this in the middle is not really readable.

Sure, v4 moves it right before virtio_reset_device().

>>+    /* After a failed restore no virtqueues are live, and a second
>>+     * del_vqs() would free virtio-mmio's IRQ again.
>
>What will be the issue of freeing virtio-mmio's IRQ again?

Only that WARN. The early return is needed anyway: with vqs[] cleared,
the detach loops below would pass NULL to
virtqueue_detach_unused_buf(). I'll say that in the v4 message too.

Thanks,
Jerome

