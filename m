Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018741;
	b=SkCooSU7xNdfjSc4UWF7TkuLxaFMperhl296M/H4NPEOHNRDxs37SmmSAyRS4QWTszok
	 46Xrr94ETaOkCwQTHVzhpDlJSRI6VpyTgELhUKw2XRV2rknz+pO6Q7HbS9fzrEY3tERcJ
	 szSLr3gwS9+OgCdrGmIMLo4GmSCy3Zli27xXsyWNe0jcily1T9AHSsF2tEDG03skzc1BA
	 keFLdvIMXBsly2xls7854O/kFC1KFr+lO9c7I2dHUMn8qztFxNP+1q9Q+xnTNLhr22QIf
	 99dDB3RM/gMcAAlNJ6qfVHgdJ3qoRna2d5ps6WO2HW2rd0wBboIPcFLDJBn4NSYRm2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=HVvkxN+Yu9GQpNIywW+xYkVpi0gO8eGj7Vx/EPDvNeE=;
	b=ElQzDd6NAYUaz5TY86GlfW0lUtp5XIsI4TUP0/hzvL74WAyN7nY1PnuF4T2E0ds69Oys
	 8tO07nNZfh/kxUXGTnWxHjiotwN8md6SFNx5Qx2s2qs4mK3ZdgesnlBNGUAt+PFKAAB4N
	 lHLbq2ZO6ozZC25fDkn51N1mngfGvn+aClR6S8c681cs7KePxNkhm/E4fl/awQagGTJac
	 /DnK7Bn2eBIAKOd+344Pc67fFCUWvhrgZR1xlwxLuIxSeFoFK4vMuynTMbCRXe+zK2tYN
	 1FJnT60DONE3q+fF2tzAO+80dpU5qV8W5tpiD8xNoucBKSpk37J1M82Q4jrcmPSmoNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mcIikeeN;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AC5606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63AC5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mcIikeeN
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so12967725e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1794018733; x=1794623533; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HVvkxN+Yu9GQpNIywW+xYkVpi0gO8eGj7Vx/EPDvNeE=;
        b=mcIikeeNgfvTGdyCLogsgEX4y/Ky6t3vHAfqFKVF0e85rTLV0MmW1VafUqH8W5pVOF
         Z5zY03CN8nxNCoG0K24eJLSMAqDDdI28sTBjZpRW/Q2jm5zjH4CuX1GD43jk5cD6hCrz
         yhl963T5G3CsozNcw1hv5PkhrzbExcTxzqWIG44tPYm8zKQZkY22D++H9WtDuw0e0fuG
         /Kvpwvrg0lVyMZ7FdeVQ1w3An79oCbQiwxzTaNzpEClCilP2PMgucJhyVz7aVhlg3cZ8
         B9K2t/6uLjkK3i0MGWH16mpa9wsrcd48AvuXsPgGudtURLipkKZz24CKwrD8/pRw6BQt
         mrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018733; x=1794623533;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HVvkxN+Yu9GQpNIywW+xYkVpi0gO8eGj7Vx/EPDvNeE=;
        b=woP37RjY0ORxNFCplQ33HG1ApBaleuLh65xJHZjx6yRg2O16CDT3K62uXYHfxiI/y1
         YLV8rU/DSh5TnO06p79gUsekRJiivU5QCJO0F8EasAINz6+jrp3i0Pd8Ifpq0eW+24AS
         BMUmIV5aN6Rp9uuQla10n+L7gbvuwg0irn+83YhSYqSYIBjO4l5KiMYgpdczSecuBkyF
         GQKz+++oYbGnDdbpbIsk3mGdEpJfHI/HemDqhGRkKAeaTOr8n4/vmPRbGIEzRZmt5IXQ
         WbpfOAY/svPNm6W4n/TbF03bqmPdjC6ykvB7PQe++2wH4Wn4YPJdMHLPEyTPsWpvXq3p
         rEfw==
