Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787103;
	b=gtwpofkPf8Ett8PwfjE94/twnmniztDaYqkp8zVmQ6yluXWkv8YqyttBezA1Kc+f6E5z
	 UwfoTCylH2hi9MzcTg/npPDEVbuK9qVoXaekH6lW44muEXv3hghk0tRFht/VuNsQb4FFG
	 GI4aBmGUIYo7GnNCBYtPO7AIiEEigmdoU5rqEm5zb8BVx1Pc+Nyx0PbqgNJ9KScK5phdl
	 9HDrKOd1KliJRuxerj+CF+fM7nGL3IMmw21R3gogpt2mdXfhH3UPcIrEUxDcz5BI8b2yD
	 og3/U4J+aQ8u9WhwwzBi46F2lJLCKht01XeKrpn8fK4DHCqMkv5fPgPUTY2s/f2gv4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787103;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=W3P3F07LgVW54j5QwwolaMPEk7ysthqt1GzeeUPtiwo=;
	b=pYHjHCAUyuN8KIves0QyDywkD3ow+QHC0IIAu2KcIeUQzg1eLQ/0IpRlQxDM2PX75yZS
	 KZzElD2oav6rk4K8THvw5wIcveNETqxy+G5u6vjYbHYU5lucScsSMw+ZSvil/rpAbHjBf
	 ru6b3JCBu5F5krfrdOEImSC87hMBMhN7ZhtO+Ry9/sWTCWLFI1Xa5HzJbMKlVgzeXHtkP
	 FRbCNcaf9jSdoxDZRzNWkP1qf5+IcXeUkB5PYsowYZuUQiGJMCyHxLTV0RltSMCSKbUu0
	 bFvRNJFDcl3VVZ9Dkzx8c1M19gLlgxQkCF8G02Yl/930Xn3OeM8OpzfWBHg6liaSL6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VXu58JdE;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ARyq2B07;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC65606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DC65606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VXu58JdE;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ARyq2B07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793787101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W3P3F07LgVW54j5QwwolaMPEk7ysthqt1GzeeUPtiwo=;
	b=VXu58JdEKrbDCq586evS8Ep+P5gwVDhEf7pAL2VA+Fxq2l/RAjcGQxdYDYQOvwf6V447z6
	BZVxNeaYpDHbvERlUb/GLx8Q+G7hVCQomprYrYGejdp/+QxJjTAYjXUhm/zt164osFHrT2
	HWzDTDhehkqJ9frULNlCpo+OrOL892M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-1WcVdevVPXGV3_WZR1fY5w-1; Wed, 04 Nov 2026 05:11:40 -0500
X-MC-Unique: 1WcVdevVPXGV3_WZR1fY5w-1
X-Mimecast-MFC-AGG-ID: 1WcVdevVPXGV3_WZR1fY5w_1793787099
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4901562b819so459319f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793787099; x=1794391899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3P3F07LgVW54j5QwwolaMPEk7ysthqt1GzeeUPtiwo=;
        b=ARyq2B07sVI7UWCqJLjDG1Fp1kBBO4hBUEDYM4VF8wi8wMoxVhe6Xce3O8RbTxTfSw
         q0tbzawMnnFgBiU8Q4dH/fYgRcW+JvMoV4cu42sBPD/tG4RWsCdfPJq+pMW7Re0fmL/H
         LygfXBpaD51nJcQYMEDgDSSRaDBAlKS/LeLyW/fJyaZsbuQwkK1+4q0ah6suDgpKQxLX
         ri2RxFrsy3XT9m353pX5ryFJbhXy4rrFjPxpTecnHNWmqIlsU3L8OMR/XF8uS1iSvImg
         sd4xl43WuKeLrorp6Uw+d4bPKaurhdPn9Kdqn5ykbydQBABgyCOrsv/LBbDhUGqQE8s8
         4szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787099; x=1794391899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3P3F07LgVW54j5QwwolaMPEk7ysthqt1GzeeUPtiwo=;
        b=cHUZk/ojK+rJr5J1++uTpFw5uSph3ZqwTOf6VQj/soyJeyhLuADdsWystNh5F5NVpv
         WeWBcYvyxc0rr9tQqD/p+3SKN+n5M3s8ZFHeqZNrDnwwP+p4woYxYILaUV62Mzxy0B5S
         3oxXTQI6lAk/hH2+ujhxyq486Q2M3SNkBNvTM9RCeYb0MUykW1gPLgfqQPmpoEfkXHdK
         KzNOAuqJNvxNmd0ceIGxBuip59rqR6UzoUeKVaqKzW/YZ6rw81tfVpJzdYc/0fD06h5P
         PJ63sNA58O+eyliCKOTPv9JD2uovKjmmHReHW+ThPORaTiK00t58CZpiOv5W+UsKDobn
         xymA==
