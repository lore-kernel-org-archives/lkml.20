Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634459;
	b=al+CZnaMbPsYTMLNkpfVl+fu5Q7It3V2kLbXPyseDG/R+Y5aIOgS3k2zxZfgAM4G7Qxi
	 P3qGN+yeE14LA3k3S1BQvUcFwQ8+7bEshVMXCX1nPHwkuzJqL+uvU1xmoG5TCe8gMHBNk
	 8ui6HCXwuXbnvvjVTw1gQj3HMFBhB7Q8NwjM22YszBJGXr2TIOb9dGfiNKBinixM4YU/w
	 UbCxvDU8v2p5ITEf6rXYSzLvclN85tzhsxgm2H6sVGvrxsx/E2M3z3ArqAr2NYa/B+xrJ
	 ZAV0RpzkQVXcLKYvLc0oXsfdIWP3vHYwvLNbj35zF1Z+DCsyYlGzElnz/cvSeoQKu1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634459;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6oNFMWCWOpStfYAnMdrje9lXGqu4L1IBJ8dC+bnvLWI=;
	b=YgkODLw6UzK28YMJNK1nc/xNe+tPUKekseLQUaNkBqsThoJwc1/7J2+spbjazbC07nvQ
	 XrAkLAOxFTkfJaoC8Q3gYfsDtgf3XZNl/5F4/M/3KOVs4IT7KhxMJZ47JrJqOGZD9+RH+
	 cnAVMd8XteYhjz7bk1p8TEB7A4Xaigjpkl7gciEvYZg7dx+7sar0+6NQ/3OVeGrNsBeqQ
	 kk/Gy6AV4H2BhKSzQx3pCfTeqC8RHeeNL35wpXg40FasnZlmerICWbLP5L6cHXQWey7Fb
	 7++/LRDky+cov8QO+c48jfUpA2hSLHD5Z/tcOH6fx6uxJavPPfBIx78LLLLdAYLvrPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Iw8RDlD8;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MObWBwTp;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8B8607467A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F8B8607467A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Iw8RDlD8;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MObWBwTp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793634458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6oNFMWCWOpStfYAnMdrje9lXGqu4L1IBJ8dC+bnvLWI=;
	b=Iw8RDlD89ocGpI+AWDRUUv1nfPxnS2+ljNRRYL36vdQDsTtB1v7bmuPGsCvW/7KD2z+TMl
	98bxLST/osBVknshIZY/Rldx4Z68ZJuL2KBBlsIFlmRc6Edco0QnMCb7HP85G6/WkT6An0
	gOODbuMYBN2TfXiJ/9IzvXDt+GCKsXY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-FqdCXoVqMvukZVqIQCSMIA-1; Mon, 02 Nov 2026 10:47:36 -0500
X-MC-Unique: FqdCXoVqMvukZVqIQCSMIA-1
X-Mimecast-MFC-AGG-ID: FqdCXoVqMvukZVqIQCSMIA_1793634456
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c430f0f01so2808172f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793634455; x=1794239255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6oNFMWCWOpStfYAnMdrje9lXGqu4L1IBJ8dC+bnvLWI=;
        b=MObWBwTp7Ynx9mSoZY34Ox3eRHXp0E0x31JMykZiBE48CSh7yK5JH6PQZTI9jcVcGL
         eEqvsf7RCagBPs9zpoNDOd22ITM+rvCxhncV0bZfPCsMRAXTSzknjZKifZkS2LjwBngA
         UisfB2TMA/YECFubsCCtT0f2LpPmp3GbXdKvqu7+ZXOINkhfmFCvOmr81/edJAZSMJXd
         SjvgZumnlts7GKATp5qog+auts1Ap9sOhi6v1DhDqtOr8Q4xTBErYC/Yg2FzRtd/PBfq
         L0SykiO4BMPZtHb2edr62lux0jpyOFzxuPlHYJW9KsnhPqbiVF2ZwOXS5ACtwfWgxIYC
         6LAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634455; x=1794239255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6oNFMWCWOpStfYAnMdrje9lXGqu4L1IBJ8dC+bnvLWI=;
        b=I/lv5d6pPCHXBuF/Si3aPGva0zVSM3xmfirUJ0rF3Cfz7xmALS3nN3Xv6HWwTj/9Px
         oy+cHWTlqO78u12Dve7ychEULVBatIqdrAsa5vduKB/5sl+Cc6GFvmnjzxLImDuaaAlg
         JvGgkWStab+rC5272FfkD+/ThPzTBzIVs4P2aK+XNUyXxEGbEU+ju1MJCnNk73pbJ6jy
         l0oqOt0lgg1wPHRdiEgwK7aSDJqju7J46eNz9XZXMDNro34JY40bWtGRTfVrnnPJjVwh
         Vn+h8d9RoLf496S2IC0mqm2/fMHS9Ef/DHY9CuPieYZ+0OKN5vMi3ES78m6+Y00NvElC
         i2+w==
