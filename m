Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280558;
	b=2+hQ2hficnM6Y6MwzM9E+rTi07YzxpV2+MojkEU9ImLGGPAqzyjoFVfcfzkYpdO3Z9TI
	 e5D2f7B5Z2sjrnKchfsbQ8hBCI/PpriOVduK/RYKbYyU2mA8XC9IyJwLmwvBO0CmVZnB3
	 sbzgomTehOnn/BnCqxlj5gTRtYN8kNcc1bMocxXSXYi+5aDUSbnGgEezbfZdFXw6Cvdvf
	 LGq9Js26LMg3EQrfK7DaCX9GeVizYUVzSqMLj2EgCaTgQUMxdGZVYDm7TwuKY2E0jmBoO
	 r3yO3zHMESANNfBqOzJem5rDD++nwvim3jcTRClBlAP8AoAULK8QMaet9IWRlz7o15w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=tKM22T/D5/SO/MGy5jLdaGL7gHjLOi5ZLHchOauKsAg=;
	b=qk/O1y75UuyyEz8/CV82nocPE0H//QeU5HK1+P9OUwv25Xbm32TjKoOfybAJtztsZLLx
	 mZUQA2sI49ZsQKVduDUMWb8KF/5FE0LfFh4MrNz8GA30UMWHpQfaQBBg2a41IQEh1wIpB
	 Ygm0rLOByazV1ROJGKW41AViMtsfsGmGRIcPAj2oUm5rFnECUgQDgQvkWEf7wOTR/rIoH
	 3ujAamFQs/VOu0m73HQYYOGI/exk6Z4fPVaoveLkvLfNGSY0ztVNG5YSEuEMrajoomJAN
	 WlBM4qJ/I1GcH4FQ93rrRh9ESYEjXMaMUoLPxnbeXl5CRDq6c9lsCaFo/MZjs7Pt6Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=grdncc.com;
	spf=pass smtp.mailfrom=grdncc.com;
	dkim=pass header.d=grdncc.com header.i=@grdncc.com header.a=rsa-sha256 header.s=google header.b=NwxIXfIf;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74CD606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A74CD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grdncc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grdncc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=grdncc.com header.i=@grdncc.com header.a=rsa-sha256 header.s=google header.b=NwxIXfIf
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso585955a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grdncc.com; s=google; t=1794280557; x=1794885357; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tKM22T/D5/SO/MGy5jLdaGL7gHjLOi5ZLHchOauKsAg=;
        b=NwxIXfIfED92rj+yFVekhg0PoPvL6YqEIV+8UuPTeCTSJGMCqEVq7hIJ+SflQ/2qz9
         BYV5y3QxZYan/+H9wX4hQnSGdVMybN8ZiGD67y/3gVq0JI/MbBdn6EyqiPRNpSNmG66T
         p5BcQfDjmSFz6UPCTao36rT920jDVb1XwPgkG0GK59HFH+eAqz3PZrtF35lvRKFfTqzE
         Iq34Xg54uBrv2zbo+xSnFkrFcsRvDvdiaLNdc2RS/+e455QrfsSbx3CWYH657zWiUoM4
         z2GWIDCs8gooGGJOV0rqY9f+xuZbR5SbxV3OJvRI9PJZGkA3neqqFc1oCTfcajQFow1Z
         WLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280557; x=1794885357;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKM22T/D5/SO/MGy5jLdaGL7gHjLOi5ZLHchOauKsAg=;
        b=0vEI8XbhWjgR0VXW6nIkIobx2wu020daWYYxpT5JVRPW4BdTTTvoBSEl3/mgKMkYN9
         QyHChnOplNJTqaCECnqt8D5YtMLwRk28fECmnOu5rHk7LpSTp8ZOgyU+a5EB0FJSHy9u
         3SkZZYL24qC2IW7vbGHiCmaBvWdHEM0/D107KE4n0yFHDrdK3g+jbWjBQnnVBX6KIhPC
         v8NbAjOQPYAFPOIEsS+hV9XRc+4o4PmTagJv+lu38Ij8NvJz1g7/gs0PfaQbGlGldzak
         PMLU7eCquay7J+31CLY6NlLNnfVLZzaASidYUiQyFwTzIHhfz31gN7Fj1c+1IyBULzkz
         xp8w==
X-Forwarded-Encrypted: i=1; AL+hErFswhutZrCu48XW8Lmbvf84IZYqagzHTJxZf1GBYL5Ps0nUr2yUeBsyCHFzB57RskRtiWZ+BX3rqJsAaAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GF9Dp63Xj+DnXOCGU6gyNlKADM4skiWK5MclJ+/PE6mNNCsOx
	81Lwj22c885hTaCM6R9fKGTV56Lcavh3lNlUW71njafvXMa6kh2iQ3ZB3MPIoQjaS+w=
