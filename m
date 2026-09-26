Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D53837F8D6
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437790; cv=none; b=PiPf6zlw9iIHgulCjwSe4moOl+U/uKLdVNzt6cao9/HqouAm0n8Y1r6SqVk27Xk/3NaS9zmI0Q1se0CmCxI1SD0+Hy7+r16l+LBpzeJWL3zTVVZViL076o4FrdSv26FzNqLOBH4VshzYtgZRBHVU8kVcmgGE1/HNjj/gWXQ86j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437790; c=relaxed/simple;
	bh=fBLR33F1Xm8tcFI5vjRqJo/ve/V12XVUWanpWiSV9a0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBI4MyviOQGrONcYHHIcV2IRSxS6sqngFdBV35Pbx6QxwVtVHxG///JZDu9y2CTSiK5KaXTK9VHbyDclQpITY7/zY2LW6DL4Lml8vJQC/+f7BXT4lzUHVj/eb6SJQvIHHFC/KSdeRFHeq/NsRcliuKVLMc/kLgCU/Lnbam46qqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZlu3lsU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZlu3lsU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso12657475e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790437784; x=1791042584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=led8hfaOrEtmmOiSO1x3wL7AB5T4FRzeMXFG3N+Q9Cs=;
        b=SZlu3lsUlr5hwvuyKD5g4gvbMXcMHrqpv0dTiiSMICuPFt6fUeHV84c2LWmBjylL1G
         sWTGAogM0Jvj/eiIINg66wpvlimUYUL8/B8I4ZrfYHRCdLaUoE01PObHyZVYoR3JEjJv
         4krxwTv8lfB7XAoZYmB5+PBYOqOgAormQSgEixFo9kkE2CLA7q3YJy12gzc20GBmTYTS
         RoDyCZS9qVaW7gJsdGQ7rcW9cg5BL1cd+S1yTBm8w76V1fKLq1yEo/lpHv9NtzjO+5cm
         pwAmFiAZDPh1wccr6IQzp5Si9DlKRsf3Y3nYuxtP++9TNSv4L2+SXQ2zlW9R/wfSNMN+
         h25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790437784; x=1791042584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=led8hfaOrEtmmOiSO1x3wL7AB5T4FRzeMXFG3N+Q9Cs=;
        b=2RukXGvgrN0ao4z2mVJBNOWNpcXYfG99Kdu7ztmCMRXxZg/CqKVuJXJJZcGy585r9E
         +Bq8uQa8flZnr6ZYT8V1YORjC9BZtb/97LTdbKqgC5BweZqtqJSEuofHASoixskXDDsV
         Leu/T0Cr1YOUfsVNGbCti4+8QW+dQjjmQ+MDGUakxCaY15afboT61F5d6esmkBd0wT41
         9/p5ypSk0AFdpUASkMf6DxvDqQHUisH+DyMQITDbZ3gh9CRfDtzSwECwukE5r0byFUMI
         /jShacTYyuI/8h65izVdM9zZpOvtJZZz762JmdaLKXsy2GKMZweDTeHfhO2+YB2o+bfn
         IBcw==
X-Forwarded-Encrypted: i=1; AKwUvBykdZxBfdRyuCvUbEvoNdEIy/GepXz4J+YECn6yjsmWMtpJOSZA5v468molgsHo32pZ/L3rIgovItnLwhU=@vger.kernel.org
X-Gm-Message-State: AFuF++kbsTN9qiMIHDCRxf2iq3nINLcwSzXNKk/DIg2WLiPutJaOrKTN
	X9lyYJbn/sa1jlryl0J0DFyFcOmyqJpNKUS8hTs8N9w1ve5XeKfWOeHv
