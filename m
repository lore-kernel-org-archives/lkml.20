Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792841685;
	b=P4qtCYy4JmSOPdezyu4RQb3bPpsiUGnCrh2l+cEf5DM0iatWVUpLwaTZQWY8mLGx8OMz
	 c2nNDUin4x8UXamZzcUvGZ+H4/u7D1GAqts8YFcdsg0gjMiUhkFbZUprrUcYXvImiQUvE
	 l92/WjHmZM5qQYP9lqxPlSkl/DwDyBByfEiQAgOP1c4S/GJuP4hMUCZhfC6x6JsAPWQim
	 d6+9UGFlUAB/AtYhxvTUaY+4mhjnmAJnCldsXD7H9X7UlobJed+Zdwjqm68pJno41mGLh
	 wxcmSPMnF/y1f7b7j+aVp338ymoCzb+BQQ665MRj6aBhgJUuwDud0xSJlh2iuAaptRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792841685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=K1zCcAMhGvhxM+qOw07Udi1L+XA5YYnybA3CyiqDJKA=;
	b=NTJ//SqvumFc54SVUGn6iRHguVqDs0otjrOFTYKyJJ64YpWdf30lMD1gy3Bnmx43nKMT
	 Bx+oJbqkm0GPAruFYVVf5tIxaqYO8myRtuuJ7dNuLQSa8cZzbqIbJz6Odwbs8sU9fhn1G
	 MtjVHxVRl4GIg2wj+yZ1oWb4ukfn9yDcAwekb3Q+x1rskmSK3M/AjjQzI4spyeBP+AKJ7
	 bCV1OZsXKghDQ95F0aqasv+yOZr0BpdQEZNK+7rpze0P3AOQAJqsIePafSKGBiilhZXng
	 HZt1rSzR8sSDMydiwpEoMaFIy7DL1if6NUDWnPfm3T1Uj7/sHcOkw3q6MksnlwyHgaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20251104.gappssmtp.com header.i=@layalina-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rc9mMNg7;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E589606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E589606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20251104.gappssmtp.com header.i=@layalina-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rc9mMNg7
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b042c0759so1065377f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20251104.gappssmtp.com; s=20251104; t=1792841683; x=1793446483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K1zCcAMhGvhxM+qOw07Udi1L+XA5YYnybA3CyiqDJKA=;
        b=rc9mMNg7TJsFoSyVEJUG/CyA+XRIYXmCUowbcdmBORswsRcVJEz5SSNsEj/nCqKG4F
         51VWU0rLhkRt8++wXaLLT/GsWNzvXj7HGKuriJB1pBGN47UQ4FJ7i1SNoME/jZzqntPS
         wI1hwRH7v2Mo5L9MpNaUmoTXtTY8WX7covNzyQA2F7XhIZIkGIHoH4ZEYPHt2+84zZYU
         jXTmQKkMahsYcqXkrXmByYKs1v7xC3Ex2oL6FQQtr9ec6BJwwR1SQFh9+pOberYwhDGQ
         t1IWwenislGfzks7Ydu36wWfCShRUUFleMEA+VFbAKBShOGh3tm3ctuWe7InbkthDw9/
         gO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792841683; x=1793446483;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K1zCcAMhGvhxM+qOw07Udi1L+XA5YYnybA3CyiqDJKA=;
        b=1a0d/i3OFuWxA7aQ9dY3K9hoIYwjp26gc+Idv6DAfTGFilPVYuQ5wnEJZ/nEgj/0Lu
         mKwRneqfn7RArvmyy8mq8s7VYwQmx5HUuNJdi9VCEsLz1t4DdYd59ed0aDh4l7fR8/xx
         zwLiiJrbNZ+qnXIyxv809D0dl69PnbEqj1Q2UOE60VJKbS3ES6LXBsDZfLuhBoJsztPu
         tQoKzAVvnRwaPyCywVcF9ze1AX1+OMXgYI9gMwtZ5j1WXfuvgSkZuPLA8ZfLZ/mEKW91
         YZggz4QnZ80tExirirc5EBa4rtGt+ZUi16B33FOfGvPH3iA1/p3/6YdANrKjAx3fS0u+
         ZzKA==
