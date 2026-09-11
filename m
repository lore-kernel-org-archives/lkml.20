Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2E643304B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132264; cv=none; b=rETZtZY1AjcLZe7kImV+t3zClJcRKmCPOKAPl4cEOjkWccAxWvMkgi8Ucv4G/t8fH1FPKMhNI29BU3MEYSKqhtozUpR1/iZ3iREnychtUpIRKnNleuNp4C0ONoXbTC8YJCkbVZheu1iQl0qM8qUPzAVF4k7hkUar2c+snaes1HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132264; c=relaxed/simple;
	bh=aNb/93JkMkYr2/it43yUUuddoPGr4o2M9M8aEvZ1eUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFtljxstVqTA1ILEFf2AqmsdpwR4vFfhYjKVXEVWD4gKUDRFQWBmaQKo2V94zlYjp3C/3j4Y3qgQcam8O1PiL2ZouHhjr/sCw5fwR3AmUl5w4fpAqoPcbZAgeHy2o0Kn6tZSBMO1s7KysDTtzHr2zEH1DKorYFfDz7yvmEL9cxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3injYx7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3injYx7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49c5a927a1fso499825e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789132261; x=1789737061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4Kqn2LiNZ71slPyyfQJOhMKb7P/lIIdxU755roLRjo=;
        b=H3injYx7ALrRDfg9/oHhjJCvUAKvNUwZLDnIUJ0igqdy7LyrX8iqjvYoPDBTDBmsNB
         c/qiyrjjJjRoCZkgpkNh501YTQZ4BmqNd5hHx/KEAHjKimrSfQQpGoiIVDQuIfWrtC5K
         uqw4rTgq55ivmReHHfyfEaGBf+SCXYrUNJOw9NUOtmheewEmFSs4lfgpbGaT/NnzzGBw
         ediQKvWKtjvef89y4U/3mdPOXG7XyTyGAgTijzZaG6R8lGbNxG5xXLtTP7z7iguMK3hI
         hd/QECpWzzFizuAwp6KQacH4gtMms5EfgaB+iZD1W7/eP0/z4dev9wQnZRuYspzPaxHc
         e6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132261; x=1789737061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4Kqn2LiNZ71slPyyfQJOhMKb7P/lIIdxU755roLRjo=;
        b=dhT5GSLs73P1Iacob6h0VcjNDf/ZVUKnG7q5qVvt6yxGFIqIsygatO+ULPmz0TX2DQ
         W0eN2aabK48Blh5I52aaWXQTq4R2QfeGNXmAxPNCLEiT/cJV7lifHStcI0Wo9j2m+I/x
         wtAFiwlIG3IT/oP5VbV3PLsuhvOW8m6TddiZQBYG8NNzplYSMuNQlJBNI6rQRRNVqDI9
         QOSMwfGodIQisdgT49AO70MGFj/hCX9ED4vCKakva1Jd9Y0CC3Z2/uGoqd+nFw1I8mXs
         uFNR0m6mnFdpgioqbHZwn3eq/YZPV+zBgjwAWv6LzR9lXsL4fBVvHWGqWZGY4BrA4kSl
         jZ+g==
X-Forwarded-Encrypted: i=1; AKwUvBzDO+cOtiFBIalPrfbg58pXw73f0qGBZM50hHoOdNFCSiTkYfDAyembk6AmWTainvKYMPY87Y+QjcWGKv8=@vger.kernel.org
X-Gm-Message-State: AFuF++mcHaGXPjgQ9a7IvYiiRudfOVifVefgaKsaVrTPbc1dp6trjQQz
	3zwZkwtvmcUAYOeIC9Udb/AbDOUaoWFttxF8D345jQXWiVIzug5PVEUT
X-Gm-Gg: AYBFou0amoKXaV9i2xIeXSQmJpbtIe0NLjivQZJ155M2rQ2I9dooMkKz3MpJoAbQh51
	8W98p+de+yHHEBdsI42Hi6fi6+ImZB9j7f3nWDMAwiBh3XznvndgV+cUGt45bOc10ckR0ZzhIEb
	/o/la4qaE+pqSFi9MyXKVaDDr5cGFa7ZHK1bKg83cF2t2nOtBRozHc7tMeNTOpHcZLbzLQ2Ss+l
	l7WSvGewlZgP61h1FNw7/6/DFRoB4w259rl2cQnV+VTfSp5qJxHzO4HBPe2bokCg03uzgz85rJz
	lytrRjnnVxS/y2/5Fiut+4+f5faJnDtQEZVRPWqW7vOifjI2AjHoL3bW/ysp+yMsuzljPsJhefG
	MySD3+yoBGZzA1UmD1joV16k4hoBvZHlvfd6Ip18kcV+onc6MIjZaMNZ5Q4+jSFLFXuANClV4Vs
	EeFHCtZLdQmc3jvI105Fh2YJjGf72jYZuTY3dbRqp/8Y5ZKpFGO7nuZhIpY4mx2ZfPsesiDcaBW
	0WkmugUICslnqB5DKtfcg==
X-Received: by 2002:a05:600c:4712:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49e61643939mr39473045e9.0.1789132261166;
        Fri, 11 Sep 2026 06:11:01 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm56488965e9.2.2026.09.11.06.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:11:00 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org
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
	vschneid@redhat.com
Subject: Re: [PATCH v2 2/2] sched/fair: avoid recalculating curr status in place_entity() and requeue_delayed_entity()
Date: Fri, 11 Sep 2026 16:10:58 +0300
Message-ID: <20260911131058.1220717-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAKfTPtBEKaYoEmkWRvsDWXsQxtnHnOFQiA6U_4PzQTJw0xtEEw@mail.gmail.com>
References: <CAKfTPtBEKaYoEmkWRvsDWXsQxtnHnOFQiA6U_4PzQTJw0xtEEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Vincent,

>> @@ -6256,10 +6256,17 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>>                  *   vl_i = (W + w_i)*vl'_i / W
>>                  */
>>                 load = cfs_rq->sum_weight;
>> -               if (curr && curr->on_rq)
>> -                       load += avg_vruntime_weight(cfs_rq, curr->h_load.weight);
>> +               if (curr && (curr->on_rq || is_curr)) {
>> +                       curr_weight = avg_vruntime_weight(cfs_rq, curr->h_load.weight);
>> +                       if (curr->on_rq)
>> +                               load += curr_weight;
>> +               }
>> +
>> +               if (is_curr)
>> +                       weight = curr_weight;
>> +               else
>> +                       weight = avg_vruntime_weight(cfs_rq, se->h_load.weight);

> This makes the code less readable and I don't think it gives any
> measurable benefit.

Well, yeah. 1 avg_vruntime_weight() less or much is not measurable
in any means. 

The main thing I wanted was to handle curr == se case
on here.

Maybe we could remove this is_curr bool and look se == curr
in function, and remove this curr weight and let the curr use weight
instead. So, the curr_weightnbecomes weight, we could be done
with the if (is_curr) block since we don't need to set weight to curr_weight.

Well if you think handling curr == se separately is wrong, then I'll drop the patch.

Please let me know what you're thinking :-).

Thanks,
Kayra :_:
