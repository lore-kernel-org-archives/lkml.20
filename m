Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494994;
	b=Uj1nT6iphAv8OW4YIPsCY86uouFec0psWyx9o5NyMfGC5scbviHzo8PLEuq0tjn9JeWl
	 pMridkQbUBAESZ9j3hG1Lz0b5zHz//mmykMwUBzS/cfPA03gWlRu2TFE7rn0JInYMsAYs
	 U3lCe0EieKQcO/TkCALzUuKVZh9JkCDZGVbytmOdSIT6ZFIQnvoxEowPvdL96zh1vZa9L
	 3UdtjSsYr97muKoEYQQbZ8wP8734X7Mgd3RLgWx1kU0iYot3uSKxp2PBMH2UytU23kcCW
	 TcH6XshCJEp0X4kiLbH9L15KAgWKbfoTFVOYiOAUuz7pWsO559BGviNoot4e+dj9N8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494994;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vfNdgyP+NRKLkAfEjNEeqH/mZDeg/vBSn9uePnv4O7Q=;
	b=WFlSPK4QdFY/mtoPilf/KMEEGikd9q6UfvFbr+P0U5nOGiykXN1DQPlDK0SQwQwZZqMm
	 hVb5zBNz5r+2pHri6UnexmPKWd/pOWH9uN3in8aLntZoQapktNFc39qCUxGSq28UO51mr
	 nAWFmitVv9urHcCr2oq1VeFQmFFlqJpreqWF2X7pc9Zx3Wdk0x3POYmDoJdSIJt6WLvuz
	 OVhEv6WyZVNo0PsStmRAPuGkHHBbbaRLEE+49WscLAgryldh5+bpGQxawSJcVXzi3xCUS
	 cARDY9/bQf2Iw66UbWZLV1/90r5KeM8rf98h7Pby1+6Rpb2M5Q2HZAH8YinF12JgjaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jodqrhbd;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=d36m5nSx;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47798606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47798606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jodqrhbd;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=d36m5nSx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794494993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vfNdgyP+NRKLkAfEjNEeqH/mZDeg/vBSn9uePnv4O7Q=;
	b=JodqrhbdwsfSHHTa+77gxZFUKM1g9f0CVOOjreAMIPRiUhFBpzagpt0nmSGnJQZco1SVic
	MgD2D9GSf77Lw7rXOGOIGJnQO2kURdx/gF0S66xd+xgVL7VbQSfmi17xGQPsNCCzNsjn1G
	9RRZnR0D4IOy+zoKscYJM+1TKsc0EdY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-_9Im7BY-OSq80aF9v-kq-Q-1; Thu, 12 Nov 2026 09:49:51 -0500
X-MC-Unique: _9Im7BY-OSq80aF9v-kq-Q-1
X-Mimecast-MFC-AGG-ID: _9Im7BY-OSq80aF9v-kq-Q_1794494989
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-490ab0a20ebso3282998f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794494989; x=1795099789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vfNdgyP+NRKLkAfEjNEeqH/mZDeg/vBSn9uePnv4O7Q=;
        b=d36m5nSxoDWdvyYtLqnat3194iJTv5RdLjF8A0cLiDThlGMtUpCYJPUhOr+doqiE47
         SCZNGYTmAilxtj0XcaFk97qT1Zkp0AODjD0FiQd4xlqtdHRJNs5RVOMwhjwOXTk6B2Ot
         x+Mtm4olGs7EyjoH1yE4d7X0dxfs++EXzuH3u8+OU+5P9KQBC1fgxbjlf8/k3jFTdm+s
         cRzGbvNcN10o8dgvCCXKWQ5L7ZdDGFMlmlKCN9XCvf1RjXteKe0+cypskqqHJs/cu4oq
         c/xWT7BVJu1q5tISQ/1tlVUUZcVhx8hQ0HoqfgcgILFrkq+32bZdLEFoM5muSmA3RvaI
         cxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494989; x=1795099789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfNdgyP+NRKLkAfEjNEeqH/mZDeg/vBSn9uePnv4O7Q=;
        b=jpBIXdz1zDGzmys/+8eiZubEiWmMnZR0tgGRZ/U3MkRERuYz0DTwcLsvRuftFVfeYR
         ODS422v8mMww0cveRw3wIDDoHIDU3Qg68L/DveODdMJ2OrJ3hQMGENC7418woIQs/lOt
         RIy5zxoc9DEBvFUEoMOGs79WfA/Y1suDi9p0bzfXrbJuUkdMw22Ngc5BKokUnkQlxgPt
         loBCSGPcjMWxOdT9e+WXr4uNISD8Mh8BgCjC9zw+3FZEmvPPCGXW50kmxgXcw8KY6Z80
         gwHKyYugKoOjwyWBUaS8NxDAKKDLiqwm37bioiZtHMC0iUid+UBDR+r16rRQZLlj/lhK
         I6ow==
