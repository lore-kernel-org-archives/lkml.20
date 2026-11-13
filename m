Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794577796;
	b=36CyDab4ZiS5OlU1yelF6D/iydWnFw8j1u9f8wPAeXTz/gOf5qfe9ggZb5nMFViHsWHZ
	 OMG0R69mzW13aTDt4bQZg6+WULZ3YgsHoZ/vb0fi7nkmcTtuXPefd6OdeTbBBZgkCzn8P
	 SKN82Rrc8OnFGyHw+0bDBl+dxxO2LT3sZ8pP3it4dHvluJnvRhvpas/tBWtFC/wNVcyVQ
	 P2MZPmxLJWmsJ8Tmb8tl6FdQK8lf3A8hqEJ6E8Btgzd3GIkVdZicFth+i5LmKJGNZs4tI
	 ekCMam5vrAjhuj8wiDPhR6rxP0LxBJ3890DEG95X3JPMw3+6EusNiT0JARQnBu/A8kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577796;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:In-Reply-To:References:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=8e2MXnw38pYzH1XVs1yXJtejPbQN6bZltGajv/NaWc0=;
	b=A/TC/r6/SGu3pb3Z40g8JtJld1LpRmLME6L+FIQMWahQt65SAuf73DaFiGR3sTFCqYvy
	 k1wSF3A+h/Vtu2y2OxA8l4DBE72Emo9VxlD3XS4gs6TDCkcHm84evoCN3oHOASjCitw0K
	 SZM9H29cuhfqHI7DThuRHhAznhESB2+gFXlvf5brixZ8twXnhCs1L8yINji3CrP3LFtrq
	 5Zn0t7+d2DQXem8G/XWfnVkKX6L7nf1wpIYMHpZ6BUyKSBa9w3ip3qISjraDD4wB43iUX
	 +/GPEHS321DBaa3KjzJgxC6DDOm/pz1sZhll031/4/bdDrwOpnb9vUo0GXztn7EpsZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dnr4bWaa;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ga5oluTv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3641960A382C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3641960A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dnr4bWaa;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ga5oluTv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794577795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8e2MXnw38pYzH1XVs1yXJtejPbQN6bZltGajv/NaWc0=;
	b=dnr4bWaah9/wySNrHe71UxG7yxYO1hP4OJsDO4UuONplGfOBRiaQICVPWXH0a5xAfClVPc
	t+VpNg58eHK3YP5XWW59CAcUzV5E/GfH9p/c18EmHQRz6zpg7GqxOWWu1kW44oqkX5txvm
	zu2Lk64sIPPATltWgXHym6Mxatxh5HU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-2D4V2N80PietCTfW_XTiwg-1; Fri, 13 Nov 2026 08:49:53 -0500
X-MC-Unique: 2D4V2N80PietCTfW_XTiwg-1
X-Mimecast-MFC-AGG-ID: 2D4V2N80PietCTfW_XTiwg_1794577793
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eee6fa56bso10504386d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:49:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794577793; cv=none;
        d=google.com; s=arc-20260327;
        b=ZWvrCkUcfvEt/tMGYXOsYbVnMlLgdPsozJyg7UBOYaipFKWjyAjrhfPimpJ8M2kKd7
         LzHTmd8NSxVfdRL6po+wfHS728xVE67I1KOsjjQgpSRXIz+ipPtcRZhavD8rmGH0lGkN
         84OK0zFwxXkrIWIz6xSE3OmmHaLjAfLhg/PS8Rmzh+jkg5YjNWg76qEVpd4VDsbXgRoJ
         I6Ul6HTb48ICV2nc5Yp8+S+m/mQ13hu7TupimnSM+PxWPfnTgywEntmgtG5pVuueVM5n
         6W28hf1ZSvWr73cJYaX/HV3mHKsfnwl0xoTGAzf9yASHPOoQ9/lddNXAvbyROy14nlRD
         JdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=8e2MXnw38pYzH1XVs1yXJtejPbQN6bZltGajv/NaWc0=;
        fh=2jwLFTgYPspuPfvHMtFzeBIMwjV3LkrvQFoPjAOTNJk=;
        b=oX1p9VrLD4NYAI1P4U1ndWVhuGXx5n1UWypV0xZ29PsfahQxDDw/urLbSH/s1WinpY
         is3UwCSUZbQxXvqEFKPYlXT29BCKjTPmZs9wbPtwc936DHJsOmbtwOpS1jLGnV9VWH6v
         zqj3AoRKD89nVI4q3OjxHe1mZHbH+Qsl2xS0IDMrg88dK6h57LOevvKW9erCFi9yJSne
         mHu/KHRHtv2GO/tTRjj0b+y84FvjMJ07kW2/YabtEoAl/9jVCi/zgXCuJAufQlfr0IiL
         k5Pl/jwF7nsfP8xeFr53AHNM53cvC/WfiYzERd8HpFSewvRw1SCI69F4A/yKdPnoNUN6
         Yr4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794577793; x=1795182593; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8e2MXnw38pYzH1XVs1yXJtejPbQN6bZltGajv/NaWc0=;
        b=Ga5oluTv2VoCAk4tJJMwd4DcHxnzZN8P5RMMfsYuwHSiMT40x247pqXYZppw40aUfp
         AgXHj7O5P5EGzLh4fIFmrS2LDUH+QEQZYT3NfXESJ7+2AAzl/5iG4ssuum/lz5MnkbiY
         FEWaupRQi3hJm3DKU1Rj2ZQVesMwID+ZlD3yg4Dcq13ucBIA2y5CuZZ0qDg+hag5pCQ2
         rQ5GzjunzI61xrZyS6U/SOWzCL5dpAMnK6H42AAF/0so3HDc8I1e5CduBSEcu1Nj+iKT
         Na7YqNXXzrX2iDdPop6PnLFczlm8s6Y4c3Y6Takf75DT2e9wYXuz0ZE7I3UrxJfbFVUJ
         fD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577793; x=1795182593;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8e2MXnw38pYzH1XVs1yXJtejPbQN6bZltGajv/NaWc0=;
        b=uxVrZzTO8gcY8KhIW3TmSBkAf0dyE1yr7a6WyP2y8Zv74jyKTwD8qYBoW0a0OUvJAY
         pcQdOiBDTKfr5QqOFlufr7t6fUpcNRYcWyorkCc+Ao3S2zW1XUtcHI8qaO2EODgYpuRT
         guaEJ6DXkCeXJlz8v03eV7uoih54dclygepv2rUrB41ERgsUEwZSTQo9u1D63HoybeDW
         mGzzbEnZGOvmYOOeBPgYtKVrETworKxStuOTl0zfWSgsw4JL62Nzi4hQx6SieIBHVK/l
         1RWeSUrBLq2NMBsG59e0v99OglC77ViD0vZ3my3/X3lD3S8wvzPWtkArj3IDlAMQTS12
         PHtw==
