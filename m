Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9F52D97BA
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280104; cv=none; b=ieOMl/GIRYrYIF0e4kAvurS4KJLmKrSRHt5RxbX4uJKUJCw539nCXstM99riujaO+83h8b6IAEInfA28ovtiM6L/wFSsqXvyk9+m/hSnn12hH454G0wfE36RggtGViTdJM2coYX8Q16IJIXEVRY96WEtFLQhv3PdeaE0zPMcOWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280104; c=relaxed/simple;
	bh=LTfnRIxmZLiA97Yqm4g77Ig3nE2ngmtX6QJ2VVpUxZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=as9ZH4OdmpFLwhU9qAQi1ehhJrcFBdl4dIlpjWQcjkQaXjq+UK0p+K1uW3E1YgNMoCCIQCqTUnBbYeK0NRMKZPRatHHwTsy81Qn5DQSsDMCi5VWgbkesxwotlTv0OQXyNoF9DLcdKhJ73cdaI1rqyFc2z4DL9/aghqDVtmVES3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VT8avO2Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=btvEEqzN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VT8avO2Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="btvEEqzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791280101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lEUBtVB0GKLMw4VmTZSa2mBzg8QXaeyd4RAsEGILX0s=;
	b=VT8avO2YTFIUSJVLoYM0pIPLjkWp2kp8I/AZraYeRmP2NFRb1GBzAsmVWxQ49NinXVJflh
	OfUCKJqsahqqZQAFY9sNFW0hOib/Gz6HQ5kcyZ/inAZB/DHN1jgpjeJcP1s82oNT3sh5Fb
	KPLr+PpKmNoF/n76Bsxyx1zEXwDj1Hc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-ZXoinRr2M6SmziDKNXfgLg-1; Tue, 06 Oct 2026 05:48:20 -0400
X-MC-Unique: ZXoinRr2M6SmziDKNXfgLg-1
X-Mimecast-MFC-AGG-ID: ZXoinRr2M6SmziDKNXfgLg_1791280099
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48aef5cfe43so1699635f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791280099; x=1791884899; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lEUBtVB0GKLMw4VmTZSa2mBzg8QXaeyd4RAsEGILX0s=;
        b=btvEEqzNLWmEmqMhdnPyXxtDTOITNEE95IbIpM7qVFxjHQ+NwbiYpb96335DH/hiXb
         eFm1yRCTasgN59Xp3MfzmO/tJb83INVho8NPo1XzHZ3GmPRuuuBaCz4Dfx94ngB2HyhJ
         cORYLB04slcam0vG5LAD44ClACY0ZWQEU7zaVEUfTBBC1BNznAAr6plr4DpiyKbkP0q+
         MEXq2JKs1QELw9dDYrQ5NY1ix4vQgiyzc+BJPThxN6FhveyE2oBQYGu031zsSXOxmbxF
         n/I4iAyHk+IQzehXWhqEf+MylPy6vdqtv0mE6BNbfcISz9ZePiMr4UKeQlWusMC1itXd
         kd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280099; x=1791884899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lEUBtVB0GKLMw4VmTZSa2mBzg8QXaeyd4RAsEGILX0s=;
        b=nfgMZQZbtJr9/7MJ/tyMoBf/Pc91L9xkVkS2ndQBXqUjilMnz/e8nxEKm9DSmFq+lf
         /ts6ZneBYLZNRzTey6pzgzdlfuALoX1BOAdFn3E6OJp3eelftvI134MyzcNX5Um1Lo/u
         UoVl4kODG7onOa7DE9ruLnoFTFlVX71zUTiKPGCKGSO0YTn4mFqwGaORyM5erdaQxa3J
         arc6lA4ojXHKART7N0H/7AkRqXqgAMBO+ErlQiUAxz4Q/uhCNtORmsDjwXAymLPm0zSI
         V4X528/O81tujdZsYHGV6xKy/dhM7iXtQHNHHmsHj9e1Xb3L3FUL8oYi2Tj/QVGPVRaK
         Y4Rw==
