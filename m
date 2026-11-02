Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793651908;
	b=v13Hg+YIj7uVlWiuYUNChS6ul5IjQGbQo+WT/GzDGoDYqUy6vVxbV7JN4n/PTgy0yUdL
	 6Qpfqte+8hgDHIR8J5ramZGtEQEnAPOGgLh1Js/fGbOL473nC3KGbtTVht8Lnq16eaO3L
	 HP3Ai8JkBuD5w5CcfiXz7sbLVfwFSPfqc2ZmUvBpm1bywbphKKMZDQOCV23zJd6/6ldo1
	 /ND+OvLkmBDs0RrNfCnH0I652wdWREWxtfq86Cu5tZtmImACP8BNuac0zDDflfPZhpjy4
	 qm/nW9x/mH7jKgJ7kKoZIOA0/CD27j95mDd97+bkSZVrwDNNeORMQjazZE95TBv1UhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651908;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=DDP21sO6dH3L6F1rpSILTUYDUuHIujf8RdZUCMtfKH4=;
	b=y2fe8f5qddsiEgKr4yTrKVOwup8ATd5WCQhOIjTDQlDHh1u8KkINmcQbK9SivM44gtlN
	 mlvop+IAfvlek4rolrQy4ugvWpEon333it9rggvroy9eRtFZHw64zwNkE8StVq9FuJhfR
	 Y5k70LWE4XmMNTHfqeHL1udh3NeOLWvLCn9hb++nQK5vBM/Q0lH96dFVm2h2CQSUQh+Lk
	 rTmzZcoKnImCxExZe/Ntm1LG+x7xMXUaX36sJmGMk7SEoYoMVodB2EuDvx8ch0RS4w88d
	 OxjMuw0ISTKBqOLvjHNo/1LnHqpmAbKPnFAMdFpYKDcInIS4Nqu5ho9Agd/1D+EnRJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Orpr6pRh;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=l+l7dAy7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9B2606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC9B2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Orpr6pRh;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=l+l7dAy7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793651906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DDP21sO6dH3L6F1rpSILTUYDUuHIujf8RdZUCMtfKH4=;
	b=Orpr6pRhK7kcku8CgLLWMo81N3po0RwlklhFgckAvLDLoVABTMUka0hfkJmHGfS/DNPgXg
	mKU98D9+PVq2/RteVQyCnVRrK3Bo2an0F9PcheUoNWs7uxt5le3l3D36nUXo2Xe3+SEoUi
	qva6xBhQhIu/s3lA5TbGTa76Arrqmpc=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-pyP7Q6ZbNGG5L19avof4DA-1; Mon, 02 Nov 2026 15:38:25 -0500
X-MC-Unique: pyP7Q6ZbNGG5L19avof4DA-1
X-Mimecast-MFC-AGG-ID: pyP7Q6ZbNGG5L19avof4DA_1793651904
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3ab2f8ce13dso164331fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:38:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793651904; cv=none;
        d=google.com; s=arc-20260327;
        b=Mcq2l4E6Dy0Ne5m7+kpEyPuaFPZEZ2kfPTCY/NfEIStuShrS9ts4v05GPW5dXmSkgP
         GJftJus/nCZ5jmhqs3AkM0Xlw1nDNX8V6Wdk08GoO4ELkkDAwcc/+KWZk/VTFFRwyH61
         JUiuVBwwFH0ewVJQLw4fruo8A1AS//1bqzuW4/4l/ALm9kFFTlNKZnQIQws2OtbS1q7s
         cvYaH0ovB6jh4eQNLyLuJSylT1yWejUnGorOq4BY2zll0/oXzHKr4gjByfa7V8P6mXTU
         TGTU4Wtotz4Ek7oMMEDpg4Kgq+6lwiEjWs9b2d8kiwmPIUeRCtRc6Rg6qglyM2b47ZiU
         dN0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DDP21sO6dH3L6F1rpSILTUYDUuHIujf8RdZUCMtfKH4=;
        fh=LieLvDdkwxsIxdU73Vtj04o4vDZ7F2t2T9LtAbuqz+s=;
        b=BryNTt60Mx9LleupEbGkINlONnpWEBHUBTSid/BfNwkC5RCbkb1u+hF9rNGDdmPBRO
         LhXfYe23iEw3Ll0cKi9nKHEYPOsD5tijeR1IyYRK6Aq8ioGZUHQPIW0savg9jWX1ppCB
         Na2LWs/39HCkIQYa0Vj3BBjObwu9R9vAiDiZmqPo+r5rEWe4z6G79hVdt1CPfGIxECwO
         9mqSIbcngcBf33reJwA6WU6fKL3OzUCbqCTPEK1aMLrisN8wCfqaiVF9bl+px5noCdqe
         jaBGA/W6bz7uRCLEw9GGJkEAP+BdF78crkTkTQH/AOtK4Byg7d+7xF2fme/EjJYdJdl1
         X1KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793651904; x=1794256704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DDP21sO6dH3L6F1rpSILTUYDUuHIujf8RdZUCMtfKH4=;
        b=l+l7dAy7uv754pj4BX34aMOCrnvnA0+OA3F7KwfsPkoZFRDlYEvHOYzikikmS+fK3M
         lmZsyY2ffNeKYxEPEVpTDxR5PXligoRW9Wn3INOWzVTw8ESjZirwpv28ZCYzI9X05xIr
         2+qD3Oo8TJe05RR5x/0VsyF9pXwyxSRavXN09FFLQ+yzOkw6KhbDM/UksPfi98wfhal3
         eI2UTcc0wd5RI4FtECyIqi5WDyFeFi2If/h4QVWZgMF5GzFlr2cFHGus87+54vSd0XEs
         Cuz/9Rs2oyvs0XMQ38RSZRf8GNQ+BSW3x++/HCzsL4MLc96vtGaxk5D73zwBCNiAsxhM
         4e0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651904; x=1794256704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDP21sO6dH3L6F1rpSILTUYDUuHIujf8RdZUCMtfKH4=;
        b=K5IgeF8AG4tv7lh2Rqlsd9xrC4YAOBCw+Lubzl6i7zN08I7DnJeSztFxQ9KinD0htj
         44WmXJMPEpFobsMnyx2u+eR6PIOhKVGMvTrd0HwLNSF5OpSetmFqXkpvboBN5O9nCpQN
         s7nUr4IR7FPO2chvJGURuuEnXfsnVeMhM8FL6egHTwGeJQ8Cil1hQSmECemWsstE/7Dh
         mT0m5bQkUE0IwvCIfnweLeF1kdu0d9wwmbnrkZKnOgk8NOb0HyXmlY0k1lK5V6bJguuc
         0fHbqPR7o2yoHz6ivsTj7vkVHBszd/hIxm9yHOJSdHhqljFAFZlEGdBwBUCaLzO9wexo
         oL7Q==
