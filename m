Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DEE4BB5C1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845849; cv=none; b=Wa64uXQ9iE16zmoueFST56RzO81/4b0ucg1dTIgg/Z5uSyGVEp0O6gjUfUKkcwuGebQBPqxVzQuhJ2+ShlYU5xkR/rTunyQMDlDAkS9tMeBv/nMhPHibBOHRPBFWjJySeS2yubb5TejFAG4tuxtPWtEtXwb5J+Y5ii1ETgdxMyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845849; c=relaxed/simple;
	bh=3hJCZFOF2Kt5aIHoa3y/x0G1EUnJcVAGGBJN7jikIMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDwaEmpz7UMr4COcH6Upuad6W/gSxdFWk7zVf49HaSaX4cDV9nXm7VgPNbVQ86JT1raySO1uMaslmhCRhcbXuAQxSYUV98AfsN2FoX7VGLYIfL0mJZFPW+x4aSOeP9d8JL4s2zBI7kpiIFD7Jv48f9x8iRyXjpKz+izgrJMysKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gLd6yEzx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eiGXL++6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gLd6yEzx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eiGXL++6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790845846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UrHIwX2s5ymEdRKzwilJtkL/ddsHGrLKKobeBr1tlAE=;
	b=gLd6yEzxUw9Qj3ualuy2NCSI9bpXdZjRpLAHYr79ZTGL7IShVZ1zCww0k9XOqC8vwCUR72
	dd+7Rv2Lv1J7KCKJbhAF4tveCPOs7/6qb6Wf8XX6CosyIUJb8BJFhixB6jyRXRgVprsVN6
	N+/hEVDydvhRLYZmPP2aFNSElKp6eHc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-OMjaper7ORGRltZwydSPow-1; Thu, 01 Oct 2026 05:10:43 -0400
X-MC-Unique: OMjaper7ORGRltZwydSPow-1
X-Mimecast-MFC-AGG-ID: OMjaper7ORGRltZwydSPow_1790845842
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so53656945e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790845842; x=1791450642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrHIwX2s5ymEdRKzwilJtkL/ddsHGrLKKobeBr1tlAE=;
        b=eiGXL++65sIFtJYYNE4sI2fvMYas6ciWNdFBAa6xG4Ph79R4v7cMzq/f1W5olRxsB+
         vkJU2m013lNVwQXyRiX+YG4sbNFg3al0XiuXtdN28w5rAo5amcwwyR5+w8mZnEQyeyRC
         J8AXv5JJB3GCIz7KbsBofdjtFbhGxW1X/S7Kg+CCoqOPdhDN6QSWj6mh1toeWSVpD2gb
         dMwaieOJVUjW7PEgmr3DWNL2GAZHgR+esJFitdpWFJTdE4A8ShsXtZs/CPZ4Aq/MSz6h
         qZLqyB6OMQXb6N/CZ5JMn0y6jzvYmtrNsswLjf4JERYXY2gAOjXFxkj2Kf770iqtcH6A
         lI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845842; x=1791450642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrHIwX2s5ymEdRKzwilJtkL/ddsHGrLKKobeBr1tlAE=;
        b=JnPvfzPI2pejv1MBlupga+MIhFkqydDlQfq47J1NJBxfgHllerW7LCMd4ZKHBZ7yCe
         Vqu5bt6WxlmMOGbNkLBpkGYQwCjwgnWQ9ZQ7kY9AEMx7mjAEdzHLfxH0lVLZ+IefUoG/
         ZjbQsapb12ijhmqJYs8NyjNsDbHxTiggl68ZWjnFi9UzXg4IREtcngmMOsOi3E6J6e53
         H08EbpaGOLv+6OYB7MFNZ9vqjEYz7UFOl12Hs2lUlJQqXaHWsjYNCVQ9mtrG/u0tCVHs
         eA72hWZWAyorv8c6W2A/MOT8/ACGGY/u9H7OC86luVsR3djvjGp28tqNjTn5Hh0neMH1
         1+Ow==
