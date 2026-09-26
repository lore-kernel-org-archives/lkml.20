Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22157372B27
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790438669; cv=none; b=Qjxfm4O7WHqEpdWm0c4ThYgzl9iHdR2yYA1yw1EFQ9tGrVgDLNCa1A4564ZHvu0TL0g51KL3cuTVz+/67k4HvIiW5WPBWtfpNANgh9/DbQuLsVlmfYuP423MQ8UNaJ4iCKsnOdrawxQvlU3aRbn9ZFXpehzp4m66V1CMWXncTPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790438669; c=relaxed/simple;
	bh=NWM4pJtaX/q1ZBVgVlo5UZ32wLfKql6vva2eEs2zGJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNC9tri9fS9DDYImIAR83PR2J9t7SfHsdq0uK16eH2jrqEFEaamQGXv3BcjUHOzyID5BK6t7ATE6AI+vqQ2l49Y4SP328r/+oSgguT01SuEv2acZV1aYJ7qcPRKm6WUDB2RQzFkH0AROkHpPOc7FjjQ147l3kNkvHNUZdA8aS7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUgvEG8E; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUgvEG8E"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d797cfdd5fso191144eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790438666; x=1791043466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=04CycRj95YLfmA7hA1DhHUf9OsDpKgTDD3cyHvnkUEc=;
        b=VUgvEG8E9ZgQsj/yLzKvn2Lu5Ac301B9rZDlQvQZwHCKWimZIgGqjr2I7E66RSzmEW
         lIANXQf8daSl2P85tS+SBh3X3p6XlQWxoo87ZSWti3UmLxx4B3h1WEfUM0byLTX4w3d5
         chcyo7BEW4bIdTCZMwOyv3DVVOgLQfSGpJvsO4XWv+eqM7npS2XtZWtZgK4M2EpwMiND
         bwR+5FnG1LXnHs3PA7GIdko56JsAj0BOjrMF1B9yYp3f0MfRbBm9C9uElmTU6m9glHTj
         4iwFQTgGuGKaLgU3Egsjk/49KTIlJf2TuQsadhpj66B37xsBp60xzflhW7yQZ0uoejft
         ypLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790438666; x=1791043466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04CycRj95YLfmA7hA1DhHUf9OsDpKgTDD3cyHvnkUEc=;
        b=DPYTpZai/BDQrWSDTZI7Leadlmq8qk5ZcIr/cBoOkiJWFRhi+rtPpTvx7LtoM1sKdn
         /taiCyrmRO6AjYQcQJMobBoRjKqvJzdVsaOg87I+oJjdOjSeiK9in+7GVTSLaGQqFsrZ
         d90u6SBBXWKt1ru+W4VmrXm5uPWxnDRvfvpc6pS3gyTYu1dbuxC+VLAhoecvKPL+gTr5
         IB8D2L4aOeB99GMpcNLMi1d00f0GhXHAjC5DZWDz7YscowBpWd2nTKJYKEeUh22MYe7f
         NYgWFN9zf8PNGIL+/NSbgcPIVEqz4Vf/Y8Z3/368WQUC4o4wGkIlI+sQ3mRHeEry8TM9
         Pfyw==
X-Forwarded-Encrypted: i=1; AKwUvBy4qI0NEU8F03T5Bfy1Ce1R/Xj7TQuZh66DvtRWLCVbffKrWxmIJlsgfwzjz9druU9NoL3BacfnMUcQ7s8=@vger.kernel.org
X-Gm-Message-State: AFuF++lM576Dr28qOKVOU5moEZwk+1Sq0PLrDQgwPaPXqHILo+jpDnnf
	m6d3ETGUPI9MykEPJ+ndFiqV4S9CVG5A4Cc7mtaefc81M3u5c/bAJ37x
X-Gm-Gg: AYBFou13IWlUnJBiUpSOy4+G9fHUX4j/eVBVximbwlY2d8Lws+YxI444v/91gImsPQr
	G1Fyc7+J8MHeVyrS9Q6UPZqALV3DvFCi1n7815aFZkLtlc5tVBFtKVQodHp+m4/Gqqmt2AfDBn4
	Qky2mmHAU5xGV+7O1eu8BfcuH2ALoK+aExQSF+YyJymyZMQ3wmOPg/8yG3mMst8ID2ozG3M7pHd
	p+U0woQNPu196sBSBmL3u2FU13aqpg7g6e4/7gJUkCM81fZE75flLycPDWgl05whXDcOR/Sm1c+
	FGfAB/Oi/hktJjuy1a+C78c6lEdOTAxKQAgwn1jEGnD33hs/ZAc63u/QIIeE9HezHW9rgFL5eAj
	dhLr4QwVhDCeO8EESy3lvC7F3dGRg8GKJg3YGsVgQ1tjMIIkhOtK22kaG0ay0Wve/5ZMW5Qx/pv
	MzVt56GV8GQSOiJ2RCQgxOyK6/mvc2xbL/kOYzW+lX8uCbMYRq5Q8SBxknB7KE2kenKOM6i8MlA
	mHhpgcv/bJ7QEdXYKisEd60ny5RbIOxVxi6HDzc8lOIQDIt2IXlcBIDE6dsph53fhqoG4ycc8SU
	UFJaJbYMMhkWsw==
X-Received: by 2002:a05:6820:4b08:b0:6b1:afc8:3162 with SMTP id 006d021491bc7-6d43f2c6fd5mr9089210eaf.7.1790438665895;
        Sat, 26 Sep 2026 09:04:25 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d581dc58dasm6182919eaf.4.2026.09.26.09.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:04:25 -0700 (PDT)
Date: Sat, 26 Sep 2026 11:04:14 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com,
	peterz@infradead.org
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
Message-ID: <arfs_kX_gkH1o_S-@fedora-laptop>
References: <20260911154148.644489-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>

On Fri, Sep 11, 2026 at 09:40:50AM -0600, Jens Axboe wrote:
> Hi,
>

...

> 
> This is obviously an RFC, in terms of what I'd love people to take a
> closer look at:
> 
> - The scheduler hook and the identity move itself, kernel/thread_handoff.c.
>   Is the set of refused states complete enough, and is moving
>   thread group leadership this way (the leader must stay first on
>   ->thread_head, like de_thread() keeps it) acceptable / kosher.
> - The x86 and arm64 register state handling. x86 refuses AMX users,
>   and arm64 refuses SME.
> - Whether anyone relies on a task's user identity staying on one
>   task_struct in ways not covered above in the series.

This way may break ublk server given 'task_struct *' can be changed because
the server issues blocking OP(fallocate, ...), then the `current` check in
ublk_dispatch_req() can be hit.

Also there is risk in 'task_struct *' keyed bpf task storage.

task_work queuing could become tricky too.


Thanks,
Ming