X-Forwarded-Encrypted: i=1; AL+hErHVTW857wqaCVqs43P/rpRdHTnV1Y6so6tvGmm5D3cMUVqwmWxNHf4xVjPUv65taRehQslvmzlX5jr2akE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NcxiD+k761OxFOoPTNfjNbWWRRNNmmjSPVB8Jss9H7HpkTP22
	dq5Qt0UQOBslmcNXe7UqpH3SzsRltf5ri5t5HnXxIn3TTvgIYbi5HWBiaU0LhFwneL2KwBsrPNb
	gdICB55hTeyPMEPfhdB4QAHgwuWRTc+CJbjxLceI/7jAKGY7910YhpvRlV820QRSe9g==
X-Gm-Gg: AYBFou3UfKoAUC2/G7QC68JRdWnLZtosSz2VmTsZ7oIogom2pV6y/8j9bJxmvyybsrB
	xFrxURtMddexJuhmMRxcjadzNWEs/ngshmx01TePFPhGxQe7qMhbgI1aes+D1FAmVShB0O7q5HE
	xg3FGMDuztIKLCqGpRGHj7wsXlWdzchwKi3z6NlsEqMy9p7nZciXupmWbbBed5/rGGN8r8kqD3+
	OG/pq+U7POps9MCiRWmt9CpJvcxJ0iRpurKR9z5rXZEzkH0olp0Ig5EHzSbJakIzYxFIpgobzcj
	dLgMvZreoOvOeL7XgYHYkqkcSwGuU6WNC7cft7M1tt1HK+o8J/gA2dtM5ERVjjXitjqUpAJAA68
	aFp+vdLOejEcw68FC7BR+nHpHu2egpq/aFjlSgc7Xwg0qb9/pyYW9SWekM/9L2Qp5dbeHTTPsyw
	VgR6P6VwQE9pRRCZPzVPrkoz+HKKEiP788zT5j5sZdmreK
X-Received: by 2002:a05:600c:4ecb:b0:4b9:ff69:19ac with SMTP id 5b1f17b1804b1-4ba093811d3mr106230345e9.11.1794494989324;
        Thu, 12 Nov 2026 06:49:49 -0800 (PST)
X-Received: by 2002:a05:600c:4ecb:b0:4b9:ff69:19ac with SMTP id 5b1f17b1804b1-4ba093811d3mr106229855e9.11.1794494988926;
        Thu, 12 Nov 2026 06:49:48 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2969e7sm66879205e9.10.2026.11.12.06.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:49:48 -0800 (PST)
Message-ID: <c4910aa4-a477-4b0b-b875-52703fc8bcc2@redhat.com>
Date: Thu, 12 Nov 2026 15:49:47 +0100
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
Subject: Re: [PATCH net-next 5/5] net/mlx4: flush pending doorbell when
 dropping a TX skb
To: Daniel Machon <daniel.machon@microchip.com>, Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, edumazet@google.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org
References: <20261110231304.1859217-1-joe@dama.to>
 <20261110231304.1859217-6-joe@dama.to>
 <20261112134346.zvctvknj4mc5s2pm@DEN-DL-M70577>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261112134346.zvctvknj4mc5s2pm@DEN-DL-M70577>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/26 14:43, Daniel Machon wrote:
>> diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
>> index 123071a47bed..3166837711be 100644
>> --- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
>> +++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
>> @@ -1135,6 +1135,9 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
>>   
>>   tx_drop_count:
>>   	ring->tx_dropped++;
>> +	/* an earlier skb in this batch may have deferred the doorbell */
>> +	if (ring->doorbell_pending)
> 
> I think checking !netdev_xmit_more() here would let you ditch the new ring
> state, but it seems bnxt does it the same way, so fine by me.
I don't think checking `!netdev_xmit_more()` would work, as
`__netdev_tx_sent_queue()` adds more logic to it.

Still I think that the cacheline alignment comment by sashiko
on patch 4 is relevant:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110231304.1859217-1-joe@dama.to

I think a better binary layout for `struct mlx4_en_tx_ring` is needed.

Thanks,

Paolo

