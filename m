Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589044;
	b=SXgg2MNEdt60PrFFeOHW3eU2ZrZiOuk7dKxDDYIZvQvPJNKU81k2SIAgiPgvx7Ajrz8K
	 vcH98K2qZqmvlZ5MINO+XTqBiZqwR4VBdaufzHsv10F29GvFrfSOJ1Aw9ZhCVYvDq5qjz
	 mLiGBfaDUx6Mlp3JBL+f/bTd2MuunBK80BEBcy2xgr+MzSvHzc9jbHvreSOYAjEPXIZww
	 gchIGbds4uc/vD63XAI58lE6Ut3cdzzyMEamuV+3aTytddqI1qhwRuaY520c3cqeA3gcn
	 2FUmZpPqJeAYV/GprKs63MoTZKEO6RN/AA9spprIsjwFqjD+xhROAXb5YD8wPzUbWKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589044;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=t7R90zeBhuCAPBYRWGVInzQKZ8XGZNdOKwhHfCCRUDk=;
	b=ip+KUhstZI2b3xBoyzG8trSSPrasfElchbquFHpD7aJTAb94hbCqQbqJBY1eH+QfU38G
	 mRdSU7X7pnW60JHFFsSCOReE9jA6jabJ22tOzO2WaU1F768E6HeLPV/QPAEZHyOkEfbkA
	 cq9ff0icWgd1ZNFbjTUdTvBiTbPWlG8BAJ/o6c8GAZzmpswdPC82WCaGREKPeT6cliLbN
	 EKhFUMxblC6zJT7n+dWsneJ16r24+0rbqaGJqla4TmhPcHCuTivkdMTxuB25ZbYbq0pZP
	 Cr+SDDb8qodbvrypkLm7LqEfFNczqaZd3xER3U2KfVOeI53QK8b90I+G1I5AKJJs/4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MF3zm1Je;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AZRJTjLl;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD02A606A339
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD02A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MF3zm1Je;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AZRJTjLl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794589042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t7R90zeBhuCAPBYRWGVInzQKZ8XGZNdOKwhHfCCRUDk=;
	b=MF3zm1JeiL5WZQ9A1terY6B/MuTQJMZnTn8mF1WR048ahPKE42s9Gn1jts4fs1imaTW9tY
	jxGOk5dUXc8DzDE1s8luwNroMgmVagJ/YgFMtFYUmt9f3t0v72IOdSlm83g6gBBhsIQ6jQ
	Q3HtHUC01cmhXmlPlA9roJG5TnDIyBE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-HVJ-qETxM3G1tmQznWxkFQ-1; Fri, 13 Nov 2026 11:57:21 -0500
X-MC-Unique: HVJ-qETxM3G1tmQznWxkFQ-1
X-Mimecast-MFC-AGG-ID: HVJ-qETxM3G1tmQznWxkFQ_1794589040
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-490c1867460so616883f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794589040; x=1795193840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7R90zeBhuCAPBYRWGVInzQKZ8XGZNdOKwhHfCCRUDk=;
        b=AZRJTjLla20/bOP0upZA9DbntAjJGTMNRT3S8PlEwzRNCXOTwmz7ChdydZogcVmJTR
         Mc++h2/Ld2VCoAw45JbOfNAh3ny0mAlqq3Q/RvvMzAHMKTCwOpE/n0UJVUzLctm8haox
         hGH0v5bA8SPIRiEW8/+44HBLPtSeJ8AMb8OTNDcwsOHv4B2vKE8HWmhDwLRez/1Wo45U
         RCkHO0FuuHyBehHWDdybkyuk4wqSlnTfAXMS/on79RCztKaeIZJh64cHBnjbBVvFAdMG
         IQyjPw7EolOtSCaEtc4/wrP4kITjqCJW2BaQ6TNsAJtcgRSaTVjjYwLGxrVs5WTFEFQt
         tbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589040; x=1795193840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7R90zeBhuCAPBYRWGVInzQKZ8XGZNdOKwhHfCCRUDk=;
        b=MlPpk5//349DsOMo2BhEqOcRzeyJ0pzhWW6+vw0vurTC+BSY6hyyfEw0u87QubOQCO
         79chYKxnwEanqit59wsGzeIBEyFBeNtR4nJxQjthrQmxRjouoyLV79oZBR/qALa1AL1S
         pmtuQPjE1BTKO1E05v4l5pJCpNXzqQbVpy7ErQhdnZBvAbSs6zymxVYNpK3w0fzxm4Jd
         O+0rqt0nJ2det6Pg3vRs1geGRXMjgb0khZSiRKBx0vMihFapRRgGWJqelL0CCcsvYUdt
         bIQnBu0bkby6zXh1u/KnZnBvMDybx3Phfeap0Zpq5/zJPnzve2oNBxTFVRPLGCulHuX5
         eKTw==
