Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62650EC0C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797694; cv=none; b=s6Bb/OoYoR5khYhLTNKzTjl4Ue+nR8wLRiiUewQRGpbaYX311EnIA0UuH0Kpq3bjez2cay/82WBt1tEcOAvwZE+W/KnxWHb3RLR+JaJf/chBAen0XMQO5eRtBuct08eBSOfD471uNXAKgaiUA4MPrtyzpsO3C+9XRL0p73Ht8Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797694; c=relaxed/simple;
	bh=pRAALjD4TH8fUKXhy3WAVF2EJZFrERevmrWFZD7sesA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qCLuNLZuilgdhkxEG3+rArfM4pqLrVk2WDSk5ek+O8o4pWxk4yXzvjP3tDpCZGFuiB/goSMTPMQZeXhzOOPDNFtsY5UMGFwaHa+1R27sDjLYmWSX46YlanHiIaSXlCMV4ztT/BCypNMtyRo15YdfBLQG/GjSSUsWqHI81oLZ7+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUoJSEcR; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUoJSEcR"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843971bdd0so386300f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788797691; x=1789402491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fX2W7WEaFgzQ+G9ZWHq9TsKAeN2X1/3oz4Q8aMxWcYA=;
        b=TUoJSEcRuFIugHI/2ndo0IwUQjVvozn2YhM9i4BvtbtLptDTKzbyQefA8fJNqfo5KR
         iNagCF8X7jjhFfalGt1WL4ttp1GXAv/T2tM+qCTR7AkeAuBl/MsOfzFuCD1/DPamcIYu
         M31Hohcmp+Aa/8csb4muo79dNfQGCQRQqzqsbnlgb1Eal5/0zZM4AZyQ9DGqCwpTjRYT
         iQQ7cDipHgvoOW5UFn51a0bHndvVUOaZa71jp8+lFiWr5P6kODWBs3lU+NqLjfjIz55S
         TbgWjS1glhHeTNOvSmDmI865O17XzzAo6131RMgW/C7JCnkgISJG8e39V5fY8k2URXkD
         fcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788797691; x=1789402491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fX2W7WEaFgzQ+G9ZWHq9TsKAeN2X1/3oz4Q8aMxWcYA=;
        b=WuNckxBu1oFu9GdvMm89AippaMfjIYQvYlxGBnpHTfqQsHWlCPYK58jipT+8HoVUZE
         oKyRG3TN8KC0/xln4skdd4rCQIKfl7FYbtJeusEH46V/WTsYr+FgDCi/WGdf+upBRh8k
         8uqUnEqv3UT7gr7ZETeH3Uz9FHPuNk84XZ3oUCEXnNE5h3dtaQH3BLzGUm+Yn5rkKdVF
         OxRsi0ueZInOwbz9mOTx4LDBZj8mWPH9EOBQWTsKBeTPFiLERXvbiWMtFpzjDyuxhMnj
         +yc6fSispM7EfBuoAVBnd+9efWZTrbT4AUwwsQAdfE395Sz3J6rLCyYCLUhFhqFAYyLb
         dOeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxm54WkdwFmMdRJScRryCP7PWKwxFUeu28yjeB5LfdpxbkBlj7uNfOrIixdLCc/fCYtKGz+fxltnz/q2g=@vger.kernel.org
X-Gm-Message-State: AFuF++nmjItZhP/ZkS7v+XvGM17RXOnKQMMWBHYnZIQIl/KGGBFvQzKg
	9C5ljDUlKON8zZhK7njv6pSYrnbIK+fNLMrPFow2zG3oga6J8ZIHj4wo
X-Gm-Gg: AYBFou2R/CHVFczdZVeidc6jqV+TpwXDNfgU9fLSpJ6nIOElAUmGviebdD24GmZMD2b
	rJIC2Gfkl/dKlMK8uPGMx5m9dhDKqmjY4uWt4wlmEQNjt0DPxY1KheZ5rXpTesU+dx2HOVb6Je+
	eM74hkc4WOK7nSsiUQjVATcdJmIkxBPdLb0WbFqzNNNBld1iBhDrg1WEi0cVkztjNIM0tzW22r2
	hB//AGKCWBntahBixz+FLqeL8dVQFJRblqk0iGmkyOzBwIuiYKfEw9gViE8poGyvFr9ua3hCCKv
	zrhqTu3RrRmYP03awBtrZBk1pwaxTBMUqu38SVkeRF4i3TRwLYT0RoPXzAe9uQT+EC2UYLpKO2O
	cwu5cRcSlvS1d0/Ng6WjzWvGvasdoSp1/2go+7T2ne37Akea2okB6pwxmPbuhUnLp5j3t9nuMQO
	xGFv27Vq7FvPAPoxwwA/qDj5gYC6uWKho8bC3gwkvJ1pbcy8leWPDHW5lJ1UOTzG2zNVbFQK5+4
	fh7FKrSLJY=
X-Received: by 2002:a05:600c:4f48:b0:49d:798:67a4 with SMTP id 5b1f17b1804b1-49d079867f5mr134404175e9.0.1788797691569;
        Mon, 07 Sep 2026 09:14:51 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5563c6csm347750865e9.4.2026.09.07.09.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:14:51 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: kayracizmeci@gmail.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v2 1/2] sched/fair: reuse the ENQUEUE_DELAYED calculation in enqueue_task_fair()
Date: Mon,  7 Sep 2026 19:14:48 +0300
Message-ID: <20260907161448.1152895-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907160522.1152423-1-kayracizmeci@gmail.com>
References: <20260907160522.1152423-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Prateek,

>> @@ -7996,12 +7996,12 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>>  	 * Let's add the task's estimated utilization to the cfs_rq's
>>  	 * estimated utilization, before we update schedutil.
>>  	 */
>> -	if (!p->se.sched_delayed || (flags & ENQUEUE_DELAYED))
>> +	if (!p->se.sched_delayed || delayed)

> nit. This reads funny now - not delayed or delayed?

> Maybe wakeup_delayed but all of this should be optimized by compiler
> at the end and a big ENQUEUE_DELAYED is better for humans who are
> reading the code no?

In my first message I was thinking that renaming and using it in both places would be 
the better approach. But I thought about this the meantime and I changed my mind.
flags & ENQUEUE_DELAYED reads better and more clear than a bool. And I can't really
see a big advantage of renaming it over this version.

Patch subject is a bit confusing since it says reuse the bla bla
calculation in the enqueue_task_fair(). And this subject
makes it seem like there is a performance claim.

I knew It was getting optimized by the compiler, I thought at the time that
gathering this flags & ENQUEUE_DELAYED in one place would be better.

I'm dropping this patch (1/2) but I'll continue with 2/2 :->.

NOTE: I send the wrong file that was with the same
name with my correct file that I supposed to send. Sorry for this autogroup.h
ping thing. Ah..

Thanks, 
Kayra
