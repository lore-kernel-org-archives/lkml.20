Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794465660;
	b=XrtmGA4BdkUZ3T+CIGIYJJBht7Evsag+wQ/l8b7R0UTFZy7o/9/d/JqN89StQkmHZ0Hk
	 cYwg6eSkCNED9RIdf4I9EVBNKf27l8jYG11cYiqhwlNK03TeI/s1PcQQb76sMTaBoBJhy
	 +wyhldVclcpc8CyQ6DgQYM6FVGh2UgAM1UNqyEe6ZD8k1WEKTYyCKdYN6v5uaCXzPCkhY
	 pCY8EThsYDL/fSbHKWncoPAWDvH4zQamKjcK2xBJOwVn7fosC7Ct3P768qq67Vt1hpPjl
	 x40iY+ehM+aygsB7Ex8QedF2BEMqInxE1muOLRTDImI8OtShKBUrNAitcECXEoHX+4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794465660;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8vDJ3Ou7xzCxze/52XPwkTIU2JyVZ1LI+BGZWXtekYc=;
	b=vdcfBOncOC35rxHplRIeLmwy/0PDhmQkJYg/Ub87vp2tGdfPywt7xzMVG+oKt1/bn57Q
	 K+M14bJv9n718HVFMxt60mhuxm6urmZEzFl3+6xarDHFMPlLwfYW64chP9VDMyKfOCDvE
	 lJL0zdsx+SCvjHpcBQD9YhDFFlNOWUeJKxVLLlT1nB/PpKAlmckuD1pAi0/MpX0HmvZCi
	 2Q1C00rMA4oj9rBZ1ZgwkBuvhQh/vjn6vDhKFuIMllpMKXQfdJxXTtfjiV/L5zWBxf8ex
	 LKSdowMsGjYzxLa4kqO6efO19KkON8VzP4B9g+j79WQjN6HwAT1M/5XZlZW3dnrfGOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OsJtXxBu;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZtPfFQBc;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32323606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32323606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OsJtXxBu;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZtPfFQBc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794465659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vDJ3Ou7xzCxze/52XPwkTIU2JyVZ1LI+BGZWXtekYc=;
	b=OsJtXxBuJsN12vyL1kRmskKoyIwQVHEngPNVuxohUirXBOlO97KThKSLBHVgN6/HBjQ13L
	3ZdneMiDCVCkDSWFGBHOHBQF9J88ezEEgNGWXJQD69+udbjd99n0v/Nyh2y7B3C07t9HTR
	rGBWRywDYl51g5ML9cj9DvV+EeE++4Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-ne69u5sAOWWmttyG9cfPZQ-1; Thu, 12 Nov 2026 01:40:57 -0500
X-MC-Unique: ne69u5sAOWWmttyG9cfPZQ-1
X-Mimecast-MFC-AGG-ID: ne69u5sAOWWmttyG9cfPZQ_1794465656
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4923b9fdd43so3147912f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794465656; x=1795070456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8vDJ3Ou7xzCxze/52XPwkTIU2JyVZ1LI+BGZWXtekYc=;
        b=ZtPfFQBcpCF6197DbyyHLCxXyaVxz/UY4xcVByKJ74+PW7vqdZZNX1Z1hLEUok9+xZ
         wnih+IBWhwWc/U1wNZYdnAYhsLDQw78ZsdaFXPNuB+MSXUJN3NhImiCuOBgYXPaIxqFf
         +LfhmRZW62+yI6InGwr7JNWhZHGgGIuf9DEqZ9doz61ssCiK9+BahMHs8rJn1HNrdcfR
         CfLuzCANLGo5LiGEW3rE7OitiigUkOAwWpED/2QgA1BAGGs85OqaU6LKhZPjoy2lg8tF
         XB8cPijK1cS4ZXfcH0iteD8Ccv3CwriOrVvH7sfq6yfW4wTZenmKfQsJ9LMcpTIoZVTV
         HD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465656; x=1795070456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8vDJ3Ou7xzCxze/52XPwkTIU2JyVZ1LI+BGZWXtekYc=;
        b=lx5cJaquHnZejGXWJ2FaNi10mllnC1UbMNyzBwKLoAa/y3bsU7GYbhl7WZBDDIGSva
         ELBT17NVwFrAuBahmKMdl1unfXkcopinQNLCYws7LJrJgEDi+bvSoVS2fMkVRFQ4k3Y8
         mbe3fvLIpS5aU1/5/vN9En+FmMMNISe763rw5ypmIzUC+VFfR2R6mB1h1DesXcqnSNnK
         S0P/pm977ditq9wvNN8+E3Pdw+nOGjgmceJ371EdIqgrKw8O+Tic5z5CRZUxfAGxpFVE
         r+y1mOm5BhuxeHn2ZcVlIg67DWyzEx7+15Nphoms5BjbV+1GFnNuSsW3TdXtnlRX79aG
         Lq6w==
