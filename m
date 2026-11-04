Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802495;
	b=ntEtHg72qabkSKC6rVkR9cxqfgI75j6wmxeiOQj2bcRcjAAz74htLeReuz28NSkE693S
	 uDMdskb0l7lDXmJG0/BexSFmvtFyWpcj+1u9/Q81iROWCM7cYkx5CRqCKLzLdF7o5LUE4
	 /a4E+YAy3Qr7ot6yaYv1/QNPh0MAfkiD7I+Xotwj8OkRPR64uOgLkkFucyYzyX7+R1Qti
	 V+wOjjaoVIRFplbJTrI1L7ZB3SyHSG0oHYXBwUA4L03v9827REBiX2e+8Tv4ZCqiS371H
	 O8t6YKLVIxpcI0gOpcIQQbst+LL/TrVE/BS4tgI4niPIGJi0UuRGS+fNHWURiKMMMKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802495;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4/Evz9fjrrpCnCXycWC63zfKI3HUYi26oAG2Biknep0=;
	b=JD3ToxDwkfR+fr1EqMwoldtnN9uXfL+EUEnrUxUC4RvYgEwsTJK/fwcrCiNdrhF7WAOv
	 3UYi7CCW6MX0FzIqfsZReAhI3YbC77xkfDuItgvsAPBdMAS5vPclDW1eZr4oMVA6za+/T
	 zCuLCiRo83l0kFehGLv3EtlLdKqUajYuARwVq3Mg+XuKPda2Toxyh2FC2oaE64+UHPj86
	 /zmmm2s/e0NReTxDp09hcltAL0HumHmf/QuruHnt7XpfhVMxH7IuYX96rcn2uLlobkeE0
	 71fxNQ1J39ytAbzR1L6W4nHiZgAw4cSHLeVd1dk4z8Ro2Ccx9fBU4qvdZKLA1Y7StAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UCCgpa0h;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="iaIe29/b";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C189606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C189606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UCCgpa0h;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=iaIe29/b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793802493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4/Evz9fjrrpCnCXycWC63zfKI3HUYi26oAG2Biknep0=;
	b=UCCgpa0h1y5+YbuN7Y9mcWyeMbYvSsWTkRRsjbxugC5r8oPcixNo2j0t0+l0nJrPbeB9xo
	nwbUclSoDqXyo6cVKm4u0py2WzalOC+VGMxyhMM90ycDKgpIIsYFamqAVgtByNvLZlpMgU
	4SGvFc87JltRAOQicXyH75IoPEmwx5c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-3R2VnMtYN6SFzasi_5UIjQ-1; Wed, 04 Nov 2026 09:28:12 -0500
X-MC-Unique: 3R2VnMtYN6SFzasi_5UIjQ-1
X-Mimecast-MFC-AGG-ID: 3R2VnMtYN6SFzasi_5UIjQ_1793802491
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e1d839ddaso609533f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793802491; x=1794407291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/Evz9fjrrpCnCXycWC63zfKI3HUYi26oAG2Biknep0=;
        b=iaIe29/b2YAJYfvUKG9cgMgWKhkRRPN6mzfVnfyEm8iti9EoypvstgW8Bw5glKA6UH
         5Cw/+Ha578Ab+8w+SBkcDKs2Nx3V5dwxF0HoBVFOA3czWMkpL3WEvst7hz5u2qzBVSS2
         YsNmt8+IetDIVVchHMvRPzn8XwBs1u+xW0VMv5IJEe5iyzHhR8MzAejjvga6/5BmXoth
         Aa1HfCADmvVtrEOQsKoXJi61pO8gwhkYZW8IcTbYTxmPxks+k9F5Q9mbAmCIGcTTG8Rr
         YrRPM3MfwQcokwlLRdP9zk+kdtGpuOIUw8dXhFbQC1xtLpQTJ7fDS9APT0nTu+NcMLyn
         3Wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802491; x=1794407291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/Evz9fjrrpCnCXycWC63zfKI3HUYi26oAG2Biknep0=;
        b=NpMRclo6v1aENSSfK2yDHa9LFC78HBARbZyU5O+019/BKWtY3oAz7HSUGzTQVpvJS6
         i/XwPOS6m7bgOTLKtKvbuzO29HnWMZVpRRJoF0iEa5SsNfK+AxvCd9T7XvQJNa+CaYf6
         m7Z4mi3VF6a+fErCJeRJwupO+AhxbqA0/F5cFb4mRsvMj11DSO2yZVYFyB9Cbd2lOuSq
         VX7zqdrTorrz74qNCPUlNG3eU09AFsvmjj5QHXLCnXzqBWGZeJIBMcYVv5od2XcDsrrN
         evtWu/vsY88zsDC3/ymCN/FVvoi0X/WiqPYGUx/wP9sT60tfa29Y+ycLjfldxTc3VpF4
         lWGg==
