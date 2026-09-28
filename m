Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CD549739E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590345; cv=none; b=P2Rsjqu3XjsfV3rfqUjuY9FzHNd+GbfRGYs3/e00eEk+qXOT6ZJHXGsyr6BgKa4yZN1T1A4Yrtb1vZv/anO8L8bQqlA7BEcBmzTZu6TcC3HzWYZmA+p7JU4Txacse1buyNnbPbKwH0WH/n2AezbcX975oMjykEk/vzJg5JfSMrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590345; c=relaxed/simple;
	bh=D9WZtmamHXSciMAAtuCq/ma/hHGvwwedbpaf0bXn7zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTqTb73ieFNmdSyfGXdLbzauDTgXlfD16dZh2nF/EBlh9oW0J7/h8UPDtAJzh1Vk6VxuFHJ8zlv9NrBObAqyGzskeuEGjNapmz/ZfAGX5PygDfBaVkBOVVLcVHei9aFlrZbXdkyXjKAiNmTVCCLEQGGvnT0l4JZisilinZjeuuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MbU1sgCW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=R9VtdMq3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MbU1sgCW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="R9VtdMq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790590342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D9WZtmamHXSciMAAtuCq/ma/hHGvwwedbpaf0bXn7zE=;
	b=MbU1sgCWFx/DMvWxVd9W0y/NvxOESu/txFx+qy4fNLaduvqpThDjGO0QlUIPQkDRUO9Nnq
	txtvKnREwkPE9l1ss1M8NvrfYsW/k6xDZcOyzvPqxNMR6nY6+tMW9K7RTmWT35KnZ98Fy8
	INN174qjP6QitNTwFlDDv0Q/CTlaYMM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-i5ZzGBDgPjadrW7oQIHHYw-1; Mon, 28 Sep 2026 06:12:21 -0400
X-MC-Unique: i5ZzGBDgPjadrW7oQIHHYw-1
X-Mimecast-MFC-AGG-ID: i5ZzGBDgPjadrW7oQIHHYw_1790590340
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4843e59c32dso2166808f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790590340; x=1791195140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D9WZtmamHXSciMAAtuCq/ma/hHGvwwedbpaf0bXn7zE=;
        b=R9VtdMq3bW/zo1qzDPtl3athhA2y6oB32PcYX+epo2p1OzunDtf0CqCA+A+ZoasXRb
         T/flNfWvqO2A03ubU0G/FDM3MhpO4i10VT4464m8Szdog8IpTFZq67fuATxT/n3n0BPA
         vAUTP2gLaKkIYTWPsGJ/cyeWo1CYhqkkj7Y9ry2p9o14LoNC3sBpAKdZNZ6BNvR13tB8
         IjfBvkjQrerPn0T3V9HojiHOUnRSZ6uiUZt7HnEWDmSd7VyoIVLQyYL99pmzBYRwSp2Z
         Qmqr8CFEnNWEu94i5acOxgy4zqHbsAL/bg7lRp70NaXjjFJLde25GpUmEgHjinVifZ3T
         +qUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790590340; x=1791195140;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D9WZtmamHXSciMAAtuCq/ma/hHGvwwedbpaf0bXn7zE=;
        b=RXtA2/5zmRSxPQBpUiJzgTkEDWa/Tbtxy1MN1MixqMWzoKxCGSDmQyulNRyvOW42yd
         MNQ5gRp5JjNk+fTblZ1/YysSfNlt9RSN2mJJtyhwvXI+oEnDOqXQXFf2tPMHHkQfxjIM
         GtWWdEcHaHgRLu/9/SGG+fsv4ZKtuyQ0BU3ESa9VPZtGNoy2tbBEBwoxVKizwfpvnJ8r
         yqa8DHT0zU0vOWt6IpWUPOdjMuhCjuVwFulUBnZmXLYKPX4QyXs20L7kDtyFVrTqrLIX
         220hKkdC2d3VVVlAsx3pnWzDiZLQ5pBUrOvysz9wA42yd5zSGDcFeRLdcJ2wXRGmD9fr
         mgiA==
X-Forwarded-Encrypted: i=1; AKwUvBx7gNh8mwmAf/uOKScDWcP2Gx/ROLJxe1aepoBBB98DGd2yl4KThWViAzJmVx4IjXBtnzya7w2HKsjO1ns=@vger.kernel.org
X-Gm-Message-State: AFq9FYLejLUz3aTC23kE9CLN0d93IOkreJSHfTD3hgzXom94hw0DYT1k
	UB20t58qffQ9MF/+C+ADkLGbpteR2XLVcLo5bsuc+soBr3UWGjRnehq3V42r4WeyZx4ESPvT5ka
	82DX4f9IWaOCbMrVmAckFOKaDVrRLnKsxZTtb131IlG97s26mX5N1ZnxLy4bRabTzGQ==
X-Gm-Gg: AYBFou3a3bR66XNNu3dYgM0TqbuVAMM6iiC0WiwwDQeaaTYbq3VQX3yag4pC3OG9pZV
	n83sCd7QbamDY9nEV77+RvvscyBbKKIMHJy8hn1UKcyN/f3tA4P9yJuk2rc4HEJr1XaeFwXMYnG
	nZ/3Lk7mqH0ilo1jK/YDcSGpMR2uRiljxW9KlU4qyw/sz1CVebO5DTKCsrFQFH5EZDp55Fh/R5h
	oFT6Xu0r/vcOh5dbE7nhFzu0rpI9cn3slWzlFEzdp16YlHuyMllFXJlzyBu7QySOIUx94JCjF2l
	nc/gnPlKyd5E1PY8brKDzWk3Xlc38rOMQMm1XFKBY/8E/FZR0VnZJo/ZUQ1Fl+ENALdZyCB0QjM
	i0lRoCnzpD7kWLDtXytPFIePaqMONEdOjnw8=
X-Received: by 2002:a05:6000:401f:b0:488:8111:6f56 with SMTP id ffacd0b85a97d-48881117121mr15322484f8f.8.1790590340165;
        Mon, 28 Sep 2026 03:12:20 -0700 (PDT)
X-Received: by 2002:a05:6000:401f:b0:488:8111:6f56 with SMTP id ffacd0b85a97d-48881117121mr15322447f8f.8.1790590339801;
        Mon, 28 Sep 2026 03:12:19 -0700 (PDT)
Received: from leonardi-redhat ([176.206.38.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm25765327f8f.9.2026.09.28.03.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:12:19 -0700 (PDT)
Date: Mon, 28 Sep 2026 12:12:16 +0200
From: Luigi Leonardi <leonardi@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 2/8] vsock: simplify error check condition
Message-ID: <aro9DiEB3GPIMnMu@leonardi-redhat>
References: <20260922-vsock-connect-reset-closing-v3-0-78907b8200d4@rbox.co>
 <20260922-vsock-connect-reset-closing-v3-2-78907b8200d4@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260922-vsock-connect-reset-closing-v3-2-78907b8200d4@rbox.co>

On Tue, Sep 22, 2026 at 03:14:56PM +0200, Michal Luczaj wrote:
>On success, vsock_assign_transport() ensures transport != NULL.
>Drop the redundant check.
>
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
>

LGTM!

Reviewed-by: Luigi Leonardi <leonardi@redhat.com>

Thanks,
Luigi

