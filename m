Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575371;
	b=4qKJ5Nqd1V55+gNBaPrQq+70cZRfWBA77Fj5470s+YgmN8vjPoIJzFDdJRLWX4I3mMeu
	 zufUHPq5R0vjMmomNctlAaxCSlUuk8WO3dWOB2XhPDYESus/Pelb+v6r80kny3k7kNNUv
	 1CsrErcq/h4O+OQ9DJfjmqsoMIg/3cyLym2v5Y3jUXzb/rtNUlKXNCMJp+YEe9Ux5YYiw
	 3OXML+q+A9IHQpmRQRI7/347G5p+SkuM0i/SGeAXSY9B37J+5Zl1ila0Wfscr4JEf4kBX
	 bJeKIItiZkxJ49irqmWALY8IIadGuu3+VShEky6W6yMgSOueQDe6Id4mTKG1qhB6qxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575371;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cYn3RNb6sZTF5g4zlzB0KoIbKyBPsuwon0NlGTXggxc=;
	b=0RoSm+/olrxB2/NxtBWvMv6I4t9CbY14tciVEhfM7hVhUol+RJAXrbenGEHmZ2S4tsLl
	 MlvWh2FR1HgfWK82zyVNIpgd240NVXdwGc8yewX296GzjhS7KR4DlDrhapGR2ECwTfgYq
	 fppzjE54XHcj/TohXnLylkjd4oi7lkKjve9MyyEJO2OH9SXpMusnYDa0GDKGldGON0J5C
	 S4LyQQBBhcMQFboqLxKfqy1fG8gst960xD/wMQoSrGOsJRa+SK+x0Y+CNUjogrgBaeZX0
	 ecc4iqOIEtrA1Y+MgoVawMKTYFN2kA8akkrxZqLa6uUxFJdimQCrARDAtm8GyICVvHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JjTEMDlh;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="qhRLRo/M";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F34606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F34606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JjTEMDlh;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qhRLRo/M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792575369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cYn3RNb6sZTF5g4zlzB0KoIbKyBPsuwon0NlGTXggxc=;
	b=JjTEMDlhceFtrzqx4NkVQH3aNgYe+JyMd+m44jvREOu4qW6WdJnv6QQxe0zjdLrSSXc59l
	Tq//zjrmdFm4XWSD/Y3fPrzYLunXH3bcoeSCx+9mJI6QVbFkJ6jHr7EtOd0+i1X4RoQbJh
	pbqSNja5GnsjAo01S0SakuGKhYAGFGg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-UzvjOtfcNla6kN_8cjtj1A-1; Wed, 21 Oct 2026 09:36:08 +0000
X-MC-Unique: UzvjOtfcNla6kN_8cjtj1A-1
X-Mimecast-MFC-AGG-ID: UzvjOtfcNla6kN_8cjtj1A_1792575367
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1d1f26a63so5097655e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792575367; x=1793180167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cYn3RNb6sZTF5g4zlzB0KoIbKyBPsuwon0NlGTXggxc=;
        b=qhRLRo/MfxbP8EPkU8684Xy4stEf+aPg7UB8MMYR5PU7qWgtsUIPI4kOhzmA9e2eU3
         jrVwI5SOESH1p8p+sJxJSMYfaXPT0+VWQyC6npTZg3KoraKTwMMyR1DkaWirqKycHJ3q
         ery6lU2vBOJ6e2o8uKYWNVkbE6ouKEUljaBaejIMcwVjt02/MzWcyo/tzycT8Iw9XTbN
         BbadZHemJz7rVICcuAp35gFl1rQkhnljnztcu6BpZnLOp9rLkl/Qy1aLluhexFv+CNMD
         e9UFKTXLSN54OXkdgeY1RFKcq2fLdnGAwdz9tnLnpiRkKDIUooctkaHfwQ2oQ1xcbzUZ
         Z6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575367; x=1793180167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cYn3RNb6sZTF5g4zlzB0KoIbKyBPsuwon0NlGTXggxc=;
        b=v0a+6PGJ9PWgAf/v3awb3tNjNfp9HbAgEd6jBO/WVnp6AQqIOOUk5HHfkld07avpHW
         Oy456IPdiBrO1mYVcCmPDHAX0UolztNGVoxaCy1MfpG2rCRPGSyEWCG7x+6oxGunnFfO
         9ZaVlzDr/N7MCE12urSDdFM7zLcHgU3UI5uxaeRpCgIOSD61Yn5FuWq1iYJarIb1pGtH
         GZ1/J9l7sLbjRJdip9or1mON6a3QhfPe82XxkC7lG1M1xNGjO2H7bIZjETuuzEO+APRo
         9nw1FQ0uw6AqE5SpkHdMw8mY7Zd5vp+gmAz9Rj5QA5H1ubyHwQLXHz62xukBwFxBU8Fd
         d8EQ==
