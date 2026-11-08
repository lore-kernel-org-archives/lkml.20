Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122711;
	b=0jJFcF+IieWj0yUfunon4L7aY5qEjJ1VhmUK7iGxQ4Sw/OlqF5b60k2mwMyZ1rGVwAIk
	 e0naqTLQf2qTZLfeChFBsbloJJfIMIsQB6mM3ofYRlf5b7Pa14D1MY6drlNll3RstGntj
	 YeoiB+M7wXlgz8k9ozYVcsZFjtSmy+NOkm7Z2MSGy42wwAXUVa3XbqUdNoCpJ+4bx8ksp
	 XEAvHFBw765fGYpcK179KvBRUO3qGAKj2VtbDu4lxa4N8QlbeGBQwP2yXW+BAKWDhza7J
	 0TQEzeftEeXV2LG5Q8ShvcN2gjVZLVgNsI6aRbCnI/JC2G8R96t0AqPBr+MX1CTGNdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Dop4F8OKR7cXm1nUzbyU2g5S5dDo+bHScDg3mp5FzUA=;
	b=QLoaPb5ZuCF0esP8dcaCaYUZ5gkW9YYx0CsAYXhFZ9D5b0AoVM2r8n06hUQYgjJssti9
	 t5bQzo4VlSHFa9qZ2XG34KtEeZ1BytvKkakgwyIJrfaiTIvglxnM8REqDfHuLGZ4SNhVu
	 UIQ+CYt/jEPBcAM1VdJZN0WrjXR/7e+3Q0WCb7JfzyxFLliPD8BQxOioNQ2PGm0OudG92
	 5zf1MZg2tLQ+Q0XODdiKujHYu2sz4hikg6hJScooFODk5Qg4E0k2TrXBDEdGSYxEkn6UZ
	 RczmD8aopua/wLCujFvZJPAowKEOxjy5SJFwQDXIAoTWgMRR03MnQR/LJfwa4nFUcJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0KlWNEhc;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E6C606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97E6C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0KlWNEhc
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a315ed211so10417eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122710; x=1794727510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dop4F8OKR7cXm1nUzbyU2g5S5dDo+bHScDg3mp5FzUA=;
        b=0KlWNEhccXytztXcpy8QDI9lEo0PCwVFU3u38U63n6E3HSrskIS1ZoHL5zE1ahXoOA
         Mwg5mx3WBDNu1bBTw/HUKVQ83wW6jFdSi3Et4OyKGo0pC3mlXYp7epQtek1zgT75kEod
         8PiiomRbBg2t81RKaJiSkW3QsAr4HmgGkGqhW6Y1dipfoiIAf6mNtWLukVfPilhdAMcb
         PKaXQ0d3GBJHy46n/1HYInRyJzZD89FNMuwtM7Sxd6295HZwv1fr+i0M5e2YRl5XsQbD
         QcmuaxSmb/mL/FuNb1Oe+W/b0oZoCcUJstHhQKExPS4En8BAQcYulKUdD9Yj9mYGqrgy
         USwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122710; x=1794727510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dop4F8OKR7cXm1nUzbyU2g5S5dDo+bHScDg3mp5FzUA=;
        b=glM6dcWLoONdtj/ZFVfCYyhVhtMF0jSfxbfXSaeA6Ic574nKChKDPc39pCwLvlWdIN
         CU8aOln+LsvLmCyravmcFHk4KeDctEqQPT704D++D1ETEOKcKJ1zY6fLObUjI5GkdjVZ
         jE35RSomkRsz13GIBv+KhOVYEhJ6JqkoIfDRDY7FCrWAyLkdyhHz/+rJ2W/lHWzZheTb
         uKgx7ap0J29At6oZImlDZE++cAWUMo+JHDTrYGh9xBqKo/OPJl1P8XDpZqFyvNHPNdSW
         YeM09jxlQX/Ia1GmjHE2UiOKZ1XDjOP0OHcFtWB+MDUqerC1yIDMB41ilTOUf3LreOrD
         nAnw==
