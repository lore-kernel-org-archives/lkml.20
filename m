Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216592;
	b=SsMUb5+r2rhVx3YzlH55FfL3nLYflm6JpLkNy83ysZt7DIRR2mk9IZlTz/RPwgPGQIMW
	 bsHg0/8C3iqwvTcqKLHqmBaUD/DETesgSRKBqO57Hm8GkTsYEYfBg5+FCp79gUeF/R1FW
	 qaSIaEahMVwM0SNeDJeIPTSMn9QKWY/s9F2xmAZQzB2QBhH0RHmnpvMD1ANNyLBn+tvX8
	 gXf2Aq9KdtyKjZwpakVzBgX00Hf4FSA/5Y4kxVfUL+MhgtYbeaQ5/AcMzFitaIC5S9UEE
	 vupY9b+pfMP53XvdmqZ1o4kz37s/18qIOt5F89zlmW8s0voyciB79SIQ+NdZwNMvtUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZXXc4X9dovkYM5a/fEThQZ7EDvrdJNyD5C3ugviYz/M=;
	b=Zp6z7+sAPajW5DZd1k6QrBKMtOvvGggZvpiep3SA5d8Nni+2eTDZII9NVWzYO0BfSNQJ
	 HMDpV/0L2KjlSOgQVltRFrrgPm2I06zcyGkCDiBl0TkxQxiGmBuHtGepc+hX4922nKeiN
	 vYg2ksdsBo6pd48MoqRObdgM0CEHtaanJC7Nd56u9JhFGd3H+p7AtJCtCpLqQ2ClwKPKv
	 iGblbZSCWg8Pc43hlUfCpEeNJ0JdPWICUNz6J0WMq9hB+6eCTD9yh7WJWJUvi+JFNi4te
	 Kx0Dn3zW/W4SMciX9Q+FRp0/mfoRQ9owTvWBKGrqJikYlWXxJ+1mjq/5CdDpPkNAjHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RINbViMs;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFC9606D825
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EFC9606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RINbViMs
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso363557f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794216590; x=1794821390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXXc4X9dovkYM5a/fEThQZ7EDvrdJNyD5C3ugviYz/M=;
        b=RINbViMskdkdDD1XIUqS/5yIDdrgWUV2uqbKv1P/JTNHfdMRb7DnESO9HN3sHMYqjj
         2mgHa8SZADIfxxBG/f0Fhx1NBmXQ+K2++Xhl9Sw3/mB50aa+VOy7/5lGa1V2qYVDv7mp
         RO9j2MandVyl7T6UeaEpVKiO+QADW+T97aKb8aSMoM43DbFyfdd8wCu7Hk2NfWYfnJCE
         RqwOINassPtNSGN8dVTEsjiYLLP5mvsMPYzMLJ9vafUt9FaXcTerXob8AxoNhh7XZyg7
         duwWjIT6NKDvbvgffGSdcQTFGDZDo1DKzdkoQstR/4zknkoVqPKUfFhw4yBO9+noYFOt
         CZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216590; x=1794821390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXXc4X9dovkYM5a/fEThQZ7EDvrdJNyD5C3ugviYz/M=;
        b=zo+rxKr1ch8c/Ml+4MfxZJhZFjWXjG3g6O4LTLxC1oPyYST8yT24i2Uq7YT2qBO30f
         PPGvAVNVpD1zQIMEsg+xY9nVvFJHXgMeXkMR3quBZBTV9oY4tRWb2uQ1jLVdUTt7L4Hn
         g8oVU+Ym5FnI/sBcPlp4NJUNZ1QC1Tzdo3/cExHxhes6lwdACV5quEWBtL3tmuhA4/Il
         3AYAtFzzeZLV1Tq3lKl8wAg/UQEcYaqYavdQIZ6Zjq2Y4AraAtoyweEaVFlmvzbVZ4Yb
         dFd3s3LNunXFMBxNTNlFfeWUp/FTig4ue9WoMMrT0nCxfBzktDKLLjO+d99G7HOOHlOq
         HuzQ==
X-Forwarded-Encrypted: i=1; AL+hErECf2182fwygqQH4sQwkOBZStytw7hlcEOH39A8YnHXYDgG/nDMp057VzXiCSeMrRZ+iqSYzEtSevDeb1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w5cteH9DTOu8jDRu/9AhwxJAs8i2x5BgEYciIIaTpyEu5XfA7
	88C7i8YnUMvW1GrCTHJ7fy+kGbyQyuxbHGSUYzjAVBELHqR2q+EiQ0JhL4ggTQAsnw==
