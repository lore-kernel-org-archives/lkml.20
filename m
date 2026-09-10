Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A5239CCED
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040476; cv=none; b=DvcuEvNkh6SLbIWRNq96+2nCZgHVQZEq1ZaOYWmlg5I66I0wjJ3FGGDFN8TDus1jWRhwBP+gYRPtRg+KgAczhnhE7FbfbwYetsA/ftjlATCWYO2HVUV4LDsIdKxZKh3LZYPG0S5TYJKkRuaFmUzpa5Rc3vo1ThzXHRrK71atHy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040476; c=relaxed/simple;
	bh=iZoSLoKKu+Hes2OQ0gHmOvsfmblis61kEgusHfH7CJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUwSD7wDm1uGNo9wf8p9MI2cG/qtXsccNPxldfiO9zKN6nKteeTlnUSOHKC7tO7i16OJS//+ECc68vRCsk8BuuEZBNNH9iYeLs4TdBadmMrWHFtAOUDWmUQfr6JMd4c2cQuoEYXnNRuzAcX9zpPbNx0xhh3MR/EMMQzBh1DijMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyQnm5+n; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyQnm5+n"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d157f691cso2072655e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040472; x=1789645272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZoSLoKKu+Hes2OQ0gHmOvsfmblis61kEgusHfH7CJE=;
        b=cyQnm5+nmwV14CkdTZyBRrWuMjMnZgHVS8hWJE25gdEOtGoceBLjVo3xwMbzTRxLnj
         BbxBJHunV8dCRtrUlnc7lNFvhg7swnzzYWFZ07lFBodzqVUXY6JxO5p339bOaJY5fJLI
         g/aYfNzcI5PCG4+EN4Wt6qVCfhqXttyouzhLPYnZa7oeDgT7oe0HQwsJy7w/yKG0tRY5
         dLrN3xNA9A+PIuI6ZioGe13auOIxb57dxky2P17vmggeCnux6dEGy6o7QFhCEIPSWoPm
         UP2AtL+NQ4LGqx8RX5qEoMmIFKeQBTqvUZLDb7yy0YJuvGLZF46S3JkdNz8WR0oNKUV/
         VmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040472; x=1789645272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iZoSLoKKu+Hes2OQ0gHmOvsfmblis61kEgusHfH7CJE=;
        b=Eant3poWYC3436O0LUU6SrDkbOhcujAPzqcltgp4fXmiFq1GZnVOoKjhunBitPxC3L
         6HQeHqkFtitl42Tpb7Np0Z3PZ8sO4OKVSprj7XEpmIhlD/3ywCyeM1bodaKDfU8D0tL4
         5d0S6n4I4ha5ZTem4r16bn0BZw6tLurH0Q0uBrDPDp4u12GCzlchuTDu6HyKXeBI8DGD
         xnbZ5ZZpwQWS1ciZwWV9kCCdyWHcSxNvsWR9jwUQQYMqSFDM8RmjOZhhT/WzvxinvXNt
         yXJA4WQxZHQswQJB2tp4iyThmENj9ktdu/7DxH52rtxpj9K9KlJAev0t/8CztT471mfL
         HUGg==
X-Forwarded-Encrypted: i=1; AKwUvBw5f8XVIozGuS2YBNDArm2yEuVUiF1sra2QBQ6RTmLhisIgE8B3utHF7jOKhIXWomKtSB7U1FC7AEfWS+c=@vger.kernel.org
X-Gm-Message-State: AFuF++mVDY5ukWTqf/ZUJ+unTQa4YAWDX8AK+P8jfLR4viYaH7o6tujE
	n+E36mPbFGoCjlyrZwSC+XmCcAAB2XaIgVvmI1wfbw7Ny9JNgpxqkiXA
X-Gm-Gg: AYBFou3vRb49WpP+3btUE880FN9lvZQVyLiHe8Om7PWbniW3sgH2IF1+qgpf/GkABjB
	yuJ56Ok17eTOaooZx3F6YB5tYDGN+kOpq6E5w/kw+s2QQ9L19NIsIBXz/5OF294oC1RdOb3ii3L
	0MWVcetd+J3jxZYPHOe9i3ZL/3PJhVGBGsnyyt0Obt8LyLwaLpSgRv+dIfCSI8W09w3vVvjdJuu
	Ctx3rj7VOa6TpwpN6Lbj37iTUnR9RHR8DpP7yrzK2jOxXeparkPL+OkUKr/aI+eq32oQcACzaXv
	C02UhLUsZ3ErgtYTbo/Ix4ehYnRwLEiX07kFoGwigLB+rjT4Hb0uO/KdpsUeVlSzeodgHKJeqse
	GU7PgxekdqGnHAbiPKmvD8h+UzC7gc6VkjPTeD8SsXIEJKh/KUa4t0k/i7nJyo83SMNCailQtM7
	xd+JMaZNzyGVKfFsiAzm4LhZSlh/4q5I0o8bifRbLozB8eDQjRKsuzx/Pbyy0VSWDtYC0BB/kY5
	SMDk9IymeT3Qb2Qd1K4bQ==
X-Received: by 2002:a05:600c:1d15:b0:49d:798:67a4 with SMTP id 5b1f17b1804b1-49d274a6977mr39427515e9.0.1789040471895;
        Thu, 10 Sep 2026 04:41:11 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26b726f9sm63309455e9.0.2026.09.10.04.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:41:11 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: jackzxcui1989@163.com
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
Subject: Re: [RFC PATCH RESEND 02/10] scbed/fair: Remove duplicate check for busiest_cpu in active_load_balance_cpu_stop()
Date: Thu, 10 Sep 2026 14:41:09 +0300
Message-ID: <20260910114109.1207170-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910042950.1619727-3-jackzxcui1989@163.com>
References: <20260910042950.1619727-3-jackzxcui1989@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Xin,

> The check for cpu_active(busiest_cpu) already ensures that busiest_cpu has
> not gone down. An additional check for busiest_cpu != smp_processor_id()
> is redundant. After this modification, busiest_cpu will no longer be bound
> to smp_processor_id(), allowing the active_load_balance_cpu_stop function
> to accommodate more scenarios, such as preempt active balancing feature
> that will be addressed in later patches.

The code is complicated and I usually not come near here.

But how did you reach the conclusion of smp_processor_id() check is redundant?

The cpu_active(busiest_cpu) just looks at the CPU mask of the given CPU or busiest in our case.
But smp_processor_id() doesn't performs the same checks. And even if it's doing the same checks,
how are you ensuring that it looks to the busiest CPU without even getting any parameters?

For your conclusion to be right, the busiest CPU must be the CPU that smp_processor_id() looks
and the cpu_active(busiest_cpu), smp_processor_id() needs to behave the same.

And please add some details to the commit message why smp_processor_id() is redundant rather than
skipping what smp_processor_id() does in any case.

Please notify me if I'm wrong :_:

Thanks,
Kayra :-)


