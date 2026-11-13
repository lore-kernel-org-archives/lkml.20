Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582407;
	b=2p7YPgLxeadp7SdnvdlTxRijXnAyW5t/yT0raLnMnERjsQZ2a7oJicA1EyGBxD9HSNip
	 b0Cr4AEIk+gGwVF5uq2N2+r2eXFqQu31xWJRpgM8ReYDb1UNINqnFvULtt6Gj4vXj6JP+
	 AIOVUMiROs+uq70pce39SE+/CQcCAWn0VXCvuaXc0KOQLiutEyiIr3it51GSTJ6LqobgD
	 BeV1TheNx41WukDhEgQueqFOE75qxWbMSLlvuBs8RN6vKr/NbIaV9uqx0UrcFCiIbfwvh
	 Egox+NNAQwtDRenTZiXiykv8Xs6zgBtzi+UsZBFZ75mZEjEv9o1EmFA+Vh+4XPCqI8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582407;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2Tp6iQjkfangii/DKRnGc80WH6QKMSA/4QcC/JVtYtI=;
	b=hOgkHd5v7+pmyq9OKNPooTXopuLgVxgfwIOoBPpsKmhKRkBZ/z6dkNxajK4jPmx/qQuj
	 9EKAd+pHlGQSsWSH59KHjUZsdr5yb8H+mB9N36PqJzXljSQprG3Ig0Ef1Ft9qNEbXXyTe
	 8ke8DrZUaZS1RS3ucnvThYq81NX8fGJdfdZWp2j6nExl0KUUYfkdAA4N3tyHc2+x0rYdv
	 rtefOO/HwcmFOspqT7h3LQzImUSmbfSfEpC9Mnnv/4oERYRj1uGxcx+lnUoVI5RdSnD9O
	 Yb90EKWD3N8SIvK+NAyHj6JdO1GrJQ8aOBm8g8V+NKY5lVQnFp0tMhgIwjTDOdXYJfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ct4uwrwp;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ns5S0Tu7;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF0E606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF0E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ct4uwrwp;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ns5S0Tu7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794582405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Tp6iQjkfangii/DKRnGc80WH6QKMSA/4QcC/JVtYtI=;
	b=Ct4uwrwp6xjqhuuqbCLJn5IoKq24VEE0IHPv4ZalQccSMQO0Ls/e/v7alAboCfed02QAdJ
	aHCFqYQ5FbGnBMH3MwX3s4ew0Sx3MqweFjMr42WSrzYKXCEC9fJejaAb2sbMvSZEmAmjA8
	l/95G+nv3mPjOnr1566sfOyVNP5qTKw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-n8IV5Tq9NZunpNiRuKBUUQ-1; Fri, 13 Nov 2026 10:06:42 -0500
X-MC-Unique: n8IV5Tq9NZunpNiRuKBUUQ-1
X-Mimecast-MFC-AGG-ID: n8IV5Tq9NZunpNiRuKBUUQ_1794582402
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a35db2d6b3so6208835e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794582401; x=1795187201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Tp6iQjkfangii/DKRnGc80WH6QKMSA/4QcC/JVtYtI=;
        b=ns5S0Tu7MrONZXzIzknq9qO83Czobv4jEAo3Ald3QMyVHS3ISoFwgkL7ShfNZ2GFkE
         0Jk0Fl5u8nkgUaJG9HLkJ1vmAj3Mhf+MuOr3LlU5CRjQsDtNyQ4ro5pnSosiHing3aGj
         CSVsPusCsNEZ+tFBSX+rvrv/WMErUp0AiSLlbKDl0jnduSPaNh1YYWUwETX0vGso1dx7
         5g8Bp2hlHDkXrZhrBqhEtigFDnd5SCvAs9gxkf6YOp0Rhz9P5nI7zdKSQaOo4kh41dG1
         wur3/LJkw8oKkiO+EeTI5cmtNZzHnebHw0cgM1EW8ajBuRPJ2n28z8pNw4gDCd9kXi/V
         54gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582401; x=1795187201;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Tp6iQjkfangii/DKRnGc80WH6QKMSA/4QcC/JVtYtI=;
        b=QcBwe15IMdGerVzqMG6Ej34mpLp94RSoy4X4d1toF2jXNnykYmaHafacnOwMBT81EC
         lBYcXScI111bWO/+blQkimenQ9k5LeSfLsWgBys+Wm4pfaB12dNCLBwooPJjewGlBaIf
         au+OPk2syn/bs7pRIyM1qGQWx9cB8W8/BgnSUaR3ZpNgMP2ynVPtmPGGcaKZ3WYlwTdU
         7vk1wFukpzyrG3938+cX1k+wN2Fwn9On+nOhV+ICeLhV0vpPoIyJPt0DgtFHlvxKZt/5
         47IR/zc2o3dQeGPwZKEWFKBzkm14a5nJtpH7DimPitAGGZzaCxMlkUun22DNZcQ1aC4U
         34Wg==
