Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72953C3BEF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789077819; cv=none; b=Fcxrd7uAEzxJmui6aIbbth4efYQ/Z50Qwf2tw1eWeF+9FirOGgDSuN5mOCcbcTeWJJ3siCPnauFxg/Ps8cUjvhvNmXjQVdS6y9STnpJHDOAlhaMBmFGHwswnRVksRw1dC4UETjuoXAVCB6VKxY6QjGd5IZmH3YhhJ8/oOUE36Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789077819; c=relaxed/simple;
	bh=R6zJwtMniZUXSTTD1kXs8OQe30mecg5L76/NRGLeEi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzEpZCbmq7rpuBgR8svjEzT/wBQodlhwSdAF7pWg96TXJmI19wSw3Vcc8aNZyGc9dw6d/WFbhoJ65QE72IOpTTskfCQlG5pe0XRP5Ye1/jI7JkOLWTBpv8PXy1gyWsEo/rZh9L1kRPOZ8RfRLHph6TI8Oadzmu/NTbSwQxMDgWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VX8Bh8fO; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VX8Bh8fO"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843703c170so24835f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789077816; x=1789682616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4VC0C0lSHCs8Fcark7cmj0Id1dSh7PB6GmHxMlnI8k=;
        b=VX8Bh8fO3DZcCKWqBvPN/TMBYfSP252HHdp+vqoiMIpWRDOu+9zcLcxJxJ/gaf1oLH
         wAUY8ozIOlIYrJ3YsssD26QMFrgCyjWSfDASLNE1h9N2qwcsIRPIUd5tyAm+3AkXQVou
         krWLB71MKrk5eAPctlu7HjD/zoygACK+rnV+rOElrvBZcJ6mb45IAyQ946/EwMYntueo
         z/dXFiKLG19CiTicJPieg0APq3oLwEh3sxCiJ44ugjiTedEvl/tkbxW68jEwpOD/lgSM
         tX4fmqKB651Jf9hyTZKWUGalLcRxYHptTdFxKSlg12b+nxO3FMeozDfKzwnqz75w0toa
         a0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789077816; x=1789682616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4VC0C0lSHCs8Fcark7cmj0Id1dSh7PB6GmHxMlnI8k=;
        b=U+VMKQJ0PkDBRWVjc5FTYKOD97fcHhmptS/dr9gf225jHY3bt2KUzOzltcWkxQLzkA
         DVetlkuO+buILurOs3FYhtS6FoRTSkjOBtl7jiIMuE1m14/ZdsbQ+PPdL51/j2e2OrSF
         dvk5Qix3EOBAWgONAoTs4msqkLYkln0ab9s+ho9rJ123t2Ti6ig4TX+E2k9vy72qQyf5
         UdXR7szPPxmp4LhcgYf5B86F212IqAMo3vrQy+T6hXw/lMsqe0m37DaqOqA99YnS/3iq
         38CNByNC4MV9tcrcZPwjizIDTv5hHiwPd3yCfx9qomzVm0xZJgjkzCGTkTFQSMvtbn3K
         ud5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzrUPXQLCEzqCxxcMNezZjzZZtFYJuMJI9K24f4Bc+aK1m+9VVqAlzRfUb+Jxkr51sd5pxMRtYW6J3RUT4=@vger.kernel.org
X-Gm-Message-State: AFuF++mIhUiMvRYUCW/MRBhvQi/W6DONYL5hHwGePjSsL+3iI4HAPkc3
	BEGMK/1ssFLBJ+5y3TQE9MtVFputI/Pf5kvB/ZFdlw8lVredNt05hcNj
X-Gm-Gg: AYBFou0H1yg8AD2T+eOa3BoOWi04x75ZRaa9euGndm+JrJpJJxhlMRh6ilArlM+69pw
	q/LirS6UE+mgQuGBS1UIa6yBlFSf0ITDFthnop3+jz4sPQJCmMDf75eceD3XGuJVkBXmURot0gs
	gqhfecjtRbTY8g6tdKcMWuqy60J0ZIId2Y8EbWpRcCjn3LjihBPc4P2KXRUwlH4SBOTIkH4OKNK
	r25ldskbN6xTUQn1LELpQadfgJKN0hr0qAIjqjb7k9/0MkxYKsFZm6gTYicN5NI3yFp3dna0uiA
	vhHy1NUHTbEWbQuvCYsxN485GrRmlmBpT8t/f163HX/lWrNt5kQRO3vs32rqAW+7YECkTGctuSO
	3d7VNIFKEiwaBqBCZWlIdTCQ8AfK+yvW71jY0CH1txjD+y68IOckjgKg9cWn63Cqx9ngKETzbRi
	0b25mz70SWb/kbmujHfvZ4roEZNydEKqL8TBs8X3ITnloRcpHj6UFd84RUgYNZFbGU4DdvCdTj1
	W3yL16FxgFFWww+UomEbw==
X-Received: by 2002:a05:600c:4712:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49e61643939mr10000435e9.0.1789077815736;
        Thu, 10 Sep 2026 15:03:35 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c300e2sm111238475e9.8.2026.09.10.15.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 15:03:35 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: tim.c.chen@linux.intel.com
Cc: brauner@kernel.org,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	imv4bel@gmail.com,
	jack@suse.cz,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	kees@kernel.org,
	kprateek.nayak@amd.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	qyousef@layalina.io,
	ricardo.neri-calderon@linux.intel.com,
	rostedt@goodmis.org,
	srikar@linux.ibm.com,
	sshegde@linux.ibm.com,
	vincent.guittot@linaro.org,
	vineethr@linux.ibm.com,
	viro@zeniv.linux.org.uk,
	vschneid@redhat.com,
	wanglu.priv@gmail.com,
	yi1.lai@intel.com,
	yu.c.chen@intel.com,
	zhanxusheng1024@gmail.com,
	zhanxusheng@xiaomi.com,
	ziqianlu@bytedance.com
Subject: Re: [PATCH 1/4] sched/cache: Keep nr_pref_llc_running in the runnable domain
Date: Fri, 11 Sep 2026 01:03:30 +0300
Message-ID: <20260910220331.1209469-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <f3b70dd40e29b309ff3449a95a4af4513ad0ef70.camel@linux.intel.com>
References: <f3b70dd40e29b309ff3449a95a4af4513ad0ef70.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Tim,

> So moving the accounting next to (or after) the h_nr_runnable update
> would make task_pref_llc_runnable() return false and skip the
> decrement, leaving nr_pref_llc_running too high.

What I really wanted wasn't getting the accounting next to or after the h_nr_runnable. 
If we are updating h_nr_runnable in some way that means we don't need
its check since it's already getting updated. And if it's getting updated
that means on that branch we know how our check should behave since we 
are a subset of it. We can skip the delayed check on that way since we are
trying to behave as h_nr_runnable's subset.

>        if (entity_is_task(se))
>                pref_llc_running_dec(...);      /* sched_delayed still 0 */
>        se->sched_delayed = 1;
>        ...
>        for_each_sched_entity(se)
>                cfs_rq->h_nr_runnable--;        /* sched_delayed already 1 */

For example:

In this code the h_nr_runnable is updated the same way regarding what is sched_delayed.
That means if we want to behave as a subset of it, we don't need the check delayed,
since we check the delayed to be a subset but if h_nr_runnable is decreasing/increasing
we should look into our checks.

My head hurts. Please notify if I'm wrong.

Thanks,
Kayra

