Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689680;
	b=Z+MtR9EDP6sppGkqrCnzEpgu/ytdAR+iBg4K5Hw29ou5NfIf6MA7WwwmMLRCmP+qRGbY
	 1XYABBWcqyj8rmBvNmMmocHTbHV6QT3Pj1nuqqlJ96U9TrC7w+YjMiv72875IhJSwuEq+
	 rl62+iIUQCkt6HDquSUGJDYHArXjZFkmV0OZSRIWc1jjwRYmD/2RCuuUtBy77ZJS4VzgN
	 AZuk2/IKgrIhKiXgWu3efjf6vKw62JVqZ6jZyAZ1pKqB+/FFA3rNQa1CTfAprK/WbQqMw
	 BkKmEsZzYJV33OO6/bpQ8WsP975biHjkCi239NUejhz4XEjai+E3x74+btF5rjl+9yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689680;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AYkF4SdOGoqUcvfJhNNNczBVqdFPZxRd+YMOIYTKY+Y=;
	b=YnncYyc9FWy87IfrXIxfzMR+FTkayl266zK0XTYja5YClepLJdhzc749qPB/+fZYqd1E
	 SgRMu/PDkZiNjOKRuS62tPzI/lUDNJVTlFgcYBlE5zyAjRFh0uHqTB4RYJo6EGZbUgHU1
	 ovy6OYXOU00kuuB4YUV5ZTSpqE0QRXLDWl0OqJeCDAF16URsE8rbewkaga1hnl+Wky5GR
	 GJsvi9HcqItCoqt9XPp+uUgweqgD70R8mYlZ3j1hUSozt9sIurjBmzRoOCydzf/SmMe0j
	 fIwqjGZjcfmSX2CV2sqeFFcXb+HTF+DUNZ5Fu5grt9xkIoN+2qW1TTb53UgMsGKFilA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=icetMTAo;
	arc=none smtp.remote-ip=115.124.30.97
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF63606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BF63606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=icetMTAo
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793689670; h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
	bh=AYkF4SdOGoqUcvfJhNNNczBVqdFPZxRd+YMOIYTKY+Y=;
	b=icetMTAoGh//a6+W3ysn+d7bhgPPmUijvdSU84mXg/8Y6lyJzM9oeQ3gXl9avi6U8Mi9wQBp7Q4kiGVfBD4D5mgcw3gWb6xCKkj8w1+pwdHnqrnJQtgAtfAcQxffBFE3UJ3fpc3oJphWhDqm6KYy2TgERrMsJcJAfO+JOW6q5Rc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=dtcccc@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE1pYxA_1793689662;
Received: from 30.74.145.222(mailfrom:dtcccc@linux.alibaba.com fp:SMTPD_---0XE1pYxA_1793689662 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 15:07:49 +0800
Message-ID: <37fb82ff-ed5d-41d7-91b7-afe4379a636c@linux.alibaba.com>
Date: Tue, 3 Nov 2026 15:07:41 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Tianchen Ding <dtcccc@linux.alibaba.com>
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
To: Chengfeng Lin <lin2530632123@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Mike Galbraith <efault@gmx.de>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 linux-kernel@vger.kernel.org
References: <CANGjgd=yr4Zy+SMUsDnBSw05hhn9086NVc9g9SaG0y804=WWrg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANGjgd=yr4Zy+SMUsDnBSw05hhn9086NVc9g9SaG0y804=WWrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chengfeng,


We also observed a regression in a pipe-based context-switch benchmark and 
bisected it to commit 333238da9a19 ("sched: Update time before requeueing 
delayed entities").

Our working explanation is that updating curr before calculating the delayed 
wakee's lag advances the runqueue's average virtual runtime. With DELAY_ZERO 
enabled, the wakee's positive lag is clipped to zero, triggering repositioning. 
With only curr and the wakee in the same cfs_rq, this can align the wakee's 
vruntime with curr's, making both tasks eligible.

Curr can then retain the CPU through slice protection. With equal weights and 
slices, the wakee's newly assigned deadline can also be later than curr's 
remaining deadline.

Before this commit, the wakee would commonly preempt curr after being woken by 
curr's pipe write, while curr remained runnable. After the commit, curr 
typically continues until its subsequent read finds the reply pipe empty, then 
blocks and voluntarily switches out. We believe this change is the main cause of 
the benchmark performance regression.

We observed a throughput recovery after disabling DELAY_ZERO. It would be useful 
to try this with your benchmark as well.

With 333238da9a19 retained, lag compensation on delayed requeue uses up-to-date 
runtime accounting. Should we consider making DELAY_ZERO default-off?

Thanks.

