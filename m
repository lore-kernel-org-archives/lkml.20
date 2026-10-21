Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576124;
	b=bxhzdL/LGVBAU2j49XV5+GYfU2sfWcnrM4rp5iPrz8FiA8jjSGxGNqvdoiXc+eszW8eA
	 Thdz7a2DgFFS8y8V+iSlJa/FYTHpCKsoSUyFYkPvWpsITGQ7/161RVWryGvnj7sGR4T2v
	 z5aIKqasPmg7YWEsrb+41LvSJlHzNOn8nwIaA5IRiKoL9cnVlUERBl1oilTlxtj+AEYBq
	 7Pp3WtsAAD2k4J4ZkOrCNYvrz9N23Vl1SINp/ZXdGJ5x9DoWdLWNzYrLqSjwSXN0c4i6g
	 DPUKY5L7obdlVh4c8o1fSpe1vPVWnUz9bsXLXWwqCPj1lmsOBTRAG2ddXa3BvoNJvpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576124;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3oOP1y+9aN6aMBiBqwXHlYcfXTBVxTTDMi2tTB6X1Pw=;
	b=H9mSyiklzdmKeslECaFD0KEEWHC8XSUZt6MUozie4r5F1RedtdeAcgg+IZQoqZ9Og+U3
	 /MI3hrR5O/NPXK/uiFLhSgmbeIKO3ZnuBWihRyAo9R+2ulkVMH0CxfCeTJOkYVZtZRCnn
	 23CoRcf349xZSBhrV5q9dUeaWVwRoHq6/G+2yfsPDYuVLwKjeD8i+VXG5oG3y4uUJzze6
	 +nI+mj05evSUJALbqkpj92XBwoGVbzKO9D6Sl3Kb8+aJMzOJQwB50JM5B3YU++VlWDCYy
	 u8TXStVFxape9SXiSldbb3TFYcRDLAXREASta2tX8ogDj10yqDY/ShkJF5kuE69M3EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iAyP185u;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fOIDGL33;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB413606A329
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB413606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iAyP185u;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fOIDGL33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792576122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3oOP1y+9aN6aMBiBqwXHlYcfXTBVxTTDMi2tTB6X1Pw=;
	b=iAyP185u9WCtzmuB8Ga4yrARIPQVN7dKL8XtML1yGN+8qXVmsTraOqIDXcwem8ihrFkYoG
	iIUyEFy2XXpoXNT2BCTzcuhDTEFBTrtLcuJS0slTVJolgVae53OSzvK1ZSON2zR7BDGAre
	kS8k+OU/t2Ux1AFF43dYFz7wyb0kp6Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-h4lRjWATN6iPfdK41Jzmgw-1; Wed, 21 Oct 2026 05:48:41 -0400
X-MC-Unique: h4lRjWATN6iPfdK41Jzmgw-1
X-Mimecast-MFC-AGG-ID: h4lRjWATN6iPfdK41Jzmgw_1792576120
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a16faefac0so2933225e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792576120; x=1793180920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3oOP1y+9aN6aMBiBqwXHlYcfXTBVxTTDMi2tTB6X1Pw=;
        b=fOIDGL33NTrxPKx+BfsSsDVnXGS4e8t1HJJGUsc3zBeYFcQ3ytvC0qEBRWjlfcyZrr
         ZCckOHMhq0gDAviC7f++/hBeFg2lT7fA0dttpTW7BGm1HhGK9eEMaPmE7TDHycXFjXHk
         h7isdhUMxs7yCNSiurFJE3JaxJ7pN3pn9BsYs9SHANIIphkdRwNpO4FR9itNunWMSxhy
         771t03Cx22KDx1i08QAh+IExKyggLErVRHkGmOFSmSqteiSE5s2VW/g06SXItYaSgVJN
         K4stLeA5BBNcDnmNyRisJHaTIbAhf60v4At2UHbhm/fT0XdPXzWoegysEI2GbNcnjv+Q
         j4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576120; x=1793180920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oOP1y+9aN6aMBiBqwXHlYcfXTBVxTTDMi2tTB6X1Pw=;
        b=GNOAguThoHgDhTCejai4gzo4Lyg4j7gOP5qMMou3o39hfGOrNJzvTxelDdq3xVdvyn
         +bIqkm9T7w74PhRTAiby1Z9DnD6jMqFTMRoa0czl12OebxYCjgdSsWbflCrDvVcCoF0c
         OXb+VW3R+sfEtz9wLDaxA5ITz8pNpmtcr5V1WzNajVjR7vfCFzrGeBNuVjYifKXSwJ8E
         HixdJZ8Nr2iRqoWB4pu2ddVKfprhAaYVmlhxKqO+n6eAi56oGyFs/Z3MQhXpsvhl+QmJ
         bu6oy969JPPGnj/B+mNWgCCAqZh29KXzUdRFg0RUqya135kKC8N6Jzf44bkoLGltezHH
         G8yA==
