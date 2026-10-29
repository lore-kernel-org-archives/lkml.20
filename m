Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793275234;
	b=mNH+2FDO2Lv/IiH2zoN/PIcRSPfvyT6MsHkocoeYeFN27JhC34XCYB/2owjv5wjKaKhk
	 nYSQ90S/ChD7Izc9+dGnhKZzUcXmfw2l1Z2J2fJ5X7arnK6KVGgxIbs7ZLSoCDCv4p5VH
	 PCMBvsvMv54RPV3TIy20k39FnBCMAHen3brvGk9tG5ZTwxFvxOb04vJHfIvFGlat4rw9y
	 91EpxFb/ZW8ji+ExezKknu1pAv37wgZnFMp+myw+VVjCjX6UR3mSwJI86OJ8tvBs2q8pD
	 M2dZJxaqyBBXrW/UAI0AAYgIrzUzf3a5w5wV4mZKYC7q1vDPa6n/w+RyJwt8o43oRug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275234;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uiB5CX6SbDNNbgC0+8PGZVLff5sDTap/tEnkGLg1G00=;
	b=xEjTzHG6h2S4bfrHNtS6roEJIfo7A3GWxUXJ3bfBtUfnpLxH/OPJce5Xtg1Fft9Qb5KX
	 QkoPlGJjk+jdhKyp6jUyuc0VLG1FEyQZ37+jJqQEuuX11Vpw1zgWgY1DsNFSmwQzETXNV
	 o8pbW9iJWisFm0OQjPnY/cWaM4s62gAqiB8097m50Krvwu26JXtWfFIwVl0HdMGvXKahh
	 fdEXJONsdGm0uHfakWol+z1JlP5FPfVHuQFQves8VZDvDtKeYaHdKeTXaZmmC5YRAGsxT
	 VaSz03xN+L23RGwcd52h9u45mSjPvG0beaaxOhKbdTDpsgSdHNGv2nSKRrpW13ZQaUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bGf4jmD6;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jqo8aOco;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E424606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E424606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bGf4jmD6;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jqo8aOco
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793275232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uiB5CX6SbDNNbgC0+8PGZVLff5sDTap/tEnkGLg1G00=;
	b=bGf4jmD6g0KzB6Tk/05biQR+sIUODRA1h+GwcqKteCYSLmkwUvEHZf5+F7MU/B8Ia9vcdU
	ClyL+dh2llB3W1Kt3W5tzHUe0BoT4JbeqgxhISeTnoVxfJOpMICGVEua0N4RrHTrK8/ch9
	JAotkCIm8X8aqcEVnRmfZHCTXDYxDBU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-GmDkOuLVPd67IyMhpt5giw-1; Thu, 29 Oct 2026 08:00:29 -0400
X-MC-Unique: GmDkOuLVPd67IyMhpt5giw-1
X-Mimecast-MFC-AGG-ID: GmDkOuLVPd67IyMhpt5giw_1793275228
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49953abe51fso15791325e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793275228; x=1793880028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uiB5CX6SbDNNbgC0+8PGZVLff5sDTap/tEnkGLg1G00=;
        b=jqo8aOcowE8cKHQjYvbPsRaxu/4Mn5fZaFPudU4a33mCDnd9U8uFatoSKN/tqbh2P7
         1/WBqJxcs4Q3MMWG1reqIMchK8LGNMFiiBpp6pdrIRqyrppjuOrpkyVST07iKSbtlblG
         Z+di3I6LBDjjLK1LS23htTYvPNLUAtaidoVMVqHUYLhyHawaxpa7OKV6PtcAplby9KIk
         4DVepYLx2GZsb4yYVP4JJTRGajFbXGcufd2thMR2vgvcN7eo5rt0lKUmmj6v8QARbA43
         OIMN1fGXvcGd0D2pLTRO/SxsPYou+14y0lQMoyVqa6p/jsM1P9E95LUM51a9oPjYq0oa
         nM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275228; x=1793880028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uiB5CX6SbDNNbgC0+8PGZVLff5sDTap/tEnkGLg1G00=;
        b=sQuLk3azGBF1aU6ovpp/8rSGw5C9ARU4nw7oHkjNkMxT46mkK5XDwvWFORW6SgUHB5
         VBqVcdxpXLxghJTVNWM4IpE5MOBihheyvhnVPXXLSRVa2F3kvmv8Xs5XsCOCxxg050iy
         CdVcHqVN4A8rdHObijrk0FVUpEt2CJm+6mswmefMAS1iqpI/qOki+/7rHd27zUf2NTJ5
         kBi+cV+mte9Mu2ragVUVLkTM76vHOUIdL0VIgQU+dthH4qPffWwc1TdX8TpSeI9KMBtc
         RfPHFyS3eq8ZoEcogvukNbF7R62OeSmhvPREcgULPmswJjL3fyJhf98Z5eE2A+pOzNZ1
         lmqw==
