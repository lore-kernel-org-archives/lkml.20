Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2AC579821
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969291; cv=none; b=qQ59HTn1qEPkDpqN/ioDtCKkc2yCBhGd3AfBlYSLhHTti/VNBKYpVT0Y9Lwny/hfH8dUGdBGk93lMxgdheO9neDrr03fNQc1CC0WzA54+mRRUY6u+jwI2CvVkqH5aSpv5b/GBz/HDEagiJ3ZCiPj+XKgCQl/diFwwi1Ejf23704=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969291; c=relaxed/simple;
	bh=ZS57qCJaJZzvLtWT5rb+UsgkBAE6cq2kv5Ow6zPtdvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RbAF12X7SMzKhKNUpfOxS5WWAiJVoX0TJAaAGhFD2XvRY+ug5Hcntcw1IShm/QSviFbjaYw0H3hYQSeJ1Sfe+UW712L6VgX6hKY+j6OfIY0eMH9id3hUcV8ESsU/RpWcDxkdNcViQexL+WB07f2V1HA888biF6yKQE6pKlDBTZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SWHZ1BnS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fa5g7st3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SWHZ1BnS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fa5g7st3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788969288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QhAkYk+BLfXoLVmp1k/Z3VniIpgJgKO5MbxyHejQ6HY=;
	b=SWHZ1BnSahpqXgpTF7i7H/PTQo0nLq1uwhbktvZ9cj5tdSfuJ2LprNS4RDKmyi/mAmSPYT
	uqQ5EiJRB/1yUWwAWx8XaaKOhliqHDyHsmt3vnB/Ic2zi3PRYT62aqWHMe2+tWUz4GTLb6
	OkMN53mibvOMAadu+D4dkAq1Xu5ZI/M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-S045RVclMiy5hSfen0nM5Q-1; Wed, 09 Sep 2026 11:54:46 -0400
X-MC-Unique: S045RVclMiy5hSfen0nM5Q-1
X-Mimecast-MFC-AGG-ID: S045RVclMiy5hSfen0nM5Q_1788969286
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-485afdd5079so731835f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788969285; x=1789574085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhAkYk+BLfXoLVmp1k/Z3VniIpgJgKO5MbxyHejQ6HY=;
        b=Fa5g7st3Z0sZ6+TymEI5E+NzBfphSSlY768Rw+F3Ax22kVyCGETd+Rx7hiWsf5LZVH
         nv9HOHh1Wzuix3zuyc17XHy/pbkGAYY7QYu3FIIMLzwlNXmVcKE15YxNFAQQ75N8XdGR
         yq40Ix6JJqU745NMY0Fbjq7ZSENafV/1TO5OFBdYwIkWY+b6/PM9Z10iP0FqYc1GSVLQ
         cpBb9guDxJuAu1lxNrGfbv6Pz8FJ74FifvR9IsCcN8gTjL9knYG5eQvO9cS8gCBpAarZ
         VxLsBQDERPkFDkJQfApUgK3akRqd1CFf7JVQhfy5C+sQFYHNyS+CT7RzvhmoSph462Yd
         Oytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788969285; x=1789574085;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QhAkYk+BLfXoLVmp1k/Z3VniIpgJgKO5MbxyHejQ6HY=;
        b=jE23UhzsqGrg1Qg/DT0eriLGrbQIPx08x420MGaFR/Ew4C1VsOMbzqEx9QDbsMZrLd
         VlFtLAKtiUAVzzySjy1JnWQyUnda24USg67I4KLEwB6keSm8SjMdj0kMbQpHm7lWUfK3
         BhA4Ffm4CuKcQSDlFh7NXSJ7NaZ6WPgq2N3JC2zVqBSiaWvbfCjO3trBNLyzPFs3xA4q
         cTGzv159FiZmDPFww6Ctp+NZA7ALZZjK8/U14Zz347wAhYt19TJMAho5crlxpWsH1q3T
         NDtfOr2kf73l0hPRIujLMyUZMTP2lHUvTA60+m94LSCtq4N1wENiy5RUnIBpC/A+7K3s
         BuYw==
X-Forwarded-Encrypted: i=1; AKwUvByKPLmCeNKQLdjeha3dnJXQ3t10BxCI3a2hlFEEBoIJl5U/s9UdmD+D8tzOYRXZOFD63oGCZxTpQcr9fZk=@vger.kernel.org
X-Gm-Message-State: AFuF++lYkUofxBE/G0crNABnRN6LRH/gC7jkMOgoloXFlKzt+NEEE/4r
	+yoHLYotMqwOjRTdYKZEPlTXEXNdvxPImU4ahCE+9rqnAUtXO0c3sSvA4GWPMjzeSz3uwDf8uB2
	39js9V5z0aOk9njJNK5di3m9dD+IxEg4mcKjyAf0H3qzPVMe9hpa8Sh8n5sW39T23AoH9b9fk5A
	==
X-Gm-Gg: AYBFou3TkSihz8t8rExKLt9KG/A9o9qy9MGW3a968cvvbQXTVMeFF3RwZjcozyVXuBa
	dn6QTtAb0gKW2WNNYcjs5F+2OfrWg5bIGdQ1/grf+kM8ZaJLLOhh8J4Ye9Ejgoar0Rq4eSsH++1
	wBRpimQnsvJlVvZEXXIWV6EX7Dk2uJA6hKKfu1pWbkpScw7Wzxicza6st9WT+7242d55Eky+VTX
	WPwqpjOmlj52qAivwceFhQuV0On2D/46Xu0Bnk/dF+shJb7LbhUIHMQivdOwNi03vqnp69Uek2q
	G6RDHwpfbkHXjdmsrR+M67HfNh4pBE8puW5O1d/xWXDAdGWHKwINAXIIOJJH9HeKaQq6ziQRz5M
	gU2JXq8eZkumy23WOSpCFl6RoZ2CD5WeLO7OFgQeoYl4LM8okZrh1bpIgFLK79G70IE1leRDRdg
	==
X-Received: by 2002:a05:6000:288e:b0:485:8c16:a33f with SMTP id ffacd0b85a97d-4858c16a5d0mr33596604f8f.52.1788969285542;
        Wed, 09 Sep 2026 08:54:45 -0700 (PDT)
X-Received: by 2002:a05:6000:288e:b0:485:8c16:a33f with SMTP id ffacd0b85a97d-4858c16a5d0mr33596570f8f.52.1788969285051;
        Wed, 09 Sep 2026 08:54:45 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm44531453f8f.21.2026.09.09.08.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:54:43 -0700 (PDT)
Message-ID: <03f37b1f-a115-4c63-bdb1-7467ae8b165d@redhat.com>
Date: Wed, 9 Sep 2026 17:54:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 06/15] mptcp: prevent race between disconnect() and
 rtx
To: netdev-bot+sashiko@kernel.org, matttbe@kernel.org
Cc: martineau@kernel.org, geliang@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org,
 netdev@vger.kernel.org, mptcp@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260908-net-mptcp-misc-fixes-7-3-rc1-v2-6-df1de70348b6@kernel.org>
 <178896537655.219967.3201901026877077910@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <178896537655.219967.3201901026877077910@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/9/26 4:49 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 0 · Low: 2
> 
> - [Low] The commit message of "mptcp: prevent race between disconnect()
>   and rtx" describes the change as only "Prevent the race using the…
> - [Low] The commit carries "Fixes: b29fcfb54cd7 (\"mptcp: full disconnect
>   implementation\")" (v5.18) for a real race that can leave a reused msk…

Here the code is actually just fine and sashiko don't like much my prose.

/P

