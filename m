Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549C839A06D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820858; cv=none; b=Bie8zIC92GsuLWpCGILepVyx5cVZdHeE1QSwlzIgUAkzoEJyiwDCNtJNmK+TSv/78irBkODunxyuXy/d0ow1qf5eKj6JDtHqyJpDYKX8XbdgPG75fw3E+gAYbV+fCHvFLEMypVss9vMSnBvPD3qm9gk33m6L+OJybuuF7sSqnwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820858; c=relaxed/simple;
	bh=tJlAXsc3IVj6GA3rLMrum3xw3F9gMLkW1xaND5zuJDk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ulge0AHu5kl1/1rMkz7Hl4KNddVGK0C4UOj0RhWH9p73wUvmKJIAXbNb6HzWRFGV16OtvQAVV3tHVFabnFED2xPr+zD52Z7NOKv0gGi9mu4tdO/S8FhEtBXVBOb6qfngtHh/771TPlSFq7Q2v929kn1exJJsc03AOAc65ZJbOoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dek27NZv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SO0Yt3ss; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dek27NZv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SO0Yt3ss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791820856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJlAXsc3IVj6GA3rLMrum3xw3F9gMLkW1xaND5zuJDk=;
	b=Dek27NZvBFyHbFHZFhMg7+QhbjfnElrvKHs7Kx4eclNug6jw+KSa2ZasUdxt9ZHVFUqXig
	MJ8flLuaSdmn9mDpJxPhS4QzeT2Xg7bBvJx/PXZFge5KY7ce/CTaWkJtkthY5MfokD+sGq
	VRQ3N69+tsruCiDfgDoPGJo1B5XmI/I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-o5S_CxECN1mqGFYOrMJOww-1; Mon, 12 Oct 2026 16:00:55 +0000
X-MC-Unique: o5S_CxECN1mqGFYOrMJOww-1
X-Mimecast-MFC-AGG-ID: o5S_CxECN1mqGFYOrMJOww_1791820854
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1813fea7dso32367655e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791820854; x=1792425654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJlAXsc3IVj6GA3rLMrum3xw3F9gMLkW1xaND5zuJDk=;
        b=SO0Yt3ssS2n1WXELclsIMxi/2vKMxg/VnDCnwOWd4zWA9rfJCAKdy/iTIikJYADb9W
         svXf3M9T+d52JmV2uvL5r3rAH0PbQ4pK/JudVj3vUF1iE48RnkhT/cK9mUNn8a5oJeJp
         5nGdolQpiROPirWB/f+NxpyIp6BBtlu7l2Tf1LXAo9hckvaPhI6sQTWoWZiw4kLM/GZW
         Xs6EyKQkwp7CVq/uT+ZqQUV0spE6OeDx90YiyLesNkRfdMSkgBNn72zm/F5wXOTVxkI4
         GrDiD7Bx0WyMPcwOYIY/6J9amgsywEMBX9+5TvZrAgiKdf0CtooLiOj5NPP1MFVLRNFz
         PMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820854; x=1792425654;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJlAXsc3IVj6GA3rLMrum3xw3F9gMLkW1xaND5zuJDk=;
        b=s2odb0kJ9TFhDDiNoJ72+XlcFIjhxJ36Up7Le1ues5Sr4EqMflm3gRK/8BEzRB/q4o
         3JTicOHydmjdhA+qhOf0SM0k34xDxj1RPOFu2dahGTIfDKRjbxXricC6onRRlXIXOGfd
         i4guRErWonmoZBgEMaZ+76zdqYucVHKSNo8ovZXzNaBlqM6jHCOL8hVntK4YbUQklv/v
         QDnVQZZkVd1syp5Tm92wS4hkjGpHdmT5qp+UqtMOsB8MP1AtnbrtXR3GlkvdRA51Gy/h
         J0RBIZ/dUDxjj4TV17YcsKfRnr7XYbO5+XAhChMDtnFoLqiV5QoG7n6UdTm/+gZfBzm/
         psZg==
