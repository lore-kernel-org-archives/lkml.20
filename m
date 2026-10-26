Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029945;
	b=rgX3bK1WLJ/j+hbz1JLxWdVkEvfmCfteGMP+VT1YovGYisXoDoO8cnapUo++AcO4gB4Y
	 crsTIHvBNW0I5WEm0QeaHKINDs+ToyNJv3teNaJatDMIRPg0waCeY4eMTs8cbps95BgHZ
	 gfrVX774H+XPN67PsMJgEBWJlBN6J3VsIsfJq1dESK/i7CmwlCX9LKFwxRwwMnLB+7bO7
	 CqVPCnXkkmr7Jlgy+pJhbCybGtZ9PpiRO+V9uuuhmwt/9iXUbEMzQt7aFSEAs1xqOGHAP
	 9ub9QjzsHWf6g75eDpLAlHM+VHqmDH0H6ckmxFYe4j9S/3Nd+VoIFyX22Bx2zLjIY1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Date:Message-ID;
	bh=VaQMEbNe6iILjWkN+oLQ9JFAOPWDJQN9tfc/T2bNOlo=;
	b=WQVpdtwid+BSTTynt5jUUjz4SbjpdO9B+2WkQx3TfYzzsFRNZawq1IKiGEqfC5Z7GQAs
	 FYesjLl+A1fbnKvO9oTr3qM063YYvo1fRo1GSe5U2T+Jg3QuWR+8BD9gLREv792wa4UM3
	 Tzpi4umH1T6whuO7oLTQDXI6GEWdUotQQsQ/8gmwXwXrvWgehEM5VE6+nSRzRhT2QTXjA
	 7am0vrqIamc/CoXtAjurEweV3qTaEkv+JsC/EzDOrzKq+CHJ2ezWLQDCz9b0U+NH9Qit3
	 fxEsFnL+gTpudyYES6ClCNtWsmnvI4Wj9I87V+PPUT6aqb0dNVALZo+A+lWxsw60NVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ix0PLRmi;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0D6606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0D6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ix0PLRmi
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3ae08d3dd4fso1305695a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793029944; x=1793634744; darn=vger.kernel.org;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VaQMEbNe6iILjWkN+oLQ9JFAOPWDJQN9tfc/T2bNOlo=;
        b=Ix0PLRmilhzB5Xu6pIWjScPeGZ+L9r72dm0aA+xd1UGwroGHgBkEMykQUa0xdkXJsF
         ZAxysaSOMzn8ZI7anNojWi/UufVfh0gYwkLfCnUaGNLA/C8XHTC2LDbKIEUwoHEnkJnM
         xsLkaD+m4U0KBCcCYZ+yEdAAlsWUXbyQvjuZP6bioNjoMf+A8lmKoIvSaD4+CvZdrPCe
         nQjoF/R+xGmejigYy4Sa+bysdTQTqgJ61VxU1ry16qJsbQu0ri+QZRukFSgnxrotzprL
         DZnT+ho1ao3IgHohi8b4rCjGjMisi/dRqp5upZ04rrYb0aQlNuB9JK+KFvXDY20ErE0s
         /ysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029944; x=1793634744;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VaQMEbNe6iILjWkN+oLQ9JFAOPWDJQN9tfc/T2bNOlo=;
        b=WCd/eFq0VwYLGmJlceL1weZ/UxlogUv/D16bFZW8No11wjC4Jq4drxjZf6H0ZnXrnT
         JEGYB13ECi9STt7eQGfM9F70PhnHq6bao0vvzJd1p9Esy85+3kZW3NW3fs+YKHYndKgO
         7ZfoCjBStBL9VxE5zSZxjX7Xw2I+WmQ0YGFi9Z9nHnXn6vg5cFL7k3YDuTNPvi0rGlAo
         9/Q5UlNKgaIW75hfet92/q917yX/u1JKV8eXQ7occ7rkEJ3dFtvZOL24XjWAcmbm/kwA
         egddr158bLX7R2WmipPj/Aou2fWuKn9VUEvyu3OILGOexpBh1xkMKlGyeXo08VOXh6lL
         QyaA==
X-Forwarded-Encrypted: i=1; AKwUvBx714J9FK4aphmeYbcGneqliInn7XzsCaD/2wXiYfKuwhYhnLSIv7viGkbBDpXk03bk8RxzkbgWej5MNCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5LkgWpIWhxLC2KOW3OwO4kooKIRnGButd2BTheKHW9hr0gjAC
	rAJCmBRzIT8bRfgypjFydEiv16mdVZ8XKjuSMGuomgx5QM+cBTVjoJKD
X-Gm-Gg: AYBFou3BuWKWRTflxc1i+Qs39wMsler1+WLTVUgevv6UzkSInUYETc0MhyHrRqTsK61
	o1hxDjnH+T9vlbDZCQtOWzpJ37XU+N/k9vGGHZI5LYCPID9GSnPon5UwPjtoJ2u0h/qSSWPgqGj
	sFynO+3bylgMNaGa/c9gScqmxz9+ZLXM93RAY/tZHm6SInhaP69wnJ8wIy9Vdj8KW4syXIb0Xxi
	/YusIgM1bJ+DETlqu+cyYkPh9KupZ72S8kh7a7yXj4pyel9YqwrS0ZRj45V2lPuT/CO5hjbypvX
	03DLKoGEhE4QHd3Xc4lK99Pd8tw/T8vajBlxkxm0RDVwuuTT5h8P54vdrKmhy2OObJkNNiMJoMQ
	W9qQ8ZT0GGHeKcMDlPGUQmHmP2IYDJCsC6O0DLYlPaI3T611P9nmKGuO4P5ge8qQhxzaahdE7ge
	vzP64p131ddLgxM4gzP0Igkrz3A0Vmk16qW9HIv3Aeu5Lug0eMYVXXVGMsTyrb7Mk5hT+GFbugJ
	tc42K7RpM3/6AYCrj/TmTZjj7lx3k4cvI4X1ue+NaAK3f79JblxjyP2/puvU3YDi2Fmf6YOQRK2
	uiYHh2TDE4dDEi58mT58w7sY/IZLBb0SztbGdg/KVUsTCZkfUePvyQ==
X-Received: by 2002:a17:90b:55ce:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3adead57ccdmr6255798a91.10.1793029943804;
        Mon, 26 Oct 2026 08:52:23 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40427782sm48676a91.4.2026.10.26.08.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:52:23 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 damon@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] Docs/admin-guide/mm/damon/start: fix grammar
In-Reply-To: <20261026142927.149910-1-sj@kernel.org>
References: <b0d8d0ceda82e303262c0f61324fe8a84fd9f745.camel@mailbox.org>
 <20261026142927.149910-1-sj@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 27 Oct 2026 02:50:54 +1100
Message-ID: <179302985413.2.2084375678408090049.damon-docs-reply-01-start@gmail.com>

Hi SJ and Manuel,

On Mon, 26 Oct 2026 07:29:26 -0700, SJ Park wrote:

> My intention was saying DAMO is commanding DAMON to monitor the process.
> So I find Aveline's version is slightly better.

Agreed. Both "start" and "make" depend on "asks DAMO to", so I'd keep
"make" here.

> Looks good.  Unless Aveline objects or do this by themselves with
> revisioning, I will add this change when I apply this patch to
> damon/next.

Those two fixes look good to me too. Please include them when
applying, SJ. Thank you both for reviewing.

Thanks,
Aveline Noir
