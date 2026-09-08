Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69203514775
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887919; cv=none; b=r5pQktPYt4n3PgfbGqav1yQroaGddcsPxadwTa/OdLStNbWmBtx4r1C4ZUbzvCWBjs1tRYL96yPc4u6l2hCaH0HW8DxqTMBfj8NnbFArTntElvD2HiqwGs1eEin6adnPpA3IXTtfmX58nZ+Z+5c02k0e5RgHv5f8gGk9Mr8Jqp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887919; c=relaxed/simple;
	bh=pK3v8GX0nntcLuATnAiIxLnfZjvCqyZw+OLGxqqCRRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kxWg6KCFbJGnX2OG1xxFA64S0eikgdGqpxrr+RBifRi/W/vUr9JKobRcd3MM7xFP+iou/2y4yGAxmkYjJZE2UHPrYM91EoRXFuRP5VtfYmhRKzkbpRb7KEABRFoZCuROQPvslUylSTF/7bvaolPIwMlRJjCKYuS9UsioaTzvuMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xm5+4Eea; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sPvVFoxq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xm5+4Eea";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sPvVFoxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788887917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9kXXbhFtHbfVoqpSVY8nkO11mcdqTbDX0R7Npj3gEJs=;
	b=Xm5+4Eea/lqSvojEPRDZWvrJ4z0nf5F+BorbByJsfY6OGsGNQ9NvKApuIq1tFYjw1B5h5k
	GEk6oiw7GwK24VIrtRUYchtWhxL5r0Ulfm3ONAH2HrMRRpN4Z6Zk5UqHFSUmxbPxj3REbc
	CmhjJPqHIqr+V4FQgH3njpxCtbalD2k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-KbeiRi08Pz6GJZT8cxBw_A-1; Tue, 08 Sep 2026 13:18:35 -0400
X-MC-Unique: KbeiRi08Pz6GJZT8cxBw_A-1
X-Mimecast-MFC-AGG-ID: KbeiRi08Pz6GJZT8cxBw_A_1788887914
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49cc9f5bee2so40697255e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788887914; x=1789492714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kXXbhFtHbfVoqpSVY8nkO11mcdqTbDX0R7Npj3gEJs=;
        b=sPvVFoxqQfdmsks/4smubW4dDAcnNH2QFw2/4KOkIiP5CJzk5iiyTk9IwSkYzkU2dD
         vkgZ93b7MS1KixzJxA+PfVTG0BS2afwHFL3kVhe06OO4tupCiHqCDs7cNbT5yrfNvFbp
         1Hq7b5yilHZTProhJflqR0ZsGxqeAmosNOPwi5mqrxc5CAByRKs/qOQhX8RnoP2D+PlE
         IWpr4MNzgQgeMGjae/FgKd0WpWAEaSrJt7xCsHudLZ5CkK8EhfkYFELZz3KmNsA+pB4Z
         ZnFvX7Mmzs4eBSq40sw88IfgxGzWzxYZzKevGJCaCXRQnnoNIMkBEoQDMXwEX2UJ5pRF
         GemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887914; x=1789492714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9kXXbhFtHbfVoqpSVY8nkO11mcdqTbDX0R7Npj3gEJs=;
        b=hZ7fBsALx/sKYuAQskLepttgoPb9cTpptPWdFaQmsSSrI/mw18+Ei9uF8bHvIsWUj6
         fGknmfKZW/SJvehfylPfXjP9yX/sBLoNlQOpsse2lbJ+zp24Ol/wvzZASXZqchbPEZYe
         1QUlShIrUqlgPiGWOBT3R8a46r1yEDMp4l72gcVlHyzmZ/JcT1UGpSw9G+tsT9W9tqFe
         atfSWwZLgUiI4GKh2CsjQ2wF4dZQWcP3ketBMDjVwR/8Ks505zJu3kyvJGHqcaKksVNy
         OZL5GB9xAoy+AsbZvaGHyK4vajqsqb1EMTchINt0LJfevgpnNk5Rk+ZDwS7FKKdqA/By
         wkbg==
