Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794561126;
	b=S3rLBXmplWoBiil7n2WobFOjQN3Bswhf8HSvzsB2GLRq4HZIxNYGAlJ92VM2SVPKHJ9Y
	 y/5U6Co3FK/l1R7/e42vHslDxcs+nSfzJHsGupABeQWQSiLgzs9sw5RzBb84oVvrIkIVV
	 rgCH3EN4zN3/zRWnZgCSX4tvO/MD5aIf80aqv3QaMlvZAKBOy1DcbxAYD2UH6lx4Jiv0/
	 ZRb9c94bhNUcMv0q8PWbxmqtvGc7cNOhsTwmLDgZqfgba4qAQJTb1wzJuhZwHuMR0Ak63
	 P8Jj+iIqQTi1DN7oBRdrOeNPsfDL5biTHyCIDzsyZ5zocMnDmULH4nsmkbn9R2++iVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=v5gqBDg935eg42BKTNthAwXGtYU9Tyqsel5+SHSd64Y=;
	b=umAgSEJcUrXIHkTJ2ZrVx8zAOow9Ct0wY4VxYwjSvNecnFXMbCKNAYh5KuY2gvjk1lsU
	 y2NjMA8G4vOBd+hvpJdAgVjM7kgPCXQLw9gEPRN43x2KQCdiGh7ExDj3deoS+sMNlODP5
	 0KkRPg3CeNkcH84dBFnWmkFURA/H/7lGcSGe1q4yXNwiDYpynRPwlMYtM9NyolBAxq4h/
	 bsCJJ3vMbpW83liDOk4safMyLvv6nsI59RtkpK03CM+PaG1bmZYcX82Jp/IgOFVKxRu8B
	 dChGU8j47KrkGLQC4g5oEtxhJX1kFAiI44v4zeR8XA8U/RfE9etw+i2xy7wqKePwzoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C96Chts3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE64B606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE64B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C96Chts3
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b3541bb1a2so3778757b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:12:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794561125; cv=none;
        d=google.com; s=arc-20260327;
        b=QS1SWn5K977C+7ZRJM0B71/Fl6i67ufLVzMOx2tCx++XPJ4LEEac5TDvunICpsD9Lu
         zbzn4bW76i/M1/vi7c9R1trmyu9QlrVCCZPHIUuNIj2R8AaU3sDogTkVQ+iyqWDo0KqR
         kvnVPVNwzeWHRy9ki1OJirt9zFvJnODNff68SOluasc1yTsBcLJWPtUa6JW50sln3jTp
         pHCuB3+Swz4wrhq2aNDUB8/QSIF9TbOfKDyIEvGfz/W5GiDN0YnDDWF4tLfuo0cCATKx
         K89fR03q0Fw8ebFEERDnQEZ7Vz+cGtsy3LHoqo6WFI953sykOhpYu7d48Lqu7GgjUhVv
         J6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v5gqBDg935eg42BKTNthAwXGtYU9Tyqsel5+SHSd64Y=;
        fh=zdlmbKxiFRlMRzWpIN7CSnAsgSV+dL54zG/BSvsy8E4=;
        b=AJKeVK9PfVI7ee2QQhAp1WBnDu9pOoUCf+mPJlZTlHAyYRuRJepCEy1ptorxactC46
         aQr7UR96XNiV8qEqcRi/OyEERqWkQ9NNx3jfIGja/uhHRaTQYi95PZpzsaF7SpYf6R35
         MJ2pcnl4gCMbx+W2Iix3PzDVVRfhxsF7VFS5RB0LIMLF5G4BXpIG/j7zTJmFi1wvC7+z
         2OHbIS/ur2ic5Sora9Gl38M2t+wzD/MzpFgH4fthJGzxGYfRb8J46GspPNht5R+2ka58
         K3Iakcy/ImXO1xFTTG7vQSRZEQAkzLCk0r7nRRNr6egK1CRua6zMzjVrDaze6xvAx8OJ
         pE2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794561125; x=1795165925; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5gqBDg935eg42BKTNthAwXGtYU9Tyqsel5+SHSd64Y=;
        b=C96Chts3i/OWVIujpj1h/wNwru18MBGAUS4D3uZ03d3Pf4xUY68d92y6Op5UoH1whG
         SypeqM4VCje7buJA4HMnMQFIzENIxFLowPVhtCbKbEczJNeBvifMWgCfJmesMe2IeS5A
         dHOf0Sm6+TDds8CAypFgeb8q27ZwKS7fTj1Tcuf6ekg4DXdj3NL7vqihQHConPH9+HMx
         pVz6WIsmXxWWJyt4HQGzbmiI6QnN97cU2pdHQiUzSAI2yf08DmSW8mJJ2yrG77lFyMWn
         ToNPjunfkfVGOYqhakoYrhEbS5OzW9UO0jK1eZVxGEYc4fNFPrYnakZNMjcE4xqYmRGS
         apBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561125; x=1795165925;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v5gqBDg935eg42BKTNthAwXGtYU9Tyqsel5+SHSd64Y=;
        b=BkZ05zOcX3E7vWXEH52CmgB0n3ND1roMvUrYzwGJGXzky81EZaplhHiotiKvhXYBk5
         wGkDf64fYyLOg+m7akdR6kLyrWQBJlS7HfWp3jzLMjFTGT7LSFTokV1SirMdbb05Xc0b
         1Jc64UZE+hUQ6bu0vFfUvzwPUiQQOaw7OqOGb3QtU6j3GEKRiFj9Fi4FDYypSJWZpSYD
         /ELaYR2BJx/ynsEgCgJva+ZdVWzmqCrO/DF9XKPMtYq3gKlozJMGrH5nAaDgd3Ps/MfO
         iTuxOs9VNOLgEiD3joWNfIiVzRYia6UAI3bUm0e4X70fpeQ6LYcmqmUPM+2ioXjwtF8D
         vOqw==
