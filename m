Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8834766B5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944552; cv=none; b=uAUUoRa1qTefz3UHvDD76cn9/tXDXh1o2DXbV805VbkFH5ni/al5uKmfSSSfOGo+AaNdZYksCTPe/lFZWpEHYktClcGM3RX3MXpAJiu3DYNB2+BWi7YpyS2/twb01iu7ug7azS+izSmHDEta9akarveyO8IWdRl+kEnmuxr2v14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944552; c=relaxed/simple;
	bh=g4U2E9hZUa8sF4LfZXxzRRbrWXZNGS1KzuO2/2Xlgcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C+aKJgrJa648Wgl83eXdV2sqLi2BIq7Bt2qCs4Fa/Gnn/U/sUzq18Drs9ymhA7e8qndRAQZ8g4X1S3L+dUfH4lDhzUAr+Xni7oF9KmfJtp9ngIK9gZVLUHMkJEb7pnrh4GUUQDFZguhX+ZaA+XUU4DK/Iw8rqzdWZqvl27iG/5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aUX3/JUk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=n3VV9aOJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aUX3/JUk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="n3VV9aOJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788944549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pVoXZ4NPxwDjL0daQ21jdxg27zbYG0m6UPECpXtbd30=;
	b=aUX3/JUksnPm+RDUxa4wR/PUX9vUynMUIli95RJELeH/6ussxiBAoB26dIvr55C37RBKfW
	RMyb9GTQkEaeWMrevY5oGUU5bn9rgLo4ghyW8Qp9JG2ucJkBWCJApWaxAxU2459KN/y+YL
	jJapLyk20SHQtjZhPb7ttPfkI8fhWAs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-KQ8DilziOJWPNsKhTcrVVQ-1; Wed, 09 Sep 2026 05:02:27 -0400
X-MC-Unique: KQ8DilziOJWPNsKhTcrVVQ-1
X-Mimecast-MFC-AGG-ID: KQ8DilziOJWPNsKhTcrVVQ_1788944546
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4843313047eso3607367f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788944546; x=1789549346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVoXZ4NPxwDjL0daQ21jdxg27zbYG0m6UPECpXtbd30=;
        b=n3VV9aOJvgBic7JjsK9DeKCPhC0Llyinnfv3lNUfZYJE8HscRDZGHXXiw+SAawjYFa
         KAbU5ugdL/T731aiYCnnsQQlihhccjW8PfdvCYXr67kaJ9X73sDb65WpRXcXgAujEIIY
         7EI8Dd6AllDJBWBBqqk0TNaQeYdqGLdJBuAHOhqzwmL4Rpghs2V8ARQni28Y4Kh2E44j
         bQ7dOVbLr6gxWU5ufB+TGVz6WMGizeK+Vq78XxOnGSwP4b7ee1fpI8Qmq5SMeGbrp3do
         BT0NSMmzFlviXAgKAzJLYPKnp5Z6ip13PqdGRsf8dq/hDIX++ZnXaQDZ8l+82bP2bixK
         ejdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788944546; x=1789549346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVoXZ4NPxwDjL0daQ21jdxg27zbYG0m6UPECpXtbd30=;
        b=j1RqMXmwCt+iFhk/76x7g03cSINCTfeFM3y2B3mkHN5kr7yuYwh2icDmnwPGziQ3Rh
         K1muf5+/1Ky1BOTkPbSz+h6t7K6LOMXQMK+9CfzQ/mkQ2ye8ZTgBLL4LUYc92/jSmVtl
         +7/Cx+f2YOKf9bvz/g2OKdNoWfXUFQGD31sRHi2/UBNA62QkcU42IIzBCS8pvVcInMW6
         rkWk97wW3R+B4Nli/sEmFicDo1o1ReC6A3zWzxBZTtLQrssK4YRa/9LDVd/MrmwBGac6
         v2YIuulSpXuJ+B1YXRcnEef0CaY3vG2DPCuMTBfed4emXKL5dCgZo0G6C90yVt8qS90L
         q0Kg==