X-Forwarded-Encrypted: i=1; AL+hErHrI84cHfM+247zCAdkJ6CFCnyuO258yRTpDBMeeQJdPtiv66E0XWnDYbxqVtVT0tI+tgKynOYn5nyc3Fs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hXQtkWjPyXLvskxMYuEfU7hxEdl60lIT5nn7y1oLkeVdkOX5B
	7RkPrLzqV9ZHbPRE3CZlFIT+TrS1+S0Smnz6qFr+3sy4oseqg+uaRKggakKCr6K7S0g4nS3aPH5
	xZnDItniHS17ugVy6juG3iQOq/s5zOQKHePZ2TOiiV5YtGR/qjIiZBmcZeNUYkFLTfg==
X-Gm-Gg: AYBFou28wWF0gTXGTIUTLpCuQKsiSsRLlCOYBiKU7D62lWBowGfS/jDvn39sQ44/00F
	z9EnOroZ9ck3fVI1bvyWI1AV8VhmoiernO7qsqgiZqBUEb+x0+K6KT+YOuAkEg6/LwFrK4D/T17
	j95tgLrswfEqSMxqsLASywCbr76AmZrN/x0Iwl6tvj+sRezFZMyAYGjZRCx9pZRVgX5dYer5/Yj
	2nHgeZEtYdaTB1vc+EhHx0370DMbdh1LkoKnK3r6nEFS0vrzT0n5A+V4YWbdnbwVsDHEuvpEdTt
	Hq+03orrBjz3jDkPGpMcmRjFJtTleXhKwAM4vxB3fvRXY7Nw/09/flPLKpZ+8C9jeqtiEHMHGxp
	Jp7ljjGvknDhme24ytQMWrfDgmATaHnZ6+hNJC+oPu1FE/deewnC73mmo2ll71lgQzkrPU4J7g4
	H5kQ0=
X-Received: by 2002:a05:6000:4804:b0:49d:57b6:55eb with SMTP id ffacd0b85a97d-49d57b65632mr3158311f8f.17.1794589040122;
        Fri, 13 Nov 2026 08:57:20 -0800 (PST)
X-Received: by 2002:a05:6000:4804:b0:49d:57b6:55eb with SMTP id ffacd0b85a97d-49d57b65632mr3158249f8f.17.1794589039729;
        Fri, 13 Nov 2026 08:57:19 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ee47dsm5790370f8f.38.2026.11.13.08.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:57:17 -0800 (PST)
Date: Fri, 13 Nov 2026 17:57:14 +0100
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
Subject: Re: [PATCH v5 20/29] cgroup/cpuset: Give back the bandwidth an
 attach did not move
Message-ID: <avdBakhOOFb_j6y3@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-21-mathieu.desnoyers@efficios.com>
 <avWEta7b9X4K6hF7@jlelli-thinkpadt14gen4.remote.csb>
 <e21aaf40-b929-444c-b707-3200e21d7301@efficios.com>
 <avczaaXEh_xUhxpa@jlelli-thinkpadt14gen4.remote.csb>
 <3b2419e4-3874-4ccd-8af1-3ca76df20717@efficios.com>
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
In-Reply-To: <3b2419e4-3874-4ccd-8af1-3ca76df20717@efficios.com>

On 13/11/26 11:14, Mathieu Desnoyers wrote:
> Hi Juri,
> 
> > I believe we already have (maybe broken in-kernel) EBUSY on trying to
> > hotplug last cpu with bw standing?
> 
> Yes, in dl_bw_manage(), for dl_bw_req_deactivate. It refuses a CPU
> offline in two cases:
> - the CPU is the last one of its root domain, and that root domain
>   counts deadline bandwidth;
> - the CPUs that remain lack the capacity for that bandwidth.
> 
> Both look at the root domain as a whole. The planned next version
> leaves that check as it is.
> 
> The new refusal looks at each task. The root domain keeps other CPUs,
> but none that the task is allowed on.
> 
> The case hotplug_last_refused of deadline_bw_test shows it, in a guest
> booted with isolcpus="domain". I1 and I2 are isolated CPUs, in the
> default root domain. H and K are housekeeping CPUs, in another root
> domain. B is a cpuset of I1, I2 and H, and is not a partition root. T
> is a deadline task, counted in the root domain of H and K. Without the

Oh, wow. So, this is indeed possible today, but of course completely
broken from a theory/AC point of view. Urgh. :)

IIUC, what you propose for v6 makes sense, in that at least it should
close holes we have today. We will then need find time in the future to
address what dl_bw_capacity() already points out:

 * XXX Fix: If 'rq->rd == def_root_domain' perform AC against capacity
 * of the CPU the task is running on rather rd's \Sum CPU capacity.

In the example above T should be restricted (and its bw accounted for)
to either I1, I2 or (H,K). It shouldn't be possible to admit it in a
cpuset spanning both isolated and housekeeping cpus like B.

Thanks,
Juri