X-Forwarded-Encrypted: i=1; AL+hErFYkAHEJYtyCUNdiVCE9k5SfOUlo518iOJRRkuFueLTKjSZqeqlUVxFEnKyqVXHVOuYhg9WFqkUjum2ycQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OgAF5G8CqI6VOJqIOwXdrlWNMTEZI0x2An05dH2BQ3lLEpW3f
	X83qs0NilBGAQ8nZJ5vdVgfZwVgGnYz61FV7CSvr6ilwgapzxbvkNa0ftAhJYhAVHUtq0paBsZS
	4w0jPFH9o17ZBlkVeZyNdC+mtqzRN/rNbk8gmonYqtkqnDee6g6Nck/Xxwsq8G5uHFw==
X-Gm-Gg: AYBFou01WH1gAEki/3FKSu20e4R1Xi3K9jGTqOc6u6u1hM0zZf4N02IEci5WsKnwv8Y
	EjuT8x2Tvwvk5D9JbvmBnzlAd4NBR0X1DUfTu1Xqs59nTtfJsY4QJg3uhqTc5VxT5p5GuGfnxhB
	xLHohGKqYNy8aTYHUZxJ2CsU3MFP62TXlJdqB4mV+qsEBMlr/eS9Rlce7ampwk3B5k1fxMv5wfN
	alAqtIIsFh4Z4k9N8LH9MFgt0rDbdO3R3WQ8f7Bfz0//9Umk3gGGY/6Ng7/uIG4ex9VYc07IgC7
	yYdC8JPeBV3Gj2FjCGOAHEVKgOHtQBSc7kUOhAdsUn204oremK8wMYkuP656SqJN7JxAt5iiuOG
	afyzMF0lz//awVUl+NH/ywUJIFq4QLliiaBosnt+uLWjpYbITiDwA/tTIMPs1THc7NyDX85BRtW
	3RknY=
X-Received: by 2002:a5d:6f16:0:b0:491:6b1b:7f25 with SMTP id ffacd0b85a97d-499c792ec97mr7218170f8f.45.1794465655997;
        Wed, 11 Nov 2026 22:40:55 -0800 (PST)
X-Received: by 2002:a5d:6f16:0:b0:491:6b1b:7f25 with SMTP id ffacd0b85a97d-499c792ec97mr7218131f8f.45.1794465655658;
        Wed, 11 Nov 2026 22:40:55 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2bf91sm15226028f8f.23.2026.11.11.22.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:40:54 -0800 (PST)
Date: Thu, 12 Nov 2026 07:40:52 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 17/29] sched/deadline: Leave a dying task out of a
 rebuild of the accounting
Message-ID: <avVfdI8NRaLN0ZHH@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-18-mathieu.desnoyers@efficios.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108185406.1549770-18-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> A rebuild of the root domains' accounting takes the pi_lock of each
> deadline task, not its rq lock. A dying task past its 0-lag time
> releases its bandwidth at its last schedule. It holds its rq lock there,
> not its pi_lock. Then it clears dl_bw. The rebuild can find the task
> between the two steps.
> 
> In this diagram, T is a deadline task that exits on CPU 0 past its 0-lag
> time. bw is its dl_bw. CPU 1 rebuilds the accounting:
> 
>   CPU 0 (T)                                  CPU 1 (rebuild)
> 
>   do_task_dead(): TASK_DEAD, under pi_lock
>   __schedule(): T's rq lock taken
>     task_non_contending(T)
>       dl_task_release_bw(T)
>         total_bw -= bw
>         dl_bw_gen recorded
>         record cleared
>                                              dl_rebuild_rd_accounting()
>                                                dl_clear_root_domains()
>                                                  dl_bw_gen++
>                                                  total_bw reset
>                                                dl_add_task_root_domain(T)
>                                                  T's pi_lock taken
>                                                  dl_bw != 0, dl_bw_gen old
>                                                  total_bw += bw
>       __dl_clear_params(T): dl_bw = 0
> 
> dl_bw_gen does not help, since the release came before the rebuild. The
> rebuild would count a bandwidth that nothing releases again. The root
> domain would then refuse deadline tasks it has room for, until the next
> rebuild.
> 
> Fix this with the record of the bandwidth, dl_bw_cpu. The release
> clears it under dl_departed_lock, which the walk holds. So leave out a
> dead task with no record. A dead task with a record has not reached its
> last schedule. The walk counts it as a live task. That schedule then
> releases the bandwidth, or puts the task on the departed list. A dead
> task on the departed list keeps its bandwidth until its timer, and the
> rebuild counts it as before.
> 
> The Sashiko AI review of v2 of this series found this window. Its review
> of v4 found a gap in the first version of this fix. That version also
> left out a task between TASK_DEAD and its last schedule, with its 0-lag
> time ahead.
> 
> Fixes: f9a25f776d78 ("cpusets: Rebuild root domain deadline accounting information")

It's kind of minor, but I'm not sure the above Fixes is right. This
patch alone can't be applied to fix the referenced commit, it needs the
(at least 2?) preceeding patches.

> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

Other than that,

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