X-Forwarded-Encrypted: i=1; AKwUvBxjqLcC9X4XLYGyg4F6C3sFsqoJ1hNVbzpiK8L9XAxgB53haJZeV8Iv0bNfJ5Tw9NYmr84XxFBIv+ALIo4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIETYEkJrSQLOIURQmwwBGSaOo16DE6a8hxVWC3gKPjfYLwy93p
	bisaqlqg+bE9960O9j5IZFrjV2BYaaDoUSfr8IYyL5EjhW8Yx6E3DX8iD4kNv90gPXE=
X-Gm-Gg: AYBFou2HK+HhGwYg5VklbOxkWNAk1zeTvVeMUvI2WjGqxCx1jK527ZqEU2wGLpypdDq
	C+MxkaoHRFTZttybNCbXNKSaghNUJd7D6BAKOEmipV71H9YkkwiAf2gvFDPjrICvR7bC/IevHiZ
	Bwgn/60E8Nqvn8kCFQU93C3nizE20tHyd7uBKtvhsrVaAuxA0cW/LATfVuvHZpDfaP2yF0bqQIG
	4Xk/LwADKOEcfeud5VOS+1L8MsDeLMRdoWGz88ybkE1BFMs5c7O1jGsTTQTDqhGEyKyzFqxFW/5
	w9LQlI7mFI8eLltvNrq4l+mDiejoSnOIbxVsypuO5TfiODsVmn6U+H1gCUM5pkC/YdSTUg/44bv
	0B0VZL5VAJ93hH5+LMGAFY9YqXqCDHNqgo0YBryiRgguKODzEg1ReVYYtJHBug6cwgIQMhs6Fjq
	TkBnV3xJTtyxCxDW4q0ry8OqZ4NeikV3GVQYIhmQgXkXeYJtZ4ejxwHV/UJ7Vh0wbSg0qzZ+oNE
	mhzq2YIzsvG7rMamv2DHXKBAaqtPM0x/+lmQv5vgp9kqPKxBV3ZmMGw3PtIneJffZ87pwp/MWq/
	Vxx4G5Yg/Jy8Sa506ii2v9Oisb3FouYMwVeGGCUM
X-Received: by 2002:a5d:5d10:0:b0:48e:1c72:abc with SMTP id ffacd0b85a97d-48e3eb9890amr2555328f8f.35.1792841683180;
        Sat, 24 Oct 2026 04:34:43 -0700 (PDT)
Received: from [192.168.0.219] (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f248sm3795461f8f.6.2026.10.24.04.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 04:34:42 -0700 (PDT)
Message-ID: <fca73fed-da43-485e-8a7c-1ddef9515f16@layalina.io>
Date: Sat, 24 Oct 2026 12:34:41 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Uclamp races due to non-atomic static_branch_likely updates
To: Christian Loehle <christian.loehle@arm.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Qais Yousef <qyousef@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Hongyan Xia <hongyan.xia2@arm.com>, Ingo Molnar <mingo@kernel.org>,
 Wei Wang <wvw@google.com>, Patrick Bellasi <patrick.bellasi@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>
References: <CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com>
 <20261020152933.16989549@gandalf.local.home>
 <20261021113806.GE2823843@noisy.programming.kicks-ass.net>
 <20261021132058.kxzyumgxzir4jzi2@airbuntu>
 <20261021132956.GO2823843@noisy.programming.kicks-ass.net>
 <20261021140222.tazz6aw4j5pvqwox@airbuntu>
 <005ed941-2737-413c-8436-a9de227d01ca@arm.com>
Content-Language: en-US
From: Qais Yousef <qyousef@layalina.io>
In-Reply-To: <005ed941-2737-413c-8436-a9de227d01ca@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 14:18, Christian Loehle wrote:

> So I guess the clear-when-entering-idle taper is sufficient for UCLAMP_MIN.
> UCLAMP_MAX (where on a sufficiently low setting we may just never have that
> idle entry to clear) we expect to be fine because it's max-aggregated, i.e.
> a second task would let us escape the low stale UCLAMP_MAX on the rq?

I am not sure I got you. We should eventually go to idle and reset the 
settings. But you made me realize the unconditional reset could break 
the saved uclamp max at idle :-/ I could either unconditionally set both 
uclamp_{min, max} to 0, or just have some conditions to do_once when 
uclamp_is_used(). I prefer setting to 0, but this is a change in behavior.

> I guess we could reevaluate the static branch at every tick too if we really
> care?

It seems you are worried about the temporary corrupt state after boot 
(first uclamp use more precisely) where there's no idle time, right? I 
think we can live with that.



