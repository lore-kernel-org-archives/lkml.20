Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B316D476684
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118436; cv=none; b=scalI0e5eSxaWmVrkMZIBDJMHOANavw4hxnHWw/yteH9Yd1K5HefZ+PMkuaP6DvmuCzwgHvvfDO8e8tbFJRJJyo0d1omJFgx/zt7dYc1/KEY1yTl4xkSpBx98yJJH8jRK2C1uIdADW6d60cXerELs8Tctxh2AZ8kKKTQ4irFfTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118436; c=relaxed/simple;
	bh=9A4Q3X1aG+VsnP50kIeYoIYiSm4qPpxnoyEDSQaeRCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mb9MhWA50tHw4wZRiWJAMBnYNVkH0Npj6eITn00wZljYYld0aE1zXCn3XzZMG02DBe76KJ72UZdOCceNTyL7nm3fh3SvooLd1et2K5x8akIRSwx3FpWCfS+hUJV0wdNO7AeoIx3xhS6d0gEJZ4EC9sLCBvDNpmkHnwcJaKIQiUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQKppEXB; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQKppEXB"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac8990caso85284f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789118433; x=1789723233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9A4Q3X1aG+VsnP50kIeYoIYiSm4qPpxnoyEDSQaeRCA=;
        b=TQKppEXBZn/W+c7m88INoeUaKGFWqzq6ooUcqwWHG3dGdMKAhyFZUuCzMKBiMXwaNo
         U15fcM6I0wdxQNip/148xGkly6otS6HRmKWPjbo1I7iChTZVOHe+lzCt1ODk8p1wf5TT
         5Or45tALsv/1t9aAPB7ovt+zOTSeWf8suAwzLZpyWYWjaEjVRgEYjmtuilQzCalZBxun
         in8TXpeBBdGEiTcNFJI23Hd/CH95MlSYRjDRvcWx8KBXvwieNy3P11bVJ6SWBU98X57V
         KHmP+42G3Q/Ap216xt6EB7/ON2XDhJbxmNyFWYcjiji1nRVn6aNcCE3rbz8YYATNKPfc
         /mlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789118433; x=1789723233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9A4Q3X1aG+VsnP50kIeYoIYiSm4qPpxnoyEDSQaeRCA=;
        b=m7v0XgrlDB6ajAQLXqye5jyBGJq+HVV4iF9jPCum6byeaqy29cJ7vhnvGOIIwOF+BS
         gZKEwQLnp9dD+LEthEOmAVhXZPLed/le3hFRVrPEjJvaC+tFCtQtvgTuHROGBAsjdH21
         PTg372dVmh2MQvItoGLaf6LEI2McHsNdGAKqVQSsx/W9dQl7w8B8VL4mSbLSiAhKIMYq
         yxbZYR9YIQnzaExw+M9atqKbuVE7rjST5J4PHvH+J2iRj0X5Kg/wqHTPVQmbQIzv1B6d
         oma0eVC6AkfZawEHWg9tgd0yTiwMTvuNYatrW1t1mO8v3RX0y4fIjRtXhaTl9wEPOMek
         uM8w==
X-Forwarded-Encrypted: i=1; AKwUvBy9T1jgrBQ8RzLGvx8rpx9olX3+xC9D1yKPQ9j0U5x1Y6jtHd3FYlWr6+dpiYYj5vD8D6wY0V1uWLoqgrE=@vger.kernel.org
X-Gm-Message-State: AFuF++lfiS3ta/4Qruip8epcManwZW4QAHa+dFdDQ1gzBIy4GOmMOaw4
	6ectp+N58Fq/Rruw0YdQc9Viz2c+f8gmquYLmbfOnehY/crjiDAy9N6o
X-Gm-Gg: AYBFou2FA9rl7MDvBH/owFrFPXHupRAz3+NVSP8Rz9+Dpph4V/md5jZThgfbboga6GF
	c2G1WaENCxg9Uh7ZFIRfzCN+bqfkd5z1kv0Zf/GEts1PRQPF3tsVdnp8MG+llRIlT3VEJ25K+0V
	L3PZiw4YClcSiP3WSpOI/I06OSk3a3wea2o8I5uVKHPINvyYpdZO6D/O4CSnOTDYBSf0/sHLJP4
	DkdM5+o5NLNXDcGqcvuglAuFi+PCIiwwDrxCYU0l+Ahoho3cFi4w7Hcpm3y3b1j4eWpuF3/vjF8
	6t2DCNcMpfTZTmYq9O1eex+/DZGVzNnXujDul7uStQPb+sO0qYNpGXG6aNX9G/nBap04+D7/rn/
	InzRxbwtaKEdROL/fEUqdNtZfU4Pr6dMd3qFXooQmNJgEdFiVRvWpe2b6e1dCe/zXaqYRwYE8FL
	Cr+GYsSs8kbV/Mspr/imqufz5y75qSq2V8PDm2GO1e+1rfZSzJUazMHrrrOo7zgvC15PNc+K5nd
	ZcgoVDyDV3R1pbne+EmFw==
X-Received: by 2002:a05:6000:240b:b0:485:847f:fd8f with SMTP id ffacd0b85a97d-486eb315b5bmr3215180f8f.2.1789118432785;
        Fri, 11 Sep 2026 02:20:32 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d5f1sm5060181f8f.12.2026.09.11.02.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:20:32 -0700 (PDT)
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
Subject: Re: [RFC PATCH RESEND 02/10] scbed/fair: Remove duplicate check for busiest_cpu in active_load_balance_cpu_stop()
Date: Fri, 11 Sep 2026 12:20:28 +0300
Message-ID: <20260911092029.1219738-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911002256.2398467-1-jackzxcui1989@163.com>
References: <20260911002256.2398467-1-jackzxcui1989@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> The active_load_balance_cpu_stop() is executed on the CPU busiest_cpu where the
> stop task is dispatched. Therefore, unless it is during a special time when the
> CPU is offline, busiest_cpu is always equal to smp_processor_id()`.

Okay.

Could you add something to the commit message that describes this on the next version?

Thanks,
Kayra :_:
