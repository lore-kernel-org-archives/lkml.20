Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587089;
	b=5U6MyNPfNCZReqptct59NqxemN9Of//ewCiCgOaCdTy0nEZhxyxNwB1BFnETytHe5Las
	 u5ejnKyyjpOklRbnHKfKWs90i+pjLVVNm1krg6a4cT0nuoffQPrJlZfXL65bktsvtNIST
	 /fCRUsyIEBmA8EEGb2QkhIjNZCt/ERd/YuqElF7nOihqwtsF0FJHcg3C0nitWhD7TeqP1
	 cCd8WEInj+e47vwmZgq86SSv+UsKxCz89Fp4CdjNvPsnevhVn5LmzzCfhKB30wi2ahZNh
	 hoK0QLaSQQseCl2cC/I+9duvdfCLrfNlE0PrrURdVtHL7B9C29s38djr16GvqN8+Lmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=3ErFwJVbogXRtuieiIGkh2IlFtMeZm+e0ItbHfs/jEA=;
	b=f/YRy7qpPl/BQyH6Q/KfTVk99s88IWV0NFAlP770VWn5NhDKFnHRsmhuRd6YPBPCAcU8
	 aNIsphwSKZd35Y/rLSz9wLc2vJ+Mrdfv3kioVCOWdQ3I0PeQlPWSNH8UsqL3Rmx4tBn6q
	 Wl7UcuCIoHxEfIzE5O3rGwrw3F9aWONucvjA+16+TiHEYnPBwJrKZat1A4FTAi3ufzYTw
	 o1W7h4h5d5qFnD7fMmsOT1tK92GfeNPD38DVHvo80LHFid2NjK55UHXLRe72GhAhnpEha
	 KEiYZ4wZTzlFiLTeItXyi7olZHgSrhHRjKe/wCUYNyfdrPBHPATSyR0LCX0cTrXNqlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="B/fq2MJF";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CD3606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75CD3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B/fq2MJF
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd5e6f0a22bso232652a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792587089; x=1793191889; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ErFwJVbogXRtuieiIGkh2IlFtMeZm+e0ItbHfs/jEA=;
        b=B/fq2MJF0aOZ6qXvGZ+mGKEAHDFHEpg24+yRfHM2QD4B0fbT3Qx0ZXNWMX4NX4p8PK
         x/exbF9CYe7m7EMzYwRCz0GwUF6FA4pAFyJnFoyguTw3gLBhBPcdyGbqGFYbI57rSJsG
         yxqOFONEbNsFhmzlrxSFAHwN7V7+Cc9oD5TiX2jRda5uk2SFdNaaaSYnGkegGeehSlYF
         I8ljJrKTOKAQRhVhaeE66Gq6R6xxOB6gxiph5tKYdf33x70e+q1dso4UAcCmpjrPLw6/
         jCC9P8slzH1ABqPfWWNyt7CZQh2bwhl0/B49bnOMfSAbSuLgiIn7PDSohEdv5fqrEa/e
         ALgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587089; x=1793191889;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ErFwJVbogXRtuieiIGkh2IlFtMeZm+e0ItbHfs/jEA=;
        b=Fe3mc/4sWzZj4S8OsSb4PNxaS821xbzz/vuKrTJDRydv8/0Q9btBgbLppKrk+IZH1/
         mQ8az8v2h6O6PgrFOvJprM5fh65Sd+AbBbh7MOuj0UoC+7VlkOsOrtwGOPvqh6AEOr+4
         00tPvTFJESB5EbBFcntaPe9Z4bu6yxnNrd81gsyy9flrJY0cXCJE255Z1yBa8DqATw9h
         LFoOnUoFHlRMJmxKZqCsXhteoplsnNegdDHH4RUy+4Lqn3k2T7ICjtpBh+3fKlmrk3fO
         oX+VdkSGsEuoLXEIr22tWC+845AxtntXAovTGY+6Y2B+0Gil4E1A/i6aHc0vFZ6TarGD
         waiw==
X-Forwarded-Encrypted: i=1; AKwUvBwb0DNL0Uwt8iQL+S59p//pJDnCx93Gwu55IAlm7+pgo47+D93UbJnEdpPJ5M8RCOYk4UxumJCFYSBmDBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHfwCzKJ3DCwSxbQwSOThkBwgo7yJJXyIDDIxOHLAmQ4ZHfvc5
	1vu2Mw4yQf2/pjpbsBfEYR8B06b8VKnWa66p3RzchLwvUhi/osddo7lD
