Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE18343F8AC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496408; cv=none; b=CEIev3KKbH8O5oQmWtffS9vMzH4iIxb68tfFhKxNh44BaZ/KpIiJnyIm57STP2jjxVZkfeqoeaCT3RgCLIdsMTZ8IF/xOhTAQamIvuYB0sgyUeHgqUDxFIXrpXtog1ifRg+y8nwyzV6jdR6JjhEBin7Wfcxn2PnoUpUB6q0rvDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496408; c=relaxed/simple;
	bh=hJ+lJ4a5Pk65jOblaW+yIROjEZLfIVMIfsKfvzrFVxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhPMfgxo6tAh8PL9ircBPDfqQw/7xjD4Lst4BmL5i/bpffI2s1mm7nehTZumOVzwsiQL+sPQbwCNPxqmLnotKlfEdqMMN+FyOOBB1fP904V0Ey0kEGgccGY+ZaJ/Tl+SeKu9IDurpmnYpVtRa21NyWInRMqEB3/ScTzKT5JfcLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4F918J5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4F918J5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cfbdac7a1so81475e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789496404; x=1790101204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/Ag4fL+aG7J8cjybeZI8wOuE3igVH0Ar05BUJWG3UQ=;
        b=Q4F918J5TW2zueIH5eBHk8aVnqJYYhclk6lFlFaBaJLjAN+qiElus3FybinVomEky7
         Q0tr7dKpk5NbvUT7rrmWddPR1faO7mZigRHqtIvreW9GeiikkBwp/nVDNx4AjaIjI9DI
         /enAyOAYRA2G1XsNHeXSxbTfD6FrR5kZE8kKeQseAqSX5JPsv1KOuf3SCDb1PgyJsHjy
         qBrgzLayMfcdSeNf6kvqcVDynNJ8u/0Zku9T+nk/gARu0VsIC4BB1SS3Cw6vL1w4Wtz7
         xbdlBKUTz+qucAVktF8MsvPeKvmBbRBWX863mWh0XiqqxtZpKchclmn4XwM/B7/2ohzs
         FpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789496404; x=1790101204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1/Ag4fL+aG7J8cjybeZI8wOuE3igVH0Ar05BUJWG3UQ=;
        b=XJ8q5hrNuzNUPMwslWo4O89kgtTFt1mYAzvSYDZfZsxqzz4OXffbuyQqn6lQguFip2
         VvY7+JTFTp4WAQ9jrCQEZ45+ABJmGZ5vofLWNFDOR601N/c11MR6HYqmwjTwaw8SGAjv
         eL8frOOgvEBBIV7Iz3lx7ytiLtbUZOksq8/+asvJtDOkgn0PDB3oVA2Yx8C7jI5XXAsa
         7Hv5AkKbu3Mi6JSQ/a8LfKoGCZxq/t7VCgMJ/v27Wb2ZGcJTvMl73LXWIgf6XGFRWrnq
         iYXwWPz0sW4dhsJJ3DxPtPXKJae8JaGVPxNOXWkOXgBMEs/sbVuzhSrUA8PUFH3Ke/Hw
         Imdw==
X-Forwarded-Encrypted: i=1; AKwUvBySA8c7RaUDrHuq8/3P0OF21AJZMegz/5h+kAVnjnknQVrN/qwzwcg/tsfneUB/jtNdMUFE+BZ/kUcLf2s=@vger.kernel.org
X-Gm-Message-State: AFuF++lLDrYL1Yiz7cyzvWptZWG7y/zn+ajbZL3MGCdJmeFGCoQaJSiR
	kNake1NvZItHqIEhNGYEPM611gFjluTLASWMT2ahBUS2q2e07GMDgtgM
X-Gm-Gg: AYBFou3m/XzBvW6dM4Mb9nF87O37Vai8d/34p6Vu0mGePxqf1tD0kf9Lg38r4DV+G7a
	6l7HZ0gzg4m7k+QtzF1YHoIMw8HiYczl08Gf5XKnZ390Mdp+0YJdydmRe3hhGLiD20Qg0pj7Ytx
	dg6/X2bABcuiCHBH0ABvgdkZseciHhuviguV/0lgjeFy13x5laqjC0OZnf2VDjlXYuPNTKjli+S
	mros+WS69CxubosTM4xckIBKNejNCpbrQ4BVehfSqLgD4VkI4JsCFcLblvS5a5lbdmonTlo4rxX
	NV6Sg3mYko7gWYRwxaxPumVCUZY2tq9LGfDxBnBZIy/atbOHld0PbsA/2YWLCveEc+0VYTnNkpk
	dlTh6wc/7YSwbF9Djs0D2OiCdH2MXtfG3JtEMCJLRjjKLybWWmOhMCmTv1K3ufDXAOvpFR0hFo8
	p8zNDh9Gq6/2u19PKfJ4hz2uPVokTPSHybB/wT3GLHBzUjn71+/K3/RsxL+uCyv3MjjJIAnxZnW
	MyFQMuICbD31Bn5TY8i6ytBMvke+rgP
