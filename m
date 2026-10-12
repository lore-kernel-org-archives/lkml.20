Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A594A6CFF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820767; cv=none; b=j8kNhHRY8L2yS6Pw+S8l7NTM1YkJQeX449kXprV37cIWN92WWl40wVYAXCHAOUj6DwS0Jn1W1YpQfj3eHPVvzQkS1ZSnTxXP1AXb+SiGtunqefgmYdqjKF8weR5d0iDxRAUTDZBd/kgMivODxaY1g5WKwm4OntyvH/wqC/tO66o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820767; c=relaxed/simple;
	bh=RjTtcobNiuX16BwUGzmJwy8cP5rQnF6XH7IuekcPHow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IF5UXlrlfYLI2aBAZMN7kJECP4gZ0Wq0Pr4S3Fdflba/qgUyL46qw1Qpps8t0O6odWvJDh0EppJUNIoi6kwc+6qOXrD2kF+6MqbnBQIbLVg76mAx6rckLVeDFpQUGcclRX7p8Wr49A22XTTaZSxZdFTqWm/vV8hT8dHivMetKwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HkgGeoAc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZHQpKTeI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HkgGeoAc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZHQpKTeI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791820764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CqI0vKWhWID0iPwfFlqep4wyz02zUJ79cFz88qhSvN8=;
	b=HkgGeoAc5+wcLpZEk+/t2BcrDLTmbxDEVyVY8btJeNw3uCdawqsh8MKpVVW2nGdeJ2X13d
	c+h6pmknX2PuehDm9oq64HkgWlvvJbYzq9E0cMcTzG91RigU5PdmYkI53xk12Jqv1xucAC
	tUj/ouFrPN5KTqi3y1YgKt+carbAEwc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-GgYUPHw0OgiI546IrWKhhA-1; Mon, 12 Oct 2026 15:59:21 +0000
X-MC-Unique: GgYUPHw0OgiI546IrWKhhA-1
X-Mimecast-MFC-AGG-ID: GgYUPHw0OgiI546IrWKhhA_1791820760
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so18831615e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791820760; x=1792425560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CqI0vKWhWID0iPwfFlqep4wyz02zUJ79cFz88qhSvN8=;
        b=ZHQpKTeIU+GTQe8mkqMj6h/K8V2aaFUk0FTEPB8hS7r7Wx0fjtOaOCGEFC9fKRuZSN
         IyhCRTVi14CVjQArPEUI3r+hHlM7wAHa67bRa/pun8nntJYcnf5216NAYxVdnIdb5ZhT
         6Qd8qs9sLqqPrKhSgRQv0TPOrI3Yak0ARENsOTQf3IYgFAbesSiVmlAxUPndOnDrH0rk
         LDAx+gllcKi7lS9tsyCEOgj4vVZ6u1L0BKuaT+RqBYldMgIFPUrs4hMgIDUJAUikFBOU
         RDFYNnyVb4wOHCcecvFpMZP45iC38ynVhRxfHl23TpdjyQZRyacXop4aJIxt1WZguNty
         ZkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820760; x=1792425560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CqI0vKWhWID0iPwfFlqep4wyz02zUJ79cFz88qhSvN8=;
        b=TBRrSkXYfhAnwSqzrh6wTSk/fUaJ6L8V8Gr8XYuX5L4udUSKyKXu6nJreRbEAuXNOq
         aOBz1oBZNrdkJSU91/HaXLMQDf5ZCL3C23neUwYa3gkZwHUkApoyxZFB3Ys+K5LQccpj
         O4E2aN45X2YT//Jdg9DerQeMEKBog2cLJ/hMMfH9fhNzgoEqhCxA8gG3TS4YE4Gp+dar
         hJDonGebgE7ssc1AaOagGcUGKBHs7bq+pbgOo1FDU9ahXd7Vn1ID3jgWDBCA4I4UkWFL
         UVsCP19Fb9H4cfOzkfhRP4O/dRvhzuKWzL4SGl53zzc54UKmkM0v2KyJ1fM2Zmrf4WVn
         c6gg==
X-Forwarded-Encrypted: i=1; AKwUvBwf8Qd8wiy8NKux6WlATnjJVshG0Vf02T1dqB4TDlqXHtcVEvNBEfCCT3yyvYu25cV0WWyGby+TSMLUAhA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL4hAhjLF1es7ihG7MUiGnWC8jyWEm/i3IKknTQ95J/2US8Q2f
	TWOw7AjGiQhyjQvavwhwHP9bAxKGHW2e6YQolUj5WeGz2M2Z+n2pbnrcIrR94gu9QeuUeXTLOry
	kvfWv1CQA53++OWgD20I8UE485UZxIK4WY93fi4lhHCot+RHQ2uONVaROLnmxAW2Ynw==
