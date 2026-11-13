Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582265;
	b=BoP4FO83+6xurKacnv5HVoQ9KDUpooBPlVciCJfmjjDoahPhtDDaflILmEdynhkW2Uu8
	 d99lHxNY9MOCFJLYFf+j3oSL1bjZm8L7QP5r3BVr0PWmzKeJI6JaG5vFsTVBDNT5HDC/J
	 rNryRSIqXYPevs48hr2apNwiGS0gRgHPMo+cGN/AeNq2IKLz14orw+5oIh+y2PWKFV7vu
	 wc79OcYUMqOwE07GnPJO4P7MsK+TSM8bUxW/OrtlqkrEst+ALvuuqnBnUhXxbLqA2QRgu
	 lTudqnCQFwSQvnMSFwoG8cdcrM7DhWRNkWVm747nqJPcy2WeVXvUYsWNyX7orqQITlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582265;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VBm4qF0y5CrLsLbvNlcB/jDiXe3RpYSa+rFP+kdVVgQ=;
	b=fEVkQDBV8StOQ1jSo+yYfes7i53V6M51Zg7sVRrsLIzQo0+OdZ3BouzFelOPkK5VfTC+
	 tFeVKbXV81TrihER0WADtRw80BI2Ta6B8jGqZIHc/KH3wfJ79udjZ+djzCLnK87WXU2+i
	 oQqlj//55/a98pR953KSHDb+wbJtknXQB3nzUmc1Upl1HKiCyOsV3bXCvOrFJDwKZNHlj
	 Q+4xTcJCLvau+X5rq8IwcW0IiPADYeCkXcw4+UoXENAVyxISpjquPmo2511yuwbhCW2RA
	 nk1pwfbtN0udT2g6RFUogzCzfaGzii5zGGG0GN1pEjjZVkqKw9i3x1Ojp4mxKBW+MSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CmZn62zp;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=oS5DkMri;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AC0606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4AC0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CmZn62zp;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=oS5DkMri
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794582263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VBm4qF0y5CrLsLbvNlcB/jDiXe3RpYSa+rFP+kdVVgQ=;
	b=CmZn62zpnikFuWp5y6BBUHTBKrf9YK9dJHJ3NJdc/aUwry1j4LmrYsWWtwYkVWhWuv1diK
	NnZrfP1+GORtWMlyZMvCv0n0/OFED4p/hxqIPf5G8TntQchJoLJ5p815dDZmXc6kv8T6jH
	/pPqyo0ILNpz0dB96Z/wWBzLpvgST1A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-8oKHTm1tMRysFg_22q3Axw-1; Fri, 13 Nov 2026 10:04:21 -0500
X-MC-Unique: 8oKHTm1tMRysFg_22q3Axw-1
X-Mimecast-MFC-AGG-ID: 8oKHTm1tMRysFg_22q3Axw_1794582261
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ba01393800so6415845e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794582260; x=1795187060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VBm4qF0y5CrLsLbvNlcB/jDiXe3RpYSa+rFP+kdVVgQ=;
        b=oS5DkMrimF+WEiOXsw/03173ohIBtKnys2ULnWyR+LsriXd3UiAkohg4ffDEraIbQ0
         8PExyUa/dt14Sypk2HKLYKe3TZJ9YPrt1wUpOU+qQwhwP/DDBsbHgd32moC9bOLQJkRS
         F3Bq6F4bIafoSH+NslT2RaVdKqJs+fI2USxw2UWs20OE3S1pjMgHSgyoc2TcFuWy5SD+
         SGf8udVJ9nIXbH2G9h91eDX8968RrkV4yRfF8G5fsUbXnkpQHwcjMrgvwDLgOisN9OlC
         KXbI2yQ6RZDoBe3KNQlRMdtOvWS66s/HK+v9daKcK1OhB16eDhtekizTFY5ib5SRUZvk
         tWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582260; x=1795187060;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBm4qF0y5CrLsLbvNlcB/jDiXe3RpYSa+rFP+kdVVgQ=;
        b=mfhsskvm8QnECuy/azGxw8/wDyLsE3cPvcW3sGlChm5++Y143/Lbf0hd7c/yePI43x
         YEram4SfOnrB9DpV6WRWFnxY5avofnAJmjs1IIddWQCuyo6qEYlAc6YrUrJNT8cRf0IB
         Zf2/Z67kRqnNHHrKLpUDode7VgTLsiSatDcv6PMRJVxZKCnoe5vKtzwV4MSp86cXmpP0
         pgwgszPt+Roh7u6nzkRztHeZstzxUWnfKGajqfMZejOGncDoVczOUBnp7rNZiNfvm3F1
         +gAHKAa9yW35Sq52a3F3AfJqGXtnKurvlM6hE5LrnH5hEL0kSNTp7Z0gUBgDJlrEVhbK
         lMPA==
