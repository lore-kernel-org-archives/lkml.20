Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B675A9851
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160338; cv=none; b=XmY3Y9ZZ04LBwOLjQVKtu4jbO2jRuIziVIo3lt2aw3P0Wk6DeevvcX7EMlfGmEKbZjwC3XAaOd6k/FoLct9rVUg8P2GulKYcz6enPRASz+NhbyT8X1bX+Cnk6KVg9z1VKiIIlKm21gHDs+l2goU/yF58F+dklbW+Zx9Nj3k9qas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160338; c=relaxed/simple;
	bh=ylPWq52aln0eqJGdQEv0HUkOL6TvUPV2214Q3DKuYLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uWfPWKrBVv/Y+aP39R3ORprl4HJ1s+TxRJ9b+4TZWgicVqJaK0B6kcfdbtADA44JNZixu9sBOM2K+vGdkj3uWiwmuXQrM5HsM9iwThnDWmsZ0A34XipPoVXvAImaTUcgLq75+lXMjgHbFT+bid7aCEte2N/YA7fhmqccvAq8oTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso3089925e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789160335; x=1789765135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeYHidnwyFLGOcwUOYUy3OdpNurO7rwFcsY8EorS7Z0=;
        b=bfIrSSEirSSoxLQmu5+DlfZENRNOiQnGnXqOQYZ40n1wW9/arIZsVlZbwlPHaRAxX1
         FZkvMDNhkRxLvf0tfMIYsMYRBroyNE0BPu+OsT0tNfkPaWWDuuZELMVbw7cXpUUIAqL5
         dyEoB1otVmiNkd9YAUVFn4tYUf8zatqzqphrZ3fmAo3RkHLNYEgdul60eG0JhyL0yniV
         6Y7auR0WO5MnH0u5ifoCzSVjkRyY9V+PL80nDX4DElP/79yieQ+9GXT/3FuTKuVtg+Sv
         /ZN+HqkyPIymJYbK+DhpqwYZA4EJyHPRO1CfRZtO3P5S5VlkbLRvkWKWjhDtJ9Wz4W2R
         6DmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk9eR9CTg8c9CDkKaBGNXPdt0dtJ9SVHUm8GZyazAf5+qreG5k//GPsxqb57pe7U6m/2/VvCNJ/KlenH4=@vger.kernel.org
X-Gm-Message-State: AFuF++l8Hh64B8ImeexpJqZFvXNar1qmMHLhwFkEjkTKzL6a+lKw4QBJ
	0koDin8BVxCq6/gKfrsPNkHs6+oLocmMKctYwpnd1IfPkTZTi6RfV6Uz
X-Gm-Gg: AYBFou1gTLj4998UJLYrSpN6KiXWpNS4XjAUIlRcaAl5UYvFu9+x0U2yiJTTD4+ccFg
	Ti3zWIXsyCUwZ0e/Y19BPwD+ouQf0LxtD6dylLP7iBHQtX/hytJzrR21jVbNG54YBqljDCrjIzC
	q4b1D7MNdydNMwWtdo4rlQ4TDfhguMAPNcx19qBERUK5Xw7oEhWhnIgMJ7jcjsoi+qY4UIJEyRm
	OLybZU62Yn/BOHnO0nMnR5hS5CcJ6aUDN20vYTzQFu9icFkK3psifsRyW2X+UXR78YxjnK3/CRU
	1s6/3zXroPGdobdfjSMD4sZlEVvYE5ua2hb8SJe0VZ0Q7cZxEgzliUXLzxfibFtMHEe+QI/R+ui
	se963E6V44X3KBmXkjM5/Cl7DmrrpcEVxO+kg9lXSjpNrshUi26s4UVe2dHyjEMR5eCaQbrO17m
	Mcd2llYqbj79VKaat23HVe0hcUw7g/f5DXuzlu5Z75KhzOf+rnMIo3trTLujuz7IIGtBPrWTDQ5
	nBEDqoVJCR1iZL0J4IJByanf2Z+vnekTQ==
X-Received: by 2002:a05:600c:1385:b0:49d:243a:e4f9 with SMTP id 5b1f17b1804b1-49e6198bf39mr57198085e9.10.1789160334640;
        Fri, 11 Sep 2026 13:58:54 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62227071sm63494375e9.3.2026.09.11.13.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 13:58:53 -0700 (PDT)
Message-ID: <8510cbc8-9dfc-415a-949e-c0f5f3f4e8b5@grimberg.me>
Date: Fri, 11 Sep 2026 23:58:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] nvme-tcp: allow setting per-queue io_cpu through sysfs
To: Saravanan D <saravanand@crusoe.ai>, Nilay Shroff <nilay@linux.ibm.com>
Cc: linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 Daniel Wagner <dwagner@suse.de>, linux-kernel@vger.kernel.org
References: <20260909211432.6741-1-saravanand@crusoe.ai>
 <8dfee10f-89f3-463b-8d16-587873c3394c@linux.ibm.com>
 <20260911060330.59998-1-saravanand@crusoe.ai>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20260911060330.59998-1-saravanand@crusoe.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/09/2026 9:03, Saravanan D wrote:
> On Thu, 10 Sep 2026 13:55:59 +0530 Nilay Shroff <nilay@linux.ibm.com> wrote:
>> I wonder if we should avoid introducing a transport-specific tcp_queues
>> hierarchy here. io_cpu describes CPU placement of an NVMe I/O queue
>> rather than something inherently specific to TCP, and other transports
>> may have similar queue-level attributes in the future. Could we instead
>> introduce a generic "queues/<qid>/" hierarchy under each NVMe
>> controller, e.g.
>>
>>        /sys/class/nvme/nvmeX/queues/<qid>/
>>
>> and have transports expose queue-specific attributes there?
> Thanks for your review.
>
> A controller is backed by exactly one transport, so we can adopt the
> transport-neutral /sys/class/nvme/nvmeX/queues/<qid>/ path with the
> creation staying outside of core in nvme-tcp, which owns the queue
> lifecycle. The core only knows ctrl->queue_count and never sees
> individual queue lifecycle.
>
> No other transport has queue attributes today, so a controller backed
> by rdma will have no queues directory at all. The path appears only
> where a transport populates it, and if another transport grows queue
> attributes later, the creation can move into the core without any
> ABI change.
>
>> So could we expose this state through an additional read-only
>> attribute alongside io_cpu, for example:
>>
>>       /sys/class/nvme/nvmeX/queues/<qid>/io_cpu
>>       /sys/class/nvme/nvmeX/queues/<qid>/managed
>>
>> where "managed" indicates who currently owns the CPU placement. For
>> example, "1" could indicate that io_cpu is driver-managed and "0"
>> indicates it is managed by the control plane or user.
> Agreed, I can add the read-only managed attribute, 1 when the io_cpu is
> driver managed and 0 when the user assigned it in the next version.
>
> Both suggestions look good to me. I will wait for Sagi or Keith to
> weigh in before spinning v4.

I agree with this approach.

I think that making nvme-core more "aware" of individual controller queues
is a good thing.
