Received: from mail-wr2-f16.google.com (mail-wr2-f16.google.com [74.125.225.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5DF549380
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111322; cv=none; b=EnWjHXMLIVJViaKkiuvmqAfji+mHN5Sl+YmKZLsZ3Sk8Lw0366Y+vknU5MdphagTffrBjdxDdfi94VvcQlr8NpGKoUoFuMtwG4T0Xb+/qAkaV5ttA3aCT87SLFr9juH66G+oaSsPbeHHlRXDDW0DIMi3FxLbvvgTSPejrIYTJ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111322; c=relaxed/simple;
	bh=To4ZIG/nz4N1mez+BpaUNlO+6D6Yd8U5m8ahiirKyu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVZZ0YgZfd1cgVk2NtPMFE6zeX+h6OW0rkRhjK7blX2iGrYeOdIkzrLB26jvZiPIc/eiIDnHxB5ebTjlXkJeBEckLviP1uh9oVbqh8APuatbal9z9mL42Y9L1sT0vXR1JsOuNofZ8UgRKy73B+ZH6hcClScqnMT+ZxxHxFFkB8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clHjgBMc; arc=none smtp.client-ip=74.125.225.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clHjgBMc"
Received: by mail-wr2-f16.google.com with SMTP id ffacd0b85a97d-4843af75de5so50726f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790111304; x=1790716104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77EuTfDoRxEs3RnBeWuP2pX3A7kIvQz/gJBNQAN0/XM=;
        b=clHjgBMcLxMiPbFT5WnA0lL1G7ZUEl0tdsSxX4Dlg3i1GPO9w9bV01uAcyj8kbz/ql
         OSs4B/W3wNNUq0AKO0+ODW2GBFRL/wig23hoFlfD/Dhos+WmTM8l0NpeR6nw+XMM/XBn
         hKhO7D7/Bdwvpx/lSuIOjLkTqeFuOWUFV+0awdwtIb6PcTf/5g6k0B6unt3Eg+omYYHk
         xBzP3/3jNWbVcrhYrkFaX/AKDZMq8QuAHlvtKxlesLdQam7SJCjZfdLYKzj/KONKhw+v
         fMelsozHGtOns9CgN2Mc8qofZTPn98QCluCJlYcQN0EMChpva0ApjvUQ5LuZ4OWdSxvu
         U/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111304; x=1790716104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=77EuTfDoRxEs3RnBeWuP2pX3A7kIvQz/gJBNQAN0/XM=;
        b=TmI8NeTZlTBR0+6d/2bVy0LUVlJF5acJ8VvpPDe2CKgGYC6xomEFPaSml0dtehmI99
         5GldP+uubC+qG7S/ZoSqVAYcrunzT3XkygYHjZCI/AYLFfJ6fNI/xV7vJ1mqArIHMdpj
         kDk0u1phrfywaSBCeUD9eWDZSjWal7qWupEZeZIt4TJB8RJSwQOQv2VDJKkHKtB3qR5j
         Vtc0O66kAsbAmAGS9u+FTVIK4MH5HSOASKLQ8+W1VX2bwbBJdLhJHtm/g3q40YepYExZ
         u5z5bRHHz/LhOSYnpzZdBEuWd3hHh4wtaEgA9wUBc1SNfxEMlw6nc6qYARFrPbtIPSL4
         Vwpg==
X-Forwarded-Encrypted: i=1; AKwUvBzxITg3wTdjwu4AfzMAv/NH4bo8no+3559JoNyCZk0/JLaXIfp2C8FxpFdXAuDdJDixVMt674KTr/55qiU=@vger.kernel.org
X-Gm-Message-State: AFuF++kX21odsTYrlPcP+l2cHn0joX5S7d+xNNWSP9H3nUhSRQSdG6mZ
	S430nrISI/1MznBotoe0F8EBV7O015KjSvNpeUiAReX1UmZrW/ZhXeYk
X-Gm-Gg: AYBFou1Q3sRp48DGuQ8/pwPkLYWYSn3lrd26lC0qI6T88ngE4MF0+SYXtrHwm4X4F8f
	txHdHPLancnJYM0flakX+lDtrNmWj6T0ZV41K0645QrtzNtK0mAbs0LeCCrdTHn4Q5bsTTBtLy8
	5FVXDpvqvhK5U1StmBaEOF7PArJmVM7LoN02RKRjUULc+akP0hVVP3/TrPXqsDf7o36WpavYJz+
	RJ8K38uH7Iu3PVwx7HMyqi8l2leFw0go4FpHiqHDofPA7cUP8pzOD1LlAThD1mA5mUsnCwIA1uD
	xM/y7F7B/wGswMeqCtrgCS9s3BQDctgAJ/TCNrrziz4eaage94K6N0RNjg6pq42WGA7cL89LB4e
	iq3Jcx1d1vU6xC+u3ZZ4gzfODjzs6b/Lo/JU7cEonkWk/qalCTgdoMWztkYxggoTrhBcshhrKiI
	e8UnLXb3D2hezz27c5UngSYuwDGd0UGj9iJXzQqcQP0D3+PeQQo++H+mFWfV5RZG9+UwytbDHRo
	kDzhSOmqq9a8Irp3eDgB93xTZgUapo=
X-Received: by 2002:a05:6000:2901:b0:487:fa3:7630 with SMTP id ffacd0b85a97d-488670b9ee0mr1038876f8f.6.1790111303429;
        Tue, 22 Sep 2026 14:08:23 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c48esm1085565f8f.20.2026.09.22.14.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:08:22 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org
Cc: albin_yang@163.com,
	albinwyang@tencent.com,
	bsegall@google.com,
	chen.yu@linux.dev,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	mintaohuang@tencent.com,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	yu.c.chen@intel.com
Subject: Re: [PATCH v3] sched/stats: Fix run_delay over-count for migrated sched_delayed tasks
Date: Wed, 23 Sep 2026 00:08:19 +0300
Message-ID: <20260922210819.11803-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922105522.GO1837346@noisy.programming.kicks-ass.net>
References: <20260922105522.GO1837346@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Peter,

> Will we not have a similar problem with proxy exec? 
> That is, would t->is_blocked be more appropriate?

Yeah.

Only place that sets is_blocked to 1 is try_to_block_task(), which gets only called from __schedule.

Also, we give should_block param. !task_is_blocked(), so 
if there are a pointer we return false on try_to_block_task(), so on task_is_blocked() true case,
and that means proxy tasks stay in rq. With blocked 1. So yeah, we have a similar problem on proxy exec. 

To the second one tho, I think using task_is_blocked() would be better. Since, the current code 
looks to that for whether or not queue the proxy. 


And, on some places is_blocked is cleared after enqueu. My brain stopped working 2 hours ago,
this proxy execution stuff combined with delayed fries my brain. So I might be wrong, please correct me if so.

as far as I can tell reading tho. I'm sick of using tho. tho. :-)

Thanks,
Kayra

