Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712137;
	b=rO3egPKvrI/OtSI8BpCFSX7GxyLBV0AfvjHXykm2zROlquCikDX8HiEUrPF/zTGaBYlu
	 IIwAj0c2UybUj2mPe3Z19VC8Lq/1gQKX0w7zETHzfwO2qUBeDNfYuK6ihV5rDnrUISP3V
	 nI/rwzAmhVVpSCYWJnzi/HZlQXJlKVIjeuV+M7yEXhql8YtbCMBvhLOqHVcnK/S4ykH1c
	 VPH0gWag4LWlyT6JVXSVZaAF6LAltOtpBNK4qKYzQw4ENAN5uFUHRL+wplyA0I0mz7VRX
	 UBbvCs55sxRu30DRv+wwSxFCNeERyB9cjbzbHgXKp7yGBa2QIjiawz2uFeEjKZSfiRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8Kzcx1A/Tq9zWXJslDd6YxO62sKoQa5PKvjaSVV6eKA=;
	b=MQ34q3JkUdQ44v9HSEIUw8zw5AiJ4E8smFFawfGmVyVZGdqtWWUVzCcvc1R01SBDVAnI
	 w7f9bOb0X/6BHiNl7ltvpa+y79K/A5zswkBrbHpBB7VZu2gQbDOefEo4xFnBxbBk/ff5N
	 wLceEEMXv1ipHo7gbmfXjQxthepinPHw8olXI0dYIXRrXZa5bOPpA/TjLySbX4dPywn9V
	 Pt9E27PD9k4NZKRrBh7/HXssDpOnA7GbD/2Aqs2C5k7I6CmFfOPJANdehDUAtnBysSw9c
	 JSIbWUwqw6twg28zwk6C9dJnBTPFkOJfSexD50KYL6LDzJaCg6KctG7N/KY8mtuaQhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xGKBFkvy;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FC1606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5FC1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xGKBFkvy
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso34062525e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712135; x=1794316935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Kzcx1A/Tq9zWXJslDd6YxO62sKoQa5PKvjaSVV6eKA=;
        b=xGKBFkvyoruR2hSynxaYEtGpl7S+cJLG6RbJGPvEpLWcJKfstePG11sMWW86D6JbMT
         NfQgB5pKxSmsP+6RdXj1tS5GNywATI1Wx1e9t9n0yFvgV+VvAlPSG8zGogInyagVRwFD
         tnqDbPhRv8fb+5GA0ayL2dTZPMb0OBZSoFt2qziemUJ8JIeh1Bj4qKAfT9ds2M2kauWs
         NF09J/wzdkImyWRIwas3xiALvjdm5Yeg72Aeki07YFuxmG8iAIO+teed5s+MmTDNRqep
         jEQ3z0ZmXyVwHJqfotVs5Un9/T5qd+EIg6R2x2Mx+OpZ7qSQaoJUCSsUGgvJenp9j0ZR
         NfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712135; x=1794316935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Kzcx1A/Tq9zWXJslDd6YxO62sKoQa5PKvjaSVV6eKA=;
        b=dFGwByUtIbQL/pNaiqCFOS1jfbFgoAguxe+R09a18XBE2yWhkfknQ4CK3GRrSqnjd7
         es3ZJYLAzgsfOm4zuz2s5xPxJGs6KYyRahWJUhOIbSFWt9wu5VtZaKBpKYsmyNa66QNT
         tkBUjGTtuGfogcAhgCSowy2mjEzyfHBhgl7fkrZ6kegSqZi71C7mp+uNliQkpwKTXdn9
         szqpDKa8clpSrSPzjMqRTJi5Rhx1NDIpRqfTqPBWplc9H+H9A5GDyteBWL+fq9mO4Dn4
         vJAlvNiRoIDStLnys9Mo53Ru3wzoTjgMhH9EFfXBl9MAxLpz34Z9z6/KP1s6vG88UL8v
         EGnw==
X-Forwarded-Encrypted: i=1; AKwUvBwqV95qFPkU/pwct5HBNnYEQI2vQWHbre/3/4RfnKTWHLkL9pkvclROUHRHdszo5ixDJmsW8Ej5Q/7huQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TVbBdzjn/TMPmK/jUQeuy5pFnFrqVnhV39xk+1Okpe9Uy2RMQ
	L/+f+BMB7mPHawACrVTFdk435Qs6pInQNv3R5Z9T1LswNaBZG6ggMDna
X-Gm-Gg: AYBFou1yiHxmL9j9KEDHVLRM8jSbCBZUFwBugxxIt7XSa2qHgvrCi2BYQ8+Zjf3IVKM
	Ed97awkqcpx56E2WJshCRcFw5Bm6PL96jfu4Yoz60Aghs7qmV+yHlQaTD8xMXtat9K4xmCR/JCr
	gxjL2tkXT2qa4qWR/VODZxqqTZ/JEFxQvNfh05CuDf1WcfhZoPzEpuPmcmrS6Gf6DvjkAekewHZ
	pUzppxtujfMWX4mp4KGz7kZr/hxw9shSg8Jh582lzH+6nmFXQrbuQRU+yzzEA+GIp6fJauhJSCr
	ptaiFl8Q71j61zc8Pe5Dh5g8STrouN9IFmnt2C6jBkbbbd5sWhzkVBY0SDvCw/kX+WjRvvGtkTK
	ryzA9o0M4lcFUYdAtpypRDJKhOQdj+8Zpjyrmp0ibpx7/2ggy4VV8fif3dgwSAh7PZKbyLvFDrh
	FGe/nE9zYLyLwH162msHVGu/f5xdMx3UkUuakz5LNBsLm/IhtPcavAOauSo6fyZtiVPXXKw3Myz
	n0KBMTn4/W0zp3m2MYBiEP3EaWotbaTzKVsyjs7g/nxZ3xxDGw/ABw13lOrjkQQmh/Guv02FMSh
	zxaWLG1zT4ldcXAJ/tdfrMcgZ/2HZ1WlN4aV1HeWouMIAd3zRahMLn+A7P2PhPorySNXpIQypkv
	EsQ==
X-Received: by 2002:a05:600d:6508:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b0bc65ba2bmr123679275e9.35.1793712134651;
        Tue, 03 Nov 2026 05:22:14 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa953d35sm56944055e9.9.2026.11.03.05.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:22:14 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Hui Su <sh_def@163.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched: Fix cpuset_mutex double unlock in __sched_setscheduler()
Date: Tue,  3 Nov 2026 14:22:08 +0100
Message-ID: <20261103132210.4142-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aum6IBxgdiJ09Kiv@jlelli-thinkpadt14gen4.remote.csb>
References: <20261102134606.242743-1-parri.andrea@gmail.com> <aum6IBxgdiJ09Kiv@jlelli-thinkpadt14gen4.remote.csb>
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

On Tue, Nov 03, 2026 at 11:40:32AM +0100, Juri Lelli wrote:

[...]

> The fix looks good to me.
>
> Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks!

> As I said in the other fix, I'm not sure we want to keep the reproducer
> in the changelog, or if it's better to start collecting them somewhere
> else (it might be easier to actually run them).

Same as in the other thread: fine with moving it to your tests, and if
you'd like a v2 with the program replaced by a link, just let me know.

Thanks,
  Andrea
