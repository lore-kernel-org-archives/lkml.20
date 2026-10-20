Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502087;
	b=MDDcOfqXkOYwVNULFu0UGXlqs2rY0xHqhKVTV47b1NT5AMMndK1Ss7OD/5YGRSoJBOex
	 ixpKoQ2b8uOTpDJEuRxjBZ61lTA1/GEFBwnSmZ7V5zXSHw3CnV934hwkYZivzsfI7toM2
	 SVTJDAP7Rzyqq6h6ZiPxHduU41JoHZ0vUsjLKYNJ0mzOZ2H+fIrRoRLjMMYjLGZeWS6qp
	 34DNKlT7opRJswm++BGKVQqNsB1RqZ9e+mcMkgelaAE0ItU8YyRiBncgecL9wRcM0sEqY
	 SjifVD77eCRRuoD5E730NK1S1o5Lxw8MVgZqkGFG4EbJNWOpRoxzp+XJaheigT24pZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502087;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QR7kILSyQV1HfB+rNJZZQwe28U+a3tmFcjkLHMatFZU=;
	b=pz63o1Q+Br+CgUSD0EBWP9R+64qqzdbHaufvKizL8wGTahzqNl/kVm3R1dr3P1kFifsW
	 kP2E9r6hWHBKD3lFDQGZio9rX3fw7WL+3jo/6FZ4wmhr48tNEMa6FuZlMTBBfwwCO3yTF
	 PZDbVoo87F/Tl/JjhokI8iMQLOPL5DhP4gVqpr4ZAGBUAEQPpsV2DjHQhhSboU3IyMSTd
	 WM3vIoRXTFphFuw9H1HKzfkMu3fZE2Doc9niPxMSn2ZLS1O57rL87XzeDFBSSC8Hhpgxm
	 kPJ3Xpi32VyXLyLKMoOh0yr7LyWPYu7gEpUBzs/GRG89PWNfmq5cxAdDUjc4/mTVdbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iWmFzW1o;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fuBZMrI6;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50B6606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B50B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iWmFzW1o;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fuBZMrI6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792502085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QR7kILSyQV1HfB+rNJZZQwe28U+a3tmFcjkLHMatFZU=;
	b=iWmFzW1obbUwHPsc8pP9Hd56KiCDD5o2zB+MEoddG14mD6IOinDjuXT+HOYZTw5V9C2ULQ
	j0bZewU1yWjlEF7oXkf5aY2seZiXBVMwwcf31iAEVsLEkZX6zol5oS/wEg6pt9R/de65XI
	VtT8lisbNNCpLdkiJ9VOm03TlYu3N+o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-9fcr_ykNPzmEwBTs4LtqPQ-1; Tue, 20 Oct 2026 13:14:44 +0000
X-MC-Unique: 9fcr_ykNPzmEwBTs4LtqPQ-1
X-Mimecast-MFC-AGG-ID: 9fcr_ykNPzmEwBTs4LtqPQ_1792502083
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48afcecb035so371750f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792502083; x=1793106883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QR7kILSyQV1HfB+rNJZZQwe28U+a3tmFcjkLHMatFZU=;
        b=fuBZMrI6nodLMPuR3BqaMAzawaj8/LqIqNnGc3H/vQe+Znzu7A/Zi/9TsPrbPPbz57
         N+4+M1QzqSj+5P+w58nE2uVjZI3qhG8IM26+6IBogSuXahMsxweltODNDLl9kpklTWz5
         piQ0zKOh+lwBkbfkmNvn0t8luB/RV4x++ly7k9C9QtWy+VRUznSb0bI9LUk6yZYMYjcE
         0YHy9WPwidAR40chnwBZTXdJrg0JEjSSxFQ/CPX6vF4ZE4mj1u87PVoNNiNuqKy07lHS
         4rlH1lLN6tP0yQZq4WuO2M3hVo8eIkfOPyV4OocWw7ySKt1OYK/g7ZCR7obsb6tYdlUg
         OUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502083; x=1793106883;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QR7kILSyQV1HfB+rNJZZQwe28U+a3tmFcjkLHMatFZU=;
        b=CKhQ6hLJI2Ybr5KVLbxQP2Zs7i2jzA69XOLUT/jyzitwkcnllGPNj6uG80B+fSYS3P
         Te9uTPn/M23sX4Ko6Lvj5yN3vjiuj1rnVVx9C6n3EzpXtfEeziOazrIb0JaDdMw8bet6
         HGYnso+xa2kzAtapay0ewqAJqXTRuViXh13INpKoqSb7JLGcwAiTou/nN90Xag5s8jYQ
         qPofdIA7VNPgAcmUCABZayLTi6SsmkwTE2rndsOzdnSpz3lbYBCwGu4Ff81HOIZI6GqD
         iuRmuM0SfTQYqC7ztRBHFEQEn7l2t0s47wd5zCZiSx3fzoPMJnB9zNb2c5NVEfUq2OX7
         9Gzw==
