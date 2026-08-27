Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF70839C649
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818576; cv=none; b=U6n97If+AEWGH7Z18FhD4CvnB8SSSkrirfLqUP0CdGin3VcywXEQMlCBkE9P7pTRc7fab6rzZQ5N/GK2o7cI2hjuNfMr1bOdzET2bLCi68mDa7nt+ai2sxwrKmbg6RbWIWGYRyxwb9k+5yZ4c5Kcq+OdVptqHm8CbzDUrHhseAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818576; c=relaxed/simple;
	bh=5Wil38iMvpsIZK11IUVvoJ5BScZQ47Tf0YA6/5qz4K4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BxeNufR1YJDsGTwesnd8O1dVHp18ya8e+sxX8nawm/mCTNKkCMYKzmPkyVsPc+nkmFL/j9dRVeUJ9qXMAPTkDkLFLLe1RCy8hhlogHJOlws+d2T7imeAfGRLsYPV2blM5R+wDh1fF3bY6obqW8mUxMBP+SXHkpfLiPpvNoQv6RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DxBnwFzG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gy1hf5lz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DxBnwFzG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gy1hf5lz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787818571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tp54ta4RHV2vRPlzgplP43voGXKdaE4x6ZtC8ibQyt4=;
	b=DxBnwFzGVp/vizxprD5TydllWa9y7vAcdsItKN8R65ZaJNERe65E0bev8csX1nYLQumt7M
	SHPzpobUG7DdOc09f6bJ5KjoQMyyoOKadPnzV2//03uDoDgpJ3PZL+/8rHOaRjO0CzI2NL
	tgL01GOH9A3AZaRU7kbZtcoGsU3pKvU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-iWBdJjXbPmGUT7rDQbkxxA-1; Thu, 27 Aug 2026 04:16:09 -0400
X-MC-Unique: iWBdJjXbPmGUT7rDQbkxxA-1
X-Mimecast-MFC-AGG-ID: iWBdJjXbPmGUT7rDQbkxxA_1787818569
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-496c06ba017so3440745e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787818569; x=1788423369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tp54ta4RHV2vRPlzgplP43voGXKdaE4x6ZtC8ibQyt4=;
        b=gy1hf5lz6TjgyEgkigHt8QU11Ko1pwJzzKqS0LHUcYtrtfaNbX4Iuau/7KZ6Ekao90
         loyNCFswJYRqHCWjGjpWRW6fmMZCEquhxTYGv12uZIHF/NLn2maFM8T817wNKNjJgsmm
         bqXp8enU/59ma7Yj3KASvX3ehVbCKJ1UC9bfHdP627mhUxBCxq0Kh9GfRo7eJCKVDjQg
         Hir/5qJg3mvj+CSlmGyOZUh6lyaE2vlbd+9H7oE26kU9agybdryOISosapkoUNTBsT2F
         RlSfgYsj/c88Abtc+O/H7nUhzfSGPYZj9GcIoGdY98XMLr4MxE5lXbMbHuy19hGxUxmP
         7lwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818569; x=1788423369;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tp54ta4RHV2vRPlzgplP43voGXKdaE4x6ZtC8ibQyt4=;
        b=JNn16qyNxwYe6Ek3G6CWQGkTAP/Sc54nZ15pkafkL4mOXAZA2vbFH7Yf3ozMCNiyT3
         O2DBYBSDBUL+ITWCG0HS8cmWlyqsoas1LEQ/If2wnZhAd5PIM5V3Acqc5EWzjTa8s4je
         L+vaqtg7R4D6+10tnsbxO0QSKPeh1DSiEBhAhZEJfk/cuhU7pnvfjs9FfxtCxP9ULjsP
         STWZpVe99aWyDV3esjwru+Al8wu8z1zU8xxsn9ce2qhU5EjJirACsUXjX7eyeaaNPVtp
         3+JGa8OMpLvSvmUl8GBQFS7VGbgERdcFWU8awKZP0koatm7EOT1aKpHZj9DaaH8ZgYQu
         wctQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMHUmpajAIzu/7dk9REWAQOCy840VXb8RVTW36yhoUKhgdLTwONcl6+d+iodG8/N0YqEqSX7foKZmou4k=@vger.kernel.org
X-Gm-Message-State: AFuF++nPf/H303HBHYQmtETCwFE+W4ykqQx0rASGkmTa54rQVsQFbuxw
	Pp6qG63YtyqLGKPeK5PvPUYbdgR425sUE2uy4g5ZrcIWqiC2a32eVhM8oaYaBJLvPD0gOjzP2y1
	0aM2LVt4JSNZ1zAI8L9aZFRdplBb6VMOmH7bz8YgcY6GfujvqKM4/jmni3gcoP3Dd2I2SwKpCqA
	==
X-Gm-Gg: AR+sD132P1y5PHM3H4ZNeEFN7gTZf5HQy5KblFCda6D3/wFchF/46zAGf75kwkVaC4t
	I8HTBO49xbuLGGwMHGzrhDgovYqwnBbJcyofgiwv3XA8hDeQmOHvNLuUiegndaGn1cFZwrrvLMC
	XkV2lnAz+anjQQ57LkTlV2gXLN3lxscpB2HN9EcSyO15nEhNjfmZzk8dADTQlOP4QP0GggIpkGy
	sJqaN8oGlRjyDfy11/mNjXssTRH58fywgFFLDAUM9xhD67XMlmMfNQ8jOVvs5GwfgOopFtUKYwS
	0vldk3eA6l1jobTTPAcxmc/l6hAaWRvwp6CF2/AzJzaiB5zmHCfmlGhHvZUAW7nawE5KaVx0D4t
	Rymc8Nl+wx6lrRKVrMOPv3+34ORC15zetl3MczoA3k3a6xjrV71AD35dVrylGISNf+kV25lk=
X-Received: by 2002:a05:600c:46d0:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-49b0dd5821cmr54084715e9.0.1787818568700;
        Thu, 27 Aug 2026 01:16:08 -0700 (PDT)
X-Received: by 2002:a05:600c:46d0:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-49b0dd5821cmr54083825e9.0.1787818568254;
        Thu, 27 Aug 2026 01:16:08 -0700 (PDT)
Received: from [192.168.188.103] (ip46-47-231-195.pool-bba.aruba.it. [195.231.47.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4af00fd2sm29601255e9.12.2026.08.27.01.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:16:07 -0700 (PDT)
Message-ID: <9397cfcc-03ee-4269-a9f9-97df1f454ebd@redhat.com>
Date: Thu, 27 Aug 2026 10:16:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: pktgen: return bool from
 __pktgen_NN_threads()
To: Chengfeng Ye <nicoyip.dev@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260824152331.216494-1-nicoyip.dev@gmail.com>
 <20260825185313.239861-1-nicoyip.dev@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260825185313.239861-1-nicoyip.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/25/26 8:53 PM, Chengfeng Ye wrote:
> Callers of __pktgen_NN_threads() only check whether a pktgen_dev was
> found. After the RCU lookup they never dereference the returned
> pointer, so returning it past rcu_read_unlock() is confusing.
> 
> Return bool instead and keep the pktgen_dev pointer local to the
> RCU critical section.
> 
> Suggested-by: Paolo Abeni <pabeni@redhat.com>
> Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
## Form letter - net-next-closed

net-next pull request for v7.3 has already been merged, and therefore
the net-next tree is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 31st.

RFC patches sent for review only are obviously welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed

