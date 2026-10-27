Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094788;
	b=lI3tjQDUTU2qntSMRDoQ5tUIOYm6gDM95O7Fps8Kvdm+8J9yrw0xRsnNuHr3Y3yl8e4N
	 Y/8p927gVALK1mPLwRJdTBPYqIfb2A/Rj8NTbq0TB+QE5mM6Ve5aYf7uywBmP1Xyo7X2q
	 +aSzjcku6FxLE7fwNHVkKOJflh36quyPGDh0m6lbjrXxrQ5g8MJQDVJUpjo+t5Imbqd6p
	 mCEDrviMqBBPeVZ1rVHdasgjXovNWiDUS0jTcgiqMg5MtDl+D8EgI9eCzjibN9knFpRmg
	 HawsDGq31aRT39Dz1Me0xBznxA0I6vw6ZsxkIk/dTLjZLWbEkqbxb6UW/v96kXH6yYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RMpP7qOZnM8hLJVUjZYup1bTbHK/Jiw214ZFeXBp0Qo=;
	b=GDYBLTmmQ6GMd7dqcDql6dA+aqwcJdeSzPG3oB9Kno1Zx7JlOzg1XvYSAyWkiDgz6ubc
	 Iw2FDAvDpN38QKirhXGvYjAhAVp56/7g5zFaYjamG2JDVnVvEsr24Lc1hkLOqLBN3/28w
	 v0cTvKQFKemuxiR32wDyjWkkzzI2hdbwgKq8QSCGb7kQf/ebOaF81iWQMeQZUwAC8R/U8
	 j9/NFA04AwKJBzZV2oHJACvQLpxFCbo2efH5yURD1toL9yk0gvkW+cDOrZIoSY4XrLKaK
	 mt2hx8sBa+7ewlhVMsmzBTbtDeOgF1dEdrvyGTc9k0e7u44wX6fVuFe5BqShYu8oquQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hkD3uSJD;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC885606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC885606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hkD3uSJD
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48bbb06f29bso475348f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793094786; x=1793699586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RMpP7qOZnM8hLJVUjZYup1bTbHK/Jiw214ZFeXBp0Qo=;
        b=hkD3uSJDwOVIqiFWLhZRbUIq8iA1t5w5KlTG101+tgqaGonAQHTp7h/kWbM1Dbulko
         vq03s5kOxqPHr59fMfBUSLEfx2DT+IS6lbOo+Notqz7jSJjkNiNZj1072hPIyDAJuzto
         twWTLpmxI6o3enuvitFULw2zsz7CjjavRCeZx7+yGUC4G/xbciBemmGzdpe1iqsLGhna
         /P+GWTBbB/tbEIyiLLIAytS4sLwxn12G4uRSO7RLaWcMOq9QKdWmPiWSjAxvJyGXzlzK
         xokeylpfuqCBdbCIkfzNVXhooXumtfdKLAQYZWnRvyeCxcv0eSk6V2XFss3AlpmSJnQi
         FBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094786; x=1793699586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RMpP7qOZnM8hLJVUjZYup1bTbHK/Jiw214ZFeXBp0Qo=;
        b=znmpdi9OBK3tEP6jnRmCblkFrRcYFY8iYgdt4FvsrQPoqi5HwmqsfocxrsYDqXUVEU
         mii0VtowtbzPMalYZcSIvanTmGte3nw1K6o1tTaCgNbI+vMu/r7xYw5OLuwhlFyI3Vrl
         eFGEZnWUWeszricw2AcXGPqIkclmvYjBvHATl+2VKkPkYkd2qTnbK14E9cb6YikJ5n66
         bqybZX4DT0yeE7ZLSV67y0hM0Dih0MygS544SOAidKi01oLTTk7DvMcxtNIm1qHnbvcV
         47oAO/a12Nd14yMzKVb1oAOfrqzBL742ru8Mv8Yz636xqy0SxKb5t+mYBUfDnXgDhHXQ
         +dHA==
X-Forwarded-Encrypted: i=1; AKwUvBzlMLJUPC7cI97SMX4w9hbLCV0qpljcWlRrulvuBn5KsJzSUxAKURAltEvJgsCprg40B2a94MbLPl/O7jQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKj3j9FeFXiN+I6mhTTtsOAtN4ANET44Vb5IVdt9cRj5NMF3Egn
	9BnKbfbFpr82VVCeCBgGGrdw6cpP0br6XnpVh/WiEATDxY3aJp25EkIK
