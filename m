Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308DF3290B7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789363631; cv=none; b=bn76IKgFl8HvP54LybxrSQrrwXRXKk5GQc8gG4/kHJ6jucEYZ0V5Mebrfhvitg8sXkqniSfq+FeSzvzUiffTAJ9veIjAF9SfRwyd0i4xP9Y4rYiC9QmWYTz5BuU6PBnIH6omOgyzQ8cJtqTzGnIAdgf8N4YSWbbzfRGyZK1hHNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789363631; c=relaxed/simple;
	bh=YitKT8NP3nt0xjtJE+R4bpvBJyUs3Ti4kqIW8XqdbGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IMAQ6z9SIbeRKfZgQFE4+MSQE/Q/0ZhkfudCUWUmx2J6Gf6BiSIn/6l83qNGi4nNeM3ENg+nG/xv25SnWiASkRdgbI/A1ow03bMJNrw1+ELs1MZcG/cZBEukKK+Lg/WeuACn/QEVmOYJ7yZrO8ocTvPO/GsA9xB61SfY5YOaROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPXCUIKc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPXCUIKc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ddd5d0aso999115e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789363628; x=1789968428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Umg8VB2TWg/lUSpYqirY9VWZKZMZDhbUhj2GeduhS4g=;
        b=BPXCUIKc684uI7TNhCxaXlPrR5qWrO2JmROxRB7UTriaXDYibMarRxGtGG/ZhezjaB
         4vPhEa9VLKNcmN6MCVTcDAFCiXllWE3Ct3XLlc5W5kR2JiadffstzYwL18pFzACtWyyb
         657GE5l5X4ZODWymOqxr8F3ytmGYyRsHCiPX1ro6z0Xnqf+dRPGM7sp5jkyNwLbICwaj
         4f8GY15LTMU0ozQMmiMR4g5GZ6M0iMATzgQanVcd56LG8CbF237itJfzc0Dx+bHuFpBY
         jDlMVWpG/BANIA823x7+S/1wvwiE1hyDUN6J9dc8xwLTtHsFrxxzzWnFO3PBQexWLePE
         0ClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789363628; x=1789968428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Umg8VB2TWg/lUSpYqirY9VWZKZMZDhbUhj2GeduhS4g=;
        b=ifaiZBA/01jqEbI2mAsJKuMvqZKoX/oRIHwE2FCBeNh24IWMd4zrOM+z6sFM3ukBul
         om4YZuk+HGMNbG+H75BOyoolBeliStOqqbP/iiXYP3ihStKbMZOLukKk8ngR+2wb9CjF
         wPQcKBUCCa5gBXgmTnAJmEKGFcYjjf3P7FK+XgCQJw69zQTMMZUzzvL9343G6hIQcuYP
         jWO3ac5EyUo/TMehnfo2vKW8H1EBDVkM0yG6ef/ap88S1KCGRyFrAxGsX2m+78d0BKsd
         yOtTiKQgPcSuoCAJlgrpwX9kSpByJw/OHRq1OKFYNuI3xjHC0TdOWudmVZjTyFtFQunX
         4/hA==
X-Forwarded-Encrypted: i=1; AKwUvBxkWgljH7eXIpcOmN2xvMFxkKKtBJ/g7jV2gTLQ9C996DQEvNtBElBGuFo3MmyL3hb4t/MihXNtAvoq6Ts=@vger.kernel.org
X-Gm-Message-State: AFuF++k0RB1s9FmAJqJagHC/2rzF+AT3Cm/N9Cvt2XKLD0jmzwFKIZif
	SySoo8txCdr6NNFJdH2Sk/PsGvlMNr23ATJ482TH35oe0x7tit/561Hh
