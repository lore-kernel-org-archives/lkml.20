Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792583772;
	b=TErudK7hHqxiXwkDeeynCf7SaKm9dFF9fr/SO+mW2cR/PQcprtcCOEvu1wa479A7Ze8y
	 5OngC/jRGnyPYcG84rmol3Vg5LG7eMoGtWwvwrB+EyB0qlkVDecnpAXZP8Tw6odSkouG5
	 GwA1Kov+fK1W9gs4MI8U7xngLDvBpF1i0hlxQtZ1paAhSCxyQ3lFt2YClqOafmjP2bl5Y
	 7Z9ZdzJfkGlYgNeiOxwGjJow/1AzedjEia4Z86uRfdWZtTzkHhwpHssxzBY1iXYlDkVEN
	 Z5+1pJaWvbHNf7KseCfViP4LELkaWqgtObn/fNZ4YI42HvMnVsbCbehWK0opVwadK9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8yuyhb5Fki6NqScFBeL2iUHYNCmVlC1WuYS0bvIGiyM=;
	b=Ak+CfDDmDTA+G7kl18etrXsvKA42rb4ymHP0u8q8i9DNMnaUYVvx2A1qYh6gUCoEf8A4
	 n2wM7Q6V438+qqV14nwGQjaxInnr3RVKYauJZsM9pCQzzcrkUrjvHgigxOW6ecyAEcBzL
	 r49WNHgpW5ii6R/6X76Y0UxClO4WCdHlLOtvlYNszAHCkbgztgEwC1AcJbAteHyjDMoB4
	 mh2ASEw8gGelCqC7LzKlA4RpgY1JyXn50bD54QW6W5G1FKc7UYK3jN6VamBikYoJ95Vhu
	 1hlePMXY8s2faJAFSdI87eGQocNReSKvIFGKmMp+6PkgiFjwcsX4z4aMCAgg93OEjzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=J0CfDTaq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56B4606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D56B4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=J0CfDTaq
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4682977f9aso45280866b.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792583770; cv=none;
        d=google.com; s=arc-20260327;
        b=W+gCApN+LSR5JQwQX+qs5FgLlTP8OnfXrJGgVCTETA1DpH4HnTyCvB2aZbg8nS45VD
         dKVnE8he/EPl3XOecxZmXavKBgDFz9HQNjODiP9MCDGSo+tnbFjww0VWESu0i/YUdk0L
         dwKgI9NRQ8R4L9gFRj3LFhu/3xPoJpMkotcWGEwu2btzQNE9WaDvhgUtrqb0WHpRvzk4
         ijFlcPSO8cDAT6oiyhhsAQ4YEn+cJsUh3bB3tmfCqgp6Ky1S+fDcy2FQvgilfnGhhYur
         An2aQDHxDgZUAH7nkhNTaFuTk7bHSD0KnHLxTgJjxh3shAFQZuTRrl99T+wvQsK1+S6j
         AQdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8yuyhb5Fki6NqScFBeL2iUHYNCmVlC1WuYS0bvIGiyM=;
        fh=Ye34X2lIe6XysDA3yRy29IxS3LlkXpn3NWfKmrQsbMQ=;
        b=BzFyxdBIdLUcjMo4pcmbpBfweF4KTESUf26sUVh72imyDsqTKvHvzR8X/UfEni25PR
         WHHKw/T86LJXp8TpCn/E0U7OJoIvHmXYJFPO8YvIpGGUxPNCYtOetMiF3JyTx9DJtRga
         hPT8RTDRRtXHicfLquoA11GBRmslH/EYRrcbxGEycXNvw2OIElF03nbr7INMmrUx6YYl
         6xs0UmMk0LfIshb/AIxzvd+6tzepOkdfwJVkGdjJX72oxWlHbTEm6PU5JpQvRXOS7CDs
         hOxu7H90gTD3eeU/oXp3wEO6C44/Hv+CAaohH+qZ5FHLBt5VfjxWnmV3E5MifK/c453U
         EqEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792583770; x=1793188570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8yuyhb5Fki6NqScFBeL2iUHYNCmVlC1WuYS0bvIGiyM=;
        b=J0CfDTaqQKJEdO+Rnh/euFbjllu/H4o67ceEoe2O0l66CDLDq0OLskkHvySFmpHZIu
         FfrSBfhbawenVxLFxAjDAeMdNVCSfTy2p9VppS/M2f40yF5BI8nC4YoS/KkpkDrSYzBs
         QktE6EYUNGGFSW6Z1lmcQUBt63mF/QnEw6QT6sFDLXLGtP+nmCV1I/Ee2z18PJ73drzX
         gv8X+WPLRo2eSZZN22+9zTT0lFpGQyQTqw1AY6U4Hr348LFUSuzXdeANKEgBC8l2RzRQ
         yk+VOLar1Bm/vGqDU6I5uFUTazBavJMOgFM0NHxhmijEQ9tgoBY1Wdkmrp7HZyj2JxT7
         gB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583770; x=1793188570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yuyhb5Fki6NqScFBeL2iUHYNCmVlC1WuYS0bvIGiyM=;
        b=Mu5lMtI8FzSUuEx3uOtoDSYJfSPAcKDtu3EFH8tlMAryRW7T2YVomIT0qvasGKAXgY
         QfXp482+pt44QGYw8Zmiz3rONatm0X+O4voBXJbwuLLF7tEzsNOGDkv15cV1WUREV8cm
         NSNPcfMBJPphz2eRyUkS2MnVTBXzYzxgW2NMQRsqGsll9D9ee9upXCA6q4RmGzSw6MTv
         Zk7wSzH/+yGjEGUma8H+UAsDkSYqnPls92ESHYIdknVSmQGozAAaR2PGPhH+E3Pp2N6M
         SYRR0ZcCnBRcrk/3goe1sf9itt2NeYlPPYHpF8str7XRH8e1TI2UVFboT3Hpwe6zurwH
         fjOA==
