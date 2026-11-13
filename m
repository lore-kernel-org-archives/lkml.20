Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602653;
	b=fIKENJeFwv/XfSjkqMd/gzM1io5hEaKat1X8iiMR32ArUiw7pxxF3nMxDoBfVq2Ht6OG
	 6xKUAAiZmW3LI3102APg6Wx+fWoVo0gkHXGEz3bAjm9BHoyC6MtMRFIQ3p+O8K77CFPs2
	 UI4Y9sSi4qiUG3rCI4Fp3FQzcBtQRisB3gxkPP/nD4JeX/2Tu899Bl6aQKxSO/OpsvjFW
	 dUsJ6CyfMD7tH/AxiuBNa1wqZrCZ356Muk8rcPulH6Liq0fj1eY323mTsCCY0v1v0YYvs
	 0jP98o003lHV4YF9JPwCUfFfWfZE3oUA1eR0vIgAOPKHu9c1T+o6D99hFtr7REu2JBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=NhL/M8HEMn0PgEwzPCvcTjQTkSJqxruxvyvf5fU6t/s=;
	b=GrnlsOScfqfbP+fB72rIXIjGf0zQ0XzQxfANLvkbEqHdkLDseL2hi0nRdl9phPZVxROv
	 jcq5yO0eDYko4ANYFXA/UjEqy9KPd49KK3z0MFjpzKjTMkmBaD5F9oAdsrZBpBphE4tjN
	 s5Gd634EN2T8k9RXMJU+p4oO8itQVK2+hK4h+8OZvrYn1n8vaFVl2ZiWN5s8dFwsnin4F
	 K7ZTOkLQn+2Zm8Yh31rKPITMvJmQDRfJ+Y8gW6LlophFNo6UXYWJL17Bp3S5+GJilVOqm
	 1YRy99UfnAUFPQiAE3M5dLtxON+f1II3JiiLGA8Y3PWxSOnY9G/gbEWwrQS2ORp8CpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=RBpqL0ec;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B680606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B680606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=RBpqL0ec
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91eb3fea2a9so21697566d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794602652; x=1795207452; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NhL/M8HEMn0PgEwzPCvcTjQTkSJqxruxvyvf5fU6t/s=;
        b=RBpqL0ec73lueiGVkPbG1IHqA/miVhGt/x78w0yuwuDBNEkC9OOEfuktHThNoxMzVX
         lEvekudGBBlWCuLH66HiQ6c3TH0C0kY7BRvuMJYO7RNsIeQnqBXAzvWt+6DJEdzekP8F
         dtd0byVRQC4qVGHuRQRcWHekZJU5cZZR2pT41sfu0D2VVOCcwrjNy6CfwVnDT9wJNaBp
         3j7ECdgERpI7+oLaPrDtP0BkTV6Stz2Q/u1OqG4IUa9w470NCAK7r7hIGdSgRpn3Ap4N
         jwI8XukywKVjkgaoD6hqy79iAK9/XG6F8QD6k1tdKDtXHxf+LN/i5T4RyMkE4okbmnGN
         QLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602652; x=1795207452;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NhL/M8HEMn0PgEwzPCvcTjQTkSJqxruxvyvf5fU6t/s=;
        b=ZZbMuxu/JSDufipXyae3tpvmfYKhnXicrQCNAiouF/jUNcGSxNjzSOwKZLZrWYyunJ
         oAGgf9ExciEQCDcvkwpXkfimrDQtJ8CI6s9JrnpkErFHB3f59Jn/IMdIFx2lLD1AIeJa
         sVs/Be2SrqhbPh+qp9odSrX91sAzpnYPYskPdJrhUppoxN5PcTWw/MZQMn1Gwns+TZQP
         faVjc9m+lpQahDJBQGFeWZTp1UQ5M0ER9T/aZWntv/l2rAxucUJy26QoSffZUFma3hh8
         gOFmLOQTe/ItKHMc1Y4HmBIwzw6ykUkrhxDuuGcNYQjF6EtMoJxGng7O9ldx8W4k7yh3
         F4dA==
X-Forwarded-Encrypted: i=1; AL+hErHUn2TpaLKNolR1xVGDBOkyrMTTIccjUsk/Z2FNv1YWPXBMQJ3j93AchK9b7vQbS4QlIXhtVwJUZvH6K2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HJD8V6nAP2zLK5owAPY4O5Lbc/yw6DgQYFzpfprewK7GxAR/j
	qOrwWVfaQ7SgU3XPvWTMa2DEUM/ACR/jNEOzHnA96ZZylVGvhUCITQstyS/OCe2TpVA=