X-Forwarded-Encrypted: i=1; AKwUvBzW71F9VVDi1FHNMkcDfSbzMcOZNJEzIgfNizd0z9xQd5Z9sLlkvlLSebCfG9PDwz+i4jro8naRQcrrHP0=@vger.kernel.org
X-Gm-Message-State: AFuF++lN7jYHy5sKr7BC/C44miwmZMMpNXmjQe2mW1v0PgeN9vBpMIcW
	owDtwkwINlnPTMHsAaBdfKQ859oTnzkmvNc/EcCa+cG4qRLawrKmEIIUi5aOIVCt5uzwuISPeOP
	9++EsTSipCGSUBqkLqyWp01acsVx3Uifsc84dy/TbPo2+7/TTCgwtwMBTI1vQ7Xq3xA==
X-Gm-Gg: AYBFou1Fskq2iVByAsNUaPrz08CxCziTU2o/GQakq4Yt/PlVJVf4o7n6gofR/EBZGQP
	JzgRZsvmzqj95bmi8Eg0o0Tkh3tnIhEHP4MtDRDJwbMp3hdG28Nzum2GVLCgR9qTtC4x0d9+wfD
	GJxDlfFPnHF1dwFgtiq6IR/fGp4p2ehMl1DV014QMydimH3bz6H7Z4bDAWgNXK2W7p7jU6tPgH3
	GpczCxml3fLIYR2RFJHE807/xJ1wuNxkmFn1Y6TQPOFx1agjOuinoPMkzth9WibCnhPxyGgisK7
	EaJMrmE4wyBoDIWn2E+4S1iDq8xVoz6v17B4m4RIe+XInB5vt6NfIMBV0y1NVIyGdefRrzZRWy5
	nZRusI49XWrw6w4pnAhO3zxKfMqMhKD10zJwmTBdpJjtyvEiPIdiGU4wa6jRXC4yM9JdJ+mNXhA
	==
X-Received: by 2002:a05:600c:46cf:b0:4a0:1f9e:5f7d with SMTP id 5b1f17b1804b1-4a01f9e631bmr30046755e9.7.1790845842248;
        Thu, 01 Oct 2026 02:10:42 -0700 (PDT)
X-Received: by 2002:a05:600c:46cf:b0:4a0:1f9e:5f7d with SMTP id 5b1f17b1804b1-4a01f9e631bmr30046215e9.7.1790845841740;
        Thu, 01 Oct 2026 02:10:41 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a023ebe694sm24809015e9.10.2026.10.01.02.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 02:10:41 -0700 (PDT)
Message-ID: <3d9d442f-f168-43da-87b0-010ad5a78365@redhat.com>
Date: Thu, 1 Oct 2026 11:10:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 0/2] tcp: annotate lockless access to
 sk->sk_err
To: quanyeyang@proton.me, Eric Dumazet <edumazet@google.com>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, "Matthieu Baerts (NGI0)"
 <matttbe@kernel.org>, Geliang Tang <geliang@kernel.org>,
 Mat Martineau <martineau@kernel.org>, Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925-mptcp-sk-err-net-v5-0-0cac04d6ea48@proton.me>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260925-mptcp-sk-err-net-v5-0-0cac04d6ea48@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 14:47, Quanye Yang via B4 Relay wrote:
> do_recvmmsg() and getsockopt(SO_ERROR) call sock_error() without the
> socket lock and clear sk_err with xchg().
> 
> Patch 1 covers TCP. Peek-only sites use READ_ONCE(). On the no-data
> recv and splice paths, call sock_error() once and only stop when it
> returns a non-zero error. tcp_bpf_sendmsg() folds two unmarked loads
> into one READ_ONCE() and uses that value as the returned errno.
> 
> Patch 2 does the same for MPTCP and annotates the remaining subflow
> error-report peeks.
Note that there are more possible follow-ups in tls and on the write side:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260925-mptcp-sk-err-net-v5-0-0cac04d6ea48@proton.me

/P