X-Gm-Gg: AYBFou3sJddyflNzxIGULelmG+wxsDkLWmqhevz5cvz8UxADHQi1+sz46pbP7BWJs2G
	vpbsbEWjgMm3JmxQ5bpk/puhS1tQklzlbSjw4JUS5l4IjMhoGNi7TF6v4KVcujHj9s4To0ZvuCC
	x0/fz1ZfCmHJOxoB85ZxWMiGcJi4lBj4tGqmJ8fpY4nyKaxZLKuNg6JEoHazHMYQLeJCS6IAVPt
	yQd1bKxF78jNKg303FI42YHn9HlE86B0ko1SrJ5d8ZzbM0qfAC0nykWjpJZ8yZLP7dOzq4fRIal
	5SJNW20okFxGBObAYCCfjW2oa20w0dMDEMgJNRjic3vVj40WXJnmvmb50IbKZHiQJA1K2h3DpMX
	ssOkw1l14sNPciqkBuxZPOiLkj7wrwGQKdprfAt4R4yH+DRqSlW564AJfK6tnwc5eKMqxWmad6e
	ESOtJh1rxCJtEPWfsrWXY/JrEWoY2O1juFonf5pXUp+0GoPS6Ag2PX1qTmyiiKrKR6XV9y8fHuW
	80tayf5Pj+nTDjKnJ7+bZgq5JibN8v9oKaDOa0lyIruKosVBJO3N5ZHpd2EqVq54pNhRykGrit8
	oUsZmH0EIbmfE7XtzLCI4OXPuY+C9i+LzwgeTr8B623g2RImiOp+pNaDP/WAPu2QLqJtdVUc6A9
	5s7LoHAmquw==
X-Received: by 2002:a05:6000:4381:b0:487:13f:f612 with SMTP id ffacd0b85a97d-49585401367mr7418535f8f.37.1794216589888;
        Mon, 09 Nov 2026 01:29:49 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959774736bsm9646558f8f.43.2026.11.09.01.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:29:49 -0800 (PST)
Date: Mon, 9 Nov 2026 09:29:46 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+fbe07bcf949966f3c00f@syzkaller.appspotmail.com
Subject: Re: [PATCH] ring-buffer: Do not WARN when trace_rb_cpu_prepare()
 fails to allocate
Message-ID: <avGSispr9aIXliex@google.com>
References: <20261104222558.863948-1-christian.aurichzm@gmail.com>
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
In-Reply-To: <20261104222558.863948-1-christian.aurichzm@gmail.com>

On Wed, Nov 04, 2026 at 07:25:58PM -0300, Christian Aurich Zanettini Martins wrote:
> Creating a tracing instance allocates the buffers of the other CPUs
> through trace_rb_cpu_prepare(), which WARNs if the allocation fails.
> But __rb_allocate_pages() bails out on purpose when si_mem_available()
> is too low or the task gets killed, so a mkdir in instances/ with a
> large trace_buf_size is enough to trigger it:
> 
>   WARNING: kernel/trace/ring_buffer.c:8094 at trace_rb_cpu_prepare+0xf1/0x100
> 
> The same failure for the current CPU, or in ring_buffer_resize(), just
> returns -ENOMEM. Use pr_warn() here instead.
> 
> Fixes: b32614c03413 ("tracing/rb: Convert to hotplug state machine")
> Reported-by: syzbot+fbe07bcf949966f3c00f@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6a707c4f.13bfb6d0.1ecdd5.027e.GAE@google.com/
> Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
> ---

I do not believe Steven is keen on this change [1]

[1] https://lore.kernel.org/all/20260806174638.6012fa24@gandalf.local.home/

> 
> Notes:
>     Tested in QEMU on 05441d697f7f (4 CPUs, 1G, trace_buf_size=350M): mkdir
>     in instances/ WARNs every time before and only prints the message after.
>     Same with a mkdir killed during the allocation.
> 
>  kernel/trace/ring_buffer.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 1fd28a72e6ee..c018559ad61a 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -8091,8 +8091,7 @@ int trace_rb_cpu_prepare(unsigned int cpu, struct hlist_node *node)
>  	buffer->buffers[cpu] =
>  		rb_allocate_cpu_buffer(buffer, nr_pages, cpu);
>  	if (!buffer->buffers[cpu]) {
> -		WARN(1, "failed to allocate ring buffer on CPU %u\n",
> -		     cpu);
> +		pr_warn("failed to allocate ring buffer on CPU %u\n", cpu);
>  		return -ENOMEM;
>  	}
>  
> -- 
> 2.43.0
> 

-- 
Vincent
