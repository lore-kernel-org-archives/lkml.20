Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633543A0B2E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789019983; cv=none; b=NFIEc0veQ/lMuFqn1W2v07q0+7DZISPfjfD4RQhCqRfv75h9lNsp0cLZsLGqV8XYr4jBHEVbNr4u6SR63+SkGvDSdylj3BZdZxwTxUGz9dGiCrk/Q+v3uo5LuQUbNaz1jJXL6NnNZSi8rTghXqL9uKaUhlxnMfTBDQWzQgIOfDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789019983; c=relaxed/simple;
	bh=CwqMyDPCwzxdPk0to23ffo036qVAuQlcicsV8p2TEeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqT/SO2JmFpca44shVKGaEBLR+cvRkdAoJu+dATfQMQYwhZsj4T8DINok2tzOnGfESmkMnsSB2TE7e0w7gLTIfWnMUrkDWlxU4q899d2LmUXd7GDsjRUxP1TA+qzLfY7GJveRJLGtUuqtEdexePL033z6SUw4bZQ5vUvkYXwWpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iT7t/OC2; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iT7t/OC2"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843af75de5so690481f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 22:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789019980; x=1789624780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1mq4aq+cRmD0/CWKGet8JsyPznKpV6dUJq61jcRihM=;
        b=iT7t/OC2x0k1yyeTkGwAHJa1hgXIea2uzDgTWTW6n79uLxxAH9VQMdvEjCCcj//VT9
         3EET9OYKQsk0SGLdfuLNovONjik/F2DkanbAbSMGEHXHm1g6HrA2aXRWX4ORn8o2nCEU
         gfZqzEi81tW7hwcHF31MG35wNoPdPIrxscKOLBDgHg96H5FkePB7sQa7qsY+v9yYzHV/
         f1gyyUvXDn6KrEsvFXQhGBmWONt1x4JnYZBU4Vn+Jj2KBxSTPDkdk5vXb5Q9KWhFzKFC
         E/yqFw3JkITcT1hKQUexFLbLmzsG8P5tXXXkIwV2Skm1WPUZ16nvbPOXAO8+RtMOrgw2
         zufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789019980; x=1789624780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1mq4aq+cRmD0/CWKGet8JsyPznKpV6dUJq61jcRihM=;
        b=nHWs30VgGgDjHcmt9AzRPIzPAXa+5Gxc008mzqe3AfMT1dzg8LocSAf+CwsI2XcIt1
         6JNEuuzD4o9SXNpyJgIMZ0/7YL5vrH00pRZPU+bA8VofRic/T9AWRoeBWej6OKnNlmC3
         peCwH2MpyevZCw2hZzL2sg5hHTpuGUjj9YDXcXmC9RzlRU2a4lHif9ob4mSmAZKt+Z9r
         oZrH5lIjumAVkJIoC88YVbPBPB+rkquxtURHaBA57MRFmfIgmjo84vGofC7a+EtQKmm7
         DHYHFAjGmsRNtqY6RtUBLeLJUYIAo34RZ1oduTFrFt+jOcIf8cZFDpkDAZQbGV3Y7aR1
         BR/A==
X-Forwarded-Encrypted: i=1; AKwUvBzQfjXl+jT+nRQ0uLcBqxMud5XVvitXTUFtg6XVAdBhd5+acx4LRmVBsicEIAJq2+FDArzHzq0IhTUFaQA=@vger.kernel.org
X-Gm-Message-State: AFuF++mi8wwhpBIokTA+BI/TWLlHeNCfNwtrrYkxse+I7YBEEubtegYJ
	oI1ya997gNg7JGqWzKXG52gz+LhjE7b3+hQTl04BQIxsf8UuecWBHS68
X-Gm-Gg: AYBFou1AgDQs2JltuKrQvh7/MJ6dPp4mtAAhPdwtQZMMcMmULWbDJgIiSe70fAPbQdj
	d8YNyHTic8utkjpiEMfDdsmKih1yDZTl1oZksKNuRqHjq8Nbwmz01EHgNE97EJLTfkeq16n6zE0
	YEPE8t1Du/JdSEP1JPhiWE+Xfsd7rGWz2q4ybBmqIqrNd8V/LTjp+vJ15Kyfuyb1OSCpdz3FOip
	VXu33RFvV1eV3ln2n51C0UPbDP14zyvmjUSzkETQTFbEX8X6q6hWsZsY653eX+RQ39IqupYhb9p
	nxK+jhhGcxX+5Kc8yMlBsJ/cgYPtLohA+mSNXsGRlWT6tkLEBDHo2YSTO+qaSBadImOnvYSYL2s
	epFNAKbpxo2mMragDlEvGvmNoseJiSCEbUy8X82a0KmMqRv9+mJ8g5/xOHnAoSaFIT7gTybouX0
	Nh4VI8XhK0ffiGvzu/gS5iK6U+x11ZuelrxYzmVKXrg9ft2Yt50D6GeHnk0FSNREYLkpwQ9vc2X
	9Jnw1RARh0QnOJd4/88Hw==
X-Received: by 2002:a05:600c:8b2e:b0:49c:cbf4:572b with SMTP id 5b1f17b1804b1-49d01dcc1fdmr272848455e9.2.1789019980321;
        Wed, 09 Sep 2026 22:59:40 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm119264015e9.3.2026.09.09.22.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 22:59:39 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/eevdf: fix rb augmented with multi fields
Date: Thu, 10 Sep 2026 08:59:37 +0300
Message-ID: <20260910055937.1205721-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909215850.GP776954@noisy.programming.kicks-ass.net>
References: <20260909215850.GP776954@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> The bool exit on min_vruntime_update() parameter appears to be unused
>> when I grep or search for any use case. Could we remove it?

> grep for RBCOMPUTE, you'll find it used in RBNAME ## _propagate().

I knew that it is used there. But it's not really used in min_vruntime_update().

Reading some code, the parameter is here because there are 2 different functions for RBCOMPUTE
and one of them uses the parameter while the other not uses it. 

So it's better if we remove it, but there is no clean way that I can see using to remove it.

