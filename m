Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A46B4BA1CA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491457; cv=none; b=gLBSKlCR0EiVjGm3OL5uQYBl6bdovac7rb6EdwfWeeS6xMsm1lBGvVkwdcFQq3H800xzKqRGcOzrIIwavSKTqts6RcDlIPpCO5dZepzCcsHbxMnjbm77tWEr4utCh/JP2xSMnHjkZnauJjEqAJtHbRN2BxoBcLIh0T+LdormdIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491457; c=relaxed/simple;
	bh=UGQOSKqIrs/SiqDtxOFHpCo7Bu74vgweEvsNVqBBjrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElcnQYP+pexE8fB+TBvLNOQP7mvNDlqeC2srD7vUuik3cXet3AdDB49tWEq6/hkZBkVfcBrz6PpWnixNmMvyhR/iwdeg6pjeclq+k06fano0qckxwzgkDTQtYdvAscn1gqtBznefQ/ZjQ/WBVD16ZwdgDVfFv+QfuG6/VSVfY28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qt68yUx+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=q1pYs+1E; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qt68yUx+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="q1pYs+1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789491444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lVwyrtqiseLR+Flggta8C18yP1zmqacQADadqELow/g=;
	b=Qt68yUx+1GhhRslqSphHTmbfFvhhRWSDtZYaRwILB0VH5ty7l7I82fiKGKJUlVpFNkp8Go
	sO19/ETPiC4/lgL6Fvu23XM531f0Pa/xoCUBkMEWCXNMlVEmjWFrfWun+5J1BMFjeD2VXm
	+cj162VoD1RCkNs+tmAQhiU474VfuLU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-u9Df5Li8N-WxsThD7tV8zQ-1; Tue, 15 Sep 2026 12:57:22 -0400
X-MC-Unique: u9Df5Li8N-WxsThD7tV8zQ-1
X-Mimecast-MFC-AGG-ID: u9Df5Li8N-WxsThD7tV8zQ_1789491442
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e73659ac5so30086935e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789491441; x=1790096241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lVwyrtqiseLR+Flggta8C18yP1zmqacQADadqELow/g=;
        b=q1pYs+1E3+ddnw2YbDv8FszSaPIRmxowpUQlSM9xlQ/i4LiawhX9O3Z9IY6yq8dBwY
         3wL1ZeiaBFslOlKzwUkNnOEmOcPS6WpD0SNzpPokL4tWNqxA0oxm9WBJtRwrVmadKyCn
         L9xrYQ3dugF5KXlvKdE+asqaQMFRLdpdiYu/8HHRmW+HhcdR+xvqOIQgEO+qVPQEJ683
         /OS4rPxMxhqDIoSE66JAn+q+iW1+G87RloDuxwWBSb+kqv7u6+JaLtbEHY8h8u3vdP/0
         ljXyzHt6jdslMEeevh5K5YKIqcu/8mdhSvULAQ+fYXG93Hv2nH695eyb8q9m/MPCCu+H
         y2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491441; x=1790096241;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVwyrtqiseLR+Flggta8C18yP1zmqacQADadqELow/g=;
        b=N/7q8yYA0XdFOQoBNnJMUix+41aqfLN2gIS674/nPiumfsFWAmdBHWzGwyifP5H0/k
         yk2e7IwDUzda+TmPC6jo/KE4C5PkabWUwqO3VMBoX75eaex/QAwoXPoTBdaqX3UA7uzE
         xkXj5xCdhQAj9xav1tHHurVZMu0IVOTZ+zri/NKc/wtHX7ENmECUASFuqsaJwZ8lfNoN
         9ujd/mNCB1t1RawKrRASopUM007j9so9pI2JU0SYu96Q1g1UmfnBqSuVoxsoxUbpnvLw
         q8RO7Qh/r6P10xl9H3JoCWo2l/AA2ejImZ7cWjXV9Xhgz5oxB/QZPGoiG6LvDSjEspdt
         zjGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAg99Ifd4zOYihYHJjyxLQY9skSDJSy3OWzk1Ty4jS4MoCcvQ/WTXuxZxptImnFJL0oH6IT1GUm1rBTcM=@vger.kernel.org
