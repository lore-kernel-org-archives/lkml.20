Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633385;
	b=3vY4UJ2BXtdcWOdluE6qk+WDKneURJbgzK0ox6xsRiG8QQk9HjcYyytyf8lmNotiqMJk
	 kdO7m433b9BB/17G5gxGOQM1yAu5m/ed12dTSv1qmFDMeNwJ7gqJwZSG7H0G0DWMPuxbS
	 Nfbpty5hSpW5ER7pstIpiBbXuMiTAtNmZSp3Gr42IjsfHdTqKbjL4jZOUUiNUrhgIflVa
	 jtQdeLYL2w3rHaIE3RCyL9La8QZgR1EQKIImVoFIwezlmYMx0fhMJjseCOQRpAPCTeeUn
	 dCC8KRaL1xBzBfQYoyvmJOMhhjAVzukD9p/fKUvsYUHUxs7sGT+UxCC9LL0uFjccnpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633385;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1ttXRStBxZjXNHjuvGXMWk9I1gtHZhhcUuBKOaR2A9w=;
	b=d6o1Imsx9uz2ZwUX6mjCYrA8OWiHwHP3Tv9Vqx1Ty7IysszawEH5tF06vZWUwM/6zfxi
	 8O001Us0ajPN2nRUIdJ86k+uhRSYlTg9bq3o5X5LJwK/3KD8nyJdoy7GT7GndsfnbbodC
	 iA/BMH3r5SYgKcGMrDAoI5p/CfE7HXPlLIf2IFFNMxskd/QS54zTN90nwhyKS4bHvks0L
	 iO83dnK0J8SYUXClV7abckF14x7KTKYpi6z++BwmFjW5ZU9OaMPjqxgke+xKZl1DTNWrE
	 vn4pMKIjuCcrVSkY83/Knc/+qGBXoezgBaXexnkBYbQPWp8+GwH0EGnXP6gZEKB1YRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cvXQHGIB;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FIHV37GA;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FDC60865E0
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00FDC60865E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cvXQHGIB;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FIHV37GA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793633384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ttXRStBxZjXNHjuvGXMWk9I1gtHZhhcUuBKOaR2A9w=;
	b=cvXQHGIBaOY0vkQQL+xRf0PdTa43xJoAqkHe5yvohAycfi0JDDbt+Y2JwdmQGbkXAkhAiV
	5qXM6FLS4aZoSg6M9M/RYo25GT8VY+6NUpL5cODiVTQg9ZY4NBbH8YTwm/AAtJjn9XWFtF
	dMjpfvyFFQofXumPVcVneGThZ9JkMuI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-r3nRZ9dnNZ2SaiSV2ZkZcw-1; Mon, 02 Nov 2026 10:29:42 -0500
X-MC-Unique: r3nRZ9dnNZ2SaiSV2ZkZcw-1
X-Mimecast-MFC-AGG-ID: r3nRZ9dnNZ2SaiSV2ZkZcw_1793633382
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a2b0669946so22811215e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793633382; x=1794238182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ttXRStBxZjXNHjuvGXMWk9I1gtHZhhcUuBKOaR2A9w=;
        b=FIHV37GAlFA0eFUGkx/hE9mqRhtFe7tg044Aomyq1ZcGPEXedP4WDRWG6pxQjuO9HF
         31HU+ZGGCc8bsSSTDjnsYpBzQqI89M7mjuPpHRQCuS8RUgqEQQ1dEDuxUZwSmC0ZisU2
         xEAux7BJAe38fBZ3rq7JQ0KYoadNzVSL71xEikX8xGFNqEvC2/m+Awit2au3WrzaP3BB
         Y5JF/Oj+t5HRU+pw+eWJYQa+Z/Fk5xegmmjf50WoF84sKA/kSff5Gzql46+BAO4j1fOL
         4lLp8Djbv/SskHig07Dkx9Cp7yU0nyQELrRRcHh68Mpv+IJuniXap9VmWe04pWd88Rjs
         CQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633382; x=1794238182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ttXRStBxZjXNHjuvGXMWk9I1gtHZhhcUuBKOaR2A9w=;
        b=j/7wNbGtTMCEeZwL7m/dY++YlDdjLyLAZH6rvn2k1XAQ7K+gUkwu83V5NTJ0O/Hswo
         5fiQVIHf7oUonhrvG1O1TBs68a/UoPkkXtCjY23uN0WSWGh/0hFnp/gRoVCRFVPZoe/W
         t+/Fd2XdMSDMqucoNyhkxZPYoGRW3f7UZPVHwX3Z490fzTpGr9eZbRW6ncJqkWg4FXqn
         /ZhF4kXsAGGoXIHcY11LCzmnhvycmHP92bYTSCK5G/y+5ruhHLt6CoGhU3XBiEKz5dRa
         nw6XhTLIdl7ZgcyP3reMqen4+a9t2Swbu4UzDpF6D4qzKrQ71ONeLkF+n/qCMzPGa+17
         QthA==