X-Gm-Gg: AYBFou2s27aDz3pLRjO2snsVM0X6V5tIDUgmGLN4Q8kba/b154qV+yjmErLxEWyw8br
	VMRGuWkh3bB377ZsDOVYPJPk/zihg+lZgIYVDxnsV+zuOkrOYCeCkcgVjO9tNjJq2aPhMks2IEu
	0BUUyZAg06fLSdJ9fQgQ2VX1bAXQR1LwOQCHabLzmO1RB6uzaq/NC3636eA6mqNhkKHS5e6kZPf
	n3uRS/UA0BzKvzYWpF0fwQXgofOQAe3wT4vhdKZE+8Tka5gYf+QZc3rtztpqX41mEByxYLdhPPw
	xl0Cmwr6kH39zfiodGhn9VmwE2bMNG6BM2S8IpLP7YoM8SbLnHGrlhH8r5aw5lpDYu1sWxWSq9A
	QK6HKnMXM7XqXBMoOkmWC4xoQYGumcZ2E7TOrKSQAGWzINQOFlH49MGonEGjBcKUgvyhL+EJxWa
	V9Z8tul98cRXRfOlK82uHC2BtnWNvZiEp/24iFPE17/MfpGvl4baze8YKwhelcKLlM7Xg0kAWcW
	n1cOcE+df8FikrWRMtlYg==
X-Received: by 2002:a05:600c:3ba4:b0:49e:6806:5712 with SMTP id 5b1f17b1804b1-49e7a66d0f5mr10933235e9.2.1789363628103;
        Sun, 13 Sep 2026 22:27:08 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm432396845e9.14.2026.09.13.22.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 22:27:07 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: yu.c.chen@intel.com
Cc: brauner@kernel.org,
	bsegall@google.com,
	chen.yu@linux.dev,
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
	tim.c.chen@linux.intel.com,
	vincent.guittot@linaro.org,
	vineethr@linux.ibm.com,
	viro@zeniv.linux.org.uk,
	vschneid@redhat.com,
	wanglu.priv@gmail.com,
	yi1.lai@intel.com,
	zhanxusheng1024@gmail.com,
	zhanxusheng@xiaomi.com,
	ziqianlu@bytedance.com
Subject: Re: [PATCH 1/4] sched/cache: Keep nr_pref_llc_running in the runnable domain
Date: Mon, 14 Sep 2026 08:27:03 +0300
Message-ID: <20260914052703.1286495-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aqdVpO66OfmHvvqB@chenyu-dev>
References: <aqdVpO66OfmHvvqB@chenyu-dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Chen,

> Hi Kayra,

> I had a try according to your suggestion. It seems that the code becomes more complex
> and brings more headache :-( due to several corner cases. The current version is a simpler
> version with less code IMO. But I agree it looks a little hard to catch up with, so I added
> some comments around account_llc_dequeue() and adjusted the code sequence of clear_delayed()
> to make it easier to understand. Tim, could you please help check if this makes sense?

I can't read your magnificent comment right now, I'm in a hurry. Sorry :-(. (But I will :>)

> @@ -6415,23 +6465,18 @@ static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq);
 
>  static void set_delayed(struct sched_entity *se)
>  {
> -	/*
> -	 * Drop a task leaving the runnable set. Must run before sched_delayed
> -	 * is set, or task_pref_llc_runnable() would already exclude it;
> -	 * clear_delayed() mirrors this after clearing the flag.
> -	 */
> -	if (entity_is_task(se))
> -		pref_llc_running_dec(rq_of(cfs_rq_of(se)), task_of(se));
> -
> -	se->sched_delayed = 1;
>-
>  	/*
>  	 * Delayed se of cfs_rq have no tasks queued on them.
>  	 * Do not adjust h_nr_runnable since __dequeue_task()
>   	 * will account it for blocked tasks.
>   	 */
> -	if (!entity_is_task(se))
> +	if (!entity_is_task(se)) {
> +		se->sched_delayed = 1;
>  		return;
> +	}
> +
> +	pref_llc_running_dec(rq_of(cfs_rq_of(se)), task_of(se));
> +	se->sched_delayed = 1;
>  
>  	for_each_sched_entity(se) {
>  		struct cfs_rq *cfs_rq = cfs_rq_of(se);

Yeah, I think this is cleaner. 

I didn't read the comment tho :>.

Thanks,
Kayra :--)