X-Forwarded-Encrypted: i=1; AKwUvBxyYQbNnLFBq71OYf8BhkqDhU1Y9l9rzVvp+juQbb+tIGL6I5v7G09Zq6CecK3RcoBSt9MMoHds1Xd0KYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUjJg6ChLSnYNRWgl9yfNjlZriYqRfR0W93SXJVxmkFxmn2LrS
	NXvODTkctvF+A/KXEPJ1+aod7bBPGGI4HH6d1PpH0YU1ALr39wcVFQh/4G3416iq7TRHm34TwvA
	QFgOYN9+aiLI9n9NO3hy9bI8vtEq9Og/4QAaTpKH9b8NhKEw81NI+13vZMK7pMuswzA==
X-Gm-Gg: AYBFou2JssjaHdJl6vtUrmeASDcZDy9Y8LlYTv+ayQ0yAR6XE2DmKkFsMIPqLE84vg5
	KQoBm3/gO0NPhwJKEL/QU/DqDU+2JGScjBWLPErmaky9S/GFPDhAmcjSiNhc3i/uNhtlOdq1Jcf
	hMSzVw3ZWf8grsUpxL/4WwnIl7opYwRbEzbbb1qtDw0FzXCKBPRPQ7EU+nZ+d9ULAq8XmqkPsNd
	Zqk7f0iZ8+BNwi0XRdvSlBRUPmqiRONDoHLDzkR450wpQClepy30c4fBZz3J609TsH81xhCCaLq
	F//tYMUiPQWTlOWgAMgax8ukJNowWlyT1vA5BppIutltg7Pkd1vfALwAbaeih96rGBMlzN8R5h2
	E7KAKjQ==
X-Received: by 2002:a05:600c:6085:b0:4a1:d0e4:2bc7 with SMTP id 5b1f17b1804b1-4a1fdafd610mr29312675e9.15.1792576120220;
        Wed, 21 Oct 2026 02:48:40 -0700 (PDT)
X-Received: by 2002:a05:600c:6085:b0:4a1:d0e4:2bc7 with SMTP id 5b1f17b1804b1-4a1fdafd610mr29311875e9.15.1792576119740;
        Wed, 21 Oct 2026 02:48:39 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.178.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc1b227dsm52096435e9.6.2026.10.21.02.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:48:37 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:48:30 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@kernel.org>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com, 
	Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: Re: [PATCH net-next v4 0/7] vsock: assign the guest vsock device to
 a network namespace
Message-ID: <atiKKS3piuBLEiSd@sgarzare-redhat>
References: <20261020-vsock-guest-ns-v4-0-047527cfccfc@meta.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261020-vsock-guest-ns-v4-0-047527cfccfc@meta.com>

On Tue, Oct 20, 2026 at 06:15:03PM -0700, Bobby Eshleman wrote:
>vsock network namespaces let a host put each VM in a namespace of its
>own. A guest has no equivalent yet. It has a single G2H device that
>cannot be assigned to a network namespace.
>
>This series lets a guest move that device into a network namespace. A
>new generic netlink family, "vsock", supports the command
>VSOCK_CMD_DEV_NETNS_SET which assigns the device to the namespace the
>request was sent from. The namespace's existing ns_mode then decides who
>may use it: a "global" namespace shares the device with every other
>global namespace, and a "local" namespace keeps the host connection to
>itself. The device starts out in the initial namespace, so until the
>command is issued nothing has moved and no mode has changed. There is no
>explicit unassign as assigning the device back to the initial namespace
>is equivalent.
>
>The command requires CAP_NET_ADMIN in the initial user namespace, so
>that an unprivileged user namespace cannot claim the device.
>
>Connections that can no longer reach the device after a move are reset,
>so that a namespace which has lost access cannot keep using a socket it
>opened while it still had access. The assignment holds a reference on
>the namespace, so deleting that namespace does not move the device; only
>another assignment does.
>
>Transports opt in through a new netns_assign_allow flag. Only
>virtio-vsock sets it here, because it is the only guest transport
>that I am able to test against.
>
>Based off of Stefano's original series:
>https://lore.kernel.org/all/20200116172428.311437-1-sgarzare@redhat.com/
>
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Link: https://lore.kernel.org/all/20200427142518.uwssa6dtasrp3bfc@steredhat/
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
>Changes in v4:
>- All Sashiko fixes (see individual patch change lists)
>- Link to v3: https://lore.kernel.org/r/20261012-vsock-guest-ns-v3-0-b32447c66b23@meta.com
>

Sorry, yesterday I started to review v3, but didn't post comments :-(
I'll send on this series.

Thanks,
Stefano