X-Forwarded-Encrypted: i=1; AKwUvBzoyS/koxQVvGOH4Qn0kjmtLG4LtM1TiWLzluZIBpI/s5fu2k34pId4/w6RVM/uXha7kys7LxEi1D/tXM4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVPxLsZAkMJlB2TBsiIpRO/L/I7mC1n/pna+221UWIgU0ZlMN0
	W54LwXkXHeiH89+RiNs1SvoA0GqcwwuXADJxEBT8YfNZ/3h7es0gZKBXSPNfbkjjgB1lNa5hIKd
	ZNCauG90v0E+sYwikuvpCd+1N0dsgKLSUcEAYcLlVsdkgzE0r05bEDRi/R6aSd+X2cQ==
X-Gm-Gg: AYBFou1HWoKmL1CbkDUjMcf5BWxk7Pu/AjzADdaNkQHGKNhCGF9X0b0Ips8t5IEqVnb
	/Zla2/Sz/XxWwr7DkOUIgISKMkDBM8/aKoCM61qhPhGnu1cV5//yN37Ftqpdj/qTCDJ3asj0Tkw
	WcPZDbtvomPAVbwi9nT3MrJpH/vlt3LxPKoUESWfEDOmxqibRkZARMywkL8Wku7SaKbGtmIlk4R
	Af4FC97dlBHXiK4DmsJtki8+Gx0plMzo3vEV/HqviplHZyQPKAjoaHjRmU50DRT3qzRvZmaQIvR
	5kBhBKALYTTK2AWqWiiHlTMCgxU/PrBtUsRhfqEEbvfOB8oxKRgUcDu4/SQ1fgTbsPsqYPHW6WA
	6ygWSJrpRu5q7dqE/alw3PXmyHVCumkv8o++i7gYFHS8YFwTe1tjlF1tGsEKzkNIALvxTSTCwpL
	qAP7PmO3RDnkoOGGD2RkAiNym0jP2MKfskbS4S2+vvJFE=
X-Received: by 2002:a05:600c:628d:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4ac185bd243mr241030425e9.17.1793633381480;
        Mon, 02 Nov 2026 07:29:41 -0800 (PST)
X-Received: by 2002:a05:600c:628d:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4ac185bd243mr241029635e9.17.1793633381011;
        Mon, 02 Nov 2026 07:29:41 -0800 (PST)
Received: from [192.168.88.29] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm352011105e9.4.2026.11.02.07.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:29:40 -0800 (PST)
Message-ID: <9afff44d-f8eb-4549-8aae-f99a53339319@redhat.com>
Date: Mon, 2 Nov 2026 16:29:38 +0100
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
Subject: Re: [PATCH net v5 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: Mina Almasry <almasrymina@google.com>, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sdf@fomichev.me, kaiyuanz@google.com,
 kuba@kernel.org, bobbyeshleman@meta.com, asml.silence@gmail.com,
 dw@davidwei.uk, ap420073@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, horms@kernel.org, shuah@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org,
 andrew+netdev@lunn.ch, sdf.kernel@gmail.com, hawk@kernel.org,
 ilias.apalodimas@linaro.org, daniel@iogearbox.net, razor@blackwall.org,
 tariqt@nvidia.com, kaifengw@google.com, dtatulea@nvidia.com
References: <20261030083539.777877-2-almasrymina@google.com>
 <179357408146.3131.2882435952119280563@kernel.org>
 <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/2/26 00:16, Mina Almasry wrote:
> On Sun, Nov 1, 2026 at 3:01 PM <netdev-bot+sashiko@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue(s) to consider.
>>
>> Critical: 0 · High: 1 · Medium: 0 (1) · Low: 0
>>
>> If you believe none of the issues are legitimate, please reply to each
>> issue of Medium severity or higher and explain why the AI is wrong.
>> If any of them are legitimate and you plan to respin, please let patchwork
>> know by including "pw-bot: cr" as a separate line at the end of your reply
>> (one such reply per series is enough).
>>
>> - [High] The dma_dev use-after-free this patch says it fixes can still
>>    happen for RX bindings made on a virtual device that leases queues,…
>>
> 
> I know about the issues with leased devices. That needs a bit of a
> rework, which I have done locally, and would like to send out as a
> follow up fix.
Will such follow-up rework the code touched by  current patch/series?
how much? I'm under the impression that at least the fix for the issue
reported here would be quite overlapping.

/P