X-Forwarded-Encrypted: i=1; AKwUvBwa7mR/PagAF0PXrpgoly/it65YqybjF6h3F9e5JjBX3BPA9lq5a/5GSv9uRaDoteaKngcVC/yWA8FLRRQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIC2qvexkROphMhyJIZDtpFLUyxpCp+XwkroL/ZUaJy/HGJ/kQn
	8RbfaUf+n77qxaJBE13qJAA80rC7GXkl8IJWgQPTqEd5i0Wmj4xqtLn8H1qgrEV73dBNrC4vIOi
	Ozg9Edv2UUo5omDGS1/MR7rflqXCor9N0huCdsK8G7i/mXklMOO9DmF3ENaxLdJY/YmbOAKbCZA
	==
X-Gm-Gg: AYBFou2a1pJNl6u/alBsbtGfE8ZIkyxVP2k9LIUEjJLYJYfJ7zRuGicAWuWOHSJA2sG
	3VqKC5tgnmUmXLG7+03z9p+ihdsMK1aAR9eStN5HhuWvi2wvvvLLfl7T4d2saI3Eg/PXdT5rc7g
	iGKBspdZFiwNySnDcoIKc4R9cl+UguCYP+8slJH13wvABSdreyoC2VmBDmwSB9vLjwBSzU6ezcL
	JmSSdlm/ne3TIgzaefCrfXVrZSYRQsWX9ElcnE6Lwy2MinyOoDLXbszA1OiZPXVqdV5Ej9lOKDy
	vTjU05wy3G/H5cKUXI7M8vbr0bmdT46qkgp6jhfoQfAz1jC7MSgKy7GN6T/zOUEy6Xm+eQLrESJ
	171WymBPYBSs3sUh7lfCZ1j2rx6eXo24C/oUz1UDE4aFomNkE4AzkYhtKDgR56zRRJyz/iXjVPw
	==
X-Received: by 2002:a05:600c:608d:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a18e48d45cmr207187135e9.16.1791820853532;
        Mon, 12 Oct 2026 09:00:53 -0700 (PDT)
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1372 with SMTP id 5b1f17b1804b1-4a18e4aa206mr205363955e9.27.1791820841800;
        Mon, 12 Oct 2026 09:00:41 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0967beasm240424f8f.7.2026.10.12.09.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:00:41 -0700 (PDT)
Message-ID: <11889de6-54af-4dd7-8902-01e4a5bf97f2@redhat.com>
Date: Mon, 12 Oct 2026 18:00:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: devmem: check uid and netns in
 net_devmem_get_binding()
From: Paolo Abeni <pabeni@redhat.com>
To: Kaifeng Wang <kaifengw@google.com>, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, almasrymina@google.com, edumazet@google.com,
 willemb@google.com, davem@davemloft.net, kuba@kernel.org, horms@kernel.org,
 sdf@fomichev.me, bobbyeshleman@meta.com, kaiyuanz@google.com,
 linux-kernel@vger.kernel.org
References: <20261005210403.3206872-1-kaifengw@google.com>
 <179141784973.434549.3492874220530662715@kernel.org>
 <CAKkY-qOKHkuPfMk+1vhQjRymPKcG5P69CWFLYv46Xp6BiTXO5g@mail.gmail.com>
 <833b5ef9-eda9-4c15-85cd-29202e0f87ca@redhat.com>
Content-Language: en-US
In-Reply-To: <833b5ef9-eda9-4c15-85cd-29202e0f87ca@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 15:48, Paolo Abeni wrote:
> On 10/8/26 23:40, Kaifeng Wang wrote:
>>> Could this break existing devmem TX users whose TCP socket and netlink
>>> socket have different owners?
>>
>> This restriction is intentional. NETDEV_CMD_BIND_TX was made
>> unprivileged specifically so that an application can bind its own
>> dmabuf directly and transmit on its own sockets without needing a
>> separate privileged helper process. As noted in the comment above
>> netdev_nl_bind_tx_doit(), bind-tx is meant for the caller to transmit
>> "on their own sockets". We are not aware of any userspace workloads
>> that split bind-tx and TCP socket creation across different UIDs or
>> network namespaces.
> Still there is slight possibility of breaking some weird setup, so
> I'm going to apply this one to net-next.
Applied to net-next, thanks!

/P

