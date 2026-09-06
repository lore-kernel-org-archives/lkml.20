Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8870B282F36
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 00:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788654475; cv=none; b=SgTS0UDCfIb27ho7GeYUMm23MqJjOAHcBkiar5etrIvltdaXFVkAHYgFVjfNGG4pN7NrayXxc/9D0qSD3lAhYapdp0qom5gN3MedEV+4OUXe81Bh63SNY3oT4u1Wjlyg1Jpr8+PMf++2ViOfjOzhZiqnRh40O8JaVNVKvZ80Rrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788654475; c=relaxed/simple;
	bh=fF/vXxPLfH/LP55Q3picOAVcc+78Hi+CViiQRqbY41A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nU6kRzAC4hXoX/8CVIzXpWT8d1jtRj98O3zZN1Fvrnrtjzh/YttAehMDoRmPLjmT6sfGzk7671xUbvEMQ7JvBjfEzNcfyI0heeZ9jAmoGSgXYzFj6CPDuAzXWLDd2vR3s9O1TYKLrYwLPVQZJ22bVDF/4UPN4cvZ4R1eoafnmmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so19626215e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 17:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788654472; x=1789259272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fF/vXxPLfH/LP55Q3picOAVcc+78Hi+CViiQRqbY41A=;
        b=UEoEpkFpm6fD3b4dmh44XC4hu0V8fZNXIalumsjY3M6xhnXhIUeSH/JJ86lwyvOTLF
         yzPlgOWlVLUeLomBuNnsP95immVO3z8vnk11xWgaW7FrDFRZVJalzdJa/bGxAw5oxMpI
         UAdW2rAXnlkeW0kgxT7Jq/TvU0SPc78URTzBewiyDb7q/9P3LbKMPXtluA6UAfSxB2cD
         HM8dcbC2kxOmQ1bRy7vT74tyBUrkhMqhHmn7YpQDcGiZLLORZL3azABVUeobcMy+SCQ7
         R9/OPTuLgAzebOnh9WJ0I3yvKdn2K2l8JpZ+yJkbC/b/aU8O07BNKvV6TEa2sn+zN+Qb
         ym8g==
X-Forwarded-Encrypted: i=1; AKwUvBw3KpRqxjLphTSVEc6ygFoa646zszIz/6ZmZHC64iyp6cS4qNehoOMyMnz/+xQiZzM8x0qI1y2vR5PXFTo=@vger.kernel.org
X-Gm-Message-State: AFuF++lbqz9zohGP5A+PYiwRgif8mVRIGm5k0CRizGqEfgsFc0xweVyc
	RxHTc/YlkrCnc52WCG0nc8V8n0ZSL2vN8FTa7F+kunpotE8Pygxsq+rE
X-Gm-Gg: AYBFou1afds6fuyoxG4YkzwGVRNO9VvYLl08nEldFKvizEkzkN1qozFV0+Rh9KtDWP1
	mp7Tmt03OO6enjRWtu+dlaJRT4ZOEv9G4M/kSLNY8t/cVfERJd1O6RN+Z2BTV+W5qZYHABcCuf9
	nMijYaRAo39QmmgRZNGKW7kTbtcmvTabVh8ef5kdeGXCW9T2tGpLMQpYqvdVkqqtW281u1YWL+T
	IsZyW/fdZtTiYCzgmmzI9Ii/IrYc6wZ7HliABc2yWbxAg0qC2+fcs3hCkdagDYbFlFVUX+68ymR
	kw/z2+httqVDSUmsHSCYV/1Aw1j2SjMpXN4or/v6oJQA9pTRgA+s/KZujDq/USvLeRS5wzJcmvz
	sFgg0LXjax+aBMaSndP5/hfonZDObMqbDuHqitDI1MJNnJUYgaER0HzwCvuWmwyk3XgFzGlaqpg
	p88BJ4uqisAoSb92ELS78ycTGm6OBYieTZMzvweuihdMPpiVuGNLj3yCpCVSl1+3K1+tSTukiLr
	oVvG+YwPAJZC6ifChqELCw=
X-Received: by 2002:a05:600c:1986:b0:49c:fa21:e744 with SMTP id 5b1f17b1804b1-49cfa21e906mr115713335e9.26.1788654471726;
        Sat, 05 Sep 2026 17:27:51 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce831af89sm198027065e9.1.2026.09.05.17.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 17:27:51 -0700 (PDT)
Message-ID: <220e9da3-f756-4a16-8de1-d4b171f15009@grimberg.me>
Date: Sun, 6 Sep 2026 03:27:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvme-tcp: pin io_cpu to submitter cpu
To: Saravanan D <saravanand@crusoe.ai>
Cc: linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 linux-kernel@vger.kernel.org, Nilay Shroff <nilay@linux.ibm.com>,
 Daniel Wagner <dwagner@suse.de>
References: <20260820083634.71689-1-saravanand@crusoe.ai>
 <20260823174348.40236-1-saravanand@crusoe.ai>
 <1d56144d-6987-40c1-ac02-b15333db121e@grimberg.me>
 <20260902062431.61412-1-saravanand@crusoe.ai>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20260902062431.61412-1-saravanand@crusoe.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/09/2026 9:24, Saravanan D wrote:
> On Mon, 31 Aug 2026 01:30:08 +0300 Sagi Grimberg <sagi@grimberg.me> wrote:
>> I just think that the adoption approach has downsides in many other
>> workloads. I wouldn't categorize your use-case as the common use-case.
>> Not to say that it shouldn't be solved.
> Adoption in v2 is opt in per controller through the io_cpu_adopt
> connect option, so every workload that does not enable it
> keeps today's behavior unchanged. The downsides would only be borne by
> deployments that choose it. I concur with the broader point. Adoption
> makes the driver itself decide where socket work belongs, through a
> fixed rule that cannot fit every deployment, while a writable io_cpu
> is very flexible and leaves the decision to the control plane.
>
>> I agree with you that queue io_cpu selection at connection time is too
>> limiting. Perhaps we can have each nvme-tcp queue expose a sysfs entry
>> to set the io_cpu?
>>
>> Something like:
>> echo $CPU > /sys/class/nvme/nvme0/tcp_queues/$QUEUE/io_cpu
>>
>> I am just trying to think of a way that will allow some control plane
>> to set it exactly as it wants, without the guessing part...
> The per queue sysfs io_cpu works for us, and in one respect it works
> better than a connect option because a sysfs attribute can be set after
> the fact on any existing connection. The control plane already knows each
> VM's cpuset and can read the queue to cpu grouping from mq/*/cpu_list,
> so it can nail the socket work placement.
>
> Two questions before I spin the next version around this.
>
> 1. On reconnect the queues come back with the connect time io_cpu, so
> the control plane has to notice and reapply its placement. Is relying
> on the existing nvme udev events for controller state the intended
> signal, or would you want a dedicated notification ?

I think that io_cpu should not change in reconnect. We can use a
NVME_TCP_Q_ flag for it.

>
> 2. What should the write path enforce ? I would validate the cpu is
> online, rebalance the nvme_tcp_cpu_queues accounting, and let the new
> value take effect from the next queued io_work. I intend to restrict the
> value to the queue's map group.

I'd just do basic validation that override the queue io_cpu.. perhaps
xchg(queue->io_cpu, cpu).

>
> If this direction sounds right I will drop the adoption heuristic and
> send the next version v3 exposing each queue's io_cpu as a writeable
> sysfs attribute.
>
> Thanks,
> Saravanan D.