X-Gm-Gg: AYBFou0qCbBsSOf91URaGexeCsw4XHl8iLjAPCs/fvcVNvTuB4ZXLelRxY5S28Rp8uw
	RL9Xdz6oDmmFx14Ec11oZc2arWcy17pGhWDlaYGBX8n3RR1Jjcq1IjolrX2BLNEbMqN1LkDL1j5
	Itt+v9QoIKRUdhzddQ3794HInpeCHcaAWcsvthKQNTXou4L2UA1BlTIPdkqYEMmtS+PxR+fdzAW
	8VtL9TNwHJ7KObj8sLmWh0U65IaRMJKR0MPGXsjShb2XiqBos6zqu5h5RlBXSTZAtLN+LU8+odV
	TeLNWPgkeWuZEqt2BJtI3w7SnKEHIh/NNQ9IzqvGZCwqO0nusu3C2sdJD6GiBuHfHSeYJnnoAWo
	OCdfR6154DilvbqlKqpYdL5NGZmf7Gua2+YP3Oo5nxzLCOW+EGuCj1eZ3EvrQ2Z8PAhB9zTME+t
	q1zWkyzuohOQFh9SNBa7RymggNU0DgHVdv0d/d9tF12NfbMZ8r6WbB0YNrRMXzCgVdDD8QvujYX
	x/iDJBkn0tZgyWrb1+MDrO/nQ7alkFGB+RHzM/6Z8R2BaPWfIgX2Sa/D6ZCn69QIUMnLLrX3coF
	1ueYNlg=
X-Received: by 2002:a05:6000:2610:b0:48e:412:3825 with SMTP id ffacd0b85a97d-48e3eb4cffcmr16853677f8f.2.1793094785957;
        Tue, 27 Oct 2026 02:53:05 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dd7sm21521407f8f.15.2026.10.27.02.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:53:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:53:02 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: albin_yang@163.com, albinwyang@tencent.com, bsegall@google.com, 
	chen.yu@linux.dev, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com, peterz@infradead.org, 
	rostedt@goodmis.org, vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated
 blocked donors
Message-ID: <auBzeRvGD4irNz5a@scheduler.schedules>
References: <72a6eb77-0461-477b-a0e9-c06a486e3e0e@amd.com>
 <20261026133831.4111227-1-albin_yang@163.com>
 <36f12b2f-9fc8-46e9-8312-536c918722f1@amd.com>
 <auA7AQ_S9iwPHr4d@scheduler.schedules>
 <4ac4564e-08fb-4639-a89e-a2ad54cee3f7@amd.com>
 <auBEeDRRFKZOGlZA@scheduler.schedules>
 <f23a6e77-58ef-46bc-b8bf-d9f043bcfa57@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f23a6e77-58ef-46bc-b8bf-d9f043bcfa57@amd.com>

On Tue, Oct 27, 2026 at 03:15:40PM +0530, K Prateek Nayak wrote:
> On 10/27/2026 12:22 PM, Kayra Cizmeci wrote:
> > I think this fixes the issue. BTW I think this should skip curr, no?
> > On a case like this:
> > 
> > C holds M1 in CPU0, D waits that mutex in CPU1. A holds mutex M2 in
> > CPU2. B is the working task on CPU1 but it wants mutex M2 and we enter
> > __schedule(). B gets is_blocked. D gets chosen. We open the rq lock to
> > get D to CPU0. While this happens A drops the mutex and wakes up B.
> > we enter ttwu_runnable() and B is still curr. And we start the timer.
> 
> Good catch that!
> 
> > Or am I MISSSING something?
> 
> I can't believe something like wait time accounting can get this
> complicated! Anyhow, We can perhaps call sched_info_enqueue() in

TBH, me neither :-).

> ttwu_runnable() instead of proxy_needs_return() like:

I was thinking about that too! LGTM. FWIW, this depends
on is_blocked check in sched_info_enqueue().

Wei, what do you think? Will this work for you?

> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 04b62c16fa8c..d5758b78b741 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3956,6 +3956,8 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
>  		 * it should preempt the task that is current now.
>  		 */
>  		wakeup_preempt(rq, p, wake_flags | WF_TTWU_RQ);
> +		/* Start accounting wait time. */
> +		sched_info_enqueue(rq, p);
>  	}
>  	ttwu_do_wakeup(p);
>  	return 1;
> ---
> 
> -- 
> Thanks and Regards,
> Prateek
> 

Thanks!

Kayra