X-Forwarded-Encrypted: i=1; AKwUvBx+U+lFcbYoKXNJKNIH8ZNO/5QykKXHmagEesGi0HZZ1YhSjgqZUq/b0LwWJ3kn1c1PeIPyrW1+vp4+z0I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lCnAm+W6ZJpiSrkEmnL0sgkOkHdXcJgAh7HkFTbg1G1av6tQa
	wLpKId/CkS0F8iqFnuu9ALQvD83effkKqFPw/IwIL3DOxKDMXbKuf4DQpkzu4U245OvAiI3LsqK
	4LgutYVq4gtX7zWrvhSHV0uDOx8RpCh/T9VIUPK4XL8a7y9OsBCIsMoL3uOhAQSnAjA==
X-Gm-Gg: AYBFou3s+RifHnID+bwlmOUShG8aL5PtO/by+XInswN/2j/30mpyp990EEARh6V+Ygu
	NbK4/EnjiC0BFVb3X2mVw1gD8g0qz+hHRYbCke4UWSnrG130HZK0L+WrZGv4zP+7O4RWEciItUf
	3EQQWSEu078vMg6TQbwM7QPD08YUlrI+RBj84nrKAJzLAuA0Kmcs3yjji/xJQsIqDPMRZ3InDKd
	LQTZuSoYdZPunirsPBtJRvTZmivKh7j2rktqc/5kvcLthps1d6IdTlc/5TG4ukCzZ0Mcz8dTI9Z
	WBIp1rYdQzr1MtlQDyau3vCasX0nVOzQXjqzCZ4vB7L1WOdCqPSiXzI6l3hLD5tn18F2RuJtJUP
	cJ8jXHequ49fcei01uj+f+UtWmxiTci4S0Ma3mb8iB3zzVaPob0Y7En8Ghneo4hjJ3+tTWgzfRg
	luk2X0wLqMBHmE3ZP6BDgF3Y8ioLsDabCOQ9q3c8yhZNM=
X-Received: by 2002:a05:6000:4559:b0:48d:ff71:dd97 with SMTP id ffacd0b85a97d-48e6e2bdd94mr16293257f8f.7.1793634455634;
        Mon, 02 Nov 2026 07:47:35 -0800 (PST)
X-Received: by 2002:a05:6000:4559:b0:48d:ff71:dd97 with SMTP id ffacd0b85a97d-48e6e2bdd94mr16293220f8f.7.1793634455206;
        Mon, 02 Nov 2026 07:47:35 -0800 (PST)
Received: from [192.168.88.29] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm20493214f8f.23.2026.11.02.07.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:47:34 -0800 (PST)
Message-ID: <15433a8b-5e5d-44dd-a12f-f2074857c1ad@redhat.com>
Date: Mon, 2 Nov 2026 16:47:33 +0100
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
Subject: Re: [PATCH net v2] net: dsa: clear the conduit RX queue on receive
To: John Macias <dencity7@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org
References: <CA+KzPspNN14ZEyxisGrOSpgfTqajJfZTXG_iHBRMYd2su1dRKQ@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+KzPspNN14ZEyxisGrOSpgfTqajJfZTXG_iHBRMYd2su1dRKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 03:51, John Macias wrote:
> diff --git a/net/dsa/tag.c b/net/dsa/tag.c
> index 6a5aa7fc3..e53dc3f3c 100644
> --- a/net/dsa/tag.c
> +++ b/net/dsa/tag.c
> @@ -95,6 +95,13 @@ static int dsa_switch_rcv(struct sk_buff *skb,
> struct net_device *dev,

The diff is damaged. Please fix your setup and re-submit.

/P

