Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324337;
	b=LQvs8+gSSH5qYG0vY4V8fB9ZPKgZJykm/JD5yK40uBm3HI5XO5Svj29L79IDLIAztJGr
	 fkzzihlJz8cRVkI7lTX1GnbMJTWN9NDmp3c99U+PgelDG9Mj5HlpbP43jXf6E4O32zdH/
	 yjCokoHe/tBCow9F1Wh1N4TqjNsfuKXfBhCwVA94RUIW2pwPMa6QdTGJOcezijgd9Vtes
	 bhVL64TmjcZcy6RaijFaHzE5FqZXIZ5gUqvrkgr3WBYJQ9ctIJfxxMHzy0yKdhBz5uneS
	 gr13tsW5Z1GVuDGLPedrDXcY8tw6+yuV22w5U6g+aRfIl08fMGU8JMj5PETY32gtu+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324337;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wfzKELCAp0cqmrsetofqgnVnCBGLz4JZTetKNjquJ78=;
	b=XOYWwoCXlVVIIMyoKR9Vq8hdgj38qyu3L0XX3hiTcv5QysIpaZ4RVG0j3QdTLJPKBAjH
	 Ac2Ut1EktF0KP/C/Q+P9h93qAn7ufz6kCnYbKDinaeovoJdJpB6dYlnZ1kyONK8PiNkqG
	 QsicA6ktqIPvUmgSPNJY3gB0VzHZKQJ9caOdpay5sg7PsBtm9LVkPJMICCMs4GxmDoFyP
	 vsH3ykpYUhT24rvZEUS2ueESbXD43KNk8I0DZBKE8jQeWOxsaCjtloi0fziBzC2GYasvL
	 JUBmP1INPzV/J7ZxuDZQOMHNWniL9w583ndM1khf1fhiRFGfjGZYxy5irEv8nGnba1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HfhIQZLE;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DDnyK00v;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A61606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28A61606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HfhIQZLE;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DDnyK00v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794324336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfzKELCAp0cqmrsetofqgnVnCBGLz4JZTetKNjquJ78=;
	b=HfhIQZLErRe/6c+8KAaTIHdl1MvlQh5IYNcXeaxAG2LeQqqeduTgRCLtvDLrdV+kzPdesY
	E33HPK5QqHdXpQFQLOwdBkrlh7aiGQHUT+JUWlyxLgFWuZITpKR4oZA4p7TR0sFA4nJVci
	J92n5B7bH+3j2Jjn6CLKPfSoY3eb52s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-oH2gcQy4PAaYv7Q_X0oYAw-1; Tue, 10 Nov 2026 10:25:32 -0500
X-MC-Unique: oH2gcQy4PAaYv7Q_X0oYAw-1
X-Mimecast-MFC-AGG-ID: oH2gcQy4PAaYv7Q_X0oYAw_1794324331
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso17652985e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794324331; x=1794929131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wfzKELCAp0cqmrsetofqgnVnCBGLz4JZTetKNjquJ78=;
        b=DDnyK00vImLWL+Q0AZwLrkWX9auIPGPQiM6c1SnILlCCdDdj3XokEj8m1bXrv7riHz
         /gIyGCLoqA59Arsmmta0VDl0VUtwNmsF7+nU82u26P3Y/8kgE+BTbVoFBwXsSt9B3GVf
         swFcnXVMbuq0FcX/NeqX2SUweiQd4LxI3SMI3vbZ0YaRnRm6X04YH4vsfE6/5roC/6aE
         SEVcejmudHFSMFIOC4bUhJ4USDOy4JjQl9rL5TT1528aSZ9zF6oqDEqzuqHw2yDWqiF6
         tfQfVBSGd00b6+94hDkCsVz7YxNvkOSoi6DDk5InWq56N0o8iOBsL38C0gFo6u4JVDk8
         h/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324331; x=1794929131;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfzKELCAp0cqmrsetofqgnVnCBGLz4JZTetKNjquJ78=;
        b=jnuZu5OXfCp6Yt+dG/O+qFuIJFo4TxWoIMKCZpuGQoO6DQGI5kwm2U4Vh3cU2e8fPy
         tDaxIH7oRWlgsgBcW8URXsPTeIDWH3xzy2/rMHUi5XQRFi7uMp+TeK71JwZi2zoOv822
         ghLb96kXi1slXr0MwE5Wl66U2MDWwR5L2CpdmWg7FpU3R4zIHBnvrsr5CbxSZelt4i7f
         BSKb4cYAIZdSBtdFp3arYWRlZ0emEj7eoBqurbDkwnw9036s2B0FbGqK2AlpLK+iob6/
         l9EwXH/aaq9TSoT8O/jqfopqffnWkOJaaSzKw6vg2ji4+3zJ//pg5uUIASYNcDQVNJmc
         Re+Q==