X-Forwarded-Encrypted: i=1; AL+hErFvKPjR6lZlaE+GhSuQbt42a37s/C+bl4n/DBVQws7Ishe0liMaINjt0/LG8fbUHolsw7RqKMxNtXr787g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U+2FzGTPianaVJUMqBtBpXOVich97rNISF5T/23gI8WlZiW4b
	NROD5efSI8tgyiQYzMctRQ7eIkpydQWCjPpSvJf8NqmqxzbeEFzjKE9AqsZ5F4dw8tTUfjkWhE8
	pRy5gdtvq55a3pa34Sd87Qtxhz+fjotT4+hsHjzaRlhiopaMcveicl+hp2XvJ0/JvSg==
X-Gm-Gg: AYBFou10S8NwXmnf32/Lbi1dDzKEKOSNj/R8DPaPbV/RW8BelgmmQ/mOTU3+Ff58Wv6
	MThYcofuteVMH4mlTi6p0gFcVnN2qNnpF6W08u1AU9zIMSUziB5BXweAzki+RLk4Yba5yJLFxZg
	Y2WxrDCiFRld1d6UDwLx7EKri8efkJMj6M5ClXAdPmvTzw/kCfSzHzZozilZcYSuGqHrkrJ7lUr
	PGnTBKsCdpqPnfJ9HzRoWUvQCMClnlk/krmSkg0cXtJCuWcJCtraLJ28/GSgv2YIS+V+srFXH6p
	/lm5Qtjw9Crx1TkpKoauvB3P8P7DT0tpCgsKc8SqIIYtqz4NEwQn1kU9TuOw0KwuRAsrARHsvXo
	Y9kxRMePIurJ3u11Jn9MnMOuznO/G6tYeE3rBbS7J8NW/9n4s5eO1UdAhp8ihQy7rBa/dRTRlrO
	Q6PzU=
X-Received: by 2002:a05:600c:a30e:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4bb55a5d63fmr51094645e9.11.1794582401505;
        Fri, 13 Nov 2026 07:06:41 -0800 (PST)
X-Received: by 2002:a05:600c:a30e:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4bb55a5d63fmr51093885e9.11.1794582401031;
        Fri, 13 Nov 2026 07:06:41 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5d2872edsm20774755e9.12.2026.11.13.07.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:06:39 -0800 (PST)
Date: Fri, 13 Nov 2026 16:06:37 +0100
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
Subject: Re: [PATCH v5 16/29] sched/deadline: Record the root domain holding
 a task's bandwidth
Message-ID: <avcnfTqZzNGLlbHk@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-17-mathieu.desnoyers@efficios.com>
 <avSPoSnNATnwZ8cS@jlelli-thinkpadt14gen4.remote.csb>
 <7459ff0d-d8e1-4fe4-b2de-4b4f06be9bb9@efficios.com>
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
In-Reply-To: <7459ff0d-d8e1-4fe4-b2de-4b4f06be9bb9@efficios.com>

On 13/11/26 08:33, Mathieu Desnoyers wrote:
> Hi Juri,
> 
> > > +           if (p->dl.dl_bw_gen == dl_bw_gen) {
> > 
> > So, this is not guarded by dl_departed_lock, but then this gets fixed in
> > later patches?
> 
> Yes, but only as a side effect, and the patch should not rely on it.
> 
> dl_bw_gen changes in a rebuild, which holds cpuset_mutex. From patch 18
> on, set_cpus_allowed_dl() reaches this test only from cpuset_attach(),
> which holds cpuset_mutex too. At this patch, from reading, other
> callers still reach it without cpuset_mutex: select_fallback_rq(), and
> sched_setaffinity() with admission control off. A rebuild can then
> change dl_bw_gen between the test and the __dl_sub().
> 
> The planned next version takes dl_departed_lock around the test and the
> update of the record, from this patch on.
> 
> > > +    * enters the class. A runtime below about a millionth of the period
> > > +    * gives a bandwidth of 0. It counts for nothing, and no move updates
> > 
> > Ah right, quite cryptic corner case buried in this comment. :)
> > 
> > This is the 1024ns/2s of the test. Which indeed gets dl_bw 0. Don't
> > think it's a huge deal from a theory/practice pov as to actually make an
> > impact we probably need quite a lot of these admitted (fork bomb style).
> > But it's still weird :P. Not sure if we want to impose a min of 1 dl_bw
> > for these. If it actually complicates the accounting (for no good
> > returns) or not.
> 
> I agree that it is odd. I left it as it is upstream. The accounting
> needs no special case for it beyond this comment: a bandwidth of 0 is
> added and removed like any other. The case move_zero_bw of
> deadline_bw_test covers it.
> 
> A minimum of 1 would change what sched_setattr() admits, by one
> millionth of a CPU for each such task. I would rather not do that in a
> series of fixes. I can send it as a separate patch afterwards if you
> want it.

Makes sense, thanks.

