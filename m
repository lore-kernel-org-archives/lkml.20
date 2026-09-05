Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9593BB10C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 22:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788647369; cv=none; b=J7boC8eaBe4LYQS3zezq6CS/CU0Iyk6ZT6ghGxHegDFcxxfFA3yYg/jzScT+wefOn90uGeUl4/5c1YtMcDn2WOZND3wx2Ekz3GvGcYTQ0PUJn3r2zfnlugWX/6rw7rgrC+AebZ/+thMR7wOz2cfCHUK8DE97AKv6XYwRRVraBvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788647369; c=relaxed/simple;
	bh=cNAGGx3rMgGlsu3cbR8Rhaq9SGr+SR+NxcnRiNFe4hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rA7BHEXvJg0i2TSAt0LQlMIRB/Tegz7q9Q7IX7hIIp3js5tbOyqu+8I698aerVI3Zuk1OPxG0KHygoZ1UT5enfr171faWxCc28YbL7BL4mpduW8V2Qp7QpyTo8bLwRbmOV+vw3L9hbPYmILXPyCe35ET1vjAVWcGATl1DaOTAG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49954b88fffso16607095e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 15:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788647366; x=1789252166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgqZxXmflp7+ufkovP28Gc9sksCc0hIZ5y20+xl/r48=;
        b=N7VKuQVE2vd6iV/txDqp33OChgWfDeeLU5BnwDPTN/iSZq97nN3OY6Q7edEP24mdZ3
         w+KRH5RqLX2G3obLZafkoHGCafDgfwn+gaF4mghAlp35R/8T7wuqqG02Cym7gWu/8PrI
         U0xNOBYsRmJWYceIvtmsFT8jiku7EKx3Xvu52EeebefaSAQ5oTayJVgws9f5KVxBhcua
         5AX9XH30aoausvIJsDc6FHfLYv30otVb/hSrF8ejowaH/gVzh1LkGPUINji6g0vmZ4oa
         ChyNblKQlaNhSmUAFPqHHNvSKA/lqMTvKf+R47Jpzlviqv3x9ka3/crMICJMpI7nKng3
         1LRQ==
X-Forwarded-Encrypted: i=1; AKwUvBydlV0SBDfHOHywmcz3z3eq2RLCKq0IXmhyx7sxpQce1Nw58hTcwqZsBZjDpW3zhKwgI53vDc9SdSGyLok=@vger.kernel.org
X-Gm-Message-State: AFuF++lbNC2R4waVr/QszwvuE7k355i4nBce/5s/1HUK1GbmVNBJs/is
	lEIG4NnxGF5kPzPrybb/QxgweU3LLhl3VE8Z8EVZEmFaHSOI10t3DeFb
X-Gm-Gg: AYBFou3nifyOc4gCRtVRS2dP7mrarqiChRMrzYRGR/itWUbjQL4Y28nqRzzmA89V3o6
	pXTglLCUGY2PoJhuWBGVfNtwtzDaMis2Q2gaNOQoEqcByIDGyPtCWoMARMDmOVZB2qWHMyiJjG/
	IVf9KIkFEqPZzKaw8hMDH1fmo5osh1xiqk1Z8S98/vrbN3Pn2P2OMVAeLtm5cZOLb1G/v2x3AES
	6kfN//F9MU+UW3w3yzJSUlcSQsIitqYKiaEi4sPkT7Zb5001WmIvkgvr3/pp02rv+vsbPP/g+/e
	eyeC4L6XlbwqTjwbJi4DqGuRTyo+mclW791oLuYT6+OfAWIMrjH+AHtxLM71BX8scXgoB/V3djU
	BotSb02pdc4+4s6POJ3ySpMaGBtqxpRlo6WDFolRqUJLTQvHCWnHcRlJ3da9a2o9XeV17pwnVfY
	nwqzv2LGjHNDs52Tj4nrBQ5YLjhJd1Y9B5zhvM630clGIju8burzuRqO8Cz47zrtueJmWMDH3Ry
	4MSfZPdb7sf0CY3O1Nwxg==
X-Received: by 2002:a05:600c:190d:b0:49d:72d:9ba3 with SMTP id 5b1f17b1804b1-49d072d9bccmr43376595e9.14.1788647365653;
        Sat, 05 Sep 2026 15:29:25 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm260558705e9.15.2026.09.05.15.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 15:29:23 -0700 (PDT)
Message-ID: <7d73e7e1-bf22-49cc-a943-17b78b430651@grimberg.me>
Date: Sun, 6 Sep 2026 01:29:22 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 2/2] nvme-tcp: parallelize I/O queue allocation and
 startup
To: "Surabhi Gogte (she/her)" <sgogte@purestorage.com>,
 Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, randyj@purestorage.com, adailey@purestorage.com
References: <20260824225648.316962-1-sgogte@purestorage.com>
 <20260824225648.316962-3-sgogte@purestorage.com>
 <c98fe50c-172a-4e53-a30c-5416c40cb23f@grimberg.me>
 <20260830222558.GB1842415-mkhalfella@purestorage.com>
 <4f2d2b60-56f9-4ae3-b38f-bba9754011df@grimberg.me>
 <20260830225939.GC1842415-mkhalfella@purestorage.com>
 <CAMof9cW8JFu3XG+BZc-ejG-fvsodQ9ygYbV_ttgvX=Kc_JjXJA@mail.gmail.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <CAMof9cW8JFu3XG+BZc-ejG-fvsodQ9ygYbV_ttgvX=Kc_JjXJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 04/09/2026 19:04, Surabhi Gogte (she/her) wrote:
> On Sun, Aug 30, 2026 at 3:59 PM Mohamed Khalfella
> <mkhalfella@purestorage.com> wrote:
>> On Mon 2026-08-31 01:44:32 +0300, Sagi Grimberg wrote:
>>>
>>> On 31/08/2026 1:25, Mohamed Khalfella wrote:
>>>> On Mon 2026-08-31 01:00:52 +0300, Sagi Grimberg wrote:
>>>>> On 25/08/2026 1:56, Surabhi Gogte wrote:
>>>>>> - ret = sock_create_kern(current->nsproxy->net_ns,
>>>>>> + ret = sock_create_kern(&init_net,
>>>>> I don't think we can just change this...
>>>> Why we can not change it? Today the error recovery code running in
>>>> worker thread will be using init_net anyway, no?
>>> See commit: 1be52169c3488ef98582ed553ab35cefa3978817
>> Thanks for the pointer. I was not aware of that. What about error
>> recovery case? I _think_ it will be using init_net, no?
>>
>  From what I gathered, reconnect and error recovery run on kworkers,
> so those paths were already resolving to init_net even before this change.
> If we pin the caller's netns to the ctrl, we can keep netns consistent
> throughout,
> if that is desired.

We probably should.