X-Forwarded-Encrypted: i=1; AL+hErEL/+K6TowHERCI5NGQ69Cn4F/5lp2rOQ3WrLmPYSWE6393WpzmwkfKRkVPIfSXExIU1TE+Lfay1t9gOAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cxLWoyBbVQ6YWLLd1FUxRtpDQVg8ZyND5+Ban9/FiXdGTma9w
	1ux7Wa1BP7wcuxnUu7mLL/477JOpLBCyHDlYWE2Ue66eJn9gmXXgP7CTiEXH2XfgFgBcJBycN7l
	MfEO26lQ0nMxO8PjtheUelK3oMTR0ZuMudK2jEOA9
X-Gm-Gg: AYBFou1Uy3BzzlpiFcjjv97KsRDIlnnitQcxNM8jShopxXFO0jYkCdxSRc3xowBcSmH
	NX/5sn/qQbBg4ISG1vJv8bUGX0XPUSQy0o6OLrH4NZHm9bEs1+jCQrXJR0zB3BnX2tJuqDfNAGE
	T9FjpYVZxoAoZAzYAV5GozwN97mygQXyxnOMW5kAaEX8YcWfeaYIy3QhF45B38u9CJQhRHBuClE
	1VlIpciK4OcMbMuOPoqn/Pq42YaHe++ptY6FvQPeG764SWUB+rvKPLy7IXD/qtoYRT74DAaw9RM
	EfcslpoJj1Jo+4umBDp3BwbYgzkJB/DmBbFSiJZU8/vls+84rprZkNJseSZwxMJabvsUfZi0NMb
	tP68ZxH6fkDVkWHrvAbCWXuwSBVYfaorE5Gcn85DrwTayS3vwgOMnaFko/A5qnuqFAzDBaGPxnl
	OC1XJfrqc6zFyRdw==
X-Received: by 2002:a05:690c:660d:b0:8b0:76e5:ed0c with SMTP id
 00721157ae682-8b4aa2d58efmr11000507b3.39.1794561124153; Fri, 13 Nov 2026
 01:12:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793654853.git.bvanassche@acm.org> <avROwpyToVNLOolq@elver.google.com>
 <40be79da-af73-480e-b3e0-155173f3ad28@acm.org> <CANpmjNO51WYife2NhvS08n2En0WjP+XOzD9Mtjsj_Hc=_nw0Qw@mail.gmail.com>
 <c4f5a8b7-340f-4bba-b874-8956215a9c1b@acm.org>
In-Reply-To: <c4f5a8b7-340f-4bba-b874-8956215a9c1b@acm.org>
From: Marco Elver <elver@google.com>
Date: Fri, 13 Nov 2026 10:11:26 +0100
X-Gm-Features: AclHuK9MK14lLJwmRprZnLYXL-IMiledw_38A7zwKrVVFhtF5QoU8venT_hQpkg
Message-ID: <CANpmjNNM=qBJMvBkRu-WbhKA0hnkb_Bk8fyF9DTTsVmENDvZuQ@mail.gmail.com>
Subject: Re: [PATCH 00/14] Stop lockdep_assert_held*() from assuming lock ownership
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 22:05, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 11/11/26 11:14 AM, Marco Elver wrote:
> > The point was that the Coccinelle script could be used to add those
> > annotations tree-wide. We do not need to make the lockdep API worse,
> > if the legacy-code problem is solved another way.
>
> Coccinelle is way too slow to be run every time the kernel is built
> and hence is impractical for implementing compile-time checks. I'm
> not claiming that what I'm proposing is ideal but the approach I'm

Making global kernel APIs non-ideal has generally been rejected,
because it's a long-term global change and rolling it back is very
hard. I see the 2 paths as:

1. more checking and coverage *right now*; worse API *long-term*;
2. less checking and coverage *right now*; better API kept, and more
checking and coverage *long-term* through the Coccinelle script.

> proposing ensures that all lock context checking happens at build time
> and doesn't increase the build time noticeably.

I think it's as simple as running the Coccinelle script, applying the
__must_hold* annotations that fall out of it globally, and we're done.
In a few months we can run it again and see what else has appeared,
but we should converge to 99% functions properly annotated and can
move on.
