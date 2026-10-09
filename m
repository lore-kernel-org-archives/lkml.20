Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2174C9DE4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544602; cv=none; b=txxRLEKiTHuNxF0SQygM5vFqePF2pJkEMvpdvZqFlG9gsPOxjQ30MfmgDCQ9lGmzEI1wY1jyiMLQhGF0IxPgNva2a9YDkvdvYMU+N7kIoXWS7AChdpIAx/4h/bTSUKKgZ+G8A/p9uoF3javFFzvfE2CQzQmR6b0HkWK1OTgBmAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544602; c=relaxed/simple;
	bh=7oNXmCayF+uoWO7ThUQwKuLtcd+yuCMSaHRdecbZ64U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1gj5UXGnYXfR9jB3cZhOEx/5xBci57afqp4MRLcYxGYNQ0dT4c8YuEFEc9KwEu3ue+dM2UOym6ncXu13ifKKacyuAFr+93HVCQfgZYlJ8JsZKo0uUeOCtjFH7IhG5dQ7Rg9N/Yc+DEp/gHqm2VrmeRMFZxHSEbZCT11bQAuiu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+Q1/ak5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+Q1/ak5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a17ce1dc00so3195475e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791544591; x=1792149391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itsLuONkjBfdmzhzJnq5Bn90MLJfbhblfMvMLn4gNLU=;
        b=Q+Q1/ak5hbNySeXthchK2E4p3/T4ydsNIRERjftg2rzflPU0dh3dqGmBvXtXTzJaD0
         ogf5wTRcFcw7xIhKfw/Qkj18b+IDhGGBU9LmzytJDffL3oI5P7/rJ0UF2g1ZDhJ8Y8/r
         8Rr1Yqr3bKAFJTBA4ckqAflyYWm4FQatA94+PhVIBeDVy76niPrDofC/ThJLFRnHDVX4
         oWY6SnLQEYCRtxpSvx231TGlT9FulUTiVPLfm8O84vo/5vTIz7j1gdWlIHdHg3tAB8iJ
         GLkeU3cfYV3xzJQ33Btk9t2HmmDMlHQObhelVtOHKHo2AsMMhmwneQTAwxetpJXUFXgW
         vJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544591; x=1792149391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=itsLuONkjBfdmzhzJnq5Bn90MLJfbhblfMvMLn4gNLU=;
        b=IjtsYMNOgNdnS+WCKzZCZwZT6KvQWgL9YFKRafwifGir8lLbN0j9i9IgUHJEBWs83L
         vScE+XL6bHvW9bFd+txpn+g99f0F3RFtEW3qDfGE2JGjajYXt37H3/yc9tTx9nG/hh8W
         vnsDNnVIqjwAvTkNVyXbKImk3nHVvHj8lQpWQLjMpOy1Mc6c2D6J6Vd0b8+3Y23bQZ7I
         ZfN3PaK+JJ1HFIt5Gi4WB6GGyjiJNMTdKRxVJvmDnEb4tnuccxzPrfzNdc6D2yr3aBM7
         gyicVKiYWZcWLriKodF7KbAt5DxkoozCncz6sU+ar6767FqddT8MPa/I17yfOEJ/fiJR
         EuGw==
X-Forwarded-Encrypted: i=1; AKwUvBxN9bCrXKdMmgJ1RXb7gyuB9WgRpqTI0B6pFIGzo8BpVtdcAy/trSgZtba0Qnp4Ptpt8kZnbTLSator658=@vger.kernel.org
X-Gm-Message-State: AFuF++kSuZGKlyJrOw2dvizY7MaXD1p5TeUMIgGBDworh/JipPGsNTvE
	T8FvT2KiQAmiXSTZtM/69YqmMXOYD3W2C2ziTUpUQnkLv4VndM4QabEj