X-Gm-Gg: AYBFou3CrcnOsGbn7D6GWYpJCzf26zpYxlqvl+ljKc8PSs1eYFl6Ql/1iH/HvhoJ5Vz
	J7Y2pgv2kIq/WQmPEJ9k2p3vUIl6kuHJuwdM+oHgQtUXX3WmRGG5iHvDbIwrqp/mvfq806Ztnk7
	vCzxJEUGVSzKTjDzfEUxJ0dinphpc3i17Jl1QzukY6+IiVs1jG4noxns8fA7BlbT3u9nf1lb048
	AN6Ylc0cz0ub8mpF1kTlGoqkB7inwMzj2udO5ebJ1KF/0/ZgYad2rpyTeobQ6uHufNBnt5QFTUD
	2rh6m7dcy+Sq84ugsDjSxsF0lOWd8IP104DC4BruKt/xVCrJ+f+JWLNv7ZJFJy1k1u1N1v97Ybi
	6pYm2XtdgNUxeoQM3BfVmpX0I/xoPsGmwwJXgjGUDfLeKJ+/STBVhVwXwttUsqCiRf7wKqcdom6
	U9+NacnDyHhFC9LntKD1SB7EG/ZFZctB+G4sleDNcZCi//n2xQil8v8+mMyx/98tn1ZXpTuHXn6
	2/JCPniRPoZMCI77jxamY3bnbLZ9XYaheMhtrcRsVi9wR8G5kJBNcEqW4LgYP5vSCEBQHq2upIU
	XCjwZl3N/lCBGQsJ+/9qoq8hgTG9pxJotkk5ZeIWNSNHyw4oWviLmdUP+M/Dd2YeBqGAWlC42j/
	bi6htJA4=
X-Received: by 2002:a05:6214:450e:b0:91e:b670:f9f5 with SMTP id 6a1803df08f44-91f2401477fmr56726586d6.3.1794602652059;
        Fri, 13 Nov 2026 12:44:12 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db49c5sm28150796d6.41.2026.11.13.12.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:44:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 5/7] sched/numa: scan PID-inactive VMAs for
 promotion
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
 mhocko@suse.com, peterz@infradead.org, juri.lelli@redhat.com, 
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
 bsegall@google.com, mgorman@techsingularity.net, mingo@kernel.org, 
 vschneid@redhat.com, kprateek.nayak@amd.com, ziy@nvidia.com, 
 baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com, 
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
 usama.arif@linux.dev, kas@kernel.org, joshua.hahnjy@gmail.com, 
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, matthew.brost@intel.com, 
 byungchul@sk.com, apopple@nvidia.com, jannh@google.com, pfalcato@suse.de, 
 hannes@cmpxchg.org, osalvador@suse.de, raghavendra.kt@amd.com, 
 stable@vger.kernel.org
In-Reply-To: <179434297609.2530531.2349001562856798404.b4-reply@b4>
References: <20261110150446.2452975-1-gourry@gourry.net>
 <20261110150446.2452975-6-gourry@gourry.net>
 <179434297609.2530531.2349001562856798404.b4-reply@b4>
Date: Fri, 13 Nov 2026 15:44:10 -0500
Message-Id: <179460265050.482102.15374067770225444971.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-10 15:36 -0500, Gregory Price (Meta) wrote:
> On 2026-11-10 10:04 -0500, Gregory Price (Meta) wrote:
> ... snip ...
> 
> Sashiko report feedback
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -4249,7 +4249,7 @@ static bool vma_needs_placement_scan(struct vm_area_struct *vma)
> >  	 * threads can help scan this vma, force a vma scan.
> >  	 */
> >  	if (READ_ONCE(mm->numa_scan_seq) >
> > -	   (vma->numab_state->prev_scan_seq + get_nr_threads(current)))
> > +	   (vma->numab_state->prev_placement_scan_seq + get_nr_threads(current)))
> >  		return true;
> ... snip ...
> > +		if (placement_scan)
> > +			vma->numab_state->prev_placement_scan_seq = mm->numa_scan_seq;
> 
> Sashiko took issue with these skips, but its reported impact is
> overstated.  It tries to point out a pre-existing condition:
> 
>   prev_scan_seq skips an update on a rare corner condition, but
>   now the same skip applies to prev_placement_scan_seq.
> 
> In modes 1 (placement) and 2 (tiering), the behavior is exactly the
> same as it was.
> 
> In mode 3 (placement + tiering) the result is that the starvation
> counter isn't reset - but everything still works anyway because the
> VMA is still being scanned.
> 
> I can follow up with *another* commit, but it's really low impact.
> Not sure it's worth the churn.
> 

I will refresh this next week and just address it in another commit.

-- 
~Gregory

