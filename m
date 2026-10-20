Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792464419;
	b=asM2+fXm/h2uSUkvAm2amKs6MyBNDYStTpHCtMLQiGiakOhGf18QDJz+5WJJSk06fbcI
	 HBlehwL6oDXKeR9nPcIndoIc+nlKwUHq4w/43CZiWb/E4xWCdEsRfVKBWUcsL12xSgy70
	 59AKO9VfR+Ysw2gw48t38zIhCxy+3kKyjBuS+HQUcR01Hm3wi6jxA1XJVow3GLUsrLrd0
	 1q+EhfO2YqU7DPMv2Y6oPcEOQ4LnBSsEhzqWdH4MxzktLGN7NfVSB1fFZIGzqNUp/+gl+
	 IoNpAEpGckLW8bWznJKR1/4Nu4SpTnyxOm/T7BWgnESKGuvZWbzWSkwGpMHjBpZHxLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792464419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=huBS00dBdE2TLgMpn1rL7Ix8kCPl76AlMErCkEyg/DU=;
	b=IbcDCDEk9MLniiOsI8AT92Mt8iVP9LNp2ST4FRWlMbiqavdkm92fiD2Pbapi7B9t+ly2
	 OVJW+fbObDp4DG1kYfnTf1KGOaWHmFlzRvDJCwyShGrA6JV3D8YzOB+7BCoxGzJu3gsGg
	 ewMFBLZSMe0bPwFGb2kBwlh3HgI6VvSz+RyjFDwUwt+cEK2+k7BUgZoTMNFUnFGHxyFnx
	 HW3RDg18CYikxEj3VrmiE/1l+fr8Mms+2o3c1K86idAGnWAyR48f/Q883O2OGqmofrqHk
	 iJPsBGBo8Odacw1JgPtMdHRlmcg9q7/g6ytLaS6/u7Bgap+hHIfYwPtmqV9hd9geQZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="AzfGC/0e";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109C4606A326
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 109C4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AzfGC/0e
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so19344175e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792464417; x=1793069217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=huBS00dBdE2TLgMpn1rL7Ix8kCPl76AlMErCkEyg/DU=;
        b=AzfGC/0e2RFbadfbmzaXeM8fbz+ptSile2LRdISaYkRDYe+P/tbKRckYlvJCPTY6aW
         fz8eUQHg/qF0PJraIP84QK1h4syJsgD2PFKyNF48TfHh7eQ1VgagOldU4ikhAQAomIEK
         K7Za67ZiCLV5201C2RR2LS2ISlxCTy5wGXnYeuxlfxogpymqkj33UX0fEXEIjlyZJO0O
         JbTqfnuXSHfD4lwAbROfOlEbCYZ7DGYDncripNIznUyJkzkGv04FDUxp6o1M3pwk5GFO
         hjOKBBX8dG1008eW+FVDgeyuxP/EE8qhAG5lkkKI33Vq0scYFeUIUJmUA0wp/i9pdgN/
         w9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792464417; x=1793069217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huBS00dBdE2TLgMpn1rL7Ix8kCPl76AlMErCkEyg/DU=;
        b=TF9/v4D59D/4143QjpgWWXVD7Vi5cQCtzQiM3cQPzsh/QtxrVCuyUKDrcTDVfqmKNX
         ArlTgq/IdAhEIItEAz3+lQhf93gK+PtndpGsMXupVpDBNzpQY8XN7lkma7YPxe70jTV6
         YWIGIiry+GoF3CZJQbUFVsDthj7hKie7jPswI3cY0xiWs/n9zx2kWXChGeE/2p8auKEb
         4iwVy7JLlFPeO75WRa497qKb3seS/8xF7UMkpbY15qN0K/pfu3UleKEJaWYax5mYs/H4
         BI6bWwvudZ3FdUaqfJ2wwCSJ5eeagqXKyVLPXkJzvMmbLroRya/ZvovpDSvI+Nj5KWOZ
         ROjQ==
X-Forwarded-Encrypted: i=1; AKwUvBztJl8zP3qD5KhtMSVIzueGOLiPJcbz2txvQq2jfd9K/V7coJxVmyrgNW6DRcN4zGyBcPd9gOnPM2h/jk8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQ6R5lOynkZmGQ5CLRBZodtssF1DHEuh0z2hXAhNDecibNkoyL
	iJ7la1oESM7aOhlxJ5h2zWC5ghegNS5CvW4KmOaD3hKe4GBN7S9sUOpsjw75x5J1SQJcjI9TdJL
	FEDo=