X-Forwarded-Encrypted: i=1; AL+hErE3k7AJ9u3SqdpYZHqeeNQEuzGVMMjoWEp/BMYFRRbSjJJwIBtAGha4M7/wiDN5p+Q94+uH2ndozn04MDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z93O19BeBbxHjcwsLqlB2Olawk5pt6mAitPEKv90JkDiKuVgrZ3
	d+slMznRjfjPGnHuFytUCV8LXcY5JY6w5gcbbQtR9c8BSLnJHdsamfQ99fLoWYBqsYp4wf+CtX7
	6QWoEDB4UvApbuP5mCw5ID7pD7a1hr2LMxNOgbJ01RELguFKU1wF6afuJ31fWfeawSQ==
X-Gm-Gg: AYBFou0uNnXLmuDuiCWNGa/SVEKmunwh4fIgIjOTrihacYD4JAMRtvGB3Lb/y0X/V8L
	C66hMJRBCmoQn3naepoXURLpsjf/3vVBfb2P8flcyftt6Zj52uFYO2AHzQbx/WVUmUBXq3DrU74
	+eAOmne5g3/2HC+MBv4y8BdNW20JaZpiZw+zhiYADJjm+qQxpaDt9qkIXLZXq7XdHDLeP38WHYO
	SgciIvpYVPFYqnHZB9b7mPavOs/EHKjlysL98OQk7I5+mqKso6oI0UyUxOC1aJS76hJEr6+UdtZ
	gqsUFQK5AU6EgNONUnZFGhYCM3KWZu37To7grzCsLt94pq1IRzsQ/uIlxLIFC0xeEm67Cydgq1Z
	AMZcYRh4aUcMk6f9noNixbA2WrN66KFAwXDBV/hHcrvVgtraO/iQQn/U8pvq2e16QTqVWAUHfPB
	krgvE=
X-Received: by 2002:a05:600c:a44:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb55a45045mr59742595e9.11.1794582260642;
        Fri, 13 Nov 2026 07:04:20 -0800 (PST)
X-Received: by 2002:a05:600c:a44:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb55a45045mr59741585e9.11.1794582260021;
        Fri, 13 Nov 2026 07:04:20 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm65285595e9.13.2026.11.13.07.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:04:17 -0800 (PST)
Date: Fri, 13 Nov 2026 16:04:14 +0100
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
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v5 26/29] sched/debug: Show the deadline bandwidth of
 each runqueue
Message-ID: <avcm7pyPqMx_r5Pl@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-27-mathieu.desnoyers@efficios.com>
 <avWWlEGGqVPYkuZw@jlelli-thinkpadt14gen4.remote.csb>
 <bcf6f03a-d596-4afc-9d3f-54219935bc2c@efficios.com>
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
In-Reply-To: <bcf6f03a-d596-4afc-9d3f-54219935bc2c@efficios.com>

On 13/11/26 08:36, Mathieu Desnoyers wrote:
> Hi Juri,
> 
> > OK, but we will still not printing additional useful information like
> > extra_bw, etc. Not sure if you are aware of tools/sched/dl_bw_dump.py
> > drgn script; maybe that is already useful for the needed additional
> > debugging information?
> 
> I did not know that script, thanks. It shows more than this patch does.
> 
> The two lines are there for the selftests. params_waking and random_mix
> of deadline_bw_test read running_bw and this_bw of each CPU from
> /sys/kernel/debug/sched/debug. A selftest cannot rely on drgn and on
> the debug information of the running kernel.
> 
> So I would keep the patch as it is. I would not add extra_bw: no test
> reads it, and your script has it.

Works for me, thanks.