X-Forwarded-Encrypted: i=1; AL+hErEr6ij3l1t+Sl0ktS/n3SlM4hYkBJk+LTx1UvD4llelmE4qb2bZL/6ILizcWJFSZfoJoIfClntzG0fjqFs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uJRNweSdGnZiDhey+rFirRz6NctkYtaxYEz4q9v2CrkBrkG4x
	AC2coEXQdpo+0G3GQ7SKxHUvVCh5ndz44GkdFB3a4Uv3wjKsO44iPvSs
X-Gm-Gg: AYBFou1Kv1YvQ8f0SckJK8ymPD4uKTyQ4yrXTMaCl/xYaRM9Q625A1ZdrVE6hv/BhlF
	bCpps/vjnEZYLhZ/HHpcJhi2ubatYNZtMMUnKWKLCUXrivJR523Cmqm3Xsyi6YuqjfN7aBA/eVe
	5+I7B8toYgdo7Z6ZZZrSDaUWhVlp2XULDIqCTNmFjiq1NnNBca4qMMecd5ri1e/BQmcbK9QA7Y5
	mIEt5XSMHQNwgB752jDn8uBa4XfPW7+RSiKheVOAvbVBU4++oC/tA7GBIjE9JSX8ql0x9CPbjKt
	19nCCpyYqvXnAMXebaWnA9G/wIubY14f1aSEqoBr/yazMuPVnehFCqmwmNIMtsPxShETanDx38a
	Z25vODsxx2NFUVaC65vb3hd5yygh3k8nF+Hgmawm9H9BkGX7TtIpp72guT69m4D8yv2YNfxoHgF
	290psq2B7PXY2A/2JdqEBbQ+xR8Vd0Ojjki64yXLclCGa94g+O/Cixwm25RAK1GN6hqX5dFgRet
	LO+Kch1ivjPQSD09ToBjmbKGqvHDkWoBsW02I4g07H3+RU+Uo/QbFRirFOlyakQTZE5/szz/fl+
	HD090N/lcTr6WCY+1v9t+skU854YV3YzRgKNQyDprtlNsX9/09GbIDiBVk0fFM1UAB7N9w==
X-Received: by 2002:a05:7301:1a11:b0:368:2c6d:ddfe with SMTP id 5a478bee46e88-370f6115a74mr6028007eec.9.1794122709628;
        Sat, 07 Nov 2026 23:25:09 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:5213:762b:b24:1be1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16f9csm3499775eec.12.2026.11.07.23.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:25:08 -0800 (PST)
From: Pengfei Li <ljdlns1987@gmail.com>
X-Google-Original-From: Pengfei Li <lipengfei28@xiaomi.com>
To: lkp@intel.com
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	oe-kbuild-all@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [PATCH v8 2/5] tracing: Use the stackmap from the ftrace stack recording path
Date: Sun,  8 Nov 2026 15:24:48 +0800
Message-Id: <20261108072448.990755-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202611080654.sqFxIlwl-lkp@intel.com>
References: <20261107055139.3138633-1-lipengfei28@xiaomi.com> <20261107055139.3138633-3-lipengfei28@xiaomi.com> <202611080654.sqFxIlwl-lkp@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 08 Nov 2026 06:35:01 +0800, kernel test robot wrote:
> kernel/trace/trace.c: In function 'record_stackmap':
> include/linux/rcupdate.h:502:9: error: dereferencing pointer to incomplete type 'struct ftrace_stackmap'

struct ftrace_stackmap is only defined in trace_stackmap.c, and GCC
before 10 rejects typeof(*p) on the incomplete type in
rcu_dereference_sched(). I reproduced it with GCC 8.5.

v9 will move the rcu_dereference_sched() into
ftrace_stackmap_get_cookie(), which will take the trace_array instead
of the map.

-- Pengfei