X-Received: by 2002:a05:600c:3ba4:b0:49e:6806:5712 with SMTP id 5b1f17b1804b1-49e7a66d0f5mr118537725e9.2.1789496404252;
        Tue, 15 Sep 2026 11:20:04 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83f43ed9sm5981075e9.0.2026.09.15.11.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:20:02 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: jackzxcui1989@163.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [RFC PATCH RESEND 05/10] sched/fair: Introduce select_task_rq_fair_thin() to select rq when LB_PROMOTE
Date: Tue, 15 Sep 2026 21:19:59 +0300
Message-ID: <20260915181959.19936-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910145658.2003786-1-jackzxcui1989@163.com>
References: <20260910145658.2003786-1-jackzxcui1989@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Xin,

> > > Testing has shown that in our system with 18 CPUs running at 2.1GHz, where
> > > the first three sd_llc domains each contains 4 CPUs and the last sd_llc
> > > contains 2 CPUs, under same fillback scenario, select_task_rq_fair_thin()
> > > executes 25% faster than the original select_task_rq_fair(). It saves 22ms
> > > over a 10-second period, with this optimization accounting for 0.174% of
> > > total system time. Additionally, we measured the execution time of
> > > update_idle_cpu_scan, which took 0.5ms over the same 10-second period. If
> > > we use select_task_rq_fair_thin() instead, this time can be eliminated,
> > > accounting for 0.04% of total system time. Therefore, the overall
> > > optimization contributes to a reduction of 0.214% of total system time.
> > 
> > Okay. Can you specify which tests you ran or what you used? If you can?

> I used a relatively crude and straightforward method, which involves
> subtracting the time at the beginning and end of the select_task_rq_fair()
> function and then accumulating the per-CPU time. I retrieve this accumulated
> value a kernel module (ko). The detailed script is as follows:

> Below is the test script for comparing the effect of select_task_rq_fair()
> with and without the patch:

> #!/bin/bash

> insmod testselecttask. patch=0 on=1
> sleep 10
> insmod testselecttask.ko patch=0 on=0
> cat testselecttask_patch_0.txt

> sleep 1
> insmod testselecttask.ko patch=1 on=1sleep 10
> insmod testselecttask.ko patch=1 on=0
> cat testselecttask_patch_1.txt

> Test results:

> root@hobot:/map/zhaoxin# ./smalltest.sh
> ins: ERROR: could not insert module testselecttask.ko: Invalid parameters
> insmod: ERROR: could not insert module testselecttask.ko: Invalid parameters
> zhaoxin: enable[0] count[179226] timens[09325] avg[460]
> insmod: ERROR: could not insert module testselecttask.ko: Invalid parameters
> insmod: ERROR: could not insert module testselecttask.ko: Invalid parameters
> zhaoxin: enable[1 count[180836] timens[59444800] avg[328]

> From the test results, combined with the following information:

> Currently, the machine's overall sys time is about 7%, multiplied by 18
> cores, which results approximately 126% for a multi-core CPU. The test
> duration is 10 seconds, and within that time, 22 ms is saved, which
> translates to 2.2 ms per second, equating to 0.0022 for multi, or 0.22%.
> The time taken by this function is generally linked to the total sys time,
> and the optimized portion accounts for about 0.174% of the total sys time.

> Below are the test results for the execution time ofupdate_idle_cpu_scan`:

> root@hobot:/map/zhaoxin# ./smalltest.sh
> insmod: ERROR: could not insert module testselecttask.ko: Invalid parameters
> insmod: ERROR: could not insert moduleselecttask.ko: Invalid parameters
> zhaoxin: enable[0] count[179226] timens[82509325] avg[460]
> insmod: ERROR: could not insert module testselecttask.ko: Invalid parameters
> mod: ERROR: could not insert module testselecttask.ko: Invalid parameters
> zhaoxin: enable[1] count[180836] timens[59444800] avg[328]

> From the test results, combined with following information:

> Currently, the machine's overall sys time is about 7%, multiplied by 18
> cores, which results in approximately 126% for a multi-core CPU. The test
> duration is 10 seconds, and within that time, 22 is saved, which translates
> to 2.2 ms per second, equating to 0.0022 for multi-core, or 0.22%. The time
> taken by this function is generally linked to the total sys time, and the
> optimized accounts for about 0.174% of the total sys time.

Are you trying to measure the time that it takes to take to reach end of the function?

I'm really not understanding anything from here. There are multiple errors. 
Can you give more details?

It would be better if you could use ftrace or something like that instead a custom test.