X-Forwarded-Encrypted: i=1; AKwUvBwUoCK2+TAv/ZQdFBj4fK9nKqb2Meydp/MwaVE48cHFShE1GPf9IFOhqzX1NRpGabTyM5bw1a/DaLaxvok=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG/mBNg1gMiI20BHAdL1RzpvmC6FXQ1qwN+NegoTToeIAa9lp/
	ZVloKbx9GD+PSlHxyQurGSWams/bb554woh6Nhqdx/xi+QorLjnLOE078AtDRc/JSB4m1q69SrU
	VgiBH/vpM+HXvpoy3LMrp3ruIoQqQMS+uzUGeQZNfiw==
X-Gm-Gg: AYBFou21k+FqpkisXr73NlGk/EChMcq56gbPM+NZNVNy0bdka9/FomfLYlRoMKgIMO0
	5Cl4AHVcGrgfVOX7PBdG5Nn4HggeOXcFBNHeQzKhM6adQPBE35UuyNkkDMcGKQIYtVNYr6aZ4oP
	Xtk58h8W7nFULjU6M78wRhzlLp5CXiWT8Z6ea/0ak2AZzjPhjApxumQ9jcwQ44eS1Ni+H3gSLpA
	8CmySW+E5Hm8NJ+5gi+lUaK/JnMen5+BsUdCAvd0nExR+BP//SgAG/Ux8KfWYWXML/zRCZz8fcx
	qcT1Mji/9Ivm3L6uQdqPijmtAOp0B2tbcUv1BIaBjaylqALAjK6rgv8UkCttsHcN/LqNb7O5Dxr
	paRPUcS3SbhiMy/ZzHQ42irHEAcVuXF86/if4B/KHGaPGb7wTZQbCTxubVwAl91f5u9zFNl8=
