Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1EF415F0E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789162683; cv=none; b=eMtFqMZAlPDHxhi9tY06+a74BLDU/YDgb3ZK+89Qgee2n6/FeGBC5GSnXGFsS3VavgiOvqs17U5tOVtGJ6JqzinADq65kWUXAwj9yrMTbFLC3AmOO19ze6axBuqGM8Q7rNCRHAQ9ulGIanJgR7i7+9tXH3US6nZVOFKfhnyAzPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789162683; c=relaxed/simple;
	bh=51c/ZwsqvwLANn29Bca8ztxTQOQJG+9tSAaUO0OsyiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gR0XzifYEUFkkDPXKB+DFVWJDfXdG2NvsEQu0YeKgihtdFCSDsLDRd6jNoqtV9Xl3SWLRp3KURzMh2Q6K9dnuzos1iXZ3/fPb5/mZ8tAtsb+GGAr7YpHeb+TK9rLz7fTgh8hPPOQyJ9E3DGQMAUirtOccYHpcdOVJP0nOUxx4S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso11686895e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789162680; x=1789767480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51c/ZwsqvwLANn29Bca8ztxTQOQJG+9tSAaUO0OsyiI=;
        b=jH0Yze6hzsctdyBK9uPA05RkFBfVSTADR6fYEoTaQnizugZENvUjLU5PtHNsmMABZu
         TDhYPC7hI/uiBCUONUSjNMJYIRN4FZMbr/1cXxvSkFzlpLSIOkE4PLfZrubSK8/WUPbj
         0do6wOP50uz1U9a+TpM4+LKoFUdq05I6B4asmEpET/1Q3ItFteuJ0sYRjnHWwFGABA05
         HA+kJsMVRr5wp4anqw6ugs6oBZBRSgSpwbiTT6jQk/gd7yWDeDgwZIxUeaBLfnUwRkTJ
         dHZ9vpSqUzdFzzBCnv91rPtRZpd8lntWBjoDFxR+9xg9Sa5Z+CAt6WFXdVaaRq75oCYM
         880g==
X-Forwarded-Encrypted: i=1; AKwUvBwKCEhvapqO7RBaLYeFPuTNuC7RPcudXFaMqORPjCgEJup3ujj7i/06BNrGhzVm+8Y4OF5y+miOYChSN+0=@vger.kernel.org
X-Gm-Message-State: AFuF++mCaXsLpwIaHuwsX6EhxX2WCIba/b/NjT9krlTLeqP5e8M77C04
	7zq41SDEqHBRCU5Xc76m8NbrjxZRHv7sbi6T2itOlTTDhqnutEcbdLY2
X-Gm-Gg: AYBFou3O/0DlMufbXbfi7tOn6Ykl09yyaftyN1/lXk8+bIImkw3VZcufXPLqwtQAgqY
	9mygFBpD0I+j28jLly+JdrQYiusH+fQL9QkPXgdiQIXGboJ3KEPzp3+b+sTm1jkFNbbQ/5o7/BO
	iJRpZ/h2HnbR6bVLOQZCfHejDw5GhqnbOn9oJo7OpNrRFSSPSCRSGzh5/xgRSp96X9IRIc1AMRJ
	ZXCFl9NnZ19AL88sBc8Gn1am7YYm2n82IBAFoNxgCm8u9lPEp5HmlZF78s4dD1pv5adRM4IwrTc
	Qzc4ipXK3TnpHlvxUxdC+PxySMHILv3DiutByO8Yd9UG8s1q89+JS3R32YPnFx6YQJs2D1DTlel
	xQa/EwwUrHg/ZhN6aY4rv3K582NKOKc/ZySj3QfDWQZlcuz2wL+0WRfsxpSZhOQf47Qs7HDjwLl
	a2cwv2OQTGTenpaBc7np/X4Zgqd+5JWEcyQRyP4tc0XPFNCIMzDhwQZu5tebVL5C9KgULllearX
	MsTWWpzF0EjKS6Bj+5fqW1hD+Np0N25
X-Received: by 2002:a05:600c:4f88:b0:49b:2796:be30 with SMTP id 5b1f17b1804b1-49e6198cf7emr67461635e9.11.1789162680312;
        Fri, 11 Sep 2026 14:38:00 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm8720494f8f.19.2026.09.11.14.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 14:37:59 -0700 (PDT)
Message-ID: <8d06416e-a0be-4a0a-b1fe-f5b7831f8574@grimberg.me>
Date: Sat, 12 Sep 2026 00:37:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme-multipath: add fail_io_now sysfs attribute to fail
 queued I/O
To: Krishna Iyer <kiyer@crusoe.ai>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, sj@kernel.org,
 saravanand@crusoe.ai
References: <20260904032605.65758-1-kiyer@crusoe.ai>
 <6b8ff0b7-c606-471d-b3be-12df3dac350b@grimberg.me>
 <20260906042235.71778-1-kiyer@crusoe.ai>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20260906042235.71778-1-kiyer@crusoe.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/09/2026 7:22, Krishna Iyer wrote:
> On 06/09/2026 1:36, Sagi Grimberg wrote:
>> I don't understand what is not sufficient with fast_io_fail_tmo? It would
>> determine the time that IO will fail when all paths are down.
> Thanks for taking a look, Sagi. fast_io_fail_tmo is indeed the closest
> existing knob. Like this patch, it fails the parked I/O without
> touching controller state. Three things make it unsuitable for this
> case though:
>
> 1. It cannot be engaged after the fact. nvme_start_failfast_work() has
> a single call site, the RESETTING -> CONNECTING transition in
> nvme_change_ctrl_state(), and it returns without scheduling if
> fast_io_fail_tmo is -1 at that instant. A controller in the reconnect
> loop stays in CONNECTING, and the sysfs store only updates opts, so
> once an outage has begun with failfast disabled there is no way to
> make the timer fire for that outage. That is exactly the situation in
> which the need for this arises.

At that point you can disconnect the controllers, which will teardown
the inflight blocked IO.

>
> 2. It decides based on time, and this decision is not about time. For
> deployments like ours the right policy for an outage of any length is
> to keep queueing; that is why we connect with ctrl_loss_tmo=-1 to
> begin with. The exception is not "the outage got long" but "this
> particular submitter was just killed and will never consume its
> completions", which host software learns at a moment no timer can
> anticipate. Any timeout short enough to release such I/O promptly
> would also fail I/O for every healthy workload whenever an ordinary
> outage outlasts it.
>
> 3. It is scoped to the controller. FAILFAST_EXPIRED marks the whole
> controller, so with all paths down it releases I/O for every namespace
> in the subsystem. The process being reaped owns exactly one namespace;
> the others belong to VMs that are still running and should keep
> queueing until the fabric heals.
>
> So fail_io_now is the failfast expiry made available on demand and per
> namespace: the same nvme_available_path() mechanism, and it likewise
> clears itself on reconnect, but it is triggered by the admin, for one
> volume, at the moment it is actually needed.
>
> Happy to work any of this into the changelog if that would help.

I am not sure I am following.

If you have a namespace that is attached to controllers say X,Y,Z,W
Now all of these controllers are unavailable, aren't all of the namespaces
on these paths also unavailable?

Or is it that the paths are online, but the ANA group got into a state where
there is no optimized path?
