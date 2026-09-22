Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547B6415F27
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080243; cv=none; b=IDqL5AnOxe9/vWUA7rjJ9DiZyNWVlnnxnez1b4xZBvB6RP3yvydgDlCtXz2dNAFlxcC5u1m5vWJMbBS61WYrofox7t7/huFbq9KVezUIG6TIhbOEKFTgE65bxP1or3iDBag6MfkPR1eOh6nuYP1hvI1DhlAov4zEN02SqlcXdbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080243; c=relaxed/simple;
	bh=jLbFGsCRxKanypzsM4uvEpd5gw2Ul/4sIPR/IipaB6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4xeKahuOKafLtaLfKN55YcjvDev1D0AHHC9u1GRm4dzbRZjluOQn0KyYlu9JK/6SyQnbEYd+Q1/k4XNjEwaFIM6xP/uRV/ER5j/LA+j0T6otgDLjZh0Za48tKSJ1eWUENwcn/MT5Dpj/tyJFvtVUiXP6lcOzcagh4nrpb1NFwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NBXGtAlL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g87Zz8G/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NBXGtAlL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g87Zz8G/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790080241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHAELRmys5Io7McA1Ge+cOtnPTrW6a/s2gjYUaquQmg=;
	b=NBXGtAlLB7PaRRF/gIX+Tpu6U3P0foSMOGvn6h59nfv0/ilmRZ1kU7hvKJKGoCt41w1BOm
	MbYFmiHK+hLqudfPFf1jkGdIXr2B96dEwMuqhc+2UkyeYXWW1sFdHv8CfO1ME4IJVSvO/l
	FffQlbANiRFzaOIhJQulGwPNY9hD8vc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-a7oUowzQO0CwR0g4gX94JQ-1; Tue, 22 Sep 2026 08:30:40 -0400
X-MC-Unique: a7oUowzQO0CwR0g4gX94JQ-1
X-Mimecast-MFC-AGG-ID: a7oUowzQO0CwR0g4gX94JQ_1790080239
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e745d5dabso44052445e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790080239; x=1790685039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZHAELRmys5Io7McA1Ge+cOtnPTrW6a/s2gjYUaquQmg=;
        b=g87Zz8G/Y0h5VsQ5ytk3PgNVBJP1jVk0f5Td1jr0AWbbd2pmjypHTkJU/EAt70Haje
         jJocwFSHtfB8bfpfBDOeGhW35odLykncU3S6CzrQYT7omd3B6cIuNeuVWhss3SEm+bmt
         94ZceHD3lwAPvklj9y3IFhEEutxcDndF1a/qMeKROrzLUMQxXAm6T5mv/VyRIK+buw3g
         vMgeIVcq8qRQKfIHBNWcD54rhAfgPlQWCO06KYLYcbqtsbU63Sb5iZtN3Ykuat+szkdb
         GlKyYEjs/1q2ODyUxpFDDCRDV5WTDX0csLE4ydn/VnXXfR89v9dFPGpWc3sJtc/3WKF+
         z7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080239; x=1790685039;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZHAELRmys5Io7McA1Ge+cOtnPTrW6a/s2gjYUaquQmg=;
        b=OUlE7hau6Zye6MzA79qOpJkjTE1Hh8rZy1vIXjG7hPe8zT1L79z93erRI606uN8rKj
         HP+5hxIzVMOaFZzni/dRaDleYdczVEFg7sRtfJ18o9PKpmWTN1YTPsxnnMg0ROjaPN9E
         /ihpx9uPNbkgUC3yarH+3gx0/uaq1F3of2Y2L5x1XmTneQB2FHl6vdl1NpYULOmYrgoL
         NiNs2m1s81GdanKZg8dj/vZpH+yeTv4f52yy6VInadqrWUz5ET7FtJdafpp0klOgBTyl
         TLM32lNvf4RvvW8muhvmjVYNXW6dfFDEsYYe7PEWoOKmpfDaN6JgdsAlw2ddh931QGEz
         XtAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3DX9E3L8yPGJN8lD/hgXGVTGEFdfrd0WkFkTHpEoNL9tUw8eUQPquWZoLpP5QFJIT17JCS970951AQPc=@vger.kernel.org
X-Gm-Message-State: AFuF++m3loN1PZiHB0gKKpgfB4xoxfEVZaHKOGk1X2bqHdP1RZdn/gSN
	maOvjuj50PmisuuZTfxGN034sQStBHAx4qUit2Pk5qEpjXN5uKQdNkZBP3Rhks+m+1fo8/vIDmu
	tnrvnQu23viJ3fbwNrz9NrnzZE+zr8Zkbyqhr3Pc1unZcy87RWjrBuftl+57nny2cnw==
X-Gm-Gg: AYBFou1xGkITxy9epSrKy0PHhIsOg0dc6yJullL56Pta89TJ+1u4r1D4dpdfkORspdr
	XZE2j5cAWJh4YzunCbFNpTXEmbe9UAhmt9/LuO9brpS4I66+7S4UF4wQD5Y762o0FKWXnLO4KdH
	14XJqoKFiERrhTmNF0648TK7OB0ZY58kRjHjVijExlNXFqBKM/XLE2uys86YMyrBrdqYKmekxPq
	qP7rX1RVVl3AtyzkDQCeigPRWSVxLNLERF6uv7mfSc/iiELanQGOEe698Hc6CCF3KSFs+sZFPhu
	L6PiMmsQJNc065IPbnROIlvvmShBdPT+H4KnlHPFXNjUJg0IT9NqoNs5yKh0Fev9NBrEIR06dtO
	UeluNbTWrgCligw==
X-Received: by 2002:a05:600c:138b:b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49fc568f8dcmr179914985e9.12.1790080238636;
        Tue, 22 Sep 2026 05:30:38 -0700 (PDT)
X-Received: by 2002:a05:600c:138b:b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49fc568f8dcmr179914375e9.12.1790080238205;
        Tue, 22 Sep 2026 05:30:38 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.14.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad53b53sm46426695e9.14.2026.09.22.05.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:30:36 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:30:34 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Hui Su <sh_def@163.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Mikhail Zaslonko <zaslonko@linux.ibm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] sched/deadline: Reject debugfs dl_server writes
 for inactive CPUs
Message-ID: <arJ06kuNFepnpG2g@jlelli-thinkpadt14gen4.remote.csb>
References: <20260919153150.2618403-1-sh_def@163.com>
 <20260919153150.2618403-3-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919153150.2618403-3-sh_def@163.com>

Hello,

On 20/09/26 00:31, Hui Su wrote:
> Commit 4043f5498416 ("sched/deadline: Reject debugfs dl_server writes
> for offline CPUs") rejects per-CPU DL server parameter updates once the
> target CPU is offline.
> 
> During CPU hot-unplug, however, the CPU is cleared from cpu_active_mask
> before it is marked offline. This leaves a window where the CPU is no
> longer active but cpu_online() still returns true, so
> sched_server_write_common() continues to accept DL server updates.
> 
> There is no meaningful reason to reconfigure a per-CPU DL server once the
> CPU is being deactivated. Reject the write when the target CPU is inactive
> rather than only after it becomes offline.
> 
> Fixes: d741f297bcea ("sched/fair: Fair server interface")

Isn't 4043f5498416 ("sched/deadline: Reject debugfs dl_server writes for
offline CPUs") more appropriate?

> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/r/anw7IML1xzHys6re@jlelli-thinkpadt14gen4.remote.csb
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Hui Su <sh_def@163.com>
> ---

Apart from that the fix looks good to me.

Acked-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