X-Forwarded-Encrypted: i=1; AKwUvByYW9mhjemiV3yKI/2TAUvSI1Ny2aOzUsLsMf2kkLigCqpjWRAG5J28PWbCs9mepmlCV3ew1dTPKicO+Wg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl9WVG2FkapaYGdb3FYVSxUZzKoukGERtdeGMJS425CpKf1ZsW
	D7z0wDxcgGeYsSTlDnCbQag5F03SpSPIaE44l4PxiNmGJ2pcISpMwuGMqzthXCAnNdO5pYrXPql
	m/xDLiEMfp71pFrSUeYeMnOT2701TBHyBtPycGNrv6/5zkusSz7dQLb2yG2ApZku4NQ==
X-Gm-Gg: AYBFou0MECNLowgEXudJ8Rx0AbCe+QFPmuO04rtuq3Rf6fdQjDHa3LP+gOe7Qm6E8uo
	VMfGU5b84vKa3W6vHkAaVoEboaQPjkabPhF59o6PE1Xcw/FJGp1WwuQ3/dTwENgui0Oyqg3LpcF
	FbF6IJblBp1SxdclqA12K4qkvf0UmukdB27Rl3hMRananrxHEl+lDkQ4/wnTPSff/FlhVB4oBYW
	pc45OqDmA9RTwARFsv8K34pMcbUWbE9CGjd1QzqlF7ZswVHHOVt+DHOt6//FvNivRYGO2jlIirS
	qkOnHQT9+NzXxBxfkMBzoomH+w854v4QQO5P1TqMiexmm+WE7Gu9Qzysm2gojmzIl+bylMMqxKC
	9PPpDYw==
X-Received: by 2002:a05:600c:1c09:b0:4a1:ec5b:dca with SMTP id 5b1f17b1804b1-4a1fdb1f0demr32976635e9.15.1792575367135;
        Wed, 21 Oct 2026 02:36:07 -0700 (PDT)
X-Received: by 2002:a05:600c:1c09:b0:4a1:ec5b:dca with SMTP id 5b1f17b1804b1-4a1fdb1f0demr32976135e9.15.1792575366576;
        Wed, 21 Oct 2026 02:36:06 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.178.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d569d4sm145262265e9.10.2026.10.21.02.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:36:05 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:35:59 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Carlier <devnexen@gmail.com>
Cc: netdev@vger.kernel.org, bobbyeshleman@gmail.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/3] vsock: move SOL_SOCKET options to
 vsock_sol_socket_setsockopt()
Message-ID: <atiHbzuo3s6efCxW@sgarzare-redhat>
References: <20261016132716.272018-1-devnexen@gmail.com>
 <20261016132716.272018-2-devnexen@gmail.com>
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
In-Reply-To: <20261016132716.272018-2-devnexen@gmail.com>

On Fri, Oct 16, 2026 at 02:27:14PM +0100, David Carlier wrote:
>SO_ZEROCOPY is handled inline in vsock_connectible_setsockopt(). Move it
>to a helper with a switch on optname, so other SOL_SOCKET options can be
>added as new cases. The value parsing goes to its own helper too, so each
>option can do its own checks before it.
>
>No functional change.
>
>Signed-off-by: David Carlier <devnexen@gmail.com>
>---
> net/vmw_vsock/af_vsock.c | 90 +++++++++++++++++++++++++++++-----------
> 1 file changed, 65 insertions(+), 25 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

