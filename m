Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932940;
	b=zGXboR9gPNeAAf4vewQrRgxFsoyv9ZQgc/qipz690WLV/VnHL/vP6LtdAHnVGeGsWMEa
	 kKyAkdwE73SvHfYemiUyjZIbP2vM5ANJnoeFMZ9vE1fV7jW6maAv2svJXK2RFT/TZmRdr
	 tyLFp5+xHI6ktlKFGV3zp1T0/Wld6yGry41hTxlUP8pq1itWkCB34LObmHJafLJP7fFDB
	 Sepj5rXXzouUGwDx46dQdqlN0wP5JesCDHIDbn6lgGTvd7bonl0uEnUNSW5bjxRloNAQ0
	 fKoKUtAZ3a2IUMuS8ez4mEbNMDF6cV0t35tCv11eVezmg6CPvCUT52NcO82Ju34mkMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:MIME-Version:X-Received:
	 In-Reply-To:References:Message-ID:Date:Subject:From:To:Cc:
	 Content-Type;
	bh=uvaP8X9r3pbFsctWYgsEyn9JtFttLYVAJk/GZvc1aYQ=;
	b=HKTKDjXZdevvKv15B1nA+citXshOVOzi7s4cGKPun/foppUu2wZj0ilIPPHWItMALe7b
	 B1Lfd8Z4VqBVYv4ThwgdmaQV2Xy2MrZhvYG/wTotOBJc7vKl7aSyyjsRj2yWEP1+qsrEq
	 J8QZZlh/lQ0hsTWD4JJOOc+9/MqwnvMyTvl20ELnudOUzk3rT3JVzoImlq3H8GNdMhGMN
	 lQwLHo7vRlQQ5irpbOjeCGNg+5ht07a31wPhY5kI7wY8BLcvrbQ0Y1vAENGegI8bTpol7
	 My2X/YpwmEyys3BTQr5XwNpyp7C+5fX6p2TanuvQuKjiWWILUOjfjJ2HFnKWgxDQqzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RvKOfJ3f;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74630606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74630606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RvKOfJ3f
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso63668eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794932939; x=1795537739; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uvaP8X9r3pbFsctWYgsEyn9JtFttLYVAJk/GZvc1aYQ=;
        b=RvKOfJ3faG+Xs8LNfRiY6/9H6O3naspQs5cc8BOFfjVheiXcmjr2ftvmi0l8s65lD8
         AltEVkIea76id8Q2j2CZqzj00C1n0L0J0bOCNfZ9Vr6Os+qojePWckLYcngGbyvZ2lUU
         ftDBUI5x+71Wqkq3yrSwRLPBdpGXh8v+wddic9pNN81W33F2VxMFkyKmppf1/L0Flpmj
         UqLTk6jZLcfa50N4phVETmuyInwlmXJNgsmwN51yooNLEw9Jk6GlHJEBPplOPnlSm/xs
         1/Nzr3mH7qqA9qlloyB26+vj72y32ZYNVWyro4PDv6PfzjO+QmVmMStCJVfedQRPBPlJ
         DPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932939; x=1795537739;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvaP8X9r3pbFsctWYgsEyn9JtFttLYVAJk/GZvc1aYQ=;
        b=DsgDfWX5sSLpdzKG4oFw4yvCgIKEJRpmOgp6vNhGX1lDI2DvibzR1sYMUDvq1AhG/f
         dsZ3BsyN52yho4/9LJVE1gR4u6/ilCA1CkY2VoK9zXgny5axGSxMJ+aYJajs9ViU2w9A
         TB2Ibtj369EtsIcDfx9J1YXrQouyLnvF1Jvt1/tAzvXCeKsjIrzb+sRou5gHu2uV7KNJ
         beAcPY1FpcgZPJeW6BerNRZG1aJx2GB1STjtQzq9ffd/WG9zXZZuRvzhXEQoLne4JZId
         p6UApHYul4O1UKEjfFOFWCepiP6szCEqeI4IAUNaG1dlf7Qr6EHOvzCFUWZ8XamX66ua
         VpsQ==
X-Forwarded-Encrypted: i=1; AL+hErG+vJUFmfTlsba50DdqDNh3hOhp7LhH5A7YCZP5C5aDmHxDMpyEE1FblJRFPDcaz3ql1oc7CLy35JG3vHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cL53Pc7RKoZ9MkjoQiF1jk0Qd8bvCHkeL1X2ruaSkMWPt9kLb
	8juVytzX4fUeZanyhCRysMuwp2YFQgjdwlJVJLtri4Z27pSdichfM+Aw7vWX6w/K8yV6pZgM8bh
	dqUpRlMPqmKf91IQR8ceKLzC1rASGjA==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: from dycmb12-n1.prod.google.com ([2002:a05:693c:20cc:10b0:37b:7764:f755])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:4003:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-3796696128emr13866209eec.23.1794932938923;
 Tue, 17 Nov 2026 08:28:58 -0800 (PST)
In-Reply-To: <CAKfTPtB4dKRmK5hnv_Me7CJVECKmoNw7_VywgLyuFjKDi-Pa6w@mail.gmail.com>
References: <18e8d60c92652608.3137322e32332e3235332e313736.371783.0000sendgmr@google.com>
 <20261117154656.GJ1813469@noisy.programming.kicks-ass.net>
 <20261117160522.GH1922751@noisy.programming.kicks-ass.net> <CAKfTPtB4dKRmK5hnv_Me7CJVECKmoNw7_VywgLyuFjKDi-Pa6w@mail.gmail.com>
Message-ID: <18e8e1ff7beedd0e.3137322e32332e3235332e313736.2570a9.0000sendgmr@google.com>
Date: Tue, 17 Nov 2026 16:28:59 +0000
Subject: Re: [PATCH v2] sched/pelt: Skip redundant decay and divisions when
 sched_avg is zero
From: Chris Wiseman <chriswiseman@google.com>
To: Vincent Guittot <vincent.guittot@linaro.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Qais Yousef <qyousef@google.com>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 05:09:08PM +0100, Vincent Guittot wrote:
> Yeah it seems that arm64 has optimized div with an early exit when the
> dividend is null so it would be better to always do the div

Sounds like the consensus is to drop the ___update_load_avg() hunk
(and Suggested-by) and roll with just the accumulate_sum() and
update_irq_load_avg() skips in v3.

Thanks,
Chris