X-Gm-Gg: AYBFou1g9IV5sbmwNy67H0i8CTclZiZURgs8gjPbIIfM96J57A8azyjKDxMyYmojnVE
	ZcGbqDiFYWDHyygK61Z5nVlVFjUQBF5ZUXc8F0K1/O5/xdh3E5WZz7lH5IptzzBq9hqGnlvfVDJ
	+0CsYHPeed37paF+GUBCBuUAjO/n+N9SkxpqL2VJaQFMXSvSCdfAm9Lntv+39MNhWUmtHwtepR4
	Jq82xo+5hVDnU4ysh4t4Z53+tZSLRAX96CcEDQzAOFJYW8M0Bh9bS2JFT30xnazvBpst+LET/6O
	REbW6Mr1ruPChPvslEmlxjJGch0hWB5tLNYdBQhbFHj9M2X8X5Tut49r93C4i2hDyEIiqBqQOP1
	YZLClvPWANEuX9Cp9RmuvHWgkmLJQaAScaOjgCI7iAUuDUEv7b2lupDf9srRHxXg2aaPWFtRGdE
	rKF3LsqH6wSOJu1T2nGPXL4lIeiOGBCSrN3UZ9ahIIdktgQT1YvYslh3Skvi8ai03wnOCv4LbPt
	yQuaWnVp1teXYQUFtHr80CBt1hefy4=
X-Received: by 2002:a05:600c:8b02:b0:4a0:1973:f05a with SMTP id 5b1f17b1804b1-4a18e47e19fmr31556705e9.2.1791544590796;
        Fri, 09 Oct 2026 04:16:30 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm46733545e9.1.2026.10.09.04.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:16:30 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org
Cc: arighi@nvidia.com,
	bsegall@google.com,
	changwoo@igalia.com,
	christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	pierre.gondois@arm.com,
	qyousef@layalina.io,
	rafael@kernel.org,
	rostedt@goodmis.org,
	sched-ext@lists.linux.dev,
	sshegde@linux.ibm.com,
	tj@kernel.org,
	void@manifault.com,
	vschneid@redhat.com
Subject: Re: [PATCH 14/18 v2] sched/fair: Enable push task for preempt short
Date: Fri,  9 Oct 2026 14:16:26 +0300
Message-ID: <20261009111627.4861-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002154415.2270586-15-vincent.guittot@linaro.org>
References: <20261002154415.2270586-15-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Enable push mecanism for the preempt short feature which is the
> 1st feature using it.

IDK typo count of 'mecanism'. It would be cool if I counted the typos I found in this thread.
They're so important. But, I didn't counted them

> @@ -3475,6 +3475,9 @@ static void partition_sched_domains_locked(int ndoms_new, cpumask_var_t doms_new
>  	sched_energy_set(has_eas);
>  #endif
>  
> +	if (sched_feat(PREEMPT_SHORT))
> +		static_branch_inc_cpuslocked(&sched_push_task);
> +

Well, as I checked it seems like first user of the push 'mecanism' can't be disabled.
This could be the correct behavior too tho? If we want to open it and do not let it
close even when PREEMPT_SHORT is false...

But I think you wanted to connect this to PREEMPT_SHORT, no?
Well if no, then well I have no words. If yes, I have.

I done a quick test, adding this line to here:

        if (sched_feat(PREEMPT_SHORT))
                static_branch_inc_cpuslocked(&sched_push_task);
       pr_info("push key count=%d\n", static_key_count(&sched_push_task.key)); <--- This

And booting up the kernel. Playing with CPU1's online status and closing PREEMPT_SHORT.
And...

[    0.967146] push key count=1
0
1
[    0.967146] push key count=1
[   42.408439] push key count=2
[   42.475103] push key count=3
NO_PREEMPT_SHORT
0
1
[    0.967146] push key count=1
[   42.408439] push key count=2
[   42.475103] push key count=3
[   42.562426] push key count=3
[   42.619255] push key count=3

This is a bit messy since it's raw, but as you can see even when we
close PREEMPT_SHORT this not decreases. It just stays on and grows over time.

That's what I'll say, maybe I'm missing something.

Thanks,
Kayra