X-Forwarded-Encrypted: i=1; AL+hErHeCBPXdGGIj46fgBwOOZpIICMXANYudeTSyt6CEh4xDApsgtAvVlrDWSSdl8nGHjM/kXKu+lLmySJ0/LA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zCuinW+Ue3MpnAwjDznOAXwsgguDfuuCeTW5XrX4bqb7iqROp
	f3t3eNwhnxy66dfq+JJ99ptGihklQWZSt9kgSawzVjEskXRR4isvBgBRhlyc6S/9vVEJgNLYDWK
	ZO2iZN8fcknQvrK9Z6tfWczhvEeBiXUfXSGiWpxKf9dLzX4eXyUQyXAADlo2fV3G7+GVD3LDh/E
	pC7R1UNKhESuVKdbKrnTXWN5HVCWc7kMy0Wl/7p1TZ
X-Gm-Gg: AYBFou3lilGyJ4x8i+ooE1Fpl0huL/+ofg54H4MAwNYSD0JsL43gJz/9TtKIhxuRLv2
	wtpE6uasLtUFXTcG/ufuwSQEUdW9ii3iACihk/iPvrQe73RauaenweTCff3izJBk9IeDtNtPjrA
	TP4ftxQ51SE9z+e3KYvKGs30Mse9n2rM8PQHiM8FYgvxosweWFcbejfHw=
X-Received: by 2002:a05:6214:85cd:20b0:91e:89d8:a330 with SMTP id 6a1803df08f44-91f241f6d2bmr27649166d6.25.1794577793100;
        Fri, 13 Nov 2026 05:49:53 -0800 (PST)
X-Received: by 2002:a05:6214:85cd:20b0:91e:89d8:a330 with SMTP id
 6a1803df08f44-91f241f6d2bmr27648836d6.25.1794577792581; Fri, 13 Nov 2026
 05:49:52 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 13 Nov 2026 07:49:50 -0600
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <20261113080506-mutt-send-email-mst@kernel.org>
References: <20261113-vsock-dgram-support-v2-0-bacfc85b71ce@redhat.com> <20261113080506-mutt-send-email-mst@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 13 Nov 2026 07:49:50 -0600
X-Gm-Features: AclHuK9yYj2AE7jCL2Q7aluEqsTHouql9M7zvOo0Tu9GOsA54iFCZqauW8Q06G4
Message-ID: <CAAiTLFXvuHY=r8FPM7TFNTAO1oyco-brcc6YAc=YN432h87RSw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/8] vsock: add datagram support to virtio and vhost
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Alexei Starovoitov <ast@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Bryan Tan <bryan-bt.tan@broadcom.com>, Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, bpf@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Fri, Nov 13, 2026 at 01:47:33PM +0100, Sergio Lopez wrote:
>> This RFC adds SOCK_DGRAM support to virtio-vsock and vhost-vsock through
>> the existing AF_VSOCK API. It is intended for guest and host services
>> that exchange independent requests, responses, or events and need message
>> boundaries and sender addresses without a stream connection or application
>> framing.
>>
>> VIRTIO_VSOCK_F_DGRAM gates virtio traffic in both directions. Each virtio
>> send carries zero to 64 KiB of payload in one VIRTIO_VSOCK_TYPE_DGRAM
>> packet. On the RX virtqueue, the device may split a datagram across
>> page-sized guest buffers.
>> START and EOM delimit the message; the guest reassembles at most 64
>> fragments and 64 KiB before delivering it to a socket.
>
> where do these limits come from? how does peer know not to send more?
>

The 64 KiB limit comes from VIRTIO_VSOCK_MAX_PKT_BUF_SIZE. The number of
fragments is a reasonable number to prevent the driver from putting too
much strain on the device.

Both limits should be part of the spec. This is the relevant part from
the draft I have put together so far:

+When VIRTIO_VSOCK_F_DGRAM is negotiated, each rx virtqueue buffer supplied
+by the driver MUST have room for the header and at least 1024 payload bytes.
+The driver MUST discard a received datagram packet whose \field{dst_cid}
+differs from the current \field{guest_cid} configuration value.
+The driver MUST reassemble consecutive fragments with matching address
+fields and MUST NOT deliver a partial datagram. It MUST discard an orphaned
+fragment, a fragment with an unsupported flag or operation, and any
+incomplete datagram interrupted by a new START or an unrelated packet. It
+MUST discard a datagram if its total length exceeds 65536 bytes or it has
+more than 64 fragments.

Thanks!
Sergio.