X-Forwarded-Encrypted: i=1; AKwUvByOFHWxInTZesGGSdjjpBWB9X7MVMOUZnHyji/O1JiYdI/xTEwW7x2XJ8zRcjP1yht55I2TuJosFCIDZ5U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R6nvi6rLQFH6rt9zQiWjDxMlIj6Ndn3oMBYf+G7vZGyrkgrKB
	4fDVJg0ACyVRD1aGwII8ny5WembOjHv0N5RMFWCdNfZ/VzyDkY1odhyBFXJ0iXTbWqpni9R2C8Z
	rt4RLj4aex5WtPpzXcVDU0mDpIi8OXUN5OFcFKIkpEmfKOPGcYywmpRjsCFp5ru0EDw2xefz0Vj
	kiSJR6vdR3RjnFJj9kEI/Np35K2epOzHdGoaPCwmuO
X-Gm-Gg: AYBFou22TJ7afMqp0ktQH4sh53Sqn0E+toHaaVD7BVLZbsOLu2QDYd8KahddPHHo8+e
	DtCzrBWWS/RVuF78crUlGdPZKMJ41La5wy85i0Xj+m7r/DSwpV6TaGzX8jVL8F4uWK7xJxUdFXq
	nIicC8kvYCp/DGjJgX5qb7wDHMmKtCx2ar0N1UisXgZh5mRIMa2rjQI1ZS
X-Received: by 2002:a05:651c:553:b0:3a6:5c8f:857 with SMTP id 38308e7fff4ca-3aca57a559cmr30300101fa.8.1793651904091;
        Mon, 02 Nov 2026 12:38:24 -0800 (PST)
X-Received: by 2002:a05:651c:553:b0:3a6:5c8f:857 with SMTP id
 38308e7fff4ca-3aca57a559cmr30300041fa.8.1793651903708; Mon, 02 Nov 2026
 12:38:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019151627.3324886-1-ameer.hamza@truenas.com>
 <CAK-6q+j64=mSzuufOaSGjsC2aSwhb0hs9MKxxaAhbwugdztHZw@mail.gmail.com> <aujr6x9t2gXbXfFw@hamza-PC>
In-Reply-To: <aujr6x9t2gXbXfFw@hamza-PC>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 2 Nov 2026 15:38:12 -0500
X-Gm-Features: AclHuK8EBIgCcOEpy9zoAe7u3ZQc5iU2X8Ha2AYq5mu6ejtrrJMK1XULaVzy1LI
Message-ID: <CAK-6q+jBNKN=oSCmm+i011FdhPS+42BZc0iUfbqGiLDBc0Py5A@mail.gmail.com>
Subject: Re: [PATCH] dlm: don't set RSB_MASTER_UNCERTAIN on rsb with no master
To: Ameer Hamza <ameer.hamza@truenas.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	caleb.stjohn@truenas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 2, 2026 at 3:03=E2=80=AFPM Ameer Hamza <ameer.hamza@truenas.com=
> wrote:
>
> On Mon, Nov 02, 2026 at 02:49:04PM -0500, Alexander Aring wrote:
> > question:
> >
> > how do you "pause" anything in DLM?
>
> The nodes are VMs, so I freeze the dir node from the QEMU monitor. It
> stays a member but never answers the lookup, and after the cancel I
> evict it through configfs. That is what happens on our HA systems when
> the peer reboots without leaving the lockspace and a pending request
> gets cancelled before the peer is evicted.

Still, do you just randomly freeze it, or do you busy/poll wait on
specific struct field changes?

- Alex