X-Gm-Gg: AYBFou0kGwxN79HH/adhXP5Kqf6E3t+8oEoCxN175cLqkL1+z7SDCkkr4qi4njrZPa8
	fLDvk2Q/dBIKIvwOsEjyiOgS1ilNCe155TODpMVkJy54nBuZeSlu+bw+l1ueAIGn3hciuVIMy49
	VKBLOn0vXlsqqunAZgFIB4g8AyBkOTSnuQwNwqUe/Iewe+dpmmFIUMF3pNgUuF2tRp0lUxZEJO5
	XQSoNxt6quhWwHgke+w0L6eiUFs2aMp5RVw2oBF1ktBbsLrJtGlEtMSRU5vMBQNdysACOlEW8FJ
	u0NHg+dHa6Jj7U1MBrYPmJnXo48Oq/S8hHXiYmp3OXYytndUMXKE6tRztQuycZfHTaj7220d5xH
	NBAdRn1DvfDNtv1M+RJDa+c/TGha6SmpMhCgN/2lBBbh1F6/xIqi+3fJJjJcibZTYdqdetUruIk
	TGx2H1nIv8wIvFQpEVZJfD0uo1QAZ3zkcPiJPXT/0+FbKEdc7GMPAt+u5L6/XWVfBE7iUiCyMZB
	7fPn1VYOQ8h6AQjUie7EIq3iSqzgXbrrjNtybkScxNo
X-Received: by 2002:a05:600c:46c6:b0:49f:fe88:e7d1 with SMTP id 5b1f17b1804b1-49ffe88e87dmr20467445e9.15.1790437784212;
        Sat, 26 Sep 2026 08:49:44 -0700 (PDT)
Received: from gmail.com ([188.250.243.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff065873csm136947835e9.2.2026.09.26.08.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:49:43 -0700 (PDT)
Date: Sun, 27 Sep 2026 00:49:40 +0900
From: Youngjun Park <her0gyugyu@gmail.com>
To: Lian Wang <lianux.mm@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, akpm@linux-foundation.org,
	chrisl@kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, kasong@tencent.com, mhocko@kernel.org,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, shikemeng@huaweicloud.com,
	baoquan.he@linux.dev, baohua@kernel.org, yosry@kernel.org,
	joshua.hahnjy@gmail.com, taejoon.song@lge.com
Subject: Re: [RFC PATCH v11 0/4] mm/swap: priority-based swap tiers with
 per-cgroup selection
Message-ID: <arfplImR24PFlk5H@gmail.com>
References: <20260916183437.2946306-1-youngjun.park@lge.com>
 <20260916200434.GA5784@cmpxchg.org>
 <arAHu_BD5oqpZJER@gmail.com>
 <arQJIjzE0BlUg0CV@cmpxchg.org>
 <20260925065521.36340-1-lianux.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925065521.36340-1-lianux.mm@gmail.com>

Hi Lian!

> zram integration test, not yet a real multi-SSD performance test.
>
> One result seems relevant to this discussion: with a restricted parent
> and an unconfigured child, the child could still use the faster tier. I

I intentionally left out the parent/child hierarchy handling in this
version, since I thought it would be needed only at memcg integration
time. At this point, though, I think it is better to keep the
hierarchy even in the debugfs interface, 
so after reconsideration. I'll do that in v12!

> therefore agree that an inheritable memory.swap.prio.max looks like the
> cleaner first cgroup interface. A hole in the mask worked mechanically,
> but I do not yet have a convincing hierarchical use case for it; it felt
> more like per-cgroup swap-pool membership.

I plan to proceed with v12 as Johannes suggested. (I've replied
with my thoughts in the thread.)

> For the queue integration, one possible boundary is for the tier to own
> the queue/reader and for the swap queue to become the default per-tier
> device allocation policy. I would like to align this with both of you
> before changing v2. I will also continue the real multi-SSD tests.

I'd like to hear what Kairui and Chris think as well. If they agree,
this is the direction I prefer. Honestly, beyond preference, I think
it is the right one :) instead of allocating a separate swap queue
structure, the swap tier itself can be used for it!

> If either of you has suggestions or specific test cases you would like
> to see, please let me know. I have a few test setups available and should
> be able to try some of them. I am still getting up to speed on this part
> of MM, so please correct me if I missed some context or got any detail
> wrong.

When I send v12, I'll spell out more clearly the parts where we can
collaborate and what I'd like to propose to you. If anything comes up
before then, I'll reply on the v2 thread.

Thanks,
Youngjun