X-Forwarded-Encrypted: i=1; AKwUvBz20d99cR9JEbehEL8TAc2es0CacLrR/zd1+E4E4vCXnGjdN8tUCGO9nBDO8S3F+WfGXtJ7cpsNIo9imSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z94Xr2ITVw1svjiQx9LqCqWShr644fi0v3igLK2qjVyJGscKlNE
	pa+E4APahuScBh6GtMXugQi3wV9pbEum62e7WzD/PLe50wJM2MoP4hPn/tGCkxhA9Dp7Y5n+pqa
	IL9biHdvvzvCTdxqU0VBiNYOcc9cR3GQa+HhIkIkl1Vod3mQtV4pBVMYg4aqRuBbASw==
X-Gm-Gg: AYBFou3XQKF0D44BAUyQ1ZoqCuCwcKmavWla//QhUYQs9aUkh1/Fwoc5hXlSqFD2Obn
	Vnm0G6J8LjU71+rGyeXlM8E733XSO3FLJGRjzdbthG6h35f6yUPcMFY5xQRdnnRMfQQZHP7BUZE
	fAuNaDZlnEnTW9SgpBLzZnFQn40SlL7CwLRHNCU/AsQG0hfWV5FM6DCo1yz5Edwgdo/YgoC91hI
	GDn/OnCwUGhArHi+bKB4rw3CriIRpeE0N7mzbBM0XAeCwQVAyckcSVuMaxmQoP6H/QlItzCZmYS
	w14X5a5gqrGnTOOgIFpjfme0d8uTnhiTlz/d37xwyi1SzM41L8LuNHnL9U+Ip8GW7sSftPgQZUJ
	MuvX3DL8x6ZCCt5cVAHHNDtX2NMVi7Q2oalt0MhwGS+LNW/2rEed/
X-Received: by 2002:a05:6000:4b02:b0:48d:f99d:a0d2 with SMTP id ffacd0b85a97d-48e6e2e76famr33250713f8f.15.1793787099086;
        Wed, 04 Nov 2026 02:11:39 -0800 (PST)
X-Received: by 2002:a05:6000:4b02:b0:48d:f99d:a0d2 with SMTP id ffacd0b85a97d-48e6e2e76famr33250672f8f.15.1793787098615;
        Wed, 04 Nov 2026 02:11:38 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea18104bsm3214680f8f.6.2026.11.04.02.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:11:37 -0800 (PST)
Date: Wed, 4 Nov 2026 11:11:27 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Simon Horman <horms@kernel.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Bobby Eshleman <bobby.eshleman@bytedance.com>, "David S . Miller" <davem@davemloft.net>, 
	Will Deacon <will@kernel.org>, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Daehyeon Ko <4ncienth@gmail.com>
Subject: Re: [PATCH net v3] vhost/vsock: size receive SKBs from declared
 payload
Message-ID: <ausD3NBfYVn-n5ra@sgarzare-redhat>
References: <20261004235101.1464007-1-4ncienth@gmail.com>
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
In-Reply-To: <20261004235101.1464007-1-4ncienth@gmail.com>

On Mon, Oct 05, 2026 at 08:51:01AM +0900, Daehyeon Ko wrote:
>vhost_vsock_alloc_skb() sizes the skb from iov_length(), the total guest
>descriptor length.  virtio_transport_inc_rx_pkt() instead adds hdr->len to
>rx_bytes and buf_used, and budgets each queued skb as SKB_TRUESIZE(0).  The
>guest controls the descriptor length and hdr->len independently.
>
>A guest can therefore provide a 64 KiB descriptor while declaring a zero
>payload.  The descriptor-sized skb remains queued, rx_bytes and buf_used
>remain unchanged, and only the fixed queue-entry budget limits retention.
>This is not a lifetime leak: the skb is freed when dequeued or at socket
>teardown.  Repeating this across connections can nevertheless exhaust host
>memory.  On Linux v7.2, 455 such descriptors retained 30,255,680 bytes for
>a 262,144-byte receive buffer; a full-payload control retained 265,984
>bytes.
>
>Vhost previously read hdr->len and allocated pkt->buf from that value.  The
>conversion from virtio_vsock_pkt to sk_buff instead allocated receive skbs
>from the descriptor length, introducing the allocation-accounting mismatch.
>
>Copy the header into a stack object and validate hdr->len before allocating
>the skb.  Size the allocation as sizeof(hdr) + payload_len so descriptor
>capacity no longer determines queued memory.  Check payload_len against
>len - sizeof(hdr) to avoid addition overflow on 32-bit hosts.
>
>Fixes: 71dc9ec9ac7d ("virtio/vsock: replace virtio_vsock_pkt with sk_buff")
>Cc: stable@vger.kernel.org
>Assisted-by: LLM
>Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
>---

@net maintainers, please can you queue this?

I just reviewed since I missed this. I also had a quick chat with 
Michael and he didn't queue because this was marked as "net", so let us 
know if you want Michael to queue this.

Thanks,
Stefano

