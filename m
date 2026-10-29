Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295498;
	b=JosMNDBcTTtX31HBGtw2hteMO7SevgzSvjByLilPPhqXDS/eR7nkoZmqPTExaaU3O+C+
	 Pn+0WpBypNTYqQ0NdzDCddH36xqheuqeetB65N5i3rM5+vJ05Ruq5M6wvJAZqs5kpcGL/
	 kDk9luOm5N3ku57vqUxebSELX3BYj8YtzFmQ6GXhLsrDpQNJ+YAteuOgafBreiLvrDTjz
	 Vb5bw8vlfrwWzYzsT0NoXou9IqNBTglOyURLRns4rHHl+8LBLl6b470aWj/n7BYTZipIC
	 inb9K8oJaKQnTcEx5SE5ZEf2qe95vFwvkF+b8GjqjEPAj53+6wFislvsnlSKBHd3PGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=+xEi/FXjAcaiOhZWzJNypC4CeC4XPVjT5VrS5d9n3Bw=;
	b=2BYgpZLsHDj9pHm/AIvKebRin3tKd8tGw0rVbQNJw7ZU6mI/XdNNkeadwguUdrQkHawh
	 HYBazkmo77eY4bdmeF7HQ7WWrS4TmLmAnOPMEOoJoIiigyCq3EmJS+tRhpXO//sgBkF8i
	 CMB/woIq7cjO6B6Ylv/17Qpx0U8Dlj5pjNc0g2V23dJsUwq+ZOp0AYp5Ppr3BB9bJnBfO
	 5OzeaMhAKEA1bR3r7dQj07ZaGqxvgXMPkk18bqOHcJBDnnI0nIiDlXgNTpNRqpOcjzPbU
	 jDlepMzYNRJA4+iVI5aWJG0W01N5xqFLzYxYSmWZJIl6usYP+/+AWr4QbK48moCDEsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=F0yCYTRH;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF91606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CF91606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=F0yCYTRH
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a06454116eso1334894b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793295498; x=1793900298; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+xEi/FXjAcaiOhZWzJNypC4CeC4XPVjT5VrS5d9n3Bw=;
        b=F0yCYTRH1KCKgj1wamQyvj2+BZVTNOuWxMJPDP0xqDm8z2AXasRhnLVIjfTJB+urOA
         hYMOTEHqguCWwBanaJwRqINoqTBckwHx8a2498qdICI+n/lBDqGMFaBGSnDJTcqrlXwJ
         6N3EVeIucQlMqzblx8dYqq1ROCDLze9gT6aRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295498; x=1793900298;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xEi/FXjAcaiOhZWzJNypC4CeC4XPVjT5VrS5d9n3Bw=;
        b=SnEbyXMBj2MGgbLEXJRx9MoNajsJoZ7j2sLNPRhJIGlUw2VF7J/6WW6szZqumCOxyj
         a0r71T3ERISuS7fXQ4cdrYFHXFIU8UWGNmHU8noePEhwcyh73WbJAcvF1jDES+7OF42M
         4TnJ93P2DugrFeRw4U21F4LFISPAJUY/posU7esZiZewNNm7diiL/TVtI1pfeVf64gJd
         eCvTK+tszv/lXbPQixZ5l8qc0iGcTQFj1X69hdX/7DpvPIpZgsKM5zFeb+wU/3+7iqbe
         bZdQPDndIwANxrxGfKkmMSwHguQuFsyTl0nA6eEX5fCrB38gm0/7TkcMKEKR8Lnzca88
         6UlA==
X-Forwarded-Encrypted: i=1; AKwUvBxH9jyPHrIsUm27JGC9HlUhXXl08IDrrDmHmtObBXPmqaBBczKHdMqnFlZW49nC2rN2mjOIZSoMf9HTmvk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1NHjPM7yeUY9/yGflYK3bnHp5Uui7YOrOw9jpFTPiTnWBg6u/
	M+L7G4dqPOanyxLzKgDxquO2qshaxiH3yCixWLZ45/vRtZeyfE2tRKo7ipP2mSL3wiQ=
