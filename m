Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077033BF692
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 22:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788647409; cv=none; b=GpfAaAo92571K1EKA0SC03YclTUTzK4PnQEfCTnbnOtHgoGk4EkPJNr1PGptM5CP9fmJvBquV3SqYOpKrU+sDnpeINR1qPUmM5CB1A94YW+QTubqq2UTKcyswJzDEwVeQ1HSvPMBkCos16Hexcqdlikwrjx4zdVoQAINldHpNSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788647409; c=relaxed/simple;
	bh=hpi8h5UnmLb1/jBXFOXmSibgV234qscEN7KfcTCMLXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQLbzXTRtZiYMz33Vl8vRcS2Mqkykj1oQ0qdOr2zDXqN059EHqQluTK3sAuVZ9tV5I2Gu2SRQCJBqNVfZ/1D9HeC/oeP4YTVyCGRT03a2YervjPbM/YbZJRwdRrwC3CNaixifnis6Pzvh9tTyugGIM4bLXhtX4mI043JgdIN/y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482ea739de2so1459090f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 15:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788647406; x=1789252206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=On0DruBB9TG4XXAPIftyDOFccWr+haKnHMatYHL3TDQ=;
        b=jzk2cP2NAn/79LVvwrO/HfNBKxn2nJVzdiOe1fwL40sXXn3Y4HVWkBujh04gC87Czk
         a3Pmi719RtYxEP561QH9xyb80rwXZ55kuozPLeQfmHCZQwMKoojJyX95HyOltmZ9bPFm
         YLcZtXoZ/GYcsYLEgegk1BfRRIkViHfa4l1weOh/05DSmuafJ3IQ2G5/fmHc+k427JOK
         gNakpwkWTqfrF90gAbB8loxYmDq0GSLxN6o16802bDL9b33/a40042ttZzCa54KFOq41
         3ArTHlvGH9tKI4J5Fscl5sTeRdNUeEKIwov1hSr/JjHkCUm6qWaxx02yIEK3OxX/IaWn
         EMeg==
X-Forwarded-Encrypted: i=1; AKwUvBztxhVMAg2YGpRPXFVIUQTEcqveW7zlFmsAibhU7N23mL9HIGfaUJLmv2pn5iRKJlWcEeaVBlh1hRcl8AE=@vger.kernel.org
X-Gm-Message-State: AFuF++kz9PmE7glU2DRuQoD6yDh4NiG7ZKMy3joJoAgdUMQqKMH4ITot
	owRd10Tr24+p3zOgjkxA2C3Jn7xby28WsKKb1hE3zBAg/IkLYncu0hT+
X-Gm-Gg: AYBFou05ebdtF6n8w1TwWC261geBtP9YT3XuCoOOl3JMkTMJbz9PkCvj2VncORqJc4G
	4lJw0mOtw8uTyDiGPN2pO0wD/izQl8t3rn/ZEGvt5eNry8v3LAvtX7FAMTaX/jaK3nwku9pHPej
	UF9yZcq+twTjEHJ/duI4Kx6/Qx62xRShZmEWp8KtvSkik6XWxH68NDf4pGjQsc3nTuoCzixUXKP
	p+aI5GWZzGtdozXgzAJ5MVEuTpv0kI4DYVM1eNyXCozItgbWeP4jEd2KFCtiOH7s8Ozc4R5omwU
	SAprgD9p8cC6BjhSL1gKlN+HmruL40Ty7eI/I851yJCS0GM9tZSBFtfNpwWNXRde+fcLLaiBwKZ
	tNxBN9OjtaO4CDjDpMhpihSsKFtm/3i/dLAVq3wbuNrNRq7ymRJmyVmNnRQiwipz9LYho01CBPI
	hyZrgo4Qg5fB33XuxxVflzCx6ASG/UbniutI0F1qTB40czZjIN9A9zkRdcF5HyLZgd5Er53Q/gz
	McZYA11K6AyHDK8RCADqr+JOF6zjGVyWQ==
X-Received: by 2002:a05:600c:3546:b0:49c:fc6e:a3db with SMTP id 5b1f17b1804b1-49cfc6ea79emr102975815e9.26.1788647405945;
        Sat, 05 Sep 2026 15:30:05 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00031c95sm123315445e9.11.2026.09.05.15.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 15:30:05 -0700 (PDT)
Message-ID: <39448561-8877-4e20-98e6-fd85acc3d569@grimberg.me>
Date: Sun, 6 Sep 2026 01:30:03 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 2/2] nvme-tcp: parallelize I/O queue allocation and
 startup
To: "Surabhi Gogte (she/her)" <sgogte@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, mkhalfella@purestorage.com,
 randyj@purestorage.com, adailey@purestorage.com
References: <20260824225648.316962-1-sgogte@purestorage.com>
 <20260824225648.316962-3-sgogte@purestorage.com>
 <c98fe50c-172a-4e53-a30c-5416c40cb23f@grimberg.me>
 <CAMof9cWdXR_040SDs2N=3ETvdmxvjx+OokfkSDr7DzVbLbuenQ@mail.gmail.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <CAMof9cWdXR_040SDs2N=3ETvdmxvjx+OokfkSDr7DzVbLbuenQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

>>>                qid, queue->io_cpu);
>>> @@ -1846,7 +1856,7 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
>>>                queue->cmnd_capsule_len = sizeof(struct nvme_command) +
>>>                                                NVME_TCP_ADMIN_CCSZ;
>>>
>>> -     ret = sock_create_kern(current->nsproxy->net_ns,
>>> +     ret = sock_create_kern(&init_net,
>> I don't think we can just change this...
> Passing init_net explicitly does change behavior on the synchronous connect
> path. However, with queue allocation now moved into an async worker,
> current->nsproxy->net_ns resolves to init_net in that context anyway, so
> the initial connect path already loses the caller's netns regardless of
> which argument is passed.
>
> If the goal is to actually preserve the caller's netns through the full
> ctrl lifecycle - initial connect, reconnect, and error recovery; it can
> be pinned at ctrl creation like:
>
>      nvme_tcp_alloc_ctrl():
>              to_tcp_ctrl(ctrl)->net = get_net(current->nsproxy->net_ns);
>
>      nvme_tcp_free_ctrl():
>              put_net(to_tcp_ctrl(ctrl)->net);
>
>      nvme_tcp_alloc_queue():
>              sock_create_kern(to_tcp_ctrl(ctrl)->net, ...);
>
> This captures the caller's netns while still in userspace context, then
> carries it through all async paths — so reconnect and error recovery
> also honor the original netns rather than falling back to the kworker's
> init_net.
>
> Is this approach preferred?

Yes I think so
