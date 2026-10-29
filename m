Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793276267;
	b=U2fXViqSAm+WJFuh5GYAnqFUtLb6eh8oG4n+qORHQxw15GPaeoAWD06cp3U121gDqA1P
	 2JpDi4+VHpKauzkyb61mIlOiFxfhvhmGOSwpuEbsBbs0DR89tH9vNn+22Pv4MDPQbuhwc
	 dAcwYfc1jY05CM0oUA2LVUnCeTRMlfqJ45+C7cLykbjqBrTR4RkHtvTMYjj0JwDzFw8k5
	 5Ten/XKKunqfANrBcYMc1Fv30CF3rG8ATxnAQLHHh67LVSAsSPWAxlH+GObrZYKtJnK4F
	 CRtlrxhxc1eVIkYg/f1y24ADDGAU3a/Htr7KixE1kODxXoB4dqjfg9r/qd55RXMQDdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276267;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1Ls6SQIDsEqDayI2UmQuWAtaeX6jCMjrY+XgVw+83fM=;
	b=lUV5Bnm7H0vgTl0pv3324pGvjNgY9jxSxW8f3l9GNm3AC6CHss5kmj5L7Kv3OKYDQ6Nl
	 dfapmCZybWD30oJQPCTlakCV8JDICoOwFdX8SpRxS3d6HaHz2E4Mmp9nQZZJSXYD4vDAv
	 1uTN/WCYfCH5LE8SjMuWUq7cdouQECCnJt8HpjUL7bOR5Yt+K8MYKek+h1wmcyxb7o2Rb
	 nlnPX7dRGVCj36M3EalSkrumxrO5tA4haiZ1J2+FGS2GtW1CoAEcrRV0xomVL/XfwUxWa
	 62zTvHcmIJ1OOxsbx73GCa26KC/2JZ6H70epveX4pjGc7fWKr5vj1kpIC567jNfXl3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NUgE14in;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dhqIoxXR;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1761F606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1761F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NUgE14in;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dhqIoxXR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793276266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Ls6SQIDsEqDayI2UmQuWAtaeX6jCMjrY+XgVw+83fM=;
	b=NUgE14inmzLXpY5RigzA7huJQO1Ne8x1y9WolGkorpMAFtgJhVqsKSQq+XgKYGcLUgZDB9
	eOhTytSYbqxlXwQ5uZRFK3uLT1AGM060esi4TrMeoAk3/ap0yK+Hzr9G1cU/PNbUd7K1VX
	DYFnmhSxbQHRV/CBKgoPKiDSJegN2fQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-0LbpRQJKOhyZE7tgUsTt4g-1; Thu, 29 Oct 2026 08:17:38 -0400
X-MC-Unique: 0LbpRQJKOhyZE7tgUsTt4g-1
X-Mimecast-MFC-AGG-ID: 0LbpRQJKOhyZE7tgUsTt4g_1793276257
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso19056735e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793276257; x=1793881057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ls6SQIDsEqDayI2UmQuWAtaeX6jCMjrY+XgVw+83fM=;
        b=dhqIoxXRdXRVif0YohH1pWgq0Bgqd3SGalJfi+ff8jMofaVu46U8861Mg5kfOyFzdK
         8nWjnI4nY+rQWCo7YiGWc5QBRIj6KWiwjoItKTX7YthMeZAeLM1dyxWVaP7Aaj5YVqFp
         LHKtnDHWnNq7o13FpkEgEEbnQw1beQ4/kEPXJ/tplLPQPwUu9SmNFmuwFBBxMDXmZmer
         FKCNuzDBdQdhSDaSC33gHqIknQ5KAM6deTHPKrPxLQ588Txcg4LJrv+rY9Jd19W7pQx8
         Ih8F5B2mFwWTidBCWsYP5SFHN8vZVG+Y3Y75CF+hfJoD+dtDAPeT40USYKUFBZ9Ad11V
         bySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793276257; x=1793881057;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Ls6SQIDsEqDayI2UmQuWAtaeX6jCMjrY+XgVw+83fM=;
        b=I2FVrlLQTaZAiCXXZu3rKNMOWoUclImMn69wIfRnJEN+tti7wwD4kTKU6gKBAo6162
         sKB/AHoDU+ihwGB2Gi8i03a+2weaPjzdKPlacid3BjYRQ1F7xtFVElmnCRPLs5r55H7G
         11EX/SwRng9ZYVnUHnjhDi3mehOCeWxq0gd7XJPcQCd0hM8xSUmZ94N/TStpgc+6MbDK
         SLC45wBSSax5m7pfwMv6W+eTK77n//yKyQk7oiInHflZKrWlU7JnjlfdZxgTGf5C/ROj
         6UvUzgIgHLpKBcpF4u0u+VyOp83fD6vg++G5q529cbI+qzIqpV+1cHHiXRFEBsTSap0e
         y/wA==