X-Forwarded-Encrypted: i=1; AKwUvBwabdZpYIABR9K3ibIwcudHd+l2f4yNnxZ0wFGmw30iuLXOHwEry4l5qiXTKzyyP18sAFzjgWJPKi0zGcs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJu882lSccz/PEjDEHLeoVnPEBNT6ladHe/dOBkVOB+pyKbCoL8
	6GUJ0Kyyb/Zdz/yAdC1D+bdsHe2tX7rlYj4km5++hCQK6cOVIyF0C0XAmHoaqrmJPu8bx5Z5yVD
	CZYpEAjp1ZwGE75YpyiVnrGFPMXLAf+rD9qN001e9+M61sIjCMt/mY3dCp2/whwdl0A==
X-Gm-Gg: AYBFou1FT6n+YlGrRQ+zoDKiDfePgTLOsUTflmVwlS9Lz/bD0uWIJAgiQjJWC3Ch76O
	wECpm0FlWv9TDghM9WRWjX1dw11OD/T9mf6JhO18nap48MMzmHlOHayA/n0CdXcl+cfbDrX1dTa
	SUTRQdsjFpx2Y5PzD4b6qZ8WlVVo1tkIIweUZ8P4hZT9cO3N+P2Eq7oGh36IYA8dTG2zbNRKWrA
	8qv0ubChqGU8KVVceplseM21yQNP9HpLvsmm0U4MzUBA5f2bm0PaOvfbF3848odVqkuRZlomlKw
	jMkoJosL3uFrMP83SVQE4koR49mlAevWtTNtNwW/5cJRa5A2JQk8bbE/nHd+Ftq8i18qF9LBwLJ
	XEMAmhrrdnNieonM+A5uK9jfUnZS+6Hg7DrNneKQKz0+wM79r2/hjmHVVftEDndBJwkw9R+QWbC
	gqViZ+JvhAq8K0INH/ET10rWVNl+lRuVZzywRunqPhiPX2hfs=
X-Received: by 2002:a05:600c:4593:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4a966d361dcmr120365635e9.21.1793275227979;
        Thu, 29 Oct 2026 05:00:27 -0700 (PDT)
X-Received: by 2002:a05:600c:4593:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4a966d361dcmr120365055e9.21.1793275227533;
        Thu, 29 Oct 2026 05:00:27 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece5e4asm33255784f8f.59.2026.10.29.05.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 05:00:27 -0700 (PDT)
Message-ID: <e291eaa8-c090-41a7-8e8e-9f86e58723b2@redhat.com>
Date: Thu, 29 Oct 2026 13:00:25 +0100
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
Subject: Re: [PATCH net] mctp i3c: Fix locking in an error path
To: Bart Van Assche <bvanassche@acm.org>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Leo Yang <leo.yang.sy0@gmail.com>, linux-kernel@vger.kernel.org,
 Leo Yang <Leo-Yang@quantatw.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Matt Johnston <matt@codeconstruct.com.au>
References: <58aab766b8ce35d1a7ff38880853cedaec244bf1.1793044759.git.bvanassche@acm.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <58aab766b8ce35d1a7ff38880853cedaec244bf1.1793044759.git.bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 20:59, Bart Van Assche wrote:
> If netdev_alloc_skb() fails, mctp_i3c_read() jumps to a label that
> unlocks mi->lock although that mutex has not been locked yet. Fix this
> by jumping to a label that only frees the skb. This bug has been
> detected by the Clang thread-safety analyzer.
> 
> Cc: Leo Yang <Leo-Yang@quantatw.com>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Jeremy Kerr <jk@codeconstruct.com.au>
> Cc: Matt Johnston <matt@codeconstruct.com.au>
> Cc: netdev@vger.kernel.org
> Fixes: 2d2d4f60ed26 ("mctp i3c: fix MCTP I3C driver multi-thread issue")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>   drivers/net/mctp/mctp-i3c.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/mctp/mctp-i3c.c b/drivers/net/mctp/mctp-i3c.c
> index 4e857dd5df64..59e7bf56fce3 100644
> --- a/drivers/net/mctp/mctp-i3c.c
> +++ b/drivers/net/mctp/mctp-i3c.c
> @@ -112,7 +112,7 @@ static int mctp_i3c_read(struct mctp_i3c_device *mi)
>   	if (!skb) {
>   		stats->rx_dropped++;
>   		rc = -ENOMEM;
> -		goto err;
> +		goto free_skb;

Why the additional churn? Just return -ENOMEM, no point in freeing a NULL skb.

/P

