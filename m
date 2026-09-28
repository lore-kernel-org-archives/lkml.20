Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0CF4EC658
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613004; cv=none; b=TGJr+TKhB5krYfyD6q+kUFOzcAqM8RP+rxz6YtcIoL+OiaJE0is3xZDl6chz/6RP9LerOXg1R/8mSezUtkvCGcYDqMyKRVKmYS1B7m8Nyk255lx4Fw6fVdXz0UIPy6ohIfN2d7pq8a/tnfYPO/9ibcJ4X47EFes5DeG+NiOBhSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613004; c=relaxed/simple;
	bh=oCY95uwHxELLJ64Ab+wCn+UQVYno8VUrLtnEf4Z2jzo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uG1kH96IkHaqUrvuMzB6pB8OnJHIYge9YoXnL+LyNyjngInQ5TRdkpf837PEhTcskEpxZ+5/YNIIJKZF7Xr7iBUTlIxi+tJBKJkcC27qUWgOKwbqMwXqTBooiZT2FIvYgByWKoL7+7ff6gB32QjHIhjtj/mLRelanewcy5qyITI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BmV4LUz2; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BmV4LUz2"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so4643371a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790613002; x=1791217802; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oIVAQYUB8UbZQVC7AqnOK7Iqj3kO0cakRNqeZlr1xM=;
        b=BmV4LUz2pObJ78FA5jgzNNoFXyEcAijB3aaXwU3SAsrbXpnNCNoXZ0WaQn6Yn+BY1G
         AxBrkV1uYFBDJIAjt/FsW+EOpaDgdtCLxSMA33V665y+HHldP6pwg+Yun+EdQcIfGD0x
         DEHx7cUi7y1tbiEfwLkuaW7ji0LhpW1Q0f+5z3a+dX7fAkagRnmQVj20BfIINi3pCXj9
         1hgZ2MUMgTDgtZiCv1M8Fvdxy7Udx4uuFDIETt2yHm4X6ir/HDjMRZRuxMhBoRAA+MIN
         ylGhT/GdhxSHNvUzfbdHjR6kUK/B0upvBtpAJwMxgzLMbtJuQBknboZ0/hdigMeE2tYJ
         WA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613002; x=1791217802;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oIVAQYUB8UbZQVC7AqnOK7Iqj3kO0cakRNqeZlr1xM=;
        b=NoYYD2kIKFRnNUrH5pNVJdh1s3tM61pdr/Y6Jcmq7ceKnq+19yCGEHv1EiqT5hr9N6
         RzyCYJtXyYEbpMzMe+4o15XdWr7q4lvstNzyh7pkzg/PRBL+wUknp9XajOGwycyEHOQs
         PV4T+lcnz0amAshEQo673rZUf5b2a4ef0BbJjNKNcShTyaFlKOr2LjJL57RowQKXC2ku
         1YF/RslKwP6+SZu+ek8ej4DtbhmJPl8hCb9kggJxUCVWu5GmbFELthUd/CuEMS2ToVzB
         FYUS8zjALmmuUhXmt+yQ8ubB/2GtJ8rYnAcsYmXgk8La4Mc5EH32vUqB3jJ+1ZchFbMQ
         Rpvw==
X-Forwarded-Encrypted: i=1; AKwUvBwObqYEpyApxwdq4ZAXSHFgSoIvns0Mm9SjLnUekIRD3ik3BLYj8SkF6ACHi6sTyv7ItJ35RG6/dRlvvoI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvtrzWbXwbzPnXEmHUl+uvi428fwAS+SyYUh1xSNgrpsIP13lZ
	j+5fy/EuCrtqNWZmzVZ0coNUZUGzh7Y+7KWyzQ4qtZtMHbaEeStDm2ZqXoYhUUsB/RQXq/iYMI9
	SXhZDEQ==
X-Received: from pjbkr7.prod.google.com ([2002:a17:90b:4907:b0:3a0:8124:2580])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c49:b0:3a0:7d60:450d
 with SMTP id 98e67ed59e1d1-3a098feb5d1mr12910441a91.43.1790613001553; Mon, 28
 Sep 2026 09:30:01 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:30:00 -0700
In-Reply-To: <shvokigIdaYF83vU8rik51QxCt-IWzK_vNIV72voXL13vdzqLnE4pdpMT-le6GLd7K8VWiWRTn7lpzJDzLBGYxPIhgdbr5MfPwnUY9lc1ME=@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260915175335.138547-1-davimaba.v@proton.me> <179028303710.1997669.4762091811625597120.b4-ty@b4>
 <shvokigIdaYF83vU8rik51QxCt-IWzK_vNIV72voXL13vdzqLnE4pdpMT-le6GLd7K8VWiWRTn7lpzJDzLBGYxPIhgdbr5MfPwnUY9lc1ME=@proton.me>
Message-ID: <arqWCDEKxYsi34z0@google.com>
Subject: Re: [PATCH v4 0/3] KVM: Fix and account mem_attr_array reservations
 abandoned on ENOMEM
From: Sean Christopherson <seanjc@google.com>
To: David Ballesteros <davimaba.v@proton.me>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sun, Sep 27, 2026, David Ballesteros wrote:
> 
> Haha, I didn't even realize using AI would make me sound like a bot
> until now...
> 
> Jokes aside, I truly appreciate your kindness. I have to admit that even
> though I tried to review everything as thoroughly as possible, this was my
> very first patch submission, which is why I found it a bit tricky to follow
> all the conventions (though that's no excuse). 

No worries, contributing upstream is definitely a gauntlet run.  Calling it "a
bit tricky" is being *very* generous.

> I definitely leaned too heavily on AI for the write-up. With that said, I
> understand the extra work it causes and I am truly sorry. If there's a next
> time,

Hopefully there is a next time, but selfishly, I hope the next wave of security
fixes is to a different subsystem. :-D

> I'll write it myself -- AI at most for a rough first pass, but the
> words that reach the list in general will be mine. Best regards, and thanks
> for the guidance and patience.

In the future, please also wait a reasonable amount of time between versions,
e.g. 1-2 business days for relatively urgent fixes, more for non-urgent things
(though with so many of the guidelines, there are exceptions; use common sense).

With Sashiko and syzbot giving such quick feedback, it's tempting and all too
easy to blast versions back-to-back(-to-back), but that's often counter-productive.
E.g. there's almost no opportunity for a human to step in and provide guidance
(e.g. to point out the existing on-list fixes), the sheer volume of mail adds to
the load of maintainers, and if we overload the bots, then we risk losing some
of that early/prompt feedback.

Thanks again!