X-Gm-Gg: AYBFou1nd6ttL1aqmKkk0h4PcYIjFCwCEBmRFDUNY9w1TcwhTqcwSzYeE2AcmKh/QNP
	Yh78K+p7HhyjlXNDWtD0wPpxwusuaUrhtCG2A4DYVlewnZgsJWIg3lTDb2oZkii8zeiMYPkxXsV
	RWz35+xCe9qAItcFbtK6xe/6pqbH76WhJnFQbNnfwSV9p+ZOOeBPbwxNrguiMfMxFtUHuMhNOc9
	euaEVwZexc4s3PC7QrSYAMc3FLnh985E9r0C0DRdoV3uQW5p7egpdKEItIvWfohfk0h+1AP5+kg
	GZgjYhGGR8WqXP6mj5eOOPgutNIv1ar0VQxn5HrTtdob4aXo/m3sXZk/X4lIZ+UaM0NO2mIrfx0
	cGpeXHiKjxR6roM1tPxERQvq4N9Al/O/NILMXfM9CgA8fp2FIDNDhVUAgBVyDkiMe9OMPkAVQeA
	==
X-Received: by 2002:a05:600c:4747:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a18e4a9862mr200106815e9.15.1791820760145;
        Mon, 12 Oct 2026 08:59:20 -0700 (PDT)
X-Received: by 2002:a05:600c:4747:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a18e4a9862mr200106225e9.15.1791820759686;
        Mon, 12 Oct 2026 08:59:19 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm327977205e9.0.2026.10.12.08.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:59:19 -0700 (PDT)
Message-ID: <1ab71b00-fbe1-42a0-a99e-27d5cd5e5a6e@redhat.com>
Date: Mon, 12 Oct 2026 17:59:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] net: support thread-specific pidfds for send and
 connect
To: Andrew Halaney <andrew@amutable.com>, Jakub Kicinski <kuba@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>, Oleg Nesterov <oleg@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 "Christian Brauner (Amutable)" <brauner@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>
References: <20261005-work-unix-passpidfd-v4-0-350183b6e02a@amutable.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261005-work-unix-passpidfd-v4-0-350183b6e02a@amutable.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 17:09, Andrew Halaney wrote:
> SO_PASSPIDFD/SCM_PIDFD and SO_PEERPIDFD allow to retrieve a pidfd for
> the thread-group leader. The coredump server using the coredump socket
> cannot get a handle on the task that took the signal and is writing the
> coredump easily. Workloads interested in per-thread authentification
> have similar problems.
> 
> Add SO_PASSPIDFD_THREAD/SCM_PIDFD_THREAD and SO_PEERPIDFD_THREAD. We
> record the sending and the connecting thread in addition to the
> thread-group leader.
> 
> SO_PASSPIDFD_THREAD functions like SO_PASSPIDFD but instead of an
> SCM_PIDFD message for the thread-group leader, SCM_PIDFD_THREAD sends a
> pidfd for the specific thread. SO_PASSPIDFD / SO_PASSPIDFD_THREAD are
> independent, allowing callers to get both styles of pidfd back in their
> cmsg.
> 
> SO_PEERPIDFD_THREAD allows to retrieve a pidfd for the specific thread
> that called connect(), listen(), or socketpair().
> 
> pidfs_coredump() now also stamps the dumping thread's struct pid so a
> pidfd for that thread reports the coredump like the pidfd of the
> thread-group leader does.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> Signed-off-by: Andrew Halaney <andrew@amutable.com>
> 
> ---
> Changes in v4:
> - Moved get_pid() out of scm_set_cred() into scm_send() (Kuniyuki)
> - Dropped unnecessary helps (Kuniyuki)
> - Rebased on v7.3-r6
> - Collected Kuniyuki's RB tags
> - Link to v3: https://lore.kernel.org/r/20260928-work-unix-passpidfd-v3-0-532018a91b21@amutable.com
Out of sheer ignorance, I don't see the shared, stable tree where we
can pull from, can you please point that out?

I think that this late in the cycle, the series could go via Christian's
tree only and we could get it back after the merge window. WDYT?

Thanks,

Paolo

