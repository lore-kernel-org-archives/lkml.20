Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660398;
	b=em8ra+TxOs+1wYl7AsnXgyoFFfDfEvgR54C2TZIcB6Iq6xD2QNMgg6CWz25/DSiPszZ/
	 XUJU/uxfkU7Dsbc2SDKsCzd5AEJawSgicjaI0foYYBo7tZ2WXee3FVFrP9vTShV21VT6Z
	 hfgl1DyE6L+y32mShaaw5L9OD++ff1QR5IsoNY08SIjMcesmfJ3w7T+sBpAcdD2trgpAd
	 u6svf0DtG+mLtuOY4DpzFMtVGuSMcmmEzjZcAaoxz3TCI4HHIR22VHLM/a8tYTIaouwAY
	 zETPUCUy6K/xrB6WJnQJms+1d7TS1T0ndai1ID0dsBNt2UX+uPZrvDzMfPBMg/gHFIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660398;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=KD0Mk8IG/3dFOFAhD+Ckq2+dMBysvVTIIo6/IjFXKDY=;
	b=rdzKdYyV+1hkEvoktH7jiUdpljTOgr6exK2XbswGaSpFWcg975Qcs67hDtBGedSmGIBH
	 Duwxf0pvKta3x58rLJK7zpgk7yi8JmGwMkcVDPdDBKDjtbhff4spwvP4HZhqz/kRuaWEN
	 9wXT16ZTM4jrCMBHJeOzN7sa1WuV67dyw/yt+o9x/clgjeRo1qcgpUJheJ2FhXmdvkvjD
	 DSVR1qmR5XB4U7ZfNYDSoPrNd531SZhXnN6WoXJIelAL6RYa08VrLNuyZfT/fxW2lSC1V
	 SnIEWU/95mteQF3l0yLgrM/nMTzoI44j+LSdO0eOrQg33PF0k8SeRL8GgsGrUDU0WBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="PqXWks/j";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=s+a89Fs2;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82020606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82020606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PqXWks/j;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=s+a89Fs2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792660396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KD0Mk8IG/3dFOFAhD+Ckq2+dMBysvVTIIo6/IjFXKDY=;
	b=PqXWks/jNZPdA3f3Tt3BZ3QgUtRu18mgpXEKiN3UNy7uS/tcdO6Y7mJ8t1zCxCcB1Bc12U
	78GnBu52goXDdZvq1kfsKIjCjmOahuwGjsgA4BFzMzCUk/NeCgPCn/FHiO2hkb8RPNg2fX
	rHn2coNvc2+hREcs2rjtUYNqpeWc+zo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-SumQh1PqM_6iACtpw6cvEg-1; Thu, 22 Oct 2026 09:13:15 +0000
X-MC-Unique: SumQh1PqM_6iACtpw6cvEg-1
X-Mimecast-MFC-AGG-ID: SumQh1PqM_6iACtpw6cvEg_1792660394
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4887e5afd67so1233907f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792660394; x=1793265194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KD0Mk8IG/3dFOFAhD+Ckq2+dMBysvVTIIo6/IjFXKDY=;
        b=s+a89Fs2sAI+DM1tAxTcOEyWhzs9Gp86OktyAbiMwhKjc2y6JfBxMwHenNjRj4g/fW
         47vXpnWxeF43Gyj/1N5L/Qgrq66uL79psePeERo/vtoL6ZyYf3DCr29BhRWLekB4uHR4
         JIwjEm4ddoPDCHNlgD+v7Ztt2V7MOfmPxfBaiF7PRnaLkmvPMO4CKliR8BCq5AnoRtta
         0EtvV7XqIqmYALywf2ZK6GtPMMj1DMuIYKU+HPJIwImbrLhjHbSX2mkJeV/hqftsyWZ6
         rwWhoc8MpcEPLFcA13KPQPoTFWjNZYYDFGG1ucvGleHRufE2LpfwFoWdbObrNIFMohwV
         hTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660394; x=1793265194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KD0Mk8IG/3dFOFAhD+Ckq2+dMBysvVTIIo6/IjFXKDY=;
        b=bhuKd2+4hL8qDUWJ+hoPeQoaMRep4fV0vJWKEBAf+PRYhivZCPKApn8gNUovRr1zO+
         GRsMb3Ecxuqiur87zWKH89+IlJFWZRepg59pqU0X5V+BdNUEpsEPczfvFWmqx6Q26jOP
         EFw8hEU9lRG8i8L3MhgeSh9F2vTEQDKfuDzeZQoETshv9eMf0NkzwdO2dNkqvdMQIr7A
         FYccagg1oDwzVw5vMxj/I3/2+myf1+q6D1jx25j0cK6LuPVXh36R31NUnfoU5BKNJcFj
         kuEdo6wchEMo/E20DpGurQ9WVjotkwxubHFmNsTu7UtkORZnA6ThUWHqOAMILKXuoCTu
         USaA==
X-Forwarded-Encrypted: i=1; AKwUvBxWZ3wrBYBMgHTGua5m59KYMsD/I7WdrCtAeRQR06iEgJa0EthTFzd50SaXJBDflWJQom7JyUatxZz0XpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa6SVGKv4LBadI0a925yy8pCEmvQ7H1Xb2MkpJ5E8oecfeznnu
	FtE2U4Mw3SYyT5gSLwlUMmtAf+MNDJdu9UORAiYThoQpsyo6k7o9nY/fGtUWTosE6DzpfX64QXC
	EabHTbJQO4I++q8fCAnduMhkt//VB0pAWGrt7FRsR/p1LXShuRNWeTUgql/9IcbMigQ==
X-Gm-Gg: AYBFou2Pk0Rlb+nzqKFhLxZa2SDw0sxixaT051YCnLYsWQg5N+F52LP+p+VknJoJ2p0
	J3aBxqIdeSiBVQ8R+lyQbaZJgBDBdgJlWlODZAfjpTVuv2E6VCp2tfGMIXWj0eCVH39YRCza87w
	EwQX3jO4l93W4VmERkxtBzxEjAHmzbyVPI/5PqP7GZ3ZI2F9NZXWT7V7bHWQfyF0DoqpGYo9xig
	vQdNZYi76pZEIIV8PPLK4nYTUS8CdhaBy8FNf7fgPNfx25T+z6lXe2lUBuZupot5P+JahY1QzZK
	WXFxS6r9DLPCsBCo6J95h67P3FWqKcaFl4fS3ynhHL21ndL6Pq6wPRceAulYvF1LI/NBNMZUbrq
	CjSTAUXSfsItxERnPs80kGpo9hflxsok1zQO/+z/guG8n6omh2grqyNYY7+XEgiXyzlFWjUIFkg
	==
X-Received: by 2002:adf:e00b:0:10b0:48d:ff06:c626 with SMTP id ffacd0b85a97d-48e264c8146mr6814203f8f.35.1792660393963;
        Thu, 22 Oct 2026 02:13:13 -0700 (PDT)
X-Received: by 2002:adf:e00b:0:10b0:48d:ff06:c626 with SMTP id ffacd0b85a97d-48e264c8146mr6814173f8f.35.1792660393544;
        Thu, 22 Oct 2026 02:13:13 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835f46sm11063245f8f.38.2026.10.22.02.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:13:13 -0700 (PDT)
Message-ID: <54d3c327-ed58-4f06-9877-b5998ed8b92c@redhat.com>
Date: Thu, 22 Oct 2026 11:13:11 +0200
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
Subject: Re: [PATCH net v4 3/5] ptp: vclock: propagate physical clock sampling
 errors
To: netdev-bot+sashiko@kernel.org, james.hilliard1@gmail.com
Cc: netdev@vger.kernel.org, kuba@kernel.org, richardcochran@gmail.com,
 andrew+netdev@lunn.ch, yangbo.lu@nxp.com, mlichvar@redhat.com,
 edumazet@kernel.org, davem@davemloft.net, linux-kernel@vger.kernel.org,
 vadim.fedorenko@linux.dev
References: <20261015-ptp-vclock-sampling-v4-3-cba6ffc8ceb6@gmail.com>
 <179245576913.3135.17393378308394380121@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179245576913.3135.17393378308394380121@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/26 02:22, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 (1) · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] ptp_vclock_refresh() (drivers/ptp/ptp_vclock.c) now returns
>    the fixed PTP_VCLOCK_RETRY_INTERVAL (msecs_to_jiffies(10)) whenever…
> 
Both the issue and the suggested fix look legit.

/P

