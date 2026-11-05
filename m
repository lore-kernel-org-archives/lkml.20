Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874776;
	b=EM3GdMV2AOcUN6iUxtMXzJrdgCSdjf38Q4XKJ52Ab0pUUki6lxjP9ydyJT7zzO2vwJJU
	 XQnaAxCaho4zwThfRKcZPeknereFIDW6ZC6zNqHi0ZY9L/s/hiVG5Mo9O0hYGQy7+gxp4
	 8rWp2UmltATrP+uWIAbLH0s65ziESB1fgGvwUtnfph1+6OOygimbBJrG2h4EPaF7CtebC
	 MiDdZP6mc3zCpOHKsUktIThxAP2Sy3U90gMCx3zzsLN7MnwLrI8o2gV5e7Jhd5HCXoLck
	 fPIqJ1XogMugF9xZHGNs5Ns0Es+JN1eOX5n0UZr97sgEj53mlX2YQN2YGv2a4X5cYYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874776;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lR+NEFZOClI/Q7syF7pUxOZkq4s0tLc9i8788RwMvYM=;
	b=ERtwrUfH38Ibdg7fIVGjWcvo6pMlh/PQ2in4lt6T5nckasNmzfSeeqHAGM6OI+Lh32df
	 QninD9ilwcLJFxRcuC9bZkOzrsp9j4yUNHyHkT1K7kf8N01ad0dQynkEUJyFFYgwWs8uv
	 5Xn89gTIDBvs3bv2AGcVL2rfwiGfZ3hTqh0UffI+21BIjp0YOHuhrpQCFIxPCuFNsIPzY
	 cwSaWybBSxVNEr8UTyn2E54bIBXDq/rDVCxDIwtxzwmO4B0HrskTzbmiKV2QyFc/dA4lC
	 fhQFfbF2uJ3ipE4YqEzec1aKMFK87/4FlsSoyqUESunCgUuwQGhBAhurNYJqUTVsPGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ED0606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8ED0606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8ab43af5e97so6008277b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874775; x=1794479575;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lR+NEFZOClI/Q7syF7pUxOZkq4s0tLc9i8788RwMvYM=;
        b=2Jv9xuIt+3Exqs0rYRLfAeRRAnPvta+KoL891JLFIgBtjY/Yh8aRJABddI6fscI31s
         493x5QpyzVKijhBFL1sXR6nv3M5vl5ZRtYFTV+mG7e8OHhGjpP+AjKH9EYmYzYO6cF6D
         Y9WyIxw/Ns4HobcfuRuNPz63ZRuF5a9ZMSykV/kroy175YNm14C8GElxPLrKSIsQ0KWv
         Gzg10Ej/rTYjWD02JQksiUpblAtZpKn/cJRpuZs7gp3Xwnw9co3rAUCctBxPKqXRQXth
         im8XyuCac9coPfJlFn92fZcvqyofgWOZ3RaJw9eyzT+l+0fBxyRbu8f+9v0c/Xs2+Hy1
         fQgA==
X-Forwarded-Encrypted: i=1; AKwUvBy6zXWsKy0fulUqxJwK1vdUdhEry0SD2b475cCKsM3eO1dP27cJin/gzUITSRf7jHdlr0/kKb9QfhSd2ZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DauOyTDcewYWI3vkYXcb5V2tBrjCuvMcbbR8uqf6b04ZE3rQU
	0U4S9QfS6sO2JUzOoDdAPms02KPU64LCCYB12bMTeriAWUIp/FlvA4K/
X-Gm-Gg: AYBFou1YoYpqs8BiI6/LgIJeIy0S9xaTiiiS9a3+q9QKHt52IOw3DUG3yIrKHqY77zJ
	D2220jOSc54iIyLodOLpKXrn90UjNVFQTd0Cb8h5Ok0lvCCRB1HtKPeQxVOtpQ/J4ysnL6ZMTMr
	pDUtEi9gbclOuJIwy9A+Dux6H+FlvyMu7nE+x68/F5LcrvXyK9arqIoXUKjTkyJkq9wZRDE09Hm
	QhA0scCz8cNf8CSV3uqs1Bw+UI2MJgDy3IzYpVlDpmaesVP8AWRaJeUmkPJmk9Sv8JuTB48HlgC
	KVNBUPpUH8mTI9NNc68HPnr6gBKLD+IB3BkAWM5vb+Yokyf6kjGqEfNv1NqJKmnUcu5wMX/D+VR
	XhL9BmFLuAB+9N3bhKkNzfmJ/UqM1C+eZouOMoai8q954wXvkdVp761ZyoCS8gVUhYrYCyZA45F
	thO7ccQcTM6LlPmEWFIzycD4J7vrNyZnirkTjO+xIAIXK9bC2ISTe/KF0hGsVVgHnugsnTwUx6v
	+meBrL59pXA02e08pRUiivBuEJNHM16BQDnCVjN+RIH8Pc2lKlzVi9+QceE7WGAZl74Zj180PRj
	J39Z6fOBPUxNvLIzFys=
X-Received: by 2002:a05:690c:3183:b0:8b3:310:244a with SMTP id 00721157ae682-8b328db924dmr11659227b3.9.1793874774842;
        Thu, 05 Nov 2026 02:32:54 -0800 (PST)
Received: from gmail.com ([2a03:2880:24ff:59::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309712e25sm37003777b3.2.2026.11.05.02.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:32:54 -0800 (PST)
Date: Thu, 5 Nov 2026 02:32:51 -0800
From: Breno Leitao <leitao@debian.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Steven Rostedt <srostedt@redhat.com>, kernel-team@meta.com, stable@vger.kernel.org
Subject: Re: [PATCH] ring-buffer: Handle a reader taking the new head in
 rb_handle_head_page()
Message-ID: <auxXYbBvbupetclu@gmail.com>
References: <20261102-ring-buffer-head-moved-v1-1-165973790be4@debian.org>
 <auxJP5fkEQOkvicE@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auxJP5fkEQOkvicE@google.com>

On Thu, Nov 05, 2026 at 09:15:43AM +0000, Vincent Donnefort wrote:
> On Mon, Nov 02, 2026 at 06:30:11AM -0800, Breno Leitao wrote:
> > I am occasionally seeing the following  KASAN warning when running
> 
> a KASAN warning?

Sorry. It is a regular WARN from RB_WARN_ON(), on a kernel that happened
to have KASAN enabled. I will fix the wording.

> > I've understood that rb_handle_head_page() moves the head page forward
> 
> Drop "I've understood". 

Ack!

> Besides, I am not sure about returning 1. If the nested writer interrupts
> between rb_head_page_set_head() and rb_head_page_set_normal(), it can also get
> RB_PAGE_MOVED and skipping rb_tail_page_update() means the retry will observe
> the old tail.
> 
> All in all, I wonder if it shouldn't simply be: 
> 
>   case RB_PAGE_MOVED:
>      break;
> 

Good point, that handles both writers. The outer one falls through to
the existing UPDATE clear, and rb_tail_page_update() finds the tail
already moved by the interrupt, as when the cmpxchg returns HEAD. The
nested one moves the tail to next_page, which is right because the outer
writer already did the accounting for that page. And the duplication
goes away.

> Additionally, the comment with "Valid returns" must be amended.

Will do.

My reproducer used a two-page buffer, where this retry is harmless, so
I will re-test v2 with a bigger buffer before sending it.

Thanks for the review,
--breno