X-Forwarded-Encrypted: i=1; AKwUvBzzhIKmEMgljyZ6Ki7XfDru0lPx9kpQg74Fou88FB8CKtY9Ihn8ZaOjROiNCsUUyaHjqQ7wq0CiLCWyEgw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QLokGDFqMkHiKvndh/VNUpc50hmjoVvI0I197E/JOq9clbilL
	Pqr0vsghPouUq/9BbmK6RozczA4Q1qTgn+d/hdJBdn4kK0Nt9oH9L3iZnKtlIMXwB8meDhSsLqB
	gcIs42ksYvThttqFnzUEYAIAgW5BYNShHuhNoyXKRrPbUEPiGF+Xpne7gtnlkww9f3g==
X-Gm-Gg: AYBFou0dGNpmGF6qhgoo19f0/46S1npbfuIoe56NoHcdn4EuHMzCB4IqGwSPFOfSvNS
	3LdzfQxNje/ZJT6fktkgeW2LdJkboTE6LsSQH4WWzNnRF32R2ReywRqw3Clb4RImv2CgszNqeHy
	tLklCdZ+CIW7k11T7Qlvlsg1OxotFAuoMFFYkwUOd5S5HHqRgDRSC8x1pTsPxHs/IdFWENvNPqw
	RKCj/TdwtOrN3y88bMnT/MaLm+HI8qCvr4Fu9bSdrIEUDGyMIzKzWnHByPTDdUSvwCFM9Ujn2c0
	RZ8yHT0zu9DEPiGFyEOjq08im+X14umtU6U1Gp6ie7bhYqxryrGSVB4Yx/s4xoZsM9dXX1NEDZl
	IL0gaCEfJ38mJX7mf4qiRw5dbXw1uEU/OFXXpFpw2W70dr+8b83m3fAjGy3MiqIIiTTDRZ2vyVh
	HT6z38NZzlsqtFLQqe7zuNn5oIhH5vX8///aHYOiXdIiE=
X-Received: by 2002:a05:600c:4e08:b0:4a1:ce33:1536 with SMTP id 5b1f17b1804b1-4ac1719112emr360222115e9.9.1793802490760;
        Wed, 04 Nov 2026 06:28:10 -0800 (PST)
X-Received: by 2002:a05:600c:4e08:b0:4a1:ce33:1536 with SMTP id 5b1f17b1804b1-4ac1719112emr360221625e9.9.1793802490212;
        Wed, 04 Nov 2026 06:28:10 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9faff90sm162472315e9.5.2026.11.04.06.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 06:28:09 -0800 (PST)
Message-ID: <ae9abdea-6c34-4386-853a-862f5f16b031@redhat.com>
Date: Wed, 4 Nov 2026 15:28:08 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] vhost/vsock: size receive SKBs from declared
 payload
To: "Michael S. Tsirkin" <mst@redhat.com>, Daehyeon Ko <4ncienth@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Bobby Eshleman <bobby.eshleman@bytedance.com>,
 "David S . Miller" <davem@davemloft.net>, Will Deacon <will@kernel.org>,
 kvm@vger.kernel.org, virtualization@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261004235101.1464007-1-4ncienth@gmail.com>
 <20261104065405-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261104065405-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 12:55, Michael S. Tsirkin wrote:
> On Mon, Oct 05, 2026 at 08:51:01AM +0900, Daehyeon Ko wrote:
>> vhost_vsock_alloc_skb() sizes the skb from iov_length(), the total guest
>> descriptor length.  virtio_transport_inc_rx_pkt() instead adds hdr->len to
>> rx_bytes and buf_used, and budgets each queued skb as SKB_TRUESIZE(0).  The
>> guest controls the descriptor length and hdr->len independently.
>>
>> A guest can therefore provide a 64 KiB descriptor while declaring a zero
>> payload.  The descriptor-sized skb remains queued, rx_bytes and buf_used
>> remain unchanged, and only the fixed queue-entry budget limits retention.
>> This is not a lifetime leak: the skb is freed when dequeued or at socket
>> teardown.  Repeating this across connections can nevertheless exhaust host
>> memory.  On Linux v7.2, 455 such descriptors retained 30,255,680 bytes for
>> a 262,144-byte receive buffer; a full-payload control retained 265,984
>> bytes.
>>
>> Vhost previously read hdr->len and allocated pkt->buf from that value.  The
>> conversion from virtio_vsock_pkt to sk_buff instead allocated receive skbs
>> from the descriptor length, introducing the allocation-accounting mismatch.
>>
>> Copy the header into a stack object and validate hdr->len before allocating
>> the skb.  Size the allocation as sizeof(hdr) + payload_len so descriptor
>> capacity no longer determines queued memory.  Check payload_len against
>> len - sizeof(hdr) to avoid addition overflow on 32-bit hosts.
>>
>> Fixes: 71dc9ec9ac7d ("virtio/vsock: replace virtio_vsock_pkt with sk_buff")
>> Cc: stable@vger.kernel.org
>> Assisted-by: LLM
>> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
> 
> 
> Weird that this wasn't applied in net yet.
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> let me know if you want me to apply this.
Someone change the patch status to 'Not applicable' likely assuming it
was vhost stuff. The patch fell out our queue, but I just applied it.
I'm not sure if the bot will catch it up, given that the patch is so old.

/P

