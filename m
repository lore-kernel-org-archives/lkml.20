Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240328;
	b=neus+C6wc+SZ6yBWqboKLsgV0FMEg1iv/0bttITBuIcpV5j9TqaVkkiRb2XbKLyR929d
	 pjrR5QNl2lqkB+/SnKLNjcnbBQsX+ynV9tC+4I1MPCXJuEh5kVzwhpKt8Notes7iA00l4
	 yMUPn8JOxMvAwurnMYvAb4otCF1MXRkUUoavKYs4+0vtxsBLju9WPqMiyWLb0H2Vs+W0H
	 f5LvYgfTGhhuHH6MjRX9FRhRqGPuWCCa1LsN52SqqbLSF48BeeFSCG0+HTXdM6Wb2Hqi7
	 UI5BH+t/Zg57s3g94uB/Mi/VZPPh1XYwj9aPGBmZrBmxrlWfTmv2VAKmvkBfRoqaLNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240328;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rD0TnuuwuM4pZL+zr/dUGguLhGYNasqzjimFQ2f+J1Q=;
	b=O4SCWc+zvtx75quD/W+khAPoD6iHj2Oyz1CKk+T57YoWYbWy1gqRKd0e5ZsUR2JbtWZb
	 ozYt4ZYaSkF7Ywrpg41eCaHJdn6+5NEh/FazkiKcZNeL99BoXiFwLkpRoeqaqEiiHcoxw
	 HdEqGKXsxffLakcuc98/aQhRTR5UEUPwSt9kXh9OHdDr3R1UrxGDxFE+nl9NYkkb+kH26
	 tvHf6LxOoJNlVT04iLPAC2u33oLf8GsTAaPGxf8xLQglok19awwDZnUQBM1E2nsRUas9+
	 OEj8wG0WTgWdF3vaA0HHuLFbk8kLGP5GghPFRoTBQgQXe56mcIk9QJkeiCVu8M/Hdrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dTNjyTE6;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B5PWwWw6;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C93606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C93606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dTNjyTE6;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B5PWwWw6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794240326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rD0TnuuwuM4pZL+zr/dUGguLhGYNasqzjimFQ2f+J1Q=;
	b=dTNjyTE6gbys4+kdkc+zDljpEm9IqAra6drLe7r7REOn7TCp10HjjXJKj8VfbrusYbzpvW
	NQJH3DaSqYxtV8iXFEI2TnyFroSSPkIVChF+KukEUm5Wrj96aEh2Fgbov/++7/XfQE8JK4
	ZV8v5SutxWsxP43PKa5XP4ufopeRgZ8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-LNQLol0-Pj2sw_3W1nqjGw-1; Mon, 09 Nov 2026 11:05:25 -0500
X-MC-Unique: LNQLol0-Pj2sw_3W1nqjGw-1
X-Mimecast-MFC-AGG-ID: LNQLol0-Pj2sw_3W1nqjGw_1794240324
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4afef353dd2so12524615e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794240324; x=1794845124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rD0TnuuwuM4pZL+zr/dUGguLhGYNasqzjimFQ2f+J1Q=;
        b=B5PWwWw63AqQGP6aPZuN8Tk25j8UkVRJXzAcbq4ejEdJlT1oifD32CJOy1gJvaz13K
         8817mPy03rcCWGq7VwovwuuKF67xQtmMS8MQtE5mC0Yfsh1W7I8iYLXbMx4l5VhQGYkB
         uVE3eCtNB14iJTb6A7+asAuMxlcqIONlNuwc8CMbDxDYC+qpbWfzVCdbx7Pb/UYtij82
         ccZUl9jUoqhToyYrvizq+mv3hGYId4R6dpky4rWNzpZ1D3rHYVSqXkc1RlSfqTFareBB
         /esnPeNbcN/CsmeypyYAnPx9gHrhEOcu7H2eziDMV2vJM/NBr3+09rUgLDCQswDF2wjj
         DsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240324; x=1794845124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rD0TnuuwuM4pZL+zr/dUGguLhGYNasqzjimFQ2f+J1Q=;
        b=dqyLAs6Ilhe3uhl49O2xVVtW/EwJFsTTkMAH7kM92eTNnrzfIb46Gpg8XL0xohZ0Eo
         4VlT9ta5HIwQb7K8hStRFWqkim7aVMwsErKJcz1bq6vIXTsPPfgNuwdKe/6lWSR6s1uO
         EN7Vn327OpXic5hm+3IJF/95v9KngaG+xCp0im5AC1iwY9OZKmpKVWQKRkOwOEQhj/To
         v+SCER8j/COahW47YEhQ1S9wrAgtL6kLJ+X7OeuKyg7lDzADskZ/vg4fMeaKd0B4s4Ot
         cYtFCxGckFxmoka4TgnXCv3RvmkLzv2vGeK+ObXE+oggsWJEXLq7msSsdhy6sifva14X
         bN1Q==