X-Forwarded-Encrypted: i=1; AKwUvBxdT0ajyGrxJKrWWFkk3wWIksrd7Sh6cveGniPem0zRDbd2Dg78t1+zgKsj2dtQPg8ta71/mjHzRBG1Vb4=@vger.kernel.org
X-Gm-Message-State: AFuF++nHlMjIMB1L2nQOvgcPX8Gisk1SBachgRjw5FcrvLUs1dds1yhM
	Z3VD+5C/H8OhaoxLKwqapBPsmFSuskFDxrzv/O5EBtopPcS8EQyEYujED3J+azcbpXzHjPYxrD+
	rhBOgooFF5PmqmVyuhVYtrl+FSkpEgJ9OFEezngrnJ5+zUbkMVP1mFuPgVhol3MVyLg==
X-Gm-Gg: AYBFou1oZq30k8E67Y1I5E74s864xMgUwNW/pQvLduO0oSU2U01+gYx3Ka56+FtWRZ6
	DbodnSsyclr7zAE7LT/qRBt1danV3ol3f0Di8BXjeObuBGVel1MI0gsz6ShODH5PlCBsLSCMsEo
	0bV25N9yuj8qnIWaX/ohtKVwM1pjSNyqa6jh9AjlNxG1hMh4g6EvFYNszxE48kH5zs1Q/I9aZDh
	uFFjRD7F2G3gOvxDGpxj1Os/cVQ2R2NOaYovo8p6pl45YuQK0BIuBKx1LB71qHKPMUXC2MlzUt3
	UcF+Mw/utXTEEHB4BmELp9lJzPT5OL6NkWCrrLpuQF1mYZ6TvmxYm0kTxV+Fg15xaw1wSGJcFW5
	0UPtb5j1S6eKSKPJ6lQ2arnKu6YU1l2wPzTZalzvxaccpYx6Om5D7PxVxJFF2aek+E9en5xgc1A
	==
X-Received: by 2002:a05:600c:198d:b0:49c:fa21:1c7c with SMTP id 5b1f17b1804b1-49d1ed0b452mr11152335e9.17.1788887914421;
        Tue, 08 Sep 2026 10:18:34 -0700 (PDT)
X-Received: by 2002:a05:600c:198d:b0:49c:fa21:1c7c with SMTP id 5b1f17b1804b1-49d1ed0b452mr11151945e9.17.1788887913941;
        Tue, 08 Sep 2026 10:18:33 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm283339925e9.4.2026.09.08.10.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 10:18:32 -0700 (PDT)
Message-ID: <f3ac2cb2-7ef9-4faa-8c55-a898dc1f57cc@redhat.com>
Date: Tue, 8 Sep 2026 19:18:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/2] net: macb: zero the link settings taprio reads
 back
To: Aleksei Sviridkin <f@lex.la>
Cc: theo.lebrun@bootlin.com, conor.dooley@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux@armlinux.org.uk, vineeth.karumanchi@amd.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903123652.23900-1-f@lex.la>
 <20260903123652.23900-2-f@lex.la>
 <6cfd72f7-b6da-45ef-886a-7703027a55f9@redhat.com>
 <20260908153253.4144665-1-f@lex.la>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260908153253.4144665-1-f@lex.la>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 5:32 PM, Aleksei Sviridkin wrote:
> On Tue, Sep 08, 2026 at 11:44:55AM +0200, Paolo Abeni wrote:
>> Not blocking the series for this, but note that you should actually
>> specify the model you used.
> 
> I took the bare form from coding-assistants.rst, which asks for
> "Assisted-by: LLM" since 816d9992d9ed ("coding-assistants: simplify
> attribution"). 
I actually I had to sync-up my own knowledge, sorry for the noise.

/P

