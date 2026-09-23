Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641D740926E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155055; cv=none; b=JIZVB8Ni20eXMlY+oBpGXCwpU4f9p+hV0qvmDgzfwP/EkUjbZSTT0ciOkzYK1NkAY5asrVcfNCy9K6oYv5xAK1Ma9F6ebMW0CMu/DrEUK29qm032Hwu3LsdsEANANJeSdvcQqoSX3RnhlMgkOG/bFIyrCkdiu5Nc3RFZNksa1Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155055; c=relaxed/simple;
	bh=rDguCQz4w7qj/AIiK3XlmiPZSb6LAsBDg8Cs6m6eSPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPau3lo0Ht95ZWE2wFyPkkOKQMQMdPZJlZVLGLPvHKTs+lLMCzaPtGIHrW0E97AOkWQq01WqHxg6KRiJ0qXALf8zVnNaix2VIxk27d7+WN7/9Poc0/GZTYFTE/9p3CtbTavfRFJPNV+4BBh8Tz1TJHT7dV21Jk8oqlQbbMn8sDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BPHm5myq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0KlIqUm/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BPHm5myq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0KlIqUm/"
Date: Wed, 23 Sep 2026 11:17:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790155051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xLEPe/QBsLLrDoaACl67V5H3IbzY9KyCIYNMGSRdqh8=;
	b=BPHm5myqmtag8xqdse7sBz4lgGRmlTAZD4+XrBkpKoe0bwVkY1CEn5Kj2fGZFdNS5MpEu+
	rNJ6PtlbJOuFN2j12tOLRiz9VMZbZc4jR9g40BhiEPlbtGWixuhZypr9uzanYaXOv38g+g
	rzuuG+dUsOAIxCmvylQUOxwgilVErXcpYWdXyw+JQHdHDsbPRVGTuMszPFCY7lK+Tm7fUz
	JzbKQTy7DyjSqkl5b/8DmDjVeZZH9bWa+ybNr1a6Ix4UnNqFe9SYA7/ZW+GqmBpdSEO/C0
	70VTRIwApMsNOCFXZnZqB5af5kRxFyyI4oUT50hiO9yVq4IAAoD1K/OWDfwPsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790155051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xLEPe/QBsLLrDoaACl67V5H3IbzY9KyCIYNMGSRdqh8=;
	b=0KlIqUm/wqI3d+TKu6vVlJPCALVZIC5FvnitSDoV68p7+AcktF43WuOhtz7X1qfQwuPmK7
	m9RxsqPkDW9oxKCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: tglx@kernel.org, mingo@redhat.com, luto@kernel.org,
	peterz@infradead.org, paulmck@kernel.org, muchun.song@linux.dev,
	bp@alien8.de, dave.hansen@linux.intel.com, pbonzini@redhat.com,
	clrkwllms@kernel.org, rostedt@goodmis.org, nadav.amit@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] x86/mm: Share the full TLB flush dispatch
Message-ID: <20260923091729.SmwUqRt8@linutronix.de>
References: <20260921095359.3784458-1-zhouchuyi@bytedance.com>
 <20260921095359.3784458-3-zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921095359.3784458-3-zhouchuyi@bytedance.com>

On 2026-09-21 17:53:56 [+0800], Chuyi Zhou wrote:
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -1445,7 +1445,7 @@ static void do_flush_tlb_all(void *info)
>  	__flush_tlb_all();
>  }
>  
> -void flush_tlb_all(void)
> +static void kernel_tlb_flush_all(void)
>  {
>  	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
>  
> @@ -1457,6 +1457,11 @@ void flush_tlb_all(void)
>  		on_each_cpu(do_flush_tlb_all, NULL, 1);
>  }
>  
> +void flush_tlb_all(void)
> +{
> +	kernel_tlb_flush_all();
> +}
> +

Would it make sense to drop kernel_tlb_flush_all() which is used only
here and instead keep flush_tlb_all() which has also external users?

Sebastian