X-Forwarded-Encrypted: i=1; AL+hErH1okGmrX4PxRSq4twN2xMLWrzFd1o09nGunD7D+WbPKuwfoZmTvxq9whJn12z8x9YzqEhwKSIp9xGI26k=@vger.kernel.org
X-Gm-Message-State: APuU4Z82FsGppZkgWH1UUvbvobcqg9iKRwg7F1QFc0YVRFzfs3m5SI3m
	ogVfEhNUwwXq2N0G2Cok0YYQkBl8IsSlJjX7QqZqE7GP5l9EQZeXluuq7QIUVnNSuHwrmSl/zAq
	yYJMgoKf9X14oaI1I1Sz0XYrcbKg9iZCe4gKpzeErbMJPzaCrpUieof6gHqoNY3X2KQ==
X-Gm-Gg: AYBFou09a9Dmm3ZBSlbtcSvnQwq/3BEBU3seAwSUOirUazSooVyHAjCiMCw6F6w8Uh0
	ZIhFAjP6bftO5DfkN5wtT6Vph1zcNdtvYfNP9zaoua1hXyDTJcSlj2vZ6Y7a3hv1MS8WrOopK5h
	DXGQ6hFAliBOJx5B81bOvdwCjny4TM+q/Hh0L0K2XEVP52vrERPq0u7CIzxjHpdJjCdrpTsDd6K
	3pdFsGuxESAWRTRSx5mfnX8vXd0j8+DpCroiOk/O42TSI3iZHj36HMcDi/oG4G/3tEEiGR4YagD
	W5zAnpi+uBLbWX8kdKoKNt6JVuOMyERnVyskMk+KNS4oHRLMulcTzuoo1f9+Zr1dSjKCJyqHvxY
	MY23omYUx1vW0T59pxPenzrqYHbfZnfEwST8=
X-Received: by 2002:a05:600c:524e:b0:4a3:59c7:f226 with SMTP id 5b1f17b1804b1-4ba02337989mr51499535e9.6.1794324331042;
        Tue, 10 Nov 2026 07:25:31 -0800 (PST)
X-Received: by 2002:a05:600c:524e:b0:4a3:59c7:f226 with SMTP id 5b1f17b1804b1-4ba02337989mr51499015e9.6.1794324330573;
        Tue, 10 Nov 2026 07:25:30 -0800 (PST)
Received: from [10.43.3.161] ([213.175.46.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba476sm83278055e9.2.2026.11.10.07.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:25:29 -0800 (PST)
Message-ID: <cccade50-26b2-49e5-9d06-bde1c4f1c004@redhat.com>
Date: Tue, 10 Nov 2026 16:25:28 +0100
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
Subject: Re: [PATCH net 1/2] dpll: notify about a reference sync pair only if
 it was added
Content-Language: en-US
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Milena Olech <milena.olech@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Michal Michalik <michal.michalik@intel.com>, linux-kernel@vger.kernel.org
References: <20261105131145.1010406-1-ivecera@redhat.com>
 <20261105131145.1010406-2-ivecera@redhat.com>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20261105131145.1010406-2-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 2:11 PM, Ivan Vecera wrote:
> dpll_pin_ref_sync_pair_add() sends a pin change notification even when
> xa_insert() fails and nothing has changed. zl3073x gets -EBUSY when
> another channel has already added the same pair and ignores it, so user
> space is notified about a change that did not happen.
> 
> Send the notification only after a successful insert.
> 
> Found by code review. Reproduced on a ZL30732A board with kprobes on
> dpll_pin_ref_sync_pair_add() and __dpll_pin_change_ntf(): loading the
> driver adds one pair twice and the add failing with -EBUSY sends a
> notification. With this patch it does not, and the successful add still
> does. A test module adding one pair twice shows the same on the monitor
> group.
> 
> Fixes: 58256a26bfb3 ("dpll: add reference sync get/set")
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   drivers/dpll/dpll_core.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
> index 8389983f425695..277692d12d3d1e 100644
> --- a/drivers/dpll/dpll_core.c
> +++ b/drivers/dpll/dpll_core.c
> @@ -1081,7 +1081,8 @@ int dpll_pin_ref_sync_pair_add(struct dpll_pin *pin,
>   	mutex_lock(&dpll_lock);
>   	ret = xa_insert(&pin->ref_sync_pins, ref_sync_pin->id,
>   			ref_sync_pin, GFP_KERNEL);
> -	__dpll_pin_change_ntf(pin);
> +	if (!ret)
> +		__dpll_pin_change_ntf(pin);
>   	mutex_unlock(&dpll_lock);
>   
>   	return ret;
Reviewed-by: Petr Oros <poros@redhat.com>