X-Forwarded-Encrypted: i=1; AKwUvBx8AO99HS/ruh/AvWAtyEVLG+D+8j/iohaWQ9VsqmYTdqmPRq9V2EFXQZ5CMzBXA2e1FGaXlftox1ceD/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOkqqnJCQWpXrFaTgiNqkcx3vV5n/0Nstej7KVkFoEkzDR1l1m
	QNDU0szYxpgCd6rwOFWX61coUe1m9HZibgxbqBjHwVA7KvkW46M4lvzdiA+vF6sf95bfwgLeI6T
	/IhOQjf5YNlLgw9G4olgjJmoOfeG63Lz6AxPUaGLZt8nbfz8tMpUYNJj+4aU7pASujaoBK8sKiQ
	==
X-Gm-Gg: AYBFou3wt6e9qPZmNauW0LZLB/wH7XnYNYfh5rBOUvW/IhwvS/BVPied6FNmFsnrcvA
	elQFwWOa3oMv5O+/3dtbuYQ2KJV+MU9bZ8+vTP2DY5pYEd7qyWQy8N1i1l3Yvr9bQOzPmz6YyKx
	cmRyRTMc7A4lodXe0HDqnDhRRQiRPmTXFe8uqQCClhR6CukGWhtE7DFL9JneykXM1ev9ky+xDLl
	cXs9hXLyTuJwfbOvi0KcsvzewDBN/iEARDONlOEHE/6sWdVeJ65KlddRYsh/4Cp7LXUFVCKN40j
	No0Jt+xgxL/SqVLJQcZD/DhHGuuzaCMrmJ2YNojXluLVClbRwUFq0ZY4En/Ou8jm8RKIOMPz3+O
	SlXCltioME6jbh6rKJ1Oe8Q+ODA8HhDZ3EroFXBCSrhr6Q1ypqoOCbk2itbtxkG8W7Mpo2GaHxQ
	==
X-Received: by 2002:adf:e541:0:b0:48a:fad8:52a2 with SMTP id ffacd0b85a97d-48e1e77fb45mr4078406f8f.23.1792502083056;
        Tue, 20 Oct 2026 06:14:43 -0700 (PDT)
X-Received: by 2002:adf:e541:0:b0:48a:fad8:52a2 with SMTP id ffacd0b85a97d-48e1e77fb45mr4078359f8f.23.1792502082599;
        Tue, 20 Oct 2026 06:14:42 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6dbbb0sm6269587f8f.5.2026.10.20.06.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:14:42 -0700 (PDT)
Message-ID: <3e357388-9d7e-4ec1-b2cb-2d4d32bf4742@redhat.com>
Date: Tue, 20 Oct 2026 15:14:40 +0200
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
Subject: Re: [PATCH net-next v8 3/3] net: stmmac: dwxgmac2: add XGMAC
 timestamp interrupt support
To: zhu xin <zxyan0222@gmail.com>, netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, richardcochran@gmail.com,
 muhammad.nazim.amirul.nazle.asmade@altera.com, rohan.g.thomas@altera.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261013033207.1684328-4-zxyan0222@gmail.com>
 <179195062971.434549.3907170504821168391@kernel.org>
 <CAP7veTK6NQtrweDVXsYyiMuru_Svtir5XvY_ATM8a6GWO=cqKw@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAP7veTK6NQtrweDVXsYyiMuru_Svtir5XvY_ATM8a6GWO=cqKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/26 14:49, zhu xin wrote:
> Hi,
> 
> Thanks for the review.
> 
> On Wed, Oct 14, 2026 at 12:03 PM <netdev-bot+sashiko@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 5 potential
>> issue(s) to consider.
>>
>> Critical: 0 · High: 0 · Medium: 5 · Low: 0
>>
>> If you believe none of the issues are legitimate, please reply to each
>> issue of Medium severity or higher and explain why the AI is wrong.
>> If any of them are legitimate and you plan to respin, please let patchwork
>> know by including "pw-bot: cr" as a separate line at the end of your reply
>> (one such reply per series is enough).
>>
>> - [Medium] The commit message says dwxgmac2_timestamp_interrupt() cannot
>>    race a FIFO flush because "PTP_ACR_ATSFC is only ever set while…
> 
> Valid and will be fixed in the respin.
> 
>> - [Medium] In stmmac_enable(PTP_CLK_REQ_EXTTS), the 'already enabled'
>>    -EBUSY check is dead.
> 
> Valid and will be fixed in the respin.

Please note that:
- patch 1/3 has more comments, and likely more relevant.
- net-next is currently closed, you will have to wait for the end of
   the merge window for the next iteration.

/P