X-Forwarded-Encrypted: i=1; AL+hErHllB4PzwXgAIhFwTaVMq7YPcP8S2RUH1ASD27J9kQ5Ex+ll6gdZC8vdX9WIGgdYCW5fdGB1/f2duc6Z3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vgajq0CpD/vR/NbMj2lZosGemVjIMfTWYjMbD0wEm/iu1bFd+
	jryunZGDMJprqeLVoghdg8Snb1a9gOi6GnMd1bHmaGuWaCyiEh901WRkh5fZIJZRieu9ue1gOwB
	0PIXy2ohHEL0dDXr5oGMQPOpSZlwQDXJY+KHNwYUG5fYMfCYsyLa2FLLywb6cscAq9g==
X-Gm-Gg: AYBFou3yWybygQmCKNmdmmweAV6+jym1MXZwvdCXaKkcKQWecn9q/nY8sUswG2XZV9b
	CvE/jHOUbW/Ls6L7PwTUsuvYrJAS4Sphl2wmSf+hO1sPiAzhChVVEtOwMOrqv8uUOUwoalcv/52
	3WT6fFFlhMJKyDPi9UIB7Za/h5UNf8I5v+fZXqGJGTd7PLiUgUqiDsyEnpq3xnQYat868/WI/Ph
	CCji+vTXFm5YoJsbW5jL6LZ/Hxb5Rxo2MNlFsY9Ml7Lxu/g47l1U7NXkG3zuIv4J93Kt0FutiOR
	N0ceee8L3XXER3YF6C08WphQWsTNLvl20d/rbShg8LEwLA9yjQuhqaZuMtv2LMt7sYrnFdpXBIr
	gCWRNAXGa7XBWCPAKFrn0weXievJwMXxPVGneHxIf5QnXW5eZ3WuZioGItr3Vdd0nn0yOw3Nb/l
	dDLQ==
X-Received: by 2002:a05:600c:19d3:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4b9633cf337mr86690805e9.9.1794240323551;
        Mon, 09 Nov 2026 08:05:23 -0800 (PST)
X-Received: by 2002:a05:600c:19d3:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4b9633cf337mr86690105e9.9.1794240323029;
        Mon, 09 Nov 2026 08:05:23 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596acf465sm12474800f8f.21.2026.11.09.08.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:05:21 -0800 (PST)
Date: Mon, 9 Nov 2026 17:05:18 +0100
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
Subject: Re: [PATCH v5 07/29] sched/deadline: Do not lose a throttled task
 switched out and back
Message-ID: <avHvPjz4dL0zNyGb@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-8-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261108185406.1549770-8-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> A SCHED_DEADLINE task can be throttled, switched to another policy, and
> switched back before its 0-lag time. It may then never run again, not
> even to die of a fatal signal.
> 
> A task that leaves SCHED_DEADLINE keeps its parameters until its 0-lag
> time, so that leaving and coming back gains nothing. Commit 209a0cbda7a0
> ("sched/deadline: Improve the tracking of active utilization") moved
> their reset from the replenishment timer to the inactive timer, which
> switched_to_dl() cancels.
> 
> This misses a task that was throttled when it left. An overrun can put
> its 0-lag time after its replenishment timer. That timer fires while
> the task is out of the class, and does nothing. On the return of the
> task, enqueue_dl_entity() leaves it to that timer, which has fired. The
> task is then on no dl_rq, with no timer pending, until it leaves
> SCHED_DEADLINE again.
> 
> Fix this by replenishing the task when the timer finds it out of the
> class, as for a throttled task that is not queued. Its return then
> enqueues it.
> 
> Clearing dl_throttled alone would not do. It would forgive the overrun.
> A yield left set, or the old deadline of a constrained task, would
> throttle the task again. The Sashiko AI review of the first posting
> found this in the first version of this patch.
> 
> A cgroup selftest under development hung on this bug about once in
> 1350 runs. The throttled_round_trip case of deadline_switch_test, added
> later in this series, fails 8 times out of 8 on v7.3 and v7.4-rc1. It
> passes with this patch.
> 
> Fixes: 209a0cbda7a0 ("sched/deadline: Improve the tracking of active utilization")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

this still fixes the hang, so my v2 comment stands: take it, and keep
working the potential additional re-entry corners separately.

Acked-by: Juri Lelli <juri.lelli@redhat.com>

Still have to review them properly, but between 09/29 and 24/29 I
believe every return at or after the 0-lag time is now covered, that was
the bulk of what I was "seeing more of" in my v2 review.

What I think is still open is the other half: a return before the 0-lag
time, with different parameters, where the budget carried over from the
old reservation is never validated against the new one. IIUC that can
only buy a task one instance past its new admission (it converges at the
next replenishment), so it should not block this series and we can
discuss separately/later on. Just mentioning here so that I hopefully
don't forget.

Thanks,
Juri

