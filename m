Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825C53BBFB0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486946; cv=none; b=CqRdUXWwEGhrnmUTW1EQPKuLydQXSKIZkbYtGotE0LeJ2/6MBH6w6xGJjm/0zLgIWuUp3b4gFnL8FrBkxdW3T4yyC1yp4/73+GF4pyTOvGBfUDYecjzoeoOVNIbbs+sxSbHDBf+RbdLC3rCODBY2lig0Y+LVQxkAUSQO51uwfr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486946; c=relaxed/simple;
	bh=E+BuIG99Fs3gW60ZhBJoousphtXqpfMPQp9AyvW4hbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZ17ZFj2jtIbFXIcOfbk36E1pqLxsNzQxJ+Tt3dpeC5IV5S67XyqGD7w4Qmm8+InU6k3s0Dus2S09nR9lKXKkxdo3uzDdAaiGR1yGtpuLo5ZyDaODHLBnDhX1SUvh8eXqN0v/NurwFH6F4GB3ZMUrQUmv1BFuNaViOjCWNNJVRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZBImNUlx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DlOX6hOI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZBImNUlx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DlOX6hOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789486943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=piCn16bJNZqtD+Ea5Vr8Xw4q1fEfx3gnyjZeao+goZc=;
	b=ZBImNUlxy4KUCU2yjvwB/Rt4PBRKXQZkAMDSxt1kADpnGUZgFqBeVs4QWsES6MPI/Jmhaz
	3qzmfR+PNeP1LkDoSau1JixnGu5/WBbr273u9mH1ultGOkWEJjuXtLnJBKQQnGkJECQ9zA
	l1/ygDO5MtfVNxshu9t4X1SEUnpNivA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-hHHfqxthNk20R3KUOK9O8g-1; Tue, 15 Sep 2026 11:42:22 -0400
X-MC-Unique: hHHfqxthNk20R3KUOK9O8g-1
X-Mimecast-MFC-AGG-ID: hHHfqxthNk20R3KUOK9O8g_1789486941
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e823c4868so4982355e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789486941; x=1790091741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=piCn16bJNZqtD+Ea5Vr8Xw4q1fEfx3gnyjZeao+goZc=;
        b=DlOX6hOIOTQudbeylDTBlu/1eLr9D/e5UdJ9lUKctUFbOHE1dWtRspL03jEZThfnZK
         2r9x2G6W/KEs+Taf4kKG4JW04VUulVg06CzD60FHprlShrmlQBgygtTPIfwi23cu+CJn
         WUXykqvUdumij86ZGAFuDTDMOhs77zJSQAgidBG6cAb1/40T6XBMmY6L86zK1nS9NZqV
         X7NqNE0mQdI+pah/MqDGkf1n/BO8uRmbebbrYyS6C9PwdtL3QxWpVsw2vj2cdA83uyoB
         aWY+SuOz1WLFZy8WQ00FwStPAcp3qcZk7ThKX4P2+r9UYRi5FJmngKRxfMQeKB9amC8G
         v0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789486941; x=1790091741;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piCn16bJNZqtD+Ea5Vr8Xw4q1fEfx3gnyjZeao+goZc=;
        b=nGZYKQqvHydzkw+jQ4/+7ZkbkR37PUw2jYMMuGuvUV3houN8O6S7JXAiKHnrzcbGA6
         cGwz9VXOWwyS+objAs513JtJresaFOjZkMazHUrSGTiSTFooxKtu3QDDUSB0bHTupCEQ
         KdWnPFz7CixGcyBrv07/Y3Y+NcWjT7eOyO7WCE3vEeY0+y/R5A6xGoW4PMeq8Lo5ai2R
         fs80JMQB5koiXf0/vceclmXHqbLoTmPRrgNQ1dflog1eKygbnXbb2z5dYkAoJQb0LrqX
         fVfLTiSG28GE1gqxXBTopj06jkMBkIOWrdy+Bpz9mr4DzCYO8J6PhDqEXj+OEZPLD6cH
         tP/w==
X-Forwarded-Encrypted: i=1; AKwUvByoK1Z0NSXRYRMsNcmGI8/qjNruBBPAeTSlJzUE7UvzXrPn312OR5Pr9MsAPf9fNGpQI3x/xfvtoB2W9RM=@vger.kernel.org
X-Gm-Message-State: AFuF++m9QLq/nFcwkOBA7fWTnB3tzCbwm2UmjCT3ptsMHN2CAVOh0PJp
	odKOtAv3R8u1uN/dH21p6jCUZzQPKMx3Kc1MIKKanXtjg55ET9cwOvfYe5IwlR9C8frB+qbKpQO
	z/As/cwD+kzoPowiKx6yCt0E8gUJwITQ3d1Hi1dtS8cDVc+k191Vd34Zpj72TtYVLiw==
X-Gm-Gg: AYBFou1O5GpC684Xj1hlNZwlLyZxKFGxdcdY17mi4otv3OyUBUfXUKNjZpXUGVhf58z
	KWua+drz7eMCCpRcXINgJSqIqJ0onM3he1TpJZCbTckfk7vdBdx087/7k3TUdsxY0BOaVBwvnwt
	eARn5cFJEUriOHhnTTPseY5kAWLwsRYQd9mZP1jC4urqp9kymfQjuESOPDa6H2fG3o+ZgJMZELc
	V+QsZcBbd1Bp57KkDy6GP8SHKj70mYzTB4jGwY6iyRgdAc/qDIW6ZkqW/eNiGuuz0lCEwBjqFJM
	jgs4XLIll3xEN68hkEm39rnTWNSi577o8+oM0/H4XN1vdyk2o83nuODsa+SGm5FO449DuCojjXl
	eEKkgkAH44s7WTzplGGbh4+dDI4yQa6GqsAS6TlNwcJsuBw==
X-Received: by 2002:a05:600c:8b74:b0:49c:ee20:e787 with SMTP id 5b1f17b1804b1-49e7a658021mr197080915e9.1.1789486940748;
        Tue, 15 Sep 2026 08:42:20 -0700 (PDT)
X-Received: by 2002:a05:600c:8b74:b0:49c:ee20:e787 with SMTP id 5b1f17b1804b1-49e7a658021mr197079685e9.1.1789486940213;
        Tue, 15 Sep 2026 08:42:20 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870b39ea31sm949332f8f.23.2026.09.15.08.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:42:19 -0700 (PDT)
Date: Tue, 15 Sep 2026 17:42:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 1/6] vsock: constify the transport in
 vsock_for_each_connected_socket()
Message-ID: <aqkcd_oMWK-QtXWQ@sgarzare-redhat>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
 <20260902-vsock-guest-ns-v1-1-9995383e9a8b@meta.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260902-vsock-guest-ns-v1-1-9995383e9a8b@meta.com>

On Wed, Sep 02, 2026 at 04:00:47PM -0700, Bobby Eshleman wrote:
>From: Bobby Eshleman <bobbyeshleman@meta.com>
>
>Allow const transports to be passed too. The function only compares the
>pointer against vsk->transport, which is itself const, and never writes
>through it.
>
>No functional change.
>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
> include/net/af_vsock.h   | 2 +-
> net/vmw_vsock/af_vsock.c | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