X-Gm-Gg: AYBFou0mMo0HedXcZzLyQ7Y+MjJT3jO0N7PjYOVGNgfIP2U9+3yQnk4qnsRk0c+E7KY
	wcxuJ5u48qA5EywC7lfRfUUMGgHg/6niZFANp3IyRbsMtqIksn3z3Hr2GgvtnuRAbeVNMQ6Koz1
	vjV92nqetjBGoKwa/Lb9VXpt9tZj8mp0hMMuVjaw7wR7cuz6yKV+9Jibnq7H+QGl4SW6y6TneAj
	Ti5yb1ezQHPRU0uBcCzSTiYEzvC+iqzvz9Ft4hlnRxVHY8AYiIUs+83O8/RfOXaeollEi/PoskK
	Os6R23Va3AwpM3uKtPBRgPWojOAuBFnw4S+e/B5EPTk19WFuT4lXXEAxzG3p2TfnaUvqXoHE0c5
	52Y/wNH9ikfl2dLU55kDx/EWtGS9hKzDlaweKcGU9otw2sArnB8tNfhDaEo6MzA85/7YZei7hnX
	NPvNV+4KhGhJeRgUN+38TXY6DWzaAUH7/Rd1ljmoPbzJOndkpWBKvLiErpbfYV+35suneSB4sgW
	2Hnt4BV0pITQhhpk2c1uLx0bKfYEHrWK1awH7DOsXLs9X0zVUywB7c26JANEdkiWVCHMPSESReJ
	krtl3NR0m5lq+4s4lDEch3WW0sBwhsDROoy5xymva+pmrZucLTtfcrTb48ndZ2hpXpPfJGmQ5L2
	S+5jKOucfEyebqbvsh4SNZC+Rn50Mf7yU4Fgvj4YtgIEZuDYlCXjv7LSSeOAIkCwj6HFds7Uv
X-Received: by 2002:a17:90b:1d44:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3ae57f631f6mr4570721a91.11.1793295497657;
        Thu, 29 Oct 2026 10:38:17 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb1ddsm5096378a91.5.2026.10.29.10.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:38:16 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:38:13 +0800
From: Chris Down <chris@chrisdown.name>
To: Omar Sandoval <osandov@osandov.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] proc/kcore: Allow disabling /proc/kcore at boot
Message-ID: <auOEhTNaKzu8dgEy@chrisdown.name>
References: <auAmuqZyUodq3iqk@chrisdown.name>
 <auKKisespDm1xLLg@os-N5J97HY9XQ>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auKKisespDm1xLLg@os-N5J97HY9XQ>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hi Omar,

Thanks for taking a look!

Omar Sandoval writes:
>The code looks correct, but is there a reason that /proc/kcore
>(CAP_SYS_RAWIO) is any more concerning than other ways to read kernel
>memory (e.g., CAP_BPF + CAP_PERFMON)?

Not in terms of what it can read, indeed. I would say the distinction is more 
about who needs each capability and what we can remove.

Abstractly speaking CAP_SYS_RAWIO may be needed for hardware access without 
necessarily wanting to grant general RAM access. STRICT_DEVMEM already makes 
that possible for /dev/mem, but /proc/kcore gives the same capability to do 
general purpose RAM reading anyway.

In our case in particular, a process with CAP_SYS_RAWIO doesn't necessarily 
have CAP_BPF and CAP_PERFMON, so keeping BPF available doesn't make removing 
kcore redundant.  On the hosts in question, BPF tracing and BPF LSM are part of 
the monitoring and sandboxing we rely on, so we can't remove it from the kernel 
entirely, but we nevertheless keep CAP_BPF and CAP_PERFMON away from guest 
facing processes. Nothing on those host uses /proc/kcore, so we remove it as 
one more gap to close.

For that reason those hosts already run with CONFIG_PROC_KCORE=n, while other 
hosts keep kcore to aid debugging, since they have a different threat model.  
This patch, then, lets us preserve those choices while using the same kernel 
image.

In retrospect I should have explained that better in the commit message :-) I 
can update it for v2. Does that make more sense? Let me know if I can clarify 
further.

Thanks!