X-Forwarded-Encrypted: i=1; AKwUvBxH2Ct7bLs5jXWiDiIT3P+8iBiRzkxJdn07YOB9JN1hc5HoHRKOnQecm4HA+0y9P5txmPFeH8Aergtctbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6BSe3adNA4djg5/j6NjfgJIXKm8Bzq3IDe4XPmD5reuFhI1Cw
	vRokhj+sdavk+3DKVxx3Rt0CnNtAdYx+0KlYsQtRA7Q/7vhDo91Oc1Z8pb38eK57V/M=
X-Gm-Gg: AYBFou0Y7ekABafzSp1aa7hHfrVmxEHKPStXvDwTUA9vR9botU3zCD00c+BQxj6BoKH
	KDUGTO5UjbkaE5Cp+/du2LwyuEsdEK/Au6YwfrSgTvkEk3eGIFGpw9PpaFsGYgytFNgpkTbuhQM
	I79rC89c9dd4zC+yg365N+oQtsuEmF8nOntdI8w9UCc/RN/JP0Dg6Cy5Y57yzA5k8/wt0mDqv7Q
	h1TFZFLlmi7Fczg6olDV5qYcla0IQjRFGTwScVJvPqwV8kUJJFvXQVc79d7CqBkSDi+ogOWE20A
	R9k09nv9IDN6SeUf599hyuzdvpJjzlpJFYCQB6lKZthqvpxzihVZ+ldsy7FK0QRRU/KZThN9LYS
	wd9Ecp9O/9urMpjdUoWVQU3m//YOCrPec62TedfEf8SYK83orY17VZQKKXK9RvtGuRMA4bAyBNQ
	Ge5FKZm2xhmDiw5tmzk6ZEpvqXE4ikveR47yh+miS2G0DjL3auQax18MJXD6aWVZGxVFDjIEl0s
	SI4kc0GUqrhvRgq7/FT+JRj3Y4K+PhVe9eEXsuOixVkG8k4EVV68jCaSGhuNCSkXgWPhqwB6S7D
	jFDm+zhgmtREipb66q2OaIknftXpWlCjHKUKICvbPfjb9W++mg8Wz6FwEMKA4z5gZkXBNFVtYQv
	IeA==
X-Received: by 2002:a05:600c:8712:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b6df7d4a3dmr72659115e9.20.1794018733064;
        Fri, 06 Nov 2026 18:32:13 -0800 (PST)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbdb9cdsm33903415e9.1.2026.11.06.18.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:32:12 -0800 (PST)
Date: Sat, 7 Nov 2026 02:32:07 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>, 
	linux-rt-devel@lists.linux.dev, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	John Ogness <john.ogness@linutronix.de>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	luca abeni <luca.abeni@santannapisa.it>, Yuri Andriaccio <yurand2000@gmail.com>, 
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: Re: [PATCH] sched: Remove CONFIG_RT_GROUP_SCHED
Message-ID: <au6Ln7JYI1lZll3A@aerith>
References: <20261106112454.GI1779021@noisy.programming.kicks-ass.net>
 <20261106113011.B7YxCMJS@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261106113011.B7YxCMJS@linutronix.de>

On 11/06/26 12:30, Sebastian Andrzej Siewior wrote:
> On 2026-11-06 12:24:54 [+0100], Peter Zijlstra wrote:
> > We can try marking it broken; see who screams this time ;-)
> 
> okay. Let me try that then. Which reminds me of something…

FWIW I am trying to fix another broken piece due to RT throttling [1] and have
been hitting a wall on how to get my systemd to mount cgroup v1 to run a test
but no luck so far. I'd love for this to be deleted too :-)

For the whole deletion:

Pointless-Acked-By: Qais Yousef <qyousef@layalina.io>

[1] https://lore.kernel.org/all/20261103005953.56271-1-qyousef@layalina.io/
