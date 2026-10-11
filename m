Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CCA361977
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745088; cv=none; b=d8mbVjfpN/fi7NWFQ6vN4pLAOjXQqMI8ZkPm/3ywScAEXvTwzbA1rtfGnMbV2rFf/4CjlbOAopQO+paKFj7edyJAqJJLDRcZjqUE2Xuoiqk95Wrk8KX1vfa3q+PRYqVaQy2Bmm5goxwb035sJ9439rboldFP2eQpPXZ4PGwS/sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745088; c=relaxed/simple;
	bh=30vIfVs4KGaKJvtrndZP8P9FN0D+Uu8JZD/JsQ4gY6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HtZeUhm8sXeRuHnYUXTMdH9PclN8yzlZyqcfYwMpHCqAzciGtff0Tsdg58wFFI+aWxuPbihAVcVa2XaXmE/GSOl9pDMMPdFmQ6laOVMny9oLaqohUv1Ud7DARhgouONRvFh279Ci2yMbo3EGI07Ds3a1E3YjQKrFlLkCRK/AB44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edx0aHYv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edx0aHYv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a17ce1dc00so2092335e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791745085; x=1792349885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30vIfVs4KGaKJvtrndZP8P9FN0D+Uu8JZD/JsQ4gY6w=;
        b=edx0aHYv611IcIA3wCr9DZZNqzNZv0g7qLB2EZEJHY8Nyl3h9MnUO8VQhqp2KZj2VQ
         OvOgfOdQaUfArxyop6uhgnHRhC1+m56EQ7ouiamEmNNUgDUo+MZDAG2CF+H8yRF0nPZx
         n2SoOt3Oy9h7mA+IowVH+zulS8b54C1bEoX4cfQMs9SpNJjrIyjXwte4IMM6fFiYubHQ
         Y/ABzwBlZFJhY/MDhT0Jstuxxxy9IiibiC0+lm2SnPTRcsz0B+MV2KWlI8vDirs0Zvjd
         wQxkHDSo7bEWVOh9Vsfr6pIhZsS4trpANJu4i893rx9xG4lt0q7JYF8igp8Wk2Wc4BQp
         bFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791745085; x=1792349885;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=30vIfVs4KGaKJvtrndZP8P9FN0D+Uu8JZD/JsQ4gY6w=;
        b=MCjD/QJ0AS5oscfriOo1KiLbCEM2d1wQkzo1l6f0dViuLM9np7E4PgaJYP8O0AfDmB
         nLQiSwAxiLC6TgBJTsFpJ9zu898WF+WOv7U3GDwO74C8X5NxUp0yRe0MqMu7dRCfUsJq
         QtkyO0vrL1egAkvQhftA5/aL1FsO6qvqYmD91Kpk0VxrYafDOh9fLepIT+s/zIOd3b7L
         NB9nixkM/nW9Dys6tuUM/G1f94jKKk9cDnBpzfgr/WrTObJIZwnaBwTiYInrH55dnx26
         NCCFL1AV+/EqJ4DI7MuHr0pcfsRnuZ0l2j6B17NSueMfhbCm1yeNZfDOioAjFK+hhsVI
         ZPIw==
X-Forwarded-Encrypted: i=1; AKwUvBz4t9nlmtvXL7BIL7TnHjAr7+WbDp1PzoKvKAI/kHDITlJ83sWHIadFmgtClqfbDbcHZHW9/3SLD/LCsYI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWLu/PMYEydMRN+UvGCMo//z978i9zov4woB5NjQtn/SSX5SDT
	lF4dagE2XdmCNuqDJ3+l9nt/HyD3aS+tk88o0b72Y8T9XFnkre8M3xvU
X-Gm-Gg: AYBFou0I8geTjFWn63tysZcYjp4r+Dnn9JP2wUafM5WgrAn/BaDnNWuFr5htpowMWrt
	7+A6KNoFG5Mw9suJp4iBWixWQjAchFoc/InEsNwqvp4OTH4PT1hmBwZVCc+igZg59CENgvE0bEa
	JQKnnIShsxpC01XkidWnYOmg2/kexUt81eAUQoqd8NjS6ZdkJmVJZLeMV2SUxTV8mvRg+yOOR0n
	dX00oxTkePBZLP6aZGCNrsZxP90aj9XeyZYRTDAeZLGALy7yfqeJ1pjfk2WSlSVLqe+OiHjeb1u
	e4v0vSOINOkP+Nd1IKprdeLumtODeDQvy3c0x4E6FVk/cH63ffQlKjPN1G/RYDA4wCshgue5uz5
	KZcAhKAAUfvrNzUUaCVl2l47wtN8YeXF0Ir+bCHPkvO4hjKOyc2LarDDIPc6pcjgdgYfeGhQCJd
	/Cxg5SL89tnX/econVs51GfySKe0sVcWyKRH+ZpleT2zYXANGkufYg2qZwDUsA4UJbPbNy8uBHn
	MVevFfaN0THrauzlnbK1P/r7tEGo7msfdrO0gkgYVd3Ep3BCC4lSnMPWyY5W78QbXMIjiasa02l
	mSjTbYB27Q4xs5DRzKmJwWkWnioW02jIZ7wDG1F+H23wiO7j1/jhOEHVoQKIc0yw8heOZHN1ISG
	484gRUyGB8IOAKA0XwjA=
X-Received: by 2002:a05:6000:2289:b0:487:1488:d200 with SMTP id ffacd0b85a97d-48dba9dd862mr12678838f8f.3.1791745084567;
        Sun, 11 Oct 2026 11:58:04 -0700 (PDT)
Received: from ?IPV6:2a02:3100:5e07:d2fc:e857:e0d8:19e6:f391? (dynamic-2a02-3100-5e07-d2fc-e857-e0d8-19e6-f391.310.pool.telefonica.de. [2a02:3100:5e07:d2fc:e857:e0d8:19e6:f391])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aac6a4sm15508639f8f.28.2026.10.11.11.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 11:58:04 -0700 (PDT)
Message-ID: <3030b753-eab2-46df-b936-8704c358f589@gmail.com>
Date: Sun, 11 Oct 2026 20:58:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v7 4/4] selftests: net: hsr: verify GRO policy and
 ordered forwarding
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 shuah@kernel.org, kees@kernel.org, petr.wozniak@gmail.com,
 qingfang.deng@linux.dev, fmaurer@redhat.com, luka.gejak@linux.dev,
 bigeasy@linutronix.de, xiaoliang.yang_1@nxp.com, skhawaja@google.com,
 liuhangbin@gmail.com, stable@vger.kernel.org, sdf.kernel@gmail.com
References: <20261009201324.17-5-xiexinet@gmail.com>
 <179166359775.434549.12356274501362124625@kernel.org>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <179166359775.434549.12356274501362124625@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> [Severity: Critical]
> Can this leave veth's NAPI state out of sync?

Confirmed. veth decides its NAPI lifetime from wanted_features in
veth_open()/veth_close(), so an attached veth with GRO still requested
can disable NAPI twice on close, or enable it twice on detach. I will
fix this in v8 and address the reports on patches 2 and 4 there too.

pw-bot: cr

--
Xin