X-Forwarded-Encrypted: i=1; AKwUvBzuNSZBduIlj6U3L4CitdPmx4BzbtCSeaCofLDJAVUtR+wYNln05g0Mo+CO7wZNWwTQrzGB/+Pa79JpnR4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWm0dfkzIMQONOnjINh56pheylGUwChIuCfRwD38qer8BAt5xx
	ujp5ffA04mmOXJBJkFVKrS8ipTGCO/Gm1ppErx73ILGNvumjSXhgx2lpFYWICb21F4Kqq1Qxt3N
	ekz9jHGd/keRC3ezg55aTcqPFhPQpHiBuXVnDFdU9trFnsiYT075h83ifm0+0ry7LAChhWxgq1A
	==
X-Gm-Gg: AYBFou3VhwMKHSGJyu/rqPYmugxoCIlJe479N3OIAik0ktZZ0lZXwNGYs+/swf7Ea8+
	iDk0urn2OQJa25vkKl/Rr5UtmserWNL6Q8az/urfr+liCTum7bppoKM2YUxwlJAUuk3AP3ltC85
	2YNiflKfqqyn1oBztaD4YvGDpPwvwlRsM00dMm8CNCfoFJ2SnbAufmxdXBKXeS0tbzMZUJEISvJ
	KluvFxcLmTq4i7DV5LvLOhzWB73J0C5/M9+0PDL9V0yOyLI5z7CbJMHuTekGTtN4IONcuKt9i23
	H68uwe/uPjUqXy9YSNoN51hcXa4yf3HuXw/0cOHuOss63DiCeZjkPfpOI42//SlhyhRsd7Y=
X-Received: by 2002:a5d:64e7:0:b0:487:81c:183f with SMTP id ffacd0b85a97d-48c6d1a1639mr1490093f8f.10.1791280099055;
        Tue, 06 Oct 2026 02:48:19 -0700 (PDT)
X-Received: by 2002:a5d:64e7:0:b0:487:81c:183f with SMTP id ffacd0b85a97d-48c6d1a1639mr1490068f8f.10.1791280098487;
        Tue, 06 Oct 2026 02:48:18 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62270968sm8900455f8f.8.2026.10.06.02.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:48:17 -0700 (PDT)
Date: Tue, 6 Oct 2026 05:48:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: =?utf-8?B?7ISx67OR7LCs?= <tjdqudcks0424@naver.com>
Cc: Jason Wang <jasowangio@gmail.com>, Eugenio Perez <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: Re: [BUG] virtio_ring: VDUSE backend can corrupt split-ring free list
Message-ID: <20261006054441-mutt-send-email-mst@kernel.org>
References: <20261006091210.828229-1-tjdqudcks0424@naver.com>
 <20261006052105-mutt-send-email-mst@kernel.org>
 <2b6ae98573123157c0d5aca458dd4d1@cweb009.nm>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b6ae98573123157c0d5aca458dd4d1@cweb009.nm>

On Tue, Oct 06, 2026 at 06:39:23PM +0900, 성병찬 wrote:
> Yes, the backend causes the driver to corrupt its own virtqueue
> free-list accounting.
> 
> My concern was that, after privileged VDUSE setup, a delegated
> unprivileged backend can trigger this by modifying a published
> descriptor. However, my current reproducer demonstrates duplicate
> descriptor allocation only. It does not demonstrate a host
> memory-safety violation, cross-device impact, information disclosure,
> or privilege escalation.
> 
> I therefore agree that the current evidence supports a robustness
> issue rather than a confirmed security vulnerability.
> 
> Would a patch using the driver-owned desc_extra flags during detach
> still be considered worthwhile, or is protection against this backend
> behavior outside the intended threat model?
> 
> Regards,
> sungbyeongchan

It's outside a threat model but if the rest of data is coming from
desc_extra I don't see a good reason to read flags from the descriptor.
Will likely be better for cache, too.