X-Gm-Gg: AYBFou2TkZ2jCoq7Ui1c7ynqRXRS0+VS1HSWTVobQrV95cUwDTp13eaTtNOfluLyGYC
	kGWdB4kXK2Bqe2iY1zXHqcpiLTpo1Dl7Kr3YU+XctQjaLJYDyjB0lXZRgykKb73B4KUtoN3H0fD
	0UlHC3WsZqEN0Acwqm4EdNfabrtBZlWSziJH4TBIKiaYpcYtRFktBtbc6E0N9OcMp6n/SWmRpNX
	NrfTWJokFZV7Gemp8HS2+8n3cS8wkiZ3OBQg5B6tIb2Icj9dy/9sZUPuvuqxvl9u8Ij6UGC1+B9
	hgZWQV+kR2yfix1jSfRXZ6CUG60B6MNkYhJQz84+YNt+e01NyWebY4g9FSRNjNOVMAi6GxPzIdN
	uh8qc547gMLsg0qZnSHAaLP0mexfXiH+qWUDL8GxNKGh2CEb4GoU/sGRhcrVCdR8Vf/N3lhgO7Z
	qR/bdV2XnA4A9w680t7ngKwllIrCz2NNIvfR3S1XJ/Jhh6ZtCnmAqbhsOpMNbgAhumm3Tg0tc7m
	8Sc59rlAlNOdjNykflconqnuQc9FCbYDi1YWoqxbWzWYkEtFGVvljBw3UVUao6kWwslA0BS
X-Received: by 2002:a05:600c:4e45:b0:4a1:e11f:b2d5 with SMTP id 5b1f17b1804b1-4a1e11fc187mr137769875e9.2.1792464417460;
        Mon, 19 Oct 2026 19:46:57 -0700 (PDT)
Received: from autotest-wegao.qe.prg2.suse.org ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f37f7fc3sm20894195e9.2.2026.10.19.19.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:46:57 -0700 (PDT)
Date: Tue, 20 Oct 2026 02:46:55 +0000
From: Wei Gao <wegao@suse.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] io_uring: clear IO_RING_F_DRAIN_ACTIVE on drain
 completion flush
Message-ID: <atbWH7hdrvLQJhOl@autotest-wegao.qe.prg2.suse.org>
References: <20261018070154.16944-1-wegao@suse.com>
 <ae73d8b4-c2b9-4a9c-adca-8c995ac92975@kernel.dk>
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
In-Reply-To: <ae73d8b4-c2b9-4a9c-adca-8c995ac92975@kernel.dk>

On Mon, Oct 19, 2026 at 02:50:16PM -0600, Jens Axboe wrote:
> On 10/18/26 1:01 AM, Wei Gao wrote:
> > Fix:
> > Make io_queue_deferred() return a bool indicating whether any drain
> > request was active or deferred. In __io_submit_flush_completions(), track
> > whether any completing request had REQ_F_IO_DRAIN. Clear
> > IO_RING_F_DRAIN_ACTIVE only when a drained request has completed
> > (has_drain), no drain was active or deferred (!drain_dispatched), and
> > ctx->defer_list is empty. This prevents premature clearance if an
> > unrelated completion flushes while a drain request is still executing
> > in io-wq.
> 
> Didn't quite feel right to me, below is with some LLM assistance
> to try and get to the bottom of it.
> 
> Thanks for digging into this. I don't think it's just a race with a
> slow io-wq free, though. DRAIN_ACTIVE is still set when the next request gets initialized, so it's forced async and goes through the defer list
> every time, even if the drain request is freed in time.een read.
> 
> Basing the clear off any REQ_F_IO_DRAIN request in the flush is not
> enough:
> 
> - A drain request marked REQ_F_REISSUE counts as has_drain, but
>   io_free_batch_list() punts it back to io-wq in that same flush. With
>   an empty defer list, we clear DRAIN_ACTIVE while the drain is still
>   pending.
> 
> - A second IOSQE_IO_DRAIN request that fails init after io_init_drain()
>   has run gets completed via io_req_defer_failed() right away. If that
>   happens while an earlier drain is still running in io-wq, we end the
>   drain, and the next request is issued before the earlier drain
>   completes.
> 
> It also only works if the drain request completes through the flush.
> Without DEFER_TASKRUN, io-wq posts the CQE directly from
> io_req_complete_post(), so the application can see the CQE and submit
> before anything clears the flag.
> 
> A drain request dispatched from the defer list always runs alone, so
> we can just remember which one it is and end the drain when its CQE is
> flushed, and have io-wq complete drain requests via task_work so that
> happens under ->uring_lock. Something like the below. Can you give it
> a spin with your reproducer?
Thanks a lot for the thorough explanation and pointing out the edge cases.
Your proposed fix works as expected. I ran 10,000 iterations of test with 
your patch applied, and all tests passed without hitting the timeout.

Feel free to add:
Tested-by: Wei Gao wegao@suse.com
> 
> 
> -- 
> Jens Axboe
