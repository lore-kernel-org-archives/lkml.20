Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794161950;
	b=KI8OUne/81A9bIu+gsWcXkBGIuVW15CtOayaebX3ZdKRnSS947gVwbfePW3kbODsxZ/T
	 0tsEGQphvWBEuI4EKfQSy+MIp5jfKsoZf0Z0RiOPUyHlq5qesAaohJLYfxlIQx1/noRzz
	 GgM+4adzdJPtNbE2qY+3Elh/X1IoXSZvkst2YKtDOIQu+2tkIu7WkStwE6AOowm9gAXVq
	 4NgmaSvNaFfAU+kidVZ5ofRIKgBAh6Adem3B0HseVvIDEsPTypbW35dU5tAcYeE9OHR+w
	 bu1gCImtCCK5clnvuYok7QAU+9TtTcFQUOmcYOW01Q1on2I+3ptX/mC8E17pfXvGT4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161950;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=r7RYXT+QmgrQAsQyPZOf2kc4tNAIjzUp407Mrri0Csg=;
	b=pbmJbHpb6X+LPaRvQ3WGhhz0IphmPHa+RIns1MvpdRZeYPTs1TRRg86Rp/vhGv58u7Sv
	 wWNE8Zo8tnIE+RfLG1mvCkHwRbR9HQyte5btIhUUfeEWYUj7QC0yPhJFkiMGdbfFa2Nyg
	 Wl+eDPm+XWrFeqpuCOpuwHr3LxapFh+IEzDLlE7inB0lipY8WZQ7L2CR9LnP/Quu8KFrv
	 0lI7n29cf84m4PDi/HH107x+NqxUR1gMW2l8MqMeuClSwigRdLyDDYtB3zHNkGTBvtODw
	 Q1HkvDuxDBZllsKL9ZEP+OYyYpEVr0J3TUo3TCytQVzN/SbuZuwySk3t/381PD6NwrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Zp/7DqXg";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF148606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF148606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zp/7DqXg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794161948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7RYXT+QmgrQAsQyPZOf2kc4tNAIjzUp407Mrri0Csg=;
	b=Zp/7DqXg4DA7OkH4MbykMWgH+226D0whFidMJIUSQbkfQvSe6Q5dh4v30OfFMN2jOYl7YR
	p8gT+rc25z7hQxyZkcWNTd2bVua//ZZ1mLbcsEYpLymgvq0kzdbsOnaMzoFTbp8nGPq/0b
	PE67dMZNlcuDl1fZu3dDFn0XfOGt54s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-426-cJP-Oz6FMJyr_o9T47XZNQ-1; Sun,
 08 Nov 2026 13:19:04 -0500
X-MC-Unique: cJP-Oz6FMJyr_o9T47XZNQ-1
X-Mimecast-MFC-AGG-ID: cJP-Oz6FMJyr_o9T47XZNQ_1794161943
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 35DC219560B2;
	Sun,  8 Nov 2026 18:19:03 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 53FFC195608C;
	Sun,  8 Nov 2026 18:19:02 +0000 (UTC)
Message-ID: <8ac6e2d1-c5de-4205-97b3-3b75359316bb@redhat.com>
Date: Sun, 8 Nov 2026 13:19:01 -0500
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
Subject: Re: [PATCH] cpu: Fix online housekeeping CPU check in _cpu_down()
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
References: <20261108180849.1268263-1-longman@redhat.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20261108180849.1268263-1-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Mathieu,

Sorry, I forgot to cc you on this patch.

Cheers,
Longman

On 11/8/26 1:08 PM, Waiman Long wrote:
> There is currently a check in _cpu_down() to make sure that there is
> at least one online housekeeping (HK) CPU left after the shutdown of
> the given @cpu parameter. However the cpu_online_mask used for the
> check may include the current @cpu to be shut down. So the fact that
> there is at least one online housekeeping CPU at the moment does not
> guarantee that there will be any online housekeeping CPU left for the
> sched domain after the shutdown.
>
> Fix that by making sure that there are at least 2 online housekeeping
> CPUs available if @cpu is currently a housekeeping CPU.
>
> Fixes: de715325cc47 ("cpu: Revert "cpu/hotplug: Prevent self deadlock on CPU hot-unplug"")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   kernel/cpu.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index b3c8553d7bd6..ed641ee6b37c 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -1415,11 +1415,14 @@ static int __ref _cpu_down(unsigned int cpu, int tasks_frozen,
>   	cpus_write_lock();
>   
>   	/*
> -	 * Keep at least one housekeeping cpu onlined to avoid generating
> -	 * an empty sched_domain span.
> +	 * Keep at least one housekeeping cpu online to avoid generating an
> +	 * empty sched_domain span. As cpu_online_mask includes the @cpu to be
> +	 * shut down, there should be at least 2 online HK CPUs at the moment
> +	 * if @cpu is currently a HK CPU.
>   	 */
> -	if (cpumask_any_and(cpu_online_mask,
> -			    housekeeping_cpumask(HK_TYPE_DOMAIN)) >= nr_cpu_ids) {
> +	if (cpumask_test_cpu(cpu, housekeeping_cpumask(HK_TYPE_DOMAIN)) &&
> +	   (cpumask_weight_and(cpu_online_mask,
> +			       housekeeping_cpumask(HK_TYPE_DOMAIN)) < 2)) {
>   		ret = -EBUSY;
>   		goto out;
>   	}

