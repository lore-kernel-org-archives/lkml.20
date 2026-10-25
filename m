Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792937240;
	b=HJXrXQ9u95ipP5ybkzB3jJzhXU96HMEZyNejn2zXixt7kK1v30WUjDkF9IsIvWCjXFcl
	 JSbxfZ2Dzr9TCkawTdeFBlnKvtkworsnRcr4zz2sp3fSYLd/+5o+ZkIn5xgC6sdWVQVMF
	 1KMCxlRsFFnD40Q9DhdeJMck1hlx48edw56AqybJSxXTBQtxbsdiTloH24Kv7MOzN6Jam
	 KSLir6x7ybwpdE+chH5riMtCr50I0/VGZj0dbasx9aaWmH7DqPv+XTem22BlwdjzM0X0d
	 l5FClz0AlRshtfYaUVF/0lQ6c8WOoyPf4Z6/lRuDf/e+tFlP9H3CdDtrsDcVb2xoLUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/WofT0yh3KpmHARnSgrS9AsbIBrE6V8uNY4po8M3XK0=;
	b=WSu96Bg5bdQvq0evqVALGeX9wxw/0M78aH1otIFbF+dMAaMySziyJ7HtATCfITv8PNFq
	 Ife8jImpcdNltKs7nQtet2Ta1z3zcjrOAZSZC8SgIZsGYIM3Qjjugj42NBBdq1Q0zyDSf
	 LJuSTxCHvHWoGyWEJpCzL3px9jxNYdk5TThrxdcu6PY4pEIEeRePv+Th6Vv7TkFjQ1Meo
	 RdKUy/CgB4MqO7MtIpzcGz1hp1LZ4bWXan+AMHFl6XF/SpuJ4kudwwKmvnWxVN/xe464U
	 NIMKw0dMmzLieSfg+QtWTuJSAtsAaAZP2n+5A+baGgEZMvSAKnx1IBmYf1u7VDOjHWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1575606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1575606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so1099127a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792937239; x=1793542039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WofT0yh3KpmHARnSgrS9AsbIBrE6V8uNY4po8M3XK0=;
        b=oqeADfQV64ONsHXyegylGm2pBiC9f1WfKiwdma+Qh6bk/8LF8EUBep9hjXbRXwUhXI
         md9BJk/WWbsdXUibnsyyggsFwTBOSuGquKwk1Aed5mBJ3FKGhmW2XOcCz0a4KNTtopOs
         atERMRjzhZxrLPhNWjaEl8UaI6IOIA14/333ftk1ZGml90HC5Y1oo66n2iPuacrpj/mE
         Px1wuvQa6HIHkEO1uWnNSbQb/JDwQIhKu/x7dwdnsf1M8LtJF9rioMlUWyPu58Xmcodn
         YRrD1ef8FxrDFpPePRxsTICuMZ56buZBQWmJNmSHjSVwQSlx4ofuSnDVTbxGk8+NHjnk
         4/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937239; x=1793542039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WofT0yh3KpmHARnSgrS9AsbIBrE6V8uNY4po8M3XK0=;
        b=PR4n1TTHnmKanE+Iee/+++a9LxrTYwnvSyoDnPhKBBZOUFTakgvmU4JWbgXCOeW0jE
         QANX/UvABuq+k9c4kLS+zZl0/mEEavbvCPXvOYNtf8nvSJEXgGdYmPyej+JW2gm0uV27
         bOvY+AhZlQDEWuu2w9jz9FhTvUYeJcjgNUiXfcCdGcYHjAUqPNXtQanES+HZdIEP3f9K
         /G+FcB83WWRq8RayqhabMZL7zl1CPTXsK8KHUftQ5c36A+5Oh6EoAu9mrr2TlB2EQNWM
         JvfvcOYyXYaSPvgJfmFh+YD3UxaWpAo6Tb+p0Pr2Nfx4qFZStrg+aPB8e8sPZrzFF6MP
         vUkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrIy/Pb1JwcT4pw9NY44d/VUz6Tjp/YH3R9Sx8WmHlN1dwcsjcrZExW446QxcnqipGP1tZ66bJZ6W/ZfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwKI+wG+3UsG6PlRpZ6T5dZidOM2lxAMYqyJasmpeqsUZ7lUZ8
	kqGqztoCKQVhoc3vTpr3WRv4wP0jWkdOsOnWcp8YzCCv9U+DA4xgx9/p