X-Gm-Gg: AYBFou3DQ95AKVM4LjzToN6rqZfupIk8CsZVEBuxa0+CLHMcpbtO11ZOUUvZGoXt2Sy
	bv/pdj1zZMVK8LFGI5zVdjM22YwiYWn3WUjyHvYhFgS0pGPEmzoC9o0vS8AdBfRStKhm5xz3kD9
	WRFXyMFcMZOvJJvhoOHrUP0qJjEHFQKGJgX3EH2Mk+vHmHT7s9LITiJgA8HWTs95OZzEp4Tox5B
	VVigsv/vWQCN9E1zjkvMwaOJe6TGeyoOzCNKJq18SbnZaGv66rSUVgT4LpdiJMMZUSqu+UKhHzi
	EBvs08BUbuvK8T7zRUb96sLfqGgJr/pLE7ow45RKC1YFAEdpLwHFoclU2waaimYaCWBaYPsyOVf
	+gVkBPnPWIJsJy025TQqZ3j3XfjshzmR71c/4uR1ufVWDjsuXGZlvhYapEZwqgly9+z1R5YVUaR
	fSKU4yxSeqBf0XET8JfLb2Z8VsqH7yxIHpTJDxEaGNQvhI3TmKHD1oiLb55AOeNWkSbkuB4J7hk
	R2wDVstj9wVJ+UF4mH7hG2DZCD8wx2IMeeJtFgIs1mVDtalpMnp6skFOX7s/l3WSSnS
X-Received: by 2002:a17:90b:4d09:b0:3ab:2c2b:1030 with SMTP id 98e67ed59e1d1-3ad86e9e4f4mr1535342a91.22.1792587088600;
        Wed, 21 Oct 2026 05:51:28 -0700 (PDT)
Received: from smtpclient.apple ([2401:c080:1c00:2343:5400:5ff:fe7d:3dd1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6a859c4d6sm769392a12.7.2026.10.21.05.51.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:51:27 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3] sched/cache: Remove the old cache group footprint on
 exec
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <atiP8TwaDDtbImRn@chenyu-dev>
Date: Wed, 21 Oct 2026 20:50:52 +0800
Cc: Jemmy Wong <jemmywong512@gmail.com>,
 mingo@redhat.com,
 peterz@infradead.org,
 tim.c.chen@linux.intel.com,
 chen.yu@linux.dev,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A81AB6C4-6821-454D-9C2D-716A3D0DFE6B@gmail.com>
References: <20261015053604.29927-1-jemmywong512@gmail.com>
 <atiP8TwaDDtbImRn@chenyu-dev>
To: Chen Yu <yu.c.chen@intel.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Oct 21, 2026, at 6:12=E2=80=AFPM, Chen Yu <yu.c.chen@intel.com> =
wrote:
>=20
> On Thu, Oct 15, 2026 at 01:36:04PM +0800, Jemmy Wong wrote:
>=20
> [ ... ]
>=20
>> @@ -3965,36 +3974,6 @@ static void task_numa_placement(struct =
task_struct *p)
>> ng->total_faults +=3D diff;
>> group_faults +=3D ng->faults[mem_idx];
>> }
>> -#ifdef CONFIG_SCHED_CACHE
>> - /*
>> - * Per task p->numa_faults[mem_idx] converges,
>> - * so the accumulation of each task's faults
>> - * converges too - Given the number of threads,
>> - * it cannot overflow an unsigned long.
>=20
> Above comments can be kept for future reference, with minor =
adjustment:
>=20
> s/it cannot overflow an unsigned long/it cannot overflow an =
atomic_long_t
>=20
> I launched a full hackbench test on a Xeon with multiple LLCs per =
node. There
> is no obvious difference except for some false-positive regress with =
large
> run-to-run variance. This patch looks good to me in terms of turning =
the
> footprint into an accurate counter. Feel free to add:
>=20
> Reviewed-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Chen Yu <yu.c.chen@intel.com>
>=20
> thanks,
> Chenyu

Hi Chenyu,

Thanks for the review and testing.

For v4, I've restored the convergence comment next to the batched
footprint update, changed the type to atomic_long_t as suggested, and
rewrapped the text:


+ /*
+ * Per task p->numa_faults[mem_idx] converges, so the accumulation of =
each
+ * task's faults converges too. Given the number of threads, it cannot
+ * overflow an atomic_long_t.
+ *
+ * Apply the net change once per placement pass to limit cache-line =
traffic.
+ */
+ sched_cache_footprint_update(p, p->total_numa_faults - old_faults);
+

Does this wording and placement look fine to you?

I'll also include your Reviewed-by and Tested-by tags in v4.

Thanks,
Jemmy=
