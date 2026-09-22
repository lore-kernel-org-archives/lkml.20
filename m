Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E745A542EF1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080180; cv=none; b=InmcWdI+0xI7KLEdcL6YGBB+p54tjFoFaoVqQBwJ/DPHesmCZDoHYqG3Mk/1rUK3+ak+pViLrOTLo+AxjUf0KfP73uFRQ5ccjHPuEXBjl4npI8xC3cXps+1Ul3KRthER/d/d8ymi84/SiwPo5E82SCkKGquwZEqLJ0hz3YHsqhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080180; c=relaxed/simple;
	bh=ZU1RP9Vu73G3fgWadKqpKB9h+wJicsH+89EBx6UW+UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsd0rKCJVAU9tUW+jqpaW3c6PP3rd1VEDoxl9OgoRdYL67l9ufC+Hj0aa+MKeVqHjRaMf8DfNYW+umeFzzXIKNZaSl/P/f0ClHBY34eaf9A49FTzpe+g4eM3SBoufnqEvOr6XYbgc86t/+3gy8EoOIk9NKCMmovwDv9mbWn0va0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AsYJ1t4Q; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZscRfdoC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AsYJ1t4Q";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZscRfdoC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790080177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cof2VboX946JUAbf6ACzAZc/C8L4CoaAeAcbPouW0YQ=;
	b=AsYJ1t4QvM5hnGMPimaitAJiLoiL9GNIrl+paWERBWaISIJEzHH9K7PFycyamIIWSYZNDM
	Dg2azzJlL3zMzS8rx+927fEQTo5SZTq4nhwKGdj8mVwXcXp9GhVDejKBMrfZRdK09L2i2S
	tJ4ya0PCjNR0zBOZa+ye9oXBs1vn3X8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-NJHDG7HjPyWeXyeINd-CqA-1; Tue, 22 Sep 2026 08:29:36 -0400
X-MC-Unique: NJHDG7HjPyWeXyeINd-CqA-1
X-Mimecast-MFC-AGG-ID: NJHDG7HjPyWeXyeINd-CqA_1790080175
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49cf5bd2f12so54657295e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790080175; x=1790684975; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cof2VboX946JUAbf6ACzAZc/C8L4CoaAeAcbPouW0YQ=;
        b=ZscRfdoCh/EnAVprSl1mpEyzt9wKoq28svoonT+BdUE6FwEUYXkCfMnLmm+dhajs6u
         ipZPZoPMB7c6AjTKvUPQsJ7Ngo/viQrkxF6GOsd5U+hIvJKIVouRQzRHvdtC/UyTHG1C
         mP6nbW3O5r6W4OA18KqMel3N5NUQ7SYw1FlAT95XH/B46oCTW2ZVz2F9uWsE171ubKP8
         mpTSgzAFzzyNrfPt+0aSmjxRXioQ80l7NGa88JWOm/13iC8lxezUSIhPESq17V6j27YT
         1My93DfUfLp12hQ2R/Jzv/7lkXOUS2tRgcpnklhnCinlNBy0N8XX0ZSieMlHcLj4CBTd
         ntNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080175; x=1790684975;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cof2VboX946JUAbf6ACzAZc/C8L4CoaAeAcbPouW0YQ=;
        b=nkRWR6wwYmOio9/cka6RwGpgf4H1Ayxs4BMiXJfYQWWeVo7VZXnSmcVFd2fAaFXzg9
         LUNza1vFszqKR945VHajNCa+C/7C/b6ASYGBV4tDQkS9zXc+KKAwVN9bBJVJqKXcpYL4
         s+ILafn7S37kLU6IopHjwofWvRNPW4cCIWtUpDO1s+Kvg5ZhtncEgIjCCchjvMln1ELg
         HcZk5kHzP7tUCbhXZmco5ARqTfEOV4FqK6HTRJcozuvBSsxKHwLZ6FjrVH26B5plAiFf
         S3CWS+hrth2Y0qRVmqQWD1EC+n/dwZ65wydS0PFbnTq4hyKZtTjL4XWyFjvDHiGGpym1
         N1XQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5zgNID3cEmvD7IGqyQtT64q9JJ7lHdS/pT1wLmG2GWrmll32W6u1h+ruWEBQtkYrd7we6aCeOD4GsV4g=@vger.kernel.org
