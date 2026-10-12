Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266D4325494
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808644; cv=pass; b=b3x0cczk8LDspi+2JDM+PX/EpWxQVCTWgRSEOusbMQHSlR98Q6Gywvtcu0xbOy2wrB383edGEKPR2DR6Sr249OkpO/vnspKsgAdDg5h1ibLucJljyNBsZUsG5hXy8rGV0Q1DerYqLxYDsFY4DFSbc8HoBLKkMrF0HUma3lq9n50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808644; c=relaxed/simple;
	bh=rJy3EqylvG5GckD9gO3nw6kJWhASgIo22l3kHf5iqhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lahk40eU9yL2bOZrh4Ny9q1MQIdIrJelfVi6oOxxZcblqUg4hqN+ykChDpauCvG9sVELG6GFO1inYQqme5LG+6sXpy5jbxFQssIxW4pDXscswf5KLv/SSivMiFjeV+ZvotHZ8acv1+9RlPr+xyrcAMn65MdqU+/pR3mp9GzgAxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G94F9zcp; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G94F9zcp"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1af232df4so1024188a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791808641; cv=none;
        d=google.com; s=arc-20260327;
        b=YLnt+o/A3Ntg/fMq9QR8KqK8sO4/TjkksBVWSQIHezIZZ+2VO17E5w+D17kXmvqyhe
         bF/rHGx6AC5b+qEuz9X2tEu6xn4gfrXxaxhW6IgDzdu4FgQ2mGg6dbtEtqp+AYo7QfQA
         gLJu20hduX9MFpV5cqIXMahNPHR2DzxDVpuCkLW+69E9s6IHb/kq5Aa6peGkI+UYyz92
         JG1gqRqyrDCPfvuOfz1powyPj9qy8+5MgKCs9WOgHSfeOJ96MugPu6fIDT0Hz5rZ4JEk
         yV/sWp4B3w5qCkdi5Q+csRjv5HwaprE3sQH09twxuabicGnJug+bYEiIrB8Lpd/advUy
         4Bhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rxoY0o5ia08NgeCi7HAM+lGcbYp5Zp91FK4kKhFS5V0=;
        fh=W7gpkdTOgow2YuDscgxtPUPfN5Eb9H3Yq2KqWyzdhkI=;
        b=DCKFb0E1zrRGinQgnqS2nIAmq1c2g7oQQkbxR2eGWBEpOKF3YomtIjYWaQPilsAAm5
         ytZs73bBNQ+fDRdLLBcA3R/P7YIGyIwq1XPTTeO4iS5kO6DdPsiO2boZbMHHobq1nRb+
         sOpRBZ97YRvbLyMGepcPOp9244MglCkWwCQzkCKQEMwwnLytjmYmRK4HG1tr9NgpXWKl
         t4XfekBu9eqCdsG0NuA8CNAgvBBlF3gxOUSDGo2KLK/GHfeEk1iVDpvUNYQYiW/2wfwO
         0OGEo7WJ9o75VNokn+ZuJCnMkXG6gpO4m21WKy2pB2DhzQl7s7GaPmtVAvOW+Trf98h3
         17ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791808641; x=1792413441; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxoY0o5ia08NgeCi7HAM+lGcbYp5Zp91FK4kKhFS5V0=;
        b=G94F9zcpFSiCG5d/i4uETYTabdxwMIvQaiuZ/Pgm5cY3majc74xPWr3JY4xjOruP/Q
         kObwhRNKo0MzVGnSnNfoAagtVjp/SF9ydFxrO8kNKCo3k6DCP5lxt7QQ8497EtCSyhtn
         SWIb0HMxZbdWvueELk+LBHJVjxpocB47pbfhDjFfspXrEo+VvUXidcflGad6VWgyR/qW
         ugZlhWDVncHD7vfaWOROKJSyGPn/KZp95Wgj31583ItDVmDCPNxfh3YW4yE3tKffs+F0
         M635cVRukrhHPROYcHNW2Ikl7ZemNFLhWFa2PW2JpJ8mV4Gbs7NnGktSRJdVb/J8q4Lv
         Q2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808641; x=1792413441;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rxoY0o5ia08NgeCi7HAM+lGcbYp5Zp91FK4kKhFS5V0=;
        b=pmEE1+feH2ocsgw4+9ma6e82PqdqvGJrhHLve7bVwFL04+3m15RElpvoZ3NvNZpxK/
         U3Hi5ogP49JPMoP0E35bTFVPazk65LMqqvArhjajdA7cZVnLhos1OyXRvWt8eitapYbc
         1COt34WqzN3guOBesGEfmxRiM9mckR6QsdRiym/dqkn4/YhxtPXA73R6Nz/uAtTrLlyJ
         ZpLG2QBStQR51r4SE7W2nbHba1opRYbi4l+dIaP7KyFOucQOf7tt+LYughL+JHVf9Xen
         cFtfPFXr5IU89iSSaAbi4iMR+lO8zSwZPGRD8uacJc2wH6lakpabjyRaOy+ULCjVE7bE
         d2mw==