X-Forwarded-Encrypted: i=1; AKwUvBzG+39D97Og0hxONPX+O2IzXz4BD8g5dSQvV39i6k/XjINe/y05AV2Qb2A8vMpzyvgtHOclWmRhfIj6aAQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7WR1nMgUlWkw7QseacRBF+6rpYpbA0h3u1TMZ8wpWFV2TLu3m
	kUR5eZF/pNiKZ/Opr+27yVzPx6JolwfZUkY63d6R4KRVKi9ci5mF2FWDdfD2sYG5ZZMo5hYeBV+
	NV08X9Wx1cEZy+DpXgl321NtNBRxctHm+SPCAf3nZON0SMMnrYmfYFPiOStqZ5bzPCw==
X-Gm-Gg: AYBFou0xgNOCuDuC7wdld207Jo7SC1hvPpr4aH5b3cEaRi8LD4wU04/HlSfJgC3Xil1
	AOgfFPaNS2l7MFiTo6eOxc0nrFHuvRMOQT1X9D6JNmgsygaLL1smwarwvXGKf+m4z43QAdml0Zc
	gnhnFpIfWQ3Cr3T5tmLfCMS3CwQ/amUQDO9O+M/SiTjaOXewp84eLmlueuSVUDcyRUsjZjX+Bw2
	+accxwEjnndekVhX+BcPV3py/2O0iG+GAhvaum8RDZj5beJbtDMBVTq/IiC/DL+iTzHeCnvhXfw
	nfkSp4BRxhW8JBqMzbccLDToPqg8Hk+mT5Lx8EfJug/TuuVxhaPXFich6oQ11nz1CH7xQ0Wwumc
	fvrHHuLw55EBhPH0XZsZDt/XXKs0M3aYKwdC92hha+oaSTwUBlwipLtL2AJqV00duqYVzLhFbV4
	bTAKv0rbTKVaL9zghz4/rzXFKEX+SQ8K1f9R2A9f1N/XP/5Ww=
X-Received: by 2002:a05:600c:4e93:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4a963ffc210mr123001175e9.4.1793276257355;
        Thu, 29 Oct 2026 05:17:37 -0700 (PDT)
X-Received: by 2002:a05:600c:4e93:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4a963ffc210mr123000495e9.4.1793276256962;
        Thu, 29 Oct 2026 05:17:36 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm70764985e9.11.2026.10.29.05.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 05:17:36 -0700 (PDT)
Message-ID: <2172a7b5-a2ae-47b0-a28c-4df2eafca319@redhat.com>
Date: Thu, 29 Oct 2026 13:17:35 +0100
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
Subject: Re: [PATCH net v2] sfc: fix use-after-free of filter_work in
 efx_realloc_channels()
To: congei42@163.com, ecree.xilinx@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, kees@kernel.org,
 linux-net-drivers@amd.com, linux-kernel@vger.kernel.org,
 netdev-bot+sashiko@kernel.org
References: <20261023134214.322796-1-congei42@163.com>
 <179310908138.3134.11515982039281965575@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179310908138.3134.11515982039281965575@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/27/26 14:51, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (1) · Medium: 1 (1) · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] After a ring resize, the replacement channel's aRFS expiry
>    work is never started, so periodic expiry stops on that channel.
Looks legit.

@Edward: AFAICS sfc and siena use two different channel structs with
the same name and incompatible binary layout. That is quite evil...

/P