X-Forwarded-Encrypted: i=1; AKwUvBxk2uFPuNWWxnH5TGtZ+PlLe0TJbBaX06qeZTT+Ze9WyTJVw/7T7cAnbtfdSRDlnowiOdCRHobwF0G8Hjg=@vger.kernel.org
X-Gm-Message-State: AFuF++lNFMsJGAqYYqjN3mohZn5cJMMah+9xBnMGlV2zw2aigv/wa+w6
	6shqoQTzcXwbEjRFLnxzbsQAl7JoX9v/wUt726A5A0o1Ga6+/+zdnZDJHpm7SHsTvF/0Fa/E84K
	XiEIh59lBBUWvuxFmmUb/KL9T2Lwt3svdMtmvgEBSm7yfYY/DeEaZ2mEjBiHYGpFFow==
X-Gm-Gg: AYBFou2YsxECcPYUDmhvWYUwUq2P/sxA1+G/IuirioLGb9C9BZeh7mmvf5ZGaSMsgMn
	+399G0ddoBHjQw02agbQuj7lM8a0O71Xbf4PMOs1PJbsiHjyUoIidMvcn8cvSRaRe1M5eHHgY4t
	CbmGwcp1zmDY1ygekmdfR2QbQY7+ezy5mGl6IUOpkj122H4WICZVCNfAy2ouRdD1GBTpnBK/C2A
	CMfVtbKzaQKqIgpWYtf6luQ+x46DCvIiRDLTtZaVUQt1fKulE8gNRSvlbNU7lWX3bUZ8C8Mr8Xi
	0zwr53rpeNs1N+H3JCjsxH+cQeI9cOwPoeVB9noRGIN3rdnbtTwg8Z7UQEyFmI8WwyMkTLaF0u/
	dpcTaEgEgDNnrne/LC7GJ6zTbBiZbRK5G8KP9M02ePX0fOnLuBmPeTsCLscUdUuBc9Wr9P7vnQg
	==
X-Received: by 2002:a05:6000:290b:b0:485:8f9c:2875 with SMTP id ffacd0b85a97d-485ba5ae7a1mr55771f8f.12.1788944546464;
        Wed, 09 Sep 2026 02:02:26 -0700 (PDT)
X-Received: by 2002:a05:6000:290b:b0:485:8f9c:2875 with SMTP id ffacd0b85a97d-485ba5ae7a1mr55711f8f.12.1788944546003;
        Wed, 09 Sep 2026 02:02:26 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883acd33sm42211696f8f.18.2026.09.09.02.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:02:25 -0700 (PDT)
Message-ID: <c64ea248-6c91-4ce9-aacc-b9128dc08b4c@redhat.com>
Date: Wed, 9 Sep 2026 11:02:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] udp_tunnel: avoid calling the wrong GRO handler
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260906211351.1272699-2-Jeremy.Jean@oss.cyber.gouv.fr>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260906211351.1272699-2-Jeremy.Jean@oss.cyber.gouv.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/6/26 11:13 PM, Jérémy Jean wrote:
> setup_udp_tunnel_sock() installs the GRO handlers before updating the
> global static call. The socket is already bound, so packets can arrive
> while the static call still points to the handler for another tunnel
> type. Receive and completion can then parse the packet differently,
> leading to OOB write.

Interesting. A stack trace would be useful. As pointed out by sashiko
the issue is very likely reachable even without the static call.

I wild guess sort of full GRO flush is required before installing or
removing a tunnel, regardless the static call infra.
> Removing the static call is enough since the existing fallback already
> calls the handler selected during setup through call_gro_receive_sk().
> The helper also performs the same recursion check and sets the flush
> flag when the limit is reached.
> 
> Fixes: 5d7f5b2f6b93 ("udp_tunnel: use static call for GRO hooks when possible")
> Assisted-by: Codex:gpt-6

Even this one is interesting; this patch left out things that I supposed
much older model should catch easily.

Also please see commit 816d9992d9ed434ec52cfbd63080d518e535a41b

/P

