Received: from mail-oi2-f7.google.com (mail-oi2-f7.google.com [74.125.231.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC41B36215F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.199
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792116749; cv=pass; b=LZaxJtrxbX0rgMWLdaqTabM3bepqSMEjvPmw0EbyT0+eJpMWlAQguytFAlS95VPg+ZryDco63pcZxrPn/eLnSJRQdNQYrUk+a96EgT34HsQDjDvmUumJrjMSiSrpUdsKZQt+hRUPANaqcfHr9C1kOTbWlaH6kQLB9cqgTQlzI8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792116749; c=relaxed/simple;
	bh=NbuCv0ryWYiDtygGwn5WS0AeqhHnfIiKGVCd6AYwWkM=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHzlDVpHQLJ6h3cr2iiH0DSv1SHYDWCzqfJDfbjNEjj0dp2n4u5WhIFf71t+vo9MUMeFyCwf13mUFhpnGFwQkYWvdxnaOJvSdXRdUlUIWefcjfjkyWUfk3tpjj5W9YfciPxsJ/ADYn3pUCBMncZvwgrYnHOeiwN62e5xKWKpOig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1HXhSPb; arc=pass smtp.client-ip=74.125.231.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1HXhSPb"
Received: by mail-oi2-f7.google.com with SMTP id 5614622812f47-4b39374fab5so2335161b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792116746; cv=none;
        d=google.com; s=arc-20260327;
        b=QFdu8xU2CGERfrLvhQFHbz1qvRalX7/xqGs8B1fJn5QfOb1SV6NIYRz/oQUDnPRNqq
         hFHS5670vVdsxsbJp6N26iFgOcEs5i0CnkVdxGVLuxzyFmrmOo2a/HHEPSqzbp8aWv/m
         kLxvamgRysye9gFgJdaTeGXBQW/ZheEIGhocyWUEB+LZAhpCAynEQ3CpZcgjpL+C22zc
         J0+ip5cNF/0X9e1xO1+PW6n2WGitZhGh+UIpfJtZgUJVuEcs2KmPkLIb7FBoQn777xD5
         uyOGL2gVYGZ00PG3h7yhIQ5zpvW8qt0cdvi0M1LdD10yXpSIuptGwtcjnTiFgIccOu3N
         /7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=NbuCv0ryWYiDtygGwn5WS0AeqhHnfIiKGVCd6AYwWkM=;
        fh=Irk6cGESAtrn3uc+MFFTfDVKpb471PDe5dd7EFD40kY=;
        b=QPxhG8nWDnbWu9S9gTfAqg7OlPcStIqKUOGufIK07UQA0a9Q59gpaqmCqai9EL7ilG
         RbtQrWKFy9FvuxbH9Vp9vqJE4xa87qO+y2Oxyarx+YzVa3SsGYiXwodb5u50gqwOPwjf
         11qoZ+ubUwq3Xn/01Iac7hWzTiHLdJ8V7uWj6biKnooDZgGdqNbQdnyhXSMQ21/nyhMb
         ElWc1TQd98ZMkx86jnnSXZa40x8HgFv0bXEPhhGz2IrnuL4JY9s5cmaOOABxXwuIUqf7
         ZfzWh8ZvUuQWzEEDRg4ekQIYG2DxSE0sL4opccmcIzAhLEdbfAPORhfaSG7dC9B1cpdl
         sXhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792116746; x=1792721546; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbuCv0ryWYiDtygGwn5WS0AeqhHnfIiKGVCd6AYwWkM=;
        b=E1HXhSPbsJaxvv3sSydmVXhmyW1cSjSp91GPD52pP+F3+xJHGzgVUIopqrzYl8+3pr
         AIyKfxoBjAlas3L1juHMxKx57b8PXEidYcRql3RXKW/MNa9G1rVZ3IiWD697vTsimtnm
         f4QG3GM8UBHk6Z/jbDiDYflMRWLnFihW68u7hQ0mPda89IdGwQ95mxRu6frzn08H3Id7
         W440pMjaKWA4VFoMDbcrZQO9QtofVrSyq6PpUAMRrUy+qIAhkkIgdCVAoI1Uvm4HEJ4l
         R0oa9J9oxezX8vb3dLuRW7lIwD0KHCbrc+ms8WZWL7vu8KvV2bJU7ZIi4neLTcU/qCAn
         jdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792116746; x=1792721546;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NbuCv0ryWYiDtygGwn5WS0AeqhHnfIiKGVCd6AYwWkM=;
        b=xZe1RKE+JFwIxR6/JETBg0uD1iYTuWb6b3lCFfbNCQ1BSzISxQe9TpYX2azQSCjl4U
         Ht1q/Ag2q/GDfDYH+eOcmiJ9X0/09HgAy33MJrDnPZxOvPx2HR845RhfuJ2YvSxVJBnE
         5OQCSXr4dU2wtk0arke5UTbwCA41B3rGNWAnwItcvn457C3MsjGjF3OGAdCFqfWsmo7M
         au3XtIuBsw34Hk8jIgXsjmdRwCbdAIu4NKok3VZcVZDgfDvtH34sqQ7vkEcDuj1KMdwv
         8PpRtv4WUenIdA1peesIXmYCTY/zrzk9woxNLaHp2HXN/dXv6q0t3HAPR/wdMOSYdmib
         /i1A==
X-Forwarded-Encrypted: i=1; AKwUvByVIrGz/M+SzS2XG/kwE58UAUQruJuf+ExFhR7eB+3BIEKReWipn8VEeYKM7333ZLTxV3MpaJK0OZPEWfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYICSV6Nh6o4hfvwR3LR5b0P8Qds92Y2AYYCCS4mDJ9U7F6/YlNS
	zrRv5RFWp/EffZc1gQ2k/QYFRQjl3yCvQ+PRuOv7S/VNiqcM0kIb80xseaBgoe9GsfNT0L/sfTU
	kWfPWOs0YNdO7thNE5Wm9TB+6E/3Arg0=
X-Gm-Gg: AYBFou0c8N7NefMJPb0FeEYhNksJunlQVK4MS7vQ4Tro1NfXdm4XPHlQFld374GiSxm
	TUe5y0Eexa34y88W/21Tq7/mh1oFE8GlAh6/b7K4mQlGFQotQHe7mmdCbCqu9haVxfWmQQJ+DVg
	pZGmPXuevT6nelO1ryd5vwsQZcqP4k4WUVsfboPMQpb8yApTNTHi3sp6RT4Ei7xLpMni2bYNNJL
	7dg26i05zyoKMbgJKonIL9WQL7ddKPygHVoFNwCY7rF5rhXGULE6LLR6o5q3p7Cc0vPlm+MA6R7
	eFdMBoLOW+jiKnuymJqYKkEPAXCPoDxqMIcfCfr/jmlCjwuiDAlBXBpOoy1IE6LuRAvVdcCfO9g
	lZTN64+k=
X-Received: by 2002:a05:6808:c110:b0:4cb:26a3:a0dc with SMTP id
 5614622812f47-50c4c7a5193mr21039421b6e.20.1792116746586; Thu, 15 Oct 2026
 19:12:26 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 19:12:25 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 19:12:11 -0700
In-Reply-To: <20261016012622.114496-1-sj@kernel.org>
References: <CANOyQmHhCJEbHpHUZ2P0hui+We7wxWkEde-Vh4k2rRXWovRYrQ@mail.gmail.com>
 <20261016012622.114496-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aveline Noir <jm5905938@gmail.com>
Date: Thu, 15 Oct 2026 19:12:25 -0700
X-Gm-Features: AclHuK9Igmqn1XI8cem-R3h2TrMyNOe057Rl7_ZSLpCcuX45h7PRoh-LpcSd8JU
Message-ID: <CANOyQmHMRh6Sa=6N=hM8VzO0HRaFL0FxQB7An8=Y-X5GX36kmg@mail.gmail.com>
Subject: Re: [BUG] DAMON sysfs: failed update clears tried_regions snapshot
To: sj@kernel.org
Cc: akpm@linux-foundation.org, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi SJ,

> Please do not "top-post" [1].

Sorry about that. I'll avoid top-posting from now on : (

> You shared 4 bug reports in very short time. Three of those are
> from 32 bit.
> Could you disclose the purpose of the testing and how you are
> doing the testing, finding bugs, and reporting those?

I've been trying to understand DAMON in more depth with help from
an LLM, not deliberately hunting for bugs. It spotted a few possible
problems as we went through the code. After checking the code and
reproducing them in QEMU, I thought they were worth reporting.
If that wasn't the right way to go about it, please let me know :)

> Why would the tool tries to refresh the regions after the monitoring
> is stopped?

That's probably not something normal users would do. The test
deliberately called the update after monitoring stopped and found
that the failed request cleared the old snapshot. It looked
unexpected, so I reported it to ask whether that's intended.

> Is this an answer to my bisection question?

No, that wasn't a `git bisect` run. The suspect commit,
`66178e4ec30a`, came from code review. I tested it and its
parent `cce0b334c310` with the same setup. The parent kept
the snapshot, but the newer commit cleared it.

Thx for your time, and sorry if I've caused any trouble:(

Best,
Aveline