X-Received: by 2002:a17:907:720e:b0:c2d:d9f4:2c85 with SMTP id
 a640c23a62f3a-c46796ec330mr164329866b.41.1792583770062; Wed, 21 Oct 2026
 04:56:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260605105513.354837583@infradead.org> <20260605124052.227463677@infradead.org>
 <58dc8e8a-7260-43ce-aebb-8d9c29a6afc9@okonski.org> <b1002150c3e4f877d04790cd8e85d2149d17722f.camel@gmx.de>
 <atZM6uF0CqCNh__I@vingu-cube> <f1d0fc39-6939-4fb3-a422-273cd5c347c4@okonski.org>
 <CAKfTPtB_gMM7axqM167_Tb=WiChskGPXFDgQ4YjVz4Bj+ZiJ0g@mail.gmail.com>
 <01e25832-955c-4f39-a902-6cc253a2791c@okonski.org> <CAKfTPtCVknqCO45p7oR3s=1fNEmDW-jv7-wtQh7vwkuJ=UmVcQ@mail.gmail.com>
In-Reply-To: <CAKfTPtCVknqCO45p7oR3s=1fNEmDW-jv7-wtQh7vwkuJ=UmVcQ@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 21 Oct 2026 13:55:57 +0200
X-Gm-Features: AclHuK_HyzJ7BjGGfXkJYzTYS0YfndPN8-x7GbK4aP5LZbn8GhJVDE6PE-Cm94w
Message-ID: <CAKfTPtBVJZ7DUeDci=JkCs1kstoYXsBru46VchZV7DE5=RB2+w@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
To: =?UTF-8?Q?Jakub_Oko=C5=84ski?= <jakub@okonski.org>
Cc: Mike Galbraith <efault@gmx.de>, Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org, 
	longman@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jstultz@google.com, kprateek.nayak@amd.com, 
	qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Oct 2026 at 20:26, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Mon, 19 Oct 2026 at 20:24, Jakub Oko=C5=84ski <jakub@okonski.org> wrot=
e:
> >
> > On 10/19/26 20:04, Vincent Guittot wrote:
> > > On Mon, 19 Oct 2026 at 19:36, Jakub Oko=C5=84ski <jakub@okonski.org> =
wrote:
> > >>
> > >> top of 7.3.0, it still regresses from 7.2.9 if you test with a nice =
19
> > >> spinner in the same cgroup. I think it's incomplete.
> > >
> > > This patch only aims to fix the sched_idle task group case. I will
> > > have a closer look at the nice 19 case. Have you checked the differen=
t
> > > cgroup_mode with nice 19 ?
> > >
> > > Vincent
> >
> > Same result in my nice 19 test for all of up/smp/concur/max/tasks.
>
> Okay
> Thanks for the tests results

I ran more tests on 7.2.9 and 7.3. I confirm that there is a
difference between 7.2.9 and 7.3. With flat hierarchy, we change the
weight used to compute vruntime, deadline and vlag. The positive vlag
elapses differently with the flat hierarchy and slice protection
becomes more active. I  used rt-app for the short task that wakes up
periodically in my test

    - v7.2.9
Metric               | Value (us)
-----------------------------------
Total Samples        | 16983
Total outlier        | 17
Average              | 54
Median (P50)         | 53
90th Percentile      | 53
99th Percentile      | 54
99.9th Percentile    | 1582
Maximum              | 2248
-----------------------------------

    - v7.3
Metric               | Value (us)
-----------------------------------
Total Samples        | 16368
Total outlier        | 632
Average              | 145
Median (P50)         | 53
90th Percentile      | 53
99th Percentile      | 2039
99.9th Percentile    | 2132
Maximum              | 3367
-----------------------------------

That being said, there is a trend to make the lag to elapse quicker
and an app can't expect to maintain its lag forever while sleeping.
Instead, the app should set its slice to notify the scheduler that it
would like to run 1st as long as fairness is not broken. If I set a
slice of 1ms for the short task I have :

    - v7.2.9
Metric               | Value (us)
-----------------------------------
Total Samples        | 17000
Total outlier        | 16
Average              | 52
Median (P50)         | 53
90th Percentile      | 53
99th Percentile      | 55
99.9th Percentile    | 55
Maximum              | 56
-----------------------------------

    - v7.3
Metric               | Value (us)
-----------------------------------
Total Samples        | 17000
Total outlier        | 11
Average              | 52
Median (P50)         | 53
90th Percentile      | 53
99th Percentile      | 54
99.9th Percentile    | 55
Maximum              | 57
-----------------------------------

Which is the correct way to ask scheduler to make a task to run 1st