X-Gm-Message-State: AFuF++khJWJLpxKSdBu/77AgW8uGdardsZEJTD9nOXAo9T1Ufymp0rTp
	OZDNFAgJMyX4Q61VQmRVHC6yTxjW5SyiscTJ+bCwN9G/5HmK1gnZnbeUGxijKpP6yyZMC3LdTCt
	UQcuidmCZoWJfm+6GzDkF992MDFza8OZTO+JBBfdtptQR5jeeG17ADtiQts82aGUUGg==
X-Gm-Gg: AYBFou2Dbht8X0QWqvoQ/D4qudTUoPrAKgvXmkgto9fZJaCTv51yqZdrH7xKRybDPr/
	ZzjVoxDWz6aRdutVqAb0th+/Wi6eKfpguK+Um0qid2FtYizLwqcRVLYlTlwIZtqeU6CGoKdz2oL
	FqlfZEYR1MlWVpZqAKdKtJlUf8G/7Bn6/gniEvVl1zcxQc3NCYeGaFJQERoLE73NDdYLofETOKX
	YArJIce0wVmIXTj4/MsdKNZ7jBnMBEyeB2Mplqm6l2sngqu5RO5FFIePeO+s+Gfc24ky+4up0T3
	aL8u0yRrEn0bmTFzL5+lRFxIKX1aqwSYYWaA14UMCp/vebibNDSmXN2A/Kn8a/0QseDSzFYmsw5
	sjfFzYUh4B6KWd1pK+ZMCr58b00lvHdJj1HboxgwLJ4sa4A==
X-Received: by 2002:a05:600c:4e47:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49e7a677cdbmr79242495e9.25.1789491441614;
        Tue, 15 Sep 2026 09:57:21 -0700 (PDT)
X-Received: by 2002:a05:600c:4e47:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49e7a677cdbmr79242155e9.25.1789491441110;
        Tue, 15 Sep 2026 09:57:21 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9fae9sm3560385e9.6.2026.09.15.09.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:20 -0700 (PDT)
Date: Tue, 15 Sep 2026 18:57:15 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Luigi Leonardi <leonardi@redhat.com>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2] vsock: ignore empty child namespace mode writes
Message-ID: <aql3oxZkJIMT46hS@sgarzare-redhat>
References: <20260915111417.2726515-1-qwe.aldo@gmail.com>
 <20260915141547.3010692-1-qwe.aldo@gmail.com>
 <aqli0Mq_jv28h7eW@leonardi-redhat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aqli0Mq_jv28h7eW@leonardi-redhat>

On Tue, Sep 15, 2026 at 06:32:59PM +0200, Luigi Leonardi wrote:
>Hi Aldo,
>
>On Tue, Sep 15, 2026 at 11:15:47AM -0300, Aldo Ariel Panzardo wrote:
>>__vsock_net_mode_string() returns success without updating new_mode when
>>the transfer length is zero. Its caller then reads the uninitialized enum
>>and may permanently store a stack-derived value in the write-once child
>>mode.
>>
>>Return before inspecting or storing new_mode when no bytes were
>>transferred. This also prevents an empty write from locking the current
>>mode.
>>
>>Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
>>Cc: stable@vger.kernel.org
>>Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
>>---
>>net/vmw_vsock/af_vsock.c | 2 ++
>>1 file changed, 2 insertions(+)
>>
>>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>>index 622dbd0467..816d25b314 100644
>>--- a/net/vmw_vsock/af_vsock.c
>>+++ b/net/vmw_vsock/af_vsock.c
>>@@ -2883,6 +2883,8 @@ static int vsock_net_child_mode_string(const struct ctl_table *table, int write,
>>				      vsock_net_child_mode(net), &new_mode);
>>	if (ret)
>>		return ret;
>>+	if (!*lenp)
>>+		return 0;
>>
>>	if (write) {
>>		/* Prevent a "local" namespace from escalating to "global",
>>-- 
>>2.43.0
>>
>
>Code LGTM.
>Reviewed-by: Luigi Leonardi <leonardi@redhat.com>
>
>To reproduce it, I suppose we need a kernel that does not come with
>`CONFIG_INIT_STACK_ALL_ZERO` set.
>
>@Stefano do you think it's worth adding a test for this case?

Not a strong opinion on this on my side.

Thanks,
Stefano

>
>Just out of curiosity, how did you find this bug?
>
>Thanks,
>Luigi
>

