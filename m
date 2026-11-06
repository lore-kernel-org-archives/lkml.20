Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793930329;
	b=1NXwMzUZdkeMzzt+pON6GnnEZ5QJx1nKsdVD8+sQmlhJYCRgUhnLMuZv38xdY+CjdOh5
	 HH7b7ymcNenwVrJst7xXk2dQxY9eyfQEh2nSGlNr+jaFpKSGr6LlqObaThhhhhbWYu1xV
	 5o7dRyIem7+AhmjPxny51GMPTUqieTiYJvnvhWE6WdPYVW7JLpVRGymFYvTXCeOeXUSkn
	 +9eneDPUnHBRxopR5gpAdg9Lduc/86u/b4mJ5Sr0SmrkTfygnOVMEroh//gbQAz95y4rD
	 6FyZp4rLQnx2BiDzVPLsD7uMZMEaL11sWN1GOysvPOywuAyOPvB7a5RlpdPkrCuncHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793930329;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tEc54NHN6Q4prtKAURmFfz/yHe8rd//T9sptotRJK2s=;
	b=K5NNi7pF+seYEQg0C9QKA/3Bj4AoEs8FNhdK3qZzK9PpI00b104+lCFMmj89Nok7ac72
	 8ym8oQ4w8A/V8M4d6QzUg4X6PYsJR5XH67bOXKdy34uj4FseFY98LCkki9JY6TrnoiqZZ
	 azen1IXXO0dM/9sBNwYqfmy9PQdsR84nPuiQ0tScJRmHwbkDhITlypUoMoDrXfM7kEn1I
	 N/5akPmxx06PV7A2kLC00N7JVIzGW8zjOPWsliIVSmWV+zNWjREi+SRYx2u0Ra+b4e1Md
	 rh+5iARI2EEvDBq5OhKESgjbYlXRhY7SSbEz8u7v9lo2OHNEXfgu5eHM0ZqAGqvb9RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.121
Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com [115.124.28.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19391606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19391606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07530042|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.113878-0.0110082-0.875113;FP=3659837288681028731|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034020;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jxwwrUY_1793930315;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jxwwrUY_1793930315 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 09:58:37 +0800
Subject: Re: [PATCH] sched/fair: Distribute burst-woken tasks when rq depth
 reaches 3x average
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com, linux-kernel@vger.kernel.org
References: <20261104091842.266273-1-likunyu@open-hieco.net>
 <autCBv3-foLXkZss@scheduler.schedules>
 <5e26b0b2-0b87-da79-9cb5-b471c9ebf77a@open-hieco.net>
 <auypmYsIO08V3avZ@scheduler.schedules>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <94de48b0-dede-0338-ddfc-0c5076221e78@open-hieco.net>
Date: Fri, 6 Nov 2026 09:58:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <auypmYsIO08V3avZ@scheduler.schedules>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 2026/11/6 0:46, Kayra Cizmeci wrote:
>> Here, the existing logic is reused, with new_cpu used as the final return value.
> It's not used as the final return value. We return dist_cpu not new_cpu.
> Look below :-).

The latest code now calls reset_periodic_lb_interval(dist_cpu);. Yesterday's
testing indicated that this change could be further optimized and did not have a
significant impact. The implementation of reset_periodic_lb_interval() has now
been modified as follows:

+static inline void reset_periodic_lb_interval(struct rq *rq)
+{
+       unsigned long now = jiffies;
+
+       if (time_after(READ_ONCE(rq->next_balance), now))
+               WRITE_ONCE(rq->next_balance, now);
+}


>> It remains unclear whether this approach is appropriate. If it causes no
>> practical impact, it seems reasonable to keep it unchanged.
>>
>>>> +			return dist_cpu;
>>>> +		}
>>>> +	}
>>>>  
> 
> Well, if we chose dist_cpu instead of new_cpu why we are calling
> reset_periodic_lb_interval() thingie for new_cpu?
> 
> Even calling it for dist_cpu is questionable.
> 
> 
> Because:
> 
> sched_balance_domains() gets the interval value from
> get_sd_balance_interval(). get_sd_balance_interval() reads the value
> from sd->balance_interval (The value we are resetting) and multiplies it
> by busy_factor if the cpu_busy bool parameter is true.
> 
> sched_balance_domains() calls sched_balance_rq() if jiffies is bigger or equal to
> last_balance + interval.
> 
> Now as you can see, we make the interval value bigger when the CPU is
> busy. In your path, if the new_cpu is not the picked CPU calling this
> makes no sense. Because if we didn't picked it, it already means that
> it's busy or atleast worse than the other options.
> 
> sched_balance_rq() already tries to pull the tasks to the given CPU at
> first place.
> 
> 
> If we really wanna do that, atleast call it for dist_cpu (the returned CPU) not
> for the CPU that lost.
> 
> Or am I getting something wrong?


Should the assignment to sd->balance_interval from the previous version still be
kept? It has been removed in the current test version.

-- 
thanks,
kunyu