X-Gm-Gg: AYBFou17ku+pQ0HeOtLNnXC4rmdBOAhPG1eyA+B8JnOocnQ1BGMFcaVV3EVF2oqst1e
	yvlvB+lCkZLNc8eZNA8NVXncHpyvblJ3AqhFJrvSe0anla5cYqw0yrVXBR5oDKSGeBsK/rF1Uff
	jh+GXqTp55BYyeElscjTwBNPQgXAxUxKkuUGXLkevd0ifslp0BKG+XT7QWueA4QiUUnCfPhoeiJ
	gtdTt/r1be+mrXANmbDFiOh6Mj0m86p0axmiKsnHi0uEegoCAE3Ab/Yw8xB7QL217YdZJB8ZQIn
	wK5nLCce8ZFJeDd0h1wfP1TYRtJrol9l7AuRhOwmg8a7Y8XfFWcHZs7qUmd3XbeQqqu7wR9dhRs
	X3M3s3lS6v1lCPiyJGe/1yCK9rJ4+IXAGVmDqAOcRNRcvDrdC69bnQpuq87f8LofF6Jk82qDo7q
	a0Wgn7K1C7QqJq9D8h4EzIlnUoVCyFEhFLFdyyvnHAuH15Hfo4XsRlFTgcr5KL6VvySDWSU4jLj
	Uc/TvEwkRkMmNcHBGBbqMY047a861KvdcM8rfLTP2SdvT9hgL1dAATHXkYMmXmdt7haAmCIG9gc
	FCebO1k0RVcY75VhCW8/eeWok1K2RGy5xk+fbG6GVYp44fjJ2alUu3rBX4qsZ87GjgT+/Q0eO3h
	e0hK+4iD3koOYIGRjXL8DPsHuO5BAN/18ew==
X-Received: by 2002:a17:90a:e7d2:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b166d11497mr1560555a91.42.1794280556688;
        Mon, 09 Nov 2026 19:15:56 -0800 (PST)
Received: from smtpclient.apple ([103.243.98.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16797069bsm1826210a91.14.2026.11.09.19.15.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 19:15:56 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH 0/6] sched: Expose writable interface for preferred CPUs
 mask
From: Maxim Kuvyrkov <maxim.kuvyrkov@grdncc.com>
In-Reply-To: <20261101192203.6979-1-ynorov@nvidia.com>
Date: Tue, 10 Nov 2026 16:15:31 +1300
Cc: Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Yury Norov <yury.norov@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrea Righi <arighi@nvidia.com>,
 Ben Segall <bsegall@google.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 Johan Hovold <johan@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Mel Gorman <mgorman@suse.de>,
 Mete Durlu <meted@linux.ibm.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 Valentin Schneider <vschneid@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 driver-core@lists.linux.dev,
 linux-s390@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A2B09626-39F0-4EC3-B57D-CD83D77DD208@grdncc.com>
References: <20261101192203.6979-1-ynorov@nvidia.com>
To: Yury Norov <ynorov@nvidia.com>
X-Mailer: Apple Mail (2.3864.700.51.1.3)

> On Nov 2, 2026, at 08:21, Yury Norov <ynorov@nvidia.com> wrote:
>=20
> The preferred CPU mask currently lets the steal governor reduce vCPU
> demand when physical CPUs are contended. This series adds manual =
control,
> opening more use cases.
>=20
> For example, setting CPUs aside for selected fair tasks at runtime =
while
> steering other fair tasks toward the remaining CPUs.

Hi Yury,

I've been trying to do this with crutches in user-space for a long time. =
 Thanks for implementing this in the kernel, and with a convenient user =
interface.

>=20
> A user can mark a CPU non-preferred and pin a workload to it. Fair =
tasks
> whose affinity includes preferred CPUs are steered away, while tasks
> whose allowed CPUs contain no preferred CPU can still run there. The =
CPU
> stays online, task affinity is preserved, and the selection can be
> reversed without rebooting:
>=20
>    # rmmod steal_governor
>    # echo 0 > /sys/devices/system/cpu/cpu3/preferred
>    # taskset -c 3 ./my_workload
>    # echo 1 > /sys/devices/system/cpu/cpu3/preferred

My use-case (being a compiler optimization engineer) is to pin =
benchmarks to specific cores, and stop the system from using those cores =
even when the cores are idle.  This prevents L1/L2 cache pollution and =
makes performance numbers more stable.

Thanks!

--
Maxim Kuvyrkov
Garden City Compilers