X-Forwarded-Encrypted: i=1; AKwUvBxDmKNtTFLEUV3qzRpLZrcqGLT1B+mZmBsR9Z35QQEw5ALkPfLhijmz7KzG511KhzSnx+lxZCGcFTrr+2Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn7oBApjU+LCuIxxRJxRPz2TdtRWatFO2pO126s0qwaLH3THRP
	QXZkqppwf8YH3TTpIdzoG6rh2ASWIzLReeK/cU9i5FUhewnDqxsNvysnmlyr2rHsVG5fXKUTI1m
	cy84DoSAPhbcSN+ANA0JzmtRK5ZarHFY9GgoGt9jsrQ==
X-Gm-Gg: AYBFou0w7ESO5LAEtW4L/heGZUbSdVNJtq0MEYmvqeAa2/IRyhA1exgrW4cvyPUwv+P
	a7mU2z4QedUq9zfLrkew44D+1YhMEhBIvJ6hwwketb4SwVeXNK6JWtW9C0B1QMlxs+LWWLQcEHN
	xnnGN71un1N18Kbq1m23HuyosUNLZ9hYNlrRw/5GF1ySQCJIC96aDWZRrZOme+lQBGRJiKXzX4g
	KMNS5xAKEGwQfd+whpQiPinvQxpGUMccYfYgarJ7GSBBOCOhHT31AthOz8df2/d7/2H6xKl3WSn
	WFIU1zQS5A9DSIFhix5xO6jsO7pB5A/XRiTUBkrVxFy0OBNkQYqxZPbM9MlzK3IaRpmJ3M/3pA+
	fQjPkq3qfRsg=
X-Received: by 2002:a05:6402:4546:b0:6b1:c34b:f1d5 with SMTP id
 4fb4d7f45d1cf-6b1c34bf36fmr1516807a12.18.1791808641182; Mon, 12 Oct 2026
 05:37:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002124538.79658-1-torvic9@mailbox.org>
In-Reply-To: <20261002124538.79658-1-torvic9@mailbox.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 12 Oct 2026 14:37:09 +0200
X-Gm-Features: AclHuK_I3fx4e_QcQBfYgOfKk7ibwlNLlg0BNFHctyuKOlll6ATtIR2O3HLLuuw
Message-ID: <CAKfTPtDVXVzsRCUavub+6cXrC8Ke9=Vrv7A4cMcEG2WwDtJKKg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] sched/fair: Remove tunable scaling
To: Tor Vic <torvic9@mailbox.org>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Oct 2026 at 14:45, Tor Vic <torvic9@mailbox.org> wrote:
>
> This series removes the scaling of tunables, which was introduced around
> Linux 2.6.33.
>
> I split this into two separate patches:
>
> The first removes the "none" and "linear" scaling which are likely not used much
> and have limited usefulness, as one can always set sched_base_slice through
> debugfs.

How did you reach this conclusion? and why it's worth removing it

> It keeps the logarithmic scaling which is already the default.
>
> The second removes the entire scaling mecanism and sets a fixed sched_base_slice
> of 2 milliseconds, a value which has been chosen somewhat arbitrarily.

No, the sysctl_sched_base_slice value has not been chosen arbitrarily
and the commit you mentioned below gives you the reason

>
> Currently, the base_slice multiplied by the log2 factor can take the values of
> 0.7 (1 CPU), 1.4 (2-3 CPUs), 2.1 (4-7 CPUs) and 2.8 msecs (8+ CPUs), so it seems
> that the new value of 2 msecs is a sane default, which I also use on my consumer
> x86_64 machines.
> However I'll leave that open for discussion. Note that the base_slice value has
> changed quite often over the years, lastly in 2025 [1].
>
> The series applies to 7.3-rc5, and is build- and boot tested on a measly 2C/4T
> Skylake machine. I marked it as RFC because I don't know whether these changes
> are actually wanted by the sched people - and because I'm not a developer.
> It does however remove quite a lot of code.
>
> [1] commit 2ae891b826958b60919ea21c727f77bcd6ffcc2c
>
> Tor Vic (2):
>   sched/fair: Remove the 'none' and 'linear' scaling of tunables
>   sched/fair: Remove sched_base_slice scaling altogether
>
>  include/linux/sched/sysctl.h |  7 ----
>  kernel/sched/core.c          |  1 -
>  kernel/sched/debug.c         | 52 ------------------------
>  kernel/sched/fair.c          | 79 ++----------------------------------
>  kernel/sched/sched.h         |  5 ---
>  5 files changed, 3 insertions(+), 141 deletions(-)
>
> --
> 2.55.0
>