X-Gm-Message-State: AFuF++kfN6SbYcoN1AsRLAjlAo7F6YArn6Kv+vgUH1ZzrCL11Ttn+gki
	aFS65MDfwKDYmrOtsNdsWcDsu7clPNYda8FLUYRfEOQ7rpSVEZ1cGmw0ouu9LBEOAbtbw/4YdCW
	zjlHDVnwWRBd6HC3ScydtD3k4b6q3HxPtPW/GQ17dzDWbGvwkRXieXTBWHsMsB2Aq4Q==
X-Gm-Gg: AYBFou3PXC5MZgtWwwvXICMnDt881VPPnzDLRlfvhrQV9Ym1kf8IlL7dsIwFvd9OKoj
	rNWQB6TQs+KLAONwExMhZcm3Sj8pojbIk9MmnTHa8wUN9wal4hWLrbLQYXnOrfRVwwVVRqtjB67
	x3DZsmoxYaUQlmX6/0wqcvKkBm4BXjqQdtXYO/USRS2eC96zl/QK7kIq3n6WctKcZZ8VX03O7n9
	z+LWZT/H4aGxMdYZBiWy12lm0R97SmmputXAXIuE2MAK+Sz4eWKCpQ501QHVV/16YnHMwIpKNz1
	oQwrbYz7BHXVWY+2u+QouoFCvtiGZstv0IryNwMkTDdlOTnLsLHPrZvCyO3olq7668QRqmsutIQ
	NLmEscR2Izm4qo+dC5pIznmXhbpi/+QCxK2F4J0k=
X-Received: by 2002:a05:600d:848f:10b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fc5735351mr136716155e9.20.1790080175184;
        Tue, 22 Sep 2026 05:29:35 -0700 (PDT)
X-Received: by 2002:a05:600d:848f:10b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fc5735351mr136715875e9.20.1790080174826;
        Tue, 22 Sep 2026 05:29:34 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.14.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886279298asm4077776f8f.34.2026.09.22.05.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:29:33 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:29:31 +0200
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
Subject: Re: [PATCH v2 1/2] sched/deadline: Fix divide-by-zero in DL
 bandwidth accounting
Message-ID: <arJ0q2YDoJdPVLTz@jlelli-thinkpadt14gen4.remote.csb>
References: <20260919153150.2618403-1-sh_def@163.com>
 <20260919153150.2618403-2-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919153150.2618403-2-sh_def@163.com>

Hello,

On 20/09/26 00:31, Hui Su wrote:
> During CPU hot-unplug, a CPU can be cleared from cpu_active_mask before it
> is marked offline. This can leave a window where dl_bw_cpus() returns zero
> for a root domain with no remaining active CPU.
> 
> DL bandwidth paths can pass this zero CPU count to __dl_sub() and
> __dl_add(), which then divide by zero while distributing the bandwidth
> update to active runqueues.
> 
> This is not specific to the DL server debugfs path. Mikhail Zaslonko
> reported the same failure on s390x through sched_setscheduler(), where
> task_non_contending() reached __dl_sub() with no active CPU in the root
> domain. Other DL bandwidth paths use the same helpers.
> 
> Keep updating dl_bw::total_bw when the CPU count is zero, but skip
> __dl_update(), since there are no active runqueues to receive an extra_bw
> adjustment. This avoids the division by zero in all callers while retaining
> the existing total_bw update.
> 
> Fixes: daec57983670 ("sched/deadline: Reclaim bandwidth not used by dl tasks")
> Reported-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>
> Link: https://lore.kernel.org/r/c52c9e8c-260e-49a4-a88e-229e0795d07b@linux.ibm.com
> Suggested-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Hui Su <sh_def@163.com>
> ---

Looks good to me.

Acked-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