X-Gm-Gg: AYBFou13Ps1eWxagMqBzTMg5Ormhqiu1iTrKqye1MZScXYV010D+pZrdv1LiNmPnhcf
	prozMYqqbpMFSCkPX/SZ5milIIxzsyWy88jWyO9qwjipLW5w3OF/CC/+Q2ZDXI7rE3mdUjEXMRz
	A308m0iSllpgPHUx9sexf5vMWIPutO/N3lxNnXJe6OMgK/sHjeNPAGKzlQAZmaz/bF04olUt8dQ
	e6RfcWH8EUZ7xMpN3Hh7x8bfbTf704NyI+gG/jTsozt4yDONkvBkQ3iyc1is18Eawzxegse4xQA
	Fadi0st7b/8geTyslmiOi8fpC/XFhNiUKKynG/yzT3hz+3+6mYbJ5ioXoC4lRiHunbK8IYBqupe
	6j9PDGCRvg55tZEbA4Y1EptanlRILCf0hmkgdtzkboAHuqydJ8OBuyR20k+NlkR4IDyEh12qqTm
	9Rs8AvwsnckT2w7FEBg1cCnNYfdEA5qLelMIhP2wsEbcCSTjj5GhbU3jCFyX86g+yYELaPQET9a
	LwC33TowL15jkwBqv5Yve/hyyQJXVY2Rawj/DDHaTbcxp9pfpKCbnF93I+DztRz63uyKHlHGv3s
	+A==
X-Received: by 2002:a17:90b:3c41:b0:3ac:a203:e0a1 with SMTP id 98e67ed59e1d1-3adead03898mr3797971a91.37.1792937238796;
        Sun, 25 Oct 2026 07:07:18 -0700 (PDT)
Received: from gmail.com ([240e:469:849:35a9:20c:29ff:feb3:e631])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaddd45sm3776443a91.2.2026.10.25.07.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:07:17 -0700 (PDT)
From: Xue Boyang <fuchen.dust@gmail.com>
To: Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: Xue Boyang <fuchen.dust@gmail.com>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Phil Sutter" <phil@nwl.cc>
Subject: Re: [PATCH nf] netfilter: ipset: fix double free on kernel-side delete during resize
Date: Sun, 25 Oct 2026 09:07:06 -0500
Message-ID: <20261025090609.v2reply.4093.fuchen.dust@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <8b1c4c41-d371-1901-0f85-f3d0a1dfd033@blackhole.kfki.hu>
References: <20261012163353.4093-1-fuchen.dust@gmail.com> <8b1c4c41-d371-1901-0f85-f3d0a1dfd033@blackhole.kfki.hu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jozsef,

thanks for looking at the patch!

> Thank you for your patch! Could you address the issues sashiko raised at
> https://sashiko.dev/#/patchset/20261012163353.4093-1-fuchen.dust%40gmail.com
> about it?

Sure - v2 follows right after this mail, quoting the findings and what I
did about each of them:

> Can a memory allocation failure bypass the backlog cleanup block and leak
> the deferred operations? [Medium]

The exact path claimed cannot: every early exit is taken before the table
is marked resizing, so the backlog is still empty there. The leak is real
one retry later though: on -EAGAIN the cleanup path jumps to the retry
before draining the backlog, and an early failure of the next attempt
(its own allocation failures are again before the mark) strands it - and
with the deferred delete being the only record of the delete, the
elements would stay in the set while the packet path believes them
deleted. v2 drains the backlog on all failure exits, replaying it
against the original table.

> Does the backlog replay ordering during resize incorrectly resurrect
> deleted elements? [High]

Yes, it does - the list_add() prepend of deferred deletes predates this
patch. Since the fix now relies on the backlog order, v2 queues the
deferred deletes with list_add_tail() as well, so the whole backlog
replays in arrival order, on the failure paths too.

> Does this skip clear_bit(i, n->used) and leave the element fully active
> in the original table? If a subsequent ADD for the same element occurs
> before the resize completes, will mtype_add() incorrectly see the
> element as still existing, return -IPSET_ERR_EXIST, and fail to queue
> its own operation to the backlog? [High]

Exactly, and fixed the other way around: clearing the used bit is not an
option, the extension of an element the resize copy loop has not reached
yet would never be freed (the old table is destroyed with
ext_destroy=false to protect the extensions shared with the copied
elements). v2 defers the kernel-side add of an element still present in
the current table instead, so the replay applies the del and the add in
arrival order and the add is no longer lost.

The remaining Medium concern (leak of the extensions of elements which
expired during the resize) is preexisting and not touched by v2 - I can
look at it separately. The five dismissed concerns look like false
positives to me, e.g. the lockless orig->ad walk after the table swap is
serialized by the synchronize_rcu().

Also included in v2: the deferred delete now reports -ENOMEM when its
backlog entry cannot be allocated, instead of returning success.

v2 was tested with the same reproducer as v1 (no double free in repeated
runs) plus a new ordering regression test: packet-path del-then-add
pairs race continuous resizes and the set membership is checked right
after a resize completes, with the traffic source frozen so nothing can
paper over the outcome. On v1 the element deleted and re-added during
the window comes out missing (the lost add); an instrumented v1 kernel
confirmed a single ~80ms resize window deferring 253 packet-path
deletes and dropping the corresponding adds with -EEXIST, replaying the
deletes in LIFO order. On v2 the element is present in every sampled
resize across repeated runs.

Best regards,
Xue Boyang
